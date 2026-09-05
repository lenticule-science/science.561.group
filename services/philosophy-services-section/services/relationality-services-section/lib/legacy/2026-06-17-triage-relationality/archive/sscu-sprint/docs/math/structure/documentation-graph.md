---
title: Documentation Graph
role: structure
derived_from:
- acts/structure
proof_refs: []
introduces: structure
part-of: relational-computer
computer-system-type: primitive
---



The **Documentation Graph** is the system-level structure whose nodes are
documentation artefacts and whose edges are their declared dependencies.

## Definition
- Nodes: documentation files participating in the relational computer:
  - acts in `docs/math/acts/`,
  - math structures/operators,
  - system/machine/computer/program structures/operators.
- Edges: typed dependency relations (e.g., `derived_from`, `uses`, `produces`)
  declared in frontmatter.

## Invariants
- Each edge respects layer ordering (no upward deps).
- Each node belongs to exactly one layer (`act`, `math`, `system`, `machine`,
  `computer`, `program`).

## Proof
Refines the generic structure act to the documentation corpus, interpreting
nodes as docs and edges as declared dependencies. Layer invariants follow from
the linter-enforced rules.
