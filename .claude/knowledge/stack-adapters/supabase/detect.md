# Supabase Detection

## Indicators

### High Confidence
- `supabase/` directory exists
- `supabase/config.toml` exists
- `supabase/migrations/` contains SQL files

### Medium Confidence
- `@supabase/supabase-js` in package.json
- `NEXT_PUBLIC_SUPABASE_URL` in env files

### Low Confidence
- `createClient` from supabase in code

## Detection Commands

```bash
# High confidence checks
[ -d supabase ] && echo "supabase/ directory found"
[ -f supabase/config.toml ] && echo "supabase/config.toml found"
ls supabase/migrations/*.sql 2>/dev/null | head -5

# Package.json check
grep -E '"@supabase/supabase-js"|"@supabase/ssr"' package.json

# Env vars
grep -E "SUPABASE_" .env* .env.example 2>/dev/null | head -5
```

## Output

```json
{
  "stack": {
    "database": {
      "type": "supabase",
      "subtype": "postgres",
      "confidence": "high"
    },
    "auth": "supabase-auth"
  },
  "connection": {
    "url_env": "NEXT_PUBLIC_SUPABASE_URL",
    "anon_key_env": "NEXT_PUBLIC_SUPABASE_ANON_KEY",
    "service_role_env": "SUPABASE_SERVICE_ROLE_KEY"
  }
}
```

## Supabase Features Detection

```bash
# Check for specific features
grep -r "supabase.auth" src/ --include="*.ts" && echo "Uses Supabase Auth"
grep -r "supabase.storage" src/ --include="*.ts" && echo "Uses Supabase Storage"
grep -r "supabase.functions" src/ --include="*.ts" && echo "Uses Edge Functions"
```
