# Supabase Schema Discovery

## Primary Source: Migrations

Supabase uses SQL migrations - the schema is fully defined in SQL files.

```bash
# List migrations
ls -la supabase/migrations/*.sql

# Read all migrations (concatenated)
cat supabase/migrations/*.sql
```

## Parsing CREATE TABLE

Look for `CREATE TABLE` statements:

```sql
CREATE TABLE users (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  email TEXT UNIQUE NOT NULL,
  name TEXT,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  last_login TIMESTAMPTZ,
  plan TEXT DEFAULT 'free'
);

CREATE TABLE posts (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID REFERENCES users(id) ON DELETE CASCADE,
  title TEXT NOT NULL,
  content TEXT,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  status TEXT DEFAULT 'draft'
);
```

Extract:
- Tables: `users`, `posts`
- Fields and types
- Foreign keys: `posts.user_id` → `users.id`
- PII fields: `email`, `name`

## Alternative Sources

### Generated Types

Supabase can generate TypeScript types:

```bash
# Check for generated types
ls src/types/supabase.ts 2>/dev/null
ls src/types/database.types.ts 2>/dev/null
ls types/supabase.ts 2>/dev/null
```

### Prisma Schema (if using Prisma with Supabase)

```bash
cat prisma/schema.prisma 2>/dev/null
```

## Schema Mapping

```json
{
  "schema": {
    "postgres": {
      "tables": {
        "users": {
          "fields": ["id", "email", "name", "created_at", "last_login", "plan"],
          "primary_key": "id",
          "foreign_keys": []
        },
        "posts": {
          "fields": ["id", "user_id", "title", "content", "created_at", "status"],
          "primary_key": "id",
          "foreign_keys": [
            {"field": "user_id", "references": "users.id"}
          ]
        },
        "subscriptions": {
          "fields": ["id", "user_id", "stripe_customer_id", "status", "created_at"],
          "primary_key": "id",
          "foreign_keys": [
            {"field": "user_id", "references": "users.id"}
          ]
        }
      }
    }
  },
  "data_model": {
    "users": {
      "source": "postgres.users",
      "id": "id",
      "email": "email",
      "name": "name",
      "created_at": "created_at",
      "last_active": "last_login",
      "plan": "plan"
    },
    "content": {
      "source": "postgres.posts",
      "user_id": "user_id",
      "created_at": "created_at"
    },
    "subscriptions": {
      "source": "postgres.subscriptions",
      "user_id": "user_id",
      "status": "status"
    }
  },
  "sensitive_fields": ["email", "name", "stripe_customer_id"]
}
```

## Common Supabase Patterns

### Auth Integration

Supabase Auth creates `auth.users` table automatically. App tables usually reference it:

```sql
-- Common pattern: profiles table extends auth.users
CREATE TABLE profiles (
  id UUID REFERENCES auth.users(id) PRIMARY KEY,
  display_name TEXT,
  avatar_url TEXT,
  created_at TIMESTAMPTZ DEFAULT NOW()
);
```

### Team/Organization Pattern

```sql
CREATE TABLE teams (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  name TEXT NOT NULL,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE team_members (
  team_id UUID REFERENCES teams(id),
  user_id UUID REFERENCES auth.users(id),
  role TEXT DEFAULT 'member',
  PRIMARY KEY (team_id, user_id)
);
```

### Subscription Pattern (Stripe)

```sql
CREATE TABLE subscriptions (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID REFERENCES auth.users(id),
  stripe_customer_id TEXT,
  stripe_subscription_id TEXT,
  status TEXT,
  price_id TEXT,
  current_period_end TIMESTAMPTZ
);
```

## RLS Detection

Check for Row Level Security policies:

```bash
grep -A 10 "CREATE POLICY\|ALTER TABLE.*ENABLE ROW LEVEL SECURITY" supabase/migrations/*.sql
```

This tells you which tables have user-scoped data.
