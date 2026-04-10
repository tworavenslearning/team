# Phase 4: Quality Assurance

## Objective

Validate all content updates meet quality, terminology, compliance, and accuracy standards. Ensure no drift was introduced during development and that content is ready for publication.

## Active Agents

- **Quality Auditor**: Performs structured quality review against rubric. Validates completeness, clarity, accuracy, and alignment with learning objectives.
- **Assessment Integrity Specialist**: When certification or high-stakes exam banks are in scope, reviews items and forms for fairness, blueprint alignment, stem and distractor quality, and defensible keys; flags ambiguity and trick framing. Document N/A in QA sign-off when no scored exam content is part of the release.
- **Terminology Sentinel**: Verifies consistent and correct use of terminology across all content. Flags deviations from glossary and style guide.
- **Compliance Reviewer**: Validates content against organizational compliance requirements (legal, regulatory, accessibility, branding).
- **Content Drift Detector**: Re-scans content against source documentation to confirm no new drift was introduced during development.

## Inputs

- Content Package from Phase 3 (with manifest)
- Development Completion Report
- Standards Compliance Checklist (with self-check results)
- Architecture Blueprint
- Style Guide and Terminology Glossary
- Source documentation and reference materials

## Activities

1. **Quality Audit**
   - Quality Auditor reviews each updated asset against quality rubric.
   - Validate completeness, clarity, accuracy, and learning objective alignment.
   - Record pass/fail and remediation requirements.
   - Escalate critical failures for immediate fix.

1b. **Assessment Integrity (when applicable)**
   - Assessment Integrity Specialist reviews exam item banks and forms against blueprint, objectives, and item-quality criteria.
   - Record per-item and bank-level verdicts; route editorial fixes to Standards Enforcer and term conflicts to Terminology Sentinel.
   - The specialist **proactively offers** to write findings into the source bank file (or a `*_reviewed.csv` copy) using the documented column contract: `item_id`, `deckard_verdict`, `deckard_severity`, `deckard_criterion`, `deckard_recommendation`, `deckard_review_date` (UTF-8; backup before overwrite).
   - If the release has no exam bank, record explicit N/A for this stream in the QA sign-off.

2. **Terminology Check**
   - Terminology Sentinel scans all content for terminology consistency.
   - Verify alignment with glossary and style guide.
   - Flag incorrect, inconsistent, or deprecated terms.
   - Produce terminology correction list.

3. **Compliance Review**
   - Compliance Reviewer validates against accessibility (WCAG), legal, regulatory, and branding requirements.
   - Check for required disclosures, disclaimers, and approvals.
   - Document compliance status per asset.
   - Escalate non-compliant items for remediation.

4. **Drift Verification**
   - Content Drift Detector re-scans updated content against source documentation.
   - Confirm no new drift introduced during development.
   - Verify version alignment and reference accuracy.
   - Report any new drift for remediation.

5. **Remediation and Re-Review**
   - Route failures to appropriate agents or developers for fix.
   - Re-run quality, terminology, compliance, and drift checks on remediated content.
   - Confirm all items pass before advancing to Phase 5.

## Quality Gate

- All content passes quality audit.
- Assessment integrity review complete with no critical item defects, or stream documented N/A when no exam content is in scope.
- Terminology check complete with no critical deviations.
- Compliance review passed for all assets.
- Drift verification confirms no new drift.
- Remediation complete for any failures; re-review passed.

## Outputs

- Quality Audit Report (pass/fail per asset)
- Assessment Bank Review Summary and Item Review Sheets (when exam banks in scope; otherwise N/A record)
- Terminology Correction Report (if any)
- Compliance Review Certificate
- Drift Verification Report
- QA Sign-Off Document
- Final Content Package (approved for publication)

## Handoff Instructions

1. Deliver the Final Content Package with QA Sign-Off Document to Phase 5.
2. Include the Quality Audit Report, Assessment Bank Review Summary (or N/A), and Compliance Review Certificate for audit trail.
3. Document any approved exceptions or waivers (e.g., minor terminology variance with rationale).
4. Provide publication checklist (assets, order, metadata) for Phase 5.
5. Specify any audience-specific or region-specific publication requirements.
6. Confirm content location and format for publication system.

## Common Failure Modes

- **Rushed review**: QA compressed to meet deadline. Mitigation: Do not skip any validation stream in scope; prioritize critical content if time-constrained.
- **Siloed validation**: Agents work in isolation; conflicts missed. Mitigation: Hold joint review session; use consolidated checklist.
- **Remediation loop**: Multiple rounds of fix-and-review. Mitigation: Clear failure criteria; single point of contact for remediation questions.
- **Source drift during QA**: Source docs updated while QA in progress. Mitigation: Freeze source version for drift check; document version used.
- **Compliance ambiguity**: Unclear whether content meets requirement. Mitigation: Escalate to compliance owner; obtain written confirmation.

## Duration Guidance

1-2 weeks. Quality audit and terminology check typically require 3-5 days; compliance and drift verification add 2-3 days. Remediation and re-review may extend to 2 weeks if failures are significant. Do not proceed to Phase 5 without QA sign-off.
