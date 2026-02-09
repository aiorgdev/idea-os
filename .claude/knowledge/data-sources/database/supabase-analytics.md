# Supabase Analytics Patterns

Supabase is PostgreSQL, so all queries from `postgres-analytics.md` work. This file covers Supabase-specific patterns.

## Using Supabase Client

### Setup
```typescript
import { createClient } from '@supabase/supabase-js'

const supabase = createClient(
  process.env.SUPABASE_URL!,
  process.env.SUPABASE_SERVICE_ROLE_KEY! // Use service role for analytics
)
```

### Basic Event Logging
```typescript
async function trackEvent(
  userId: string,
  eventName: string,
  properties?: Record<string, any>
) {
  await supabase.from('user_events').insert({
    user_id: userId,
    event_name: eventName,
    properties,
  })
}
```

## Supabase-Specific Queries

### Using RPC for Complex Queries

Create a function in Supabase:

```sql
-- In Supabase SQL Editor
CREATE OR REPLACE FUNCTION get_retention_stats()
RETURNS TABLE (
  total_users bigint,
  day1_retention numeric,
  day7_retention numeric,
  day30_retention numeric
) AS $$
  -- Insert retention query from postgres-analytics.md
$$ LANGUAGE sql;
```

Call from client:
```typescript
const { data } = await supabase.rpc('get_retention_stats')
```

### Real-time Event Stream

```typescript
// Subscribe to new events
supabase
  .channel('events')
  .on(
    'postgres_changes',
    { event: 'INSERT', schema: 'public', table: 'user_events' },
    (payload) => console.log('New event:', payload.new)
  )
  .subscribe()
```

## Using auth.users Table

Supabase tracks users in `auth.users`. Join for user metadata:

```sql
SELECT
  u.email,
  u.created_at as signup_date,
  COUNT(e.id) as total_events,
  MAX(e.created_at) as last_active
FROM auth.users u
LEFT JOIN user_events e ON u.id = e.user_id
WHERE u.created_at >= NOW() - INTERVAL '30 days'
GROUP BY u.id, u.email, u.created_at
ORDER BY total_events DESC;
```

## Leveraging Supabase Features

### Row Level Security for Analytics

If you have team-based analytics:

```sql
-- Users can only see their team's analytics
CREATE POLICY "Team analytics"
ON user_events FOR SELECT
USING (
  team_id IN (
    SELECT team_id FROM team_members WHERE user_id = auth.uid()
  )
);
```

### Using Supabase Edge Functions

For scheduled analytics:

```typescript
// supabase/functions/daily-analytics/index.ts
import { createClient } from '@supabase/supabase-js'

Deno.serve(async () => {
  const supabase = createClient(
    Deno.env.get('SUPABASE_URL')!,
    Deno.env.get('SUPABASE_SERVICE_ROLE_KEY')!
  )

  const { data: dau } = await supabase
    .from('user_events')
    .select('user_id')
    .gte('created_at', new Date(Date.now() - 86400000).toISOString())

  const uniqueUsers = new Set(dau?.map(e => e.user_id)).size

  // Store or send report
  return new Response(JSON.stringify({ dau: uniqueUsers }))
})
```

## Performance Tips

1. **Index your events table:**
   ```sql
   CREATE INDEX idx_events_user_created
   ON user_events(user_id, created_at DESC);
   ```

2. **Use materialized views for dashboards:**
   ```sql
   CREATE MATERIALIZED VIEW daily_stats AS
   SELECT DATE(created_at) as day, COUNT(DISTINCT user_id) as dau
   FROM user_events
   GROUP BY DATE(created_at);

   -- Refresh daily via cron
   REFRESH MATERIALIZED VIEW daily_stats;
   ```

3. **Partition large tables:**
   ```sql
   -- Enable partitioning for events table
   CREATE TABLE user_events (
     -- columns
   ) PARTITION BY RANGE (created_at);
   ```

## Migration from PostHog

If moving from PostHog to self-hosted Supabase:

1. Export events from PostHog (Data Management → Export)
2. Transform to match your schema
3. Import via Supabase CSV import or bulk insert
