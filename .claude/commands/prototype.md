---
description: Generate a working Next.js prototype with realistic mock data from your validation
---

You are a product developer creating interactive prototypes for customer conversations and investor demos.

## USAGE

- `/prototype` - Interactive view selection + generate
- `/prototype add` - Add views to existing prototype
- `/prototype data` - Regenerate mock data only (keep views)
- `/prototype reset` - Delete prototype folder, start fresh

## CHECK PREREQUISITES

**Required:** Read `config/idea.md` to understand:
- The problem being solved
- The proposed solution
- Target customer profile

**If idea.md doesn't exist:**
```
No idea defined yet.

Run /setup first to define your idea.
I need context about your product to generate a meaningful prototype.
```

**Also read (if available):**
- `config/jobs.md` - Jobs to be Done for feature list
- `config/interviews.json` - Customer quotes for testimonials
- `config/economics-snapshot.json` - Pricing data
- `config/research-snapshot.json` - Competitor context

## /prototype (MAIN FLOW)

### Step 1: Check for Existing Prototype

If `prototype/` folder exists:

```
Existing Prototype Found

prototype/
├── Landing page
├── Dashboard
└── Pricing page

What would you like to do?
```

Use AskUserQuestion:
- "Add more views" - Show view selection with ungenerated views only
- "Regenerate mock data" - Run `/prototype data` flow
- "Start fresh" - Delete folder and regenerate
- "Cancel" - Exit

### Step 2: View Selection

Use AskUserQuestion with multi-select:

```
Which views should I generate?

Select all that apply:
```

Options (show only ungenerated if adding):
- **Landing page** - Hero, features, testimonials, CTA
- **Dashboard** - Main app view with metrics and activity
- **Pricing page** - Plans and feature comparison
- **Settings** - User account settings
- **Onboarding flow** - First-time user wizard (3 steps)
- **Auth pages** - Login and signup forms
- **Empty states** - No-data states for dashboard

### Step 3: Customization Questions

Use AskUserQuestion:

**Question 1: Brand name**
- Default to product name from idea.md
- Allow custom input

**Question 2: Primary color**
- Blue (professional, trust)
- Purple (creative, innovative)
- Green (growth, health, money)
- Orange (energy, excitement)
- Custom hex (Other option)

**Question 3: Dark mode toggle?**
- Yes - Include theme switcher
- No - Light mode only

### Step 4: Generate Prototype

```
Generating Prototype
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Creating prototype/ folder...

[✓] Project structure (package.json, config files)
[✓] shadcn/ui components
[░] Mock data from validation...
[ ] Landing page
[ ] Dashboard
[ ] Pricing page

This takes 30-60 seconds...
```

Generate files in this order:
1. Project structure (package.json, configs)
2. shadcn/ui base components
3. Mock data file from validation context
4. Selected view pages and components
5. README.md with instructions

### Step 5: Completion

```
Prototype Ready!
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Created: prototype/

To run it:
  cd prototype
  pnpm install
  pnpm dev

Then open http://localhost:3000

Views generated:
├── /          - Landing page
├── /dashboard - Main dashboard
└── /pricing   - Pricing page

Mock data based on:
├── Product: [name from idea.md]
├── Target customer: [from idea.md]
├── Features: [count from jobs.md]
└── Pricing: [from economics or default]

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Next steps:
├── Run pnpm dev and explore
├── Show to potential customers
├── /prototype add - Add more views
└── /mockup - For quick ASCII wireframes
```

Include cross-sell callout:

```
┌──────────────────────────────────────────────────────────────┐
│ Want the full stack?                                         │
│                                                              │
│ This prototype is UI-only. For production-ready SaaS with    │
│ auth, payments, and database:                                │
│                                                              │
│ → saas-dev-team template ($99)                        │
│ → https://aiorg.dev/kits/saas-starter                │
│                                                              │
│ Includes everything from this prototype PLUS:                │
│ ├── Supabase auth (Google, email)                            │
│ ├── Stripe payments                                          │
│ ├── Database + API patterns                                  │
│ └── Deploy to Vercel                                         │
└──────────────────────────────────────────────────────────────┘
```

Update `config/validation-status.json`:
```json
{
  "prototypeGenerated": true,
  "prototypeGeneratedAt": "[ISO date]",
  "prototypeViews": ["landing", "dashboard", "pricing"]
}
```

## /prototype add

Add views to existing prototype without regenerating everything.

1. Read existing `prototype/src/app/` to see what views exist
2. Show view selection with only ungenerated options
3. Generate new views
4. Update mock-data.ts if needed
5. Update validation-status.json

## /prototype data

Regenerate mock data only, keeping view files intact.

1. Re-read all config files (idea.md, jobs.md, interviews.json, economics-snapshot.json)
2. Regenerate `prototype/src/lib/mock-data.ts`
3. Show diff of what changed

```
Mock Data Updated
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Updated: prototype/src/lib/mock-data.ts

Changes:
├── Features: 3 → 5 (added from new interviews)
├── Testimonials: Updated with new quotes
└── Pricing: Unchanged

Restart pnpm dev to see changes.
```

## /prototype reset

Full reset - delete and regenerate.

1. Confirm with user: "Delete prototype/ and start fresh?"
2. If confirmed: `rm -rf prototype/`
3. Run full `/prototype` flow

---

## GENERATED PROJECT STRUCTURE

```
prototype/
├── package.json
├── tsconfig.json
├── next.config.ts
├── tailwind.config.ts
├── postcss.config.mjs
├── components.json
├── README.md
├── src/
│   ├── app/
│   │   ├── globals.css
│   │   ├── layout.tsx
│   │   ├── page.tsx              # Landing (if selected)
│   │   ├── dashboard/
│   │   │   └── page.tsx
│   │   ├── pricing/
│   │   │   └── page.tsx
│   │   ├── settings/
│   │   │   └── page.tsx
│   │   ├── onboarding/
│   │   │   └── page.tsx
│   │   ├── login/
│   │   │   └── page.tsx
│   │   └── signup/
│   │       └── page.tsx
│   ├── components/
│   │   ├── ui/
│   │   │   ├── button.tsx
│   │   │   ├── card.tsx
│   │   │   ├── input.tsx
│   │   │   ├── label.tsx
│   │   │   ├── separator.tsx
│   │   │   ├── badge.tsx
│   │   │   └── avatar.tsx
│   │   ├── landing/
│   │   │   ├── hero.tsx
│   │   │   ├── features.tsx
│   │   │   ├── testimonials.tsx
│   │   │   └── cta.tsx
│   │   ├── dashboard/
│   │   │   ├── stats-cards.tsx
│   │   │   ├── activity-feed.tsx
│   │   │   └── quick-actions.tsx
│   │   └── shared/
│   │       ├── navbar.tsx
│   │       └── footer.tsx
│   ├── lib/
│   │   ├── utils.ts
│   │   └── mock-data.ts
│   └── types/
│       └── index.ts
└── public/
    └── placeholder.svg
```

---

## MOCK DATA GENERATION

Generate `src/lib/mock-data.ts` using validation context.

### Data Source Mapping

| Element | Primary Source | Fallback |
|---------|----------------|----------|
| Product name | idea.md (solution name) | "YourProduct" |
| Tagline | idea.md (solution summary) | Generate from problem |
| Features | jobs.md (core jobs) | 3 generic features |
| Testimonials | interviews.json (positive quotes) | 3 realistic generated quotes |
| Pricing tiers | economics-snapshot.json | $29/$79/$199 defaults |
| Dashboard stats | Problem domain context | Generic SaaS stats |
| Activity feed | jobs.md (user scenarios) | Generated activities |
| User personas | idea.md (target customer) | Generated personas |

### Mock Data Template

```typescript
// Generated from Idea OS validation data
// Source: config/idea.md, config/jobs.md, config/economics-snapshot.json

export const siteConfig = {
  name: "[from idea.md]",
  tagline: "[from idea.md solution]",
  description: "[problem + solution summary]",
  primaryColor: "[user selection]",
}

export const features = [
  {
    title: "[from jobs.md core job 1]",
    description: "[job description]",
    icon: "[relevant Lucide icon name]",
  },
  // ... more features from jobs.md
]

export const testimonials = [
  {
    quote: "[from interviews.json or generated]",
    author: "[realistic name matching target geography]",
    role: "[from idea.md target customer role]",
    company: "[realistic company matching industry]",
  },
  // ... 2-3 more testimonials
]

export const pricingPlans = [
  {
    name: "Starter",
    price: "[from economics or 29]",
    period: "month",
    description: "[for smallest segment]",
    features: ["[feature 1]", "[feature 2]", "[feature 3]"],
    cta: "Start Free Trial",
    popular: false,
  },
  {
    name: "Pro",
    price: "[from economics or 79]",
    period: "month",
    description: "[for main segment]",
    features: ["[all starter]", "[feature 4]", "[feature 5]", "[feature 6]"],
    cta: "Start Free Trial",
    popular: true,
  },
  {
    name: "Business",
    price: "[from economics or 199]",
    period: "month",
    description: "[for larger customers]",
    features: ["[all pro]", "[feature 7]", "[feature 8]"],
    cta: "Contact Sales",
    popular: false,
  },
]

export const dashboardStats = [
  { name: "[metric 1 relevant to problem]", value: "[number]", change: "+12%", trend: "up" },
  { name: "[metric 2]", value: "[number]", change: "+5%", trend: "up" },
  { name: "[metric 3]", value: "[number]", change: null, trend: "neutral" },
  { name: "[metric 4]", value: "[number]", change: "-2%", trend: "down" },
]

export const activityFeed = [
  {
    user: "[realistic name]",
    action: "[from jobs.md user scenario]",
    time: "2 hours ago",
    type: "success",
  },
  // ... more activities
]

export const mockUser = {
  name: "Demo User",
  email: "demo@example.com",
  avatar: null,
  plan: "pro",
}

export const navigation = {
  main: [
    { name: "Home", href: "/" },
    { name: "Pricing", href: "/pricing" },
    { name: "Dashboard", href: "/dashboard" },
  ],
  dashboard: [
    { name: "Overview", href: "/dashboard" },
    { name: "Settings", href: "/settings" },
  ],
}
```

---

## VIEW TEMPLATES

### Landing Page

Components: hero.tsx, features.tsx, testimonials.tsx, cta.tsx

**Hero:**
- Product name and tagline from mock-data.ts
- Two CTA buttons: primary (Start Free Trial) and secondary (See Demo)
- Optional: screenshot placeholder or illustration

**Features:**
- 3-6 features from jobs.md core jobs
- Icon, title, description for each
- Grid layout (2 or 3 columns)

**Testimonials:**
- 2-3 quotes from interviews.json or generated
- Name, role, company
- Simple card layout

**CTA:**
- Final call to action
- "Ready to get started?" + button

### Dashboard

Components: stats-cards.tsx, activity-feed.tsx, quick-actions.tsx

**Stats Cards:**
- 4 key metrics relevant to problem domain
- Number, change percentage, trend indicator

**Activity Feed:**
- Recent actions matching user scenarios from jobs.md
- User avatar, action description, time

**Quick Actions:**
- Primary actions from core jobs
- Large buttons or cards

### Pricing Page

**Tier Cards:**
- 3 pricing tiers (Starter, Pro, Business)
- Price, features list, CTA button
- "Popular" badge on middle tier

**Feature Comparison (optional):**
- Table comparing all features across tiers

### Settings Page

- Profile section (name, email, avatar)
- Current plan display
- Notification preferences
- Danger zone (delete account button, non-functional)

### Onboarding Flow

Multi-step wizard (3 steps):
1. Welcome - Personalized greeting based on problem
2. Setup - Basic config form (industry, company size)
3. First Action - Preview of completing first core job

### Auth Pages

**Login:**
- Email + password form
- "Sign in with Google" button (non-functional)
- Link to signup

**Signup:**
- Name, email, password form
- Terms checkbox
- Link to login

---

## FILE TEMPLATES

### package.json

```json
{
  "name": "prototype",
  "version": "0.1.0",
  "private": true,
  "scripts": {
    "dev": "next dev --turbo",
    "build": "next build",
    "start": "next start"
  },
  "dependencies": {
    "next": "^15.1.0",
    "react": "^19.0.0",
    "react-dom": "^19.0.0",
    "@radix-ui/react-avatar": "^1.1.0",
    "@radix-ui/react-label": "^2.1.0",
    "@radix-ui/react-separator": "^1.1.0",
    "@radix-ui/react-slot": "^1.2.4",
    "class-variance-authority": "^0.7.1",
    "clsx": "^2.1.1",
    "tailwind-merge": "^2.6.0",
    "lucide-react": "^0.468.0"
  },
  "devDependencies": {
    "@types/node": "^22.10.0",
    "@types/react": "^19.0.0",
    "@types/react-dom": "^19.0.0",
    "typescript": "^5.7.2",
    "tailwindcss": "^4.0.0",
    "@tailwindcss/postcss": "^4.0.0"
  }
}
```

### tailwind.config.ts

```typescript
import type { Config } from "tailwindcss"

const config: Config = {
  content: ["./src/**/*.{js,ts,jsx,tsx,mdx}"],
  theme: {
    extend: {},
  },
  plugins: [],
}
export default config
```

### postcss.config.mjs

```javascript
const config = {
  plugins: {
    "@tailwindcss/postcss": {},
  },
}
export default config
```

### next.config.ts

```typescript
import type { NextConfig } from "next"

const nextConfig: NextConfig = {}

export default nextConfig
```

### tsconfig.json

```json
{
  "compilerOptions": {
    "target": "ES2017",
    "lib": ["dom", "dom.iterable", "esnext"],
    "allowJs": true,
    "skipLibCheck": true,
    "strict": true,
    "noEmit": true,
    "esModuleInterop": true,
    "module": "esnext",
    "moduleResolution": "bundler",
    "resolveJsonModule": true,
    "isolatedModules": true,
    "jsx": "preserve",
    "incremental": true,
    "plugins": [{ "name": "next" }],
    "paths": { "@/*": ["./src/*"] }
  },
  "include": ["next-env.d.ts", "**/*.ts", "**/*.tsx", ".next/types/**/*.ts"],
  "exclude": ["node_modules"]
}
```

### components.json

```json
{
  "$schema": "https://ui.shadcn.com/schema.json",
  "style": "new-york",
  "rsc": true,
  "tsx": true,
  "tailwind": {
    "config": "tailwind.config.ts",
    "css": "src/app/globals.css",
    "baseColor": "neutral",
    "cssVariables": true,
    "prefix": ""
  },
  "aliases": {
    "components": "@/components",
    "utils": "@/lib/utils",
    "ui": "@/components/ui",
    "lib": "@/lib",
    "hooks": "@/hooks"
  },
  "iconLibrary": "lucide"
}
```

### src/app/globals.css

```css
@import "tailwindcss";

@theme {
  --color-background: oklch(1 0 0);
  --color-foreground: oklch(0.145 0 0);
  --color-card: oklch(1 0 0);
  --color-card-foreground: oklch(0.145 0 0);
  --color-popover: oklch(1 0 0);
  --color-popover-foreground: oklch(0.145 0 0);
  --color-primary: oklch(0.205 0 0);
  --color-primary-foreground: oklch(0.985 0 0);
  --color-secondary: oklch(0.97 0 0);
  --color-secondary-foreground: oklch(0.205 0 0);
  --color-muted: oklch(0.97 0 0);
  --color-muted-foreground: oklch(0.556 0 0);
  --color-accent: oklch(0.97 0 0);
  --color-accent-foreground: oklch(0.205 0 0);
  --color-destructive: oklch(0.577 0.245 27.325);
  --color-destructive-foreground: oklch(0.985 0 0);
  --color-border: oklch(0.922 0 0);
  --color-input: oklch(0.922 0 0);
  --color-ring: oklch(0.708 0 0);
  --radius-sm: 0.25rem;
  --radius-md: 0.375rem;
  --radius-lg: 0.5rem;
  --radius-xl: 0.75rem;
}

@layer base {
  * {
    @apply border-border;
  }
  body {
    @apply bg-background text-foreground;
  }
}
```

### src/lib/utils.ts

```typescript
import { type ClassValue, clsx } from "clsx"
import { twMerge } from "tailwind-merge"

export function cn(...inputs: ClassValue[]) {
  return twMerge(clsx(inputs))
}
```

### src/app/layout.tsx

```typescript
import type { Metadata } from "next"
import { Inter } from "next/font/google"
import "./globals.css"
import { siteConfig } from "@/lib/mock-data"

const inter = Inter({ subsets: ["latin"] })

export const metadata: Metadata = {
  title: siteConfig.name,
  description: siteConfig.description,
}

export default function RootLayout({
  children,
}: {
  children: React.ReactNode
}) {
  return (
    <html lang="en">
      <body className={inter.className}>{children}</body>
    </html>
  )
}
```

### README.md

```markdown
# [Product Name] Prototype

Interactive prototype generated by Idea OS.

## Quick Start

```bash
pnpm install
pnpm dev
```

Open http://localhost:3000

## Pages

- `/` - Landing page
- `/dashboard` - Main dashboard
- `/pricing` - Pricing plans

## Mock Data

All data is in `src/lib/mock-data.ts`. Edit this file to customize.

## Tech Stack

- Next.js 15 (App Router)
- React 19
- Tailwind CSS v4
- shadcn/ui components

## Notes

This is a UI prototype - no backend functionality. All forms and buttons
are non-functional (for demo purposes only).

---

Generated with [Idea OS](https://aiorg.dev/kits/idea-os)
```

---

## NOTES FOR CLAUDE

1. **Use actual data** - Always read config files and use real product context, not generic examples
2. **Match the problem domain** - Dashboard metrics, activity feed, and stats should relate to the specific problem
3. **Realistic names** - Use names matching target geography (Polish names for Polish market, etc.)
4. **Keep it simple** - Generate clean, minimal UI. Don't over-engineer
5. **shadcn/ui components** - Use the component templates exactly as shown (they're tested)
6. **One thing at a time** - Generate files sequentially with progress updates
7. **Always cross-sell** - Include the saas-dev-team callout at the end
8. **Error handling** - If config files are missing, explain what's needed and suggest running /setup first

### Data Realism Guidelines

For B2B SaaS targeting restaurants (example):
- Dashboard: "Orders Today", "Revenue This Week", "Active Tables"
- Activity: "Waiter Jan accepted order #123", "Table 5 bill paid"
- Testimonials: Polish names if Polish market

For B2B SaaS targeting developers:
- Dashboard: "Builds This Week", "Test Coverage", "Open PRs"
- Activity: "Deploy to staging succeeded", "PR #45 merged"

Always match the problem domain from idea.md.
