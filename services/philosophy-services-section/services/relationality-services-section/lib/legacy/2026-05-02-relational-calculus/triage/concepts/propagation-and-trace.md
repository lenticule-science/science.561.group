---
name: propagation-and-trace
type: concept
status: sketch
---

A granular formalization of what becomes Movement III's [Flow](flow.md). Names the *mechanics* of directed motion before those mechanics are compressed into a single comonadic operator.

- **Propagation**: the movement of relational effects from one recognition to another. When a relational act (including, excluding, relating) occurs, its consequences do not remain local — they propagate through the field, affecting other recognitions.
- **Trace**: the record of a propagation — the path a relational effect follows. Records which recognitions were visited, which operations were applied, and the outcome at each step.

## Mechanics

- **PropagationEvent**: a triple $(\text{Source}, \text{Target}, \text{Operation})$ — a relational act applied from one recognition to another.
- **PropagationTrace**: a sequence of PropagationEvents with a TraceMap (ordered nodes visited) and a closure condition (when propagation halts or cycles).
- **Propagation classes**: linear (single chain), branched (effects split), cyclic (return to a visited node), localized (bounded region).
- **Trace invariants**: node identity, primitive acts, network topology — preserved throughout a trace.
- **Halt conditions**: all reachable recognitions visited, cycle detected, or no further valid operations.
- **ReflexivePropagationLoop**: a trace returning to its start — the recognition from which propagation began is itself affected. Connects to [reflexing](reflex.md).

## Directionality

Three modes:

- **Forward**: Source → Target, following the directed modality.
- **Backward**: Target → Source, reconstructing conditions.
- **Mutual**: both simultaneously — Source ↔ Target.

This introduces trace-level asymmetry within a system that is reflexively symmetric. The system as a whole is symmetric (any recognition can serve as source or target), but each individual propagation has a direction. This asymmetry is the precursor to Movement III's directed dynamics.

## How propagation evolves into Flow

| Granular (Propagation) | Compressed (Flow) |
|---|---|
| PropagationEvent | A single application of Flow |
| PropagationTrace | The comonadic extension (ComposeFlow) |
| Linear propagation | Flow along a single path |
| Cyclic propagation | Flow's KZ-laxity: $F(F(a)) \leq F(a)$ |
| Trace invariants | PreservesCore: Flow preserves the modal core |
| Forward / Backward | Left / Right Kan extensions |
| Halt condition | Fixed point: $F(a) = a$ (flow-active elements) |

The compression from propagation to Flow: propagation names the *mechanics* (events, traces, directions, invariants); Flow names the *structure* (a single operator with algebraic properties). The algebraic properties of Flow (KZ-lax idempotence, core preservation, comultiplication) encode all the propagation mechanics in a single formal package.

## Granularity within the act-algebra

The act-algebra also names the trace mechanics at a granular level: TraceStart, TraceAdvance, TraceContinuation, TraceWhole, TraceHead, TraceTail, TraceStep — these track how a derivation propagates through the space of recognitions. The implementation-level constructors of the generative closure algorithm use the same vocabulary. All three views (philosophical Propagation/Trace, act-algebra trace operations, comonadic Flow) describe the same phenomenon at different granularities.
