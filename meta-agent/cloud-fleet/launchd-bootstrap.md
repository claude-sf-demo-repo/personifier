# launchd Bootstrap — Runbook

Mitigates DRIFT-FLEET-1 (`CronCreate` 7-day auto-expiry) by using macOS launchd for persistent refresh-cron scheduling.

## When to run this

- First time after fleet acceptance (Phase 6).
- After a fleet-level skill version bump if any plist needs updating.
- After installing a new cloud-expert persona post-fleet (re-run for that one persona).

## Pre-flight

1. Verify the user is on macOS (Darwin):
   ```bash
   uname
   ```
   Expected: `Darwin`. If not, this runbook does not apply; refresh crons remain on `CronCreate` belt-and-suspenders only.

2. Verify `claude` CLI is on PATH:
   ```bash
   command -v claude
   ```
   Expected: a path like `/usr/local/bin/claude` or similar. The plists hard-code this path.

3. Verify `~/Library/LaunchAgents` exists:
   ```bash
   mkdir -p ~/Library/LaunchAgents
   ```

## Generate plists

For all 19 cloud-experts:

```bash
bash /Users/abogdan/Desktop/projects/personifier/meta-agent/cloud-fleet/launchd-generator.sh --all
```

Expected output: lines reading `Emitted: ~/Library/LaunchAgents/com.salesforce.cloud-expert.<slug>.tier-<N>.plist` for each persona × each applicable tier.

For the router:

```bash
bash /Users/abogdan/Desktop/projects/personifier/meta-agent/cloud-fleet/launchd-generator.sh --router
```

For monthly insights consolidation against a specific project root:

```bash
bash /Users/abogdan/Desktop/projects/personifier/meta-agent/cloud-fleet/launchd-generator.sh --consolidation /path/to/your/project
```

## Bootstrap plists

For each emitted plist:

```bash
launchctl bootstrap gui/$(id -u) ~/Library/LaunchAgents/<label>.plist
```

To bootstrap all at once:

```bash
for plist in ~/Library/LaunchAgents/com.salesforce.cloud-expert.*.plist; do
  launchctl bootstrap gui/$(id -u) "$plist" || true
done
```

Note: `launchctl bootstrap` is idempotent in modern macOS; re-running on an already-loaded plist returns an "already loaded" error which is harmless.

## Verify

```bash
launchctl list | grep com.salesforce.cloud-expert | wc -l
```

Expected count is recorded in `launchd-list.md` per persona.

## Unload (if needed)

```bash
launchctl bootout gui/$(id -u) ~/Library/LaunchAgents/<label>.plist
```

## Troubleshooting

- **Plist syntax error:** Run `plutil -lint <plist>`. Expected: "OK". Errors point at the line.
- **Job loaded but not firing:** Inspect `~/Library/Logs/<label>.err.log` and the per-persona log paths inside the plist (`StandardErrorPath`).
- **`claude` not found at runtime:** macOS launchd does not inherit your shell's `$PATH`. The generator hard-codes the result of `command -v claude` at generation time. If `claude` moves, regenerate.
- **EnvironmentVariables missing (consolidation only):** `CLOUD_EXPERT_PROJECT_ROOT` is set in the consolidation plist's plist body (not your shell). Edit the plist if the project root changed.
