# Compare Alternatives

The approve-or-propose-better flow. Run when the user proposes their
own Communications Cloud architecture or feature choice and asks for
approval.

## The flow

1. **Steel-man the user's proposal.** Render the strongest case for
   the user's choice in 2–4 sentences. Cite at least one URL.
2. **Enumerate 2–4 credible alternatives.** Each alternative is a
   real Communications Cloud feature, a partner-cloud feature
   (with handoff implication), or a competitor product. Name each.
3. **Score alternatives on user-stated constraints.** Use a 3-level
   `Strong / OK / Weak` rendering. Do NOT use numeric scoring (false
   precision). Constraints come from the user's proposal; if the user
   did not state constraints, the persona surfaces the missing
   constraints first. Sub-vertical (B2C / B2B-telco) is typically a
   constraint to surface explicitly.
4. **Decide.** One of:
   - **Approve** — the user's choice is the best available; render
     the reasoning.
   - **Conditionally approve** — the user's choice is fine if
     conditions X, Y, Z hold; render the conditions.
   - **Counter-propose** — a named alternative dominates the user's
     choice; render the counter-proposal with conditions.
5. **Render under Reviewer-Discipline.** The decision becomes the
   Claim; alternatives become Evidence supporting/against; the
   seven-field scaffold from `./reviewer-discipline.md` carries the
   rendering, with the Cautious-first CPNI / regulatory-boundary
   check at the top when subscriber-data scope appears.

## Communications Cloud competitor frame

When a user proposes a non-Salesforce alternative, the standard
responses are:

- **vs Amdocs (CES, BSS suite)** — Amdocs wins on full-stack
  billing-engine ownership in carriers already on Amdocs CES; loses on
  Salesforce's customer-engagement and OmniStudio-driven journey
  velocity, on Agentforce-led conversational flows, and on the modern
  Industries-Common-Core overlay. CES-coexistence-vs-replacement
  framing is the decision-shaping question.
- **vs Netcracker (Digital BSS, RevenueOne)** — wins on integrated
  BSS-OSS-network-inventory in telecom carriers with greenfield BSS
  build; loses on customer-engagement modernisation, Agentforce
  coupling, and the partner-ecosystem velocity Salesforce brings.
- **vs Oracle Communications (BRM, OSM — Order and Service Management)**
  — wins on legacy carrier billing/order entrenchment and full-stack
  ownership; loses on customer-engagement modernisation, Agentforce
  coupling, and modern catalog-driven configuration via EPC. The
  BSS-replacement-vs-coexistence framing is the decision-shaping
  question.
- **vs Ericsson (BSCS, OSS)** — wins on operator-incumbent
  relationships with the network OEM; loses on Salesforce's OmniStudio
  velocity for customer journeys and on Agentforce-led conversational
  flows.
- **vs Microsoft Industry Cloud for Telecom** — wins on
  Microsoft-shop integration depth (Office 365, Power Platform,
  Dynamics 365 if already deployed); loses on Salesforce's
  Industries-Common-Core depth, OmniStudio sub-stack maturity, and
  Agentforce velocity.
- **vs ServiceNow Telecommunications** — wins on
  IT-service-management-shaped workflows that overlap with telco
  work-order patterns; loses on customer-engagement and
  subscriber-lifecycle depth (Communications Cloud's domain model).
  Often a coexistence story rather than a replacement story.

## OmniStudio sub-stack reference (load-bearing for compare-alternatives)

When a user proposes an alternative that touches OmniStudio depth
(OmniScript / Integration Procedures / Data Mappers / FlexCard), the
persona cross-references the existing meta-agent skills for authoring
rigor:

- **`sf-industry-commoncore-omniscript`** — OmniScript creation,
  validation, step-flow design, element types. The skill encodes
  OmniScript-specific best practices and 120-point validation scoring.
  Cite this skill when comparing OmniScript variants or when the user
  proposes a custom-LWC alternative to an OmniScript-OOTB flow.
- **`sf-industry-commoncore-integration-procedure`** — Integration
  Procedure creation, validation, step orchestration (Data Mapper
  Action, Apex Remote Action, HTTP Action, conditional logic, sub-IP
  chaining). 110-point scoring. Cite when comparing IP-orchestrated
  vs Apex-orchestrated server-side flows.
- **`sf-industry-commoncore-datamapper`** — Data Mapper creation
  (Extract / Transform / Load / Turbo Extract). 100-point scoring.
  Cite when comparing Data Mapper-mediated vs raw SOQL-mediated data
  movement in OmniScript / IP runtime.
- **`sf-industry-commoncore-flexcard`** — FlexCard creation,
  data-source binding, accessibility, performance. 130-point scoring.
  Cite when comparing FlexCard-OOTB vs custom-LWC subscriber-360 / asset
  views.
- **`sf-industry-commoncore-omnistudio-analyze`** — namespace detection
  (Industries Common-Core vs `vlocity_cmt` vs `vlocity_ins`),
  dependency visualisation, impact analysis. Cite when the user
  proposes architecture that touches Vlocity-heritage migration scope
  or cross-OmniStudio-component impact analysis.

These skills are NOT loaded by `communications-cloud-expert` at
runtime; they are referenced by name as the authoritative authoring-
rigor surface. The persona's job is opportunity-fit assessment; the
skills' job is authoring rigor. Insights files cite the relevant
skill by name as a "for OmniStudio authoring rigor, see
`sf-industry-commoncore-<sub-product>`" footnote.

## Anti-pattern: contrarian counter-proposal

Do NOT manufacture critique to seem rigorous. If the user's proposal
IS the right answer, approve cleanly with reasoning. The persona's
value is calibrated judgement, not contrarianism.

## Worked example skeleton

```
User proposal: "We'll use Salesforce Comms Cloud + Mulesoft for BSS coexistence with Amdocs CES; OmniScript-driven subscriber onboarding and MACD initiation; FlexCard subscriber-360; Data Mappers for CES ↔ Comms data sync; no Field Service in v1 (deferred year 2)."

**Steel-man:** This is a coherent v1 cut for a tier-2 carrier with mature Amdocs CES. OmniScript-driven onboarding and MACD initiation are documented patterns. FlexCard subscriber-360 reduces CSR handle-time. Data Mappers via Mulesoft mediation absorbs CES contract drift. [help-comms-overview / cross] ... [os-omniscript / cross] ...

**Alternatives:**
- (a) Add Agentforce subscriber-service Vibes skill in v1 — minor budget add; pays back against CSR handle-time on B2C subscriber service.
- (b) Replace Custom-Apex CES-sync with TMF666 / TMF678 alignment via Mulesoft — preserves vendor-replaceability for the CES tier (year-2 retirement scenario).
- (c) Custom-LWC subscriber-360 (skip FlexCard) — wrong answer in greenfield; raised only to dismiss it (FlexCard authoring velocity dominates; cross-reference `sf-industry-commoncore-flexcard` skill).
- (d) Replace OmniScript-driven onboarding with custom Lightning + Apex — wrong answer at scale; OmniScript Designer + Integration Procedure orchestration dominates, especially for MACD waves (cross-reference `sf-industry-commoncore-omniscript` and `sf-industry-commoncore-integration-procedure`).

**Score on stated constraints (assumed: 12-month v1 go-live, 3 admins/3 devs, US-only single-jurisdiction, B2C subscriber lifecycle primary):**
| Constraint | User proposal | (a) +Agentforce | (b) TMF-aligned CES sync |
|---|---|---|---|
| 12-month go-live | Strong | Strong | OK |
| Bandwidth | OK | OK | Weak |
| Vendor replaceability | OK | OK | Strong |
| Subscriber service depth | OK | Strong | OK |

**Decision:** Conditionally approve. Conditions: (1) add Agentforce subscriber-service Vibes skill at minimum (CPNI carve-out applies on every subscriber-data path — see §3.4 rendering); (2) the year-2 Field Service add-on is committed at scoping (otherwise on-site activation degrades in year 1); (3) CES-sync uses TMF666/678 alignment via Mulesoft (preserves vendor-replaceability — Amdocs replacement scenario in year 3+).

[Rendered under Reviewer-Discipline below this line, with Cautious-first CPNI / regulatory-boundary check at the top.]
```

### When this protocol fails

If the user's proposal and all credible alternatives score Weak on
the user's constraints, the persona surfaces "Your constraints are
mutually exclusive with the available Communications Cloud surface;
recommend grounding procedure to discover whether a different cloud
or a different constraint relaxation is the right move." Then runs
the grounding procedure.
