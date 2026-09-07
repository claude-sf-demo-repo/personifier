# Freshness Ledger Discipline Evals

Verifies FD4 + FD5 monthly consolidation last-week retention.

## Eval F1 — Channel-ledger writeback

**Setup:** Pick a cloud-expert (e.g. `sales-cloud-expert`). Note `last_checked_at` for one channel in its `slack-channel-ledger.yaml` before the test.

**Action:** Dispatch the cloud-expert with an opportunity that requires a Slack search of that channel (foundation skill's scoped wrapper should fire).

**Verification:**

```bash
# Capture before timestamp
yq '.[] | select(.name == "<channel-name>") | .last_checked_at' \
  /Users/abogdan/Desktop/projects/personifier/personas/sales-cloud-expert/refresh/slack-channel-ledger.yaml > /tmp/before.txt

# Dispatch persona...

# After dispatch, check timestamp
yq '.[] | select(.name == "<channel-name>") | .last_checked_at' \
  /Users/abogdan/Desktop/projects/personifier/personas/sales-cloud-expert/refresh/slack-channel-ledger.yaml > /tmp/after.txt

diff /tmp/before.txt /tmp/after.txt
```

**Pass criterion:** `last_checked_at` is updated to a timestamp ≥ before-test.

**Fail mode:** ledger unchanged → foundation skill scoped wrapper not in use, OR persona used raw `slack_search_*` without going through wrapper.

## Eval F2 — Monthly consolidation last-week retention

**Setup:** Create a synthetic insights tree at `/tmp/cloud-expert-test-project/cloud-expert-insights/` with:
- Directory `<today minus 35 days>-test-old/` containing one insights file
- Directory `<today minus 20 days>-test-mid/` containing one insights file
- Directory `<today minus 5 days>-test-recent/` containing one insights file (within last-week window)
- Directory `<today>-test-today/` containing one insights file (within last-week window)

**Action:** Run the monthly consolidation prompt against this project root:

```bash
CLOUD_EXPERT_PROJECT_ROOT=/tmp/cloud-expert-test-project \
  claude -p --tools "Read,Grep,Glob,Bash,Write" \
  "$(cat /Users/abogdan/Desktop/projects/personifier/meta-agent/cloud-fleet/monthly-consolidation-prompt.md)"
```

**Verification:**

```bash
ls /tmp/cloud-expert-test-project/cloud-expert-insights/
test -f /tmp/cloud-expert-test-project/cloud-expert-insights/<YYYY-MM>-consolidated.md && echo "consolidated OK"
test -d /tmp/cloud-expert-test-project/cloud-expert-insights/*-test-old && echo "FAIL: test-old should be deleted"
test -d /tmp/cloud-expert-test-project/cloud-expert-insights/*-test-mid && echo "FAIL: test-mid should be deleted"
test -d /tmp/cloud-expert-test-project/cloud-expert-insights/*-test-recent && echo "test-recent retained OK"
test -d /tmp/cloud-expert-test-project/cloud-expert-insights/*-test-today && echo "test-today retained OK"
```

**Pass criteria:**
- `<YYYY-MM>-consolidated.md` exists
- `test-old/` and `test-mid/` DELETED (consolidated)
- `test-recent/` and `test-today/` RETAINED (last-week safety)

**Cleanup:**

```bash
rm -rf /tmp/cloud-expert-test-project
```

## Eval F3 — Slack-search wrapper enforcement

**Setup:** Inspect a cloud-expert's `agent.md`. Check that any Slack-tool reference in the body specifies the foundation skill's scoped wrapper, NOT raw `slack_search_*`.

```bash
# Should NOT find raw slack tool names in agent.md body (only in tools: frontmatter list)
grep -nE "slack_search_public|slack_read_channel|slack_read_thread" \
  /Users/abogdan/Desktop/projects/personifier/personas/sales-cloud-expert/agent.md | \
  grep -v "^[0-9]*:tools:"
```

**Pass criterion:** no matches outside the `tools:` frontmatter line.

**Fail mode:** raw tool name in body → persona may bypass the freshness writeback.
