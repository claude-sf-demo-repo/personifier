# Mulesoft (Anypoint Platform) — IDOs + Agentforce Vibes Skills Catalog

Per FD9 / fleet addition. The persona's `knowledge.md` carries IDO section only
(W6=B — see "Vibes skills" section below). T3 monthly refresh updates the IDO
section of `knowledge.md` from this catalog. **No T2 weekly Vibes refresh** at
v1.0.0 per W6=B explicit-empty guard.

## Industry Demo Orgs (IDOs)

| IDO | Purpose | Last validated | Install / invocation surface |
|---|---|---|---|
| `mulesoft-anypoint-base` | Canonical base IDO for Mulesoft demos covering Anypoint Platform end-to-end (control plane, runtime plane, API design, Mule runtime, DataWeave, Anypoint Exchange). | placeholder-pending-round-1 | Internal IDO catalog (Round 1 research surfaces the canonical install URL). |
| `mulesoft-integration-demo` | End-to-end Mulesoft + Salesforce CRM integration demo covering Salesforce Connector + Pub/Sub API + Platform Events + CDC subscription patterns. The canonical demo for the cross-cloud north-star (Sales Cloud + Data 360 + Agentforce integration substrate). | placeholder-pending-round-1 | Internal IDO catalog. |
| `mulesoft-anypoint-ai-demo` | Anypoint AI Service Catalog + Mule AI Chain + IDP-with-AI demo. Round 1 expansion — over-sampled per R1 (most-volatile sub-area). | placeholder-pending-round-1 | Internal IDO catalog. |
| `mulesoft-idp-demo` | Intelligent Document Processing demo with page classifier + prompt-based extraction; canonical for IDP-replacing-custom-OCR-pipeline opportunities. | placeholder-pending-round-1 | Internal IDO catalog. |

## Agentforce Vibes Skills (Mulesoft-relevant) — EXPLICIT EMPTY per W6=B

**No Vibes skills target Mulesoft at v1.0.0.**

Rationale: per `volatility-table.md`, the Mulesoft row is `Vibes: N`. Anypoint AI
is a Mulesoft-native AI surface (delivered through the Anypoint Platform — IDP,
Mule AI Chain, Anypoint AI Service Catalog, Anypoint AI assistants in Anypoint
Code Builder), NOT a Salesforce-Agentforce-Vibes-skill surface. Workshop W6 (Wave
2 batched) selected option B — IDOs only — accordingly.

### B → A flip guard

If a Mulesoft-targeted Vibes skill ships (e.g., an Agentforce Vibes skill for
"explain this RAML spec", "summarise this Anypoint Monitoring dashboard",
"recommend a connector from Anypoint Exchange for this use case", etc.), the
following must happen:

1. **Halt-and-flag at refresh time.** The T2 weekly refresh prompt's explicit-
   empty guard halts the refresh and files `DRIFT-MULE-<N>` in
   `/Users/abogdan/Desktop/projects/academy/plans/cloud-experts/fleet-drift-log.md`.
2. **Add the Vibes table here.** When this catalog is updated to W6=A, replace
   this empty section with a Vibes-skills table (same shape as the IDOs table
   above) and remove the "EXPLICIT EMPTY" marker.
3. **Add weekly Vibes refresh to T2 prompt.** Add the Vibes-section refresh to
   `refresh/prompts/tier-2-weekly.md` (currently OMITTED per W6=B).
4. **Add IDO+Vibes audit to T3 monthly.** Augment the T3 monthly prompt's IDO
   audit to include the Vibes-skills landscape audit.
5. **Update the brief.** The brief's `Operational protocols` section's
   `insights-authoring-discipline.md` bullet currently says "Vibes catalog
   sub-section is explicit-empty per W6=B"; flip to "Vibes catalog sub-section
   populated per W6=A".

### Cross-persona check (fourth guard)

The `agentforce-expert` persona's `ido-vibes-catalog.md` is the catalog authority
for Agentforce Vibes skills across the fleet. The T3 monthly refresh of
`mulesoft-expert` cross-references that file: if `agentforce-expert/
ido-vibes-catalog.md` adds a Mulesoft-targeted skill, that surfaces in
`mulesoft-expert`'s next T2 / T3 audit and triggers the B → A flip.

## Refresh discipline (FD9, W6=B specifics)

- **T1 daily 07:21 Mon–Fri** — no IDO / Vibes touch (only Slack + release-readiness
  skim).
- **T2 weekly Mon 08:29** — **Vibes section refresh OMITTED per W6=B** with the
  explicit-empty guard above. The prompt halts-and-flags if a Mulesoft-targeted
  Vibes skill is detected (via `agentforce-expert/ido-vibes-catalog.md`
  cross-reference, Slack mentions, or release-notes scan).
- **T3 monthly first Tue 09:47** — refresh the IDO section of `knowledge.md` from
  this file. Audit `last validated` dates; the auditing run replaces
  `placeholder-pending-round-1` with the actual validated date once Round 1 /
  Round 2 research surfaces canonical install URLs. Audit Vibes-skill landscape:
  confirm W6=B still holds (no Mulesoft-targeted Vibes skills shipped); if any
  have, file `DRIFT-MULE-<N>` and trigger the B → A flip steps above.
- **T4 quarterly first Wed of Jan/Apr/Jul/Oct 10:23** — re-evaluate W6 status:
  confirm B (no Vibes skills target Mulesoft) or flip to A (a Mulesoft-targeted
  Vibes skill has shipped); file `DRIFT-MULE-<N>` capturing the flip if needed.

## Anti-patterns

- Do NOT invent IDO names. The list above represents the canonical set known at
  v1.0.0 (`mulesoft-anypoint-base`, `mulesoft-integration-demo`, plus expansion
  IDOs flagged for Round 1 validation); Round 1 research expands and validates.
- Do NOT promote an IDO to `knowledge.md` without a `last validated` date and a
  real install/invocation surface URL.
- Do NOT cite an IDO in an insights file's "Demo / IDO surface" section unless
  its `last validated` date is within the last quarter.
- **Do NOT add a Vibes-skills row** to the empty Vibes section above without
  first executing the B → A flip steps. Adding a row directly bypasses the
  fleet-drift-log entry and breaks the cross-persona audit trail.
- Do NOT remove the "EXPLICIT EMPTY per W6=B" marker until the B → A flip is
  formally executed. The marker is load-bearing for the T2 weekly + T3 monthly
  + T4 quarterly guards.
