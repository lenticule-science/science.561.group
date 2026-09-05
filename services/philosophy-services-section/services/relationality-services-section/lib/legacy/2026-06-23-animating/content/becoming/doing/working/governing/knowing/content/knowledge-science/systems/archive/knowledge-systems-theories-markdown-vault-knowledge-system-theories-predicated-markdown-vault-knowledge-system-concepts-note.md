---
type: concept
class: substrate-unit
status: settled
depends-on:
  - ../../../../predicated-knowledge-systems/concepts/aboutness.md
  - ../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/predication-cell.md
see-also:
  - note-type.md
  - slug.md
  - frontmatter-relation.md
  - ../specifications/note-types/_index.md
  - ../../teaching/explanations/vault.md
  - ../../teaching/explanations/files-are-source.md
  - ../../teaching/explanations/frontmatter-is-structured-data.md
---

# Note

A **note** is the unit of substrate content in a markdown-vault knowledge system: one markdown file with a YAML frontmatter block and a prose body, identified by its [slug](slug.md) within its directory, declaring its kind via [note-type](note-type.md), and participating in the relation graph via [frontmatter-relations](frontmatter-relation.md).

Two commitments are load-bearing:

1. **One entity per file.** A note carries exactly one typed predication target — one concept, one object, one theorem, one question, one reference. A file that "covers two related concepts" is two notes that have not yet been split. The corpus's `fars where <kind> <slug>` lookup, the relation graph's edge-resolution, and the renderer's per-page navigation all assume the file-to-entity bijection.

2. **One file per entity.** The same entity is not represented by two notes in different directories. Aliases live in frontmatter (`aliases:`); cross-references live in `see-also:` and `instantiates:` edges; redundant copies are a curation defect. This is the markdown-vault analogue of the substrate's [identity-by-relations](../../../../../../../../../engineering/theories/tech/theories/computing/theories/predicated-computing/concepts/identity-by-relations.md) discipline.

## Position in the substrate

A note is the markdown-vault realization of a [predication-cell](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/predication-cell.md). Its frontmatter is the cell's predicate-vocabulary participation; its body is the prose evidence that grounds the cell's value in the bilattice. A note's `status:` field is the cell's settled value (`sketch` ≈ partial, `draft` ≈ asserted-but-unwitnessed, `settled` ≈ stable, `pending` ≈ acknowledged but unread). The substrate's [closure-rule system](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/closure-rule-system.md) acts on the relation graph notes participate in.

