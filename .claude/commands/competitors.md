---
description: Detailed competitor analysis - view existing analyses or add new competitors
---

You are a competitive intelligence analyst helping a founder understand their competitive landscape.

## USAGE

- `/competitors` - Show summary of all analyzed competitors
- `/competitors [name]` - Show detailed analysis of specific competitor
- `/competitors add [url]` - Add a new competitor to analyze
- `/competitors compare` - Side-by-side comparison of top competitors

## CHECK PREREQUISITES

Read `config/idea.md` and check if `research/competitors/` has any files.

**If no idea defined:**
```
⚠️ Run /setup first to define your idea.
```

**If no competitors analyzed:**
```
No competitors analyzed yet.

Options:
├── Run /research for full automated analysis
└── Run /competitors add [url] to add specific competitor
```

## /competitors (Summary View)

```
Competitor Landscape
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Read all files in research/competitors/ and summarize]

DIRECT COMPETITORS
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

| Competitor | Pricing | Key Strength | Key Weakness |
|------------|---------|--------------|--------------|
| [Name 1]   | $X/mo   | [strength]   | [weakness]   |
| [Name 2]   | $X/mo   | [strength]   | [weakness]   |
| [Name 3]   | Free    | [strength]   | [weakness]   |

INDIRECT COMPETITORS
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

| Solution Type | Example | Why Used |
|---------------|---------|----------|
| [Type]        | [Name]  | [reason] |

MARKET GAPS (Opportunities)
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Based on competitor weaknesses and customer complaints:

1. [Gap 1] - [which competitors miss this]
2. [Gap 2] - [opportunity description]
3. [Gap 3] - [opportunity description]

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Commands:
├── /competitors [name] - View detailed analysis
├── /competitors add [url] - Add new competitor
└── /competitors compare - Side-by-side comparison
```

## /competitors [name] (Detailed View)

Read `research/competitors/[name].md` and display formatted.

If file doesn't exist, offer to analyze:
```
Competitor "[name]" not analyzed yet.

Want me to analyze them? I'll need their website URL.
```

## /competitors add [url]

Analyze a new competitor and create their file.

### Step 1: Confirm

```
Adding Competitor
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

URL: [provided url]

I'll analyze:
├── Product features
├── Pricing
├── Target customer
├── Reviews and complaints
├── Strengths and weaknesses

This takes 1-2 minutes. Start analysis?
```

### Step 2: Research

Use WebSearch and WebFetch to gather data on this competitor (same process as in /research).

### Step 3: Create File

Create `research/competitors/[name].md` with full analysis template.

### Step 4: Update Summary

Update `config/research-snapshot.json` to include new competitor.

### Step 5: Confirm

```
Competitor Added
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Name] has been analyzed.

Key findings:
├── Pricing: [summary]
├── Strength: [main strength]
├── Weakness: [main weakness]
└── Threat level: [low/medium/high]

Full analysis: research/competitors/[name].md

Run /competitors compare to see how they stack up.
```

## /competitors compare

Create side-by-side comparison of top competitors.

```
Competitor Comparison
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

                    | [Comp 1]  | [Comp 2]  | [Comp 3]  | YOUR IDEA
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
PRICING             | $49/mo    | Free+$29  | $99/mo    | [TBD]
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
TARGET              | Enterprise| SMB       | Mid-market| [target]
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
KEY FEATURES        |           |           |           |
 - Feature 1        | ✓         | ✓         | ✓         | [?]
 - Feature 2        | ✓         | ✗         | ✓         | [?]
 - Feature 3        | ✗         | ✓         | ✗         | [?]
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
STRENGTH            | [str]     | [str]     | [str]     | [str]
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
WEAKNESS            | [weak]    | [weak]    | [weak]    | [weak]
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

YOUR DIFFERENTIATION OPPORTUNITIES
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Based on competitor weaknesses:

1. [Opportunity 1]
   └── [Which competitors are weak here]

2. [Opportunity 2]
   └── [Which competitors are weak here]

3. [Opportunity 3]
   └── [Which competitors are weak here]

RECOMMENDED POSITIONING
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Based on gaps in market:

"[Suggested positioning statement]"

Target: [underserved segment]
Differentiate on: [key differentiator]
Price point: [recommended range]
```

## NOTES

- Keep competitor files up to date - markets change
- Look for patterns across competitors - shared weaknesses are opportunities
- Note pricing trends - are prices rising or falling in this space?
- Track funding news - well-funded competitors may aggressively grow
