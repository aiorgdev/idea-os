# Firebase Detection

## Indicators

### High Confidence
- `firebase.json` exists in project root
- `.firebaserc` exists (Firebase project link)

### Medium Confidence
- `firebase` or `firebase-admin` in package.json
- `@firebase/firestore`, `@firebase/auth` in package.json

### Low Confidence
- `initializeApp` calls in source code
- `NEXT_PUBLIC_FIREBASE_*` or `FIREBASE_*` env vars

## Detection Commands

```bash
# High confidence checks
[ -f firebase.json ] && echo "firebase.json found"
[ -f .firebaserc ] && echo ".firebaserc found"

# Package.json check
grep -E '"firebase"|"firebase-admin"' package.json

# Env vars (check .env.example or .env.local)
grep -E "FIREBASE_|NEXT_PUBLIC_FIREBASE" .env* .env.example 2>/dev/null
```

## Firebase Services Detection

```bash
# Check firebase.json for enabled services
cat firebase.json 2>/dev/null | jq 'keys'

# Common services:
# - firestore: Database
# - auth: Authentication
# - hosting: Web hosting
# - storage: File storage
# - functions: Cloud functions
```

## Output

```json
{
  "stack": {
    "database": {
      "type": "firebase",
      "subtype": "firestore",
      "confidence": "high"
    },
    "auth": "firebase-auth",
    "storage": "firebase-storage"
  },
  "connection": {
    "project_id_env": "NEXT_PUBLIC_FIREBASE_PROJECT_ID",
    "service_account_env": "FIREBASE_SERVICE_ACCOUNT"
  }
}
```

## Next Steps

After detection, proceed to `schema.md` for schema discovery.
