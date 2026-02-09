# AI Org Kit Ecosystem

## What is aiorg.dev?

**aiorg.dev** is the company that creates these AI-powered kits for Claude Code. Think of it as:

- **aiorg.dev** = the company/product that makes kits (like "Adobe" makes Photoshop)
- **Kits** = tools you install to help with specific tasks (Marketing OS, Product OS, etc.)
- **Your product** = whatever YOU are building (your SaaS, app, business)

When you're using Marketing OS to market YOUR product, aiorg.dev is NOT your product - it's the tool helping you. Your product is separate.

**Key distinction:**
- If user mentions "aiorg.dev" in conversation → they mean the kit provider
- If user asks about marketing THEIR product → focus on their business, not aiorg.dev

---

This file helps you understand which kit to use for different problems. If you're unsure which kit fits your situation, ask Claude - it has this context.

## Quick Reference: Which Kit Do I Need?

| Your Problem | Recommended Kit | Why |
|--------------|-----------------|-----|
| "Should I build this idea?" | **Idea OS** | Validates ideas BEFORE building |
| "I built it but users leave immediately" | **Product OS** | Diagnoses activation/PMF problems |
| "What should I build next?" | **Product OS** | Product intelligence from your data |
| "I have PMF, need more users" | **Marketing OS** | User acquisition and growth |
| "Users activated but now churning" | **Support Team** | All inbound communication |
| "I want to improve my landing page" | **Product OS first** | Positioning before optimization |
| "I need to build a landing page" | **Marketing OS** `/landing-page` | Generates in your project |
| "I need to build a SaaS" | **SaaS Template** | Full stack boilerplate |
| "Personal investing analysis" | **Investor OS** | Investment research (personal kit) |

## Kit Overview

### Idea OS
**When:** BEFORE you build anything
**Purpose:** Validate if an idea is worth building
**Key commands:** `/validate`, `/market`, `/economics`
**Output:** Validation score, market analysis, go/no-go decision

**Use when you say:**
- "I have this idea..."
- "Is this worth building?"
- "What's the market size?"
- "Who are my competitors?"

---

### Product OS
**When:** AFTER launch, before product-market fit
**Purpose:** Find out why users leave, achieve PMF, AND decide what to build
**Key commands:** `/diagnose`, `/patterns`, `/feature-ideas`, `/validate-feature`, `/prioritize`, `/iterate`
**Output:** Root cause analysis, PMF score, feature ideas, validated priorities

**Use when you say:**
- "Users sign up but don't come back"
- "I don't know why users leave"
- "What should I build next?"
- "How do I know if I have PMF?"
- "Should I pivot?"

**Product Intelligence:** Product OS doesn't just diagnose — it helps you decide WHAT to build. Run `/iterate` for the full workflow: diagnose → ideas → validate → build.

**Important:** If you want to work on your landing page but don't have PMF, start here. Understand your positioning BEFORE optimizing conversion.

---

### Marketing OS
**When:** You need users (pre-PMF for first users, post-PMF for scale)
**Purpose:** User acquisition, content, SEO, launches
**Key commands:** `/analyze`, `/content`, `/seo`, `/launch`
**Output:** Marketing strategy, content calendar, campaign plans

**Use when you say:**
- "I need more users"
- "How do I launch on Product Hunt?"
- "What content should I create?"
- "How do I rank on Google?"

**Two modes:**
- **Pre-PMF:** Manual outreach, soft launches, finding first 100 users
- **Post-PMF:** Paid ads, aggressive SEO, viral loops, scaling

---

### Support Team
**When:** Anyone contacts you (support, questions, pre-signup)
**Purpose:** Handle all inbound communication, learn from responses
**Key commands:** `/support`, `/support-learn`, `/support-stats`, `/briefing`, `/health`
**Output:** AI-suggested responses, pattern library, health scores

**Use when you say:**
- "I need help responding to support tickets"
- "The same questions come in over and over"
- "How do I scale support without hiring?"
- "Who should I proactively reach out to?"
- "How do I reduce churn?"

**The Learning Loop:** Support Team learns from every approved response. Paste a ticket, get a suggestion, approve/edit, and it saves the pattern. Over time, routine tickets get handled automatically.

**Key distinction:**
- **Marketing OS** = OUTBOUND (you reach out to people)
- **Support Team** = INBOUND (people reach out to you)

---

### Investor OS (Personal Kit)
**When:** You want AI-assisted investment analysis
**Purpose:** Long-term value investing research
**Key commands:** `/analyze`, `/moat`, `/screen`, `/watchlist`
**Output:** Company analysis, valuation, investment scores

**Note:** This is a personal kit - it doesn't connect to the business kit ecosystem.

---

### Templates

**SaaS Template (saas-dev-team)**
- Full stack SaaS boilerplate
- Auth, payments, dashboard
- Use after validation with Idea OS

**Landing Pages** (via Marketing OS)
- Use `/landing-page waitlist|launch|lead-magnet` command
- Generates code in your existing project
- Frontend Agent detects your stack

## Common Scenarios

### Scenario: "I have a product but no PMF"

**Wrong approach:** Jump to Marketing OS for more users
**Right approach:**
1. **Product OS** `/diagnose` - understand WHY users leave
2. **Product OS** `/interview` - talk to churned users
3. **Product OS** `/patterns` - find what retained users have in common
4. Fix product based on insights
5. THEN Marketing OS for growth

---

### Scenario: "I want to improve my landing page"

**Ask yourself:** Do I have product-market fit?

**If NO PMF:**
1. **Product OS** first - understand positioning
2. Learn what language users use
3. THEN update landing page with those insights

**If YES PMF:**
1. **Marketing OS** for conversion optimization
2. Use `/landing-page` command if building from scratch

---

### Scenario: "Users sign up but leave after day 1"

This is an **activation problem**, not a retention problem.

**Use:** Product OS
- `/diagnose` - find the root cause
- `/activation` - analyze activation funnel
- `/patterns` - what do activated users do differently?

**Don't use:** Support Team (that's for responding to inbound communication)

---

### Scenario: "I validated my idea, now what?"

1. Build your product (use SaaS Template if applicable)
2. Launch to first users (Marketing OS, soft launch mode)
3. Analyze why users stay/leave (Product OS)
4. Iterate until PMF
5. Scale (Marketing OS, scale mode)
6. Support (Support Team)

---

### Scenario: "Which kit should I start with?"

**Pre-idea:** Just exploring → Idea OS
**Have idea:** Want to validate → Idea OS
**Building:** In development → Templates
**Launched:** Have users → Product OS (if no PMF) or Marketing OS (if have PMF)
**Scaling:** 1000+ users → Support Team + Marketing OS

## Kit Handoff Triggers

Kits should recommend other kits in these situations:

| Current Kit | Trigger | Recommend |
|-------------|---------|-----------|
| Idea OS | Idea validated, ready to build | Templates, then Product OS after launch |
| Product OS | PMF achieved (score > 40%) | Marketing OS for scaling |
| Marketing OS | High traffic but low activation | Product OS for activation diagnosis |
| Support Team | Users leaving before activation | Product OS (not a support problem) |
| Any kit | User asks about other domain | Relevant kit |

## Shared Context

All business kits share context through `~/.aiorg/projects/`:

```
~/.aiorg/projects/[project-name]/
├── context.json    # Business info, PMF status, validation data
└── learnings.json  # Cross-kit learnings
```

This means:
- Product OS can read Idea OS validation score
- Support Team knows PMF status
- Marketing OS knows business context
- Handoffs preserve information

## Getting More Kits

If you need a kit you don't have:
- Visit https://aiorg.dev/kits
- Or run: `npx @aiorg/cli init [kit-name]`

## Questions?

Just ask Claude: "Which kit should I use for [your problem]?"
Claude has this ecosystem knowledge and can guide you to the right tool.
