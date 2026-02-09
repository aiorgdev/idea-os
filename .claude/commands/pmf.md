---
description: Calculate Product-Market Fit score by synthesizing all validation data
---

You are a startup advisor calculating a comprehensive Product-Market Fit score.

## CHECK PREREQUISITES

Read `config/validation-status.json`.

**Required for PMF assessment:**
- Idea defined: Required
- Research completed: Required
- Interviews: Minimum 5 (can proceed with warning if 3-4)
- Problem validation: Required
- Solution validation: Required
- Viability validation: Required

**If prerequisites not met:**
```
PMF Assessment Prerequisites
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[✓] Idea defined
[?] Research: [status]
[?] Interviews: [X]/5
[?] Problem validation: [status]
[?] Solution validation: [status]
[?] Viability validation: [status]

Missing steps:
├── [Missing item 1] → Run [command]
├── [Missing item 2] → Run [command]

Complete these before running /pmf for accurate assessment.
```

## PMF CALCULATION

### Step 1: Gather All Data

Read:
- `config/idea.md`
- `config/research-snapshot.json`
- `config/interviews.json`
- `config/customer.md`
- `validation/problem-validation.md`
- `validation/solution-validation.md`
- `validation/viability-validation.md`

### Step 2: Calculate PMF Score

```
PRODUCT-MARKET FIT ASSESSMENT
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Idea: [from idea.md]
Date: [today]

Data basis:
├── Competitors analyzed: [X]
├── Market research: Complete
├── Interviews conducted: [X]
└── Validation phases: 3/3 complete

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

VALIDATION SCORES
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

                        Score    Weight    Weighted
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
PROBLEM VALIDATION      [X]%     35%       [X]
├── Real                [X]/10
├── Painful             [X]/10
├── Frequent            [X]/10
└── Actively seeking    [X]/10
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
SOLUTION VALIDATION     [X]%     30%       [X]
├── Wanted              [X]/10
├── Better              [X]/10
├── Differentiated      [X]/10
└── Credibility         [X]/10
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
VIABILITY VALIDATION    [X]%     20%       [X]
├── Build               [X]/10
├── Sell                [X]/10
├── Make money          [X]/10
└── Defend              [X]/10
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
MARKET OPPORTUNITY      [X]%     15%       [X]
├── TAM relevance       [X]/10
├── SAM size            [X]/10
├── Growth rate         [X]/10
└── Timing              [X]/10
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

OVERALL PMF SCORE
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

     ┌───────────────────────────────────────────┐
     │                                           │
     │            [SCORE]/100                    │
     │                                           │
     │  ████████████████████░░░░░░░░░░░░░░░░░░░  │
     │                                           │
     └───────────────────────────────────────────┘

Score interpretation:
├── 80-100: Strong PMF signal
├── 60-79: Conditional - refinement needed
├── 40-59: Weak - consider pivot
└── 0-39: No PMF - stop or major pivot

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

DIMENSION BREAKDOWN
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

PROBLEM     ████████████████████░░░░░░░░░░░░  [X]%
SOLUTION    █████████████████░░░░░░░░░░░░░░░  [X]%
VIABILITY   ███████████████████████░░░░░░░░░  [X]%
MARKET      ████████████████████████████░░░░  [X]%

STRENGTHS (Top performing dimensions)
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

✓ [Highest scoring dimension]: [X]%
  Evidence: "[Key supporting quote or data point]"

✓ [Second highest]: [X]%
  Evidence: "[Evidence]"

WEAKNESSES (Improvement areas)
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

⚠️ [Lowest scoring dimension]: [X]%
   Concern: [Why this is weak]
   Impact: [How this affects success]

⚠️ [Second lowest]: [X]%
   Concern: [Why]
   Impact: [How]

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

KEY EVIDENCE
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

From [X] customer interviews:

Supporting quotes:
├── "[Strong validation quote]"
├── "[Another strong quote]"

Concerning quotes:
├── "[Quote that raises concerns]"

Interview statistics:
├── Problem confirmed: [X]/[total]
├── Solution interest: [X]/[total]
├── Willing to pay: [X]/[total]
├── Asked for availability: [X]/[total]

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

RECOMMENDATION
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Based on score, one of these:]

═══════════════════════════════════════════════════════

[If score >= 80:]

🟢 GO - STRONG PMF SIGNAL

Your idea shows strong product-market fit signals.
The evidence supports moving forward.

Recommended next steps:
1. Build MVP focusing on [core validated feature]
2. Start with [target segment from research]
3. Target [X] early users for beta
4. Key metric to track: [most relevant metric]

Caution areas to monitor:
├── [Weakness 1] - mitigate by [action]
├── [Weakness 2] - mitigate by [action]

═══════════════════════════════════════════════════════

[If score 60-79:]

🟡 CONDITIONAL GO - REFINEMENT NEEDED

Your idea has potential but needs work before full investment.

Key issues to address:
1. [Biggest weakness] - currently [X]%
   Fix: [Specific recommendation]

2. [Second weakness] - currently [X]%
   Fix: [Specific recommendation]

Recommended path:
├── Option A: Fix issues, then proceed
│   └── Timeline: [estimate]
│
├── Option B: Proceed with MVP but...
│   └── Scope: Limited to [validated segments]
│   └── Risk: [what could go wrong]
│
└── Option C: Run /pivot to explore alternatives

DO NOT: Invest heavily before addressing [key weakness]

═══════════════════════════════════════════════════════

[If score 40-59:]

🟠 WEAK PMF - CONSIDER PIVOT

Evidence does not support strong product-market fit.

Critical issues:
1. [Major problem]
2. [Major problem]

Honest assessment:
"[One paragraph explaining why this is unlikely to succeed
as currently defined]"

Recommended actions:
├── Run /pivot for pivot suggestions
├── Interview a different customer segment
├── Consider a different approach to the problem
└── Cut losses if no viable pivot found

DO NOT: Build without major changes to approach

═══════════════════════════════════════════════════════

[If score < 40:]

🔴 NO PMF - STOP OR MAJOR PIVOT

This idea does not show product-market fit.

The evidence shows:
├── [Issue 1 with evidence]
├── [Issue 2 with evidence]
├── [Issue 3 with evidence]

Honest assessment:
"[Why this idea is unlikely to succeed]"

Recommended actions:
├── STOP investing time/money in this specific approach
├── Run /pivot to explore completely different angles
├── Consider if a different problem is worth pursuing
└── Review /research for adjacent opportunities

This is valuable data. Failing fast saves resources
for better opportunities.

═══════════════════════════════════════════════════════

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

NEXT STEPS
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

/report - Generate full validation report (PDF-ready)
/risks - Identify key risks to monitor
/pivot - See pivot suggestions (if applicable)
```

### Step 3: Save Results

Update `config/validation-status.json`:
```json
{
  "pmfScored": true,
  "pmfScore": [score],
  "recommendation": "[GO/CONDITIONAL GO/WEAK/NO PMF]",
  "scoredAt": "[ISO date]"
}
```

Save PMF score to `config/pmf-score.json`:
```json
{
  "score": [score],
  "recommendation": "[GO/CONDITIONAL GO/WEAK/NO PMF]",
  "dimensions": {
    "problem": [X],
    "solution": [X],
    "viability": [X],
    "market": [X]
  },
  "scoredAt": "[ISO date]"
}
```

### Step 4: Update Shared Context (if linked to project)

Check if this installation is linked to a project:

```bash
cat .aiorg 2>/dev/null
```

If `.aiorg` exists, update the shared context:

```bash
PROJECT_NAME=$(cat .aiorg | grep '"project"' | cut -d'"' -f4)
CONTEXT_PATH="$HOME/.aiorg/projects/$PROJECT_NAME/context.json"
```

Read the context.json, update these fields, and write back:

```json
{
  "validation": {
    "ideaValidated": true,
    "ideaScore": [score],
    "targetCustomer": "[from config/customer.md or idea.md]",
    "valueProp": "[from config/idea.md - solution summary]",
    "validatedAt": "[ISO date]"
  },
  "business": {
    "stage": "[update based on recommendation: 'idea' if NO PMF, 'building' if CONDITIONAL or GO]"
  },
  "lastUpdated": "[ISO date]",
  "updatedBy": "idea-os"
}
```

**Important:** Preserve all other fields in context.json. Only update the fields listed above.

If score >= 70 (GO or CONDITIONAL GO), show handoff suggestion:

```
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

CROSS-KIT RECOMMENDATION
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Your idea is validated! When you're ready to build and launch:

→ Product OS: Track product-market fit after launch
  Run: npx @aiorg/cli init product-os ~/your-project
  Or: https://aiorg.dev/kits/product-os

→ Marketing OS: Get your first users
  Run: npx @aiorg/cli init marketing-os ~/your-marketing
  Or: https://aiorg.dev/kits/marketing-os

Your validation data will be shared automatically.
```

## SCORING METHODOLOGY

**Weight justification:**
- Problem (35%): Without a real problem, nothing else matters
- Solution (30%): The solution must resonate with customers
- Viability (20%): Can you actually build and sell this?
- Market (15%): Important but less critical for early stage

**Market opportunity scoring:**
- TAM relevance: Is TAM meaningful for your business type?
- SAM size: Is serviceable market large enough?
- Growth rate: Is market growing or declining?
- Timing: Is now a good time to enter?

## NOTES

- PMF is not binary - it's a spectrum
- Scores are based on evidence, not hope
- Be honest - founders benefit from truth
- Low scores are valuable data, not failure
- Recommend concrete next steps for any score
