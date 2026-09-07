#!/usr/bin/env bash
# Install the persona-builder meta-agent + its three subagents + slash commands into
# ~/.claude/. Uses symlinks so edits to the project stay live.
#
# Safe to re-run. Will refuse to overwrite non-symlink files.

set -euo pipefail

project_root="/Users/abogdan/Desktop/projects/personifier"
agents_dir="${HOME}/.claude/agents"
commands_dir="${HOME}/.claude/commands"

mkdir -p "${agents_dir}" "${commands_dir}"

link_if_safe() {
  local src="$1"
  local dst="$2"
  if [[ ! -f "${src}" ]]; then
    echo "error: source missing: ${src}" >&2
    return 1
  fi
  if [[ -L "${dst}" ]]; then
    local existing
    existing="$(readlink "${dst}")"
    if [[ "${existing}" == "${src}" ]]; then
      echo "already linked: ${dst}"
      return 0
    fi
    echo "error: ${dst} is a symlink pointing to '${existing}' — refusing to overwrite" >&2
    return 1
  elif [[ -e "${dst}" ]]; then
    echo "error: ${dst} exists and is not a symlink — remove manually to proceed" >&2
    return 1
  fi
  ln -s "${src}" "${dst}"
  echo "linked:   ${dst}"
}

# Orchestrator + subagents
link_if_safe "${project_root}/meta-agent/persona-builder.md"            "${agents_dir}/persona-builder.md"
link_if_safe "${project_root}/meta-agent/subagents/persona-researcher.md" "${agents_dir}/persona-researcher.md"
link_if_safe "${project_root}/meta-agent/subagents/tool-surveyor.md"     "${agents_dir}/tool-surveyor.md"
link_if_safe "${project_root}/meta-agent/subagents/skill-scaffolder.md"  "${agents_dir}/skill-scaffolder.md"

# Slash commands
link_if_safe "${project_root}/meta-agent/commands/create-persona.md"   "${commands_dir}/create-persona.md"
link_if_safe "${project_root}/meta-agent/commands/refresh-persona.md"  "${commands_dir}/refresh-persona.md"
link_if_safe "${project_root}/meta-agent/commands/list-personas.md"    "${commands_dir}/list-personas.md"

echo
echo "meta-agent installed."
echo "next: in a Claude Code session, run /create-persona to start the pipeline."
