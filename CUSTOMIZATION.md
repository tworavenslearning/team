# Customization Guide: Connecting Agents to Your Systems

This guide walks you through connecting the enablement agents to your specific content systems, feedback sources, and analytics platforms. The agents are designed to be tool-agnostic -- they work with any system that can provide content and data to your AI tool.

---

## Understanding the Connection Model

Agents don't connect to systems directly. Instead, **you provide content to the agent** through your AI tool. There are three patterns:

| Pattern | How It Works | Best For |
|---------|-------------|----------|
| **Local Files** | Point the AI tool at files synced to your machine | OneDrive, Google Drive, Dropbox, local repos |
| **MCP Servers** | Connect the AI tool to external systems via Model Context Protocol | Confluence, databases, APIs with MCP adapters |
| **Manual Input** | Export data and provide it to the agent as files or pasted content | LMS exports, analytics CSVs, one-off reviews |

---

## OneDrive (Training Content)

OneDrive files sync to a local folder, making them directly accessible to any AI tool that reads local files.

### Setup

1. Ensure OneDrive is syncing to your machine (typically `~/OneDrive/` or `~/Library/CloudStorage/OneDrive-YourOrg/`)
2. Identify the folder path for your training content

### Usage Examples

**Content Drift Detector audit:**
```
Use the Content Drift Detector agent. Audit the training modules in
~/OneDrive/Training-Content/networking-fundamentals/ for factual
staleness, outdated technology references, and broken links.
Focus on content last updated more than 6 months ago.
```

**Quality Auditor sweep:**
```
Use the Quality Auditor agent. Perform a quality assessment of all
documents in ~/OneDrive/Training-Content/security-track/.
Check readability, structural completeness, and formatting consistency.
Produce a quality scorecard for each document.
```

**Modular Content Architect review:**
```
Use the Modular Content Architect agent. Analyze the content structure
in ~/OneDrive/Training-Content/cloud-certification/ and identify
opportunities to extract reusable modules. Map content dependencies
and recommend a modular restructuring plan.
```

**Assessment Integrity Specialist (exam bank CSV):**
```
Use the Assessment Integrity Specialist agent. Review the question bank at
/path/to/bank.csv for item quality and fairness. Offer to merge findings
into that file (or save bank_reviewed.csv) with columns: item_id,
deckard_verdict, deckard_severity, deckard_criterion, deckard_recommendation,
deckard_review_date. Use UTF-8 and preserve existing columns.
```

---

## Confluence (Product Documentation)

Confluence pages can be accessed through MCP servers or by exporting content.

### Option A: MCP Server (Recommended for Claude Code / Cursor)

Several open-source Confluence MCP servers exist. Once configured, your AI tool can read Confluence pages directly.

1. Install a Confluence MCP server (search for "confluence mcp server" in your tool's extension marketplace or on GitHub)
2. Configure with your Confluence URL and API token
3. Reference pages by URL or space/title in your prompts

```
Use the Standards Enforcer agent. Review the Confluence page at
https://your-org.atlassian.net/wiki/spaces/DOCS/pages/12345
against our editorial standards matrix. Flag any violations and
suggest corrections.
```

### Option B: Export and Provide

1. Export Confluence pages as PDF or HTML
2. Save to a local folder
3. Point the agent at the exported files

```
Use the Terminology Sentinel agent. Check all exported Confluence
docs in ~/Downloads/confluence-export/ for terminology consistency.
Compare against the glossary in ~/OneDrive/Standards/glossary.md.
```

---

## Web Documentation (Official Doc Sites)

For publicly accessible documentation sites.

### Direct URL Reference

Most AI tools can fetch web content when given a URL:

```
Use the Content Drift Detector agent. Compare our training module
~/OneDrive/Training-Content/product-x-admin-guide.md against the
official documentation at https://docs.example.com/product-x/admin/.
Flag any discrepancies where our training content has drifted from
the current official documentation.
```

### Local Mirror

For large documentation sites, create a local mirror:

```bash
# Use wget or httrack to mirror relevant sections
wget -r -l 2 -np -k https://docs.example.com/product-x/ -P ~/docs-mirror/
```

Then point agents at `~/docs-mirror/`.

---

## MindTickle LMS (Feedback Data)

Feedback and learner analytics from MindTickle need to be exported and provided to agents.

### Exporting Feedback Data

1. **Learner feedback/survey results**: Export from MindTickle as CSV
2. **Completion and engagement data**: Export course analytics reports
3. **Assessment results**: Export quiz/test performance data

Save exports to a consistent location (e.g., `~/OneDrive/Enablement-Data/mindtickle-exports/`).

### Usage Examples

**Feedback Synthesizer:**
```
Use the Feedback Synthesizer agent. Analyze the learner feedback data
in ~/OneDrive/Enablement-Data/mindtickle-exports/q1-feedback.csv.
Aggregate the feedback into prioritized content update recommendations.
Reconcile any contradictory signals and produce an actionable update
backlog ranked by impact and effort.
```

**Learner Intelligence Analyst:**
```
Use the Learner Intelligence Analyst agent. Analyze the engagement
data in ~/OneDrive/Enablement-Data/mindtickle-exports/course-analytics.csv.
Identify drop-off points, low-engagement modules, and assessment
failure patterns. Cross-reference with our content catalog in
~/OneDrive/Training-Content/ to identify coverage gaps.
```

**Adoption Tracker:**
```
Use the Adoption Tracker agent. Review the enrollment and completion
data in ~/OneDrive/Enablement-Data/mindtickle-exports/adoption-report.csv.
Generate an adoption dashboard showing consumption trends, completion
rates by audience segment, and content reach metrics.
```

### MindTickle API (Advanced)

If your organization has MindTickle API access, you can script data extraction:

```bash
# Example: fetch course completion data (adjust per your API setup)
curl -H "Authorization: Bearer $MINDTICKLE_TOKEN" \
  "https://api.mindtickle.com/v2/analytics/completions?from=2026-01-01" \
  -o ~/OneDrive/Enablement-Data/mindtickle-exports/completions.json
```

Then provide the JSON file to the relevant agent.

---

## Mapping Abstract Interfaces

Each agent defines "Tool-Agnostic Integration Points" -- abstract interfaces that you map to your actual systems:

| Abstract Interface | Your System | Connection Method |
|-------------------|-------------|-------------------|
| Content Repository | OneDrive | Local sync path |
| Product Documentation | Confluence, doc sites | MCP server or export |
| Feedback Source | MindTickle | CSV/JSON export |
| Metrics Data Store | MindTickle analytics | CSV/JSON export |
| Standards Reference | OneDrive (style guides, glossaries) | Local sync path |
| Notification Channel | Email, Slack, Teams | Manual for MVP; automation in v2 |

---

## Tips for Effective Agent Usage

1. **Be specific about file paths** -- give the agent exact paths rather than vague references
2. **Provide context** -- tell the agent what type of content it's reviewing and what standards to apply
3. **Scope the task** -- one content area or one type of check per session produces better results than trying to do everything at once
4. **Save agent outputs** -- save reports and recommendations to a consistent location for tracking
5. **Chain agents** -- use one agent's output as input for the next (e.g., Drift Detector findings feed into Feedback Synthesizer prioritization)
