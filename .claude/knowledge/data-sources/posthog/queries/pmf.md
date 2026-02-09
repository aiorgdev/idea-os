# PostHog Queries for Product OS

These queries help Product OS analyze retention and product-market fit.

## Retention Analysis

### Basic Retention Curve
```
Show user retention for the last 3 months:
- Day 1 retention
- Day 7 retention
- Day 30 retention
```

### Retention by Cohort
```
Show retention curves grouped by signup week
for the last 8 weeks
```

### Retention Trend
```
How has Day 7 retention changed month over month?
```

## Cohort Analysis

### Cohort Comparison
```
Compare behavior of users who signed up in:
- January vs February vs March
Include: retention, feature usage, conversion
```

### Best vs Worst Cohorts
```
Which signup cohort has the best 30-day retention?
What's different about them?
```

## Feature Usage

### Feature Adoption
```
For each feature (by event name),
show how many users used it at least once
```

### Feature Correlation with Retention
```
For users with 30-day retention,
which features did they use in first week?
Compare to churned users.
```

### Power Features
```
Which features are most correlated with long-term retention?
```

## Activation Analysis

### Activation Funnel
```
Show funnel of key activation steps:
1. Signup completed
2. Profile completed
3. First core action
4. Second session
```

### Time to Activation
```
How long does it take users to complete
their first core action after signup?
Show distribution.
```

### Activation Rate by Cohort
```
What percentage of each weekly cohort
completes activation within 7 days?
```

## Magic Number Analysis

### Usage Frequency vs Retention
```
Group users by number of sessions in first week.
For each group, show 30-day retention rate.
```

### Finding the Magic Number
```
At what usage frequency (sessions per week)
does retention significantly improve?
```

### Feature Frequency Analysis
```
How many times do retained users use [core feature]
in their first week vs churned users?
```

## Churn Patterns

### Churn Timing
```
For users who churned (no activity in 30 days),
when was their last activity?
Show distribution.
```

### Pre-Churn Behavior
```
What did churned users do in their last 7 days
before going inactive?
```
