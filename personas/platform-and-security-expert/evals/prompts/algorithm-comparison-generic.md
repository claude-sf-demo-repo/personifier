# Platform-and-Security Feature-Fit Comparison — Rotation Prompt

A rotating use-case eval. Picks one of the 10 rotation items below per run; the persona produces a Reviewer-Discipline-shaped comparison.

## Rotation list (10) — Platform-and-Security alternatives

1. **Permission-Set Groups vs Profile customisation** — for a 2,000-seat enterprise migrating from heavy-profile-customisation to a clean permission-set strategy.
2. **SAML 2.0 vs OIDC** — for a customer with Okta as IdP, choosing the federation protocol for new Salesforce instances.
3. **Shield Platform Encryption vs Classic Encryption** — for a customer with PII columns and a SOC 2 audit boundary.
4. **Hyperforce vs first-party hosting (legacy pod)** — for an existing first-gen-pod customer evaluating migration.
5. **External Services vs Apex callouts** — for an integration that calls 3 external REST APIs declaratively.
6. **OAuth Web Server vs JWT Bearer flow** — for a server-to-server integration where the integration host is a customer-controlled VPC.
7. **Shield Event Monitoring vs custom audit log** — for a 500-seat customer weighing Shield licence cost against custom Apex audit-trigger build.
8. **OWD private + sharing-rules vs OWD public-read-only + with-sharing Apex** — for a customer with complex multi-tenant data segmentation.
9. **MFA enforcement vs SSO bypass for service accounts** — for a customer with 50 service accounts running integrations.
10. **Connected App scope minimisation vs full-access scope** — for a customer's first-time Connected App build.

## Eval prompt template

```
Compare <item-1-of-10> for the use case described below.

opportunity-slug: rotation-eval-<slug>-<YYYY-MM-DD>
opportunity-id: ROTATION-<slug>-<YYYY-MM-DD>
requestor: eval-harness
gus-link: none

<3-5-line use case vignette specific to the rotation item>

Render under Reviewer-Discipline. Save the insights file at the canonical path.
```

## Use-case vignettes (one per rotation item)

### Vignette 1 — Permission-Set Groups vs Profile customisation

```
2,000-seat enterprise. Today: 47 customised profiles (each with 100+ field
permissions diverging from baseline). Considering: collapse to 5 baseline
profiles + permission-set groups for role-shaped layering. Constraints:
audit-trail preservation, time-to-implement, ongoing maintenance reduction.
```

### Vignette 2 — SAML 2.0 vs OIDC

```
Multi-cloud Salesforce customer (Sales + Service + Data 360). IdP: Okta.
Existing federation with internal apps: SAML 2.0. New question: for the new
Salesforce orgs, federate via SAML 2.0 (consistent) or OIDC (modern)?
Constraints: protocol modernity, JIT-provisioning ease, debugging tooling depth,
Okta-side configuration burden.
```

### Vignette 3 — Shield Platform Encryption vs Classic Encryption

```
Mid-market FS customer with 200 PII columns across 12 custom objects. SOC 2
audit boundary is the entire org; PCI-DSS adjacent for one custom object
(payment-token storage). Considering: Shield Platform Encryption org-wide,
or Classic Encryption on the PCI-adjacent fields? Constraints: encryption depth,
formula-field blast radius (the org has 80 formula fields referencing PII columns),
key-management posture, cost.
```

### Vignettes 4–10

Each vignette follows the same 3-5-line shape; specific Platform/Security features in scope and the customer-stated constraints are spelled out so the harness is self-contained.

## Pass criterion

Per `rubric.md`. ≥ 16/20, no field at 0.

## Anti-patterns

- Producing a numeric score (10/10 etc.) — the rubric uses Strong/OK/Weak per `compare-alternatives.md`.
- Recommending a non-Salesforce alternative without triggering the grounding procedure first.
- Inline-listing Vibes-skills or IDOs (W6=D guard breach).
- Tier-3 invocation > 3 in a single dispatch.
