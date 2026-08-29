---
title: Collect Snapshot State
id: collect-snapshot-state
role: operator
status: plan
inputs:
- id: recognition
  alias: recognitions
- id: evaluation-state
  alias: eval-state
outputs:
- id: snapshot
  alias: snapshot
- id: failure-carrier
  alias: failure
transformation:
- call
  - read-snapshot-state
  - recognitions
  - eval-state
proof_refs:
- recognition
- evaluation-state
- snapshot
- failure-carrier
- read-snapshot-state
---


# Collect Snapshot State

## Definition
- Inputs: [Recognition Carrier](../structure/recognition.md), [Evaluation State](../structure/evaluation-state.md).
- Outputs: [Snapshot](../structure/snapshot.md) content or [Failure Carrier](../structure/failure-carrier.md).
- Behaviour: reads current recognitions and evaluation state to produce snapshot content compatible with the snapshot schema. Emits `FailureCarrier` if state cannot be read or is inconsistent.

## Invariants
- Point-in-time consistency: recognitions and evaluation state are captured without interleaving mutations.
- No mutation of inputs; failures leave state unchanged.

## Proof
- Uses: machine state read, validation, and snapshot construction.
- Shows that: collecting machine carriers yields snapshot content or an explicit
  failure when state is inconsistent.
