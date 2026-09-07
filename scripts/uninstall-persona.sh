#!/usr/bin/env bash
# Remove the symlink for a persona. Does not delete the project files.
#
# Usage: uninstall-persona.sh <slug>

set -euo pipefail

if [[ $# -ne 1 ]]; then
  echo "usage: $(basename "$0") <slug>" >&2
  exit 2
fi

slug="$1"

# Validate slug before it touches any path. A traversal slug like ../../foo would
# otherwise resolve target_file outside ~/.claude/agents/ and rm a symlink there.
if [[ ! "${slug}" =~ ^[a-z][a-z0-9-]+$ ]]; then
  echo "error: invalid slug '${slug}' — must match ^[a-z][a-z0-9-]+\$ (kebab-case)" >&2
  exit 2
fi

target_file="${HOME}/.claude/agents/${slug}.md"

if [[ ! -L "${target_file}" ]]; then
  if [[ -e "${target_file}" ]]; then
    echo "error: ${target_file} exists but is not a symlink — refusing to delete" >&2
    exit 1
  fi
  echo "not installed: ${target_file}"
  exit 0
fi

rm "${target_file}"
echo "removed: ${target_file}"
echo "project files in personas/${slug}/ are untouched"
