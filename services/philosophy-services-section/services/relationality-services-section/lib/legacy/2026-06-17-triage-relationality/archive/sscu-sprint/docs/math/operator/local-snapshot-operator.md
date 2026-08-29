---
title: Local Snapshot Operator
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



Captures local state with baseline remainder; no global context required.

## Definition
- Inputs: local [Persistent Context Carrier](../structure/persistent-context-carrier.md)
  and [Persistent Recognition Carrier](../structure/persistent-recognition.md).
- Output: local [Memory Carrier](../structure/memory-carrier.md) snapshot.
- Behaviour: record local contexts/recognitions, compute baseline remainder, and
  package for later global composition.

## Invariants
- Consistency: snapshot reflects a self-consistent local state.
- Non-intrusive: does not alter local state; pure capture.

## Proof
- Uses: persistent carriers to build local snapshot.
- Produces: [Memory Carrier](../structure/memory-carrier.md).
- Shows that: local snapshots are well-defined building blocks for distributed
  consistency.
