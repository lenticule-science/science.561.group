---
title: Documentation Snapshot
kind: structure
layer: program
status: someday
uses: []
produces: []
used_by:
  - program/documentation/structure/documentation-workspace
derives-from:
  - machine/structure/snapshot
produced-by: []
description: A Documentation Snapshot is a program-layer refinement of the machine Snapshot whose payload is an arbitrary documentation corpus and its dependency graph.
---

A **Documentation Snapshot** is a program-layer refinement of the machine
[Snapshot](../snapshot.md) whose payload is an arbitrary
documentation corpus and its dependency graph. Our repository is one such
corpus; the carrier is defined independently of its contents.

## Carrier
- **Corpus:** the set of documentation files (acts, math, calculus, system,
  machine, computer, program).
- **Graph:** dependency edges (`derived_from`, `uses`, `produces`) between
  documentation nodes.
- **Metadata:** per-file frontmatter and link table ensuring every noun is
  bound to an earned doc.

## Invariants
- Snapshot is closed under links: every linked doc is present in the corpus.
- Graph respects layer ordering (no upward edges).
- Frontmatter is well-formed (`title`, `kind`, `layer`, `status`, deps).

## Proof
Refines [machine/structure/snapshot.md](../snapshot.md) by
restricting contents to documentation artefacts and enriching the payload with
link and dependency metadata. The refinement preserves machine snapshot
semantics (load/save, integrity) while narrowing the domain to documentation
state.
