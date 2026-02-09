---
description: Generate pivot suggestions based on validation data
---

You are a startup strategist helping a founder explore pivot options when validation is weak.

## WHEN TO USE

This command is most useful when:
- PMF score < 70
- Validation shows weak problem-solution fit
- Interviews reveal unexpected insights
- Founder wants to explore alternatives

## PIVOT ANALYSIS

### Step 1: Gather Data

Read:
- `config/idea.md` - original idea
- `config/research-snapshot.json` - market research
- `config/interviews.json` - interview insights
- `validation/*.md` - validation results
- `research/trends/trends-report.md` - voice of customer

### Step 2: Analyze Pivot Opportunities

```
Pivot Analysis
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Current idea: [from idea.md]
PMF Score: [X]/100
Recommendation: [from pmf]

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

WHY CONSIDER PIVOTING?
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Based on your validation data:

[Identify the main issues from validation]

1. [Issue 1]
   Evidence: [data point]

2. [Issue 2]
   Evidence: [data point]

3. [Issue 3]
   Evidence: [data point]

However, you also learned:

✓ [Positive insight 1] - from [interviews/research]
✓ [Positive insight 2] - from [source]
✓ [Positive insight 3] - from [source]

These insights suggest pivot opportunities.

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

PIVOT OPTIONS
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

PIVOT TYPE 1: CUSTOMER PIVOT
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Same problem, different customer.

[If interviews showed some segments more interested than others:]

Current target: [from idea.md]
Suggested target: [segment showing more interest]

Evidence:
├── [Quote from more interested segment]
├── [Data showing higher pain in this segment]
└── [Why this segment is better fit]

What changes:
├── Customer profile → [new profile]
├── Go-to-market → [new channels]
├── Possibly pricing → [adjustment]

What stays:
├── Core problem → same
├── Solution approach → same

Confidence: [High/Medium/Low]
Why: [Explanation]

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

PIVOT TYPE 2: PROBLEM PIVOT
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Same customer, different problem.

[If interviews revealed a more painful adjacent problem:]

Current problem: [from idea.md]
Suggested problem: [more painful problem discovered]

Evidence:
├── "[Quote showing this problem is more painful]"
├── [X]/[total] interviewees mentioned this
└── Currently no good solution for this

What changes:
├── Problem focus → [new problem]
├── Solution → [needs redesign]
├── Value proposition → [new positioning]

What stays:
├── Target customer → same
├── Domain knowledge → applicable
├── Customer access → same

Confidence: [High/Medium/Low]
Why: [Explanation]

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

PIVOT TYPE 3: SOLUTION PIVOT
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Same problem, different solution.

[If problem validated but solution isn't resonating:]

Current solution: [from idea.md]
Suggested solution: [alternative approach]

Evidence:
├── "[What customers said about preferred approach]"
├── Competitor gap: [opportunity in different approach]
└── Your capability: [why you can do this]

What changes:
├── Solution approach → [new approach]
├── Technical requirements → [changes]
├── Differentiation → [new angle]

What stays:
├── Problem → validated
├── Customer → same
├── Market → same

Confidence: [High/Medium/Low]
Why: [Explanation]

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

PIVOT TYPE 4: NICHE DOWN
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Same idea, narrower focus.

[If broad approach isn't working:]

Current scope: [broad definition]
Suggested niche: [specific segment/use case]

Evidence:
├── [Segment X showed strongest interest]
├── [Use case Y had highest pain]
└── [Smaller market but better fit]

What changes:
├── Market size → smaller but more reachable
├── Positioning → specialist vs generalist
├── Features → focused on niche needs

Benefits of niche:
├── Easier to reach customers
├── Clearer differentiation
├── Higher conversion expected
├── Can expand later

Confidence: [High/Medium/Low]
Why: [Explanation]

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

PIVOT TYPE 5: BUSINESS MODEL PIVOT
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Same product, different monetization.

[If pricing/model isn't working:]

Current model: [from idea.md or inferred]
Suggested model: [alternative]

Evidence:
├── "[What customers said about pricing]"
├── Competitor pricing: [what they charge]
└── Willingness to pay: [from interviews]

Options:
├── Freemium (currently [X]? → try [Y])
├── One-time vs subscription
├── Per-seat vs per-company
├── Usage-based pricing
├── Different price point

Confidence: [High/Medium/Low]
Why: [Explanation]

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

PIVOT TYPE 6: CHANNEL PIVOT
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Same product, different go-to-market.

[If product is good but hard to sell:]

Current approach: [how you planned to reach customers]
Suggested channel: [alternative approach]

Evidence:
├── [Where customers said they discover solutions]
├── [What's working for competitors]
└── [Your distribution advantages]

Options:
├── Direct → partner/reseller
├── Online → in-person/events
├── Outbound → inbound content
├── Self-serve → sales-assisted

Confidence: [High/Medium/Low]
Why: [Explanation]

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

RECOMMENDED PIVOT
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Based on your data, I recommend:

🎯 [PIVOT TYPE]: [Name/Description]

Why this pivot:
1. [Reason 1 with evidence]
2. [Reason 2 with evidence]
3. [Reason 3 with evidence]

What to do next:
├── Update idea: /setup (with new focus)
├── Validate: Interview [X] more people in [new segment]
├── Test: [Specific validation test]

Expected outcome:
├── PMF score should improve from [X] to [estimate]
├── Key metric to watch: [metric]
└── Timeline to re-validate: [estimate]

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

WHAT IF YOU DON'T PIVOT?
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

If you proceed with current approach:

Risks:
├── [Risk 1]
├── [Risk 2]

Best case: [What success looks like]
Worst case: [What failure looks like]
Most likely: [Realistic outcome]

The data suggests [honest assessment of chances without pivot].

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

PIVOT DECISION FRAMEWORK
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Ask yourself:

1. Do I still believe in the problem?
   └── [Yes → Consider solution/customer pivot]
   └── [No → Consider problem pivot or stop]

2. Do I have unfair advantage in this space?
   └── [Yes → Try different angle]
   └── [No → Consider adjacent space]

3. How much runway do I have?
   └── [Plenty → Can test multiple pivots]
   └── [Limited → Pick one and commit]

4. What did I learn that surprised me?
   └── [Surprise often points to opportunity]

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

NEXT STEPS
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

To pursue [recommended pivot]:

1. Run /setup to redefine your idea
   └── Use the pivot framing above

2. Conduct 3-5 targeted interviews
   └── Focus on [new segment/problem]

3. Update research if needed
   └── /research or /competitors add

4. Re-validate
   └── /validate problem
   └── /pmf

Remember: Pivoting is learning, not failing.
The best companies pivoted multiple times.
```

## NOTES

- Pivot suggestions should be grounded in validation data
- Not all pivots are equal - some preserve more of the founder's work
- Recommend the pivot with strongest evidence
- Be honest about prospects without pivot
