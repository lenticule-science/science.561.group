---
type: concept
class: time-discipline
depends-on: [time-and-event-ordinals, settlement-determinism]
see-also: [schedule, witness]
---

# Clock

The substrate's *time-source discipline*. The substrate distinguishes three clocks, each with different correctness properties:

- **Substrate ordinal clock.** The monotone non-decreasing index in the substrate's [predication settling](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-settling.md). Per [time-and-event-ordinals](time-and-event-ordinals.md), this is the substrate's authoritative time: every operation has a substrate ordinal, replay reproduces ordinals deterministically, federation respects ordinal causality. The substrate ordinal clock is what [settlement-determinism](../theorems/settlement-determinism.md) consults for "when did this happen."
- **Wall-clock time.** The host's calendar time at the moment of operation. Per [settlement-determinism](../theorems/settlement-determinism.md), wall-clock time is *informational, not consulted for correctness*: it appears in witnesses for human-readability and external-system integration, but the substrate's behavior does not branch on wall-clock readings.
- **Monotonic clock.** The host's monotonic time source, used for measuring durations within an operation (latency, timeout). Monotonic clock is host-local and not federation-portable; the substrate uses it for performance instrumentation but not for settling-correctness.

The substrate's discipline:

- **Substrate operations consult the substrate ordinal clock.** Per [closure-drivenness](closure-drivenness.md), each closure-rule application advances the substrate's settling by one ordinal. The ordinal is what subsequent witnesses cite, what replay reproduces, what federation orders by.
- **External integrations may include wall-clock predications.** When a substrate predication needs to refer to a calendar time (a deadline, a scheduled event, a "this happened at 3pm UTC"), the time is part of the predication's content, not a runtime read. Per [settlement-determinism](../theorems/settlement-determinism.md), reducers don't read host wall-clock; they read the time predication from the substrate.
- **Performance instrumentation may use monotonic clock.** Per [trace](trace.md), trace annotations may carry duration measurements from monotonic clock. These are observability data, not substrate-state-changing content; per [observability-as-reads](../theorems/observability-as-reads.md), the cost-discipline applies.

The three clocks compose: a substrate operation runs at substrate ordinal $\tau$, started at wall-clock $T_{\mathrm{wall}}$, took monotonic-duration $\Delta$. The witness records all three; substrate behavior depends only on $\tau$.

Cross-substrate clock skew is *not a substrate-correctness concern*. Per [federation-convergence](../theorems/federation-convergence.md), federation is order-independent — different substrates' wall clocks can disagree by hours and the substrate's eventual converged state is unaffected. The substrate's audit may surface clock skew as observability information but never as a correctness violation.
