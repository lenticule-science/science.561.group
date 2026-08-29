---
title: "Network algebraic contract"
description: "One-page algebraic contract every wire-level network spec must conform to. The substrate-side $\\Box_R$ surface, the quantale-graded rate envelope, the regime-meet at handshake. So implementers writing wire formats inherit the discipline without reverse-engineering it from five separate decisions."
kind: spec
status: draft
version: "0.2b-draft"
---

# Network algebraic contract

Every wire-level spec under [`specs/network/`](_index.md) — present (`federation-protocol.md`, `http-addressing.md`) and v0.2b/v0.3/v0.4/v0.5 to-be-written (TCP, WebSocket, HTTP/2, SMTP, IMAP, CalDAV, Matrix CS/S2S, ActivityPub, MQTT, Modbus) — conforms to **one algebraic contract**.
The contract is the substrate's invariants restricted to the network sub-region; protocols differ in their wire format, never in the algebra.

This is a one-pager by design: the contract is short.
The wire-format specs are long; their conformance to this contract is what makes them substrate-resident rather than substrate-adjacent.

## Grounded in

- [`predicated-computing/theorems/modal-restriction-as-substrate-authorization-primitive`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/modal-restriction-as-substrate-authorization-primitive.md) — the network surface is one of the six $\Box_R$ surfaces; every wire admit/reject is a $\Box_R$ evaluation on the network sub-region of the accessibility relation.
- [`predicated-computing/theorems/federation-path-metrics-multiplicative`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/federation-path-metrics-multiplicative.md) — network-cost composition along a multi-hop path is the quantale's $\otimes$; per-hop rate envelopes compose by the same quantale.
- [`predicated-computing/theorems/regime-classification-for-substrate`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/regime-classification-for-substrate.md) and the four per-regime envelope theorems — the regime-meet at handshake is the algebraic operation that determines which envelope applies to the joint session.
- [`predicated-computing/theorems/federation-trust-bilattice-graded`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/federation-trust-bilattice-graded.md) — peer trust is a bilattice grade on the $\Box_R$ accessibility region; admit/reject decisions consume the grade.
- [decisions/authorization-is-modal-restriction](../../decisions/authorization-is-modal-restriction.md), [decisions/cost-is-lawvere-quantale](../../decisions/cost-is-lawvere-quantale.md), [decisions/regime-classification-is-load-bearing](../../decisions/regime-classification-is-load-bearing.md), [decisions/federation-by-construction](../../decisions/federation-by-construction.md), [decisions/network-spec-defer-until-implementer-named](../../decisions/network-spec-defer-until-implementer-named.md).
- Placeholder theorem `network-as-monoidal-functor.md` (named, not yet authored).

## 1. The three invariants

A conforming wire spec satisfies three invariants.
They are not negotiable; a wire spec that drops one is not a substrate-resident network protocol.

### 1.1. The $\Box_R$ surface

Every admit/reject decision on a wire boundary is a $\Box_R$ evaluation on the *network sub-region* of the substrate's accessibility relation $R$.
Concretely:

- **Inbound admit:** for an event arriving on connection $c$ from peer $p$, the substrate evaluates $\Box_R^{\mathrm{net}}(\mathrm{admit}(c, p, \mathrm{event}))$.
  The accessibility region $R^{\mathrm{net}}$ is determined by `(peer:<p>, network-trust, *)` cells plus the local `(boundary:<b>, scope-restriction, *)` cells.
- **Outbound emit:** for an outbound event $e$ on connection $c$ to peer $p$, the substrate evaluates $\Box_R^{\mathrm{net}}(\mathrm{emit}(c, p, e))$ on the same sub-region with the dual orientation.
- **Witness:** every $\Box_R^{\mathrm{net}}$ evaluation produces a witness per [`security/signing-and-witnessing.md`](../security/signing-and-witnessing.md).
  On reject the witness is a `network-admit-denial` (lifecycle per [`_patterns/witness-lifecycle.md`](../_patterns/witness-lifecycle.md), class instance `capability-denial`).

Consequences for wire specs:

- A wire spec MUST NOT introduce its own admit/reject layer.
  The substrate's $\Box_R^{\mathrm{net}}$ evaluator is the *only* admission gate.
- A wire spec MUST cite the predicate vocabulary it uses for the network sub-region (e.g., `network-trust`, `peer-scope`, `protocol-version-floor`).
- A wire spec MUST emit witnesses on every reject.
  No silent drops.

### 1.2. The quantale-graded rate envelope

Every wire spec inherits one rate envelope from the host substrate's quantale per [decisions/cost-is-lawvere-quantale](../../decisions/cost-is-lawvere-quantale.md).
Concretely:

- The per-connection budget is a quantale element $r_c \in \mathcal{V}$.
  Under the v0.2 default $\mathcal{V} = ([0, \infty], +, \min)$, $r_c$ is an upper bound on the cost composed over events delivered on $c$ in a sliding window.
- The per-peer budget is a quantale element $r_p$ aggregating across all connections to $p$.
  The fold is the quantale's $\otimes$.
- The cross-hop fold for a multi-hop relay is again the quantale's $\otimes$ per [`federation-path-metrics-multiplicative`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/federation-path-metrics-multiplicative.md).
  A wire spec for a relayable protocol (Matrix S2S, ActivityPub, federation-protocol) MUST forecast the multi-hop fold *before* admit, not at consume time.
- Reads are free per [`cost-discipline-reads-free`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/cost-discipline-reads-free.md).
  A wire spec for a read-only surface (e.g., `GET /federation/peer/<id>` for status) consumes the quantale unit; only writes contribute positive cost.

Consequences for wire specs:

- A wire spec MUST NOT introduce its own rate-limiter.
  The substrate's quantale composition is the only rate envelope; wire-spec-side rate-limiting is duplicate state.
- Per-connection / per-peer budget cells live in `(peer:<p>, network-budget, <window>) = <quantale-element>`.
  Wire specs cite this predicate.
- Exceeding the envelope produces a `fuel-exceeded` witness on the network sub-region (lifecycle per [`_patterns/witness-lifecycle.md`](../_patterns/witness-lifecycle.md)).

### 1.3. The regime-meet at handshake

When two peers establish a connection, each declares its regime per [decisions/regime-classification-is-load-bearing](../../decisions/regime-classification-is-load-bearing.md).
The connection's effective regime is the **meet** $\sqcap$ of the two declared regimes under the regime lattice $\mathrm{strict} \le \mathrm{Scott\text{-}continuous} \le \mathrm{transfinite\text{-}bounded} \le \mathrm{aperiodic}$ per [`process/multi-regime-session.md`](../process/multi-regime-session.md) §1.
The meet is the *weaker / more restrictive* envelope — the only one that holds across both peers (e.g., `strict ⊓ transfinite-bounded = strict`; `strict ⊓ aperiodic = strict`).
The lattice is a total chain, so the meet is always defined; what fails is not the meet itself but the **scope at which both peers can settle under that meet**.

Consequences for wire specs:

- A wire-spec handshake MUST exchange `regime-record` declarations (or cite the substrate's default for protocols where regime declaration is implicit, e.g., HTTP/1.1 reads are strict by construction).
- The connection's effective regime is computed as the meet of the two declarations; the meet is always defined by totality of the chain.
- A wire spec for a federated protocol MUST agree on a **scope prefix** within which the meet is enforceable per [`process/multi-regime-session.md`](../process/multi-regime-session.md) §4 and [decisions/regime-classification-is-load-bearing](../../decisions/regime-classification-is-load-bearing.md) §"What it rules out".
  Beyond the agreed prefix, federation messages are rejected with `PCC_FEDERATION_REGIME_MISMATCH`.
  Scope expansions inside an established session that would demote the session's regime are rejected with `PCC_SESSION_REGIME_SCOPE_VIOLATION`.
- The per-tick fuel envelope on the connection is the envelope of the meet (the weaker / more-restrictive envelope).
- Per [`process/multi-regime-session.md`](../process/multi-regime-session.md) §2: audit cohomology under the meet is $H^0$-only across regime boundaries; federation shipping is endpoint-state-only; snapshots are endpoint-only.

## 2. The contract restated, summarised

| Invariant | Surface | Theorem |
|---|---|---|
| One $\Box_R^{\mathrm{net}}$ evaluator per admit/reject | network accessibility sub-region | [`modal-restriction-as-substrate-authorization-primitive`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/modal-restriction-as-substrate-authorization-primitive.md) |
| One quantale-graded rate envelope, composed across hops | per-connection / per-peer / multi-hop fold | [`federation-path-metrics-multiplicative`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/federation-path-metrics-multiplicative.md) |
| Regime-meet at handshake; strict envelope on the meet | connection effective regime | [`regime-classification-for-substrate`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/regime-classification-for-substrate.md) + the four per-regime envelope theorems |

## 3. What this contract is NOT

It is not a wire format.
It does not specify packet layouts, framing, headers, codes, or transport details.
Those live in the per-protocol specs (federation-protocol.md, smtp.md, matrix-cs-api.md, …) and cite the public RFC/W3C/vendor spec.

It is not a security policy.
The $\Box_R$ surface is the algebra; the predicates that populate the accessibility region (`network-trust`, `peer-scope`, …) are governance-set per [`security/federation-trust.md`](../security/federation-trust.md).

It is not a v0.2b implementation. v0.2b ships the wire-format stubs ([decisions/network-spec-defer-until-implementer-named](../../decisions/network-spec-defer-until-implementer-named.md)); each stub cites this contract.

## 4. Conformance gates

A wire spec is conformant when:

1. It cites this spec by reference and identifies which predicates from the network sub-region it uses.
2. It does not introduce a parallel admit/reject layer; all admit/reject is delegated to $\Box_R^{\mathrm{net}}$.
3. It does not introduce a parallel rate-limiter; all rate envelopes are quantale composition on substrate budget cells.
4. Its handshake (where the protocol has one) exchanges regime declarations and computes the meet (always defined on the total chain).
  It agrees a scope prefix within which the meet is enforceable per [`process/multi-regime-session.md`](../process/multi-regime-session.md) §4 and rejects messages outside the agreed prefix with `PCC_FEDERATION_REGIME_MISMATCH`; mid-session scope-expansions that would demote the session's regime are rejected with `PCC_SESSION_REGIME_SCOPE_VIOLATION`.
5. Reads on its surface are quantale-unit; writes contribute positive cost.
6. Every reject path emits a witness; the witness uses [`_patterns/witness-lifecycle.md`](../_patterns/witness-lifecycle.md) lifecycle.

## 5. Cross-references

- [`network/federation-protocol.md`](federation-protocol.md) — the v0.1 wire spec that this contract abstracts; cites this contract retroactively when v0.2b lands.
- [`network/_index.md`](_index.md) — the directory index; the v0.2b/v0.3/v0.4/v0.5 stub list each cite this contract on first authoring.
- [`security/federation-trust.md`](../security/federation-trust.md) — the governance side: how the network sub-region's predicates are populated.
- [`_patterns/witness-lifecycle.md`](../_patterns/witness-lifecycle.md) — the witness-lifecycle pattern this contract requires for reject witnesses.
- [`process/multi-regime-session.md`](../process/multi-regime-session.md) §2 — the regime-meet computation invoked at handshake.
