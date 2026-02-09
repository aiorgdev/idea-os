# Product Discovery Protocol

## Purpose

Understand WHAT a product IS (business/product identity) by reading the richest sources first. This complements stack-detection.md (HOW it's built) and schema-discovery.md (data model).

**Output:** `~/.aiorg/projects/[name]/product-understanding.md` — shared across all kits.

## When to Run

During `/setup` of any companion kit (Marketing OS, Product OS, Support Team, QA Team).

## Step 0: Check for Existing Understanding

Before running discovery, check if understanding already exists:

```bash
PROJECT_NAME=$(cat .aiorg 2>/dev/null | grep '"project"' | cut -d'"' -f4)
cat ~/.aiorg/projects/$PROJECT_NAME/product-understanding.md 2>/dev/null
```

**If file exists:**

1. Check the `last_analyzed` date in the file header
2. Check if target project's CLAUDE.md was modified since last analysis:
   ```bash
   # Compare modification dates
   stat -f %m [targetPath]/CLAUDE.md 2>/dev/null
   ```

**If understanding exists AND is < 30 days old AND CLAUDE.md hasn't changed:**

Show summary to user:

```
Existing Product Understanding Found
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Product: [name from file]
Description: [one-line from file]
Last analyzed: [date] ([X] days ago)
Analyzed by: [which kit ran it]

Key findings:
├── Audience: [target audience]
├── UVP: [value proposition]
├── Stage: [product stage]
└── Confidence: [overall confidence]
```

Use AskUserQuestion:
- "Use this understanding" → Skip discovery, proceed to kit-specific steps
- "Re-analyze (product changed)" → Run full discovery again

**If understanding is missing, > 30 days old, or CLAUDE.md changed:** Run full discovery.

## Step 1: Detect Project Complexity

Scan the target project to understand what sources exist. Don't look for specific hardcoded paths — discover what's actually there.

```bash
# What's at the root?
ls -la [targetPath]/ 2>/dev/null

# Any AI context files? (CLAUDE.md, .cursorrules, etc.)
wc -l [targetPath]/CLAUDE.md [targetPath]/.cursorrules [targetPath]/.github/copilot-instructions.md 2>/dev/null

# Any documentation directory?
ls [targetPath]/docs/ [targetPath]/documentation/ [targetPath]/wiki/ 2>/dev/null | head -20

# Monorepo signals?
ls [targetPath]/packages/ [targetPath]/apps/ [targetPath]/products/ [targetPath]/services/ 2>/dev/null
```

**Classification based on what you find:**

| Complexity | Signals | Analysis Depth | Time |
|------------|---------|----------------|------|
| **SIMPLE** | No AI context files, no docs folder, basic README | Read README + landing page + package metadata | 1-3 min |
| **MODERATE** | AI context file (any size), or small docs folder (1-5 files) | + AI context + referenced docs | 3-5 min |
| **COMPLEX** | Large AI context (200+ lines), or many docs (5+), or monorepo | + All referenced docs + docs/ scan + follow breadcrumbs | 5-10 min |

Show to user:

```
Project Complexity: [SIMPLE/MODERATE/COMPLEX]
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Sources found:
├── [list what you found: CLAUDE.md (X lines), docs/ (Y files), README.md, etc.]
└── Estimated analysis time: [time]

Analyzing...
```

## Step 2: Intelligent Source Discovery & Reading

**DO NOT follow a hardcoded checklist.** You are an intelligent agent. Scan the project, discover what's available, and decide what to read based on what you find.

### 2.1: Scan the Project Root

Start by understanding the project's structure:

```bash
# See what's at the root level
ls -la [targetPath]/
ls [targetPath]/docs/ 2>/dev/null
ls [targetPath]/src/ 2>/dev/null
```

**Look for signals, not specific filenames.** Every project is different. You might find:
- `CLAUDE.md`, `.cursorrules`, `.github/copilot-instructions.md` — AI context files (read these FIRST)
- `README.md`, `README.rst`, `readme.txt` — project overview
- `docs/`, `documentation/`, `wiki/` — strategic/product docs
- Landing page files (varies by framework)
- `package.json`, `pyproject.toml`, `Cargo.toml`, `go.mod` — project metadata
- `.env.example`, `config/` — configuration hints (pricing tiers, features)
- `CONTRIBUTING.md`, `ARCHITECTURE.md` — structure docs
- `CHANGELOG.md`, `HISTORY.md` — what the product does over time
- Marketing or content directories

### 2.2: Read by Priority (Adaptive)

Read sources in priority order, but **use your judgment** about what's valuable. Stop when you have HIGH confidence on most key sections.

**Tier 1: AI Context Files (Highest Value)**

These are descriptions written FOR AI assistants — they contain the richest context:

```bash
cat [targetPath]/CLAUDE.md 2>/dev/null
cat [targetPath]/.cursorrules 2>/dev/null
cat [targetPath]/.github/copilot-instructions.md 2>/dev/null
```

Why these are #1: Founders write these to explain their ENTIRE project to AI. They typically contain business model, architecture, positioning, key decisions, and constraints that no other file has.

**After reading AI context files, look for referenced documents.** If CLAUDE.md mentions `docs/POSITIONING.md` or `See architecture.md` — follow those references. These are the founder saying "this is important."

**Tier 2: Project Overview Files**

```bash
cat [targetPath]/README.md 2>/dev/null
```

Also check for any top-level markdown files that look strategic (e.g., `VISION.md`, `ROADMAP.md` at root).

**Tier 3: Landing Page / User-Facing Content**

Find the main landing page — this varies by framework. Don't hardcode paths. Instead:

```bash
# Detect framework first, then find landing page
# Next.js App Router
cat [targetPath]/src/app/page.tsx 2>/dev/null || cat [targetPath]/app/page.tsx 2>/dev/null
# Next.js Pages Router
cat [targetPath]/src/pages/index.tsx 2>/dev/null || cat [targetPath]/pages/index.tsx 2>/dev/null
# Astro, HTML, etc.
cat [targetPath]/src/pages/index.astro 2>/dev/null || cat [targetPath]/index.html 2>/dev/null
```

If you can't find a landing page file, look for pricing pages, features pages, or any user-facing content that describes the product.

**Tier 4: Documentation Directory**

If a `docs/` (or similar) directory exists, scan it and read documents that look strategic:

```bash
ls [targetPath]/docs/ 2>/dev/null
```

Prioritize files that sound like business/product docs over technical docs:
- Positioning, strategy, growth, vision, user journey → READ
- API reference, code conventions, testing guide → SKIP (not relevant for product understanding)

**Tier 5: Project Metadata**

```bash
cat [targetPath]/package.json 2>/dev/null
# Or for non-JS projects:
cat [targetPath]/pyproject.toml 2>/dev/null
cat [targetPath]/Cargo.toml 2>/dev/null
```

Extract: name, description, keywords, homepage URL.

**Tier 6: Any Other Relevant Sources**

Use your judgment. If you see something that might contain product context, read it:
- `config/` files that reveal feature flags or pricing tiers
- Content directories that show what the product produces
- `.env.example` that reveals integrations and capabilities
- Marketing or copy directories

### 2.3: Follow the Breadcrumbs

As you read each source, **look for references to other files.** If a document says:
- "See docs/POSITIONING.md for our positioning strategy"
- "Architecture details in ARCHITECTURE.md"
- "Full roadmap at docs/ROADMAP.md"

Follow those references. The founder is telling you what's important.

### 2.4: Know When to Stop

Stop reading when:
- You have HIGH confidence on Product Identity, Target Audience, and Value Proposition
- You've read all referenced documents from AI context files
- Additional documents are giving diminishing returns (repeating what you already know)
- You've spent more time than the complexity level warrants

## Step 3: Synthesize Understanding

Compile all findings into structured sections. For each section, assign a confidence level.

### Confidence Levels

| Level | Meaning | When |
|-------|---------|------|
| **HIGH** | Found explicit, detailed information | CLAUDE.md or docs clearly state it |
| **MEDIUM** | Inferred from multiple signals | Landing page + README suggest it |
| **LOW** | Best guess from limited data | Only indirect signals |
| **UNKNOWN** | Could not determine | No relevant information found |

### Sections to Synthesize

**1. Product Identity**
- Name
- One-line description
- What it IS (core functionality)
- What it is NOT (boundaries, common misconceptions)
- Product type (SaaS, template, tool, platform, marketplace, etc.)

**2. Target Audience**
- Primary audience (who)
- Their main pain point
- Trigger events (what makes them search for a solution)
- Jobs-to-be-done (what they're trying to accomplish)
- Anti-persona (who this is NOT for)

**3. Value Proposition**
- Unique value proposition (UVP)
- Key differentiators vs alternatives
- Main benefits (not features)

**4. Business Model**
- Pricing (free, freemium, paid, tiers)
- Revenue model (subscription, one-time, usage-based)
- Free tier scope (if applicable)

**5. Product Stage**
- Stage (pre-launch, launched, growing, scaling)
- User count signals (if available)
- PMF signals (if available)

**6. Content & Voice**
- Tone (casual, professional, friendly, technical)
- Personality traits
- Key phrases used repeatedly
- Language patterns

**7. Architecture Notes** (brief, for context only)
- Project structure highlights
- Key directories and their purpose
- Notable technical decisions

### Gaps List

After synthesis, list what was NOT found. This drives the adaptive interview in each kit's setup.

```
GAPS (not found in project sources):
├── Competitors (not mentioned anywhere)
├── User search journey (marketing-specific)
├── Claims and red lines (safety-critical)
└── Trial length (not visible in code)
```

## Step 4: Present to User

Show the synthesized understanding and ask for confirmation.

```
Product Understanding
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Based on [sources read], here's what I understand:

PRODUCT: [name]
[one-line description]

TARGET AUDIENCE: [who] — [confidence]
[pain point]

VALUE PROPOSITION: [UVP] — [confidence]
[key differentiator]

BUSINESS MODEL: [model] — [confidence]
[pricing details]

STAGE: [stage] — [confidence]

VOICE: [tone description] — [confidence]

GAPS (I'll ask about these):
├── [gap 1]
├── [gap 2]
└── [gap 3]

Is this accurate? Anything I got wrong?
```

Use AskUserQuestion:
- "Looks good" → Save as-is
- "Let me correct something" → User provides corrections

Apply any corrections before saving.

## Step 5: Save Understanding

Save to `~/.aiorg/projects/[name]/product-understanding.md`:

```markdown
# Product Understanding: [Name]

<!-- Auto-generated by Product Discovery Protocol -->
<!-- last_analyzed: [ISO date] -->
<!-- analyzed_by: [kit-name] -->
<!-- complexity: [SIMPLE/MODERATE/COMPLEX] -->
<!-- sources_read: [list of files] -->

## Product Identity
- **Name:** [name]
- **Description:** [one-line]
- **Type:** [SaaS/template/tool/etc.]
- **What it IS:** [core functionality]
- **What it is NOT:** [boundaries]
- **Confidence:** [HIGH/MEDIUM/LOW]

## Target Audience
- **Primary:** [who]
- **Pain:** [main problem]
- **Triggers:** [what makes them search]
- **JTBD:** [jobs to be done]
- **Anti-persona:** [who it's NOT for]
- **Confidence:** [HIGH/MEDIUM/LOW]

## Value Proposition
- **UVP:** [unique value proposition]
- **Differentiators:** [vs alternatives]
- **Key benefits:** [top 3]
- **Confidence:** [HIGH/MEDIUM/LOW]

## Business Model
- **Pricing:** [details]
- **Revenue model:** [type]
- **Tiers:** [if applicable]
- **Confidence:** [HIGH/MEDIUM/LOW]

## Product Stage
- **Stage:** [pre-launch/launched/growing/scaling]
- **User signals:** [any indicators]
- **PMF signals:** [any indicators]
- **Confidence:** [HIGH/MEDIUM/LOW]

## Content & Voice
- **Tone:** [description]
- **Personality:** [traits]
- **Key phrases:** [repeated phrases]
- **Confidence:** [HIGH/MEDIUM/LOW]

## Architecture Notes
- **Structure:** [key highlights]
- **Key directories:** [notable ones]
- **Tech decisions:** [notable ones]

## Gaps
[List of sections with LOW/UNKNOWN confidence or missing data]
```

Also update `~/.aiorg/projects/[name]/context.json` if `business.name` or `business.description` are missing:

```json
{
  "business": {
    "name": "[from discovery]",
    "description": "[from discovery]"
  }
}
```

## How Kits Use Discovery Results

After running the protocol, kits should adapt their interviews based on confidence levels:

| Confidence | Kit Behavior |
|------------|-------------|
| **HIGH** | Show finding, ask "Is this correct?" (quick confirm) |
| **MEDIUM** | Show finding, ask "Is this correct? If not, what would you change?" |
| **LOW** | Show best guess, ask the full question (user provides answer) |
| **UNKNOWN** | Ask the full question (no pre-fill) |

This means:
- **HIGH confidence product identity** → Skip "What does your product do?" question
- **MEDIUM confidence audience** → "I think your audience is [X]. Correct?"
- **LOW confidence competitors** → "Who are your main competitors?"
- **UNKNOWN trial length** → "How long is your trial period?"

The kit's interview becomes ADAPTIVE — only asking questions that the discovery couldn't answer confidently.
