---
name: happens-before
role: structure
proof_refs: []
introduces: structure
part-of: relational-computer
computer-system-type: primitive
---



Partial order capturing causality for concurrent flows and observations.

## Definition
- Elements: events/observations in a [Trace Shuffle Class](trace-shuffle-class.md)
  plus [Message Channel](message-channel.md) ordering.
- Relation: transitive closure of program order within traces and send→receive
  edges on channels.

## Invariants
- Partial order: reflexive, antisymmetric, transitive.
- Shuffle stability: relation is invariant under shuffle-equivalent interleavings.

## Proof
- Uses: trace/shuffle and channel ordering to define causality.
- Shows that: causality can be encoded as a happens-before relation for concurrency semantics.
