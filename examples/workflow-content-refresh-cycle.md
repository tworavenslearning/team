# Workflow Example: Quarterly Content Refresh Cycle

This example walks through a realistic end-to-end quarterly content refresh using the enablement agents. It shows the actual prompts a team member would type into their AI tool, along with expected outputs and file paths.

---

## Scenario

The enablement team runs a quarterly content refresh for the Security Fundamentals track. Training content lives in OneDrive at `~/OneDrive/Training-Content/Security-Fundamentals/`. The goal is to audit for drift, assess quality of flagged content, synthesize learner feedback, analyze engagement patterns, have proposed updates reviewed against standards, and establish baseline adoption metrics.

---

## Step 1: Content Drift Detector — Audit the Module Folder

**Prompt:**

```
Act as the Content Drift Detector. Audit the training content in ~/OneDrive/Training-Content/Security-Fundamentals/ for factual staleness, technology shifts, and broken references. Compare against the current product documentation at docs.example.com/security and the v12 release notes. Produce a drift assessment report with severity classifications and remediation recommendations.
```

**Expected output:** A drift assessment report (Markdown) containing:
- Executive summary with total items audited, drift counts by severity (Critical/High/Medium/Low)
- Per-finding entries with file path, section reference, current vs. authoritative source text, severity, learner impact estimate, and remediation recommendation
- Drift trend analysis and next recommended audit date

**Example output location:** `~/reports/drift-security-fundamentals-Q1-2026.md`

---

## Step 2: Quality Auditor — Assess Flagged Content

**Prompt:**

```
Act as the Quality Auditor. Review the content files flagged as drifted in ~/reports/drift-security-fundamentals-Q1-2026.md. For each Critical and High severity item, assess the full module at ~/OneDrive/Training-Content/Security-Fundamentals/ for readability, structural completeness, pedagogical design, and formatting consistency. Produce a quality scorecard for each flagged module and a summary of whether quality issues compound the drift findings.
```

**Expected output:** Quality scorecards per module with:
- Overall score (0-100) and dimension breakdowns (Readability, Structural Completeness, Pedagogical Design, Content Accuracy Markers, Formatting Consistency)
- Structural elements checklist (learning objectives, prerequisites, examples, exercises, summaries, assessments)
- Critical/Significant/Minor findings with specific recommendations
- Quality certification (PASS / CONDITIONAL PASS / FAIL)

**Example output location:** `~/reports/quality-audit-security-fundamentals-Q1-2026.md`

---

## Step 3: Feedback Synthesizer — Process MindTickle Feedback

**Prompt:**

```
Act as the Feedback Synthesizer. I have exported MindTickle feedback data for Q1 2026 from the Security Fundamentals track. The export is at ~/OneDrive/Exports/MindTickle-feedback-Q1-2026.csv. Synthesize this feedback into prioritized content update recommendations. Deduplicate themes, resolve contradictions where possible, and produce a content update backlog with impact/effort scoring. Cross-reference with the drift findings in ~/reports/drift-security-fundamentals-Q1-2026.md to elevate items where both signals align.
```

**Expected output:** A feedback synthesis report and content update backlog containing:
- Key themes with evidence counts and representative anonymized quotes
- Contradictions identified and recommended resolutions
- Prioritized backlog (Quick Wins, Strategic Investments, Low Priority) with specific content targets, actions, evidence basis, and effort estimates
- Items elevated due to alignment with drift findings

**Example output location:** `~/reports/feedback-synthesis-security-Q1-2026.md` and `~/reports/content-update-backlog-Q1-2026.md`

---

## Step 4: Learner Intelligence Analyst — Engagement Analytics

**Prompt:**

```
Act as the Learner Intelligence Analyst. I have LMS engagement analytics for the Security Fundamentals track (completion rates, time-on-task, drop-off points) in ~/OneDrive/Exports/LMS-analytics-Security-Q1-2026.xlsx. Produce a Learner Intelligence Report that identifies behavioral signals (drop-offs, rewatch patterns, assessment failures) and content gap hypotheses. Correlate with the feedback synthesis and drift reports. Hand off prioritized findings for content planning.
```

**Expected output:** A Learner Intelligence Report containing:
- Behavioral signal analysis (drop-off patterns by module with completion rates, hypotheses, confidence levels)
- Engagement vs. disengagement mapping
- Content gap analysis (validated gaps with evidence, hypothesized gaps needing validation)
- Unified diagnostic picture and handoff to Feedback Synthesizer

**Example output location:** `~/reports/learner-intelligence-security-Q1-2026.md`

---

## Step 5: Standards Enforcer — Review Proposed Updates

**Prompt:**

```
Act as the Standards Enforcer. Review the proposed content updates from ~/reports/content-update-backlog-Q1-2026.md. For each high-priority item (FB-001 through FB-005), I will provide the draft updated content. Grade each against editorial standards, technical accuracy requirements, and WCAG 2.1 Level AA accessibility guidelines. Produce a standards compliance report with pass/fail/conditional for each proposed update, citing specific criteria for every finding.
```

**Expected output:** A standards compliance report with:
- Per-document grading (Pass / Conditional Pass / Fail)
- Findings by category (Editorial, Technical, Accessibility) with specific criterion citations (e.g., WCAG 2.1.1 Keyboard, Level A)
- Remediation guidance for each failure
- Conditional pass exceptions with approval path and remediation timeline

**Example output location:** `~/reports/standards-review-proposed-updates-Q1-2026.md`

---

## Step 6: Adoption Tracker — Establish Baseline Metrics

**Prompt:**

```
Act as the Adoption Tracker. Before we publish the Q1 content updates, establish baseline adoption metrics for the Security Fundamentals track. Use the LMS data in ~/OneDrive/Exports/LMS-analytics-Security-Q1-2026.xlsx. Report enrollment rates, completion rates at module and track level, time-to-first-access, and content reach by audience segment (Sales, Engineering, Support). Produce a baseline dashboard we can use to measure post-update adoption impact.
```

**Expected output:** An adoption baseline report containing:
- Enrollment and completion rates by module and segment
- Time-to-first-access distributions
- Content reach percentages by audience segment
- Consumption patterns (skip rates, revisit rates)
- Baseline snapshot date and recommended comparison window for post-update measurement

**Example output location:** `~/reports/adoption-baseline-security-Q1-2026.md`

---

## Workflow Summary

| Step | Agent | Input | Output |
|------|-------|-------|--------|
| 1 | Content Drift Detector | OneDrive folder, product docs | Drift assessment report |
| 2 | Quality Auditor | Drift report, content files | Quality scorecards |
| 3 | Feedback Synthesizer | MindTickle export, drift report | Synthesis report, update backlog |
| 4 | Learner Intelligence Analyst | LMS analytics, prior reports | Learner Intelligence Report |
| 5 | Standards Enforcer | Update backlog, draft content | Standards compliance report |
| 6 | Adoption Tracker | LMS analytics | Adoption baseline dashboard |

---

## Tips for Running This Workflow

- Run the Content Drift Detector first; its findings inform prioritization in later steps.
- Export MindTickle feedback and LMS analytics in CSV or XLSX format before synthesis.
- Use the handoff template when passing outputs between agents to preserve context.
- Establish the adoption baseline before publishing updates so post-update comparison is meaningful.
