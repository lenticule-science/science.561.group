---
type: theorem
class: engineering-claim
status: proved
depends-on: [clock, settlement-determinism, federation-convergence, witness, time-and-event-ordinals, settling-monotonicity, settling-continuity, knowledge-order]
see-also: [transport-tolerance-of-federation]
---

# Substrate ordinal clock is monotone and substrate-determines time

**Claim.** The substrate's ordinal clock (per [clock](teaching/explanations/clock.md)) is monotone non-decreasing across the substrate's lifetime, and substrate operations' time-correctness depends only on this clock — not on wall-clock readings, not on monotonic-clock readings, not on external time sources. Per [settlement-determinism](settlement-determinism.md), the substrate's behavior is a deterministic function of `(event log, closure-rule system)`; time's role is consumed entirely by the event log's ordinal indexing.

Per [federation-convergence](federation-convergence.md), substrates federating across hosts with arbitrary clock skew converge to the same predication settling.

## Why this holds

The argument follows from how the substrate consumes time:

**Part 1: Substrate ordinals are monotone by construction.** Per [time-and-event-ordinals](teaching/explanations/time-and-event-ordinals.md), each substrate operation receives a fresh ordinal greater than all prior ordinals. The event log's append-only discipline ensures monotonicity is preserved.

This monotonicity is the engineering shadow of [settling monotonicity](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/settling-monotonicity.md): the math requires that, for $\sigma \leq \tau$, the valuation $v_\sigma(p) \leq_k v_\tau(p)$ pointwise in the [knowledge order](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/knowledge-order.md) on the [predication fiber algebra](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fiber-algebra.md). The substrate's ordinal clock is the index $\tau$; the append-only event log is the engineering realization of the monotone chain. Conflicts that wall-clock-driven systems would handle by retraction the substrate accumulates as $\top$-cells, preserving the $\leq_k$-monotone discipline.

At limit ordinals (replay across a snapshot, federation join across a long quiet interval), the substrate's state at the limit is the directed knowledge-join of states at preceding ordinals — the engineering shadow of [settling continuity](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/settling-continuity.md). No new content is introduced at the limit beyond what is approached from below; the substrate's behavior at a join boundary is determined by the chain of prior states, not by the join boundary's wall-clock timestamp.

**Part 2: Reducers don't read wall-clock.** Per [settlement-determinism](settlement-determinism.md), reducers are pure functions of `(working model, event, context)` where context contains only substrate-resident content. Wall-clock is not in any substrate operation's context.

**Part 3: Wall-clock predications are content, not reads.** When a substrate operation needs to refer to wall-clock time (a deadline, an event timestamp), the time is included in the operation's input as a predication, not read from the host. The reducer reads the time predication from substrate content per Part 2.

**Part 4: Federation is order-independent.** Per [federation-convergence](federation-convergence.md) and the closure-merge commutation lemma, federated substrates converge regardless of arrival order. Cross-substrate clock skew can reorder messages on arrival; convergence is unaffected.

## Engineering consequence

Several engineering consequences:

- **Wall-clock skew is not a correctness concern.** Federation across hosts in different time zones, with NTP drift, with disagreeing wall-clocks, all converge per federation-convergence.
- **No "leap second" bugs.** A substrate operation involving a calendar-bound schedule fires at the substrate ordinal where the wall-clock check passes; the substrate doesn't experience leap seconds because it doesn't directly read wall-clock for correctness.
- **Replay is wall-clock-independent.** Per [snapshot-replay-fidelity](snapshot-replay-fidelity.md), replay reproduces substrate state byte-identically regardless of when the replay happens.
- **Audit is substrate-ordinal-anchored.** Auditors reason about substrate events by their substrate ordinals, not their wall-clock timestamps. The wall-clock metadata helps human readers; the substrate's structural answer to "when did this happen" is the ordinal.

## What the theorem rules out

- A reducer that reads host wall-clock and branches on the reading violates Part 2; per [settlement-determinism](settlement-determinism.md), the substrate is non-deterministic.
- A schedule whose firing condition involves only host monotonic-clock without substrate-content anchoring is host-local and not federation-portable.
- A federation that depends on synchronized wall-clocks across substrates is over-constrained; per [transport-tolerance-of-federation](transport-tolerance-of-federation.md), federation should work over any clock state.

## What the theorem requires

- The substrate's [event log](../objects/event-log.md) assigns monotone ordinals.
- Per [settlement-determinism](settlement-determinism.md), reducers are pure on substrate-resident inputs only.
- Wall-clock and external-time-source readings, when needed by substrate operations, are admitted as substrate content.
