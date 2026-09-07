# Tool Gaps — sales-cloud-expert

**Status**: DEFERRED. See `./inventory.md`.

## Known synthesized gaps

- The Task-dispatch tool itself is not exposed to subagents in this environment (DRIFT-SC-1 / DRIFT-SC-3). This is fleet-level drift; mitigation is the foundation-skill §3.2 prompt-body fallback for the `opportunity-slug` arg.
- Real `tool-surveyor` Stage 5 dispatch (parent orchestrator) will surface any additional gaps.
