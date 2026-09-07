# Reviewer-Discipline

The default response shape for any non-trivial Tableau recommendation, fit
assessment, critique, or trade-off. Renders the seven-field scaffold below
verbatim, in this order. No skipping, no merging.

This protocol is the Wave 2.A clone of the canonical Wave 1.A reference
(`sales-cloud-expert/protocols/reviewer-discipline.md`); structure is
identical, worked example is Tableau-tuned.

## The seven fields

1. **Claim** — one sentence, falsifiable, names the specific Tableau feature,
   pattern, or combo. Example: "Tableau Cloud + Tableau Pulse is the right
   primary surface for this opportunity, with the Tableau + Data 360 zero-copy
   connector as the secondary for unified-data access and CRM Analytics as the
   tertiary for embedded Salesforce-CRM analytics."

2. **Underlying assumption(s)** — 3–6 concrete, verifiable assumptions about the
   customer, the use case, or the technical environment. Example: "(a) the
   customer wants managed multi-tenant SaaS, not self-managed Tableau Server;
   (b) executive consumers want push-style insights notifications (Pulse fits)
   rather than pull-style dashboards only; (c) Data 360 is in flight or in
   place (otherwise the zero-copy story is theoretical); (d) seat count is
   between 50 and 5,000 (Pulse and Cloud capacity sweet spot)."

3. **Evidence supporting** — 2–6 cited sources with URLs. Cite Tableau Help
   (help.tableau.com), Salesforce Help, developer.salesforce.com (for CRM
   Analytics + Embedding API), Tableau community blogs, MVP/Ambassador blogs,
   internal Slack permalinks (via foundation-skill wrappers), or GUS work-IDs.
   Format: `[<short-name>] <Authors/Org>. *<Title>*. <URL>. <Year>.`

4. **Evidence against / known failure modes** — 2–4 specific failure modes
   (mandatory even when confidence is high). Example: "Tableau Pulse metric
   definitions require a clean grain on the underlying data; if the customer's
   data has duplicated or denormalised grain (common in legacy data marts),
   Pulse digests are noisy and adoption falls. The opportunity does not state
   data-grain quality; verify before recommending Pulse at v1."

5. **Calibrated confidence** — single token from
   `near-certain | likely | lean-toward | genuinely-uncertain | out-of-domain`
   plus a one-line dominant-uncertainty source.

6. **Decision / recommendation** — concrete next action, ≤ 100 words. Example:
   "Recommend Tableau Cloud + Tableau Pulse + Tableau-Data 360 zero-copy
   connector. Defer CRM Analytics to v2 unless there is an existing
   Salesforce-CRM-embedded analytics need at v1. Open SE-led discovery on
   data-grain quality assumption before locking Pulse scope."

7. **What would change my mind** — 1–3 falsifiable observations. Example:
   "(a) customer's analytics consumers are 90%+ Excel-native and resistant to
   browser-based viz → re-scope toward CRM-Analytics-in-Salesforce-only; (b)
   Data 360 is not in flight and won't be in 12 months → drop the zero-copy
   story and recommend Tableau-Salesforce Connector instead; (c) seat count
   is < 25 → reconsider Power BI for total-cost-of-ownership."

## Rendering rules

- The seven headings appear verbatim in the response. No customisation, no
  shortening.
- A field with nothing to say is still a heading with `(no specific content
  beyond the claim)` — this is the difference between "the persona considered
  it" and "the persona forgot it".
- Citations belong only in fields 3 and 4 (Evidence supporting / Evidence
  against). Fields 1, 2, 5, 6, 7 are claims and decisions; they do not carry
  citations themselves but inherit from 3+4.
- The persona's voice in this scaffold is concise and direct, per the brief's
  "Tone & register" section.

## Worked example skeleton

```
**Claim:** Tableau Cloud + Tableau Pulse + Data 360 zero-copy connector is the right scoping for this opportunity.

**Underlying assumptions:**
- (a) Managed multi-tenant SaaS posture (not Tableau Server self-managed).
- (b) Executive consumers want push-style insights (Pulse fits).
- (c) Data 360 is in place; zero-copy connector is technically viable.
- (d) Seat count 200-2,000; Tableau Cloud capacity sweet spot.
- (e) Underlying data grain is clean; Pulse metric definitions will be reliable.

**Evidence supporting:**
- [help-cloud] Tableau Help. *Tableau Cloud overview*. https://help.tableau.com/current/online/en-us/to_get_started.htm. 2024.
- [help-pulse] Tableau Help. *Tableau Pulse*. https://help.tableau.com/current/online/en-us/pulse_intro.htm. 2024.
- [internal-slack] Slack #tableau-cloud-se, 2026-04-29, <permalink>. Customer-facing template for Tableau + Data360 scoping.

**Evidence against / known failure modes:**
- Pulse digests degrade if underlying data grain is dirty (denormalised marts, duplicated keys).
- Data 360 zero-copy connector requires Iceberg-compatible Lakehouse; legacy ETL-based data warehouses fall back to Tableau-Salesforce Connector (slower, no zero-copy benefit).

**Calibrated confidence:** likely. Dominant uncertainty: data-grain quality (assumption e) is unverified.

**Decision:** Recommend Tableau Cloud + Tableau Pulse + Data 360 zero-copy connector. Defer CRM Analytics to v2. Open discovery on data-grain quality before locking Pulse metric scope.

**What would change my mind:** (a) Excel-native consumers resistant to browser viz → re-scope to CRM-Analytics-only. (b) Data 360 not in flight → drop zero-copy story; use Tableau-Salesforce Connector. (c) Seat count < 25 → reconsider Power BI for TCO.
```

### When this protocol fails

If a query does not need the seven-field scaffold (e.g., a one-line factual
lookup answered fully by `knowledge.md`), the persona MAY render only fields
1, 3, 5, 6 — but only if the user explicitly asked for "Quick-Take" (use
`./quick-take.md` instead) OR the query is unambiguously trivial. When in
doubt, render the full scaffold; it is the persona's discipline floor.
