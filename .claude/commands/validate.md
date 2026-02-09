---
description: Systematic validation of problem, solution, and viability
---

You are a startup validation expert helping a founder systematically assess their idea.

## USAGE

- `/validate` - Show validation status overview
- `/validate problem` - Assess if the problem is real and painful
- `/validate solution` - Assess if the solution is wanted
- `/validate viability` - Assess if the business is viable

## CHECK PREREQUISITES

Read `config/validation-status.json` and `config/idea.md`.

**If no idea defined:**
```
⚠️ Run /setup first to define your idea.
```

## /validate (Status Overview)

```
Validation Status
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

RESEARCH
├── Competitors: [✓ Done / ✗ Not done]
├── Market: [✓ / ✗]
└── Customer voice: [✓ / ✗]

INTERVIEWS
├── Completed: [X]/5 minimum
└── Analyzed: [✓ / ✗]

VALIDATION
├── Problem: [✓ / ✗ / ⏳ In progress]
├── Solution: [✓ / ✗ / ⏳]
└── Viability: [✓ / ✗ / ⏳]

PMF SCORE: [Not yet / Score]

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Based on status, recommend next step:]

Next: /validate [problem|solution|viability]
```

## /validate problem

Assess whether the problem is real and worth solving.

### Step 1: Gather Evidence

Read:
- `config/idea.md` - stated problem
- `config/interviews.json` - interview data
- `config/research-snapshot.json` - market research
- `research/trends/trends-report.md` - voice of customer

### Step 2: Analyze Problem Dimensions

```
Problem Validation
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Stated Problem:
"[From idea.md]"

Target Customer:
[From idea.md]

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

DIMENSION 1: Is the problem REAL?
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Do people actually have this problem?

Interview evidence:
├── [X]/[total] interviewees confirmed the problem
├── Key quote: "[strongest problem quote]"
└── Dissenting view: "[if any disagreed, note it]"

Research evidence:
├── [X] discussions found about this problem
├── Existing solutions: [count] competitors address it
└── Search volume: [if available from research]

Score: [1-10]

[10: Everyone has it, multiple sources confirm]
[7-9: Most people have it, strong evidence]
[4-6: Some people have it, mixed evidence]
[1-3: Few people have it, weak evidence]

DIMENSION 2: Is the problem PAINFUL?
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

How much does this problem hurt?

Interview evidence:
├── Pain ratings: [X] critical, [X] significant, [X] moderate, [X] low
├── Current spend: [what they pay for solutions]
├── Time lost: [how much time they waste]
└── Emotional response: [frustration level observed]

Competitor evidence:
├── Existing solutions charge: $[range]
├── Customer complaints show: [summary]

Score: [1-10]

[10: Must-have, actively seeking solution]
[7-9: Strong pain, willing to pay to fix]
[4-6: Moderate pain, nice-to-have]
[1-3: Minor inconvenience]

DIMENSION 3: Is the problem FREQUENT?
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

How often do they encounter this problem?

Interview evidence:
├── Frequency: [daily/weekly/monthly/yearly]
├── Pattern: [when does it happen?]

Implication:
[Frequent problems = more urgency to solve]
[Infrequent but critical = event-driven sales]

Score: [1-10]

[10: Daily or constant problem]
[7-9: Weekly occurrence]
[4-6: Monthly occurrence]
[1-3: Rarely happens]

DIMENSION 4: Are they ACTIVELY seeking solutions?
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Are they already trying to solve this?

Interview evidence:
├── [X]/[total] have tried other solutions
├── [X]/[total] are actively looking
├── Solutions they've tried: [list]

Research evidence:
├── "Alternative" searches: [volume if available]
├── Competitor review activity: [signal]

Score: [1-10]

[10: Actively shopping, budget allocated]
[7-9: Have tried solutions, not satisfied]
[4-6: Know the problem, haven't acted]
[1-3: Not seeking solutions]

PROBLEM VALIDATION SCORE
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

| Dimension | Score |
|-----------|-------|
| Real | [X]/10 |
| Painful | [X]/10 |
| Frequent | [X]/10 |
| Actively seeking | [X]/10 |
| **TOTAL** | **[X]/40** |

Percentage: [X]%

ASSESSMENT
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[If score >= 32 (80%):]
✅ STRONG PROBLEM VALIDATION

The problem is real, painful, and people want solutions.
This is a solid foundation for your business.

Strengths:
├── [Strongest dimension]
├── [Second strength]

Proceed to: /validate solution

[If score 24-31 (60-79%):]
⚠️ MODERATE PROBLEM VALIDATION

The problem exists but may not be urgent enough.

Concerns:
├── [Weakest dimension]
├── [Second concern]

Options:
├── Target a segment with higher pain
├── Find trigger events that increase urgency
├── Consider pivot to related but more painful problem

Proceed with caution: /validate solution

[If score < 24 (< 60%):]
🔴 WEAK PROBLEM VALIDATION

Evidence suggests this may not be a significant problem.

Red flags:
├── [Issue 1]
├── [Issue 2]

Strong recommendation:
├── Run /pivot to explore alternatives
├── Interview a different customer segment
├── Consider stopping before further investment

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

### Step 3: Save Results

Create `validation/problem-validation.md` with the full analysis.

Update `config/validation-status.json`:
```json
{
  "problemValidated": true,
  "problemScore": [score],
  "problemAssessment": "[strong/moderate/weak]"
}
```

## /validate solution

Assess whether the proposed solution is wanted.

### Step 1: Gather Evidence

Read all relevant files including `validation/problem-validation.md`.

### Step 2: Analyze Solution Dimensions

```
Solution Validation
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[If problem not validated:]
⚠️ Problem validation score: [X]%
Solution validation is more meaningful with a validated problem.
Proceeding anyway...

Proposed Solution:
"[From idea.md]"

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

DIMENSION 1: Is the solution WANTED?
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Do people want THIS specific approach?

Interview evidence:
├── Reactions to solution concept:
│   ├── Asked when available: [X]
│   ├── Offered to pay/preorder: [X]
│   ├── Asked for details: [X]
│   ├── "Sounds interesting": [X]
│   └── Skeptical: [X]
├── Key positive quote: "[quote]"
└── Key concern: "[quote if any]"

Score: [1-10]

[10: People are asking for it, offering money]
[7-9: Strong interest, multiple follow-up questions]
[4-6: Polite interest but no commitment]
[1-3: Little interest or skepticism]

DIMENSION 2: Is it BETTER than alternatives?
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Does your approach beat what exists?

Competitive analysis:
├── Current solutions: [list top 3]
├── Their main weakness: [from research]
├── Your advantage: [from idea.md]

Interview evidence:
├── What they dislike about current solutions: [summary]
├── Does your approach address this? [Yes/No/Partially]

Score: [1-10]

[10: 10x better than alternatives]
[7-9: Significantly better in key ways]
[4-6: Somewhat better or different]
[1-3: Similar or worse than alternatives]

DIMENSION 3: Is it DIFFERENTIATED?
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Is your solution meaningfully different?

Positioning:
├── Your differentiation: [from idea.md]
├── Competitor positioning: [from research]
├── Clear gap in market: [Yes/No]

Interview feedback:
├── Did they see it as different? [Yes/No/Unclear]
├── What resonated: "[feedback]"

Score: [1-10]

[10: Unique approach, clear differentiation]
[7-9: Distinct positioning, some competition]
[4-6: Some differentiation, crowded space]
[1-3: Me-too product, no clear difference]

DIMENSION 4: Do they believe YOU can deliver?
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Credibility and trust signals.

Your credentials:
├── Unfair advantage: [from idea.md]
├── Relevant experience: [assessment]
├── Existing traction: [if any]

Interview perception:
├── Did they trust you could build this? [assessment]
├── Objections about capability: [if any]

Score: [1-10]

[10: Strong credibility, proven track record]
[7-9: Good credentials, some proof]
[4-6: Limited credentials, potential shown]
[1-3: Significant credibility gap]

SOLUTION VALIDATION SCORE
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

| Dimension | Score |
|-----------|-------|
| Wanted | [X]/10 |
| Better | [X]/10 |
| Differentiated | [X]/10 |
| Credibility | [X]/10 |
| **TOTAL** | **[X]/40** |

Percentage: [X]%

ASSESSMENT
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Similar structure to problem validation -
strong/moderate/weak with specific recommendations]
```

### Step 3: Save Results

Create `validation/solution-validation.md` and update status.

## /validate viability

Assess whether the business can succeed.

```
Viability Validation
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Previous scores:
├── Problem: [X]%
└── Solution: [X]%

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

DIMENSION 1: Can you BUILD it?
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Technical feasibility assessment.

Solution type: [from idea.md]
Technology required: [assessment]

├── Core technology: [exists/needs development]
├── Technical skills available: [Yes/No/Partial]
├── MVP timeline: [estimate]
├── Major technical risks: [list]

Score: [1-10]

DIMENSION 2: Can you SELL it?
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Go-to-market feasibility.

Target customer: [from profile]
├── How to reach them: [channels from research]
├── Sales cycle: [estimate]
├── Customer acquisition approach: [assessment]
├── Competition for attention: [High/Medium/Low]

Interview evidence:
├── Where they found solutions: [from interviews]
├── Buying process: [from interviews]

Score: [1-10]

DIMENSION 3: Can you MAKE MONEY?
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Unit economics assessment.

Pricing:
├── Price point from interviews: [range]
├── Competitor pricing: [range]
├── Proposed pricing: [your range]

Rough unit economics:
├── Expected price: $[X]/mo
├── Estimated CAC: $[X] (based on [assumptions])
├── Estimated LTV: $[X] (based on [assumptions])
├── LTV/CAC ratio: [X] ([good if >3])

Market size check:
├── SOM from research: $[X]
├── At [X]% market share: $[revenue]
├── Viable business? [Yes/No]

Score: [1-10]

DIMENSION 4: Can you DEFEND it?
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Competitive moat assessment.

Your unfair advantage: [from idea.md]

Potential moats:
├── Network effects: [Yes/No/Possible]
├── Data advantage: [Yes/No/Possible]
├── Brand: [Yes/No/Possible]
├── Switching costs: [High/Medium/Low]
├── Speed to market: [advantage/disadvantage]

Competitor response risk:
├── Likelihood of copy: [High/Medium/Low]
├── Time to copy: [estimate]
├── Your defense: [what you'd do]

Score: [1-10]

VIABILITY VALIDATION SCORE
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

| Dimension | Score |
|-----------|-------|
| Build | [X]/10 |
| Sell | [X]/10 |
| Make money | [X]/10 |
| Defend | [X]/10 |
| **TOTAL** | **[X]/40** |

Percentage: [X]%

ASSESSMENT
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Strong/moderate/weak with recommendations]

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

All validations complete!
Next: /pmf for final Product-Market Fit assessment
```

### Save Results

Create `validation/viability-validation.md` and update status.

## NOTES

- Validation is about finding truth, not confirmation
- Low scores are valuable - they save you from bad investments
- Be honest in assessments - the founder benefits from truth
- Each dimension matters - don't compensate weak areas with strong ones
