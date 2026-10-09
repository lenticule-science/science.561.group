---
type: concept
class: component
depends-on: [settling-as-computation, wavefront, closure-rule]
see-also: [predication-graph-store, event-log, settle, driver-substrate-split]
---

# Engine

The processing component of a [predicated computer](../objects/predicated-computer.md): the part that *does* settling. The substrate's [predication-graph store](../objects/predication-graph-store.md) holds content; the engine applies the substrate's closure machinery to that content until the wavefront is exhausted. The two together — store plus engine — are what distinguishes a live predicated computer from a content archive that happens to be predication-shaped.

## What the engine is

The engine is the active half of the [driver/substrate split](driver-substrate-split.md): it executes the substrate's algebra over the store's content. Its primitive responsibility is the [settle](../morphisms/settle.md) loop — read the store at the current wavefront, apply every closure rule whose premise matches, write the conclusions back, advance the wavefront, repeat until quiescence or [fuel exhaustion](fuel-bound.md).

Engineering realizations vary in how the loop is driven. Continuous engines run a daemon process that pumps the wavefront whenever the store advances. Batched engines run the loop on demand — at admission, at query, at scheduled intervals. Distributed engines partition the store into regions and run a per-region loop, federating results through [coherence-glue](../morphisms/coherence-glue.md). The engineering theory leaves the driving discipline open; what is closed is *what* the engine does — apply the closure machinery to fixed-point.

## What the engine is not

- **The engine is not the store.** Store content survives engine restarts; engine state does not. An engine carries no durable memory between settle invocations — all working state lives in the store, the [event log](../objects/event-log.md), or transient settle-internal scratch space whose lifetime is the settle invocation. This is the substrate's commitment that durability is a store property, not an engine property.
- **The engine is not the boundary.** The substrate's I/O is the [interfacer](interfacer.md)'s and the [boundary](boundary.md)'s discipline; the engine receives admitted predications from the boundary but does not itself parse external bytes or emit external bytes. An engine that special-cases external formats has assumed boundary responsibilities and broken the split.
- **The engine is not a closure-rule store.** The closure rules the engine applies are themselves [closure-rule records](../objects/closure-rule-record.md) in the store, per [self-representation](self-representation.md). The engine reads them through the same primitives any other consumer would. Two engine implementations that respect the substrate's algebra — the canonical-form discipline, the witness contract, the locality of closure-rule application — are interchangeable, regardless of how their internal scheduling, fan-out, or layer batching differs.

## Absence of an engine marks an archive, not a substrate

A predication-graph store with no engine is an archive: addressable, queryable, persistent, but inert. Its content does not advance under closure rules because nothing is applying them. A content archive can be promoted into a predicated computer by mounting an engine that respects the same algebra; the inverse — detaching the engine from a settled store — yields the archive form again, byte-identical to a store that was never live. This is the engineering interpretation of why the substrate's content is the source of truth and the engine is interchangeable: any conforming engine running against the archived content reproduces the same settled outputs.

The pattern composes with [substrate-universality](substrate-universality.md): a single engine implementation can be pointed at any predication-graph store whose content respects the substrate's algebra, and the resulting predicated computer is determined by the store's content rather than by the engine's identity.

## What the engine commits to

Every conforming engine commits to four engineering invariants, derivable from the substrate's algebra:

- **Statelessness between invocations.** All persistent state lives in the store and the event log. An engine that holds working memory between settle invocations is silently a second source of truth, in violation of [source-of-truth](source-of-truth.md).
- **Locality-respecting application.** Each closure-rule application reads at the rule's declared match radius (per [wavefront](wavefront.md)). An engine that scans the global graph to evaluate a single rule has substituted a global discipline for the substrate's local one and lost the wavefront's scaling property.
- **Witness emission.** Every closure-rule application emits a [witness](witness.md). The witness chain in the event log is the substrate's audit record; an engine that suppresses witnesses has produced inscrutable settlement.
- **Determinism under canonical input.** Two engine invocations on byte-identical input store-content under byte-identical rule-system content produce byte-identical settled output. The engine's internal scheduling may vary; its substrate-observable output may not. This is what makes [hash-discipline](hash-discipline.md) usable as a settlement check.

Together these invariants are why an engine can be replaced, scaled, parallelized, or rewritten in a different host language without altering the predicated computer's behavior. The engine is plumbing for the substrate's algebra; the substrate's content is what determines the computation.
