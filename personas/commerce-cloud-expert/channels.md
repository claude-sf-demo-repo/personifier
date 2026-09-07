# Commerce Cloud Slack Channels — Curated Overlay

Per FD3 fleet addition. Sentence-summary of every channel in `refresh/slack-channel-ledger.yaml`.
The ledger is the live freshness surface; this file is the human-readable curation rationale.
Grouped by sub-product first (B2C / B2B / D2C / cross-cutting) then by tier.

## B2C Commerce

### Tier A (primary)

- **#b2c-commerce-help** — primary B2C Commerce help channel; high member count +
  help purpose. Cited in `Internal signal` sections of insights files when an
  opportunity surfaces a known B2C Commerce bug or feature-gap question.
- **#sfra-cartridge-dev** — SFRA cartridge developer channel. Cited in
  `Internal signal` for SFRA-vs-headless decisions and cartridge-specific
  technical patterns (controllers, models, ISML, hooks).
- **#scapi** — SCAPI / headless commerce / Composable Storefront / PWA Kit
  technical channel. Cited for Composable Storefront and OCAPI→SCAPI migration
  discussions.

### Tier B (secondary)

- **#einstein-commerce** — B2C Commerce Einstein → Agentforce-integrated AI.
  Cited when an opportunity touches B2C Commerce Einstein Recommendations,
  Search, or Personalised Shopping; tracks the Einstein → Agentforce rebrand
  in flight. Tier-B until member-count exceeds Tier-A threshold.

## B2B Commerce

### Tier A (primary)

- **#b2b-commerce-lightning** — B2B Commerce Lightning Experience channel.
  Cited for B2B reseller-portal opportunities, contracted pricing, account
  hierarchies, entitlements, store-wide search.
- **#b2b-commerce-help** — generic B2B Commerce help / community channel.
  Cited in `Internal signal` for B2B Commerce questions across the surface.

## D2C Commerce

### Tier B (secondary — newest sub-product)

- **#d2c-commerce** — D2C Commerce community channel. Newest sub-product;
  member count keeps it at Tier-B by default. Cited for D2C-shaped storefront
  builds on the B2B Commerce Lightning platform. May overlap with
  `#b2b-commerce-lightning` — sub-product collision rule applies (cross-tagged
  as `d2c` here, but a B2C+B2B-Commerce-Lightning-cross channel would be
  tagged `cross`).

## Cross-cutting

### Tier A (primary)

- **#commerce-cloud-announcements** — release-track / announcements
  cross-cutting channel. Tier-A. Tracks B2C / B2B / D2C / OMS announcements.
  T1 daily skim starts here for release-readiness signal.
- **#commerce-oms** — Order Management Service channel; relevant to all
  three sub-products (B2C-OMS integration, B2B-OMS integration, D2C-OMS
  integration). Tier-A primary for OMS-Commerce integration questions.
- **#commerce-cloud-se** — SE coordination channel covering all three
  sub-products. Tier-A by topical relevance even with sell purpose.
  (Override per foundation skill §1.4: SE channels uniquely high-signal for
  Commerce Cloud due to deal size and three-sub-product spread.)

## Anti-patterns

- Do NOT add a channel without running it through foundation skill §1 first.
- Do NOT bump `last_material_change_at` on routine chatter — only material changes
  per §2.2.
- Cross-fleet collision rule: if another cloud-expert claims a channel as Tier-A
  primary, commerce-cloud-expert claims Tier-B. Reconciled at wave-exit.
- Sub-product collision rule: a channel that surfaces both B2C and B2B traffic is
  tagged `cross` and treated as cross-cutting; it does not double-count toward the
  per-sub-product Tier-A budget. A channel that is B2B-platform-built but D2C-
  shaped (e.g., `#d2c-commerce` running on the B2B engine) stays sub-product-
  tagged as `d2c` not `cross` — the platform is shared but the experience surface
  is the sub-product attribution that matters.
- Pre-rebrand legacy channel names (`#demandware-*`, `#cloudcraze-*`) are not
  populated here at v1.0.0 because they are largely archived. If the first T1
  refresh surfaces active legacy-named channels, append them with a `notes:`
  flagging the rebrand.
