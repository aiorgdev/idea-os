# CSV Data Format

If you don't have analytics tracking or want to manually provide data, you can use CSV files.

## Where to Place Files

Create a `data/` folder in your project:

```
your-project/
├── data/
│   ├── users.csv
│   ├── events.csv
│   └── conversions.csv
└── ...
```

## File Formats

### users.csv

Basic user information.

```csv
user_id,email,signup_date,plan,status
u001,alice@example.com,2024-01-15,pro,active
u002,bob@example.com,2024-01-20,free,churned
u003,carol@example.com,2024-02-01,pro,active
```

**Required columns:**
- `user_id` - Unique identifier
- `signup_date` - ISO date (YYYY-MM-DD)

**Optional columns:**
- `email` - For identification
- `plan` - Pricing tier
- `status` - active/churned/trial

### events.csv

User activity events.

```csv
user_id,event_name,event_date,properties
u001,page_view,2024-01-15,{"page":"/pricing"}
u001,signup_completed,2024-01-15,{}
u001,feature_used,2024-01-16,{"feature":"export"}
u002,page_view,2024-01-20,{"page":"/"}
u002,signup_completed,2024-01-20,{}
```

**Required columns:**
- `user_id` - Links to users.csv
- `event_name` - What happened
- `event_date` - ISO date (YYYY-MM-DD)

**Optional columns:**
- `properties` - JSON object with extra data

### conversions.csv

For funnel analysis.

```csv
user_id,step,completed_date
u001,visited_homepage,2024-01-15
u001,viewed_pricing,2024-01-15
u001,started_signup,2024-01-15
u001,completed_signup,2024-01-15
u001,made_purchase,2024-01-20
u002,visited_homepage,2024-01-20
u002,viewed_pricing,2024-01-20
u002,started_signup,2024-01-20
```

**Required columns:**
- `user_id` - Links to users.csv
- `step` - Funnel step name
- `completed_date` - When step was completed

## Kit-Specific Files

### For Marketing OS

`traffic.csv` - Traffic sources:
```csv
date,source,medium,campaign,visits,signups
2024-01-15,google,organic,,150,5
2024-01-15,google,cpc,launch-2024,80,12
2024-01-15,twitter,social,,45,2
```

### For Product OS

`retention.csv` - Pre-calculated retention:
```csv
cohort_week,cohort_size,week0,week1,week2,week3,week4
2024-W01,100,100,45,32,28,25
2024-W02,120,100,48,35,30,27
2024-W03,95,100,42,30,25,22
```

### For Support Team

`health_scores.csv` - User health data:
```csv
user_id,health_score,last_active,sessions_last_week,risk_level
u001,85,2024-02-10,5,low
u002,35,2024-01-25,1,high
u003,72,2024-02-08,3,medium
```

## Tips

1. **Date format:** Always use ISO format (YYYY-MM-DD)
2. **Empty values:** Leave cell empty, not "null" or "N/A"
3. **JSON in CSV:** Wrap JSON in quotes, escape inner quotes
4. **UTF-8:** Save files with UTF-8 encoding
5. **Headers:** First row must be column names

## Exporting from Other Tools

### From Google Analytics
1. Reports → Export → CSV
2. Rename columns to match expected format

### From Mixpanel
1. Insights → Export
2. Transform user_id and event format

### From Spreadsheet
1. File → Download → CSV
2. Ensure date columns are formatted correctly
