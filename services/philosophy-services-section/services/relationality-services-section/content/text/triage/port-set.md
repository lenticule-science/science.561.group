---
title: Port Set
id: port-set
role: structure
status: plan
proof_refs:
- operator-signature
fields:
- name: ports
  type: trace
  description: list of `{port_id, step_id, direction ∈ {in,out}, carrier_id}`.
- name: signatures
  type: trace
  description: optional back-reference from ports to their inducing operator signatures.
- name: policy
  type: trace
  description: optional discipline/filter annotations per port.
---


Carrier for the collection of ports in a connection graph or wiring plan,
including their types, directions, and policy annotations.

## Definition
- `ports`: list of `{port_id, step_id, direction ∈ {in,out}, carrier_id}`.
- `signatures`: optional back-reference to [Operator Signature](operator-signature.md)
  that induced the port typing.
- `policy`: optional discipline/filter annotations per port.

## Invariants
- Direction: each port direction is either `in` or `out`.
- Typing: `carrier_id` is earned; for ports induced from signatures, the type
  matches the signature’s corresponding input/output position.
- Uniqueness: `(step_id, port_id)` pairs are unique.

## Proof
- Uses: [Operator Signature](operator-signature.md) to induce port typings on
  steps in a [Connection Graph](connection-graph.md).
- Shows that: collecting ports with their types/directions and policy
  annotations yields a reusable set for typing and wiring checks; no unearned
  defaults are assumed.
