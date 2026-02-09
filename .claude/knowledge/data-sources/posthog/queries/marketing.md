# PostHog Queries for Marketing OS

These queries help Marketing OS analyze acquisition and conversion data.

## Conversion Funnels

### Basic Signup Funnel
```
Show me a funnel:
1. $pageview on homepage
2. $pageview on /signup
3. User signed up (your signup event)
```

### Full Acquisition Funnel
```
Create a funnel for the last 30 days:
1. Homepage visit
2. Pricing page visit
3. Signup started
4. Signup completed
5. First payment
```

## UTM Attribution

### Traffic by Source
```
Break down pageviews by UTM source for the last 30 days
```

### Conversions by Campaign
```
Show signups grouped by UTM campaign,
include conversion rate from pageview
```

### Best Performing Channels
```
Which UTM sources have the highest conversion rate
from first visit to signup?
```

## Landing Page Performance

### Top Pages
```
Show pageviews by URL path, sorted by count
```

### Conversion by Landing Page
```
For users who eventually signed up,
what was their first page (landing page)?
Group by URL and show conversion rate.
```

### Bounce Analysis
```
Show pages with highest bounce rate
(pageview without any follow-up event)
```

## Traffic Trends

### Daily Traffic
```
Show daily pageviews for the last 30 days
```

### Week over Week
```
Compare this week's pageviews to last week,
broken down by day
```

### New vs Returning
```
How many pageviews are from new visitors vs returning?
```

## Campaign Performance

### Specific Campaign Analysis
```
For UTM campaign "launch-2024":
- Total visitors
- Signups
- Conversion rate
- Compare to other campaigns
```

### Ad Spend ROI (if tracking)
```
For users with UTM source "google-ads":
- Number of signups
- Number of paid conversions
- Revenue generated
```
