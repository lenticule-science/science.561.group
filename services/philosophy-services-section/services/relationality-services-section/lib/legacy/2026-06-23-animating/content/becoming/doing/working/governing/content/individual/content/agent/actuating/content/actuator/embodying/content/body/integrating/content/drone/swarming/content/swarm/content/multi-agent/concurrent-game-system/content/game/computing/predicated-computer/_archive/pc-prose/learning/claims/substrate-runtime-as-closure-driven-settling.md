---
type: theorem
class: engineering-claim
status: proved
depends-on: [settlement-via-closure-2-monad, transaction-atomicity-via-closure-idempotence, compaction-via-cosettling-equivalence-class, opportunistic-scheduling-loop, just-in-time-orchestration-via-cohomological-vanishing, replication-consistency-via-network-sheaf, closure-2-monad-lax-idempotence, predication-fibration]
see-also: [modal-restriction-as-substrate-authorization-primitive, recovery-via-event-log-replay-determinism]
---

# The substrate's runtime is one closure-driven settling, with multiple engineering surfaces

**Claim.** The substrate's runtime — settlement, transactions, compaction, opportunistic scheduling, wavefront propagation, federation merge — is *structurally one [closure-driven settling](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/closure-drivenness.md) on the substrate's full [predication-fibration](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fibration.md)*. Each named PredComp discipline is a *sub-fibration restriction* of this one settling, with the substrate's [closure 2-monad](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/closure-2-monad.md) iterating to fixed-point on the appropriate fiber.

The engineering surfaces — transactions atomicity, compaction's equivalence-class quotient, opportunistic scheduling's wavefront, federation's CRDT merge — are the same closure 2-monad iteration restricted to different sub-regions. The substrate has *one runtime*, mathematically; multiple engineering names label the surface.

## Why this holds

Each of the substrate's named runtime disciplines has been independently grounded in the closure 2-monad:

- **[settlement-via-closure-2-monad](settlement-via-closure-2-monad.md)** — substrate settlement is the closure 2-monad's iteration to fixed-point; per [closure-2-monad-lax-idempotence](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/closure-2-monad-lax-idempotence.md), idempotent at quiescence.
- **[transaction-atomicity-via-closure-idempotence](transaction-atomicity-via-closure-idempotence.md)** — transaction atomicity follows from closure 2-monad lax-idempotence on a sub-settling.
- **[compaction-via-cosettling-equivalence-class](compaction-via-cosettling-equivalence-class.md)** — compaction is quotienting the event-log by the closure 2-monad's cosettling equivalence class.
- **[opportunistic-scheduling-loop](teaching/explanations/opportunistic-scheduling-loop.md)** — the orchestration loop is closure-driven settling on the orchestration sub-fibration; per [just-in-time-orchestration-via-cohomological-vanishing](just-in-time-orchestration-via-cohomological-vanishing.md), wavefront-local.
- **[wavefront-locality-via-cohomology-vanishing](wavefront-locality-via-cohomology-vanishing.md)** — wavefront propagation is the runtime presentation of closure-driven settling-monotonicity.
- **[replication-consistency-via-network-sheaf](replication-consistency-via-network-sheaf.md)** — federation merge converges via the bilattice network-sheaf consensus, structurally the closure 2-monad iterated on the multi-replica sheaf.

Each of these is a closure 2-monad iteration *on a sub-fibration* of the substrate's full [predication-fibration](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fibration.md):

- Settlement runs on the full content-fiber.
- Transactions run on a transaction-bracketed sub-fiber.
- Compaction runs on the event-log fiber.
- Opportunistic scheduling runs on the orchestration sub-fibration (work-items + resource-state + feasibility).
- Wavefront runs on the predication sub-fibration's wavefront-frontier.
- Federation merge runs on the multi-replica network-sheaf.

Per the [predication-fibration](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fibration.md)'s structure, sub-fibrations compose — the substrate's full runtime is the joint closure 2-monad iteration over the union of all sub-fibrations. Per [closure-2-monad-lax-idempotence](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/closure-2-monad-lax-idempotence.md), the joint iteration is itself lax-idempotent — at substrate-wide quiescence, all sub-fibrations are at fixed-point simultaneously.

## Engineering consequence

- **The substrate has one runtime.** Implementations don't need separate machinery for transactions vs settlement vs compaction vs scheduling — they're the same closure-rule machinery applied to different sub-regions. The substrate's [engine](teaching/explanations/engine.md) implements one operation (settle) and applies it everywhere.
- **The runtime's properties compose across surfaces.** Per [bootstrap-determinism](bootstrap-determinism.md), the closure 2-monad iteration is deterministic — same seed, same fixed-point. Per the theorem, this determinism applies across all surfaces simultaneously: replaying the event-log from bootstrap reaches the same settlement, transaction states, compaction state, scheduling state, federation state — all bytewise.
- **Federation across surfaces is the same federation.** Per [federation-trust-bilattice-graded](federation-trust-bilattice-graded.md), federation operates on the substrate's content-fibration. Per the theorem, federation also operates on the orchestration fibration (work-items can cross substrates), the transaction fibration (cross-substrate transactions), the compaction fibration (federated event-logs). The federation discipline is one phenomenon at every surface.
- **Recovery is recovery of the whole runtime.** Per [recovery-via-event-log-replay-determinism](recovery-via-event-log-replay-determinism.md), recovery replays the event-log; per the theorem, the closure 2-monad iteration this triggers covers all surfaces — settled state, in-flight transactions, compacted log, queued work-items, replication state — recovered together.
- **Conformance is conformance on the runtime.** Per [conformance-via-fiber-algebra-functor](conformance-via-fiber-algebra-functor.md), conformance is exact functorial realization. Per the theorem, conformance on the runtime reduces to conformance on the closure 2-monad's action on the predication-fibration — one structural test, not five.

## What this clarifies

A common confusion: PredComp seems to have many different runtime disciplines (transactions, settlement, scheduling, compaction, federation merge), each with its own theorem. Are these separate machineries that need to be implemented separately?

Per this theorem: no. They are *one* closure 2-monad iteration, projected to different engineering surfaces by the sub-fibration structure. An implementation that correctly implements the closure 2-monad on the substrate's predication-fibration *automatically* gets:

- Transaction atomicity (on transaction-bracketed sub-fibers).
- Compaction equivalence (on event-log fibers).
- Opportunistic scheduling (on orchestration fibers).
- Wavefront locality (on the wavefront-frontier).
- Federation convergence (on multi-replica fibers).

The "engineering surfaces" are *how the substrate's discipline appears at different vantage points*, not separate implementations to write.

## What the theorem rules out

- **Implementations with separate runtime machineries.** A substrate that has a transaction-engine, a compaction-engine, a scheduling-engine, a federation-engine, all separately implemented, is doing the same work many times. Per the theorem, one closure 2-monad implementation suffices.
- **Surface-specific consistency models.** A substrate that has different consistency guarantees for different surfaces (strong consistency for transactions, eventual for federation, etc.) is implementing different value-domains for different surfaces. Per the theorem, the substrate's value-domain is one bilattice; consistency is one phenomenon.
- **Surface-specific recovery.** A substrate that recovers transactions one way, scheduler-state another way, replication-state yet another is doing extra work. Per the theorem, recovery is closure 2-monad replay on the joint fibration — one operation.
- **Disciplines that don't compose at quiescence.** A substrate where transactions are at fixed-point but scheduling isn't (or vice versa) is in an inconsistent runtime state. Per the theorem, substrate-wide quiescence requires all sub-fibrations at fixed-point simultaneously — a coherent claim.

## What the theorem requires

- The substrate implements the closure 2-monad $\mathrm{Cl}$ on its full [predication-fibration](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fibration.md) (per [settlement-via-closure-2-monad](settlement-via-closure-2-monad.md)).
- The substrate's sub-disciplines (transactions, compaction, scheduling, etc.) are sub-fibration restrictions of the closure 2-monad (each grounded in its own theorem).
- The substrate's overall runtime is the joint iteration of $\mathrm{Cl}$ across the union of sub-fibrations.

## Position

This theorem is the substrate's *meta-claim about its runtime architecture*. Together with [modal-restriction-as-substrate-authorization-primitive](modal-restriction-as-substrate-authorization-primitive.md) (authorization is one phenomenon at multiple surfaces) and [recovery-via-event-log-replay-determinism](recovery-via-event-log-replay-determinism.md) (recovery is event-log replay), the substrate's structural framing is now explicit: one runtime, one authorization, one recovery, one event-log; many surfaces, all derived from the same underlying machinery.

This is what makes the substrate *structurally simple* even though it covers many engineering disciplines. An implementer doesn't need to learn five runtime disciplines; they need to implement the closure 2-monad once. The engineering surfaces are the substrate's vocabulary for what becomes visible at each vantage point.
