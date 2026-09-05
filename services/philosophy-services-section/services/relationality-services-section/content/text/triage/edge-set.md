---
title: Edge Set
id: edge-set
role: structure
status: plan
proof_refs:
- connection-graph
fields:
- name: edges
  type: trace
  description: list of `{edge_id, from_port, to_port, carrier_id}` referencing ports.
- name: metadata
  type: trace
  description: optional policy/integrity annotations per edge.
---


Carrier for the collection of directed edges between ports, annotated with
port endpoints and any integrity or policy metadata.

## Definition
- `edges`: list of `{edge_id, from_port, to_port, carrier_id}` referencing
  port ids in a [Port Set](port-set.md).
- `metadata`: optional policy/integrity annotations per edge.

## Invariants
- Typing: each edge’s `carrier_id` matches both endpoint port carrier ids.
- Direction: `from_port` is an output port; `to_port` is an input port.
- Uniqueness: edge ids are unique; no duplicate identical edges unless allowed
  by policy metadata.

## Proof
- Uses: [Connection Graph](connection-graph.md) edge data tied to typed ports.
- Shows that: packaging edges as a set supports typing and acyclicity checks
  needed for wiring plans; edges are earned from the graph rather than assumed.
