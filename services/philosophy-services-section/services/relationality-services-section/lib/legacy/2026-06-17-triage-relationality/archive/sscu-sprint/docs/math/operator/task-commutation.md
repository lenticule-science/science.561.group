---
title: Task Commutation
role: operator
inputs: []
outputs: []
transformation:
- return
- value
proof_refs: []
introduces: operator
part-of: relational-computer
computer-system-type: primitive
---



Lifts the math-layer task commutation act to the calculus layer, parameterised
by the indexed trace.

## Definition
- Inputs: the [Trace Carrier](../structure/trace.md) describing ordered
  effects across contexts.
- Outputs: an updated [Trace Carrier](../structure/trace.md) annotated
  with the commutation relation on tasks whose effects do not interfere.
- Behaviour: identifies pairs of tasks whose effects commute (no shared writes
  or interfering reads in the trace) and marks them as reorderable within the
  indexed trace.

## Invariants
- Soundness: only tasks with non-interfering effects are marked commuting.
- Closure: commutation is symmetric and closed under reindexing of the trace.
- Ordering preservation: non-commuting tasks retain their enforced order.

## Proof
- Uses: [Task Commutation](task-commutation.md) criteria over the
  [Trace Carrier](../structure/trace.md) to decide reorderability.
- Shows that: parameterising by the trace carrier preserves interference
  analysis and yields a commutation relation used by schedulers.
