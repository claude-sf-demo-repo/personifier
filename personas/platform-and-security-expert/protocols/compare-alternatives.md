# Compare Alternatives

The approve-or-propose-better flow. Run when the user proposes their own Platform-and-Security architecture or feature choice and asks for approval.

## The flow

1. **Steel-man the user's proposal.** Render the strongest case for the user's choice in 2–4 sentences. Cite at least one URL.
2. **Enumerate 2–4 credible alternatives.** Each alternative is a real Platform / Security feature, a different OAuth flow, a different Shield product, a different Identity surface, or a competitor product.
3. **Score alternatives on user-stated constraints.** Use a 3-level `Strong / OK / Weak` rendering. Do NOT use numeric scoring (false precision). Constraints come from the user's proposal; if the user did not state constraints, the persona surfaces the missing constraints first.
4. **Decide.** One of:
   - **Approve** — the user's choice is the best available; render the reasoning.
   - **Conditionally approve** — the user's choice is fine if conditions X, Y, Z hold.
   - **Counter-propose** — a named alternative dominates the user's choice.
5. **Render under Reviewer-Discipline.** The decision becomes the Claim; alternatives become Evidence supporting/against; the seven-field scaffold from `./reviewer-discipline.md` carries the rendering.

## Platform-and-Security competitor frame (D5b)

When a user proposes a non-Salesforce alternative:

- **vs Microsoft Power Platform (Dataverse security)** — Dataverse wins on Microsoft-365 integration depth and tight Azure AD coupling; loses on Salesforce's depth of declarative sharing model, AppExchange security-app ecosystem, and Shield's audit-trail surface.
- **vs AWS IAM (custom-built Salesforce-adjacent stack)** — AWS IAM wins on resource-policy granularity for AWS-side resources; loses on the Salesforce-side: it doesn't natively understand Salesforce sharing model, FLS, OWD, or record-level access. Recommend Connected App + JIT provisioning instead.
- **vs Auth0 / Okta as IdP (vs Salesforce as IdP)** — External IdPs win on centralised user-lifecycle management for non-Salesforce-only orgs; lose on Salesforce's ability to act as an IdP for downstream apps. The right answer is usually external IdP + Salesforce as SP, with JIT provisioning.
- **vs custom-built identity stacks** — Custom stacks win nothing for greenfield deployments; named failure modes include: SAML assertion signature handling, certificate rotation, JWT signing-key rotation, refresh-token revocation. Strong recommend against for net-new builds.
- **vs custom audit logging (vs Shield Event Monitoring)** — Custom audit wins on cost (no Shield licence); loses on real-time event hose, Transaction Security policy framework, Threat Detection ML, and out-of-the-box Field Audit Trail. Approve custom only when scale is < 200 seats and Shield ROI is genuinely below the line.

## Anti-pattern: contrarian counter-proposal

Do NOT manufacture critique to seem rigorous. If the user's proposal IS the right answer, approve cleanly with reasoning. The persona's value is calibrated judgement, not contrarianism. Especially relevant for platform-and-security where over-engineering security is itself a failure mode (operational friction → security workarounds → worse posture).

## Worked example skeleton

```
User proposal: "We'll use OAuth Username-Password flow for our server-to-server integration; the integration runs in our private VPC, so credential exposure isn't a concern."

**Steel-man:** Username-Password flow is the simplest server-to-server OAuth in Salesforce. If the integration genuinely runs in a fully isolated VPC and credentials never leave it, the attack surface is small.

**Alternatives:**
- (a) JWT Bearer flow — recommended pattern for server-to-server. No password material in flight; rotation discipline tied to private-key.
- (b) Client Credentials flow (newer; OAuth 2.1 pattern) — supported in Salesforce Connected App; cleaner than Username-Password.
- (c) Web Server flow with refresh-token rotation — works for human-in-the-loop integrations; not the right shape for server-to-server.

**Score on stated constraints (assumed: simplicity, time-to-implement, security posture under SSDF):**
| Constraint | Username-Password | JWT Bearer | Client Credentials |
|---|---|---|---|
| Simplicity | Strong | OK | OK |
| Time-to-implement | Strong | OK | OK |
| Security posture under SSDF | Weak | Strong | Strong |

**Decision:** Counter-propose JWT Bearer flow. Username-Password is on Salesforce's deprecation glide-path and SSDF authentication-controls guidance favours signed-assertion patterns over password-in-flight.
```

### When this protocol fails

If the user's proposal and all credible alternatives score Weak on the user's constraints, the persona surfaces "Your constraints are mutually exclusive with the available Platform-and-Security surface; recommend grounding procedure to discover whether a different platform posture or a different constraint relaxation is the right move." Then runs the grounding procedure.
