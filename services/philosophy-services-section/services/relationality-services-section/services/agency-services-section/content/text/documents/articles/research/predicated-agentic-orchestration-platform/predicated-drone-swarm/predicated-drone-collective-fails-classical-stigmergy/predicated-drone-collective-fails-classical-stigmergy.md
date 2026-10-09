---
type: theorem
status: sketch
class: regime-classification
depends-on: [embodied-handedness, physical-precondition, settling-cobordism-category]
see-also: [llm-swarms-fail-classical-conditions, stigmergy-decouples-coordination-cost, six-way-intersection-composition]
proof-target: subsequent-session
title: Predicated drone collective fails classical stigmergy
description: The predicated analogue of the swarm-intelligence theorem llm-swarms-fail-classical-conditions.
---

# Predicated drone collective fails classical stigmergy

The predicated analogue of the swarm-intelligence theorem [llm-swarms-fail-classical-conditions](../../../../../artificial-intelligence/theories/swarm-intelligence/theorems/llm-swarms-fail-classical-conditions.md).
Whereas LLM collectives fail the classical stigmergy convergence conditions because they violate *local determinism*, predicated drone collectives fail the classical conditions because they violate **symmetric handedness**: drones are receive-mostly with periodic state-broadcast, sensor reads are partial-observability, and physical actuation is precondition-bounded — none of these meet the classical stigmergy assumption that all participants exchange comparable signals symmetrically.

## Statement

**Theorem.** *Let $\mathcal{D}$ be a predicated drone collective: a finite set of embodied participants $\{d_1, \ldots, d_n\}$ with [embodied-handedness](../embodied-handedness/embodied-handedness.md) coordinates $h(d_i) = (\mathrm{recv}_i, \mathrm{send}_i, \mathrm{actuate}_i, \mathrm{observe}_i)$.
Let $\mathcal{S}$ denote the classical-stigmergy convergence conditions (uniform reciprocal signal exchange, symmetric local-state observation, time-invariant interaction graph).
Then:*

1. *(Asymmetry.)
  For embodied participants with $h(d_i) \neq h(d_j)$ for some $i, j$, the collective $\mathcal{D}$ fails $\mathcal{S}$ — specifically, fails the uniform-reciprocal-signal-exchange condition, since $d_i$'s send-handedness and $d_j$'s receive-handedness are unequal in general.*

2. *(Substrate compatibility despite failure.)
  Although $\mathcal{D}$ fails classical stigmergy, the substrate-side cell-update sub-layer satisfies the structural-stigmergy version per [stigmergy-as-substrate-feedback-channel](../../../../../../../../../tools/platform/pyfars/questions/stigmergy-decouples-coordination-cost.md): cell-merge under the substrate's bilattice valuation is a stigmergic-update step that converges to fixed point under closure-2-monad lax-idempotence regardless of the embodied participants' handedness asymmetry.*

3. *(Layered control implication.)
  The asymmetry-induced failure of classical stigmergy at the embodied layer requires a substrate-side coordination layer to mediate.
  This is the substrate-as-supervisor-of-layered-control commitment — PyFARS's three-layer architecture is the substrate-algebraic answer to this failure.*

## Why this matters

Classical multi-agent control theorems (consensus, formation, flocking) depend on stigmergy-style assumptions.
A drone collective that fails classical stigmergy cannot rely on those theorems' guarantees directly.
The theorem establishes that predicated drone collectives need the substrate-coordination layer; without it, embodied participants drift apart under handedness asymmetry alone.

## Proof sketch

Direct from the [`embodied-handedness`](../embodied-handedness/embodied-handedness.md) concept's definition: handedness is a four-tuple $(\mathrm{recv}, \mathrm{send}, \mathrm{actuate}, \mathrm{observe})$ where each coordinate is a participant-specific bandwidth/rate/access predicate.
The classical-stigmergy uniform-reciprocal-exchange condition requires $\mathrm{recv}_i = \mathrm{send}_j$ for all $(i, j)$ pairs and $\mathrm{actuate}_i$ symmetric across participants.
Drones with heterogeneous airframes, sensors, and bandwidth budgets fail this; the failure is structural, not a tuning issue.

Part (2) follows from the [closure 2-monad lax-idempotence](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/closure-2-monad-lax-idempotence.md) — the substrate's cell-update converges regardless of which participant emitted the update.

Part (3) is the engineering consequence: the substrate-coordination layer carries what classical stigmergy would have provided, and is the necessary structural element for an embodied-collective polity. ∎-sketch

## Position

Foundational regime classification for the sub-theory.
The theorem establishes that drone collectives require substrate-mediated coordination, which justifies the existence of the three-layer architecture and the [meaningful-human-control](../meaningful-human-control/meaningful-human-control-as-charter-c3-extension/meaningful-human-control-as-charter-c3-extension.md) charter-tier discipline as substrate-resident features.

## Open

- Quantitative bound on how much handedness asymmetry the substrate-coordination layer can absorb before scaling breaks.
  Conjectured: bounded by the [coordination-across-handedness theorem](../embodied-handedness/coordination-across-handedness-asymmetric-participants/coordination-across-handedness-asymmetric-participants.md)'s cohomology bound.
- Whether the failure of classical stigmergy implies failure of *all* classical convergence guarantees, or only the stigmergy-dependent ones.
  Likely the latter; consensus-on-graphs (with unequal weights) still applies under a weaker class of assumptions.
