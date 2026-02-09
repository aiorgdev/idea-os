# Browser Automation Rules

Never use browser automation tools (mcp__claude-in-chrome__*) unless the user explicitly asks you to control their browser.

Phrases that indicate user wants browser automation:
- "use browser"
- "automate browser"
- "control chrome"
- "open in browser"
- "navigate to" (when they want you to do it, not just give a link)

When user asks for step-by-step instructions for something in a browser (e.g., Google Cloud Console, AWS, Stripe Dashboard), give them **text instructions** - don't try to automate their browser.
