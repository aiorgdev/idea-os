# Generic Data Extraction

## When to Use

Use this when:
- Stack wasn't detected automatically
- Using a database not covered by specific adapters
- User prefers to provide data manually

## Approach 1: User Provides Summary

Ask user for aggregate numbers:

```
I couldn't detect your database type. Let me ask directly:

1. How many total users do you have?
2. How many signed up in the last 30 days?
3. How many were active in the last 7 days?
4. What % completed [core action]? (your definition of "activated")

With these numbers, I can already give you insights.
```

## Approach 2: CSV Export

Guide user to export CSV:

```
Export a CSV from your database with these columns:
- user_id (anonymized is fine)
- created_at (signup date)
- last_active (last activity date)
- activated (true/false - did core action)

Example format:
user_id,created_at,last_active,activated
abc123,2026-01-01,2026-01-10,true
def456,2026-01-05,2026-01-05,false

Then share the file and I'll analyze it.
```

## Approach 3: Analytics Platform

If user has PostHog, Mixpanel, Amplitude:

```
I see you might have analytics set up. Which do you use?
- PostHog
- Mixpanel
- Amplitude
- Google Analytics
- Other

I can guide you to export the right report.
```

### PostHog Export

```
In PostHog:
1. Go to Insights > New Insight > Retention
2. Set:
   - First event: User signed up
   - Returning event: Any event
   - Time range: Last 30 days
3. Export as CSV

Or use the API:
curl -X POST https://app.posthog.com/api/projects/{project_id}/insights/trend/ \
  -H "Authorization: Bearer {api_key}" \
  -d '{"events": [{"id": "$pageview"}], "date_from": "-30d"}'
```

### Mixpanel Export

```
In Mixpanel:
1. Go to Reports > Insights
2. Create retention report
3. Export data
```

## Approach 4: Generic SQL

If user can run SQL:

```sql
-- Basic user metrics
SELECT
  DATE_TRUNC('week', created_at) as signup_week,
  COUNT(*) as signups,
  COUNT(*) FILTER (WHERE last_active > NOW() - INTERVAL '7 days') as active_7d
FROM users
WHERE created_at > NOW() - INTERVAL '30 days'
GROUP BY 1
ORDER BY 1;
```

## Minimum Data for Analysis

Even without full data, we can work with:

| Data point | What it tells us |
|------------|------------------|
| Total users | Scale |
| Signups last 30d | Growth rate |
| Active last 7d | Engagement |
| Activation rate | Product-market fit signal |

## Output Format

Regardless of source, normalize to:

```json
{
  "source": "manual",
  "extracted_at": "2026-01-12",
  "totals": {
    "users": 500,
    "signups_30d": 100,
    "active_7d": 150,
    "activated": 75
  },
  "rates": {
    "growth_rate": 0.20,
    "active_rate": 0.30,
    "activation_rate": 0.15
  }
}
```
