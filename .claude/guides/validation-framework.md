# Validation Framework Guide

A complete framework for validating business ideas systematically.

## Why Validate?

Most startups fail because they build something nobody wants.

Validation answers one question: **Should you invest your time and money in this idea?**

It's not about proving your idea is good. It's about finding the truth - good or bad - as quickly as possible.

## The Validation Spectrum

Validation isn't binary. It's a spectrum:

```
NO PMF ←────────────────────────────────→ STRONG PMF
   0        25        50        75        100

0-39:  No PMF - Stop or major pivot
40-59: Weak - Consider pivot
60-79: Conditional - Needs refinement
80-100: Strong - Proceed with confidence
```

## The Five Dimensions

Idea OS validates across five dimensions:

### 1. Problem Validation (Weight: 35%)

**Question:** Is this a real, painful problem that people want to solve?

**Sub-dimensions:**
- **Real** - Do people actually have this problem?
- **Painful** - How much does it hurt?
- **Frequent** - How often does it occur?
- **Seeking** - Are they actively looking for solutions?

**Evidence sources:**
- Customer interviews
- Online discussions (Reddit, forums)
- Existing solutions (proves demand)
- Search volume (people looking for help)

**Scoring guide:**

| Score | Meaning |
|-------|---------|
| 9-10 | Problem is critical; people urgently need solution |
| 7-8 | Problem is significant; willing to pay to fix |
| 5-6 | Problem exists but manageable; nice-to-have |
| 3-4 | Minor inconvenience; low priority |
| 1-2 | Not really a problem for most people |

### 2. Solution Validation (Weight: 30%)

**Question:** Is your specific solution wanted and better than alternatives?

**Sub-dimensions:**
- **Wanted** - Do people want this approach?
- **Better** - Is it better than existing solutions?
- **Differentiated** - Is it meaningfully different?
- **Credible** - Do they believe you can deliver?

**Evidence sources:**
- Customer reactions to solution concept
- Comparison to competitor weaknesses
- Feature requests in competitor reviews
- Your unique capabilities

**Scoring guide:**

| Score | Meaning |
|-------|---------|
| 9-10 | People asking when they can buy; offering money |
| 7-8 | Strong interest; asking detailed questions |
| 5-6 | Polite interest; "sounds interesting" |
| 3-4 | Skepticism; many objections |
| 1-2 | No interest; prefer current solutions |

### 3. Viability Validation (Weight: 20%)

**Question:** Can you build this business?

**Sub-dimensions:**
- **Build** - Can you create the product?
- **Sell** - Can you reach customers?
- **Make money** - Do unit economics work?
- **Defend** - Can you maintain advantage?

**Evidence sources:**
- Technical assessment
- Go-to-market analysis
- Pricing research
- Competitive moat analysis

**Scoring guide:**

| Score | Meaning |
|-------|---------|
| 9-10 | Clear path to build, sell, and profit |
| 7-8 | Achievable with reasonable effort |
| 5-6 | Possible but challenging |
| 3-4 | Significant obstacles |
| 1-2 | Major barriers to success |

### 4. Market Validation (Weight: 15%)

**Question:** Is the market attractive?

**Sub-dimensions:**
- **TAM relevance** - Is total market meaningful?
- **SAM size** - Is serviceable market large enough?
- **Growth rate** - Is market growing?
- **Timing** - Is now a good time?

**Evidence sources:**
- Market research reports
- Industry publications
- Trend analysis
- Competitor traction

**Scoring guide:**

| Score | Meaning |
|-------|---------|
| 9-10 | Large, growing market with favorable timing |
| 7-8 | Good market size and growth |
| 5-6 | Adequate market, moderate growth |
| 3-4 | Small or declining market |
| 1-2 | Tiny market or bad timing |

## The Validation Process

### Phase 1: Define (Day 1)

**Goal:** Clearly articulate your idea

**Activities:**
- Define the problem
- Define your solution
- Define target customer
- List known competitors

**Output:** `config/idea.md`

**Command:** `/setup`

### Phase 2: Research (Days 2-3)

**Goal:** Understand the market landscape

**Activities:**
- Competitor analysis
- Market sizing
- Voice of customer research
- Gap identification

**Output:**
- `research/competitors/*.md`
- `research/market/market-analysis.md`
- `research/trends/trends-report.md`

**Command:** `/research`

### Phase 3: Discover (Days 4-10)

**Goal:** Validate with real customers

**Activities:**
- Prepare interview questions
- Conduct 5-10 interviews
- Log and analyze findings

**Output:** `config/interviews.json`

**Commands:** `/interviews setup`, `/interviews add`, `/interviews analyze`

### Phase 4: Validate (Days 11-12)

**Goal:** Systematically score the opportunity

**Activities:**
- Problem validation
- Solution validation
- Viability validation

**Output:** `validation/*.md`

**Commands:** `/validate problem`, `/validate solution`, `/validate viability`

### Phase 5: Decide (Day 13)

**Goal:** Make a go/no-go decision

**Activities:**
- Calculate PMF score
- Review risks
- Make recommendation

**Output:** PMF score and recommendation

**Commands:** `/pmf`, `/risks`, `/report`

## Evidence Quality

Not all evidence is equal:

### Strong Evidence

- Direct quotes from interviews
- Existing spending on solutions
- Commitment signals (deposits, intros)
- Multiple sources confirming same thing
- Quantified data (numbers, frequency)

### Weak Evidence

- "Would you use..." answers
- Second-hand information
- Single data point
- Your own assumptions
- Hypothetical scenarios

### No Evidence

- "I think..." without data
- Guesses about customer behavior
- Projection from personal experience
- What competitors claim (unverified)

## Common Validation Mistakes

### 1. Confirmation Bias

**Problem:** Hearing what you want to hear

**Fix:** Actively seek disconfirming evidence. Ask "What would make you NOT use this?"

### 2. Wrong Customers

**Problem:** Interviewing friends, family, or non-buyers

**Fix:** Interview people who have the problem AND can make buying decisions

### 3. Skipping Problem Validation

**Problem:** Assuming the problem is real because you have it

**Fix:** Always validate the problem first. If the problem isn't real, the solution doesn't matter.

### 4. Solution First

**Problem:** Building before validating

**Fix:** Follow the process. Research → Interviews → Validation → Build

### 5. Vanity Metrics

**Problem:** Counting "interested" as validation

**Fix:** Look for commitment signals: money, time, introductions

### 6. One-and-Done

**Problem:** Validating once, then ignoring new data

**Fix:** Validation is ongoing. Update as you learn.

## When to Stop

### Stop Signals

Consider stopping or major pivot when:
- Problem validation < 50%
- No one offers commitment after 10 interviews
- Every competitor is well-funded and growing fast
- Unit economics can't work at any price
- You've lost passion for the problem

### Pivot Signals

Consider pivot when:
- Problem is real but your solution isn't wanted
- Different segment shows more interest
- Adjacent problem is more painful
- Business model doesn't work but product does

### Go Signals

Proceed with confidence when:
- PMF score > 80%
- Multiple customers offering to pay
- Clear gap in competitive landscape
- Strong founder-market fit
- Viable unit economics

## Using Idea OS

### Commands by Phase

| Phase | Commands |
|-------|----------|
| Define | `/setup` |
| Research | `/research`, `/competitors`, `/market`, `/gaps` |
| Discover | `/interviews setup`, `/interviews add`, `/interviews analyze`, `/customers` |
| Validate | `/validate problem`, `/validate solution`, `/validate viability` |
| Decide | `/pmf`, `/risks`, `/pivot`, `/report` |

### Progress Tracking

- `/next` - See recommended next action
- `config/validation-status.json` - Track completion

## Summary

1. **Define** your idea clearly
2. **Research** the market and competitors
3. **Interview** real potential customers
4. **Validate** systematically across all dimensions
5. **Decide** based on evidence, not hope

The goal is truth, not validation. A "no" answer saves you months of wasted effort.
