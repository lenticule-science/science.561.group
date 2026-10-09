---
source: [heartbeat]
target: [cycle-witness, registration-delta]
name: heartbeat-cycle
description: "The morphism that runs one heartbeat cycle: select the registered entities at the heartbeat's scope, order them per declared-dependency-ordering, call advance-tick once per selected entity, deregister entities that reached fixed-point, and emit a cycle-witness aggregating the per-tick witnesses."
type: morphism
class: composed-operator
depends-on: [heartbeat-record, advance-tick, declared-dependency-ordering, fiber, emit-event]
see-also: [tick-as-iteration, anomaly-as-contradiction, dispatch]
title: heartbeat-cycle
---


The morphism that runs one heartbeat cycle: select the registered entities at the heartbeat's scope, order them per [declared-dependency-ordering](../../declared-dependency-ordering/declared-dependency-ordering.md), call [`advance-tick`](advance-tick.md) once per selected entity, deregister entities that reached fixed-point, and emit a cycle-witness aggregating the per-tick witnesses.
`heartbeat-cycle` is the morphism that makes [tick-as-iteration](../../tick-as-iteration/tick-as-iteration.md) operational at scale.

A cycle is the heartbeat's *unit of work*.
A continuous-mode heartbeat runs cycles back-to-back at its declared cycle-rate; an on-demand heartbeat runs one cycle per explicit invocation.
Either mode uses the same morphism.

## Signature

```
heartbeat-cycle(heartbeat) → (cycle-witness, registration-delta)
```

Inputs:

- **`heartbeat`** — reference to the [`HeartbeatRecord`](../objects/heartbeat-record.md) to cycle.
  The heartbeat's `scope`, `policy`, `cycle-rate`, `closure-rule-system`, and `fuel-per-tick` are read from the record.

Outputs:

- **`cycle-witness`** — [`Witness`](../objects/witness.md) aggregating the cycle's per-tick witnesses, the cited rule-system version, the consumed fuel, the cycle's start and end timestamps, and the `registration-delta`'s hash.
- **`registration-delta`** — record of which entities were added to or removed from the heartbeat's registration set during this cycle.
  Used by realizations that maintain a `registration-snapshot` cache on the [`HeartbeatRecord`](../objects/heartbeat-record.md).

## Operational semantics

`heartbeat-cycle` SHALL proceed in five phases:

1. **Selection.** Determine the cycle's selection set per the heartbeat's `policy`.
  Read the substrate region matching the heartbeat's `scope`; for each entity in the region, check whether its fiber has unsettled cells under the active rule system (an entity is *registered* iff it has unsettled cells per [heartbeat-record](../objects/heartbeat-record.md)).
  Apply the policy's filter (round-robin selects all; priority-weighted selects top-K; etc.).
  The result is the cycle's selection set.

2. **Ordering.** Compute the cycle's tick order per [declared-dependency-ordering](../../declared-dependency-ordering/declared-dependency-ordering.md).
  For each pair of selected entities, if entity $B$'s `reads` overlaps entity $A$'s `writes` on any channel-or-predicate, $B$ ticks after $A$.
  Cycles in the dependency graph produce $\top$-cells in the cycle's *ordering fiber*; the heartbeat's policy declares whether to admit (eventual consistency) or escalate (abort cycle, emit `guard` diagnostic).

3. **Tick.** For each entity in the ordered selection, call [`advance-tick(entity, rules: heartbeat.closure-rule-system, fuel: heartbeat.fuel-per-tick)`](advance-tick.md).
  Collect per-tick witnesses.
  Track which ticks returned `advanced: true` (still unsettled) and `advanced: false` (at fixed-point).

4. **Deregister and re-register.** For each entity that returned `advanced: false`, mark for removal from the next cycle's registration.
  For each entity whose fiber state changed during this cycle (the tick produced new cells), check whether neighbors (entities in the changed entity's `depends-on`/`serves`/`part-of` neighborhood) are now newly-unsettled and SHOULD be registered for the next cycle.
  Compute the `registration-delta` from these additions and removals.

5. **Witness and emit.** Construct the cycle's aggregate witness chaining the per-tick witnesses, citing the cited rule-system version, the registration-delta's hash, and the cycle's timing.
  [`emit-event`](emit-event.md) one event on the heartbeat's `name`-prefixed channel (e.g., `root-heartbeat-cycle`, `engineering-heartbeat-cycle`) with the cycle witness as payload.

## Normative invariants

- **Deterministic.** Same `(heartbeat, substrate-state-at-start)` SHALL produce byte-identical `(cycle-witness, registration-delta)`.
  The selection's ordering, the per-tick application, and the registration-delta computation are all determined by substrate content and canonical-hash tiebreaking.
- **Locality-respecting per tick.** Each `advance-tick` reads bounded fibers per its locality discipline; the cycle's working memory is the union of the selected entities' bounded neighborhoods, NOT the substrate's full content.
- **Idempotent on quiescent substrate.** A cycle whose initial selection set is empty (no registered entities) SHALL emit a no-op witness recording "no advance," consume zero fuel, and return an empty registration-delta.
  Repeating the cycle produces the same result.
- **Witness-emitting.** Every cycle SHALL emit exactly one cycle event with the aggregate witness.
  A cycle that fails to emit has lost the substrate's audit chain at the cycle granularity.
- **Cycle-bounded fuel.** The cycle's total fuel is bounded by `heartbeat.fuel-per-tick × |selection-set| + overhead`.
  A cycle whose ticks individually fail with fuel-exhaustion SHALL still complete (each tick's fuel exhaustion is its own concern); cycle-level fuel exhaustion is a realization concern (a cycle that exceeds wall-clock or memory bounds aborts with a `guard` diagnostic).
- **Replayable.** Given the substrate state at cycle start, the rule-system version, and the heartbeat's policy, replaying the cycle SHALL produce byte-identical events and substrate state at cycle end.

## Composition with other operators

`heartbeat-cycle` composes with:

- **[`apply-edit`](apply-edit.md).** A cycle that produces tick events triggers downstream cascades through `apply-edit`'s lifecycle phase (per the substrate-edit discipline).
  The cycle's events appear in the event log; closure rules that fire on `mutation`-channel events (as opposed to fiber-state events) pick them up in subsequent cycles.

- **[`dispatch`](dispatch.md).** A cycle MAY include dispatch operations: an entity carrying `pending-dispatch: t` triggers a rule whose conclusion is "run dispatch on this entity's fiber against the candidate set."
  The dispatch produces its own ranking events; the heartbeat's cycle records both the rule firing AND the dispatch results.

- **[Federation](../../teaching/explanations/federation.md).** A cycle MAY include federation merges: a peer's events arrive in the heartbeat's `federation`-channel inbox; the cycle's tick on the receiving entity composes the peer's claims via $\vee_k$.
  Per [event-sourcing](teaching/explanations/event-sourcing.md), the federation merge produces its own events; the cycle witnesses them.

## Failure modes

- **Selection-set ordering cycle.** Two registered entities mutually depend per [declared-dependency-ordering](../../declared-dependency-ordering/declared-dependency-ordering.md).
  The cycle's ordering produces $\top$ on the ordering fiber.
  Per the heartbeat's policy: admit (run in canonical-hash order, accept eventual-consistency) or escalate (emit `guard` diagnostic naming the cycle, abort).
- **Tick failure (per-entity).** An `advance-tick` aborts (rule-system unavailable, entity not loadable).
  The cycle records the failure in the per-tick witness, deregisters the entity (with a flag for follow-up), and continues with remaining ticks.
  The cycle does not abort.
- **Cycle-level wall-clock exhaustion.** The cycle exceeds the realization's allowed wall time.
  Abort the remaining ticks; emit the partial cycle witness with the `aborted-by: wall-clock` predicate; emit a `guard` diagnostic.
- **Substrate-edit during cycle.** A concurrent edit (from another heartbeat or a manual edit) changes substrate content mid-cycle.
  Per [event-sourcing](teaching/explanations/event-sourcing.md)'s total ordering, the edit's event is interleaved with the cycle's tick events by append time; the cycle's witness chain reflects the actual interleaving; replay reproduces it.

## Position

`heartbeat-cycle` is the morphism that *makes the substrate live*.
Without cycles, FARS is a static catalog of entities, rules, and events.
With cycles, FARS is a processing system: ticks fire, fibers change, events accumulate, the substrate evolves over time.
The cycle is what closes the loop from "what the substrate IS" back to "what the substrate becomes."

The morphism realizes AgOP's [heartbeat](../../teaching/explanations/heartbeat.md) at FARS's value-domain.
Per the AgOP discipline, a heartbeat is "the loop that selects unsettled entities and emits ticks at them"; FARS's `heartbeat-cycle` is one iteration of that loop, with `advance-tick` as the per-entity work and the cycle's selection-and-ordering machinery as the substrate-content-driven control.
