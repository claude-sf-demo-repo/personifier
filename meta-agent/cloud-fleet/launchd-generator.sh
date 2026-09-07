#!/usr/bin/env bash
# launchd-generator.sh — emit ~/Library/LaunchAgents/com.salesforce.cloud-expert.<slug>.tier-N.plist
# files for a given persona slug, derived from that persona's refresh/tiered-schedules.md.
#
# Usage:
#   bash launchd-generator.sh <slug>
#   bash launchd-generator.sh --all   # iterate over all installed cloud-expert personas
#   bash launchd-generator.sh --router  # emit the router's quarterly plist
#   bash launchd-generator.sh --consolidation <project_root>  # emit monthly consolidation plist for a calling project
#
# After generation, `launchctl bootstrap gui/$(id -u) <plist>` to load.

set -euo pipefail

PERSONA_ROOT="/Users/abogdan/Desktop/projects/personifier/personas"
LAUNCH_AGENTS="$HOME/Library/LaunchAgents"
CLOUD_FLEET="/Users/abogdan/Desktop/projects/personifier/meta-agent/cloud-fleet"
CLAUDE_BIN="$(command -v claude || echo /usr/local/bin/claude)"

mkdir -p "$LAUNCH_AGENTS"

# XML-escape a string so it is safe to interpolate into a plist <string> element.
# Order matters: & must be escaped first.
xml_escape() {
  local s="$1"
  s="${s//&/&amp;}"
  s="${s//</&lt;}"
  s="${s//>/&gt;}"
  s="${s//\"/&quot;}"
  printf '%s' "$s"
}

# Reject any slug that is not strict kebab-case before it is used in a path or label.
# Same contract the router enforces (dispatch-discipline.md).
validate_slug() {
  local slug="$1"
  if [[ ! "$slug" =~ ^[a-z][a-z0-9-]+$ ]]; then
    echo "error: invalid slug '$slug' — must match ^[a-z][a-z0-9-]+\$ (kebab-case)" >&2
    return 2
  fi
}

emit_plist() {
  local slug="$1"
  local tier="$2"     # 1, 2, 3, 4
  local hour="$3"
  local minute="$4"
  local weekday="$5"  # 1-7 or "" for daily
  local day="$6"      # 1-7 (first week of month) or "" for not gating

  local label="com.salesforce.cloud-expert.${slug}.tier-${tier}"
  local plist="$LAUNCH_AGENTS/${label}.plist"
  local prompt_file="$PERSONA_ROOT/$slug/refresh/prompts/tier-${tier}-$(case $tier in 1) echo daily;; 2) echo weekly;; 3) echo monthly;; 4) echo quarterly;; esac).md"

  local cmd_args="<key>ProgramArguments</key><array><string>$CLAUDE_BIN</string><string>-p</string><string>--tools</string><string>Read,Grep,Glob,Bash,TodoWrite,WebSearch,WebFetch,mcp__plugin_slack_slack__slack_search_public,mcp__plugin_slack_slack__slack_search_public_and_private,mcp__plugin_slack_slack__slack_read_channel,mcp__plugin_slack_slack__slack_read_thread,mcp__plugin_slack_slack__slack_read_canvas</string><string>Run /refresh-persona $slug --tier=t$tier</string></array>"

  local sched=""
  if [ -n "$weekday" ]; then
    if [ -n "$day" ]; then
      # First-N-days-of-month gated by weekday (e.g. first Tuesday: day=1-7, weekday=2)
      sched="<key>StartCalendarInterval</key><array>"
      for d in 1 2 3 4 5 6 7; do
        sched="$sched<dict><key>Day</key><integer>$d</integer><key>Weekday</key><integer>$weekday</integer><key>Hour</key><integer>$hour</integer><key>Minute</key><integer>$minute</integer></dict>"
      done
      sched="$sched</array>"
    else
      sched="<key>StartCalendarInterval</key><dict><key>Weekday</key><integer>$weekday</integer><key>Hour</key><integer>$hour</integer><key>Minute</key><integer>$minute</integer></dict>"
    fi
  else
    # Daily Mon-Fri: emit five entries
    sched="<key>StartCalendarInterval</key><array>"
    for w in 1 2 3 4 5; do
      sched="$sched<dict><key>Weekday</key><integer>$w</integer><key>Hour</key><integer>$hour</integer><key>Minute</key><integer>$minute</integer></dict>"
    done
    sched="$sched</array>"
  fi

  cat > "$plist" <<XMLEOF
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
  <key>Label</key>
  <string>$label</string>
  $cmd_args
  $sched
  <key>StandardOutPath</key>
  <string>$PERSONA_ROOT/$slug/refresh/log/launchd-tier-$tier.out.log</string>
  <key>StandardErrorPath</key>
  <string>$PERSONA_ROOT/$slug/refresh/log/launchd-tier-$tier.err.log</string>
  <key>RunAtLoad</key>
  <false/>
</dict>
</plist>
XMLEOF
  echo "Emitted: $plist"
}

emit_for_slug() {
  local slug="$1"
  validate_slug "$slug" || return 2
  test -d "$PERSONA_ROOT/$slug" || { echo "Persona dir missing: $PERSONA_ROOT/$slug"; return 1; }

  # T1 daily 07:07 Mon-Fri
  emit_plist "$slug" 1 7 7 "" ""
  # T2 weekly Mon 08:13 (weekday=2 in plist convention; plist Mon=2)
  emit_plist "$slug" 2 8 13 2 ""
  # T3 monthly first Tue 09:47 (weekday=3 in plist; Tue=3)
  emit_plist "$slug" 3 9 47 3 1
  # T4 quarterly first Wed of Jan/Apr/Jul/Oct 10:23 — see emit_quarterly
  emit_quarterly "$slug"
}

emit_quarterly() {
  local slug="$1"
  local label="com.salesforce.cloud-expert.${slug}.tier-4"
  local plist="$LAUNCH_AGENTS/${label}.plist"
  local cmd_args="<key>ProgramArguments</key><array><string>$CLAUDE_BIN</string><string>-p</string><string>--tools</string><string>Read,Grep,Glob,Bash,TodoWrite,WebSearch,WebFetch,mcp__plugin_slack_slack__slack_search_public,mcp__plugin_slack_slack__slack_search_public_and_private</string><string>Run /refresh-persona $slug --tier=t4</string></array>"
  local sched="<key>StartCalendarInterval</key><array>"
  for m in 1 4 7 10; do
    for d in 1 2 3 4 5 6 7; do
      sched="$sched<dict><key>Month</key><integer>$m</integer><key>Day</key><integer>$d</integer><key>Weekday</key><integer>4</integer><key>Hour</key><integer>10</integer><key>Minute</key><integer>23</integer></dict>"
    done
  done
  sched="$sched</array>"

  cat > "$plist" <<XMLEOF
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
  <key>Label</key>
  <string>$label</string>
  $cmd_args
  $sched
  <key>StandardOutPath</key>
  <string>$PERSONA_ROOT/$slug/refresh/log/launchd-tier-4.out.log</string>
  <key>StandardErrorPath</key>
  <string>$PERSONA_ROOT/$slug/refresh/log/launchd-tier-4.err.log</string>
  <key>RunAtLoad</key>
  <false/>
</dict>
</plist>
XMLEOF
  echo "Emitted: $plist"
}

emit_router() {
  emit_quarterly "salesforce-cloud-router"
}

emit_consolidation() {
  local project_root="$1"
  test -d "$project_root" || { echo "project_root not a dir: $project_root"; return 1; }
  local slug_safe="$(echo "$project_root" | tr '/' '_' | sed 's/^_//')"
  local label="com.salesforce.cloud-expert.consolidation.${slug_safe}"
  local plist="$LAUNCH_AGENTS/${label}.plist"

  # SEC-1: do NOT inline the prompt file's contents into the plist. The markdown
  # contains <, >, &, backticks and $() that are neither shell-safe nor XML-safe.
  # Pass the prompt file's absolute path and instruct the job to read+follow it.
  local prompt_path="$CLOUD_FLEET/monthly-consolidation-prompt.md"
  local prompt_arg="Read the file $prompt_path and follow its instructions exactly to run the monthly cloud-expert insights consolidation."

  # Escape every value interpolated into the XML below.
  local label_x project_root_x prompt_arg_x claude_bin_x
  label_x="$(xml_escape "$label")"
  project_root_x="$(xml_escape "$project_root")"
  prompt_arg_x="$(xml_escape "$prompt_arg")"
  claude_bin_x="$(xml_escape "$CLAUDE_BIN")"

  cat > "$plist" <<XMLEOF
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
  <key>Label</key>
  <string>$label_x</string>
  <key>EnvironmentVariables</key>
  <dict>
    <key>CLOUD_EXPERT_PROJECT_ROOT</key>
    <string>$project_root_x</string>
  </dict>
  <key>ProgramArguments</key>
  <array>
    <string>$claude_bin_x</string>
    <string>-p</string>
    <string>--tools</string>
    <string>Read,Grep,Glob,Bash,Write</string>
    <string>$prompt_arg_x</string>
  </array>
  <key>StartCalendarInterval</key>
  <dict>
    <key>Day</key><integer>1</integer>
    <key>Hour</key><integer>10</integer>
    <key>Minute</key><integer>13</integer>
  </dict>
  <key>RunAtLoad</key>
  <false/>
</dict>
</plist>
XMLEOF
  echo "Emitted: $plist"
}

case "${1:-}" in
  --all)
    for d in "$PERSONA_ROOT"/*-cloud-expert "$PERSONA_ROOT"/*-expert; do
      [ -d "$d" ] || continue
      emit_for_slug "$(basename "$d")"
    done
    ;;
  --router)
    emit_router
    ;;
  --consolidation)
    shift
    emit_consolidation "${1:-$PWD}"
    ;;
  "")
    echo "Usage: $0 <slug> | --all | --router | --consolidation <project_root>"
    exit 2
    ;;
  *)
    emit_for_slug "$1"
    ;;
esac
