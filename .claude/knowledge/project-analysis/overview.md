# Project Analysis Layer

## Purpose

Business kits (Product OS, Support Team, Marketing OS) need to understand the user's project to provide contextual help. Instead of asking "what data do you have?", we **analyze the project** and **know** what's available.

## Key Principle

```
DON'T: "What database do you use? What tables do you have?"
DO:    "I see you have Firebase with users, content, sessions collections.
        I can extract activity data. Want me to prepare a script?"
```

The kit should feel like a consultant who **knows your project**, not a generic tool asking questions.

## How It Works

### 1. During /setup

When user runs `/setup` in any business kit:

1. **Detect stack** - scan project files to identify framework, database, auth, etc.
2. **Discover schema** - find tables/collections and their structure
3. **Save knowledge** - store in `~/.aiorg/projects/[name]/infrastructure.json`
4. **Confirm with user** - "I detected Firebase with X, Y, Z. Correct?"

### 2. During Conversations

When kit needs data to help user:

1. **Read infrastructure.json** - know what's available
2. **Don't ask** - offer based on what you know
3. **Generate scripts** - tailored to their stack
4. **Request minimum** - only what's needed for current goal

## File Structure

```
~/.aiorg/projects/[name]/
├── context.json           # Business context (existing)
│   ├── business.*         # Name, description, stage
│   ├── validation.*       # Idea OS results
│   └── pmf.*              # Product OS results
│
└── infrastructure.json    # Technical context (NEW)
    ├── stack              # Detected stack
    ├── schema             # Database schema
    └── data_model         # Semantic mapping
```

## infrastructure.json Schema

```json
{
  "analyzed_at": "2026-01-12T10:00:00Z",
  "analyzed_by": "product-os",

  "stack": {
    "framework": "nextjs",
    "database": {
      "type": "firebase",
      "subtype": "firestore"
    },
    "auth": "firebase-auth",
    "payments": "stripe",
    "analytics": null,
    "hosting": "vercel"
  },

  "schema": {
    "firestore": {
      "collections": {
        "users": {
          "fields": ["uid", "email", "displayName", "createdAt", "lastActive", "plan"],
          "sample_doc": "Optional: anonymized sample for understanding structure"
        },
        "content": {
          "fields": ["id", "userId", "type", "title", "createdAt", "status"],
          "user_reference": "userId"
        },
        "sessions": {
          "fields": ["userId", "startedAt", "endedAt", "actions"],
          "user_reference": "userId"
        }
      }
    }
  },

  "data_model": {
    "users": {
      "source": "firestore.users",
      "id": "uid",
      "created_at": "createdAt",
      "last_active": "lastActive",
      "email": "email",
      "plan": "plan"
    },
    "events": {
      "source": "firestore.sessions",
      "user_id": "userId",
      "timestamp": "startedAt",
      "type": "actions[].type"
    },
    "content": {
      "source": "firestore.content",
      "user_id": "userId",
      "created_at": "createdAt"
    }
  },

  "sensitive_fields": ["email", "displayName", "phone"],

  "connection": {
    "env_var": "FIREBASE_SERVICE_ACCOUNT",
    "project_id_env": "NEXT_PUBLIC_FIREBASE_PROJECT_ID"
  }
}
```

## Semantic Data Model

The `data_model` section maps project-specific tables to **semantic concepts**:

| Concept | Meaning | Common mappings |
|---------|---------|-----------------|
| `users.id` | Unique user identifier | `id`, `uid`, `user_id`, `_id` |
| `users.created_at` | When user signed up | `createdAt`, `created_at`, `signupDate` |
| `users.last_active` | Last activity timestamp | `lastActive`, `last_seen`, `lastLogin` |
| `events.type` | What user did | `action`, `event_name`, `type` |
| `events.timestamp` | When they did it | `createdAt`, `timestamp`, `occurred_at` |

This allows kits to ask for `users.created_at` without knowing the actual field name.

## Usage in Commands

### Reading Infrastructure

```python
# In a command file:
"""
## Before discussing data

1. Read infrastructure:
   ```bash
   cat ~/.aiorg/projects/$(cat .aiorg | jq -r '.project')/infrastructure.json 2>/dev/null
   ```

2. If exists:
   - You KNOW their stack and schema
   - DON'T ask "what data do you have?"
   - DO say "I see you have X. I can extract Y. Want me to?"

3. If doesn't exist:
   - Run project analysis first
   - Or ask user to describe their stack
"""
```

### Generating Extraction Scripts

When you need data:

1. Identify GOAL (what you want to achieve)
2. Identify MINIMUM data needed
3. Read `infrastructure.json` to know stack
4. Use appropriate stack adapter template
5. Customize script for their schema
6. Explain what it does and why

## Related Files

- `stack-detection.md` - How to detect stack from project files
- `schema-discovery.md` - How to discover database schema
- `data-conversation.md` - Principles for asking about data
- `../stack-adapters/` - Templates for each stack type
