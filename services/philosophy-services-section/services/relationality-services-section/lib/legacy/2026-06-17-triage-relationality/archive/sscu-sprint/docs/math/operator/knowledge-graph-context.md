---
title: Knowledge Graph Context
role: Attach trace/topology/policy/audit context to knowledge graph nodes/edges.
inputs:
- id: knowledge-node
  name: nodes
- id: knowledge-edge
  name: edges
- id: trace
  name: trace
- id: policy-regime
  name: policy
outputs:
- id: knowledge-node
  name: nodes'
- id: knowledge-edge
  name: edges'
transformation:
- return
- value
proof_refs: []
introduces: operator
part-of: relational-computer
computer-system-type: primitive
---



Attaches trace IDs, topology constraints, policy regimes, and audit trails to
knowledge graph nodes/edges to form a typed, constrained directed graph whose
elements trace back to earned acts and contexts.

## Proof
- Uses: node/edge annotation operators to attach trace/policy metadata.
- Shows that: contextualising nodes/edges yields a knowledge graph with
  provenance and policy constraints recorded.
