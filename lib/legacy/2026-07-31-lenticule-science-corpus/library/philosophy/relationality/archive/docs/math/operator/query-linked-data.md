---
title: Query Linked Data
id: query-linked-data
role: operator
status: someday
derived_from: computer/function/evaluate-step
inputs: []
outputs: []
transformation:
- return
- value
proof_refs: []
---


# Query Linked Data

Executes queries over the internal [Linked Data Graph](../type/linked-data-graph.md).

## Definition
- Inputs: graph reference and query (e.g., SPARQL pattern).
- Outputs: results encoded as a [Linked Data Graph](../type/linked-data-graph.md)
  fragment or [Computer Failure](../../type/computer-failure.md).
- Behaviour: evaluates the query against stored triples/quads, producing a
  recognised subgraph or failure on malformed queries/policy violations.

## Invariants
- No mutation; read-only access to the graph.
- Policy: queries respect access constraints; failures emitted on violation.
- Deterministic: same graph/query yields same result.

## Proof
- Derived from: [Computer Evaluate Step](../../function/evaluate-step.md),
  restricting to pure query evaluation over linked data.
