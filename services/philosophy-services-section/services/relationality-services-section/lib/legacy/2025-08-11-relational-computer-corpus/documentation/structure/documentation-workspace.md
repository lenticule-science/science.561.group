---

name: documentation-workspace
layer: program
derived_from: computer/structure/relational-state
uses: []
produces: []
used_by:
  - program/documentation/operator/documentation-measure
  - program/documentation/operator/documentation-nucleation
produced_by:
  - program/documentation/operator/documentation-nucleation
---

Program-level projection of the computer relational state into a documentation
corpus: files, links, dependency graph, and metadata ready for measurement and
rewrite.

## Definition
- Carrier: projection of [Computer Relational State](../../../computer/structure/relational-state.md)
  containing documentation files, link graph, and frontmatter metadata.
- Fields: file contents, dependency edges (`derived_from`, `uses`, `produces`),
  link table, vocabulary/act references.
- Purpose: input/output state for measurement and nucleation steps.

## Invariants
- Link closure: every link points to a present doc; unresolved links are marked
  and surfaced as measurement issues.
- Layer discipline: dependency edges respect layer ordering.
- Frontmatter validity: files carry required metadata.

## Proof
- Derived from: [Computer Relational State](../../../computer/structure/relational-state.md).
- Shows that: specialising the relational state to documentation artefacts
  yields a workspace carrier suitable for measurement and rewrite while
  preserving kernel semantics.
