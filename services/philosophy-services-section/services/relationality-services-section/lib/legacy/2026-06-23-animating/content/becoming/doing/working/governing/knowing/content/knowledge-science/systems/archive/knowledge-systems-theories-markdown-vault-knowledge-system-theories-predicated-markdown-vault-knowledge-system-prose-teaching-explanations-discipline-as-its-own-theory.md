---
type: narrative
status: current
discusses:
  - ../_index.md
  - ../teaching/explanations/note.md
  - ../teaching/explanations/note-type.md
  - ../teaching/explanations/theory-directory.md
  - ../teaching/explanations/staging-area.md
  - ../objects/typed-note-as-predication-cell.md
  - ../objects/relation-graph.md
  - ../morphisms/theory-promotion.md
  - ../specifications/_index.md
introduces:
  - ../teaching/explanations/theory-directory.md
  - ../specifications/note-types/_index.md
see-also:
  - ../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/_index.md
  - ../../../../../../../../../engineering/theories/tech/theories/computing/theories/predicated-computing/README.md
---

# The discipline that governs the library is itself a theory in the library

There is an obvious-once-stated awkwardness about a research repository whose curation conventions live in a `CLAUDE.md` at the root or a `replit.md` in the project description. Conventions written in those forms are *commands*: do this, don't do that. They are not theories: they do not have concepts that other notes can `realize`, objects that other notes can `instantiate`, theorems that other notes can `depend-on`, or questions that other notes can `close`. They cannot be cited, audited, or extended by the same discipline they purport to enforce.

This theory — the predicated markdown-vault knowledge system — exists to fix that. The curation discipline that governs `library/` is lifted into `library/` itself, treated as a research subject in its own right, with its own concepts, objects, morphisms, theorems, and open questions. Every note in the corpus is then both a contribution to its own subject *and* an instance of this theory. Every directory in `theories/` is both an organization of subject matter *and* an instance of this theory's [theory-directory](../teaching/explanations/theory-directory.md) versus [staging-area](../teaching/explanations/staging-area.md) discrimination. Every frontmatter relation is both a navigational link *and* an instance of this theory's [frontmatter-relation](../teaching/explanations/frontmatter-relation.md) vocabulary.

## What lifting accomplishes

Three things follow from lifting the discipline into a theory:

**The discipline becomes citable.** A checklist in `CLAUDE.md` or a freeform conventions doc cannot be cited by a typed note: it is the wrong shape. The same content as a typed [object](../objects/typed-note-as-predication-cell.md) or [morphism](../morphisms/term-to-typed-migration.md) note can be cited via `depends-on:` from any note in the corpus that loads on it, and the FARS toolkit's relation graph then resolves the dependency and validates that it points where it claims to point.

**The discipline becomes auditable by its own rules.** The predicated markdown-vault knowledge system's [theory-directory](../teaching/explanations/theory-directory.md) discipline commits to six requirements a directory must satisfy to count as a theory. The directory containing this very theory must satisfy those six requirements. If it does not, the theory is honest: it is a staging-area on the way to becoming a theory, and the staging-area is what readers should load on. The discipline cannot exempt itself from its own commitments without losing its standing as a discipline.

**The discipline becomes extensible by research moves.** When the corpus discovers a tension — say, that the `concept` versus `object` distinction has hard cases the current discrimination rules cannot resolve — that tension goes into [questions/](../learning/questions/) as a typed [question](../specifications/note-types/question.md), with `explores:` edges to the affected concepts. The question accumulates attempts, examples, counterexamples; eventually a settling decision lands as a spec update or a new theorem. This is research discipline applied to the curation discipline. A `CLAUDE.md` cannot host research; a theory can.

## What this theory lifts from

The lifting is not novel. Two existing theories — [predication-categories](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/_index.md) and [predicated-computing](../../../../../../../../../engineering/theories/tech/theories/computing/theories/predicated-computing/README.md) — already carry this discipline implicitly in their `_index.md` convention blocks. Predication-categories' `_index.md` reads as a partial first-person specification of what this theory says: which note types exist, what the typing rules on relations are, what the discrimination between concept and object looks like in practice. The predicated-computing README does the same in an engineering register.

What this theory does is *generalize* that lift: rather than each gold-standard theory carrying its own copy of the convention, the convention lives once at the curation theory and the gold-standard theories `depend-on:` it. The convention then becomes the load-bearing artifact rather than a per-theory restatement. New theories can inherit the convention by declaring the dependency rather than by copying paragraphs.

