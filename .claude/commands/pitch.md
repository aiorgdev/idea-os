---
description: Generate one-pager pitch summary for customer conversations
---

You are a product marketer helping a founder create a concise pitch document for customer conversations.

## USAGE

- `/pitch` - Generate complete one-pager
- `/pitch refresh` - Regenerate with latest research data

## CHECK PREREQUISITES

**Required:**
- `config/idea.md` - The idea definition

**Recommended (for better pitch):**
- `config/research-snapshot.json` - Market data
- `research/competitors/*.md` - For differentiation points
- `research/market/market-analysis.md` - For market context

**If idea.md doesn't exist:**
```
⚠️ No idea defined yet.

Run /setup first to define your idea.
I need to understand your product to create a pitch.
```

## GENERATION PRINCIPLES

1. **Be concise** - One page max, scannable in 2 minutes
2. **Lead with problem** - Start with pain, not solution
3. **Use customer language** - Words from research, not marketing speak
4. **Show differentiation** - Why you vs competitors
5. **Include pricing context** - Based on competitor research
6. **End with clear ask** - What you want from the conversation

## GENERATE ONE-PAGER

Read all available context files, then generate:

```
Generating Pitch One-Pager
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Analyzing:
├── Your idea definition
├── Competitor landscape
├── Market data
└── Customer voice

Creating pitch...
```

## ONE-PAGER TEMPLATE

Save to `pitch/one-pager.md`:

```markdown
# [Product Name]

**[Tagline - one compelling sentence that captures the value]**

---

## The Problem

[2-3 sentences describing the pain point. Use specific, concrete language.
Include a stat or quote if available from research.]

**Who feels this pain:** [Target customer in one sentence]

**Current solutions fail because:** [Why existing options don't work - from competitor analysis]

---

## Our Solution

[One paragraph - what you're building and how it solves the problem.
Focus on the outcome, not features. What does the user GET?]

**Key differentiator:** [The ONE thing that makes you different - from gaps analysis]

---

## Why Now?

[2-3 bullet points on why this is the right time - from market research]

- [Market trend 1]
- [Market trend 2]
- [Regulatory/technology change if applicable]

---

## The Market

| Metric | Value |
|--------|-------|
| TAM | $[X] |
| SAM | $[X] |
| Target Segment | [Who you're starting with] |

---

## Competition & Positioning

**Main competitors:**
- [Competitor 1] - [their approach/weakness]
- [Competitor 2] - [their approach/weakness]
- [Competitor 3] - [their approach/weakness]

**Our positioning:**
"Unlike [competitors], we [key differentiator] for [target customer]."

---

## Pricing Thinking

Based on competitor pricing ($[X] - $[Y]/mo), we're considering:

| Plan | Price | For Who |
|------|-------|---------|
| [Tier 1] | $[X]/mo | [Segment] |
| [Tier 2] | $[X]/mo | [Segment] |

*This is early thinking - we'd love your feedback.*

---

## Why Us?

[Founder's unfair advantage from idea.md - why YOU can build this]

---

## What We're Looking For

We're in the validation phase and would love:

- [ ] Your honest feedback on this concept
- [ ] Introduction to others who have this problem
- [ ] [Optional: early beta testers / design partners]

**Not selling anything** - just learning.

---

*[Your name] | [Email/contact]*
*[Date]*
```

## AFTER GENERATING

Update `config/validation-status.json`:
```json
{
  "pitchGenerated": true,
  "pitchGeneratedAt": "[ISO date]"
}
```

Show summary:
```
One-Pager Created!
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Saved to: pitch/one-pager.md

WHAT'S INCLUDED
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
• Problem statement (from your idea)
• Solution overview
• Market context (from research)
• Competitor positioning
• Pricing hypothesis
• Clear ask

HOW TO USE THIS
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Option 1: Share before meeting
└── "Here's what we're thinking - would love your reaction"

Option 2: Reference during conversation
└── Don't read it - use as talking points

Option 3: Leave behind after meeting
└── "Here's a summary of what we discussed"

TIPS
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
• Don't pitch at the START of conversations
• First understand THEIR situation
• Only share this after you've listened
• Watch their reaction - what do they focus on?

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Next steps:
├── /mockup - Create visual wireframes (if not done)
└── /interviews setup - Get Mom Test questions
```

## /pitch refresh

Re-read all files and regenerate the one-pager:

```
Refreshing Pitch
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Incorporating latest data...

Updated with:
├── [X] new competitor insights
├── [X] interview quotes (if available)
└── Market data refresh

Saved to: pitch/one-pager.md
```

## NOTES FOR CLAUDE

- Use ACTUAL data from research files, not placeholders
- If research not done, still create pitch but note it's based on assumptions
- Keep language conversational, not corporate
- Pricing should reflect actual competitor pricing if researched
- The "Why Us" section should use the founder's actual advantage from setup
- Make it feel personal, not templated
- If interviews have been done, incorporate quotes or insights
