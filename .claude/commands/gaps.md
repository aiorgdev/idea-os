---
description: Find market gaps and underserved segments based on competitor analysis
---

You are a strategic analyst helping a founder find opportunities in the market.

## CHECK PREREQUISITES

Read `config/research-snapshot.json` to see if research is complete.

**If no research:**
```
⚠️ Run /research first.

Gap analysis requires competitor and market data.
I need to know what exists before finding what's missing.
```

## ANALYSIS PROCESS

### Step 1: Load Research Data

Read:
- `config/research-snapshot.json` - summary data
- `research/competitors/*.md` - all competitor analyses
- `research/trends/trends-report.md` - voice of customer

### Step 2: Identify Gaps

Analyze across dimensions:

**Feature Gaps:**
- What features do customers request that no one provides?
- What are common complaints about existing features?

**Segment Gaps:**
- Who is underserved by current solutions?
- Who can't afford or access existing options?

**Geographic Gaps:**
- Are there regions without localized solutions?
- Are there market-specific needs not addressed?

**Price Gaps:**
- Is there room for a cheaper alternative?
- Is there room for a premium alternative?

**Experience Gaps:**
- Are existing solutions too complex?
- Are they too simplistic?

**Integration Gaps:**
- What tools don't existing solutions connect with?
- What workflows are broken?

### Step 3: Display Analysis

```
Market Gap Analysis
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Based on:
├── [X] competitors analyzed
├── [X] customer discussions reviewed
└── Market research completed [date]

FEATURE GAPS
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Missing features that customers want:

1. [Feature Gap 1]

   Evidence:
   ├── "[Quote from customer/review]"
   ├── Competitors who lack this: [list]
   └── Opportunity size: [High/Medium/Low]

2. [Feature Gap 2]

   Evidence:
   ├── "[Quote]"
   ├── Competitors who lack this: [list]
   └── Opportunity size: [level]

SEGMENT GAPS
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Underserved customer segments:

1. [Segment 1]

   Why underserved:
   ├── Current solutions target [other segment]
   ├── Price point too high/low for them
   └── Their specific needs: [needs]

   Opportunity: [description]

2. [Segment 2]
   [details]

PRICE GAPS
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Current pricing landscape:

| Tier | Players | Gap? |
|------|---------|------|
| Free | [who]   | [Y/N]|
| $10-30/mo | [who] | [Y/N]|
| $30-100/mo | [who] | [Y/N]|
| $100+/mo | [who] | [Y/N]|
| Enterprise | [who] | [Y/N]|

Pricing opportunity:
[Analysis of where there's room]

EXPERIENCE GAPS
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

UX/simplicity issues:

1. [Experience Gap]

   Problem: "[What users complain about]"
   Current state: [How competitors handle it]
   Opportunity: [How you could be better]

GEOGRAPHIC GAPS
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[If relevant to their market]

| Region | Coverage | Opportunity |
|--------|----------|-------------|
| [Region 1] | [High/Med/Low] | [description] |
| [Region 2] | [level] | [description] |

TOP OPPORTUNITIES
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Based on gap analysis, here are your best opportunities:

🥇 #1: [Top Gap]
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Why this is your best opportunity:
├── Demand evidence: [strong signals]
├── Competition: [weak coverage]
├── Your fit: [why you can win here]
└── Market size: [portion of SAM]

Suggested positioning:
"[How to position around this gap]"

🥈 #2: [Second Gap]
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Similar analysis]

🥉 #3: [Third Gap]
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Similar analysis]

ANTI-GAPS (Traps to Avoid)
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Gaps that look good but aren't:

⚠️ [Trap 1]
   Looks like opportunity because: [reason]
   Actually problematic because: [reason]

⚠️ [Trap 2]
   [similar analysis]

RECOMMENDED FOCUS
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Based on:
├── Your idea: [from idea.md]
├── Your advantage: [from idea.md]
└── Market gaps: [this analysis]

I recommend focusing on:

[Specific recommendation combining their idea with best gap]

This gives you:
├── Clear differentiation from [competitors]
├── Addresses real customer need ([evidence])
└── Realistic market size: $[X] (portion of SAM)

Validate this in customer interviews:
├── Ask about [specific pain related to gap]
├── Test if [gap] is really a priority
└── Confirm willingness to pay for [solution to gap]

Run /interviews setup to prepare questions around this focus.
```

## NOTES

- Gaps are only opportunities if customers care AND will pay
- The best gaps match the founder's unfair advantage
- Watch for "graveyard gaps" - things many have tried and failed
- Validate gaps in interviews before committing
