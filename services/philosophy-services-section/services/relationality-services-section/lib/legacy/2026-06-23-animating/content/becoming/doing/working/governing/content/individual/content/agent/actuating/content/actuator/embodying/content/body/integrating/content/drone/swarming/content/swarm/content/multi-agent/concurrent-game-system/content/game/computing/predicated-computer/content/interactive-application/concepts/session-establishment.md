---
type: concept
class: session-discipline
depends-on: [authentication-flow, authentication-method, account, identity-key, identity-key-custody, signature-binds-witness-to-identity, modal-necessity-operator, bilattice-accessibility-relation]
see-also: [session, authentication-as-modal-restriction, user]
---

# Session establishment

The substrate's *user-session creation discipline* — the substrate operations that follow a successful [authentication-flow](authentication-flow.md) and produce a substrate-content [session](../../agential-orchestration-platform/concepts/session.md) tying the user-agent's subsequent requests to a verified identity. Where AOP's [session](../../agential-orchestration-platform/concepts/session.md) describes the agent-facing session structure, this concept covers the user-facing establishment ritual: what cells are admitted at session start, what the session-id is, how it's bound to the user-agent, how it's revoked.

In the substrate's hyperdoctrine setting, session establishment is *the substrate operation that creates a [bilattice accessibility relation](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/bilattice-accessibility-relation.md) cell from the user-agent's authenticated world to the user's account-fiber*. Per [authentication-as-modal-restriction](../theorems/authentication-as-modal-restriction.md), the session is the modal restriction $\Box_R$ along this cell — the user-agent's effective capability is the user's capability bounded by the session's accessibility grade.

## Why this concept exists

[authentication-flow](authentication-flow.md) describes the user-agent-to-substrate exchange that proves identity. [session](../../agential-orchestration-platform/concepts/session.md) describes what a session is at the AOP level (agent-bounded, time-bounded, memory-coupled). But neither covers the *bridge*: what happens substrate-content-wise the moment authentication succeeds and the session begins. Without that bridge, two implementations could treat "established session" differently (one stores it as a server-side cookie, another stores it as a substrate cell, a third stores it externally) — breaking conformance and replay-determinism.

This concept fixes the substrate-content shape of an established session.

## Session-establishment cells

When [authentication-flow](authentication-flow.md) verification succeeds at ordinal $\sigma$, the substrate admits the following cells (in this order, atomically):

### 1. Session entity

```json
{
  "kind": "user-session",
  "session-id": "<canonical hash of remaining session-establishment content>",
  "account-hash": "<the authenticated account>",
  "user-agent-public-key-hash": "<the verified user-agent's public key>",
  "established-at": "<ISO 8601 UTC>",
  "established-at-ordinal": <substrate ordinal>,
  "valid-until": "<ISO 8601 UTC>",
  "valid-until-ordinal": <substrate ordinal>,
  "authentication-method-used": "<method-record-hash>",
  "authentication-strength": "<strong | medium | weak>"
}
```

Per [hash-injectivity-under-canonical-form](../../../theorems/hash-injectivity-under-canonical-form.md), the session-id is the canonical-form hash. Per [signature-binds-witness-to-identity](../../../theorems/signature-binds-witness-to-identity.md), the session entity is signed by the substrate's identity-key.

### 2. Session-token (returned to user-agent)

The user-agent receives a session-token — typically the session-id plus a short HMAC over `(session-id, server-time)` to prevent replay. The token is opaque to the user-agent; subsequent requests include it (as a cookie, an `Authorization` header, or a connection-level handshake field).

### 3. Capability admission

```json
{
  "kind": "session-capability",
  "session-id": "<the session-id from step 1>",
  "capabilities": [<capability-hash>, ...],
  "scope": "<scope-hash, or 'global' for full account scope>"
}
```

Per [governance-as-modal-restriction](../../agential-orchestration-platform/theorems/governance-as-modal-restriction.md), the session's capabilities are the modal restriction $\Box_R$ of the account's capabilities along the user-agent's accessibility cell. Per [authentication-as-modal-restriction](../theorems/authentication-as-modal-restriction.md), the restriction grade depends on the authentication-method's strength.

### 4. Witness

Per [witness](../../teaching/explanations/witness.md), the session establishment produces a witness recording the authentication-flow used, the verified identity, the granted capabilities. Per [witness-chain-as-proof-object](../../../theorems/witness-chain-as-proof-object.md), this witness is part of the substrate's audit chain.

## How the user-agent uses the session

For each subsequent request:

1. User-agent includes the session-token in the request.
2. Substrate looks up the session entity by session-id.
3. Substrate checks the session is still valid (current ordinal between `established-at-ordinal` and `valid-until-ordinal`).
4. Substrate checks the session hasn't been revoked.
5. Substrate evaluates the requested operation's capability requirements against the session's `session-capability` cell.
6. Per [governance-decision-modal-decidability](../../../theorems/governance-decision-modal-decidability.md), the authorization decision is a $\Box_R$ check that terminates in PSPACE.
7. If authorized, the operation proceeds with the session as the request's signing context.

## Session refresh

For long-lived sessions (typical for "stay signed in" UX), the substrate may refresh the session before expiry:

1. User-agent's request approaches `valid-until-ordinal`.
2. Substrate emits a refresh-required hint to the user-agent.
3. User-agent re-runs a *minimal* authentication-flow (often just signing a refresh-challenge with the same key).
4. Substrate admits a new session entity with extended validity, optionally retiring the old session.

Per [identity-key-custody](../../teaching/explanations/identity-key-custody.md), refresh discipline depends on whether the user-agent still has the signing key — for hardware-token flows, refresh requires user re-authorization; for in-browser keys, refresh can be silent.

## Session revocation

A session can be revoked before its natural expiry:

- *User-initiated.* "Sign out" — admit a `session-revoked:{session-id}` cell.
- *Account-administrator-initiated.* "Revoke all sessions" — admit `session-revoked:{session-id}` for every session of the account.
- *Substrate-policy-initiated.* Per [audit-content-via-inconsistency-sheaf-cohomology](../../../theorems/audit-content-via-inconsistency-sheaf-cohomology.md), suspicious activity (sudden geographic IP change, repeated authorization failures) may trigger automatic revocation.
- *Compromise-triggered.* Per [identity-key-custody](../../teaching/explanations/identity-key-custody.md), if the account's identity-key is reported compromised, all dependent sessions are revoked.

Revocation is a substrate cell admission; the next session-validation check sees the revocation and rejects the session.

## Multiple concurrent sessions

A user account may have multiple active sessions concurrently — phone, laptop, kiosk. Each is a distinct `user-session` cell with its own session-id, established-at-ordinal, and valid-until-ordinal. Per [scope-cover-via-grothendieck-site](../../../theorems/scope-cover-via-grothendieck-site.md), the sessions form a cover of the account's active-presence scope; the substrate can read "all current sessions of this account" as a cover query.

Cross-session coordination — "this device is currently typing" — is handled per [user-state-predications](user-state-predications.md).

## Position

Session establishment is the *transition between authentication and operation*. Per [authentication-flow](authentication-flow.md), the user-agent has proven identity; per this concept, the substrate has captured the proof as substrate content; per [authentication-as-modal-restriction](../theorems/authentication-as-modal-restriction.md), the resulting session's capabilities are structurally bounded.

The concept composes with [account](account.md) (the authenticated entity), with [authentication-flow](authentication-flow.md) (the verification ritual), with [session](../../agential-orchestration-platform/concepts/session.md) (the AOP session model the user-session is a particular kind of), and with [user-state-predications](user-state-predications.md) (the per-user state the session enables).
