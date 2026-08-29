---
type: concept
class: substrate-primitive
depends-on: [time-and-event-ordinals, monotonic-clock-discipline, event-log, lorentzian-causal-settling, event-causality-via-lorentzian-settling, temporal-2-category, signature-binds-witness-to-identity, self-representation]
see-also: [substrate-clock-monotonicity, recovery-via-event-log-replay-determinism]
---

# Substrate clock

The substrate's *single ordinal-emitting entity* — the substrate-content object responsible for assigning event ordinals to admissions and stamping witness chains. In the substrate's hyperdoctrine setting, the substrate clock is *the substrate-side instance of the [temporal 2-category](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/temporal-2-category.md)'s ordinal-stratification* — a single source of monotonic per-substrate event ordinals that the [event-log](../objects/event-log.md), [witness](witness.md), and [Lorentzian causal-settling](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/lorentzian-causal-settling.md) all consult.

Per [monotonic-clock-discipline](../theorems/monotonic-clock-discipline.md), the substrate's ordinals are monotonic per substrate; per [event-causality-via-lorentzian-settling](../theorems/event-causality-via-lorentzian-settling.md), the ordinal sequence is a worldline parameterization of the substrate's Lorentzian causal-set. The substrate-clock concept names *the entity* that produces ordinals; this entity is queryable, auditable, and (per [self-representation](self-representation.md)) recorded as substrate content.

## Why this concept exists

[time-and-event-ordinals](time-and-event-ordinals.md) covers the *discipline* (event ordinal vs declared time, replay determinism). [monotonic-clock-discipline](../theorems/monotonic-clock-discipline.md) is the theorem (ordinals are monotonic). But neither names *the substrate entity* that emits ordinals — the clock itself. The result: implementations create ordinal-emission as ad-hoc runtime state (a counter in memory), making it invisible to substrate audit.

This concept fixes the substrate-clock as a substrate-content entity. Per [self-representation](self-representation.md), even the clock is substrate-recorded.

## Substrate-clock structure

The substrate's clock is a single entity per substrate-instance:

```json
{
  "kind": "substrate-clock",
  "clock-id": "<canonical hash>",
  "substrate-id": "<the owning substrate>",
  "current-ordinal": <non-negative integer>,
  "started-at-declared-time": "<ISO 8601 UTC>",
  "ordinal-policy": {
    "kind": "monotonic-integer | hybrid-logical-clock | vector-clock",
    "<kind-specific parameters>"
  },
  "signature": {<substrate signature>}
}
```

Per [hash-injectivity-under-canonical-form](../theorems/hash-injectivity-under-canonical-form.md), the clock-id is the canonical-form hash of its initial state; per [signature-binds-witness-to-identity](../theorems/signature-binds-witness-to-identity.md), the substrate signs the clock entity at bootstrap.

The `current-ordinal` field is *not* part of the canonical hash — it changes monotonically, but the clock's identity is fixed at creation. Reading the current ordinal is a substrate operation: a query against the clock entity returns the latest ordinal value.

## Ordinal emission

When the substrate admits an event, the clock atomically:

1. Reads the current ordinal $n$.
2. Increments to $n + 1$.
3. Returns $n + 1$ to the admitting operation.
4. The admission is recorded with `event-ordinal: n + 1`.

Per [monotonic-clock-discipline](../theorems/monotonic-clock-discipline.md), the ordinals are strictly monotonic per substrate — no two admissions get the same ordinal, later admissions get larger ordinals.

The atomicity of read-and-increment is critical: if two concurrent admissions both read $n$ and both increment to $n + 1$, the substrate's ordinal sequence breaks. Implementations use atomic compare-and-swap, monotonic counters from the kernel, or hardware-supported atomics. The substrate's discipline is to require atomicity; per [substrate-clock-monotonicity](../theorems/substrate-clock-monotonicity.md), monotonicity is a structural property the substrate verifies.

## Ordinal-policy variants

Different substrate deployments may use different ordinal policies:

### Monotonic integer

The simplest: ordinals are integers $0, 1, 2, \dots$. Atomic per-substrate. Per [monotonic-clock-discipline](../theorems/monotonic-clock-discipline.md), this is the default and suffices for single-substrate use.

### Hybrid logical clock (HLC)

Ordinals are `(physical-time, logical-counter)` pairs. The physical-time tracks declared wall-clock; the logical-counter increments to maintain monotonicity when wall-clock doesn't advance fast enough. HLC is useful for substrates federating across hosts with synchronized-but-not-perfect clocks.

### Vector clock

Ordinals are vectors $(o_1, o_2, \dots, o_n)$ where each $o_i$ is a per-peer counter. Used for multi-substrate federations where causal precedence across peers needs to be reconstructible from the ordinal alone.

The substrate's choice of ordinal policy is per-deployment; the clock entity's `ordinal-policy` field records the choice. Per [federation-trust-bilattice-graded](../theorems/federation-trust-bilattice-graded.md), federation peers may use different policies; bridging requires explicit translation per [federation-bridge](../objects/federation-bridge.md).

## Cross-substrate ordinal coordination

Different substrates have independent clocks. Per [time-and-event-ordinals](time-and-event-ordinals.md), the ordinal isn't part of the event's content hash — events deduplicate across substrates by content, ordinals can differ per substrate.

For cross-substrate causal coordination per [event-causality-via-lorentzian-settling](../theorems/event-causality-via-lorentzian-settling.md), substrates use the *content-recorded* causal-precedence predications, not ordinal comparison. An event's `causal-predecessors` field cites prior events by content-hash, not by ordinal — so the causal structure is observer-independent.

## Recovery and the clock

Per [recovery-discipline](recovery-discipline.md) and [recovery-via-event-log-replay-determinism](../theorems/recovery-via-event-log-replay-determinism.md), recovering substrates restore the clock from the event-log:

1. Read the most recent event in the log.
2. Set `current-ordinal` to that event's ordinal.
3. New admissions resume from there.

Per [hash-injectivity-under-canonical-form](../theorems/hash-injectivity-under-canonical-form.md), the recovered clock's identity is the same as the pre-termination clock (clock-id is content-hash, current-ordinal is stateful).

## Querying the clock

Standard substrate queries against the clock:

- **Current ordinal**: read `clock.current-ordinal` — returns the latest emitted ordinal.
- **Ordinal-to-event mapping**: query the event-log for the event with `event-ordinal: n`.
- **Time-window queries**: query events whose `event-ordinal` falls in a range.

Per [cost-discipline-reads-free](../theorems/cost-discipline-reads-free.md), all clock queries are reads — free at the substrate level.

## What the discipline rules out

- **Multiple clocks per substrate-instance.** A substrate that has multiple ordinal-emitters loses monotonic ordering. Per [monotonic-clock-discipline](../theorems/monotonic-clock-discipline.md), the substrate has one clock per instance.
- **Clock-state outside substrate content.** A clock implemented as a runtime variable (in-memory counter, OS-level atomic) without substrate-content reflection is invisible to audit — auditors can't verify the ordinal sequence is monotonic. Per [self-representation](self-representation.md), the clock is substrate content.
- **Reading host time as ordinal.** Per [time-and-event-ordinals](time-and-event-ordinals.md), host wall-clock is *not* the substrate's ordinal. The clock emits substrate-monotonic ordinals; declared time is separate substrate content.
- **Non-atomic ordinal emission.** A clock whose read-and-increment is non-atomic produces duplicate ordinals under concurrency. Per [substrate-clock-monotonicity](../theorems/substrate-clock-monotonicity.md), atomicity is required.

## Position

Substrate-clock is the substrate's *ordinal-emission primitive*. Per [time-and-event-ordinals](time-and-event-ordinals.md), the substrate distinguishes ordinal (substrate-local sequence) from declared time (sender-claimed wall-clock). Per this concept, the ordinal-emission entity itself is substrate content — queryable, auditable, recovered on restart, federation-aware.

The concept composes with [event-log](../objects/event-log.md) (each event carries an ordinal from this clock), [witness](witness.md) (witnesses cite the ordinal), [time-and-event-ordinals](time-and-event-ordinals.md) (the ordinal-vs-declared-time discipline), [event-causality-via-lorentzian-settling](../theorems/event-causality-via-lorentzian-settling.md) (the Lorentzian framing), [recovery-via-event-log-replay-determinism](../theorems/recovery-via-event-log-replay-determinism.md) (clock state restored from the log), and [substrate-clock-monotonicity](../theorems/substrate-clock-monotonicity.md) (the ordinal-monotonicity guarantee).
