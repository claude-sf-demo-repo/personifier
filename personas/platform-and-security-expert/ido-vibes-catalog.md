# Salesforce Platform-and-Security — IDOs + Agentforce Vibes Skills Catalog

Per FD9 / fleet addition. **W6=D handling: BOTH IDOs and Vibes sections are EXPLICIT-EMPTY.** This persona is cross-cutting (Lightning Platform + Hyperforce + Identity + Shield + Trust Foundations + SSDF) and does NOT own IDO or Vibes-skill surfaces. IDO + Vibes context lives in the per-cloud personas. The persona's `knowledge.md` `## IDOs` and `## Vibes skills` sections also ship with the same NOT-APPLICABLE text and are NOT touched by T2 (weekly) or T3 (monthly) refresh prompts.

## Industry Demo Orgs (IDOs)

NOT-APPLICABLE — see per-cloud personas (sales-cloud-expert, service-cloud-expert, data360-expert, agentforce-expert) for Vibes/IDO context.

## Agentforce Vibes Skills

NOT-APPLICABLE — see per-cloud personas (sales-cloud-expert, service-cloud-expert, data360-expert, agentforce-expert) for Vibes/IDO context.

## Refresh discipline (W6=D)

- **T2 weekly Mon 08:37** — DOES NOT refresh the Vibes-skills section of `knowledge.md`. The section ships with the literal `NOT-APPLICABLE — see per-cloud personas` text and is preserved across refreshes.
- **T3 monthly first Tue 09:47** — DOES NOT refresh the IDO section of `knowledge.md`. The section ships with the literal `NOT-APPLICABLE — see per-cloud personas` text and is preserved across refreshes.
- The T2 / T3 prompt files at `refresh/prompts/tier-2-weekly.md` and `refresh/prompts/tier-3-monthly.md` include explicit-empty guards that grep-check for the NOT-APPLICABLE strings before proceeding with their other refresh duties.

## Why W6=D for this persona

Per the volatility-table row for `platform-and-security-expert`:
- IDOs: N (the persona has no canonical IDO surface — IDOs are per-cloud)
- Vibes: N (the persona has no canonical Vibes-skill surface — Vibes-skills are per-cloud)

The cross-cutting persona spans every cloud's platform/security footprint; rather than attempt to enumerate IDOs/Vibes-skills across all clouds (which would duplicate per-cloud personas' work and risk hallucination), the persona explicitly redirects to the per-cloud personas via the NOT-APPLICABLE marker. The dispatching router uses this marker as a stable signal to route IDO/Vibes-related questions to the per-cloud experts.

## Anti-patterns

- Do NOT invent IDO names. The list is explicitly empty by design.
- Do NOT invent Vibes-skill names. The list is explicitly empty by design.
- Do NOT promote any IDO or Vibes-skill to `knowledge.md` from this catalog — `knowledge.md` ships with the same NOT-APPLICABLE markers.
- Do NOT cite an IDO or Vibes-skill in an insights file's "Demo / IDO surface" section — instead, recommend secondary dispatch to the relevant per-cloud expert via the grounding procedure.
