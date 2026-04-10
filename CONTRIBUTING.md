# Contributing to Enablement Agents

Thank you for contributing to the enablement agents collection. This guide covers how to add new agents, improve existing ones, and submit changes.

---

## How to Contribute

### 1. Add a New Agent

1. Fork the repository
2. Choose the appropriate division:
   - `content-intelligence/` -- Content monitoring and quality detection
   - `content-architecture/` -- Content structure and design
   - `feedback-insights/` -- Feedback processing and learner analytics
   - `standards-governance/` -- Standards, style, and compliance
   - `metrics-outcomes/` -- Adoption, outcomes, and impact measurement
   - `orchestration/` -- Workflow coordination
3. Create your agent file following the template below
4. Test the agent in real scenarios with your AI tool
5. Submit a pull request

### 2. Improve Existing Agents

- Add real-world examples and deliverable templates
- Enhance RL model definitions with better reward signals
- Improve communication protocol specificity
- Update workflows based on team experience
- Fix issues or improve clarity

### 3. Report Issues

- Check if the issue already exists
- Provide context about the agent and scenario
- Include the AI tool you were using
- Suggest improvements if you have ideas

---

## Agent File Template

Every agent must follow this structure:

```markdown
---
name: Agent Name
description: One-line description of the agent's specialty
color: colorname
---

# Agent Name Agent Personality

You are **Agent Name**, [role description]. [Key personality trait and approach].

## Identity and Memory
- **Role**: Clear role description
- **Personality**: Traits and communication style
- **Memory**: What the agent remembers and learns
- **Experience**: Domain expertise and perspective

## Core Mission
[Primary responsibilities with clear deliverables]

## Critical Rules
[Domain-specific rules and constraints]

## Reinforcement Learning Model
### State Space
### Action Space
### Reward Signal
### Policy
### Exploration Strategy
### ML Integration Hooks

## Communication Protocols
### Negotiation
### Conflict Resolution
### Decision Framework

## Security Posture
### Content Integrity
### Access Awareness
### Audit Trail
### Data Minimization

## Technical Deliverables
[Concrete examples, templates, frameworks]

## Workflow Process
[Step-by-step process]

## Communication Style
[How the agent communicates with examples]

## Proactive delivery
- Offer to write findings into user-provided structured sources (CSV, exports, manifests) when the tool allows; suggest `_reviewed` copies, UTF-8, and backup before overwrite.
- Exam-item agents: document default output columns for tabular banks (see Assessment Integrity Specialist).

## Learning and Memory
[What the agent learns from over time]

## Success Metrics
[Measurable outcomes]

## Advanced Capabilities
[Advanced techniques]

## Tool-Agnostic Integration Points
[Abstract interfaces for external systems]
```

---

## Required Sections

**Errors (must fix before merge):**
- YAML frontmatter with `name`, `description`, and `color` fields
- Body content (minimum 50 words)

**Warnings (recommended):**
- Identity section
- Core Mission section
- Critical Rules section
- Reinforcement Learning Model section
- Communication Protocols section
- Security Posture section
- Proactive delivery section (offer structured write-back to source artifacts when appropriate)

---

## What Makes a Great Enablement Agent

**Great agents have:**
- Narrow, deep specialization within the enablement domain
- Concrete deliverable templates and examples
- Well-defined RL state/action/reward signals
- Explicit communication protocols for multi-agent scenarios
- Security-aware design with audit trail awareness
- Measurable success metrics tied to enablement outcomes

**Avoid:**
- Generic "helpful assistant" personality
- Vague deliverables without templates
- Missing RL or communication protocol sections
- Overly broad scope (keep agents focused)
- Tool-specific dependencies (stay tool-agnostic)

---

## Pull Request Process

1. Create a branch: `git checkout -b add-agent-name`
2. Add your agent file(s) in the appropriate division directory
3. Run the linter: `./scripts/lint-agents.sh`
4. Commit and push
5. Open a pull request with:
   - Agent name and division
   - What gap the agent fills
   - How you tested it

---

## Style Guide

- Use Markdown formatting consistently
- Include section header markers for scannability
- Use code blocks with syntax highlighting for all examples
- Bold for emphasis, `code` for technical terms
- Be specific: "Reduce drift-flagged items by 40%" not "Improve content quality"
- Be practical: include real templates, not theoretical descriptions

---

## License

By contributing, you agree that your contributions will be licensed under the MIT License.
