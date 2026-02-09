# PostHog MCP Server Setup

The PostHog MCP server lets Claude query your analytics data directly. This is a one-time setup per machine.

## 1. Get Your API Key

1. Go to PostHog → Settings → Personal API Keys
2. Create a new key with read access
3. Copy the key (starts with `phx_`)

Note: This is different from your Project API Key (`phc_`). You need a Personal API Key for the MCP server.

## 2. Configure Claude Code

Add to your Claude Code settings:

### Option A: Claude Desktop (settings.json)

```json
{
  "mcpServers": {
    "posthog": {
      "command": "npx",
      "args": ["-y", "@anthropic/posthog-mcp"],
      "env": {
        "POSTHOG_API_KEY": "phx_your_personal_api_key",
        "POSTHOG_HOST": "https://us.i.posthog.com"
      }
    }
  }
}
```

### Option B: Claude CLI (.claude/settings.json)

Same format as above, in your project or global settings.

## 3. Verify

Start Claude Code and ask:

> "List my PostHog projects"

or

> "Show me pageviews from the last 7 days"

If it works, you'll see your analytics data.

## 4. Common Queries

Once configured, you can ask Claude:

**Funnels:**
- "Show conversion funnel from signup to purchase"
- "What's the drop-off rate at each checkout step?"

**Retention:**
- "Show 7-day retention for users who signed up last month"
- "Which cohort has the best retention?"

**Engagement:**
- "Who are my most active users this week?"
- "Which features are most used?"

**Trends:**
- "How has daily active users changed over time?"
- "Compare this week to last week"

## Troubleshooting

### "No projects found"
- Check your API key has read access
- Verify the host matches your PostHog region (us vs eu)

### "Permission denied"
- Your Personal API Key needs project read access
- Create a new key with appropriate permissions

### MCP server not starting
- Make sure Node.js is installed
- Try running manually: `npx -y @anthropic/posthog-mcp`
