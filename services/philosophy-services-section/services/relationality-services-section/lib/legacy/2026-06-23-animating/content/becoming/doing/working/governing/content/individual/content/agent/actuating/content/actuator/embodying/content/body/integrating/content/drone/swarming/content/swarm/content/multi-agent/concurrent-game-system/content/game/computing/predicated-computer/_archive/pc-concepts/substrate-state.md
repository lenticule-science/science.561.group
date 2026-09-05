---
type: concept
class: structure
depends-on: [predication-substrate, time-and-event-ordinals]
see-also: [predication-graph-store, snapshot, branched-substrate-state, settling-as-computation]
---

# Substrate state

What it means for a [predicated computer](../objects/predicated-computer.md) to *have a state*. A naive answer says the substrate's state is the predications currently in the [predication-graph store](../objects/predication-graph-store.md) — the set of substrate-recorded relations at this moment. The naive answer is incomplete: a substrate's state is not a flat set; it is an *indexed family* of fibers over the substrate's history, with restriction maps connecting earlier histories to later ones, and with each fiber carrying enough algebraic structure that the substrate's settlement is well-defined at every point.

This concept names the structure precisely so that operations on substrate state — query, snapshot, branch, replay — can be specified without ambiguity about *which* state-as-of-when is being referenced. In the math reformulation, the indexed family is the data of a [predication settling](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-settling.md): a [settling-bound](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/settling-bound.md)-indexed family of [predication valuations](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-valuation.md) into [predication fiber algebras](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fiber-algebra.md), satisfying [settling monotonicity](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/settling-monotonicity.md) under the [knowledge order](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/knowledge-order.md).

## What substrate state contains

At any given time, the substrate's state is the family

`(predications-at-history-t, restriction-back-to-earlier-histories)` for each history t

ranging over the substrate's history index. Three components:

- **A history index.** The substrate's settled history is a partial order: each admitted message produces an extension, and two extensions admitted in independent orders (per [port](port.md)) produce equivalent histories. The history index is what [time-and-event-ordinals](time-and-event-ordinals.md) provides — a canonical ordering up to independence.
- **A fiber at each history.** The fiber at history `t` is the substrate's full content as of `t`: the predications recorded, their values in the substrate's [value-domain](substrate-value-domain.md), and the closure-rule conclusions derived. Two histories that differ — even by a single admitted message — generally have different fibers.
- **Restriction maps from later to earlier.** For every history extension `t ≤ t'`, the substrate exposes a restriction map from the fiber at `t'` to the fiber at `t`: the operation that asks "what did this predication look like before that later admission?" Restriction maps are what make replay, branch, and audit possible.

The substrate's state is *not* just the latest fiber. It is the entire family — every fiber and every restriction — held as the durable record from which any prior or alternate state is derivable.

## State versus working content

Two concepts adjacent to substrate state are distinct from it and worth separating:

- **The substrate's working content** is the latest fiber — the predications-as-of-now. This is what a query against the substrate typically returns. It is a *projection* of the state, not the state itself.
- **The substrate's settled subfiber** at a given history is the portion of that fiber's content that has reached fixed-point under the closure-rule system (per [settling-as-computation](settling-as-computation.md)). The settled subfiber is computationally distinct from the full fiber; un-settled predications exist but are flagged as in-flight.

A consumer of the substrate that only ever wants the latest settled content is consuming a single projection of the state. A consumer that wants to replay, audit, or compare alternate histories is consuming the state itself.

## Why substrate state is an indexed family

Three engineering consequences make the indexed-family structure load-bearing:

- **Replay correctness.** Per [source-of-truth](source-of-truth.md), the substrate's state is a deterministic function of its admitted messages. Recovering the state at history `t'` requires only the messages admitted up to `t'`; recovering the state at history `t < t'` requires only the messages admitted up to `t`. A flat state representation that holds only the latest fiber loses the ability to derive earlier fibers without a separate audit log; an indexed family makes the derivation a restriction-map application.
- **Branch and snapshot.** A [snapshot](../objects/snapshot.md) is a fiber at a chosen history; a [branched substrate state](branched-substrate-state.md) is two fibers diverging from a common-ancestor history. Both operations presume the indexed-family structure: the snapshot is one fiber pulled out by index; the branch is two indexed families with shared ancestry. Without the indexed-family framing, branch and snapshot are ad-hoc operations rather than systematic projections of the state.
- **Federation alignment.** When two predicated computers federate, they align *fibers at corresponding histories* — not flat content, but indexed families that respect each computer's history structure. The substrate's [federation-as-substrate-join](teaching/explanations/federation-as-substrate-join.md) discipline assumes both peers carry indexed-family state; mismatched state representations break the alignment.

## Substrate state and the four-component anatomy

The substrate state lives in the [predication-graph store](../objects/predication-graph-store.md) and the [event log](../objects/event-log.md) per the [two-store coherence](two-store-coherence.md) discipline. The store is the practical projection — typically the latest fiber, indexed for fast query — and the event log is the rigorous record from which any fiber is reproducible. The [engine](engine.md) reads and writes against the latest fiber; observation surfaces query against any indexed fiber the consumer requests; the boundary admits messages that produce new fibers via stepping.

The pattern composes with [stepping](stepping.md) (each admitted port-typed message advances the indexed family by one step), with [branched-substrate-state](branched-substrate-state.md) (a branch is two indexed families with shared restriction maps below the divergence), and with [hash-discipline](hash-discipline.md) (each fiber's canonical-form hash is its address; restriction maps preserve canonical addresses where the content is unchanged).

## Position in the substrate

Substrate state is the substrate's *name for what it remembers*. Without the explicit indexed-family framing, "the substrate's state" is a single word that hides a load-bearing structure, and engineering arguments about replay, audit, branch, federation routinely conflate the latest fiber with the indexed family. With the framing, the substrate's commitments become precise: the substrate remembers the entire indexed family, queries return projections, replay reconstructs from the event log, federation aligns indexed families across peers.

The framing is what makes the substrate's audit trail meaningful at the state level: any claim about what the substrate "knew" at a particular moment refers to a specific fiber in the indexed family, identifiable by history and reachable through restriction.
