---
type: morphism
class: substrate-operation
status: settled
depends-on:
  - ../objects/typed-note-as-predication-cell.md
  - ../objects/relation-graph.md
  - teaching/explanations/note-type.md
see-also:
  - ../specifications/term-to-typed-migration.md
  - questions/term-to-typed-migration-discipline.md
---

# Term-to-typed migration

The substrate operation that promotes a `type: term` note to its typed successor — `concept`, `object` (definition), `reference`, `narrative`, or, in the rare case it does not belong in the corpus, deletion. The corpus carries ~2,054 `type: term` notes inherited from the older lexical/encyclopedic vocabulary; the migration morphism is what brings them under the typed discipline.

The full normative specification is at [specifications/term-to-typed-migration](../specifications/term-to-typed-migration.md).

## Signature

$$\mathrm{migrate}: (\mathrm{Note}_{\mathrm{term}}, \mathrm{Type}, \mathrm{TargetDir}) \to (\mathrm{Note}_{\mathrm{typed}}, \mathrm{RelationGraphDelta})$$

reading: given a term-note, the type to promote it to, and the canonical target directory (per `fars where <type> <slug>`), produce the typed-note replacement and the set of relation-graph edits required to keep the substrate consistent (rewrite inbound `depends-on:` and `see-also:` references; collapse `aliases:` into `see-also:` to the slug; remove now-superfluous edges).

## Operational semantics

A correct migration performs five operations atomically (in one curation move):

1. **Read substantively.** Per CLAUDE.md's "Don't write notes you don't understand": the migrator reads the term's body and prior context until they can write a one-sentence statement of what role the term plays. If they cannot, the migration does not happen — the term is flagged for the captain.
2. **Determine the target type.** Apply the discrimination rules: anchor-role → concept; mathematical-structure-role → object/definition; bibliographic-role → reference; through-line-role → narrative; no-role-or-defect → deletion candidate.
3. **Author the typed note.** Write the new note with conformant frontmatter (per [specifications/note-types/<type>.md](../specifications/note-types/_index.md)) and a body that satisfies the type's body conventions. Carry forward the term's substantive content; do not hand-wave with a stub.
4. **Rewrite inbound references.** Find every note that references the term-slug; rewrite each reference to point at the typed-slug at the new path. Use `aliases:` on the new note for any inbound references the migrator wishes to preserve as historical anchors.
5. **Remove the term file.** The term-note is deleted (or, if the migrator deems the rename sufficient, the file is moved and its `type:` is updated in place — both forms count as the morphism's application; the relation-graph state after is what matters).

## Invariants

- **Substrate idempotence.** Migrating an already-typed note is a no-op (the discrimination produces the same type; the file is already in canonical position).
- **Reference preservation.** No inbound reference is lost. Every inbound edge to the old term-slug is either rewritten to the new typed-slug or explicitly captured by an `aliases:` entry on the new note.
- **No content loss.** The term's substantive content is carried into the typed note. Migrations that produce shorter notes than the source must surface that as a deliberate edit (e.g., factoring the term's anecdote out into a separate `example` note).
- **Type-correctness.** The chosen type satisfies the discrimination rules. A term migrated to `concept` must be a semantic anchor that other entities `realize`; if no entity realizes it, the migration is mis-typed and the captain is consulted.

## Position in the substrate

Term-to-typed migration is the substrate's *retypeing operator*: it takes a cell asserted under one (older) predicate vocabulary and re-asserts it under the typed predicate vocabulary, with the rewrite of inbound predications computed as the closure-rule application that keeps the substrate consistent. The morphism is the markdown-vault realization of the substrate's [closure-as-fitting-fixpoint](../../../../predicated-knowledge-systems/theorems/closure-as-fitting-fixpoint.md) at the editorial level: the corpus's settled state under the typed vocabulary is what the iteration of `migrate` across all term-notes produces.
