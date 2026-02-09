# Analytics Data Sources

Some kit features need user analytics data (retention, funnels, engagement, etc.). This guide explains how to provide that data.

## Supported Data Sources

### PostHog (Full Support)
- Open-source product analytics
- Free tier: 1M events/month
- Has MCP server - Claude can query your data directly
- EU hosting available (GDPR)
- Self-hosting option

**Setup:** See `data-sources/posthog/setup-sdk.md` and `data-sources/posthog/setup-mcp.md`

---

### Your Database (Full Support)
We can help write scripts to extract analytics from your database:

- **PostgreSQL** - SQL queries for retention, cohorts, funnels
- **Supabase** - Same as Postgres with RLS considerations
- **Firestore** - Python/Node scripts for document aggregation

**Templates:** See `data-sources/database/` folder

---

### CSV / Manual Data (Full Support)
You can paste or upload data directly:

- Export from any analytics tool
- Spreadsheet data
- Custom data sources

**Format:** See `data-sources/csv/expected-format.md`

---

### Other Analytics (Partial Support)
If you use another analytics platform, we can work with exported data:

- **Google Analytics** - Export to CSV
- **Mixpanel** - Export to CSV/JSON
- **Amplitude** - Export reports

We don't have direct integrations for these, but exported data works fine.

---

## No Data Yet?

If you haven't set up analytics:

1. **Kits still work** - We'll use industry benchmarks and assumptions
2. **Results will be less accurate** - Real data is always better
3. **Consider PostHog** - Quick to set up, generous free tier, MCP integration

---

## How Kits Use Data

| Kit | Data Needs |
|-----|------------|
| Marketing OS | Funnels, conversions, UTM tracking |
| Product OS | Retention curves, cohort analysis, feature usage |
| Support Team | Engagement scores, churn signals, activity trends |

Each kit asks different questions from the same data source.

---

## Detection

When a kit needs analytics data:

1. Checks `~/.aiorg/integrations/analytics.json` for existing setup
2. If found → uses existing configuration
3. If not → asks you to choose a data source

Once configured, all kits can use the same setup.
