---
type: concept
class: typing
status: settled
depends-on:
  - note.md
  - ../../../../predicated-knowledge-systems/concepts/predicate-category-stratification.md
see-also:
  - ../specifications/note-types/_index.md
  - questions/concept-vs-object-disambiguation.md
  - ../theorems/typed-kinds-mutually-exclusive.md
  - channel.md
title: Note-type
description: "The note-type of a note is the typed kind it declares via its type: frontmatter field, drawn from a small closed family: concept, object (with type: definition), morphism, theorem, question, narrative, example, reference."
---

# Note-type

The **note-type** of a [note](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/knowledge-science/systems/archive/note.md) is the typed kind it declares via its `type:` frontmatter field, drawn from a small closed family: `concept`, `object` (with `type: definition`), `morphism`, `theorem`, `question`, `narrative`, `example`, `reference`. The family is closed not by stipulation but by the discipline's claim that these are the kinds a typed knowledge artifact can be *under the predication-cell substrate*; new types are added only when a structural role appears that none of the existing types can carry.

## What the type declares

The type fixes three things at once:

1. **The note's role in the relation graph.** A `concept` is a `realizes:`-target, a `theorem` is a `depends-on:`-target with a claim-and-evidence body, an `object` is a definition that one or more concepts realize, etc. The relation graph's edge-validity rules (no `realizes:` edge to a non-concept, no `instantiates:` edge to a non-object) are stated in terms of types.
2. **The note's body conventions.** Each type has a normative body shape under [specifications/note-types/](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/knowledge-science/systems/specifications/note-types): a `theorem` has `## Statement / ## Proof`, a `reference` has `## Source / ## Form / ## Content summary / ## Position in the corpus`, a `question` has position-and-stake plus acceptance criteria. The conventions are pragmatic — see [audience-and-pragmatics-of-each-note-type](../../documents/articles/learning-articles/questions/audience-and-pragmatics-of-each-note-type.md) — not arbitrary.
3. **The note's audience.** A `concept` addresses the reader who needs to know what role this anchor plays; an `object` addresses a reader checking a proof; a `narrative` addresses a reader walking a path. Audience is a frontmatter-implicit commitment that the type carries.

## Discrimination

The hardest discrimination is `concept` vs. `object` — the load-bearing instance of the typing question. The discipline (see [concept-vs-object-disambiguation](../../documents/articles/learning-articles/questions/concept-vs-object-disambiguation.md) and [specifications/note-types/concept.md](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/knowledge-science/systems/specifications/note-types/concept.md), [specifications/note-types/object.md](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/knowledge-science/systems/specifications/note-types/object.md)) is: a concept is a *semantic anchor* that things `realize`; an object is a *mathematical structure* that does the realizing. The directory pair is `concepts/` and `objects/`; a note in `objects/` carries `type: definition` (the typing-system carryover from predication-categories) but plays the object role.

The mutual exclusion of types is a structural claim, proved (for the typed family) under the discrimination rules — see [typed-kinds-mutually-exclusive](typed-kinds-mutually-exclusive.md).

## Position in the substrate

Note-types stratify the predicate vocabulary the way [predicate-category-stratification](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/predicated-knowledge-systems/concepts/predicate-category-stratification.md) stratifies the substrate's predicate category. Each type admits a different sub-vocabulary of relations: `realizes:` is admissible from `object` to `concept`, not the other way; `instantiates:` is admissible from any typed note to a typed-note target whose role it materializes; `discusses:` is liberal across types. The discipline's conformance rules are typing rules on the predicate vocabulary.
