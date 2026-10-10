---
type: concept
class: substrate-primitive
depends-on: [identity-key, identity-key-custody, signature-binds-witness-to-identity, substrate-accessibility-relation, modal-necessity-operator, predication-fiber-algebra, self-representation]
see-also: [principal-session, modal-restriction-as-substrate-authorization-primitive, account, agent, federation-graph, device-substrate]
---

# Principal

The substrate's *unifying notion of an authenticated actor that can hold capability and admit substrate content* — the abstract entity of which user [account](theories/interactive-application-platform/concepts/account.md), [agent](theories/agential-orchestration-platform/concepts/agent.md), federation peer (per [federation-graph](theories/agential-orchestration-platform/objects/federation-graph.md)), and [device-substrate](device-substrate.md) are particular kinds. In the substrate's hyperdoctrine setting, a principal is *an [identity-key](identity-key.md) holder whose capability fiber participates in the substrate's [accessibility relation](substrate-accessibility-relation.md)*. Per [modal-restriction-as-substrate-authorization-primitive](../theorems/modal-restriction-as-substrate-authorization-primitive.md), every principal's authority operates through the same $\Box_R$ modal calculus on the same $R$.

## Why this concept exists

[principal-session](principal-session.md) names the *session* (a principal's bounded interaction with the substrate). The principal *itself* — the unifying abstraction across user/agent/peer/device — wasn't named. The four kinds each have their own concept (account, agent, federation peer, device-substrate) but the structural commonalities — identity-key holder, capability fiber, accessibility-relation participant, witness-emitter — repeat across all four. Naming the principal makes the commonalities first-class and lets future principal-kinds inherit the discipline.

## Hyperdoctrinal grounding

A principal has the structure:

- **An [identity-key](identity-key.md)** held in [identity-key-custody](identity-key-custody.md). The principal's public key is substrate content; the private key is off-substrate per the custody discipline. Per [signature-binds-witness-to-identity](../theorems/signature-binds-witness-to-identity.md), the keypair is what makes the principal's substrate operations attributable.
- **An [identity-record](../objects/identity-record.md)** in the substrate. The record carries the public key, principal-kind, name, creation-time, and any kind-specific metadata. Per [hash-injectivity-under-canonical-form](../theorems/hash-injectivity-under-canonical-form.md), the record's canonical-form hash is the principal's stable identity.
- **A capability fiber** $u_p \in A_p$ in the substrate's [predication fiber-algebra](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fiber-algebra.md). The capabilities the principal holds — what predicates they can admit, what scopes they can act in, what work-types they can dispatch.
- **A world** $w_p \in W$ in the [substrate accessibility relation](substrate-accessibility-relation.md)'s world set. Per [substrate-accessibility-relation](substrate-accessibility-relation.md), other actors' accessibility *to* the principal lives in $R(w_*, w_p)$; the principal's own self-edges are $R(w_p, w_p)$.
- **A [principal-session](principal-session.md)** for each currently-active operating context. Per [authentication-as-modal-restriction](theories/interactive-application-platform/theorems/authentication-as-modal-restriction.md), each session's effective capability is $\Box_R u_p$ at the session's user-agent world.

## Principal kinds

The substrate's catalog of principal kinds — each instantiating the principal abstraction:

### User principal

A human user with an [account](theories/interactive-application-platform/concepts/account.md). Identity-key typically held in browser keystore, OS keychain, or hardware token (per [identity-key-custody](identity-key-custody.md)). Sessions are user-sessions (per [session-establishment](theories/interactive-application-platform/concepts/session-establishment.md)). Capability fiber is the user's account permissions plus any role grants.

### Agent principal

An LLM agent or automated process (per [agent](theories/agential-orchestration-platform/concepts/agent.md)). Identity-key held in the agent's runtime environment. Sessions are agent-sessions. Capability fiber is the agent's declared skill capabilities plus modal restrictions per [agent-self-queueing-bounded-by-modal-restriction](../theorems/agent-self-queueing-bounded-by-modal-restriction.md).

### Federation-peer principal

Another substrate, federated to this one (per [federation-graph](theories/agential-orchestration-platform/objects/federation-graph.md)). Identity-key is the peer substrate's bootstrap identity. Sessions are federation-sessions. Capability fiber is bilattice-graded trust per [federation-trust-bilattice-graded](../theorems/federation-trust-bilattice-graded.md).

### Device-substrate principal

A peripheral or embedded substrate (per [device-substrate](device-substrate.md)). Identity-key held in device-local secure storage. Sessions are device-sessions. Capability fiber is the device's declared sub-fibration per [device-substrate-restricted-conformance](../theorems/device-substrate-restricted-conformance.md).

### Substrate-self principal

The substrate itself, signing witnesses for its own operations (bootstrap-attestation, recovery-attestation, snapshot signing). Identity-key is the substrate's own bootstrap key per [bootstrap-content](bootstrap-content.md). Capability fiber is the substrate's "system" capabilities — typically broad but explicit, used for substrate-internal operations.

## Common discipline across all principals

Per [modal-restriction-as-substrate-authorization-primitive](../theorems/modal-restriction-as-substrate-authorization-primitive.md), every principal kind operates through the same $\Box_R$ modal calculus. Specifically:

- **Authentication** — proving identity is signing a challenge per [authentication-flow](theories/interactive-application-platform/concepts/authentication-flow.md). Uniform across kinds; only the user-agent / verifier varies.
- **Session establishment** — per [principal-session](principal-session.md), the session is the modal restriction $\Box_R u_p$ at the verified user-agent's world. Same machinery for all kinds.
- **Capability evaluation** — per [governance-decision-modal-decidability](../theorems/governance-decision-modal-decidability.md), every authorization check on the principal is a $\Box_R$ evaluation. Decidable in PSPACE for all kinds.
- **Witness signing** — per [signature-binds-witness-to-identity](../theorems/signature-binds-witness-to-identity.md), every substrate operation the principal performs produces a signed witness. Same crypto, same audit semantics, all kinds.
- **Self-queueing** (where applicable) — per [agent-self-queueing-bounded-by-modal-restriction](../theorems/agent-self-queueing-bounded-by-modal-restriction.md), principals capable of self-queueing work do so within their modal restriction. Same bounded-autonomy discipline for any kind.

## Cross-principal-kind authority chains

Per [modal-restriction-as-substrate-authorization-primitive](../theorems/modal-restriction-as-substrate-authorization-primitive.md), authority composes across principal kinds: a user delegates to an agent, the agent delegates to a federation peer, the peer dispatches to a device-substrate. Each step is $\Box_R$ on the previous principal's capability — non-amplifying per [capability-non-amplification](theories/functional-runtime-platform/theorems/capability-non-amplification.md). The end of the chain is bounded above (in knowledge order) by the weakest principal in the chain.

This is the substrate's structural answer to "permission flows through actors": the chain is a $\Box_R$ composition, not a runtime delegation token. The receiving principal's capability is determined by the chain, not asserted by the sender.

## Principal lifecycle

Each principal:

1. **Is born** when its identity-record is admitted to the substrate (per [bootstrap-content](bootstrap-content.md) for substrate-self; per governance for users/agents/peers/devices).
2. **Operates** through sessions established via authentication-flow.
3. **Rotates keys** per [identity-key-custody](identity-key-custody.md) when needed.
4. **May be revoked** when compromised or retired — the identity-record's accessibility cells move to $\mathbf{f}$, all dependent sessions collapse.

Per [witness-chain-as-proof-object](../theorems/witness-chain-as-proof-object.md), the principal's lifecycle is fully recorded.

## What the discipline rules out

- **Per-principal-kind authentication mechanisms.** A substrate that has separate authentication-flow logic for users vs agents vs peers vs devices is implementing the same modal-restriction discipline four times. Per the unification, one authentication mechanism with kind-specific verifiers suffices.
- **Principals without identity-keys.** A principal that doesn't have an identity-key cannot sign witnesses — its substrate operations are unattributable. Per [signature-binds-witness-to-identity](../theorems/signature-binds-witness-to-identity.md), every principal must have a key.
- **Principals whose authority bypasses $\Box_R$.** A principal granted authority outside the modal calculus is operating off-substrate. Per [modal-restriction-as-substrate-authorization-primitive](../theorems/modal-restriction-as-substrate-authorization-primitive.md), the calculus is the substrate's only authorization primitive.
- **Implicit principals.** A "principal" whose existence is only in runtime memory (not substrate-recorded) is invisible to audit, federation, and replay. Per [self-representation](self-representation.md), every principal has a substrate-content identity-record.

## Position

Principal is the substrate's *unifying-actor primitive*. Per [principal-session](principal-session.md), each principal's interactions are sessions; per [substrate-accessibility-relation](substrate-accessibility-relation.md), each principal lives in $R$'s world set; per [modal-restriction-as-substrate-authorization-primitive](../theorems/modal-restriction-as-substrate-authorization-primitive.md), every principal's authority operates through the same $\Box_R$ calculus.

The concept composes with [account](theories/interactive-application-platform/concepts/account.md), [agent](theories/agential-orchestration-platform/concepts/agent.md), [federation-graph](theories/agential-orchestration-platform/objects/federation-graph.md), [device-substrate](device-substrate.md), [identity-key](identity-key.md), [identity-key-custody](identity-key-custody.md), [principal-session](principal-session.md), and the modal-authorization theorems that ground each principal kind.
