# Idea OS

[![Version](https://img.shields.io/badge/version-1.11.4-blue)](https://github.com/aiorgdev/idea-os/releases)
[![License: MIT](https://img.shields.io/badge/license-MIT-green)](LICENSE)
[![Free](https://img.shields.io/badge/price-free-brightgreen)](https://aiorg.dev/kits/idea-os)
[![Claude Code](https://img.shields.io/badge/built%20for-Claude%20Code-blueviolet)](https://docs.anthropic.com/en/docs/claude-code)

**AI-powered business idea validation for founders.** Automates competitor research, market analysis, customer discovery, and PMF scoring — all inside Claude Code.

> You don't do research. You don't guess what to ask. You don't interpret data.
> You just validate — talk to customers, AI handles the rest.

## Quick Start

```bash
npx @aiorg/cli init idea-os ~/my-idea
cd ~/my-idea
# Open in Claude Code, then run:
/setup
```

## How It Works

```
/setup → /research → /mockup, /pitch → /interviews setup → conduct interviews
                                                                    ↓
                                                          /interviews add (5x)
                                                                    ↓
                                                          /interviews analyze
                                                                    ↓
                          /validate problem → /validate solution → /validate viability
                                                                    ↓
                                                                  /pmf
                                                                    ↓
                                                              /economics
                                                                    ↓
                                                          GO / PIVOT / STOP
                                                                    ↓
                                                                /report
```

1. **Define your idea** — `/setup` walks you through problem, solution, target customer, and generates Jobs to be Done
2. **Research automatically** — `/research` analyzes competitors, market size, trends, and gaps
3. **Prepare materials** — `/mockup` creates wireframes, `/pitch` generates a one-pager
4. **Discover customers** — `/interviews setup` generates Mom Test questions, you conduct 5+ interviews
5. **Score PMF** — `/pmf` synthesizes everything into a Product-Market Fit score
6. **Check economics** — `/economics` tells you if the business can actually make money
7. **Get the verdict** — `/report` generates a full validation report

## Commands

### Setup & Navigation

| Command | What it does |
|---------|-------------|
| `/setup` | Define your idea, problem, customer, and JTBD |
| `/next` | Get a smart recommendation for what to do next |

### Research

| Command | What it does |
|---------|-------------|
| `/research` | Full deep research (competitors + market + trends) |
| `/competitors` | Detailed competitor analysis |
| `/competitors add [url]` | Add a specific competitor |
| `/market` | Market sizing, trends, opportunity |
| `/gaps` | Find underserved segments |

### Preparation

| Command | What it does |
|---------|-------------|
| `/mockup` | ASCII wireframes (dashboard, mobile, flow) |
| `/mockup dashboard` | Main dashboard wireframe |
| `/mockup mobile` | Mobile version wireframe |
| `/mockup flow` | User flow diagram |
| `/prototype` | Interactive Next.js prototype with mock data |
| `/prototype add` | Add views to existing prototype |
| `/prototype data` | Regenerate mock data |
| `/prototype reset` | Start prototype from scratch |
| `/pitch` | One-pager pitch summary |
| `/pitch refresh` | Regenerate with latest data |

### Customer Discovery

| Command | What it does |
|---------|-------------|
| `/interviews setup` | Generate Mom Test interview questions |
| `/interviews add` | Log notes from a customer interview |
| `/interviews analyze` | Analyze all collected interviews |
| `/customers` | Generate ideal customer profile |

### Validation

| Command | What it does |
|---------|-------------|
| `/validate problem` | Is the problem real and painful? |
| `/validate solution` | Is your solution wanted? |
| `/validate viability` | Is the business viable? |
| `/pmf` | Product-Market Fit scoring |
| `/risks` | Identify key risks and threats |
| `/pivot` | Suggest pivots if validation fails |
| `/report` | Full validation report |

### Economics

| Command | What it does |
|---------|-------------|
| `/economics` | Full business economics (costs, revenue, viability) |
| `/economics costs` | Development and infrastructure costs |
| `/economics acquisition` | Customer acquisition analysis |
| `/economics unit` | Unit economics (LTV, CAC, payback) |

## Validation Framework

Idea OS scores your idea across 5 dimensions:

| Dimension | Key Question |
|-----------|-------------|
| **Problem** | Is the problem real and painful enough? |
| **Solution** | Do people want YOUR solution specifically? |
| **Market** | Is the market large enough and growing? |
| **Competition** | Can you differentiate and win? |
| **Viability** | Can you build it, sell it, and make money? |

### PMF Score

```
OVERALL PMF SCORE: 76/100

RECOMMENDATION: CONDITIONAL GO
```

- **80-100** — Strong signal. Go build it.
- **60-79** — Promising but needs refinement.
- **40-59** — Weak. Consider a pivot.
- **0-39** — No PMF. Stop or major pivot.

## Optional Integrations

Works great with just web search. Even better with:

| Integration | What it adds |
|-------------|-------------|
| **Ahrefs** | SEO data, competitor traffic, keyword research |
| **Firecrawl** | Structured competitor page scraping |
| **ForumScout** | Social listening, sentiment analysis |

## Project Structure

```
my-idea/
├── config/           # Your idea definition and data
│   ├── idea.md       # Business idea (human-approved)
│   ├── jobs.md       # Jobs to be Done hypotheses
│   └── ...
├── research/         # Auto-generated research
│   ├── competitors/
│   ├── market/
│   └── trends/
├── mockups/          # ASCII wireframes
├── pitch/            # One-pager pitch
├── economics/        # Business model analysis
├── validation/       # Problem/solution/viability results
├── reports/          # Full validation reports
└── .claude/          # Kit commands and knowledge
```

## Requirements

- [Claude Code](https://docs.anthropic.com/en/docs/claude-code) CLI
- Internet connection (for research)

## Related Kits

| Kit | When to use |
|-----|------------|
| [Landing Page](https://aiorg.dev/kits/landing-page) | Build a landing page to test positioning |
| [SaaS Dev Team](https://aiorg.dev/kits/saas-starter) | Ready to build? Full-stack SaaS boilerplate |
| [Marketing OS](https://aiorg.dev/kits/marketing-os) | Acquired users? Automate marketing |
| [Product OS](https://aiorg.dev/kits/product-os) | Post-launch PMF tracking |

## Links

- **Documentation:** https://aiorg.dev/docs/kits/idea-os
- **All kits:** https://aiorg.dev/kits
- **Issues:** https://github.com/aiorgdev/idea-os/issues

## License

MIT
