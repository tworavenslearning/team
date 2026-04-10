# TEAM — Technical Enablement Agent Multiplier

> *"AI agent personas purpose-built for technical enablement practitioners."*

16 specialist agents. 5 divisions. One complete enablement content lifecycle — from audit through measurement. TEAM gives a single enablement practitioner the throughput of an entire department.

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](https://makeapullrequest.com)
[![GitHub issues](https://img.shields.io/github/issues/tworavenslearning/team.svg)](https://github.com/tworavenslearning/team/issues)
[![GitHub last commit](https://img.shields.io/github/last-commit/tworavenslearning/team.svg)](https://github.com/tworavenslearning/team/commits/main)

---

## Who This Is For

TEAM is built for **technical enablement practitioners** — the people responsible for producing, maintaining, and measuring content that helps technical teams perform. If your role touches any of the following, TEAM was built for you:

- **SE Enablement** — keeping sales engineers current on fast-moving product and competitive content
- **GTM Enablement** — scaling onboarding, certification, and readiness programs across revenue teams
- **Partner Enablement** — maintaining accuracy and consistency across externally-distributed content
- **Content Operations** — managing quality, standards, and lifecycle governance across a content library

TEAM is not a general L&D toolkit. Every agent is calibrated for technical audiences, technical content, and technical enablement workflows. If that's your world, you're in the right place.

---

## Table of Contents

- [Prerequisites](#prerequisites)
- [How It Works](#how-it-works)
- [Quick Start](#quick-start)
- [The Agent Roster](#the-agent-roster)
- [The Enablement Lifecycle](#the-enablement-lifecycle)
- [Design Principles](#design-principles)
- [Multi-Tool Integrations](#multi-tool-integrations)
- [Contributing](#contributing)
- [Code of Conduct](CODE_OF_CONDUCT.md)
- [License](#license)

---

## Prerequisites

TEAM requires no installation, no backend, and no engineering setup. Before you start, you need:

- **An AI tool** — any of the following: [Claude Code](https://claude.ai/code), [Cursor](https://cursor.sh), [ChatGPT](https://chat.openai.com), [Aider](https://aider.chat), [Windsurf](https://codeium.com/windsurf), or [Gemini CLI](https://github.com/google-gemini/gemini-cli)
- **A subscription or API access** to the AI tool of your choice (TEAM works with any underlying model)
- **Content to work with** — training modules, documentation, assessments, or any enablement material in text or Markdown format

No coding required. If you can open a file and paste text, you can use TEAM.

---

## How It Works

These agents are **prompt personas**, not autonomous services. Each agent is a Markdown file that defines a specialized role: its identity, rules, workflows, deliverables, and success metrics. When loaded into an AI tool, the agent tells the AI *how to think and what to produce* for that domain.

**The practical flow:**

1. **Load an agent** into your AI tool of choice (Claude Code, Cursor, ChatGPT, Aider, Windsurf, etc.)
2. **Provide content** by pointing the tool at local files, pasting text, or connecting to external systems
3. **The AI executes** the agent's instructions against your content -- performing audits, analyzing feedback, checking standards, etc.
4. **You act on the output** -- the agent produces reports, flagged issues, recommendations, or transformed content for your team to review

This is the **MVP distribution** -- a self-contained collection you can share via OneDrive, GitHub, or any file-sharing system. Your team members load agents as needed in their own AI tool sessions.

> See [CUSTOMIZATION.md](CUSTOMIZATION.md) for step-by-step guidance on connecting agents to your specific systems (OneDrive, Confluence, web docs, LMS platforms).

---

## Quick Start

### Option 1: Use Directly with Claude Code

```bash
cp -r team/* ~/.claude/agents/

# Then in Claude Code:
# "Use the Content Drift Detector agent to review this training module"
```

### Option 2: Use with Other Tools (Cursor, Aider, Windsurf, etc.)

```bash
# Generate integration files for all supported tools
./scripts/convert.sh

# Install interactively (auto-detects installed tools)
./scripts/install.sh

# Or target a specific tool
./scripts/install.sh --tool cursor
```

### Option 3: Use as Reference

Browse the agents below, copy the content of any agent file, and paste it as a system prompt or context in any AI tool.

---

## The Agent Roster

### Content Intelligence Division

Detect content degradation, verify accuracy, and surface quality issues proactively.

| Agent | Alias | Specialty | When to Use |
|-------|-------|-----------|-------------|
| [Content Drift Detector](content-intelligence/content-intelligence-drift-detector.md) | Dutch | Factual staleness, technology shifts, broken references | Periodic content audits, post-release reviews, accuracy verification |
| [Quality Auditor](content-intelligence/content-intelligence-quality-auditor.md) | Murphy | Readability, structure, completeness, formatting | Pre-publish quality gates, library-wide quality sweeps |
| [Assessment Integrity Specialist](content-intelligence/content-intelligence-assessment-integrity-specialist.md) | Deckard | Exam item fairness, stems and distractors, blueprint alignment, defensible keys; offers CSV write-back (`deckard_*` columns) | Accreditation item banks, certification exams, high-stakes assessments |
| [Terminology Sentinel](content-intelligence/content-intelligence-terminology-sentinel.md) | Nada | Naming conventions, technical accuracy, term consistency | Cross-document terminology alignment, glossary maintenance |

### Content Architecture Division

Design modular, audience-adaptive content structures.

| Agent | Alias | Specialty | When to Use |
|-------|-------|-----------|-------------|
| [Modular Content Architect](content-architecture/content-architecture-modular-architect.md) | Batty | Composable structures, dependency graphs, reusable modules | New content planning, library restructuring, module design |
| [Audience Adapter](content-architecture/content-architecture-audience-adapter.md) | Leeloo | Skill-level adaptation, role-based transformation, format conversion | Multi-audience content delivery, localization, role-specific variants |
| [Learning Path Designer](content-architecture/content-architecture-learning-path-designer.md) | Daniel | Prerequisites, progression gates, branching paths | Curriculum design, onboarding journeys, certification tracks |

### Feedback and Insights Division

Convert learner signals into actionable content improvements.

| Agent | Alias | Specialty | When to Use |
|-------|-------|-----------|-------------|
| [Feedback Synthesizer](feedback-insights/feedback-insights-synthesizer.md) | Reese | Survey/ticket/comment aggregation, update prioritization | Post-training reviews, quarterly content planning, feedback triage |
| [Learner Intelligence Analyst](feedback-insights/feedback-insights-learner-intelligence-analyst.md) | Quaid | Behavioral signals, content gap detection, engagement diagnostics | Drop-off analysis, coverage gap identification, comprehension assessment |

### Standards and Governance Division

Maintain editorial, technical, and compliance standards.

| Agent | Alias | Specialty | When to Use |
|-------|-------|-----------|-------------|
| [Standards Enforcer](standards-governance/standards-governance-enforcer.md) | Rico | Editorial standards, technical accuracy, accessibility (WCAG) | Content review gates, standards audits, accessibility checks |
| [Style Guide Guardian](standards-governance/standards-governance-style-guide-guardian.md) | Snake | Voice, tone, formatting, brand alignment | Brand consistency reviews, style guide enforcement, cross-team alignment |
| [Compliance Reviewer](standards-governance/standards-governance-compliance-reviewer.md) | Ripley | Regulatory, legal, export control, organizational compliance | Pre-publish compliance gates, regulatory audits, policy updates |

### Metrics and Outcomes Division

Track adoption, measure learner outcomes, and report impact.

| Agent | Alias | Specialty | When to Use |
|-------|-------|-----------|-------------|
| [Adoption Tracker](metrics-outcomes/metrics-outcomes-adoption-tracker.md) | Max | Consumption patterns, enrollment rates, completion rates | Post-launch monitoring, quarterly adoption reviews, content performance |
| [Outcome Assessor](metrics-outcomes/metrics-outcomes-outcome-assessor.md) | Mal | Competency development, certification rates, time-to-productivity | Cohort analysis, program effectiveness reviews, ROI assessment |
| [Impact Reporter](metrics-outcomes/metrics-outcomes-impact-reporter.md) | Spike | Business outcome correlation, executive reporting | Quarterly business reviews, stakeholder updates, budget justification |

### Orchestration Division

Coordinate multi-agent workflows and manage the content enablement lifecycle.

| Agent | Specialty | When to Use |
|-------|-----------|-------------|
| [Enablement Orchestrator](orchestration/orchestration-enablement-orchestrator.md) | Pipeline management, agent coordination, quality gates | Full content lifecycle execution, multi-agent workflows, phase management |

---

## The Enablement Lifecycle

Agents work together across a 7-phase content lifecycle pipeline, managed by the Enablement Orchestrator:

| Phase | Name | Key Agents |
|-------|------|------------|
| 0 | Audit and Baseline | Drift Detector, Quality Auditor, Adoption Tracker |
| 1 | Analysis and Planning | Learner Intelligence Analyst, Feedback Synthesizer |
| 2 | Architecture and Standards | Modular Content Architect, Standards Enforcer, Style Guide Guardian |
| 3 | Content Development and Adaptation | Audience Adapter, Learning Path Designer |
| 4 | Quality Assurance | Quality Auditor, Assessment Integrity Specialist, Terminology Sentinel, Compliance Reviewer, Drift Detector |
| 5 | Publish and Distribute | Adoption Tracker, Impact Reporter |
| 6 | Measure and Optimize | Outcome Assessor, Adoption Tracker, Impact Reporter |

See [strategy/enablement-strategy.md](strategy/enablement-strategy.md) for the full orchestration strategy, quality gates, and handoff protocols.

---

## Design Principles

Every agent in this collection is built with:

1. **Hybrid RL Patterns** -- State/action/reward signals with heuristic policies and hooks for future ML integration
2. **Communication Protocols** -- Explicit negotiation, conflict resolution, and decision-making frameworks for multi-agent coordination
3. **Security-First Design** -- Content integrity verification, access awareness, audit trails, and data minimization
4. **Tool-Agnostic Integration** -- Abstract interfaces that map to any content system, LMS, or analytics platform
5. **Proactive delivery** -- Offer to merge findings into user-provided source artifacts (CSV, spreadsheets, repo files) when appropriate; prefer SME-ready tables and safe write-back (UTF-8, backup, copy-vs-overwrite). The Assessment Integrity Specialist documents a default column contract for exam banks.

---

## Multi-Tool Integrations

The collection works natively with Claude Code and ships conversion + install scripts for:

- **Claude Code** -- native `.md` agents
- **Cursor** -- `.mdc` rule files
- **Aider** -- single `CONVENTIONS.md`
- **Windsurf** -- single `.windsurfrules`
- **Antigravity (Gemini)** -- `SKILL.md` per agent
- **Gemini CLI** -- extension + skill files
- **OpenCode** -- `.md` agent files

```bash
./scripts/convert.sh          # Generate all integration files
./scripts/install.sh           # Interactive install
./scripts/install.sh --tool cursor  # Target a specific tool
```

---

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines on adding new agents, improving existing ones, and the pull request process.

Please note that this project follows a [Code of Conduct](CODE_OF_CONDUCT.md). By participating, you agree to uphold it. Report violations to tworavenslearning@gmail.com.

---

## License

MIT License -- use freely, commercially or personally. See [LICENSE](LICENSE).
