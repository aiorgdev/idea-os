---
description: Generate ideal customer profile based on research and interviews
---

You are a customer research expert helping a founder deeply understand their target customer.

## CHECK PREREQUISITES

Read `config/idea.md` and `config/interviews.json` for context.

**If no idea defined:**
```
⚠️ Run /setup first.
```

**If no interviews:**
```
⚠️ Customer profiles are most accurate with interview data.

Options:
├── Run /interviews setup to prepare for customer discovery
├── Continue anyway (profile will be based on research only)
```

## GENERATE CUSTOMER PROFILE

### Step 1: Gather Data

Read:
- `config/idea.md` - initial customer definition
- `config/interviews.json` - interview data (if exists)
- `config/research-snapshot.json` - market research
- `research/trends/trends-report.md` - voice of customer

### Step 2: Synthesize Profile

```
Ideal Customer Profile
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[If based on interviews:]
Based on [X] interviews and market research.

[If research only:]
Based on market research. Validate with customer interviews.

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

THE PERSON (Decision Maker)
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Role: [Job title or function]
├── Example: "Owner-operator of small restaurant"
├── Also known as: [other titles]
└── Reports to: [if applicable]

Demographics:
├── Age range: [typical range]
├── Education: [typical level]
├── Tech savviness: [Low/Medium/High]
└── Location: [geography]

Day in their life:
[2-3 sentences describing a typical day and where
your problem fits into it]

THE BUSINESS (Context)
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Company type: [description]
├── Size: [employees, revenue if relevant]
├── Industry: [specific segment]
└── Stage: [startup, growth, mature]

Business characteristics:
├── [Characteristic 1]
├── [Characteristic 2]
└── [Characteristic 3]

Buying process:
├── Decision maker: [who approves]
├── Influencers: [who else is involved]
├── Budget: [typical range]
└── Cycle time: [how long to decide]

THE PROBLEM (Pain Points)
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Primary pain:
"[In their words - from interviews or research]"

├── Frequency: [How often they face this]
├── Impact: [What happens if not solved]
├── Current cost: [Time, money, frustration]
└── Urgency: [Why they need to solve it now]

Secondary pains:
1. [Related pain point]
2. [Related pain point]

Triggers (what makes them search for solution):
├── [Trigger event 1]
├── [Trigger event 2]
└── [Trigger event 3]

CURRENT BEHAVIOR
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

How they solve it today:
├── [Solution 1] - [satisfaction level]
├── [Solution 2] - [satisfaction level]
└── [Manual/DIY] - [satisfaction level]

Tools they already use:
├── [Tool 1] - [purpose]
├── [Tool 2] - [purpose]
└── [Could integrate with your solution?]

Where they learn about new solutions:
├── [Channel 1] - [e.g., industry forums]
├── [Channel 2] - [e.g., peer recommendations]
└── [Channel 3] - [e.g., Google search]

WHAT THEY WANT
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Must-have requirements:
├── [Requirement 1]
├── [Requirement 2]
└── [Requirement 3]

Nice-to-have features:
├── [Feature 1]
├── [Feature 2]

Dealbreakers (what makes them NOT buy):
├── [Dealbreaker 1]
├── [Dealbreaker 2]
└── [Dealbreaker 3]

Price sensitivity:
├── Budget range: [typical willingness to pay]
├── Comparison: [what they compare to]
└── Value perception: [what makes it worth it]

PSYCHOGRAPHICS
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Attitudes:
├── Toward technology: [early adopter, pragmatist, skeptic]
├── Toward change: [eager, cautious, resistant]
└── Toward your category: [aware, interested, unaware]

Motivations:
├── [Primary motivation - e.g., save time]
├── [Secondary motivation - e.g., reduce stress]
└── [Deeper motivation - e.g., be a better business owner]

Fears:
├── [Fear 1 - e.g., making wrong decision]
├── [Fear 2 - e.g., wasting money]
└── [Fear 3 - e.g., looking incompetent]

LANGUAGE
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

How they describe the problem:
├── "[Their phrase]" (not your marketing speak)
├── "[Their phrase]"
└── "[Their phrase]"

Words they use for solutions:
├── "[Their term]"
├── "[Their term]"

Words to AVOID (jargon they don't use):
├── "[Term to avoid]"
├── "[Term to avoid]"

CUSTOMER AVATAR
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Name: [Fictional name]
Role: [Title]
Company: [Description]

"[2-3 sentence narrative describing this person and their day]"

Their story:
"[A day-in-the-life narrative that brings the customer to life,
including when they encounter the problem and how they feel about it]"

Quote that captures them:
"[A representative quote from interviews or research that
captures their mindset]"

WHERE TO FIND THEM
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Online:
├── [Platform/community 1]
├── [Platform/community 2]
└── [Platform/community 3]

Offline:
├── [Event/location 1]
├── [Event/location 2]

Publications they read:
├── [Publication/blog 1]
├── [Publication/blog 2]

Keywords they search:
├── "[Search term 1]"
├── "[Search term 2]"
└── "[Search term 3]"

SEGMENTATION (if applicable)
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[If interviews revealed distinct segments:]

Segment A: [Name]
├── Who: [description]
├── Pain intensity: [High/Medium/Low]
├── Willingness to pay: [High/Medium/Low]
└── Best fit? [Yes/No and why]

Segment B: [Name]
├── Who: [description]
├── Pain intensity: [level]
├── Willingness to pay: [level]
└── Best fit? [assessment]

RECOMMENDED FOCUS: [Segment name]
Reason: [Why this segment is best to start with]

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

VALIDATION STATUS
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

This profile is based on:
├── Interviews: [X] conducted
├── Research: [sources used]
└── Confidence: [High/Medium/Low]

[If low confidence:]
To improve confidence, conduct more interviews
with this specific customer type.
```

### Step 3: Save Profile

Create `config/customer.md`:

```markdown
# Ideal Customer Profile

Generated: [date]
Based on: [X] interviews + market research
Confidence: [level]

## Decision Maker

**Role:** [title]
**Demographics:** [summary]
**Tech savviness:** [level]

## Business Context

**Type:** [description]
**Size:** [range]
**Industry:** [segment]

## Primary Pain

"[In their words]"

- **Frequency:** [how often]
- **Impact:** [consequences]
- **Current cost:** [time/money]

## Must-Haves

1. [Requirement]
2. [Requirement]
3. [Requirement]

## Dealbreakers

1. [Dealbreaker]
2. [Dealbreaker]

## Price Range

[Willingness to pay]

## Where to Find Them

- [Channel 1]
- [Channel 2]
- [Channel 3]

## Key Quote

"[Representative quote]"

## Customer Avatar

**Name:** [name]

[Narrative]
```

### Step 4: Confirm

```
Customer Profile Created
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Saved to: config/customer.md

Key insights:
├── Primary pain: [one-liner]
├── Must-have: [key requirement]
├── Find them: [best channel]
└── Price range: [range]

Use this profile for:
├── /validate - Reference customer needs
├── /positioning - Match messaging to their language
├── /interviews - Recruit more of this type
└── Marketing - Target these channels
```

## NOTES

- Customer profiles should evolve with more interviews
- Best customers are those with urgent pain AND budget
- Focus on one segment first, expand later
- Their words > your assumptions
