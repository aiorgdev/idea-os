# Firestore Analytics Patterns

If you use Firebase/Firestore, these patterns help extract analytics data.

## Expected Structure

```
/users/{userId}
  - email
  - createdAt
  - ...

/events/{eventId}
  - userId
  - eventName
  - properties (map)
  - createdAt (timestamp)
```

## Basic Event Tracking

### Log Events
```typescript
import { collection, addDoc, serverTimestamp } from 'firebase/firestore'
import { db } from './firebase'

async function trackEvent(
  userId: string,
  eventName: string,
  properties?: Record<string, any>
) {
  await addDoc(collection(db, 'events'), {
    userId,
    eventName,
    properties: properties || {},
    createdAt: serverTimestamp(),
  })
}
```

## Analytics Queries

### Daily Active Users (Last 7 Days)

```typescript
import { collection, query, where, getDocs, Timestamp } from 'firebase/firestore'

async function getDAU(days: number = 7) {
  const startDate = Timestamp.fromDate(
    new Date(Date.now() - days * 24 * 60 * 60 * 1000)
  )

  const q = query(
    collection(db, 'events'),
    where('createdAt', '>=', startDate)
  )

  const snapshot = await getDocs(q)
  const userIds = new Set<string>()
  snapshot.forEach(doc => userIds.add(doc.data().userId))

  return userIds.size
}
```

### Event Counts

```typescript
async function getEventCounts(days: number = 30) {
  const startDate = Timestamp.fromDate(
    new Date(Date.now() - days * 24 * 60 * 60 * 1000)
  )

  const q = query(
    collection(db, 'events'),
    where('createdAt', '>=', startDate)
  )

  const snapshot = await getDocs(q)
  const counts: Record<string, number> = {}

  snapshot.forEach(doc => {
    const name = doc.data().eventName
    counts[name] = (counts[name] || 0) + 1
  })

  return Object.entries(counts)
    .sort(([, a], [, b]) => b - a)
    .map(([name, count]) => ({ name, count }))
}
```

### User Retention

```typescript
async function getRetention() {
  // Get all users with signup date
  const usersSnapshot = await getDocs(collection(db, 'users'))
  const users = new Map<string, Date>()
  usersSnapshot.forEach(doc => {
    users.set(doc.id, doc.data().createdAt.toDate())
  })

  // Get all events
  const eventsSnapshot = await getDocs(collection(db, 'events'))
  const userEvents = new Map<string, Date[]>()
  eventsSnapshot.forEach(doc => {
    const { userId, createdAt } = doc.data()
    if (!userEvents.has(userId)) userEvents.set(userId, [])
    userEvents.get(userId)!.push(createdAt.toDate())
  })

  // Calculate retention
  let day1 = 0, day7 = 0, day30 = 0
  const total = users.size

  users.forEach((signupDate, userId) => {
    const events = userEvents.get(userId) || []
    const hasDay1 = events.some(e =>
      daysBetween(signupDate, e) === 1
    )
    const hasDay7 = events.some(e =>
      daysBetween(signupDate, e) === 7
    )
    const hasDay30 = events.some(e =>
      daysBetween(signupDate, e) === 30
    )

    if (hasDay1) day1++
    if (hasDay7) day7++
    if (hasDay30) day30++
  })

  return {
    day1: (day1 / total * 100).toFixed(1),
    day7: (day7 / total * 100).toFixed(1),
    day30: (day30 / total * 100).toFixed(1),
  }
}

function daysBetween(a: Date, b: Date): number {
  return Math.floor((b.getTime() - a.getTime()) / (1000 * 60 * 60 * 24))
}
```

## Using Cloud Functions for Analytics

### Scheduled Daily Report

```typescript
// functions/src/analytics.ts
import * as functions from 'firebase-functions'
import * as admin from 'firebase-admin'

export const dailyAnalytics = functions.pubsub
  .schedule('0 9 * * *')  // 9am daily
  .onRun(async () => {
    const db = admin.firestore()
    const yesterday = new Date(Date.now() - 24 * 60 * 60 * 1000)

    const snapshot = await db
      .collection('events')
      .where('createdAt', '>=', yesterday)
      .get()

    const uniqueUsers = new Set<string>()
    snapshot.forEach(doc => uniqueUsers.add(doc.data().userId))

    // Store report
    await db.collection('analytics').add({
      date: yesterday,
      dau: uniqueUsers.size,
      totalEvents: snapshot.size,
    })
  })
```

## BigQuery Export (Recommended for Scale)

For larger datasets, export to BigQuery:

1. Enable Firestore → BigQuery extension
2. Query with SQL in BigQuery
3. Use BigQuery for complex analytics

```sql
-- In BigQuery
SELECT
  DATE(timestamp) as day,
  COUNT(DISTINCT JSON_VALUE(data, '$.userId')) as dau
FROM `project.firestore_export.events_raw_latest`
WHERE DATE(timestamp) >= DATE_SUB(CURRENT_DATE(), INTERVAL 30 DAY)
GROUP BY day
ORDER BY day
```

## Limitations

Firestore has query limitations:
- No native aggregations (count, sum) - must fetch all docs
- Limited compound queries
- Can be expensive for analytics at scale

**Recommendation:** For production analytics, consider:
1. Export to BigQuery (free extension)
2. Use a dedicated analytics service (PostHog, Mixpanel)
3. Store aggregated stats in separate collection
