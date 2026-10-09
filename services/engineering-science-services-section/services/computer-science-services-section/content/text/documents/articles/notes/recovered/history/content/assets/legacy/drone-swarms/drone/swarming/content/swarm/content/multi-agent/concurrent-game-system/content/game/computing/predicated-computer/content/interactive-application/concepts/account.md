---
type: concept
class: identity-binding
depends-on: [user, identity-key, signature]
see-also: [authentication-method]
---

# Account

The substrate's *binding of a user to an authentication method and a set of authorizations*. Where [identity-key](../../teaching/explanations/identity-key.md) is the cryptographic identity of a substrate entity, an account is the user-experience layer above it: the username/email/handle the user authenticates as, the password/SSO/MFA they prove with, the substrate-side preferences and authorization grants attached.

An account has the structure:

- **Account identifier** — the user-facing handle (username, email, or stable id).
- **Authentication method(s)** — references to one or more authentication methods (per [authentication-method](authentication-method.md)). An account may have multiple methods (password + MFA, SSO + recovery key).
- **Bound user-record** — the [user](user.md) the account belongs to. Most accounts bind to exactly one user; service accounts may bind to a process.
- **Bound identity-key** — the cryptographic identity for the user's substrate operations.
- **Authorization grants** — references to the office memberships, individual powers, and other authorization predications the account holds. Per [enroll](../../agential-orchestration-platform/morphisms/enroll.md), these come through agent-record memberships.
- **Account state** — `active`, `suspended`, `closed`, with substrate-recorded transitions.

Per [self-representation](../../teaching/explanations/self-representation.md), accounts are substrate content. Account creation, authentication, and state changes are substrate operations producing witnesses. Per [signature-binds-witness-to-identity](../../../theorems/signature-binds-witness-to-identity.md), accounts inherit the substrate's non-repudiable attribution.
