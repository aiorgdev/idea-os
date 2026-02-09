---
description: See what's new in the latest version
---

You are showing the user what's new in the latest version of this kit.

## STEP 1: Read Version Info

Read `.claude/version.json` to get version information.

Extract:
- `version` - current version number
- `packageDisplayName` - kit name to display (e.g., "Investor OS", "Marketing OS")
- `changelog[version]` - the changelog entry for current version

## STEP 2: Display What's New

Show ONLY the **current version** changelog in a friendly format:

```
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
 WHAT'S NEW IN [packageDisplayName] v[version]
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[For each highlight - make these prominent]
★ [highlight]

[If added is not empty]
Added:
[For each item in added - pick top 3-5 most interesting]
• [item]

[If changed is not empty]
Changed:
[For each item in changed - pick top 2-3]
• [item]

[If fixed is not empty]
Fixed:
[For each item in fixed]
• [item]

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

## STEP 3: Show Upgrade Notes (if any)

If `upgradeNotes` exists for current version, show it as a tip:

```
💡 TIP: [upgradeNotes]
```

## STEP 4: Suggest Next Action

Based on what's new, suggest ONE thing to try:

```
Try it: /[relevant command based on highlights]
```

Pick the most relevant command based on:
- New features added → suggest trying them
- Bug fixes → acknowledge they're fixed
- If nothing obvious, suggest `/help` or the kit's main command

## Notes

- Keep it SHORT and scannable
- Focus on what's USEFUL to the user, not technical details
- If user wants full changelog history, suggest `/version`
- Don't show breaking changes or newEnvVars unless critical
