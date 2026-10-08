---
title: "Specifications"
component-of: predicated-markdown-vault-knowledge-system
description: Draft specifications of the predicated markdown-vault knowledge system — the theory whose discipline governs this corpus's curation.
---


Draft specifications of [the predicated markdown-vault knowledge system](../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/knowledge-science/systems/_index.md) — the theory whose discipline governs this corpus's curation. The files here are in-progress answers to the [questions](../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/knowledge-science/systems/archive/questions) the theory holds open; they are normative for `library/` insofar as those questions are stable, and provisional where they are not.

> **Working draft.** Individual specs mature from draft to settled as the corresponding questions in [questions/](../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/knowledge-science/systems/archive/questions) stabilize. Every commitment here SHOULD be replaced by something better when better is found.

The shape of these specs derives from the convention stated by [predication-categories' `_index.md`](../../research/2026/07/31/lenticule-import/animating/humanities/theories/math/theories/categories/theories/predication-categories/_index.md) — currently the most fully developed exemplar in the corpus — together with three commitments the curator is exploring:

1. **Theory layout for typed-note directories.** A directory of typed notes can take the [theory layout](../../specifications/theory-discipline.md) (concepts, objects, morphisms, theorems, questions, narratives, examples, references, plus an `_index.md`); see that file for the characterization of when this fits, and when a directory is better described as a staging area or container. Under-disciplined directories are *staging areas*, not theories, and should not present themselves as theories.
2. **Questions as typed notes.** Open work can live in `questions/` as typed notes that decompose the question structurally and cite the specific theorems / examples / morphisms that bound and witness it. See [question-as-first-class](../../specifications/question-as-first-class.md). Questions are not hand-wave; they are typed research artifacts.
3. **Operational skills citing a theoretical record.** A skill (a SKILL.md file in `governance/skills/<name>/`) can be treated as an *instance* of a theoretical `skill-record` object held by the theory that establishes the skill as possible. The theory that establishes the skill as possible holds the `skill-record` definition; the operational skill MUST cite that record. See [skill-colocation](../../specifications/skill-colocation.md).

## What this directory contains

- [note-types/](../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/knowledge-science/systems/archive/note-types) — one normative spec per note type. Each describes the frontmatter currently used, body conventions, when this corpus reaches for the type vs. alternatives, and the validation rules (informal here; some are lifted into FARS lint rules over time).
  - [concept](../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/knowledge-science/systems/archive/note-types/concept.md), [object](../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/knowledge-science/systems/archive/note-types/object.md), [morphism](../../../../../../../../../../../information-science-services-section/services/math-services-section/content/text/glossary/terms/morphism.md), [theorem](../../../../../../../../../../../engineering-science-services-section/services/computer-science-services-section/services/software-services-section/services/lean-services-section/content/text/glossary/terms/theorem.md)
  - [question](../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/knowledge-science/systems/archive/note-types/question.md), [narrative](../../../../../../../../../../../social-science-services-section/services/sociology-science-services-section/services/critical-theory-science-services-section/services/anarchism-services-section/services/anarchist-communication-services-section/content/text/glossary/terms/narrative.md), [example](../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/knowledge-science/systems/archive/note-types/example.md), [reference](../../../../../../../../content/text/glossary/terms/reference.md)
- [theory-discipline](../../specifications/theory-discipline.md) — when a directory earns being a *theory* with the canonical layout.
- [frontmatter-relations](../../specifications/frontmatter-relations.md) — the relation set this corpus currently uses, with the semantics and rendering treatment for `depends-on`, `realizes`, `see-also`, `introduces`, `recaps`, `discusses`, `instantiates`, `explores`, `closes`, `chapters`, `class`, `symbol`.
- [question-as-first-class](../../specifications/question-as-first-class.md) — the discipline for questions as typed research artifacts.
- [skill-colocation](../../specifications/skill-colocation.md) — how operational SKILL.md files bind to theoretical `skill-record` objects.
- [term-to-typed-migration](../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/knowledge-science/systems/archive/term-to-typed-migration.md) — how the older `term:` lexical notes get upgraded to the typed vocabulary, when, and at what cost.

## What this directory is not

- **Not a renderer spec.** The renderer (Hugo, the FARS render pipeline) implements parts of what is described here; it is not authoritative. The convention here is what the corpus commits to; the renderer follows. New questions track divergences.
- **Not a tool spec.** FARS the Python toolkit currently enforces a partial subset of these conventions via lint rules. New rules are derived from this spec; the spec is the source.
- **Not exhaustive.** Where this document is silent, the predication-categories convention is the working precedent, and a local theory's `_index.md` may say something different for its own subtree. Local extensions SHOULD be lifted here when they recur in three or more theories.

## Status

Living spec. Every commitment here SHOULD be replaced by something better when better is found. The goal is corpus coherence, not adherence to this document.
