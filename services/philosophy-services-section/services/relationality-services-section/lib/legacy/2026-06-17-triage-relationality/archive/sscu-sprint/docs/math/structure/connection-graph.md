---
title: Connection Graph
role: structure
fields:
- name: steps
  type: trace
  description: set of step records `{step_id, op_id, signature}`.
- name: ports
  type: port-set
  description: typed input/output ports derived from step signatures.
- name: edges
  type: edge-set
  description: directed edges `{edge_id, from_port, to_port, carrier_id}`.
- name: metadata
  type: trace
  description: optional policy/discipline annotations for later checks.
 proof_refs:
 - operator-signature
 - port-set
 - edge-set
introduces: structure
part-of: relational-computer
computer-system-type: primitive
---


Typed directed multigraph whose nodes are earned operator invocations with
typed input/output ports, and whose edges connect compatible ports. It is the
raw plan before acyclicity and scheduling checks.

## Definition
- `steps`: set of `{step_id, op_id, signature}` where `signature` is an
  [Operator Signature](operator-signature.md).
- `ports`: [Port Set](port-set.md) derived from `steps`, each port labelled
  with `{port_id, step_id, direction ∈ {in,out}, carrier_id}`.
- `edges`: [Edge Set](edge-set.md) of `{edge_id, from_port, to_port, carrier_id}`.
- `metadata`: optional policy/discipline annotations for later checks.

## Invariants
- Port typing: each port carrier is drawn from its step’s operator signature.
- Edge typing: each edge connects ports with identical carrier ids.
- Step identity: step ids are unique; ports are unique per step.
- Totality not yet required (multiple edges or cycles allowed at this stage).

## Proof
- Uses: earned operator signatures to generate ports and expected carrier types
  and to label edges with carriers.
- Shows that: packaging steps, ports, and edges with carrier annotations yields
  a well-typed graph ready for further refinement (typing checks, acyclicity,
  scheduling) into a wiring plan; the graph is earned from operator
  interactions, not assumed from a base act.
