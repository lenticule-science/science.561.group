---
title: Traceability Graph Simulation
tags:
  - simulation
  - traceability
  - dependency
depends_on:
  - theorem/internal/module-wiring
  - theorem/internal/policy-stack
---
# Specification (Traceability Graph Simulation)

Implements the dependency discipline enforced by **Theorem (Module Wiring)** and
**Theorem (Policy Stack)**.  The simulation emits/validates a DAG whose nodes
are acts, theorems, specifications, and architecture plans, ensuring every edge
is justified and policy-compliant.

## State representation

- **Node catalog.**  
  Store each document as a node with metadata: `id`, `type`, `path`,
  `frontmatter`, and policy tags.

- **Edge table.**  
  Directed edges labelled by justification (`depends_on`, `operation`, etc.).
  Every edge records whether it arises from an act relation (top/bottom) or a
  document dependency.

- **Policy ledger.**  
  For nodes tagged with policy disciplines, capture approvals and audit trails,
  ensuring rewrites follow the policy stack.

## Inputs

1. Parsed frontmatter from acts, theorems, specs, and architecture docs.
2. Canonical act-top/bottom relations from the theorem layer.
3. Policy annotations (e.g., which documents require approvals).

## Procedures

1. **Graph construction.**  
   Insert/update nodes, generate edges according to the module wiring rules,
   deduplicate IDs, and attach top/bottom edges for acts.

2. **Policy validation.**  
   Before accepting new edges, check the policy ledger; reject changes lacking
   proper authorization or missing required tags.

3. **Reachability checks.**  
   Ensure every architecture node reaches at least one act via specs/theorems;
   flag cycles or missing support as violations.

4. **Export.**  
   Emit JSON/DOT bundles for visualization and downstream consumers.

## Invariants

- Graph is acyclic and every act referenced by a document exists in the node
  catalog.
- Each dependency edge is justified by the module-wiring rules (no architecture
  → act shortcuts).
- Policy ledger entries exist for every privileged node mutation.

## Outputs

- Validated DAG files (JSON/DOT/SVG).
- Policy/audit reports for each graph update.
- Diagnostics for missing nodes, cycles, or unauthorized edges.
