# Salesforce Platform-and-Security Slack Channels — Curated THEMED Overlay

Per FD3 fleet addition + design-spec §3.4 (Wave 2.B special-shape: themed-by-discipline, NOT themed-by-cloud). Sentence-summary of every channel in `refresh/slack-channel-ledger.yaml`, organized by THEME. The ledger is the live freshness surface; this file is the human-readable curation rationale.

> **DEVIATION FROM CANONICAL:** This file is organized by THEME (4 themes), not by cloud. The foundation-skill §1 channel-curation procedure was invoked four times — once per theme — to produce this list. Each theme has ≥ 2 Tier-A entries.

## Theme 1: Salesforce Platform release-readiness

### Tier A (primary)

- **#release-readiness** — primary platform release-readiness broadcast; T1 daily refresh skim entry point. Cited in `Platform-readiness` sub-section of insights files when an opportunity surfaces a release-version-alignment concern.
- **#platform-release-announcements** — platform-wide release announcements; tracks version-cut readiness, sandbox preview windows.

### Tier B (secondary)

- **#sandbox-preview** — sandbox preview window announcements; useful for release-readiness scoping when a customer is on a sandbox-preview cycle.

## Theme 2: Salesforce Trust Foundations / Security

### Tier A (primary)

- **#salesforce-trust** — Trust portal advisories + security-incident broadcasts. Cited in `SSDF/Trust` sub-section of insights files when a security-advisory bears on the customer's posture.
- **#security-engineering** — engineering-team security discussions; high-signal for SSDF compliance + threat-model conversations.

### Tier B (secondary)

- **#ssdf** — SSDF compliance + audit conversations; lower volume, focused topical signal.

## Theme 3: General SE / engineering platform best-practices

### Tier A (primary)

- **#se-platform** — SE platform best-practices help channel; primary entry point for cross-cloud SE patterns.
- **#engineering-best-practices** — cross-team engineering best-practices community; high-signal for governor-limit / multitenancy hygiene patterns.

### Tier B (secondary)

- **#platform-architecture** — platform-architecture deep dives; lower volume but high topical density.

## Theme 4: Cross-cloud Apex / Flow / LWC architecture

### Tier A (primary)

- **#apex-architecture** — Apex architecture patterns spanning multiple clouds; high-signal for governor-limit deep dives + sharing-rule cross-cloud impact.
- **#lwc-architecture** — LWC architecture patterns; CSP / Locker / LWS deep-dives across cloud surfaces.

### Tier B (secondary)

- **#flow-architecture** — Flow architecture; auto-launched + record-triggered cross-cloud flow patterns.

## Anti-patterns

- Do NOT add a channel without running it through foundation skill §1 first. The §1 procedure is invoked PER THEME (four invocations total).
- Do NOT bump `last_material_change_at` on routine chatter — only material changes per §2.2. Bumping happens per channel (not per theme).
- Cross-fleet collision rule: if another cloud-expert (e.g., `agentforce-expert`, `data360-expert`) claims a channel as Tier-A primary, platform-and-security-expert claims Tier-B. Reconciled at wave-exit.
- Do NOT add cloud-feature-specific channels (e.g., `#sales-cloud-help`) to this ledger — those belong to the per-cloud personas. The themed structure prevents this drift by design.
