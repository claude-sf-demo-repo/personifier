# Marketing Cloud Feature-Fit Comparison — Rotation Prompt

A rotating use-case eval. Picks one of the 10 rotation items below per
run; the persona produces a Reviewer-Discipline-shaped comparison. The
rotation explicitly spans all four flagship sub-products (Engagement,
Personalization, Account Engagement, Growth) plus Einstein/Agentforce.

## How to rotate

Each run picks the next item in the list (round-robin). Result files
record which item was used.

## Rotation list (10)

1. **Marketing Cloud Engagement vs Marketing Cloud Account (Engagement
   journeys vs Engagement Studio)** — for a hybrid B2C+B2B SaaS company
   with both consumer subscribers and channel-partner contacts.
   Constraints: which sub-product owns which audience, deliverability,
   data-model integration.
2. **Marketing Cloud Engagement vs Marketing Cloud Personalization (batch
   journey vs real-time decisioning)** — for an e-commerce site that
   wants both abandoned-cart journeys and real-time on-site product
   recommendations. Constraints: latency, server-side vs client-side,
   ITP cookie expiry.
3. **AMPscript vs SSJS in CloudPages** — for a customer building a
   landing-page micro-site with form submission, lookup against a Data
   Extension, dynamic-content rendering. Constraints: maintainability,
   performance, debuggability.
4. **Batch Send Time Optimisation vs streaming Send Time Optimisation
   (Einstein STO modes)** — for a 5M-subscribers retail customer wanting
   per-user optimal send time. Constraints: send-volume scale, latency,
   model-training feedback loop.
5. **Data Extension vs Synchronised Data Extension vs Profile Attribute
   (Engagement data model)** — for a customer wiring Marketing Cloud to
   Salesforce CRM. Constraints: real-time vs batch, write semantics,
   subscriber-key resolution.
6. **Marketing Cloud Account vs HubSpot Marketing Hub (B2B nurture
   suite)** — for a 200-rep B2B SaaS outbound nurture motion. Constraints:
   B2B fit, time-to-value, Salesforce-CRM-native flow.
7. **Marketing Cloud Growth vs Marketing Cloud Engagement (SMB tier
   choice)** — for an 80k-subscriber Shopify-based SMB e-commerce shop.
   Constraints: scale, complexity tolerance, Klaviyo-comparison.
8. **Mobile Studio MobileConnect SMS vs MobilePush (mobile channel
   choice)** — for an iOS-heavy customer (70% iOS) with a 90-day go-live.
   Constraints: short-code lead time, channel reach, app-install rate.
9. **Subject Line Helper (Einstein) vs human copywriter** — for a
   200-marketer customer with high copy throughput. Constraints: brand-
   voice consistency, throughput, copywriter-team productivity.
10. **Personalization web actions vs Personalization server-side
    decisioning (Sitemap + Catalog)** — for a publisher with personalised
    content surfaces. Constraints: latency, ITP-aware tracking robustness,
    decision-rule sophistication.

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

### Vignette 1 — Engagement vs Account Engagement (hybrid B2C+B2B)

```
Hybrid SaaS company. Audience splits 60/40 B2C consumer subscribers / B2B
channel-partner contacts. Today: Klaviyo for B2C, manual outreach for B2B.
Considering: Marketing Cloud across both audiences. Question: one
sub-product or two? If two, how does the data model bridge the partner
contacts that are also B2C subscribers (a partner who also buys retail)?
Constraints: B2B fit, B2C scale (1.2M subscribers), unified-customer-record.
```

### Vignette 2 — Engagement journeys vs Personalization real-time

```
E-commerce apparel site. Send volume 8M/month. Audience: 2.6M subscribers,
~40% mobile-first, iOS-heavy. Today: abandoned-cart email triggered by
Shopify webhooks. Considering: add real-time on-site product recommendations
based on browsing behaviour. Question: pure Engagement (extend journeys),
pure Personalization (real-time decisioning), or both? Constraints: latency
(< 200ms for on-site decisioning), ITP cookie expiry on Safari, server-side
vs client-side rendering.
```

### Vignette 3 — AMPscript vs SSJS in CloudPages

```
Marketing-Cloud-Engagement customer building a CloudPages landing page for
a campaign. Functions needed: form submission to a Data Extension, dynamic
content based on subscriber attributes, conditional rendering for opt-in
status. Two engineers proposed AMPscript-only vs SSJS-only implementations.
Question: pick one or hybrid? Constraints: maintainability (a single
admin will own this), performance (page load < 2s), debuggability.
```

### Vignette 4 — STO modes (batch vs streaming)

```
5M-subscriber retail customer wanting per-user optimal send time across
their twice-weekly broadcast emails. Currently sends at 9am ET universally.
Engineering team is debating batch STO (nightly model run) vs streaming
STO (Einstein scoring at send time per recipient). Constraints: send-
volume scale, latency-vs-freshness tradeoff, model-training feedback loop.
```

### Vignette 5 — DE vs Synchronised DE vs Profile Attribute

```
Marketing Cloud Engagement customer wiring up Marketing Cloud Connect to
Salesforce Sales Cloud. Need: subscribers' Lead Status from Sales Cloud
to drive journey decisioning. Three modeling options: standard DE
populated by Marketing Cloud Connect data extracts; Synchronised DE
mirroring the Sales Cloud Lead object; Profile Attribute on Subscriber.
Constraints: real-time vs batch, write semantics (round-trip back to
Sales Cloud), subscriber-key resolution complexity.
```

### Vignette 6 — Account Engagement vs HubSpot Marketing Hub

```
200-rep B2B SaaS company today on Salesforce Sales Cloud. Outbound
nurture is currently fragmented across reps using Salesloft. Considering
adding Marketing Cloud Account (Pardot/Account Engagement) for nurture
automation; HubSpot Marketing Hub being floated as alternative.
Constraints: B2B fit, time-to-value (need launch in 60 days),
Salesforce-CRM-native flow vs HubSpot-CRM-leaning ecosystem.
```

### Vignette 7 — Growth vs Engagement (SMB)

```
80k-subscriber Shopify-based SMB e-commerce shop. 6-person marketing team
including the founder. Today on Klaviyo. Want to consolidate on Salesforce
ecosystem because they also use Service Cloud. Question: Marketing Cloud
Growth (new SMB offering) or Marketing Cloud Engagement (Pro tier)?
Constraints: scale (80k subs, 200k sends/month projected), complexity
tolerance (no developers), Klaviyo-comparison (Klaviyo is Shopify-native).
```

### Vignette 8 — MobileConnect SMS vs MobilePush

```
Marketing Cloud Engagement customer with 1.5M subscribers, ~70% iOS.
90-day go-live. Mobile-channel ask in deal. Question: SMS via
MobileConnect, push via MobilePush, or both? Constraints: short-code
provisioning lead time (8-12 weeks NA for SMS), channel reach (push
requires app install — 60% app-install rate), 90-day calendar.
```

### Vignette 9 — Subject Line Helper vs human copywriter

```
200-marketer enterprise customer doing 50+ campaign sends/week. High copy
throughput. Today: 8 dedicated copywriters; brand-voice review process is
the bottleneck. Considering Einstein Subject Line Helper (Marketing
Cloud Vibes skill) to scale subject-line generation. Question: replace
human copywriters, augment them, or scope only as a generation aid?
Constraints: brand-voice consistency, throughput uplift, copywriter-team
morale and productivity.
```

### Vignette 10 — Personalization web actions vs server-side decisioning

```
Online publisher with 12M monthly visitors. Wants personalised content
surfaces (article recommendations, paywall offers). Marketing Cloud
Personalization in scope. Question: client-side web actions (campaigns)
or server-side decisioning (Sitemap + Catalog + Promotions)? Constraints:
latency (< 100ms TTFB target), ITP-aware tracking robustness on Safari,
decision-rule sophistication (10+ overlapping audience segments).
```

## Pass criterion

Per `rubric.md`. ≥ 16/20, no field at 0.

## Anti-patterns

- Producing a numeric score (10/10 etc.) — the rubric uses Strong/OK/Weak
  per `compare-alternatives.md`.
- Recommending an out-of-cloud alternative without triggering the grounding
  procedure first.
- Sub-product attribution error per design-spec §3.4. Especially common on
  vignettes 1, 2, 5 where the comparison straddles sub-products.
