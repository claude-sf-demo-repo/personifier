#!/usr/bin/env bash
# Symlink a persona's agent.md into ~/.claude/agents/ so Claude Code picks it up as a
# subagent. Idempotent.
#
# Usage: install-persona.sh <slug>

set -euo pipefail

if [[ $# -ne 1 ]]; then
  echo "usage: $(basename "$0") <slug>" >&2
  exit 2
fi

slug="$1"
project_root="/Users/abogdan/Desktop/projects/personifier"
source_file="${project_root}/personas/${slug}/agent.md"
target_dir="${HOME}/.claude/agents"
target_file="${target_dir}/${slug}.md"

if [[ ! -f "${source_file}" ]]; then
  echo "error: ${source_file} does not exist" >&2
  echo "have you run the persona-builder pipeline for slug '${slug}'?" >&2
  exit 1
fi

mkdir -p "${target_dir}"

if [[ -e "${target_file}" ]] || [[ -L "${target_file}" ]]; then
  existing_target="$(readlink "${target_file}" 2>/dev/null || echo "")"
  if [[ "${existing_target}" == "${source_file}" ]]; then
    echo "already installed: ${target_file} -> ${source_file}"
    exit 0
  fi
  echo "error: ${target_file} already exists and points to '${existing_target}'" >&2
  echo "remove it manually if you want to overwrite" >&2
  exit 1
fi

ln -s "${source_file}" "${target_file}"
echo "installed: ${target_file} -> ${source_file}"
echo "the persona is now invocable as @${slug} in Claude Code conversations"
