# Analytics Detection

When a kit needs analytics data, it should check if analytics is already configured before asking the user to set it up again.

## Detection Order

Check in this order:

1. **Marker file** - `~/.aiorg/integrations/analytics.json`
2. **PostHog in project** - PostHog SDK in code
3. **CSV data** - `data/*.csv` files
4. **Database events** - Events table in schema
5. **No analytics** - Offer setup options

## Marker File

Location: `~/.aiorg/integrations/analytics.json`

```json
{
  "type": "posthog",
  "projectPath": "~/Projects/my-saas",
  "configured": true,
  "mcpAvailable": true,
  "configuredAt": "2024-01-15",
  "configuredBy": "marketing-os"
}
```

**Fields:**
- `type` - "posthog" | "database" | "csv" | "other"
- `projectPath` - Where analytics is set up
- `configured` - SDK/tracking is installed
- `mcpAvailable` - MCP server configured (PostHog only)
- `configuredAt` - ISO date
- `configuredBy` - Which kit set it up

## Detection Scripts

### Check Marker File

```bash
if [ -f ~/.aiorg/integrations/analytics.json ]; then
  type=$(jq -r '.type' ~/.aiorg/integrations/analytics.json)
  echo "Analytics configured: $type"
fi
```

### Check PostHog in Project

```bash
# Check package.json
if grep -q "posthog-js" package.json 2>/dev/null; then
  echo "PostHog SDK found in package.json"
fi

# Check for PostHog env vars
if grep -q "POSTHOG" .env* 2>/dev/null; then
  echo "PostHog environment variables found"
fi
```

### Check CSV Data

```bash
if [ -d "data" ] && ls data/*.csv 1>/dev/null 2>&1; then
  echo "CSV data files found"
fi
```

### Check Database Events

```bash
# Supabase migrations
if grep -q "user_events\|events" supabase/migrations/*.sql 2>/dev/null; then
  echo "Events table found in migrations"
fi
```

## Kit Behavior

### If Analytics Detected

```markdown
I see you have [PostHog/database/CSV] configured for analytics.
I can query this data to help with [specific kit purpose].

Would you like me to:
1. Run [specific analysis]
2. Show available queries
3. Use different data source
```

### If No Analytics

```markdown
Some features need analytics data to work. You have several options:

1. **PostHog** - Full support with MCP integration
2. **Your database** - Query your events table directly
3. **CSV files** - Manually provide data files
4. **Skip for now** - Use kit without analytics features

Which would you like to set up?
```

## Creating Marker File

When kit sets up analytics:

```bash
mkdir -p ~/.aiorg/integrations

cat > ~/.aiorg/integrations/analytics.json << EOF
{
  "type": "posthog",
  "projectPath": "$(pwd)",
  "configured": true,
  "mcpAvailable": true,
  "configuredAt": "$(date +%Y-%m-%d)",
  "configuredBy": "marketing-os"
}
EOF
```

## Cross-Kit Communication

When another kit runs:

1. Read marker file
2. If same project path → reuse configuration
3. If different project → ask user

```javascript
const marker = JSON.parse(
  fs.readFileSync('~/.aiorg/integrations/analytics.json')
)

if (marker.projectPath === process.cwd()) {
  // Same project - reuse
  console.log(`Using ${marker.type} analytics (configured by ${marker.configuredBy})`)
} else {
  // Different project - ask
  console.log('Analytics configured for different project. Set up for this project?')
}
```

## MCP Detection

For PostHog MCP:

```bash
# Check Claude settings for PostHog MCP
if grep -q "posthog" ~/.claude/settings.json 2>/dev/null; then
  echo "PostHog MCP configured"
fi

# Or check local project settings
if grep -q "posthog" .claude/settings.json 2>/dev/null; then
  echo "PostHog MCP configured locally"
fi
```
