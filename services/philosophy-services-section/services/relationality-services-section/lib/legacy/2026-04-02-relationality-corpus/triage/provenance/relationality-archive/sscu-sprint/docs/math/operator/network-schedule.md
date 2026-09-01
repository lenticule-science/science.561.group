---
name: network-schedule
role: Schedule tasks over a network topology respecting trace and wiring constraints.
inputs:
- id: network-topology
  name: topology
- id: network-channel
  name: channels
- id: task-carrier
  name: tasks
- id: trace
  name: trace
outputs:
- id: task-carrier
  name: scheduled
transformation:
- return
- value
proof_refs: []
introduces: operator
part-of: relational-computer
computer-system-type: primitive
---



Orders tasks attached to ports/channels in a way that respects the trace spine,
port compatibility, and scheduling dependencies.

## Proof
- Uses: task precedence/parallelization plus topology-aware ordering to produce
  a schedule consistent with trace and wiring constraints.
- Shows that: the resulting schedule can be executed without violating
  dependencies or port/channel compatibility.
