#!/usr/bin/env bash
#
# convert.sh — Convert enablement agent .md files into tool-specific formats.
#
# Reads all agent files from the standard category directories and outputs
# converted files to integrations/<tool>/. Run this to regenerate all
# integration files after adding or modifying agents.
#
# Usage:
#   ./scripts/convert.sh [--tool <name>] [--out <dir>] [--help]
#
# Tools:
#   antigravity  — Antigravity skill files (~/.gemini/antigravity/skills/)
#   gemini-cli   — Gemini CLI extension (skills/ + gemini-extension.json)
#   opencode     — OpenCode agent files (.opencode/agent/*.md)
#   cursor       — Cursor rule files (.cursor/rules/*.mdc)
#   aider        — Single CONVENTIONS.md for Aider
#   windsurf     — Single .windsurfrules for Windsurf
#   all          — All tools (default)
#
# Output is written to integrations/<tool>/ relative to the repo root.
# This script never touches user config dirs — see install.sh for that.

set -euo pipefail

# --- Colour helpers ---
if [[ -t 1 ]]; then
  GREEN=$'\033[0;32m'; YELLOW=$'\033[1;33m'; RED=$'\033[0;31m'; BOLD=$'\033[1m'; RESET=$'\033[0m'
else
  GREEN=''; YELLOW=''; RED=''; BOLD=''; RESET=''
fi

info()    { printf "${GREEN}[OK]${RESET}  %s\n" "$*"; }
warn()    { printf "${YELLOW}[!!]${RESET}  %s\n" "$*"; }
error()   { printf "${RED}[ERR]${RESET} %s\n" "$*" >&2; }
header()  { echo -e "\n${BOLD}$*${RESET}"; }

# --- Paths ---
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
OUT_DIR="$REPO_ROOT/integrations"
TODAY="$(date +%Y-%m-%d)"

AGENT_DIRS=(
  content-intelligence content-architecture feedback-insights
  standards-governance metrics-outcomes orchestration
)

# --- Usage ---
usage() {
  sed -n '3,22p' "$0" | sed 's/^# \{0,1\}//'
  exit 0
}

# --- Frontmatter helpers ---

# Extract a single field value from YAML frontmatter block.
# Usage: get_field <field> <file>
get_field() {
  local field="$1" file="$2"
  awk -v f="$field" '
    /^---$/ { fm++; next }
    fm == 1 && $0 ~ "^" f ": " { sub("^" f ": ", ""); print; exit }
  ' "$file"
}

# Strip the leading frontmatter block and return only the body.
# Usage: get_body <file>
get_body() {
  awk 'BEGIN{fm=0} /^---$/{fm++; next} fm>=2{print}' "$1"
}

# Convert a human-readable agent name to a lowercase kebab-case slug.
# "Content Drift Detector" → "content-drift-detector"
slugify() {
  echo "$1" | tr '[:upper:]' '[:lower:]' | sed 's/[^a-z0-9]/-/g' | sed 's/--*/-/g' | sed 's/^-//;s/-$//'
}

# --- Per-tool converters ---

convert_antigravity() {
  local file="$1"
  local name description alias slug outdir outfile body

  name="$(get_field "name" "$file")"
  description="$(get_field "description" "$file")"
  alias="$(get_field "alias" "$file")"
  slug="enablement-$(slugify "$name")"
  body="$(get_body "$file")"

  outdir="$OUT_DIR/antigravity/$slug"
  outfile="$outdir/SKILL.md"
  mkdir -p "$outdir"

  # Antigravity SKILL.md format mirrors community skills in ~/.gemini/antigravity/skills/
  local alias_line=""
  [[ -n "$alias" ]] && alias_line=$'\n'"alias: ${alias}"
  cat > "$outfile" <<HEREDOC
---
name: ${slug}
description: ${description}${alias_line}
risk: low
source: community
date_added: '${TODAY}'
---
${body}
HEREDOC
}

convert_gemini_cli() {
  local file="$1"
  local name description alias slug outdir outfile body

  name="$(get_field "name" "$file")"
  description="$(get_field "description" "$file")"
  alias="$(get_field "alias" "$file")"
  slug="$(slugify "$name")"
  body="$(get_body "$file")"

  outdir="$OUT_DIR/gemini-cli/skills/$slug"
  outfile="$outdir/SKILL.md"
  mkdir -p "$outdir"

  local alias_line=""
  [[ -n "$alias" ]] && alias_line=$'\n'"alias: ${alias}"
  cat > "$outfile" <<HEREDOC
---
name: ${slug}
description: ${description}${alias_line}
---
${body}
HEREDOC
}

convert_opencode() {
  local file="$1"
  local name description alias color slug outfile body

  name="$(get_field "name" "$file")"
  description="$(get_field "description" "$file")"
  alias="$(get_field "alias" "$file")"
  color="$(get_field "color" "$file")"
  slug="$(slugify "$name")"
  body="$(get_body "$file")"

  outfile="$OUT_DIR/opencode/agent/${slug}.md"
  mkdir -p "$OUT_DIR/opencode/agent"

  local alias_line=""
  [[ -n "$alias" ]] && alias_line=$'\n'"alias: ${alias}"
  cat > "$outfile" <<HEREDOC
---
name: ${name}
description: ${description}${alias_line}
color: ${color}
---
${body}
HEREDOC
}

convert_cursor() {
  local file="$1"
  local name description alias slug outfile body

  name="$(get_field "name" "$file")"
  description="$(get_field "description" "$file")"
  alias="$(get_field "alias" "$file")"
  slug="$(slugify "$name")"
  body="$(get_body "$file")"

  outfile="$OUT_DIR/cursor/rules/${slug}.mdc"
  mkdir -p "$OUT_DIR/cursor/rules"

  local alias_line=""
  [[ -n "$alias" ]] && alias_line=$'\n'"alias: ${alias}"
  cat > "$outfile" <<HEREDOC
---
description: ${description}${alias_line}
globs: ""
alwaysApply: false
---
${body}
HEREDOC
}

# Aider and Windsurf are single-file formats — accumulate into temp files
# then write at the end.
AIDER_TMP="$(mktemp)"
WINDSURF_TMP="$(mktemp)"
trap 'rm -f "$AIDER_TMP" "$WINDSURF_TMP"' EXIT

# Write Aider/Windsurf headers once
cat > "$AIDER_TMP" <<'HEREDOC'
# Enablement Agents — AI Agent Conventions
#
# This file provides Aider with the full roster of specialized AI agents from
# the Enablement Agents collection.
#
# To activate an agent, reference it by name in your Aider session prompt, e.g.:
#   "Use the Content Drift Detector agent to review this training content."
#
# Generated by scripts/convert.sh — do not edit manually.

HEREDOC

cat > "$WINDSURF_TMP" <<'HEREDOC'
# Enablement Agents — AI Agent Rules for Windsurf
#
# Full roster of specialized AI agents from the Enablement Agents collection.
# To activate an agent, reference it by name in your Windsurf conversation.
#
# Generated by scripts/convert.sh — do not edit manually.

HEREDOC

accumulate_aider() {
  local file="$1"
  local name description alias body

  name="$(get_field "name" "$file")"
  description="$(get_field "description" "$file")"
  alias="$(get_field "alias" "$file")"
  body="$(get_body "$file")"

  local alias_line=""
  [[ -n "$alias" ]] && alias_line=$'\n'"> **Alias:** ${alias}"
  cat >> "$AIDER_TMP" <<HEREDOC

---

## ${name}

> ${description}${alias_line}

${body}
HEREDOC
}

accumulate_windsurf() {
  local file="$1"
  local name description alias body

  name="$(get_field "name" "$file")"
  description="$(get_field "description" "$file")"
  alias="$(get_field "alias" "$file")"
  body="$(get_body "$file")"

  local alias_line=""
  [[ -n "$alias" ]] && alias_line=$'\n'"Alias: ${alias}"
  cat >> "$WINDSURF_TMP" <<HEREDOC

================================================================================
## ${name}
${description}${alias_line}
================================================================================

${body}

HEREDOC
}

# --- Main loop ---

run_conversions() {
  local tool="$1"
  local count=0

  for dir in "${AGENT_DIRS[@]}"; do
    local dirpath="$REPO_ROOT/$dir"
    [[ -d "$dirpath" ]] || continue

    while IFS= read -r -d '' file; do
      # Skip files without frontmatter (non-agent docs like README.md)
      local first_line
      first_line="$(head -1 "$file")"
      [[ "$first_line" == "---" ]] || continue

      local name
      name="$(get_field "name" "$file")"
      [[ -n "$name" ]] || continue

      case "$tool" in
        antigravity) convert_antigravity "$file" ;;
        gemini-cli)  convert_gemini_cli  "$file" ;;
        opencode)    convert_opencode    "$file" ;;
        cursor)      convert_cursor      "$file" ;;
        aider)       accumulate_aider    "$file" ;;
        windsurf)    accumulate_windsurf "$file" ;;
      esac

      (( count++ )) || true
    done < <(find "$dirpath" -maxdepth 1 -name "*.md" -type f -print0 | sort -z)
  done

  echo "$count"
}

write_single_file_outputs() {
  # Aider
  mkdir -p "$OUT_DIR/aider"
  cp "$AIDER_TMP" "$OUT_DIR/aider/CONVENTIONS.md"

  # Windsurf
  mkdir -p "$OUT_DIR/windsurf"
  cp "$WINDSURF_TMP" "$OUT_DIR/windsurf/.windsurfrules"
}

# --- Entry point ---

main() {
  local tool="all"

  while [[ $# -gt 0 ]]; do
    case "$1" in
      --tool) tool="${2:?'--tool requires a value'}"; shift 2 ;;
      --out)  OUT_DIR="${2:?'--out requires a value'}"; shift 2 ;;
      --help|-h) usage ;;
      *) error "Unknown option: $1"; usage ;;
    esac
  done

  local valid_tools=("antigravity" "gemini-cli" "opencode" "cursor" "aider" "windsurf" "all")
  local valid=false
  for t in "${valid_tools[@]}"; do [[ "$t" == "$tool" ]] && valid=true && break; done
  if ! $valid; then
    error "Unknown tool '$tool'. Valid: ${valid_tools[*]}"
    exit 1
  fi

  header "Enablement Agents — Converting agents to tool-specific formats"
  echo "  Repo:   $REPO_ROOT"
  echo "  Output: $OUT_DIR"
  echo "  Tool:   $tool"
  echo "  Date:   $TODAY"

  local tools_to_run=()
  if [[ "$tool" == "all" ]]; then
    tools_to_run=("antigravity" "gemini-cli" "opencode" "cursor" "aider" "windsurf")
  else
    tools_to_run=("$tool")
  fi

  local total=0
  for t in "${tools_to_run[@]}"; do
    header "Converting: $t"
    local count
    count="$(run_conversions "$t")"
    total=$(( total + count ))

    # Gemini CLI also needs the extension manifest
    if [[ "$t" == "gemini-cli" ]]; then
      mkdir -p "$OUT_DIR/gemini-cli"
      cat > "$OUT_DIR/gemini-cli/gemini-extension.json" <<'HEREDOC'
{
  "name": "team",
  "version": "1.0.0"
}
HEREDOC
      info "Wrote gemini-extension.json"
    fi

    info "Converted $count agents for $t"
  done

  # Write single-file outputs after accumulation
  if [[ "$tool" == "all" || "$tool" == "aider" || "$tool" == "windsurf" ]]; then
    write_single_file_outputs
    info "Wrote integrations/aider/CONVENTIONS.md"
    info "Wrote integrations/windsurf/.windsurfrules"
  fi

  echo ""
  info "Done. Total conversions: $total"
}

main "$@"
