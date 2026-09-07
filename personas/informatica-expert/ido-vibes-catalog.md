# Informatica IDMC — IDOs + Agentforce Vibes Skills Catalog

Per FD9 / fleet addition. The persona's `knowledge.md` carries IDO sections
(FD9); this file is the canonical surface map. T2 weekly refresh would update
the Vibes-skills section of `knowledge.md` from this catalog (OMITTED at v1.0.0
per W6=B); T3 monthly refresh updates the IDO section PROVISIONALLY pending
Round 1 re-verification (per design-spec §5.8).

Brand handling per design-spec §5.7: "Informatica IDMC" throughout; never
"Salesforce Informatica".

## W6=B PROVISIONAL — load-bearing standing rule

Per `volatility-table.md` (Informatica row: 7, IDOs `unknown`, Vibes N), IDO
availability for Informatica IDMC is **unknown at fleet-design time**. This
file ships with **PROVISIONAL** IDO placeholders pending Round 1
re-verification:

- **Default state at this file's authoring (Phase 3 Task 3.6, pre-Round 1):**
  W6=B — IDO catalog populated PROVISIONALLY below; Vibes section
  explicit-empty.
- **Phase 7 Stage 2 (Round 1) re-verification handoff:** Round 1 explicitly
  verifies IDO availability for Informatica IDMC. If Round 1 surfaces ≥ 1
  valid IDO, the placeholder rows below are replaced with confirmed IDO
  entries (real install URLs, real `last-validated` dates, real catalog IDs).
  If Round 1 surfaces "no IDOs", the W6=D fallback engages (next paragraph).
- **W6=D fallback (Phase 7 Stage 3 / Stage 4 if Round 1 surfaces "no IDOs"):**
  the IDO section is reduced to "explicit-empty" with the same paragraph
  pattern used by the Vibes section. The T3 monthly IDO refresh in
  `tier-3-monthly.md` is patched to omit the IDO sub-section; T3 becomes a
  deeper canon audit only. `refresh/schedule.md` records "W6=D fallback
  engaged at Round 1 re-verification" as a load-bearing note.
- **B→A flip guard (T4 quarterly, ongoing):** if Vibes skills ship for
  Informatica IDMC at any future point, file a fleet-drift note to flip W6
  from B to A. (Vibes section below explicitly carries this guard.)
- **B↔D flip guard (T4 quarterly, ongoing):** if W6=D was engaged at Round 1
  and IDOs subsequently appear, file a flip-back note to W6=B.

## Industry Demo Orgs (IDOs) — PROVISIONAL pending Round 1 re-verification

| IDO | Purpose | Last validated | Install / invocation surface | Confidence |
|---|---|---|---|---|
| `informatica-idmc-platform` | **Candidate** canonical platform IDO for Informatica IDMC demos covering MDM + Cloud Data Integration + Cloud Data Quality + Cloud Data Governance end-to-end. **Existence uncertain at v1.0.0** — Round 1 re-verifies. | pending | Internal IDO catalog (Round 1 research surfaces the canonical install URL if it exists). | uncertain — Round 1 re-verification required |
| `mdm-demo` | **Candidate** Informatica Cloud MDM-focused IDO for golden-record / match-and-merge / hierarchy-management / multidomain-MDM demos. **Existence uncertain at v1.0.0** — Round 1 re-verifies. | pending | Internal IDO catalog. | uncertain — Round 1 re-verification required |

**If Round 1 surfaces ≥ 1 valid IDO:** replace each `pending` cell with a
real ISO date and each "uncertain" cell with `confirmed`. Add additional rows
for any IDOs Round 1 surfaces beyond the candidate list above. Keep the W6=B
header.

**If Round 1 surfaces "no IDOs":** replace this entire section with the
following paragraph:

> *No Informatica IDMC Industry Demo Orgs (IDOs) surface at v1.0.0. The
> volatility-table row recorded IDO availability as `unknown`; Phase 7
> Stage 2 Round 1 re-verification confirmed no IDOs are available. Per
> design-spec §5.8 W6=D fallback, the T3 monthly IDO refresh is OMITTED
> from `tier-3-monthly.md`. T4 quarterly retains a B↔D flip guard: if IDOs
> subsequently appear, file a flip-back note to W6=B.*

## Agentforce Vibes Skills (Informatica IDMC-relevant) — explicit-empty at v1.0.0

**No Agentforce Vibes skills surface for Informatica IDMC at v1.0.0** per
W6=B. The `volatility-table.md` Informatica row records Vibes availability
as `N`. The T2 weekly refresh in `tier-2-weekly.md` carries an explicit
"no Vibes-skills surface for Informatica IDMC" guard paragraph and OMITS the
Vibes-skills weekly refresh.

**B→A flip guard (T4 quarterly):** if Agentforce Vibes skills ship for
Informatica IDMC at any future point (e.g., a CLAIRE-AI-aligned Agentforce
Vibes skill that integrates with Data 360 unified profile), file a
fleet-drift note to flip W6 from B to A. The flipped state would
re-introduce a Vibes table with rows like (illustrative — not real at v1.0.0):

| Vibes skill | Purpose | Last validated | Install / invocation surface |
|---|---|---|---|
| <none at v1.0.0> | <none at v1.0.0> | <none at v1.0.0> | <none at v1.0.0> |

## Refresh discipline (FD9)

- **T1 daily 07:43 weekdays** — skim `releaseUpdate` channels (Informatica
  IDMC release-readiness sessions, IDMC monthly release notes, CLAIRE AI /
  GenAI updates), Tier-A Slack-channel skim from `slack-channel-ledger.yaml`.
  No `knowledge.md` edits.
- **T2 weekly Mon 08:51** — full pass over T1/T2/T3 sources. Update
  `knowledge.md` "Recent breakthroughs" + "Active debates". **Vibes-skills
  weekly refresh OMITTED per W6=B** — there are no Informatica IDMC
  Agentforce Vibes skills at v1.0.0; the Tier-2 prompt explicitly carries a
  "no Vibes-skills surface for Informatica IDMC" guard paragraph.
- **T3 monthly first Tue 09:47** — refresh the IDO section of
  `knowledge.md` from this file PROVISIONALLY pending Round 1
  re-verification. If W6=B holds (Round 1 confirmed ≥ 1 IDO), audit
  `last validated` dates and replace `pending` with real validated dates.
  If W6=D fallback engaged (Round 1 surfaced "no IDOs"), the T3 monthly IDO
  sub-section is OMITTED and T3 becomes a deeper canon audit only.
- **T4 quarterly first Wed of Jan/Apr/Jul/Oct 10:31** — re-evaluates whether
  Vibes skills have shipped for Informatica IDMC (B→A flip guard) and whether
  IDO availability has changed (B↔D flip guard).

## Anti-patterns

- Do NOT invent IDO or Vibes-skill names. The list above represents
  **uncertain candidates** at v1.0.0; Round 1 research re-verifies and
  either confirms or replaces with the W6=D fallback paragraph.
- Do NOT promote a Vibes skill to `knowledge.md` without a `last validated`
  date and a real install / invocation surface URL. The Vibes section at
  v1.0.0 is explicit-empty; the first promotion happens only if a B→A flip
  is filed.
- Do NOT cite an IDO or Vibes skill in an insights file's "Demo / IDO surface"
  section unless its `last validated` date is within the last quarter (or,
  for W6=B PROVISIONAL placeholders, unless Round 1 has confirmed it).
- Do NOT use "Salesforce Informatica" prose in any IDO or Vibes-skill name,
  description, or notes — the brand is "Informatica IDMC".
