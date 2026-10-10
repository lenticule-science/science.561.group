---
title: "Multi-regime session crossing"
description: "A session whose closure-rule scope crosses between substrates of different regimes (strict / Scott-continuous / transfinite-bounded / aperiodic) must declare its operating regime as the meet of its scopes' regimes. Cross-regime respond rejects without scope coercion."
kind: spec
status: normative
version: "0.2"
---


A `Session` ([`process/session-as-process.md`](session-as-process.md)) executes `respond` invocations against one or more entities.
In v0.2, every entity belongs to one substrate, and every substrate ships in exactly one regime per [decisions/regime-classification-is-load-bearing](../../decisions/regime-classification-is-load-bearing.md). v0.4+ federation introduces sessions whose `respond` scope crosses substrates of *different* regimes — for instance, a strict local substrate federating with a transfinite-bounded peer.

This spec records the discipline a multi-regime session must honour.
The base case (single-regime session, the v0.2 default) inherits the substrate's regime trivially; this spec adds the cross-regime case.

## Grounded in

- [`predicated-computing/theorems/regime-classification-for-substrate`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/regime-classification-for-substrate.md) — a substrate is in exactly one of four regimes; classification is exclusive and exhaustive.
- The four per-regime engineering envelope theorems ([strict](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/strict-regime-engineering-envelope.md), [Scott-continuous](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/scott-continuous-regime-engineering-envelope.md), [transfinite-bounded](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/transfinite-bounded-regime-engineering-envelope.md), [aperiodic](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/aperiodic-regime-engineering-envelope.md)) — each regime forces a distinct fuel envelope, audit discipline, federation discipline, and snapshot discipline.
- [`predication-categories/theorems/four-regime-dichotomy`](../../../../../../../../theories/humanities/theories/math/theories/categories/theories/predication-categories/theorems/four-regime-dichotomy.md) — the underlying math result (closure ordinal partitions substrates into four classes).
- [decisions/regime-classification-is-load-bearing](../../decisions/regime-classification-is-load-bearing.md) — the v0.2 commitment: misdeclared regimes are non-conformant; cross-regime federation must scope to a compatible prefix.
- [decisions/federation-by-construction](../../decisions/federation-by-construction.md) — federation merges are `respond` with `sender = peer:*`; the same algebra runs whether the source is local or peer.

## 1. Regime ordering on substrates

The four regimes admit a partial order by their engineering envelope's strength:

$$ \mathrm{strict} \;\le\; \mathrm{scott\text{-}continuous} \;\le\; \mathrm{transfinite\text{-}bounded} \;\le\; \mathrm{aperiodic} $$

This is the closure-ordinal containment order: every strict substrate is *also* Scott-continuous (with $\kappa = 1 < \omega$), every Scott-continuous substrate is *also* transfinite-bounded (with $\kappa = \omega$), etc. The reverse direction does not hold: a transfinite-bounded substrate is not in general Scott-continuous.

The order has a **meet** $\sqcap$ (the weaker of two regimes).
The session's effective regime is the meet of every entity's substrate regime in the session's scope:

$$ R_\mathrm{session} \;=\; \bigsqcap_{e \in \mathrm{scope}(S)} R_{\mathrm{substrate}(e)}. $$

A session that respond-touches a strict substrate and a transfinite-bounded substrate has $R_\mathrm{session} = \mathrm{strict}$ — the weaker envelope is the only one that holds across both.

## 2. The session's effective discipline

Per the per-regime engineering envelope theorems, the session inherits the *most restrictive* discipline along each axis:

| Axis | Multi-regime session inherits |
|---|---|
| **Engine fuel** | Finite per-cascade (the meet's envelope). |
| **Audit cohomology** | $H^0$-only; $H^1$ is *not* enumerable across substrates of differing regimes. |
| **Federation shipping** | Endpoint state. Trajectory shipping is meaningless across a regime boundary. |
| **Snapshot policy** | Endpoint-only. |

A session respond that would *escalate* the regime — for example, a closure rule with $\forall$-block over an infinite peer set — is rejected with `PCC_REGIME_MISMATCH` per [`regime.py`](../../../../src/substrate/regime.py).
The substrate refuses to silently downgrade audit fidelity.

## 3. Detection at session-open

[`process/session-as-process.md`](session-as-process.md) §"Session open" already binds a session to its capability fiber and authoring boundary. v0.4 extends session-open to bind the session to its **operating regime**:

1. Compute the session's declared scope (entity slugs, peer ids, federation prefixes the session intends to touch).
2. For each scope element, look up the substrate's `regime-record`.
3. Compute $R_\mathrm{session} = \sqcap R_i$ via the partial order in §1.
4. Persist `(session, operating-regime, R_session) = t` as a session-fiber predicate.
5. Every `respond` on this session reads the session's operating regime and configures its engine, audit, federation, snapshot disciplines accordingly.

If a respond's *actual* scope expands beyond the declared scope (e.g., a closure-rule firing reaches into a peer not in the session's declared scope), surface `PCC_SESSION_REGIME_SCOPE_VIOLATION` and refuse the firing.
The substrate will not silently *demote* the session's regime mid-respond.

## 4. Federation interaction

Per [decisions/regime-classification-is-load-bearing](../../decisions/regime-classification-is-load-bearing.md) §"What it rules out": cross-regime federation must scope to a compatible prefix.
This spec gives the *session* discipline; the federation handshake (v0.4 [`network/federation-protocol.md`](../network/federation-protocol.md)) gives the wire shape.

The two cohere: a session whose federation peer is transfinite-bounded but whose local substrate is strict will, at federation handshake time, agree on a Scott-continuous prefix — and the session's operating regime is `strict ⊓ scott-continuous = strict`.
Beyond the prefix, federation messages are rejected with `PCC_FEDERATION_REGIME_MISMATCH`.

## 5. Conformance gates

A conforming implementation:

1. Computes $R_\mathrm{session}$ at session-open via the §3 procedure and persists it as a session-fiber predicate.
2. Configures every respond on the session per the §2 discipline table — fuel envelope, audit cohomology routine, federation shipping, snapshot policy — to match $R_\mathrm{session}$.
3. Surfaces `PCC_SESSION_REGIME_SCOPE_VIOLATION` when a closure-rule firing would expand the session's scope beyond its declared regime.
4. Refuses regime-escalating closure rules with `PCC_REGIME_MISMATCH`.
5. Honours the federation discipline at the session boundary: a multi-regime session's federation interactions are scoped to the meet's envelope.

## 6. v0.2 default

In v0.2 every substrate is strict by default and there is no federation.
The session-open procedure trivially computes $R_\mathrm{session} = \mathrm{strict}$ and the §2 discipline is the strict envelope.
The full multi-regime mechanism activates at v0.4 (federation) and v0.5 (transfinite-bounded ICS deployments per [decisions/regime-classification-is-load-bearing](../../decisions/regime-classification-is-load-bearing.md) — sensor-rate closure rules with $\forall$-blocks may push the regime).

This spec is written now so that the v0.4 and v0.5 sessions inherit a defined discipline rather than negotiating regime semantics ad-hoc at federation time.

## 7. Cross-references

- [`session-as-process.md`](session-as-process.md) — the base session lifecycle.
- [`inter-session-messaging.md`](inter-session-messaging.md) — typed messages between sessions; same discipline applies (a message between sessions of different regimes carries the meet's envelope).
- [`fuel-composition.md`](../kernel/fuel-composition.md) — the per-respond fuel envelope inherited from $R_\mathrm{session}$.
- [`inconsistency-repair.md`](../kernel/inconsistency-repair.md) — the session's audit cohomology routine is regime-determined.
- [`src/substrate/regime.py`](../../../../src/substrate/regime.py) — implementation of `RegimeRecord`, `derive_regime`, `_ordinal_in_range`.
