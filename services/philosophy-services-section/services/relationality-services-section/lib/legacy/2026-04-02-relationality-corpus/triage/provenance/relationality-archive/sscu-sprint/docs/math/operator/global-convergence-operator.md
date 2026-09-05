---
name: global-convergence-operator
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



Combines local snapshots into a consistent global recognition of state.

## Definition
- Inputs: local snapshots from [Local Snapshot Operator](local-snapshot-operator.md)
  and coordination via [Snapshot Protocol](snapshot-protocol.md).
- Output: global [Memory Carrier](../structure/memory-carrier.md) representing
  a consistent system snapshot.
- Behaviour: reconcile local snapshots, align channel states, and assemble into
  a coherent global memory.

## Invariants
- Consistency: respects causality; no partial messages missing.
- Idempotent: recombining already-consistent snapshots yields the same global
  state.

## Proof
- Uses: local snapshots plus snapshot protocol coordination.
- Produces: global memory carrier.
- Shows that: distributed state can be converged into a consistent global
  recognition.
