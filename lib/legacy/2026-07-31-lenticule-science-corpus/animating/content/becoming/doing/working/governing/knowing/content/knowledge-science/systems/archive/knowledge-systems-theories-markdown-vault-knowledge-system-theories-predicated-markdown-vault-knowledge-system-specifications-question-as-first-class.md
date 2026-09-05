---
title: "Questions as first-class research artifacts"
---


A *question* in this corpus is a typed research artifact: a [question note](note-types/question.md) that names an open problem, decomposes it structurally, cites the theorems / morphisms / examples that bound and witness it, and states explicitly what remains open.

This commitment is recent and load-bearing. It is one of the three things this convention spec lifts and amplifies from the recent gold-standard work — see [the specifications index](_index.md). This note states why questions are first-class, what discipline they carry, and how a theory's questions are integrated with the rest of its work.

## Why questions are first-class

The corpus's earlier discipline treated open work informally — TODOs in narratives, hand-waves at the end of theorems, deferrals to "future work" sections in READMEs. The new commitment is that this is a curation failure. Open work that lives only in prose is invisible to the toolkit, accretes silently, and produces theories that look complete but are not.

Three things change when questions become typed artifacts:

1. **Open work is queryable.** `fars` (or `grep`, or any other corpus-walking tool) can produce the list of all open questions across the corpus, the per-theory question density, the questions that are partially-resolved vs. fully-open, and the questions that point at a particular concept or theorem.

2. **Open work is decomposable.** A typed question carries a structural decomposition — by axis, by regime, by case, by layer. Each sub-question is itself a citable artifact. The question's body is the *plan* for resolving it; the corpus's progress is measurable as the per-axis status of the sub-questions.

3. **Open work attracts evidence.** A typed question with non-empty `explores:` and `depends-on:` is *connected* to the corpus's current machinery. Each new theorem or example can declare which question it bears on (via `realizes:` or `instantiates:`), and the question's "what is established" section grows as the corpus does.

## The discipline

Per [note-types/question](note-types/question.md), a question note SHOULD have:

- A precisely-stated question in the first paragraph — what is being asked, and what the answer would look like as a structural artifact.
- A `## Decomposition` section when the question admits structural decomposition. Most substantive questions do.
- A `## What is established` section listing the corpus's current bearings on the question — theorems with their statuses, examples that witness specific cases, morphisms that make pieces of the question precise.
- A `## What remains open` section naming the substantive open work as targets for future theorems / examples / constructions.
- A `## Why the question matters` section connecting the question to the rest of the theory.

The exemplar is [realizability-of-cohomology-classes](../../../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/questions/realizability-of-cohomology-classes.md) — read it to see what a fully-disciplined question note looks like.

## When to file a question

A new question note SHOULD be filed when:

1. A theorem proof reveals a gap that requires its own development. The gap becomes a question; the theorem's status drops to `sketch` or `draft` and cites the question. (Example: the converse direction of a realizability theorem turns into a structural induction gap, which becomes its own question.)

2. A theory's machinery becomes precise enough that a previously-vague question can be re-stated structurally. The new typed question replaces the vague hand-wave; older narratives that cited the hand-wave are updated to cite the new question.

3. A new application reveals a question the parent theory should answer. The question is filed in the parent theory (per [the cross-theory methodology in FARS's README](../../../../../../../../../../../engineering/theories/tech/theories/computing/theories/predicated-computing/theories/agential-orchestration-platform/theories/flatfile-agentic-resource-system/README.md#cross-theory-references)) with the application as motivation.

4. A scoping decision needs to be made — what should the theory commit to, what should it leave open. The question states the trade-offs and the candidates; resolution may be a charter-level decision rather than a proof.

## When *not* to file a question

- An implementation TODO. ("This function should handle the empty case.") Belongs in code, not the library.
- A note-to-self about something to look up. Belongs in scratchpad notes outside the library.
- A vague "I wonder if X is true" without a structural ask. If you cannot phrase the question precisely enough to decompose it, the question is not yet ripe — the right move is to develop the theory until the question becomes statable.
- A question whose answer would be a single named theorem. File a [theorem with `status: open`](note-types/theorem.md) instead — the theorem note carries the same evidence-collecting role with a tighter shape.

## Per-theory commitment

A theory's `questions/` directory SHOULD reflect the actual current state of its open work. A theory with one fully-decomposed question and three partially-formed ones is in better epistemic shape than a theory with no questions and the same actual gaps.

The minimum commitment for a theory that has earned [theory status](theory-discipline.md): a `questions/_index.md` that names the open frontiers, even when the per-question notes have not been written yet. The `_index.md` is a placeholder that signals "open work tracked here"; the per-question notes are filed as they ripen.

## Resolution

A resolved question SHOULD be marked `status: resolved` with a citation to what resolved it. Resolved questions stay in the corpus as historical record.
