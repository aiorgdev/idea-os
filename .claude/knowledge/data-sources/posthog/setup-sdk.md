# PostHog SDK Setup

This guide covers adding PostHog tracking to your web application.

> **Always check official docs first:** https://posthog.com/docs/libraries/next-js
>
> PostHog updates their SDK frequently. This guide provides general direction,
> but the official docs have the latest snippets and best practices.

## Recommended Approach

Based on our experience integrating PostHog into Next.js apps:

| Approach | Recommendation | Why |
|----------|---------------|-----|
| **HTML Snippet** | ✅ Recommended | Simpler, fewer edge cases, no hydration issues |
| React Provider | Works but complex | Client component requirements, potential double-init |
| **Reverse Proxy** | ✅ Essential | Ad blockers block posthog.com - route through your domain |

## 1. Create PostHog Account

1. Go to https://posthog.com
2. Sign up (free tier: 1M events/month)
3. Create a project
4. Copy your **Project API Key** (starts with `phc_`)

## 2. Get the Latest Snippet

**Do not copy snippets from this guide** - get the latest from PostHog:

1. Go to PostHog Dashboard → Settings → Project
2. Find "Web snippet" section
3. Copy the HTML snippet

Or visit: https://posthog.com/docs/libraries/next-js

## 3. Add to Next.js (Recommended: HTML Snippet)

```tsx
// app/layout.tsx
import Script from 'next/script'

export default function RootLayout({ children }: { children: React.ReactNode }) {
  return (
    <html>
      <head>
        <Script id="posthog" strategy="afterInteractive">
          {`
            // PASTE THE SNIPPET FROM POSTHOG DASHBOARD HERE
            // Don't use outdated snippets from guides
          `}
        </Script>
      </head>
      <body>{children}</body>
    </html>
  )
}
```

## 4. Environment Variables

```bash
# .env.local
NEXT_PUBLIC_POSTHOG_KEY=phc_your_key_here
NEXT_PUBLIC_POSTHOG_HOST=https://us.i.posthog.com  # or eu.i.posthog.com
```

## 5. Reverse Proxy (Essential for Ad Blockers)

Ad blockers block requests to `posthog.com`. Route through your domain:

### Vercel (next.config.js)

```javascript
// next.config.js
module.exports = {
  async rewrites() {
    return [
      {
        source: '/ingest/static/:path*',
        destination: 'https://us-assets.i.posthog.com/static/:path*',
      },
      {
        source: '/ingest/:path*',
        destination: 'https://us.i.posthog.com/:path*',
      },
    ]
  },
}
```

Then update your PostHog init to use `/ingest` as the host:

```javascript
posthog.init('phc_your_key', {
  api_host: '/ingest',  // Routes through your domain
  ui_host: 'https://us.posthog.com'
})
```

### Alternative: vercel.json

```json
{
  "rewrites": [
    {
      "source": "/ingest/static/:path*",
      "destination": "https://us-assets.i.posthog.com/static/:path*"
    },
    {
      "source": "/ingest/:path*",
      "destination": "https://us.i.posthog.com/:path*"
    }
  ]
}
```

## 6. Track Custom Events

```typescript
// After PostHog is loaded (check window.posthog exists)
if (typeof window !== 'undefined' && window.posthog) {
  // Track event
  window.posthog.capture('button_clicked', { button_name: 'signup' })

  // Identify user (after login)
  window.posthog.identify(userId, { email: user.email, plan: 'pro' })

  // Reset on logout
  window.posthog.reset()
}
```

## 7. Verify Installation

1. Open your app in browser
2. Open DevTools → Network tab
3. Look for requests to `/ingest` (if using reverse proxy) or `posthog.com`
4. Check PostHog dashboard → Activity tab for events

### Debugging

If events aren't showing:
- Check browser console for errors
- Verify environment variables are set
- Check if ad blocker is active (reverse proxy fixes this)
- Ensure `strategy="afterInteractive"` on Script tag

## Common Issues

| Issue | Solution |
|-------|----------|
| Events not tracking | Check reverse proxy config, verify env vars |
| Ad blocker blocking | Set up reverse proxy (step 5) |
| Double events | Remove duplicate init calls, check for React strict mode |
| Hydration errors | Use HTML snippet approach, not React Provider |

## Next Steps

After SDK is installed:
- Set up MCP server for Claude queries → See `setup-mcp.md`
- Configure user identification for better analytics
- Set up custom events for key actions (signup, purchase, etc.)
