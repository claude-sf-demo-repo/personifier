# launchd Canonical List

Inventory of all expected `~/Library/LaunchAgents/com.salesforce.cloud-expert.*.plist` files. Phase 6 acceptance verifies this list against `launchctl list`.

## Cloud-experts (19 personas × 4 tiers = 76 plists)

For each slug below, expect 4 plists: `tier-1`, `tier-2`, `tier-3`, `tier-4`.

```
sales-cloud-expert
service-cloud-expert
agentforce-expert
data360-expert
marketing-cloud-expert
tableau-expert
mulesoft-expert
commerce-cloud-expert
revenue-cloud-expert
slack-expert
financial-services-cloud-expert
health-and-life-sciences-cloud-expert
energy-and-utilities-cloud-expert
communications-cloud-expert
manufacturing-cloud-expert
field-service-expert
informatica-expert
apromore-expert
platform-and-security-expert
```

**Persona-specific exceptions** (downgraded tiers per FD9 / volatility ≤ 7):

- `apromore-expert` — may omit `tier-3` (no IDOs, no Vibes; T3 collapses into T4 quarterly). Confirmed in W6 of the persona's workshop.
- `informatica-expert` — surface confirmed in W6; may also omit `tier-3` if no IDOs.

If any persona omits a tier, document the omission in that persona's `refresh/schedule.md` and update this list with a strikethrough.

## Router (1 persona × 1 tier = 1 plist)

```
salesforce-cloud-router  (tier-4 only — quarterly matrix sweep)
```

## Monthly consolidation (per project root)

```
com.salesforce.cloud-expert.consolidation.<project-path-encoded>
```

One per project root that has invoked any cloud-expert. Expected count: 1+ depending on user's active projects.

## Acceptance verification (Phase 6)

```bash
launchctl list | grep -c com.salesforce.cloud-expert
```

Expected: ≥ 76 (19 × 4) + 1 (router) + N (consolidations). Adjust for documented FD9 exceptions.

If count is short, run `launchctl list | grep com.salesforce.cloud-expert > /tmp/loaded.txt`, then diff against this list to find gaps.

## Loaded log

### sales-cloud-expert (Wave 1.A; loaded 2026-05-15)

- com.salesforce.cloud-expert.sales-cloud-expert.tier-1
- com.salesforce.cloud-expert.sales-cloud-expert.tier-2
- com.salesforce.cloud-expert.sales-cloud-expert.tier-3
- com.salesforce.cloud-expert.sales-cloud-expert.tier-4

### service-cloud-expert (Wave 1.B; loaded 2026-05-17)

- com.salesforce.cloud-expert.service-cloud-expert.tier-1
- com.salesforce.cloud-expert.service-cloud-expert.tier-2
- com.salesforce.cloud-expert.service-cloud-expert.tier-3
- com.salesforce.cloud-expert.service-cloud-expert.tier-4

## agentforce-expert (Wave 1.B; loaded 2026-05-17)

- com.salesforce.cloud-expert.agentforce-expert.tier-1
- com.salesforce.cloud-expert.agentforce-expert.tier-2
- com.salesforce.cloud-expert.agentforce-expert.tier-3
- com.salesforce.cloud-expert.agentforce-expert.tier-4

## marketing-cloud-expert (Wave 2.A; loaded 2026-05-19)

- com.salesforce.cloud-expert.marketing-cloud-expert.tier-1
- com.salesforce.cloud-expert.marketing-cloud-expert.tier-2
- com.salesforce.cloud-expert.marketing-cloud-expert.tier-3
- com.salesforce.cloud-expert.marketing-cloud-expert.tier-4

## tableau-expert (Wave 2.A; loaded 2026-05-19)

- com.salesforce.cloud-expert.tableau-expert.tier-1
- com.salesforce.cloud-expert.tableau-expert.tier-2
- com.salesforce.cloud-expert.tableau-expert.tier-3
- com.salesforce.cloud-expert.tableau-expert.tier-4

## mulesoft-expert (Wave 2.B; loaded 2026-05-19)

- com.salesforce.cloud-expert.mulesoft-expert.tier-1
- com.salesforce.cloud-expert.mulesoft-expert.tier-2
- com.salesforce.cloud-expert.mulesoft-expert.tier-3
- com.salesforce.cloud-expert.mulesoft-expert.tier-4

## commerce-cloud-expert (Wave 2 Batch A; loaded 2026-05-19)

- com.salesforce.cloud-expert.commerce-cloud-expert.tier-1
- com.salesforce.cloud-expert.commerce-cloud-expert.tier-2
- com.salesforce.cloud-expert.commerce-cloud-expert.tier-3
- com.salesforce.cloud-expert.commerce-cloud-expert.tier-4

## revenue-cloud-expert (Wave 2 Batch A; loaded 2026-05-19)

- com.salesforce.cloud-expert.revenue-cloud-expert.tier-1
- com.salesforce.cloud-expert.revenue-cloud-expert.tier-2
- com.salesforce.cloud-expert.revenue-cloud-expert.tier-3
- com.salesforce.cloud-expert.revenue-cloud-expert.tier-4

## platform-and-security-expert (Wave 2.B; loaded 2026-05-19)

- com.salesforce.cloud-expert.platform-and-security-expert.tier-1
- com.salesforce.cloud-expert.platform-and-security-expert.tier-2
- com.salesforce.cloud-expert.platform-and-security-expert.tier-3
- com.salesforce.cloud-expert.platform-and-security-expert.tier-4

## financial-services-cloud-expert (Wave 3.C; loaded 2026-05-22)

- com.salesforce.cloud-expert.financial-services-cloud-expert.tier-1
- com.salesforce.cloud-expert.financial-services-cloud-expert.tier-2
- com.salesforce.cloud-expert.financial-services-cloud-expert.tier-3
- com.salesforce.cloud-expert.financial-services-cloud-expert.tier-4

## health-and-life-sciences-cloud-expert (Wave 3.C; loaded 2026-05-22)

- com.salesforce.cloud-expert.health-and-life-sciences-cloud-expert.tier-1
- com.salesforce.cloud-expert.health-and-life-sciences-cloud-expert.tier-2
- com.salesforce.cloud-expert.health-and-life-sciences-cloud-expert.tier-3
- com.salesforce.cloud-expert.health-and-life-sciences-cloud-expert.tier-4

## energy-and-utilities-cloud-expert (Wave 3.C; loaded 2026-05-22)

- com.salesforce.cloud-expert.energy-and-utilities-cloud-expert.tier-1
- com.salesforce.cloud-expert.energy-and-utilities-cloud-expert.tier-2
- com.salesforce.cloud-expert.energy-and-utilities-cloud-expert.tier-3
- com.salesforce.cloud-expert.energy-and-utilities-cloud-expert.tier-4

## communications-cloud-expert (Wave 3.C; loaded 2026-05-22)

- com.salesforce.cloud-expert.communications-cloud-expert.tier-1
- com.salesforce.cloud-expert.communications-cloud-expert.tier-2
- com.salesforce.cloud-expert.communications-cloud-expert.tier-3
- com.salesforce.cloud-expert.communications-cloud-expert.tier-4

## field-service-expert (Wave 3.D; loaded 2026-05-23)

- com.salesforce.cloud-expert.field-service-expert.tier-1
- com.salesforce.cloud-expert.field-service-expert.tier-2
- com.salesforce.cloud-expert.field-service-expert.tier-3
- com.salesforce.cloud-expert.field-service-expert.tier-4

## informatica-expert (Wave 3.D; loaded 2026-05-23)

- com.salesforce.cloud-expert.informatica-expert.tier-1
- com.salesforce.cloud-expert.informatica-expert.tier-2
- com.salesforce.cloud-expert.informatica-expert.tier-3
- com.salesforce.cloud-expert.informatica-expert.tier-4
