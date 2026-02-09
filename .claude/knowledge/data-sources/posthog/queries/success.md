# PostHog Queries for Support Team

These queries help Support Team analyze customer health and engagement.

## Engagement Tracking

### Current Engagement Levels
```
For each user, calculate engagement score based on:
- Sessions in last 7 days
- Features used
- Actions completed
Show distribution of engagement scores.
```

### Engagement Trends
```
How has average engagement changed week over week?
Show trend for last 8 weeks.
```

### Low Engagement Alerts
```
Which users had high engagement (>5 sessions/week)
but dropped to low engagement (<2 sessions/week)?
```

## Churn Signals

### At-Risk Users
```
Users who:
- Were active (>3 sessions in weeks 1-2)
- Are now inactive (<1 session in last 7 days)
Show list with last activity date.
```

### Churn Prediction Signals
```
For users who churned (no activity in 30 days):
What was their activity pattern in the 2 weeks before churning?
Compare to still-active users.
```

### Re-engagement Opportunities
```
Users who were inactive 14-30 days
but showed high engagement before going inactive.
Good candidates for win-back campaigns.
```

## User Health Scoring

### Health by Segment
```
Group users by plan type (free/paid).
For each group show:
- Average sessions per week
- Feature adoption rate
- Days since last active
```

### Health Trend per User
```
For user [email], show:
- Weekly session count (last 8 weeks)
- Features used over time
- Engagement trajectory (improving/declining/stable)
```

### Healthy vs Unhealthy Comparison
```
Compare users with >7-day retention to churned users:
- Which features did healthy users adopt?
- When did they adopt them?
- What's the difference in first-week behavior?
```

## Feature Adoption

### Adoption Funnel
```
For key features, show adoption rates:
- Feature A: X% of users
- Feature B: Y% of users
- Feature C: Z% of users
```

### Adoption by Cohort
```
For each signup week, show:
- What % adopted Feature A in first 7 days?
- How does this trend over time?
```

### Feature Stickiness
```
For users who tried Feature X:
- How many came back to use it again?
- What's the average uses per week?
```

## Success Milestones

### Milestone Completion
```
Track key success milestones:
1. Completed onboarding
2. First core action
3. Invited team member
4. Used advanced feature

Show % of users completing each milestone.
```

### Time to Value
```
How long does it take users to reach:
- First core action (from signup)
- Regular usage (3+ sessions/week)
```

### Success Predictors
```
Which first-week behaviors predict:
- 30-day retention
- Upgrade to paid
- High engagement
```

## Account Health Dashboard

### Health Overview
```
Summary of account health:
- Total active users (last 7 days)
- Users at risk (declining engagement)
- Users churned (30+ days inactive)
- Healthy users (stable/growing engagement)
```

### Weekly Health Report
```
Compare this week to last week:
- New signups
- Activations (completed first core action)
- At-risk users identified
- Users recovered (returned after being at-risk)
- Users churned
```
