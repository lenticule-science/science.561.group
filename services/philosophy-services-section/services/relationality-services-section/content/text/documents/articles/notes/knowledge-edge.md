---
title: Knowledge Edge
id: knowledge-edge
role: structure
status: plan
proof_refs: []
derives-from: math/structure/trace
description: Edges identify a source/destination knowledge node and an act-justified edge type, plus trace/topology/policy/audit context.
---



Edges identify a source/destination knowledge node and an act-justified edge
type, plus trace/topology/policy/audit context. Edge records live in the
relational state.

## Definition
- Carrier: connects two [Knowledge Nodes](./knowledge-node.md) with an
  act-justified edge type, trace span, and policy/audit metadata.
- Fields: source node, destination node, edge type, justification acts, trace
  context, tags/policy.

## Invariants
- Node validity: endpoints must be valid knowledge nodes.
- Traceability: edges carry trace spans for provenance.
- Policy coherence: edge tags/policy align with node policies.

## Proof
- Derived from: [Trace Carrier](undated/trace.md) to attach
  sequencing/provenance.
- Uses: [Knowledge Node](./knowledge-node.md) as endpoints.
- Shows that: wiring recognitions with justified edges yields a knowledge edge
  carrier suitable for the system knowledge graph.
