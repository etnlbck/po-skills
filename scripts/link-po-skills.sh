#!/usr/bin/env bash
# Link po-skills into Cursor, Claude Code, Windsurf, and optional .agents/skills paths.
# Run from the consuming repository root after adding po-skills (e.g. git submodule at vendor/po-skills).
#
# Usage:
#   ./scripts/link-po-skills.sh [REPO_ROOT] [PO_SKILLS_PATH]
#
# Defaults:
#   REPO_ROOT       = current directory
#   PO_SKILLS_PATH  = vendor/po-skills  (relative to REPO_ROOT)
#
# Environment:
#   INCLUDE_AGENTS=1  — also link .agents/skills (Windsurf cross-scan)
#
# Example:
#   bash vendor/po-skills/scripts/link-po-skills.sh
#   bash vendor/po-skills/scripts/link-po-skills.sh /path/to/project vendor/po-skills

set -euo pipefail

REPO_ROOT=$(cd "${1:-.}" && pwd)
PO_SKILLS_REL="${2:-vendor/po-skills}"
PO_SKILLS_ABS="$REPO_ROOT/$PO_SKILLS_REL"

if [[ ! -f "$PO_SKILLS_ABS/po-ticketing/SKILL.md" ]]; then
  echo "error: expected po-skills at $PO_SKILLS_ABS (missing po-ticketing/SKILL.md)" >&2
  exit 1
fi

link_one() {
  local parent="$1"
  local name="$2"
  mkdir -p "$parent"
  local target="$parent/$name"
  if [[ -e "$target" && ! -L "$target" ]]; then
    echo "error: $target exists and is not a symlink; remove or move it first" >&2
    exit 1
  fi
  ln -sfn "$PO_SKILLS_ABS" "$target"
  echo "linked $target -> $PO_SKILLS_ABS"
}

link_one "$REPO_ROOT/.cursor" "skills"
link_one "$REPO_ROOT/.claude" "skills"
link_one "$REPO_ROOT/.windsurf" "skills"

if [[ "${INCLUDE_AGENTS:-}" == "1" ]]; then
  link_one "$REPO_ROOT/.agents" "skills"
fi

echo "done. Symlinks use absolute paths for portability."
