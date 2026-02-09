# Schema Discovery

## Purpose

After detecting the database type, discover the actual schema (tables, collections, fields) so we can:
1. Know what data exists
2. Generate appropriate extraction scripts
3. Map to semantic data model

## Discovery by Database Type

### Supabase / PostgreSQL

**Primary source:** `supabase/migrations/*.sql`

```bash
# List all migrations
ls -la supabase/migrations/*.sql

# Read migrations to find CREATE TABLE statements
cat supabase/migrations/*.sql | grep -A 20 "CREATE TABLE"
```

**Parsing CREATE TABLE:**
```sql
CREATE TABLE users (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  email TEXT UNIQUE NOT NULL,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  last_login TIMESTAMPTZ,
  subscription_status TEXT DEFAULT 'free'
);
```

Extract:
- Table name: `users`
- Fields: `id`, `email`, `created_at`, `last_login`, `subscription_status`
- Types: UUID, TEXT, TIMESTAMPTZ
- Identify PII: `email` (TEXT field named "email")

**Alternative sources:**
- `prisma/schema.prisma` if using Prisma with Supabase
- Supabase types file: `src/types/supabase.ts` or `database.types.ts`

### Firebase / Firestore

**Challenge:** Firestore is schemaless - no migrations file.

**Discovery methods:**

1. **Firestore Security Rules** (`firestore.rules`):
```
match /users/{userId} {
  allow read, write: if request.auth.uid == userId;
}
match /content/{contentId} {
  allow read: if true;
  allow write: if request.auth != null;
}
```
→ Collections: `users`, `content`

2. **Code search for collection references:**
```bash
# Find collection() calls
grep -r "collection(" src/ --include="*.ts" --include="*.tsx" --include="*.js"

# Find doc() calls
grep -r "\.doc(" src/

# Find Firestore paths
grep -r "firestore\." src/ | grep -E "(collection|doc)\("
```

3. **TypeScript interfaces:**
```bash
# Look for interface definitions
grep -r "interface.*User\|type.*User" src/ --include="*.ts"
grep -r "interface.*Content\|type.*Content" src/
```

4. **Ask user to provide sample:**
```
I detected Firestore but can't see the exact schema.

Could you share the structure of your main collections?
For example:
- users: {uid, email, createdAt, ...}
- content: {userId, title, createdAt, ...}
```

### Prisma

**Primary source:** `prisma/schema.prisma`

```prisma
model User {
  id        String   @id @default(cuid())
  email     String   @unique
  name      String?
  createdAt DateTime @default(now())
  posts     Post[]
}

model Post {
  id        String   @id @default(cuid())
  title     String
  authorId  String
  author    User     @relation(fields: [authorId], references: [id])
  createdAt DateTime @default(now())
}
```

Extract:
- Models: `User`, `Post`
- Fields with types
- Relations: `Post.authorId` → `User.id`

### MongoDB / Mongoose

**Primary source:** Mongoose schemas

```bash
# Find schema definitions
grep -r "new Schema\|mongoose.Schema" src/ --include="*.ts" --include="*.js" -A 20
```

```javascript
const userSchema = new Schema({
  email: { type: String, required: true },
  name: String,
  createdAt: { type: Date, default: Date.now },
  lastActive: Date
});
```

### Drizzle

**Primary source:** `src/db/schema.ts` or similar

```typescript
export const users = pgTable('users', {
  id: uuid('id').primaryKey().defaultRandom(),
  email: text('email').notNull().unique(),
  createdAt: timestamp('created_at').defaultNow(),
});
```

## Semantic Mapping

After discovering schema, map to semantic concepts:

### Auto-mapping rules

| Field pattern | Maps to | Confidence |
|---------------|---------|------------|
| `id`, `uid`, `user_id`, `_id` | `users.id` | High |
| `email` | `users.email` (PII) | High |
| `created_at`, `createdAt`, `signup_date` | `users.created_at` | High |
| `last_active`, `lastActive`, `last_login`, `lastLogin` | `users.last_active` | High |
| `name`, `displayName`, `full_name` | `users.name` (PII) | High |
| `user_id`, `userId`, `author_id` | Foreign key to users | High |
| `type`, `event_name`, `action` | `events.type` | Medium |
| `timestamp`, `occurred_at` | `events.timestamp` | Medium |
| `status`, `plan`, `tier`, `subscription_*` | `users.plan` | Medium |

### Example mapping

From schema:
```sql
CREATE TABLE profiles (
  uid UUID PRIMARY KEY,
  display_name TEXT,
  email TEXT,
  signed_up_at TIMESTAMPTZ,
  last_seen TIMESTAMPTZ,
  tier TEXT
);
```

To data_model:
```json
{
  "data_model": {
    "users": {
      "source": "profiles",
      "id": "uid",
      "name": "display_name",
      "email": "email",
      "created_at": "signed_up_at",
      "last_active": "last_seen",
      "plan": "tier"
    }
  },
  "sensitive_fields": ["display_name", "email"]
}
```

## Identifying Sensitive Fields

Auto-detect PII fields:

```python
SENSITIVE_PATTERNS = [
    # Names
    r'name', r'first_name', r'last_name', r'full_name', r'display_name',
    # Contact
    r'email', r'phone', r'address', r'city', r'zip', r'country',
    # Auth
    r'password', r'password_hash', r'salt', r'token',
    # Financial
    r'card', r'cvv', r'billing', r'ssn', r'tax_id',
    # Personal
    r'dob', r'date_of_birth', r'birthday', r'age',
    # Technical PII
    r'ip_address', r'user_agent', r'device_id',
]
```

## Discovery Output

Save to `infrastructure.json`:

```json
{
  "schema": {
    "postgres": {
      "tables": {
        "profiles": {
          "fields": ["uid", "display_name", "email", "signed_up_at", "last_seen", "tier"],
          "primary_key": "uid",
          "foreign_keys": []
        },
        "content": {
          "fields": ["id", "user_id", "title", "body", "created_at", "status"],
          "primary_key": "id",
          "foreign_keys": [{"field": "user_id", "references": "profiles.uid"}]
        },
        "events": {
          "fields": ["id", "user_id", "event_type", "metadata", "created_at"],
          "primary_key": "id",
          "foreign_keys": [{"field": "user_id", "references": "profiles.uid"}]
        }
      }
    }
  },
  "data_model": {
    "users": {
      "source": "postgres.profiles",
      "id": "uid",
      "created_at": "signed_up_at",
      "last_active": "last_seen",
      "plan": "tier"
    },
    "events": {
      "source": "postgres.events",
      "user_id": "user_id",
      "type": "event_type",
      "timestamp": "created_at"
    },
    "content": {
      "source": "postgres.content",
      "user_id": "user_id",
      "created_at": "created_at"
    }
  },
  "sensitive_fields": ["display_name", "email"]
}
```

## When Schema Can't Be Discovered

If automatic discovery fails:

```
I detected [database type] but couldn't fully discover the schema.

To help me understand your data structure, could you:

1. Share table/collection names?
   e.g., "users, posts, comments"

2. Share key fields for each?
   e.g., "users: id, email, created_at, last_login"

3. Point me to schema files?
   e.g., "Look at src/types/database.ts"

This helps me generate accurate extraction scripts.
```

Save partial discovery with `"schema_complete": false` flag.

## Updating Schema

Schema might change as project evolves. Re-analyze when:
- User runs `/setup` again
- User asks about data and schema seems outdated
- New migration files detected

```json
{
  "analyzed_at": "2026-01-12T10:00:00Z",
  "schema_version": 3,
  "last_migration": "20260110_add_teams.sql"
}
```
