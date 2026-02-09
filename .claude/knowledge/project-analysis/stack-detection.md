# Stack Detection

## Overview

Detect the user's technology stack by scanning project files. No need to ask - just look.

## Detection Order

1. **Framework** - What's the main framework?
2. **Database** - Where is data stored?
3. **Auth** - How do users authenticate?
4. **Payments** - How do they charge?
5. **Analytics** - How do they track?
6. **Hosting** - Where is it deployed?

## Framework Detection

### Next.js
```bash
# Check for Next.js
grep -q '"next"' package.json && echo "nextjs"

# Indicators:
# - package.json has "next" dependency
# - next.config.js or next.config.ts exists
# - app/ or pages/ directory
```

### React (non-Next)
```bash
# React without Next.js
grep -q '"react"' package.json && ! grep -q '"next"' package.json && echo "react"
```

### Vue/Nuxt
```bash
grep -q '"nuxt"' package.json && echo "nuxt"
grep -q '"vue"' package.json && echo "vue"
```

### Python/Django/Flask
```bash
[ -f requirements.txt ] && grep -q "django\|flask\|fastapi" requirements.txt
```

## Database Detection

### Firebase/Firestore

**Files to check:**
```bash
ls firebase.json 2>/dev/null           # Firebase config
ls .firebaserc 2>/dev/null             # Firebase project link
grep -r "firebase" package.json        # Firebase SDK
grep -r "initializeApp" src/           # Firebase initialization
```

**Strong indicators:**
- `firebase.json` exists
- `@firebase/firestore` or `firebase` in package.json
- `NEXT_PUBLIC_FIREBASE_*` env vars

**Schema discovery:** See `../stack-adapters/firebase/schema.md`

### Supabase

**Files to check:**
```bash
ls supabase/ 2>/dev/null               # Supabase folder
ls supabase/config.toml 2>/dev/null    # Supabase config
grep -r "@supabase" package.json       # Supabase SDK
ls supabase/migrations/*.sql 2>/dev/null  # Migrations
```

**Strong indicators:**
- `supabase/` directory exists
- `@supabase/supabase-js` in package.json
- `NEXT_PUBLIC_SUPABASE_URL` env var
- SQL migrations in `supabase/migrations/`

**Schema discovery:** Parse `supabase/migrations/*.sql`

### Prisma (any SQL database)

**Files to check:**
```bash
ls prisma/schema.prisma 2>/dev/null    # Prisma schema
grep -r "prisma" package.json          # Prisma client
```

**Strong indicators:**
- `prisma/schema.prisma` exists
- `@prisma/client` in package.json

**Schema discovery:** Parse `prisma/schema.prisma`

### MongoDB

**Files to check:**
```bash
grep -r "mongodb\|mongoose" package.json
```

**Strong indicators:**
- `mongodb` or `mongoose` in package.json
- `MONGODB_URI` env var

### Drizzle

**Files to check:**
```bash
ls drizzle.config.ts 2>/dev/null
grep -r "drizzle-orm" package.json
ls src/db/schema.ts 2>/dev/null
```

### Plain PostgreSQL/MySQL

**Files to check:**
```bash
grep -r "pg\|mysql2\|postgres" package.json
ls *.sql 2>/dev/null
```

## Auth Detection

### Firebase Auth
```bash
grep -r "firebase/auth\|getAuth\|signInWith" src/
```

### Supabase Auth
```bash
grep -r "supabase.auth\|createClient" src/
ls supabase/migrations/*auth*.sql 2>/dev/null
```

### NextAuth / Auth.js
```bash
grep -r "next-auth\|@auth" package.json
ls src/app/api/auth/ 2>/dev/null
ls pages/api/auth/ 2>/dev/null
```

### Clerk
```bash
grep -r "@clerk" package.json
grep -r "CLERK_" .env* 2>/dev/null
```

### Custom / Roll-your-own
```bash
grep -r "jwt\|jsonwebtoken\|bcrypt" package.json
```

## Payments Detection

### Stripe
```bash
grep -r "stripe" package.json
grep -r "STRIPE_" .env* 2>/dev/null
ls src/app/api/webhook/stripe/ 2>/dev/null
```

### Paddle
```bash
grep -r "paddle\|@paddle" package.json
```

### LemonSqueezy
```bash
grep -r "lemonsqueezy" package.json
```

## Analytics Detection

### PostHog
```bash
grep -r "posthog" package.json
grep -r "POSTHOG_" .env* 2>/dev/null
```

### Mixpanel
```bash
grep -r "mixpanel" package.json
```

### Amplitude
```bash
grep -r "amplitude" package.json
```

### Google Analytics
```bash
grep -r "gtag\|GA_\|analytics" src/
```

## Hosting Detection

### Vercel
```bash
ls vercel.json 2>/dev/null
ls .vercel/ 2>/dev/null
```

### Netlify
```bash
ls netlify.toml 2>/dev/null
```

### Railway
```bash
ls railway.json 2>/dev/null
grep -r "RAILWAY_" .env* 2>/dev/null
```

### Firebase Hosting
```bash
grep -r '"hosting"' firebase.json 2>/dev/null
```

## Detection Script Template

```bash
#!/bin/bash
# Quick stack detection

STACK="{}"

# Framework
if grep -q '"next"' package.json 2>/dev/null; then
  STACK=$(echo $STACK | jq '.framework = "nextjs"')
fi

# Database
if [ -d "supabase" ]; then
  STACK=$(echo $STACK | jq '.database = {"type": "supabase", "subtype": "postgres"}')
elif [ -f "firebase.json" ]; then
  STACK=$(echo $STACK | jq '.database = {"type": "firebase", "subtype": "firestore"}')
elif [ -f "prisma/schema.prisma" ]; then
  STACK=$(echo $STACK | jq '.database = {"type": "prisma"}')
fi

# Auth
if grep -q "supabase" package.json 2>/dev/null && [ -d "supabase" ]; then
  STACK=$(echo $STACK | jq '.auth = "supabase-auth"')
elif [ -f "firebase.json" ]; then
  STACK=$(echo $STACK | jq '.auth = "firebase-auth"')
elif grep -q "next-auth" package.json 2>/dev/null; then
  STACK=$(echo $STACK | jq '.auth = "nextauth"')
fi

# Payments
if grep -q "stripe" package.json 2>/dev/null; then
  STACK=$(echo $STACK | jq '.payments = "stripe"')
fi

echo $STACK | jq .
```

## Confidence Levels

When detecting, assign confidence:

| Confidence | Meaning | Example |
|------------|---------|---------|
| **High** | Config file exists | `firebase.json` present |
| **Medium** | Package installed | `firebase` in package.json |
| **Low** | Code patterns | `initializeApp` in source |

Always confirm with user if confidence is Medium or Low:

```
I detected:
├── Database: Firebase/Firestore (high confidence - firebase.json found)
├── Auth: Firebase Auth (medium confidence - package installed)
└── Payments: Not detected

Is this correct? Anything I missed?
```

## Output Format

Save detection results to `infrastructure.json`:

```json
{
  "analyzed_at": "2026-01-12T10:00:00Z",
  "analyzed_by": "product-os",
  "stack": {
    "framework": "nextjs",
    "database": {
      "type": "firebase",
      "subtype": "firestore",
      "confidence": "high"
    },
    "auth": "firebase-auth",
    "payments": "stripe",
    "analytics": null,
    "hosting": "vercel"
  }
}
```
