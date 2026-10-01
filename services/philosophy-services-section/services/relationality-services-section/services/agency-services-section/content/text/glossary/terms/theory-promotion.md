---
type: morphism
class: substrate-operation
status: settled
depends-on:
  - teaching/explanations/staging-area.md
  - teaching/explanations/theory-directory.md
  - ../objects/relation-graph.md
see-also:
  - ../specifications/theory-discipline.md
  - questions/what-makes-a-directory-a-theory.md
name: Theory promotion
description: The substrate operation that promotes a directory from staging-area to theory-directory once the theory-discipline's six requirements hold.
---

# Theory promotion

The substrate operation that promotes a directory from [staging-area](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/knowledge-science/systems/archive/teaching/explanations/staging-area.md) to [theory-directory](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/knowledge-science/systems/archive/teaching/explanations/theory-directory.md) once the [theory-discipline](../../documents/articles/specifications/theory-discipline.md)'s six requirements hold. Theory promotion is the closure step that turns "real work in progress" into "an established theory the corpus loads on."

## Signature

$$\mathrm{promote}: (\mathrm{Directory}_{\mathrm{staging}}, \mathrm{DisciplineWitness}) \to (\mathrm{Directory}_{\mathrm{theory}}, \mathrm{RelationGraphDelta})$$

reading: given a staging-area and a witness that the six discipline requirements hold (concrete pointers to the directory's subject statement, its concepts, its objects-and-morphisms, its claims, its visible open work, and its front door), produce the promoted theory-directory and the set of relation-graph edits that update inbound references to drop the "the staging-area at" qualification.

## Operational semantics

Promotion performs four operations:

1. **Verify the witness.** Each of the six discipline requirements must hold and be checkable. The witness is concrete: a paragraph in `_index.md` naming the subject; the population of `concepts/` with at least one own concept note; the population of `objects/` and `morphisms/` with at least one own object and morphism; at least one claim in `theorems/` (sketch or higher); at least one question in `questions/` or a "Status" section in `_index.md` naming the open work; the `_index.md` itself as the front door. A directory missing any of the six is not promoted; the gap is named.
2. **Rewrite the `_index.md`.** The promoted theory's front door declares the discipline: drops any "staging-area" qualification, names the theory's position in its parent's child-list, declares `depends-on:` against any theory it loads on, lists the canonical layout. The pre-promotion `_index.md` is rewritten in place; no archival copy is kept (the version-control log is the archive).
3. **Update inbound references.** Find every note that referenced the directory as a staging-area (e.g., "the staging-area at `foo/`") and rewrite each reference to drop the qualification ("the `foo` theory"). The reference rewrite is mechanical at the syntactic level but should be reviewed for sense.
4. **Record the promotion.** A one-line entry in the captain's curation log naming the directory, the witness's six requirements, and the date. This is the corpus-level audit trail; it is not a separate audit document inside the library (audit documents inside the library are a defect).

## Invariants

- **Promotion does not require completeness.** A theory-directory may have one concept, one object, one morphism, one theorem, and one question and still be a theory. The discipline is not "this theory has finished its work"; it is "this theory has begun in a way that other theories can now load on."
- **Promotion is monotonic in coverage.** A theory-directory grows; it does not shrink back below the discipline's threshold without explicit demotion. Demotion is rare and requires a captain decision.
- **Promotion is local.** A theory's promotion does not require its parent or children to be promoted. The corpus contains theory-directories nested inside containers nested inside theory-directories.

## Position in the substrate

Theory promotion is the markdown-vault realization of the substrate's *fixed-point operator at the directory level*: the directory's content keeps changing under iterated curation, but at the moment the six requirements hold, the directory's substrate-status crosses a threshold and the substrate's typing of the directory changes from `staging-area` to `theory-directory`. The morphism does not produce the change; it *recognizes* and *records* the change that the prior curation work has already produced.
