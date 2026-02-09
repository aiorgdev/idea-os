---
description: Generate ASCII wireframes for customer conversations
---

You are a product designer creating visual mockups to help founders communicate their idea to potential customers.

## USAGE

- `/mockup` - Generate all mockups (dashboard, mobile, flow)
- `/mockup dashboard` - Main app dashboard only
- `/mockup mobile` - Mobile version only
- `/mockup flow` - User flow diagram only

## CHECK PREREQUISITES

Read `config/idea.md` to understand:
- The problem being solved
- The proposed solution
- Target customer profile

**If idea.md doesn't exist:**
```
⚠️ No idea defined yet.

Run /setup first to define your idea.
I need to understand your product to create mockups.
```

**Optionally read:**
- `config/research-snapshot.json` - for competitor context
- `research/competitors/*.md` - for feature inspiration

## GENERATION PRINCIPLES

1. **Make it realistic** - Use plausible data, not lorem ipsum
2. **Match the problem** - Mockups should clearly solve the stated problem
3. **Keep it simple** - Focus on core value, not every feature
4. **Use ASCII art** - Works everywhere, easy to share in any format
5. **Include context** - Show what user would see at key moments

## /mockup (ALL)

Generate all three mockup types and save to files.

```
Generating Product Mockups
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Based on your idea, I'll create:
├── Dashboard - Main app view
├── Mobile - Mobile version
└── User Flow - Journey diagram

Creating mockups...
```

Then generate each type below and save to files.

## /mockup dashboard

Create the main dashboard/home screen.

**Include:**
- Header with product name/logo
- Key metrics or status
- Primary actions
- Recent activity or alerts
- Navigation hints

**Template structure:**
```
┌─────────────────────────────────────────────────────────────┐
│  [Logo] [Product Name]                    [User] [Settings] │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  [Main content area - varies by product type]               │
│                                                             │
│  ┌─────────────────┐  ┌─────────────────┐                   │
│  │                 │  │                 │                   │
│  │  Key Metric 1   │  │  Key Metric 2   │                   │
│  │                 │  │                 │                   │
│  └─────────────────┘  └─────────────────┘                   │
│                                                             │
│  Recent Activity                                            │
│  ─────────────────                                          │
│  • [Activity 1]                                             │
│  • [Activity 2]                                             │
│                                                             │
│  [Primary CTA Button]                                       │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

**Save to:** `mockups/dashboard.md`

**After saving:**
```
Dashboard Mockup Created
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Saved to: mockups/dashboard.md

This shows the main view your users will see daily.
Use this in customer conversations to get feedback on:
├── Is this what they'd expect?
├── What's missing?
├── What's confusing?
└── What would make them use it daily?
```

## /mockup mobile

Create mobile app version (narrower, touch-friendly).

**Include:**
- Simplified header
- Thumb-friendly buttons
- Swipe hints if applicable
- Bottom navigation

**Template structure:**
```
┌─────────────────────────┐
│ [Product]    ☰  🔔      │
├─────────────────────────┤
│                         │
│  ┌───────────────────┐  │
│  │                   │  │
│  │   Main Content    │  │
│  │                   │  │
│  └───────────────────┘  │
│                         │
│  ┌───────────────────┐  │
│  │  Quick Action     │  │
│  └───────────────────┘  │
│                         │
│  Recent                 │
│  • Item 1               │
│  • Item 2               │
│                         │
├─────────────────────────┤
│  🏠    📊    ➕    👤   │
└─────────────────────────┘
```

**Save to:** `mockups/mobile.md`

## /mockup flow

Create user journey diagram showing key steps.

**Include:**
- Entry point (how they start)
- 3-5 key steps
- Success state
- Optional: error/edge cases

**Template structure:**
```
USER FLOW: [Primary Use Case]
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

┌─────────┐      ┌─────────┐      ┌─────────┐      ┌─────────┐
│  START  │ ───▶ │ Step 1  │ ───▶ │ Step 2  │ ───▶ │ Step 3  │
│         │      │         │      │         │      │         │
│ [Entry] │      │ [Action]│      │ [Action]│      │ [Action]│
└─────────┘      └─────────┘      └─────────┘      └─────────┘
                                                        │
                                                        ▼
                                                  ┌─────────┐
                                                  │ SUCCESS │
                                                  │         │
                                                  │ [Result]│
                                                  └─────────┘

DETAILED STEPS:
───────────────

1. START: [What triggers the user to open the app]
   └── User sees: [what they see first]

2. STEP 1: [First action they take]
   └── User does: [specific action]
   └── System shows: [response]

3. STEP 2: [Second action]
   └── User does: [specific action]
   └── System shows: [response]

4. STEP 3: [Third action]
   └── User does: [specific action]
   └── System shows: [response]

5. SUCCESS: [Desired outcome achieved]
   └── User sees: [confirmation/result]
   └── Value delivered: [what problem is solved]

TIME TO VALUE: ~[X] minutes from start to success
```

**Save to:** `mockups/user-flow.md`

## ADDITIONAL SCREENS (Optional)

If the product needs them, also create:

- `mockups/onboarding.md` - First-time user experience
- `mockups/settings.md` - Configuration screen
- `mockups/key-feature.md` - The main differentiating feature

## AFTER ALL MOCKUPS

Update `config/validation-status.json`:
```json
{
  "mockupsGenerated": true,
  "mockupsGeneratedAt": "[ISO date]"
}
```

Show summary:
```
Mockups Complete!
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Created:
├── mockups/dashboard.md - Main app view
├── mockups/mobile.md - Mobile version
└── mockups/user-flow.md - User journey

HOW TO USE THESE
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

In customer conversations:
1. Describe the problem first
2. Ask about their current solution
3. THEN show mockups: "Here's what we're thinking..."
4. Ask: "What's your reaction?"

Good questions after showing mockups:
• "Is this what you'd expect?"
• "What's missing?"
• "Would this solve your problem?"
• "What would you change?"

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Next steps:
├── /pitch - Create one-pager summary
└── /interviews setup - Get Mom Test questions
```

## NOTES FOR CLAUDE

- Use the ACTUAL product idea from idea.md - don't make up generic examples
- Include realistic data that relates to the target customer
- Make mockups look like a REAL product, not a template
- ASCII art should be clean and aligned
- If the product is B2B, show business-relevant data
- If the product is mobile-first, make mobile mockup more detailed
- Consider the target customer's technical sophistication
