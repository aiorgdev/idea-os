---
description: Show current version and changelog
---

Read `.claude/version.json` and display the version information.

## Display Format

```
Idea OS
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Version: [version]
Released: [releasedAt]

Latest Changes (v[version]):
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[If highlights exist:]
Highlights:
[list highlights]

[If added exists and has items:]
Added:
[list added items with bullet points]

[If changed exists and has items:]
Changed:
[list changed items]

[If fixed exists and has items:]
Fixed:
[list fixed items]

[If breaking exists and has items:]
⚠️ Breaking Changes:
[list breaking changes]

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Check for updates: npx @aiorg/cli upgrade
Documentation: https://aiorg.dev/docs/idea-os
```

## If Multiple Versions in Changelog

Show the most recent version in detail, then list previous versions briefly:

```
Previous Versions:
├── v0.9.0 (2026-01-01) - Beta release
├── v0.8.0 (2025-12-15) - Interview analysis
└── v0.7.0 (2025-12-01) - Initial research commands

Full changelog: .claude/version.json
```
