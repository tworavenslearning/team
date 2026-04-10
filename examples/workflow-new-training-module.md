# Workflow Example: Creating a New Training Module from Scratch

This example walks through creating a new training module from scratch using the enablement agents. It shows realistic prompts and expected outputs for each step, from gap identification through design, adaptation, quality checks, and monitoring setup.

---

## Scenario

The Learner Intelligence Analyst has identified a content gap: learners are searching for "OAuth 2.0 troubleshooting" with no matching content, and support tickets show 23 requests in Q1. The team decides to create a new OAuth Troubleshooting module. This workflow covers the full lifecycle from justification through launch and monitoring.

---

## Step 1: Content Gap Identifier — Justify the New Module

**Prompt:**

```
Act as the Learner Intelligence Analyst. Review the Content Gap Analysis in ~/reports/content-gap-analysis-Q1-2026.md. The gap GAP-001 (OAuth 2.0 troubleshooting) has been validated. Produce a one-page justification for creating a new OAuth Troubleshooting module that includes: evidence of learner need (support tickets, search queries, assessment failures), estimated impact (support ticket reduction, improved pass rates), and recommended placement in the Security Fundamentals track.
```

**Expected output:** A justification document containing:
- Evidence summary (support ticket volume, search query themes, assessment failure correlation)
- Need strength classification (High/Medium/Low)
- Estimated impact metrics
- Recommended placement (e.g., after Security Fundamentals Module 4, before Advanced Auth)
- Rationale for module vs. section addition

**Example output location:** `~/reports/oauth-troubleshooting-module-justification.md`

---

## Step 2: Modular Content Architect — Design Module Structure

**Prompt:**

```
Act as the Modular Content Architect. Design the structure for a new OAuth Troubleshooting module. Use the justification in ~/reports/oauth-troubleshooting-module-justification.md. Produce a content architecture blueprint that includes: module specification (learning objectives, prerequisites, duration target 40-60 min), dependency graph (prerequisite: Security Fundamentals Module 4, Advanced Auth overview), and version compatibility. Ensure the module is consumable standalone and fits the existing Security track dependency map at ~/OneDrive/Training-Content/Security-Fundamentals/module-dependencies.md.
```

**Expected output:** A content architecture blueprint containing:
- Module specification (ID, title, learning objectives, prerequisites, estimated duration)
- Dependency graph showing relationships to existing modules
- Version compatibility matrix
- Interface definition (inputs/outputs for curriculum assembly)
- Granularity rationale (why 20-30 min, not larger or smaller)

**Example output location:** `~/reports/oauth-troubleshooting-module-blueprint.md`

---

## Step 3: Learning Path Designer — Place in Learning Paths

**Prompt:**

```
Act as the Learning Path Designer. Integrate the new OAuth Troubleshooting module (blueprint at ~/reports/oauth-troubleshooting-module-blueprint.md) into the existing learning paths. Review ~/OneDrive/Training-Content/Security-Fundamentals/learning-paths.json. Place the module in the appropriate paths (e.g., Security Engineer track, Developer track), define progression gates if needed, and ensure prerequisite chains remain valid. Produce an updated learning path specification with the new module placed.
```

**Expected output:** An updated learning path specification containing:
- Modified path definitions with the new module inserted at the correct position
- Prerequisite chain validation
- Progression gate placement (if applicable)
- Branching path updates (e.g., optional for Developer track, required for Security Engineer track)
- Competency mapping (e.g., maps to "Troubleshooting" competency at Intermediate level)

**Example output location:** `~/reports/learning-paths-updated-oauth-module.md`

---

## Step 4: Audience Adapter — Create Role-Specific Variants

**Prompt:**

```
Act as the Audience Adapter. I have drafted the core OAuth Troubleshooting module content at ~/OneDrive/Training-Content/Security-Fundamentals/OAuth-Troubleshooting/draft-core.md. Create role-specific variants for: (1) Security Engineers — full technical depth, CLI examples, configuration details; (2) Sales Engineers — value-focused, customer-facing troubleshooting scenarios, demo scripts; (3) Developers — API-focused, token refresh code samples, integration patterns. Preserve technical accuracy in all variants. Document the adaptation rationale for each.
```

**Expected output:** Three adapted content files with:
- Security Engineer variant: technical depth, CLI, configuration
- Sales Engineer variant: value framing, customer scenarios, demos
- Developer variant: API focus, code samples, integration patterns
- Adaptation log documenting what changed and why for each variant
- Accuracy validation note confirming no technical errors introduced

**Example output locations:** `~/OneDrive/Training-Content/Security-Fundamentals/OAuth-Troubleshooting/variant-security-engineer.md`, `variant-sales-engineer.md`, `variant-developer.md`

---

## Step 5: Quality Auditor — Quality Check

**Prompt:**

```
Act as the Quality Auditor. Audit the three OAuth Troubleshooting variants at ~/OneDrive/Training-Content/Security-Fundamentals/OAuth-Troubleshooting/. Assess each against the quality framework: readability, structural completeness, pedagogical design, content accuracy markers, and formatting consistency. Produce a quality scorecard for each variant and identify any that need remediation before publication.
```

**Expected output:** Quality scorecards for each variant with:
- Overall score and dimension breakdowns
- Structural elements checklist
- Critical/Significant/Minor findings
- Quality certification per variant
- Cross-variant consistency check (do all variants cover the same learning objectives?)

**Example output location:** `~/reports/quality-audit-oauth-troubleshooting-variants.md`

---

## Step 6: Terminology Sentinel — Terminology Check

**Prompt:**

```
Act as the Terminology Sentinel. Review the OAuth Troubleshooting module variants at ~/OneDrive/Training-Content/Security-Fundamentals/OAuth-Troubleshooting/ against the authoritative glossary at ~/OneDrive/Training-Content/glossary.md and product documentation terminology. Flag any term inconsistencies, unauthorized term introductions, or first-use definition gaps. Produce a terminology compliance report.
```

**Expected output:** A terminology compliance report containing:
- Per-document compliance assessment
- Flagged inconsistencies with severity and correction recommendation
- Glossary addition recommendations (if new legitimate terms were introduced)
- Alignment check with product UI/CLI terminology

**Example output location:** `~/reports/terminology-compliance-oauth-troubleshooting.md`

---

## Step 7: Compliance Reviewer — Compliance Check

**Prompt:**

```
Act as the Compliance Reviewer. Perform a compliance review of the OAuth Troubleshooting module variants at ~/OneDrive/Training-Content/Security-Fundamentals/OAuth-Troubleshooting/. Check regulatory compliance (GDPR, data privacy mentions), legal requirements (copyright, licensing, trademark usage), and organizational policy alignment. Generate a full audit trail. Block publication if any critical compliance issues are found.
```

**Expected output:** A compliance review report with:
- Per-document compliance status (Compliant / Non-Compliant / Escalation Required)
- Findings by category (Regulatory, Legal, Export Control, Organizational Policy)
- Full audit trail (document ID, date, reviewer, criteria checked, findings, decision, rationale)
- Clearance for publication or block with specific remediation required

**Example output location:** `~/reports/compliance-review-oauth-troubleshooting.md`

---

## Step 8: Adoption Tracker — Set Up Monitoring

**Prompt:**

```
Act as the Adoption Tracker. The OAuth Troubleshooting module will be published next week. Set up monitoring for the new module. Define the metrics we should track: enrollment rate, completion rate, time-to-first-access, content reach by segment (Security Engineer, Sales Engineer, Developer). Produce a monitoring plan with baseline establishment steps, dashboard requirements, and recommended review cadence (e.g., weekly for first 4 weeks, then monthly). Include success thresholds (e.g., >60% completion within 30 days of assignment).
```

**Expected output:** A monitoring plan containing:
- Metrics to track with definitions
- Baseline establishment procedure (when to capture, what to capture)
- Dashboard requirements (what to display, segment breakdowns)
- Review cadence and escalation triggers
- Success thresholds and failure indicators
- Handoff to Outcome Assessor for downstream effectiveness measurement

**Example output location:** `~/reports/adoption-monitoring-plan-oauth-troubleshooting.md`

---

## Workflow Summary

| Step | Agent | Input | Output |
|------|-------|-------|--------|
| 1 | Learner Intelligence Analyst (Content Gap Identifier) | Gap analysis | Module justification |
| 2 | Modular Content Architect | Justification, dependency map | Architecture blueprint |
| 3 | Learning Path Designer | Blueprint, learning paths | Updated path specification |
| 4 | Audience Adapter | Draft content | Role-specific variants |
| 5 | Quality Auditor | Variants | Quality scorecards |
| 6 | Terminology Sentinel | Variants, glossary | Terminology compliance report |
| 7 | Compliance Reviewer | Variants | Compliance review, audit trail |
| 8 | Adoption Tracker | Module metadata | Monitoring plan |

---

## Tips for Running This Workflow

- Start with validated gap evidence; unvalidated gaps may lead to unused content.
- Run the Modular Content Architect before writing content; the blueprint guides structure.
- Create audience variants after the core content is approved; adaptation preserves accuracy when the source is solid.
- Quality checks (Quality Auditor, Terminology Sentinel, Compliance Reviewer) can run in parallel on the variants once drafts are ready.
- Establish the adoption monitoring plan before launch so the first metrics are captured from day one.
