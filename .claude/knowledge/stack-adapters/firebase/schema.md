# Firebase Schema Discovery

## Challenge

Firestore is schemaless - there's no migration file defining structure.
We need to discover schema from other sources.

## Discovery Methods

### 1. Firestore Security Rules

```bash
cat firestore.rules 2>/dev/null
```

Example:
```
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    match /users/{userId} {
      allow read, write: if request.auth.uid == userId;
    }
    match /content/{contentId} {
      allow read: if true;
      allow write: if request.auth != null;
    }
    match /prompts/{promptId} {
      allow read, write: if request.auth != null;
    }
  }
}
```

**Extract collections:** `users`, `content`, `prompts`

### 2. Code Search for Collection References

```bash
# Find collection() calls
grep -rn "collection(" src/ lib/ app/ --include="*.ts" --include="*.tsx" --include="*.js"

# Find Firestore operations
grep -rn "\.doc\|\.add\|\.set\|\.update\|\.where" src/ --include="*.ts" --include="*.tsx"

# Find collection names as strings
grep -rn "firestore\|getFirestore" src/ -A 5 --include="*.ts"
```

### 3. TypeScript Interfaces

```bash
# Find type definitions
grep -rn "interface.*User\|type.*User" src/ --include="*.ts"
grep -rn "interface.*Content\|type.*Content" src/ --include="*.ts"

# Common patterns:
# - src/types/*.ts
# - src/lib/firebase.ts
# - src/models/*.ts
```

Example:
```typescript
interface User {
  uid: string;
  email: string;
  displayName: string;
  createdAt: Timestamp;
  lastActive: Timestamp;
  plan: 'free' | 'pro';
}

interface Content {
  id: string;
  userId: string;
  type: 'prompt' | 'response';
  title: string;
  body: string;
  createdAt: Timestamp;
  status: 'draft' | 'published';
}
```

### 4. Firebase Admin Initialization

```bash
# Find admin SDK usage (usually in API routes)
grep -rn "admin.firestore\|getFirestore" src/app/api/ pages/api/ --include="*.ts"
```

### 5. Ask User (Fallback)

If automatic discovery is incomplete:

```
I detected these Firestore collections from your code:
├── users
├── content
└── prompts (maybe?)

Could you confirm and share the main fields for each?

Example format:
users: { uid, email, displayName, createdAt, lastActive, plan }
content: { id, userId, type, title, createdAt, status }
```

## Schema Mapping

Once collections are discovered, map to semantic model:

```json
{
  "schema": {
    "firestore": {
      "collections": {
        "users": {
          "fields": ["uid", "email", "displayName", "createdAt", "lastActive", "plan"],
          "id_field": "uid",
          "timestamp_fields": ["createdAt", "lastActive"]
        },
        "content": {
          "fields": ["id", "userId", "type", "title", "body", "createdAt", "status"],
          "user_reference": "userId",
          "timestamp_fields": ["createdAt"]
        },
        "sessions": {
          "fields": ["userId", "startedAt", "endedAt", "actions"],
          "user_reference": "userId",
          "timestamp_fields": ["startedAt", "endedAt"]
        }
      }
    }
  },
  "data_model": {
    "users": {
      "source": "firestore.users",
      "id": "uid",
      "email": "email",
      "name": "displayName",
      "created_at": "createdAt",
      "last_active": "lastActive",
      "plan": "plan"
    },
    "content": {
      "source": "firestore.content",
      "user_id": "userId",
      "created_at": "createdAt"
    },
    "events": {
      "source": "firestore.sessions",
      "user_id": "userId",
      "timestamp": "startedAt"
    }
  },
  "sensitive_fields": ["email", "displayName"]
}
```

## Timestamp Handling

Firebase Timestamps need special handling:

```python
# Firestore Timestamp → Python datetime
from datetime import datetime

def convert_timestamp(ts):
    if hasattr(ts, 'seconds'):  # Firestore Timestamp
        return datetime.fromtimestamp(ts.seconds)
    elif isinstance(ts, dict) and '_seconds' in ts:  # Serialized
        return datetime.fromtimestamp(ts['_seconds'])
    return ts
```

## Common Firestore Patterns

### User Document

```
/users/{uid}
├── uid: string (same as doc ID)
├── email: string
├── displayName: string
├── photoURL: string (optional)
├── createdAt: Timestamp
├── lastActive: Timestamp
└── metadata: object (custom fields)
```

### Content/Posts Collection

```
/content/{contentId}
├── id: string
├── userId: string (reference to user)
├── type: string
├── title: string
├── body: string
├── createdAt: Timestamp
├── updatedAt: Timestamp
└── status: string
```

### Events/Activity Collection

```
/events/{eventId}
├── userId: string
├── type: string ('pageview', 'action', etc.)
├── timestamp: Timestamp
├── metadata: object
└── sessionId: string (optional)
```

## Next Steps

After schema discovery, use `extract.py.template` to generate extraction script.
