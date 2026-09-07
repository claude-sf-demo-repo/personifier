# launchd Runbook — Quick Reference

Quick-reference for engineers debugging refresh-cron behaviour for the cloud-experts fleet. For the full bootstrap walk-through, see `personifier/meta-agent/cloud-fleet/launchd-bootstrap.md`.

## Why launchd?

`CronCreate` jobs auto-expire after 7 days even with `durable: true`. T3 monthly and T4 quarterly tiers will never fire before expiring. The fleet's mitigation (DRIFT-FLEET-1) uses macOS launchd for persistent scheduling. `CronCreate` is retained for T1 daily and T2 weekly as belt-and-suspenders.

## Where plists live

```
~/Library/LaunchAgents/com.salesforce.cloud-expert.<slug>.tier-<N>.plist
```

Plus the router-quarterly plist and the monthly insights-consolidation plist (which is keyed by calling-project root, not by persona).

## Verify loaded jobs

```bash
launchctl list | grep com.salesforce.cloud-expert
```

Expected count is recorded in `personifier/meta-agent/cloud-fleet/launchd-list.md` per persona × tier. A diff against that file is the canonical check.

## Bootstrap a plist (load it)

```bash
launchctl bootstrap gui/$(id -u) ~/Library/LaunchAgents/<label>.plist
```

`launchctl bootstrap` is idempotent on modern macOS; re-running on an already-loaded plist returns an "already loaded" error which is harmless.

## Bootstrap all fleet plists at once

```bash
for plist in ~/Library/LaunchAgents/com.salesforce.cloud-expert.*.plist; do
  launchctl bootstrap gui/$(id -u) "$plist" || true
done
```

## Unload (bootout) a plist

```bash
launchctl bootout gui/$(id -u) ~/Library/LaunchAgents/<label>.plist
```

## Regenerate plists from the source-of-truth schedules

The persona's `refresh/tiered-schedules.md` is the documentary source of truth for cron expressions. The generator emits plists from that file:

```bash
# All cloud-experts (19 personas × applicable tiers)
bash /Users/abogdan/Desktop/projects/personifier/meta-agent/cloud-fleet/launchd-generator.sh --all

# Router only (T4 quarterly sweep)
bash /Users/abogdan/Desktop/projects/personifier/meta-agent/cloud-fleet/launchd-generator.sh --router

# Monthly insights consolidation against a project root
bash /Users/abogdan/Desktop/projects/personifier/meta-agent/cloud-fleet/launchd-generator.sh --consolidation /path/to/project
```

After regeneration, bootout the old plist (if loaded) and bootstrap the new one.

## Common debug paths

| Symptom | Check |
|---|---|
| Job not in `launchctl list` | Plist never bootstrapped, or bootstrap silently failed. Re-run bootstrap; `plutil -lint <plist>` to check syntax. |
| Job in list but not firing | Inspect `~/Library/Logs/<label>.err.log` and `StandardErrorPath` from the plist body. |
| `claude` not found at runtime | macOS launchd does not inherit your shell `$PATH`. The generator hard-codes the result of `command -v claude` at generation time; if `claude` moved, regenerate. |
| Consolidation plist points at wrong project root | The plist's `EnvironmentVariables` carries `CLOUD_EXPERT_PROJECT_ROOT`. Edit the plist or regenerate with the correct `--consolidation <root>`. |
| Plist syntax error | `plutil -lint <plist>`. Expected: `OK`. Errors point at the offending line. |

## When the runbook does not apply

- Non-Darwin systems: refresh crons fall back to `CronCreate` belt-and-suspenders only (T1/T2 fire; T3/T4 never persist).
- Mid-fleet skill version bumps: re-validate per `fleet-drift-log.md` DRIFT-FLEET-3 mitigation.

## Full runbook

For pre-flight checks, the first-time bootstrap sequence, and per-persona expected-count reconciliation, see:

```
/Users/abogdan/Desktop/projects/personifier/meta-agent/cloud-fleet/launchd-bootstrap.md
```
