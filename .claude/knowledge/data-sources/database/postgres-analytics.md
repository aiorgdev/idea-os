# PostgreSQL Analytics Queries

If you track user events in PostgreSQL, these query templates help extract analytics data.

## Expected Schema

These queries assume a basic events table:

```sql
CREATE TABLE user_events (
  id SERIAL PRIMARY KEY,
  user_id UUID NOT NULL,
  event_name VARCHAR(255) NOT NULL,
  properties JSONB,
  created_at TIMESTAMP DEFAULT NOW()
);

CREATE INDEX idx_events_user ON user_events(user_id);
CREATE INDEX idx_events_name ON user_events(event_name);
CREATE INDEX idx_events_created ON user_events(created_at);
```

Adapt column names to match your schema.

## Basic Queries

### Daily Active Users
```sql
SELECT
  DATE(created_at) as day,
  COUNT(DISTINCT user_id) as dau
FROM user_events
WHERE created_at >= NOW() - INTERVAL '30 days'
GROUP BY DATE(created_at)
ORDER BY day;
```

### Event Counts
```sql
SELECT
  event_name,
  COUNT(*) as count,
  COUNT(DISTINCT user_id) as unique_users
FROM user_events
WHERE created_at >= NOW() - INTERVAL '30 days'
GROUP BY event_name
ORDER BY count DESC;
```

## Retention Queries

### Day 1/7/30 Retention
```sql
WITH first_seen AS (
  SELECT
    user_id,
    MIN(DATE(created_at)) as signup_date
  FROM user_events
  GROUP BY user_id
),
retention AS (
  SELECT
    f.user_id,
    f.signup_date,
    MAX(CASE WHEN DATE(e.created_at) = f.signup_date + 1 THEN 1 ELSE 0 END) as day1,
    MAX(CASE WHEN DATE(e.created_at) = f.signup_date + 7 THEN 1 ELSE 0 END) as day7,
    MAX(CASE WHEN DATE(e.created_at) = f.signup_date + 30 THEN 1 ELSE 0 END) as day30
  FROM first_seen f
  LEFT JOIN user_events e ON f.user_id = e.user_id
  GROUP BY f.user_id, f.signup_date
)
SELECT
  COUNT(*) as total_users,
  ROUND(100.0 * SUM(day1) / COUNT(*), 1) as day1_retention,
  ROUND(100.0 * SUM(day7) / COUNT(*), 1) as day7_retention,
  ROUND(100.0 * SUM(day30) / COUNT(*), 1) as day30_retention
FROM retention
WHERE signup_date <= NOW() - INTERVAL '30 days';
```

### Retention by Cohort
```sql
WITH first_seen AS (
  SELECT
    user_id,
    DATE_TRUNC('week', MIN(created_at)) as cohort_week
  FROM user_events
  GROUP BY user_id
)
SELECT
  f.cohort_week,
  COUNT(DISTINCT f.user_id) as cohort_size,
  COUNT(DISTINCT CASE
    WHEN e.created_at >= f.cohort_week + INTERVAL '7 days'
    AND e.created_at < f.cohort_week + INTERVAL '14 days'
    THEN e.user_id
  END) as week1_retained
FROM first_seen f
LEFT JOIN user_events e ON f.user_id = e.user_id
GROUP BY f.cohort_week
ORDER BY f.cohort_week DESC
LIMIT 8;
```

## Funnel Queries

### Basic Funnel
```sql
WITH funnel AS (
  SELECT
    user_id,
    MAX(CASE WHEN event_name = 'page_view' THEN 1 ELSE 0 END) as step1,
    MAX(CASE WHEN event_name = 'signup_started' THEN 1 ELSE 0 END) as step2,
    MAX(CASE WHEN event_name = 'signup_completed' THEN 1 ELSE 0 END) as step3
  FROM user_events
  WHERE created_at >= NOW() - INTERVAL '30 days'
  GROUP BY user_id
)
SELECT
  SUM(step1) as page_views,
  SUM(step2) as signup_started,
  SUM(step3) as signup_completed,
  ROUND(100.0 * SUM(step2) / NULLIF(SUM(step1), 0), 1) as view_to_start,
  ROUND(100.0 * SUM(step3) / NULLIF(SUM(step2), 0), 1) as start_to_complete
FROM funnel;
```

## Feature Usage

### Most Used Features
```sql
SELECT
  event_name,
  COUNT(DISTINCT user_id) as users,
  COUNT(*) as total_uses,
  ROUND(COUNT(*)::numeric / COUNT(DISTINCT user_id), 1) as uses_per_user
FROM user_events
WHERE created_at >= NOW() - INTERVAL '30 days'
  AND event_name NOT IN ('page_view', 'session_start')
GROUP BY event_name
ORDER BY users DESC;
```

### Feature Adoption Timeline
```sql
WITH first_use AS (
  SELECT
    user_id,
    event_name,
    MIN(created_at) as first_used_at
  FROM user_events
  WHERE event_name = 'feature_x'
  GROUP BY user_id, event_name
),
signup AS (
  SELECT user_id, MIN(created_at) as signup_at
  FROM user_events
  GROUP BY user_id
)
SELECT
  EXTRACT(DAY FROM f.first_used_at - s.signup_at) as days_to_adopt,
  COUNT(*) as users
FROM first_use f
JOIN signup s ON f.user_id = s.user_id
GROUP BY days_to_adopt
ORDER BY days_to_adopt;
```

## Notes

- Adjust table/column names to your schema
- Add appropriate indexes for large datasets
- Consider partitioning events table by date for performance
