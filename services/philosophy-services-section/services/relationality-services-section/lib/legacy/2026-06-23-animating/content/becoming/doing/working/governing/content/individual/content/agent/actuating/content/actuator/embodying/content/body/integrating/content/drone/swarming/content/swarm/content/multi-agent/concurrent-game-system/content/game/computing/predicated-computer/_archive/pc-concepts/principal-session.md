---
type: concept
class: session-discipline
depends-on: [substrate-accessibility-relation, modal-necessity-operator, signature-binds-witness-to-identity, identity-key, predication-fiber-algebra, time-and-event-ordinals]
see-also: [session, session-establishment, authentication-as-modal-restriction, agent-self-queueing-bounded-by-modal-restriction, modal-restriction-as-substrate-authorization-primitive]
---

# Principal session

The substrate's *abstract notion of an authenticated principal's bounded interaction with the substrate* — the unified concept of which user-sessions and agent-sessions are particular instances. In the substrate's hyperdoctrine setting, a principal session is *an authenticated [identity-key](identity-key.md) holder's [Box_R](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/modal-necessity-operator.md)-restricted operating context for a bounded time-window*. Per [modal-restriction-as-substrate-authorization-primitive](../theorems/modal-restriction-as-substrate-authorization-primitive.md), the modal-restriction discipline that bounds session capability is the same for any principal — user, agent, federation-peer, device-substrate.

## Why this concept exists

PredComp has [session](theories/agential-orchestration-platform/concepts/session.md) (AOP, agent-bounded interaction) and [session-establishment](theories/interactive-application-platform/concepts/session-establishment.md) (IAP, user-bounded interaction). These are structurally identical: both are authenticated-principal-bounded, time-bounded, capability-restricted, witness-emitting interactions. Defining each separately means the shared discipline is implicit; defining the shared discipline once and instantiating it makes the structure explicit.

This concept names the shared discipline. User-sessions and agent-sessions are particular *kinds* of principal-session; future principal-kinds (a federation-peer's session in another substrate, a device-substrate's session for status-reporting) inherit the same discipline.

## Hyperdoctrinal grounding

A principal session has the structure:

- **A principal** — the authenticated entity. Per [substrate-accessibility-relation](substrate-accessibility-relation.md), the principal has a world $w_\mathrm{principal}$ in $W$. Per [identity-key-custody](identity-key-custody.md), the principal holds a private key whose public counterpart is in the substrate's identity-record.
- **A session-bound user-agent** — the device, process, or interface the principal is currently using. Per [substrate-accessibility-relation](substrate-accessibility-relation.md), the user-agent has its own world $w_\mathrm{ua}$, and the session is established when $R(w_\mathrm{principal}, w_\mathrm{ua})$ transitions from $\bot$ to a verified value via signature.
- **A modal-restricted capability** — per [modal-restriction-as-substrate-authorization-primitive](../theorems/modal-restriction-as-substrate-authorization-primitive.md), the session's effective capability is $\Box_R$ on the principal's underlying capability fiber, evaluated at $w_\mathrm{ua}$. Strong authentication produces a $\mathbf{t}$-grade $R$ cell and full-capability sessions; weaker authentication produces graded sessions.
- **A time-window** — a `valid-from-ordinal` and `valid-until-ordinal` bounding when the session is operative. Outside the window, the session's accessibility cell is $\bot$ or $\mathbf{f}$ (depending on whether expired or revoked).
- **A witness chain** — every operation performed under the session emits a witness signed by the session's key per [signature-binds-witness-to-identity](../theorems/signature-binds-witness-to-identity.md). Per [witness-chain-as-proof-object](../theorems/witness-chain-as-proof-object.md), the chain is the substrate's audit record for the session's activity.

## Principal kinds

The substrate's catalog of principal kinds (each instantiating principal-session):

### User principal — user-session

Per [session-establishment](theories/interactive-application-platform/concepts/session-establishment.md):
- *Principal*: a user [account](theories/interactive-application-platform/concepts/account.md).
- *User-agent*: a browser, native app, or hardware token holding the user's identity-key.
- *Capability*: per [authentication-as-modal-restriction](theories/interactive-application-platform/theorems/authentication-as-modal-restriction.md), the modal restriction of the account's capability via the authentication-method's strength.
- *Time-window*: typically hours-to-days; refreshed via re-authentication.

### Agent principal — agent-session

Per [session](theories/agential-orchestration-platform/concepts/session.md):
- *Principal*: an [agent](theories/agential-orchestration-platform/concepts/agent.md).
- *User-agent*: the agent's runtime context (the LLM's API connection, the local-process boundary, the runbook-execution context).
- *Capability*: per [agent-self-queueing-bounded-by-modal-restriction](../theorems/agent-self-queueing-bounded-by-modal-restriction.md), the agent's modal-restricted capability bounding self-queued work.
- *Time-window*: the agent's bounded operating period (a runbook's duration, an inbox-message-handling session).

### Federation-peer principal — federation-session

Per [federation-trust-bilattice-graded](../theorems/federation-trust-bilattice-graded.md):
- *Principal*: a peer substrate's identity-record.
- *User-agent*: the federation transport endpoint at the peer.
- *Capability*: per [federation-trust-bilattice-graded](../theorems/federation-trust-bilattice-graded.md), bilattice-graded trust producing a graded session.
- *Time-window*: typically long-lived, bounded by federation-handshake refresh rate.

### Device-substrate principal — device-session

Per [device-substrate](device-substrate.md) and [device-substrate-restricted-conformance](../theorems/device-substrate-restricted-conformance.md):
- *Principal*: a device-substrate's identity-record.
- *User-agent*: the device's network interface.
- *Capability*: bounded by both modal-restriction *and* the device's declared sub-fibration (per [device-substrate-restricted-conformance](../theorems/device-substrate-restricted-conformance.md)).
- *Time-window*: typically duration-of-online; sessions reestablish on reconnection.

## Session-content predications

Each principal-session is a substrate cell with the following predications (specialized per kind):

```json
{
  "kind": "principal-session",
  "session-id": "<canonical hash>",
  "principal-kind": "user | agent | federation-peer | device-substrate",
  "principal-hash": "<the principal's identity-record hash>",
  "user-agent-hash": "<the user-agent's identity hash>",
  "established-at-ordinal": <substrate ordinal>,
  "valid-from-ordinal": <substrate ordinal>,
  "valid-until-ordinal": <substrate ordinal | null>,
  "authentication-method-used": "<method-record-hash>",
  "authentication-strength": "<strong | medium | weak>",
  "session-capability": [<capability-hash>, ...],
  "session-revoked-at-ordinal": <substrate ordinal | null>,
  ...principal-kind-specific fields...
}
```

Per [hash-injectivity-under-canonical-form](../theorems/hash-injectivity-under-canonical-form.md), the session-id is the canonical-form hash. Per [signature-binds-witness-to-identity](../theorems/signature-binds-witness-to-identity.md), the session is signed by the substrate's identity-key (recording the substrate's attestation that the session was authentically established).

## Capability composition across principal kinds

Different principal kinds have different underlying capability fibers, but the modal-restriction discipline is the same. A user can act through an agent that acts through a federation peer that acts through a device-substrate — a chain of principal-sessions, each a $\Box_R$ application on the previous. Per [capability-non-amplification](theories/functional-runtime-platform/theorems/capability-non-amplification.md), the chain is structurally non-amplifying.

This is why the user-agent-led-by-LLM-agent-acting-on-federation-peer-via-device-substrate composition is structurally well-defined: each step in the chain is a principal-session with its own $\Box_R$, and the cumulative capability across the chain is the composed $\Box_R$, bounded above by the weakest principal in the chain.

## Lifecycle uniformity

All principal-sessions follow the same lifecycle:

1. **Establishment** — verified identity-signature, accessibility cell transitions to $\mathbf{t}$, session cell admitted.
2. **Operation** — the session's signing key is used to sign witnesses for substrate operations the principal performs.
3. **Validation per operation** — every operation under the session re-evaluates $\Box_R$ at the user-agent's world, deciding whether the operation is authorized.
4. **Refresh** — the session may extend its `valid-until-ordinal` via lightweight re-authentication (a refresh-flow per [authentication-flow](theories/interactive-application-platform/concepts/authentication-flow.md)).
5. **Revocation** — explicit or automatic revocation moves the accessibility cell to $\mathbf{f}$, ending the session.
6. **Expiry** — `valid-until-ordinal` passes; the session's accessibility cell becomes $\bot$ at the expiry ordinal.

Per [witness-chain-as-proof-object](../theorems/witness-chain-as-proof-object.md), the lifecycle events produce witnesses; an auditor can replay the session's full history.

## What the discipline rules out

- **Per-principal-kind authorization machinery.** A substrate that has separate authorization logic for users, agents, federation-peers, and devices is implementing the same modal calculus six times. Per [modal-restriction-as-substrate-authorization-primitive](../theorems/modal-restriction-as-substrate-authorization-primitive.md), the calculus is one phenomenon; the surfaces are kind-specific instantiations.
- **Sessions without modal restriction.** A "session" that grants the principal the principal's full underlying capability (no $\Box_R$) is bypassing the substrate's discipline. Per the principal-session structure, the modal restriction is mandatory.
- **Cross-principal-kind capability transfer.** A user-session that "becomes" an agent-session by changing kind in place violates the structural discipline — the principal kind is part of the session's identity. Per [hash-injectivity-under-canonical-form](../theorems/hash-injectivity-under-canonical-form.md), changing the kind changes the session-id, producing a different session.
- **Sessions without lifecycle witnesses.** A session that doesn't witness establishment, operation, or revocation has lost the audit chain. Per [witness-chain-as-proof-object](../theorems/witness-chain-as-proof-object.md), every lifecycle event is auditable.

## Position

Principal-session is the substrate's *unified session primitive*. Per [substrate-accessibility-relation](substrate-accessibility-relation.md), the modal-restriction discipline operates on the substrate's single $R$; per [modal-restriction-as-substrate-authorization-primitive](../theorems/modal-restriction-as-substrate-authorization-primitive.md), the discipline is one phenomenon at multiple surfaces; per this concept, the principal-session is the *structural unit* of authenticated-principal-bounded interaction across all surfaces.

The concept composes with [session](theories/agential-orchestration-platform/concepts/session.md) (the AOP instance), [session-establishment](theories/interactive-application-platform/concepts/session-establishment.md) (the IAP instance), [federation-trust-bilattice-graded](../theorems/federation-trust-bilattice-graded.md) (the federation-session instance), [device-substrate](device-substrate.md) (the device-session instance), and the modal-restriction theorems that ground each instance.
