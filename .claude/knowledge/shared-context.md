# Shared Context Protocol

This knowledge file explains how AI Org kits share context across projects.

## Overview

AI Org kits can share business context through the `~/.aiorg/` directory. This allows:

- Kits to know about each other (what's installed)
- Business context to persist across kits
- Validation data from Idea OS to inform Product OS
- PMF status to inform Marketing OS recommendations
- Learnings to be shared across the project

## Architecture

```
~/.aiorg/                           # Global AI Org directory
├── config.json                     # User preferences
└── projects/
    └── [project-name]/             # Per-project context
        ├── context.json            # Business context (all kits read/write)
        └── learnings.json          # Cross-kit learnings

[anywhere]/                         # Kit installation (user's choice)
├── .aiorg                          # Links to project: { "project": "name" }
├── .claude/                        # Kit files
└── CLAUDE.md                       # Kit instructions
```

## The .aiorg File

Each kit installation has a `.aiorg` file that links it to a project:

```json
{
  "project": "taskflow",
  "version": "1.0.0"
}
```

## context.json Schema

Located at `~/.aiorg/projects/[name]/context.json`:

```json
{
  "version": "1.0.0",
  "business": {
    "name": "TaskFlow",
    "description": "Task management for freelancers",
    "stage": "launched",           // idea | building | launched | pmf | scaling
    "launchDate": "2026-01-01"
  },
  "validation": {
    "ideaValidated": true,
    "ideaScore": 78,               // Idea OS PMF score
    "targetCustomer": "Solo freelancers, designers",
    "valueProp": "AI-powered task prioritization",
    "validatedAt": "2026-01-05T12:00:00Z"
  },
  "pmf": {
    "status": "searching",          // not-started | searching | approaching | achieved
    "score": null,                  // 0-100
    "seanEllisScore": null,         // % "very disappointed"
    "activationRate": null,         // %
    "weeklyRetention": null,        // %
    "measuredAt": null
  },
  "installedKits": ["idea-os", "marketing-os"],
  "lastUpdated": "2026-01-10T12:00:00Z",
  "updatedBy": "idea-os"
}
```

## learnings.json Schema

Located at `~/.aiorg/projects/[name]/learnings.json`:

```json
{
  "version": "1.0.0",
  "whatWorks": [
    {
      "insight": "Freelancers prefer weekly view over daily",
      "source": "product-os/interview",
      "date": "2026-01-08"
    }
  ],
  "whatDoesntWork": [
    {
      "insight": "Gamification didn't improve retention",
      "source": "product-os/experiment",
      "date": "2026-01-05"
    }
  ]
}
```

## Kit Responsibilities

### On Session Start

1. Check if `.aiorg` file exists in current directory
2. If exists, read project name and load `~/.aiorg/projects/[name]/context.json`
3. Silently incorporate context into understanding
4. Optionally show context summary in greeting

### On /setup

1. Check if `.aiorg` file exists
2. If not, offer to:
   - Link to existing project (list from `~/.aiorg/projects/`)
   - Create new project
3. Create `.aiorg` file with project link
4. Add kit to `installedKits` in context.json

### After Significant Operations

Update context.json with relevant data:

| Kit | Writes |
|-----|--------|
| **Idea OS** | `validation.*` fields after /pmf or /validate |
| **Product OS** | `pmf.*` fields after /pmf or /diagnose |
| **Marketing OS** | Can update `business.stage` if scaling |
| **Support Team** | Can update `business.stage` |

### Handoff Triggers

Kits should recommend other kits when appropriate:

| From | To | Trigger |
|------|-----|---------|
| Idea OS | Build/Marketing | Idea validated (score > 70) |
| Product OS | Marketing OS (scale) | PMF achieved (Sean Ellis > 40%) |
| Product OS | Support Team | Activation healthy, retention is issue |
| Support Team | Product OS | Users leaving before activation |

## Graceful Degradation

**CRITICAL**: Kits must work WITHOUT shared context.

- If `.aiorg` doesn't exist: kit works normally, just without cross-kit awareness
- If context.json is missing/invalid: kit creates its own local state
- Never crash or block on missing shared context
- Offer to set up project linking, but don't require it

## Code Patterns

### Reading Context (Session Start)

```bash
# Check for project link
if [ -f ".aiorg" ]; then
  PROJECT=$(cat .aiorg | grep '"project"' | cut -d'"' -f4)
  CONTEXT_PATH="$HOME/.aiorg/projects/$PROJECT/context.json"
  if [ -f "$CONTEXT_PATH" ]; then
    # Read and parse context.json
    cat "$CONTEXT_PATH"
  fi
fi
```

### Writing Context

```bash
# After significant operation, update context
PROJECT=$(cat .aiorg | grep '"project"' | cut -d'"' -f4)
CONTEXT_PATH="$HOME/.aiorg/projects/$PROJECT/context.json"

# Use jq or similar to update specific fields
# Example: update validation.ideaScore
```

### Creating Project Link

```bash
# Create .aiorg file
echo '{"project": "my-project", "version": "1.0.0"}' > .aiorg

# Ensure project directory exists
mkdir -p ~/.aiorg/projects/my-project

# Create context.json if needed
```

## Context Reading Guidelines

When reading shared context, use this information to:

1. **Personalize greetings**: "Welcome back! Working on [business.name]..."
2. **Skip redundant questions**: Don't ask about target customer if validation.targetCustomer exists
3. **Inform recommendations**: If pmf.status is "achieved", recommend scaling
4. **Show cross-kit progress**: "Idea OS validated at 78. Now let's find PMF."

## Context Writing Guidelines

When writing to shared context:

1. **Be conservative**: Only write fields your kit owns
2. **Always update timestamps**: Set `lastUpdated` and `updatedBy`
3. **Preserve other fields**: Read full context, update your fields, write back
4. **Validate before write**: Ensure data is correct before persisting

## Stage Progression

The `business.stage` field indicates where the user is:

- `idea` - Pre-build, validating idea (Idea OS)
- `building` - Building product (no kit)
- `launched` - Product launched, seeking PMF (Product OS)
- `pmf` - PMF achieved, ready to scale (Marketing OS)
- `scaling` - Scaling user acquisition (Marketing OS + Support Team)

## Kit Cross-References

When recommending other kits:

```
Your PMF score is 45%! That's PMF.

Time to scale user acquisition.
→ If you have Marketing OS: run /scale
→ If not: https://aiorg.dev/kits/marketing-os
```

Always provide:
1. What the trigger was
2. Which kit to use
3. What command to run
4. Link to get the kit if not installed
