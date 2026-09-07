# Service Cloud Feature-Fit Comparison — Rotation Prompt

A rotating use-case eval. Picks one of the 10 rotation items below per
run; the persona produces a Reviewer-Discipline-shaped comparison.

## How to rotate

Each run picks the next item in the list (round-robin). Result files
record which item was used.

## Rotation list (10)

1. **Skill-Based Routing vs Queue-Based Routing** — for a 200-agent
   contact center with 6 distinct service lines (warranty, break-fix,
   billing, returns, technical-support, escalations). Constraints:
   agent-occupancy, AHT, configuration complexity.
2. **Lightning Knowledge vs external Confluence-backed KB** — for a
   customer with 5,000 existing Confluence articles and a knowledge-team
   of 4 authors. Constraints: migration cost, agent-search latency,
   case-deflection efficacy.
3. **Entitlement Process vs custom Apex SLA tracking** — for a customer
   with tiered service contracts (Bronze/Silver/Gold/Platinum) and
   contract-line-item milestone tracking. Constraints: configuration
   maintenance, milestone-violation reporting accuracy.
4. **Email-to-Case vs Web-to-Case vs Embedded Service deflection** — for
   a customer evaluating which channel to invest in first to reduce
   inbound case volume. Constraints: deflection-rate target (30%),
   integration tax, time-to-value.
5. **Service Cloud Voice (Amazon Connect) vs Service Cloud Voice with
   Partner Telephony (existing Genesys Cloud)** — for a customer with a
   3-year Genesys contract remaining. Constraints: switching cost,
   feature parity, post-call summary AI quality.
6. **Case Classification (Einstein → Agentforce) vs manual Assignment
   Rules** — for a 50k-cases-per-month inbound volume with 4 case
   categories. Constraints: classification accuracy, configuration
   maintenance, ramp-time for new categories.
7. **Lightning Service Console vs custom-built service workspace** — for
   a customer with a heavy console-customisation history (8 custom Apex
   classes deep). Constraints: maintenance burden, future-proofing
   against console upgrades, agent productivity.
8. **Messaging for In-App and Web vs Embedded Service Chat (legacy)** —
   for a customer modernising from a 2020-era Embedded Service deployment.
   Constraints: switching cost, mobile-SDK parity, agent-routing
   integration.
9. **Service Cloud Einstein → Agentforce Service Agent vs human-only
   triage** — for a customer with high-volume tier-1 cases (password
   resets, order-status, return-status) and 80 tier-1 agents.
   Constraints: deflection rate, agent-redeployment plan, customer
   satisfaction (CSAT).
10. **Field Service handoff (Service Cloud → Field Service) vs continuing
    homegrown dispatch** — for a customer with 250 field technicians and
    a 4-year-old in-house dispatch system. Constraints: implementation
    risk, mobile-worker UX continuity, integration with existing case
    workflows.

## Eval prompt template

For each rotation item, the persona is dispatched with:

```
Compare <item-1-of-10> for the use case described below.

opportunity-slug: rotation-eval-<slug>-<YYYY-MM-DD>
opportunity-id: ROTATION-<slug>-<YYYY-MM-DD>
requestor: eval-harness
gus-link: none

<3-5-line use case vignette specific to the rotation item>

Render under Reviewer-Discipline. Save the insights file at the canonical
path. Score on the customer-stated constraints.
```

## Use-case vignettes (one per rotation item)

### Vignette 1 — Skill-Based Routing vs Queue-Based Routing

```
200-agent contact center across 3 sites; 6 service lines (warranty,
break-fix, billing, returns, technical-support, escalations). Today:
queue-based routing per service line; agents float across two adjacent
queues during peak. Considering: skill-based routing with Omnichannel
Presence Configurations to better load-balance. Constraints:
agent-occupancy must stay > 80%, AHT must not regress, configuration
complexity must be maintainable by 2 admins.
```

### Vignette 2 — Lightning Knowledge vs external Confluence-backed KB

```
Customer has 5,000 Confluence articles maintained by a 4-author knowledge
team; agents currently keyword-search inside Confluence in a side panel.
Considering: migrate to Lightning Knowledge with KCS adoption + surface
articles in Service Console + Customer Self-Service portal. Constraints:
migration cost (one-time), agent-search latency (must drop below 2s p95),
case-deflection target (30% of inbound deflected via portal).
```

### Vignette 3 — Entitlement Process vs custom Apex SLA tracking

```
Tiered contracts: Bronze (24h response / 5d resolution), Silver (8h / 3d),
Gold (4h / 1d), Platinum (1h / 4h). Today: custom Apex with scheduled jobs
firing on Case timestamps; milestone-violation reporting is a SOQL spread
mailed nightly. Considering: Entitlement Process with Milestones +
Entitlement Templates. Constraints: configuration maintenance ≤ 1 admin
day per quarterly contract refresh; milestone-violation reporting accuracy
must be > 99%.
```

### Vignette 4 — Email-to-Case vs Web-to-Case vs Embedded Service deflection

```
Mid-market customer with 80% inbound case volume currently arriving via
phone (legacy CCaaS). Considering: shift 30% to digital channels (Email-to-Case,
Web-to-Case form, Embedded Service Chat) over 90 days. Constraints:
deflection target = 30% of inbound to digital; integration tax with existing
phone routing must remain neutral; time-to-value ≤ 60 days for at least
one channel.
```

### Vignette 5 — Service Cloud Voice (Amazon Connect) vs SCV Partner Telephony

```
Customer has a 3-year Genesys Cloud contract with 18 months remaining; 300
agents on phone + email. Considering: Service Cloud Voice with Partner
Telephony (Genesys integration) at v1, migrate to Amazon Connect at the
contract roll. Constraints: switching cost (Genesys exit fee + Amazon Connect
ramp), feature parity (post-call summary AI quality is the customer's
priority), 0% downtime acceptable during the cutover.
```

### Vignette 6 — Case Classification (Agentforce) vs manual Assignment Rules

```
50k inbound cases per month; 4 case categories (warranty, billing,
technical-support, returns). Today: manual Assignment Rules with 12 admin-tuned
sub-conditions; case mis-routing rate ≈ 8%. Considering: Case Classification
(Einstein → Agentforce) with auto-classification. Constraints: classification
accuracy ≥ 95% on 80% of cases; configuration maintenance must be admin-friendly
(no Apex); ramp-time for a new category ≤ 1 week.
```

### Vignette 7 — Lightning Service Console vs custom-built service workspace

```
Customer with 8 custom Apex classes powering a heavily customised
Visualforce/Aura Service Console (built 2020); 4 admin-developers maintaining.
Considering: migrate to Lightning Service Console with reusable LWC components.
Constraints: maintenance burden must drop ≥ 30% (admin-hours/quarter);
future-proofing against Salesforce Classic deprecation; agent productivity must
be neutral or improve during cutover.
```

### Vignette 8 — Messaging for In-App and Web vs Embedded Service Chat (legacy)

```
Customer with a 2020-era Embedded Service Chat deployment in two mobile apps
(iOS, Android) and a public website. Considering: migrate to Messaging for In-App
and Web. Constraints: switching cost (re-instrumentation of mobile SDKs);
mobile-SDK parity (must support iOS 17+ and Android 14+); agent-routing
integration must continue with existing Omnichannel Presence Configurations.
```

### Vignette 9 — Agentforce Service Agent vs human-only triage

```
Customer with high-volume tier-1 case mix: password resets (40%),
order-status (25%), return-status (20%), other (15%). 80 tier-1 agents.
Considering: Agentforce Service Agent for tier-1 deflection. Constraints:
deflection rate ≥ 30%; agent-redeployment plan (move freed-up agents to
tier-2 / tier-3 queues, not lay off); CSAT must not drop > 2 points during
ramp.
```

### Vignette 10 — Field Service handoff vs continuing homegrown dispatch

```
Customer with 250 field technicians on a 4-year-old homegrown dispatch system
(case-to-tech assignment via custom Apex; mobile dispatch via SMS). 90-day
window to migrate. Considering: Service Cloud → Field Service handoff with
Service Appointment / Work Order, Salesforce Field Service mobile app on iOS.
Constraints: implementation risk (must run parallel for ≥ 30 days);
mobile-worker UX continuity (techs use the SMS workflow today; no offline
disruption); integration with existing Service Cloud case workflow.
```

## Pass criterion

Per `rubric.md`. ≥ 16/20, no field at 0.

## Anti-patterns

- Producing a numeric score (10/10 etc.) — the rubric uses Strong/OK/Weak
  per `compare-alternatives.md`.
- Recommending an out-of-cloud alternative (Field Service mobile internals,
  Marketing Cloud journey integration) without triggering the grounding
  procedure first.
- Conflating "Einstein for Service" with "Agentforce Service Agent" without
  citing the naming note from `knowledge.md`.
