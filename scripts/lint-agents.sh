#!/usr/bin/env bash
#
# lint-agents.sh — Validates enablement agent markdown files.
#
# Rules:
#   1. ERROR: YAML frontmatter must exist with name, description, color
#   2. WARN:  Recommended sections: Identity, Core Mission, Critical Rules
#   3. WARN:  Extended sections: Reinforcement Learning Model, Communication
#             Protocols, Security Posture
#   4. WARN:  Body must have meaningful content (>50 words)
#
# Usage: ./scripts/lint-agents.sh [file ...]
#   If no files given, scans all agent directories.
#
# Exit: 0 if no errors, 1 if any ERROR-level issues found.

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"

AGENT_DIRS=(
  content-intelligence
  content-architecture
  feedback-insights
  standards-governance
  metrics-outcomes
  orchestration
)

REQUIRED_FRONTMATTER=("name" "description" "color")
RECOMMENDED_SECTIONS=("Identity" "Core Mission" "Critical Rules")
EXTENDED_SECTIONS=("Reinforcement Learning Model" "Communication Protocols" "Security Posture")

errors=0
warnings=0

lint_file() {
  local file="$1"

  # 1. Check frontmatter delimiters
  local first_line
  first_line=$(head -1 "$file")
  if [[ "$first_line" != "---" ]]; then
    echo "ERROR $file: missing frontmatter opening ---"
    errors=$((errors + 1))
    return
  fi

  # Extract frontmatter (between first and second ---)
  local frontmatter
  frontmatter=$(awk 'NR==1{next} /^---$/{exit} {print}' "$file")

  if [[ -z "$frontmatter" ]]; then
    echo "ERROR $file: empty or malformed frontmatter"
    errors=$((errors + 1))
    return
  fi

  # 2. Check required frontmatter fields
  for field in "${REQUIRED_FRONTMATTER[@]}"; do
    if ! echo "$frontmatter" | grep -qE "^${field}:"; then
      echo "ERROR $file: missing frontmatter field '${field}'"
      errors=$((errors + 1))
    fi
  done

  # 3. Extract body for section and word-count checks
  local body
  body=$(awk 'BEGIN{n=0} /^---$/{n++; next} n>=2{print}' "$file")

  # 4. Check recommended sections (warn only)
  for section in "${RECOMMENDED_SECTIONS[@]}"; do
    if ! echo "$body" | grep -qi "$section"; then
      echo "WARN  $file: missing recommended section '${section}'"
      warnings=$((warnings + 1))
    fi
  done

  # 5. Check extended sections (warn only)
  for section in "${EXTENDED_SECTIONS[@]}"; do
    if ! echo "$body" | grep -qi "$section"; then
      echo "WARN  $file: missing extended section '${section}'"
      warnings=$((warnings + 1))
    fi
  done

  # 6. Check body has meaningful content (>50 words)
  if [[ $(echo "$body" | wc -w) -lt 50 ]]; then
    echo "WARN  $file: body seems very short (< 50 words)"
    warnings=$((warnings + 1))
  fi
}

# Collect files to lint
files=()
if [[ $# -gt 0 ]]; then
  files=("$@")
else
  for dir in "${AGENT_DIRS[@]}"; do
    dirpath="$REPO_ROOT/$dir"
    if [[ -d "$dirpath" ]]; then
      while IFS= read -r f; do
        files+=("$f")
      done < <(find "$dirpath" -maxdepth 1 -name "*.md" -type f | sort)
    fi
  done
fi

if [[ ${#files[@]} -eq 0 ]]; then
  echo "No agent files found."
  exit 1
fi

echo "Linting ${#files[@]} agent files..."
echo ""

for file in "${files[@]}"; do
  lint_file "$file"
done

echo ""
echo "Results: ${errors} error(s), ${warnings} warning(s) in ${#files[@]} files."

if [[ $errors -gt 0 ]]; then
  echo "FAILED: fix the errors above before merging."
  exit 1
else
  echo "PASSED"
  exit 0
fi
