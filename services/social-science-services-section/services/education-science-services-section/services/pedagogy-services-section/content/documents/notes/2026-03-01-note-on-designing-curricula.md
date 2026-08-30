---
title: Designing Curricula
description: "A methodology for organizing lessons into curricula by modeling them as dependency graphs with completion criteria and explicit scope"
date-created: 2026-03-01 00:00:00
tags: []
teaches:
- Designing Curricula
references:
  tyler_BasicPrinciplesCurriculum_1949:
    title: Basic Principles of Curriculum and Instruction
    authors:
    - Tyler
    year: 1949
  bruner_ProcessEducation_1960:
    title: The Process of Education
    authors:
    - Bruner
    year: 1960
requires:
- designing-effective-lessons
analogous-to:
- directed-graph
acts-on:
- lesson
---

## What this lesson covers

How to organize multiple lessons into a curriculum — a structured path through a subject. The core idea: a curriculum is a dependency graph, not a numbered list. Designing one means analyzing what depends on what, defining what "having learned" each piece looks like, and making the relationships between subjects explicit.

## Why it matters

Suppose you want to learn about [semiotic](../../../../../../science/theories/linguistics/topics/semiotics/index.md) universes. You read the first lesson and encounter: "The [semiotic universe](../../../../mathematics/objects/universes/semiotic-universe/index.md) begins with a complete [Heyting](../../../../../../../references/people/arend-heyting.md) algebra $H$ equipped with a modal [closure operator](../../../../mathematics/concepts/closure-operator/index.md) $j$ and a [trace comonad](../../../../mathematics/objects/universes/semiotic-universe/terms/trace-comonad.md) $G$." You do not know what a [Heyting](../../../../../../../references/people/arend-heyting.md) algebra is. You look it up and find: "A [Heyting](../../../../../../../references/people/arend-heyting.md) algebra is a bounded [lattice](../../../../../../humanities/theories/math/theories/order/terms/lattice.md) that satisfies the residuation law for implication." You do not know what a [lattice](../../../../../../humanities/theories/math/theories/order/terms/lattice.md) is. You look that up and find: "A [lattice](../../../../../../humanities/theories/math/theories/order/terms/lattice.md) is a [partially ordered](../../../../../../humanities/theories/math/theories/order/terms/partial-order.md) set in which every pair of elements has a meet and a join." You do not know what a partial order is.

You have just discovered, by trial and error, a dependency chain: [semiotic](../../../../../../science/theories/linguistics/topics/semiotics/index.md) universes depend on [Heyting algebras](../../../../mathematics/concepts/heyting-algebra/index.md), which depend on [lattices](../../../../../../humanities/theories/math/theories/order/terms/lattice.md), which depend on [partial orders](../../../../../../humanities/theories/math/theories/order/terms/partial-order.md). A curriculum makes these dependencies explicit in advance, so the learner does not have to discover them by failing.

But making a numbered list — "1. Partial orders, 2. Lattices, 3. [Heyting algebras](../../../../mathematics/concepts/heyting-algebra/index.md), 4. Semiotic universes" — is only a start. That list does not say what you need from each subject (all of [lattice](../../../../../../humanities/theories/math/theories/order/terms/lattice.md) theory? or just the definition of meet and join?). It does not say how to tell when you are ready to move on. And it does not handle the fact that [semiotic](../../../../../../science/theories/linguistics/topics/semiotics/index.md) universes also depend on [semiotics](../../../../../../science/theories/linguistics/topics/semiotics/index.md), [typed lambda calculus](../../../../../../../../math-services-section/services/type-theory-services-section/content/documents/notes/2026-03-01-note-on-typed-lambda-calculus.md), and [closure operators](../../../../mathematics/concepts/closure-operator/index.md) — subjects that have their own dependency chains, some of which overlap.

Curriculum design is the work of making all of this navigable.

## Prerequisites

[Designing Effective Lessons](./2026-03-01-note-on-designing-effective-lessons.md) — especially backward design and the idea that learning goals should be specific and testable.

## Core concepts

### A curriculum is a dependency graph

A dependency graph is a directed graph where each node represents a learnable unit (a lesson, a concept, a skill) and each edge means "this depends on that." If learning [Heyting algebras](../../../../mathematics/concepts/heyting-algebra/index.md) requires knowing [partial orders](../../../../../../humanities/theories/math/theories/order/terms/partial-order.md), there is an edge from "[Heyting algebras](../../../../mathematics/concepts/heyting-algebra/index.md)" to "[partial orders](../../../../../../humanities/theories/math/theories/order/terms/partial-order.md)."

Here is a concrete example. To learn about the [semiotic universe](../../../../mathematics/objects/universes/semiotic-universe/index.md), you need:

```
semiotic universe
├── Heyting algebras
│   └── partial orders
├── closure operators
│   └── partial orders
├── typed lambda calculus
│   └── (none in this vault yet)
└── semiotics (signs, semiosis)
    └── (none — foundational)
```

This is not a linear sequence. Partial orders are a shared dependency of both [Heyting algebras](../../../../mathematics/concepts/heyting-algebra/index.md) and [closure operators](../../../../mathematics/concepts/closure-operator/index.md). Semiotics has no mathematical prerequisites at all. A learner who already knows [partial orders](../../../../../../humanities/theories/math/theories/order/terms/partial-order.md) can study [Heyting algebras](../../../../mathematics/concepts/heyting-algebra/index.md) and [closure operators](../../../../mathematics/concepts/closure-operator/index.md) in either order — or in parallel.

A numbered list flattens this graph into a sequence, hiding the structure. "Lesson 1, Lesson 2, Lesson 3" implies that Lesson 2 depends on Lesson 1, even when it does not. It also implies that there is exactly one correct order, when often several valid paths exist.

Ralph W. Tyler's *Basic Principles of Curriculum and Instruction* (1949) established the idea that curriculum design begins with objectives, not with content [@tyler_BasicPrinciplesCurriculum_1949]. The dependency graph makes this operational: each node has a learning objective, and the edges encode which objectives are prerequisites for which others.

### Each node defines what "having learned" looks like

A dependency graph is useless if you cannot tell when a node is satisfied. "Learn about [partial orders](../../../../../../humanities/theories/math/theories/order/terms/partial-order.md)" is too vague — it could mean anything from "heard the phrase" to "can prove the fixed-point theorem for monotone functions on complete [lattices](../../../../../../humanities/theories/math/theories/order/terms/lattice.md)."

Each node in the graph needs a **completion criterion**: a specific, testable statement of what the learner can do. This is backward design (from [the previous lesson](./2026-03-01-note-on-designing-effective-lessons.md)) applied at the curriculum level:

- **Partial orders**: Given a relation on a finite set, determine whether it is a partial order by checking reflexivity, antisymmetry, and transitivity.
- **[Heyting algebras](../../../../mathematics/concepts/heyting-algebra/index.md)**: Given a finite [lattice](../../../../../../humanities/theories/math/theories/order/terms/lattice.md), determine whether it is a [Heyting](../../../../../../../references/people/arend-heyting.md) algebra by computing the implication operation and checking the residuation law.
- **Semiotics**: Given a concrete [sign](../../../../../../science/theories/linguistics/theories/semiotics/terms/sign.md) situation, identify the [representamen](../../../../../../science/theories/linguistics/theories/semiotics/terms/representamen.md), object, and [interpretant](../../../../../../science/theories/linguistics/theories/semiotics/terms/interpretant.md), and classify the [sign](../../../../../../science/theories/linguistics/theories/semiotics/terms/sign.md) as [icon](../../../../../../science/theories/linguistics/theories/semiotics/terms/icon.md), index, or [symbol](../../../../writing/theories/fiction/terms/symbol.md).

These criteria serve two purposes. For the learner, they answer "am I ready to move on?" For the curriculum designer, they answer "what does the prerequisite edge actually require?" The edge from "[Heyting algebras](../../../../mathematics/concepts/heyting-algebra/index.md)" to "[partial orders](../../../../../../humanities/theories/math/theories/order/terms/partial-order.md)" does not mean "know everything about [partial orders](../../../../../../humanities/theories/math/theories/order/terms/partial-order.md)" — it means "satisfy the [partial orders](../../../../../../humanities/theories/math/theories/order/terms/partial-order.md) completion criterion."

### Edges carry specific requirements

Not all of a prerequisite is relevant to every dependent. The edge from "[Heyting](../../../../../../../references/people/arend-heyting.md) algebras" to "[partial orders](../../../../../../humanities/theories/math/theories/order/terms/partial-order.md)" requires the learner to know what a partial order is and how meets and joins work. It does not require the learner to know about well-orders, Zorn's lemma, or order-preserving maps between posets.

Making this specific matters. A vague prerequisite — "familiarity with order theory" — leaves the learner unsure what to study and risks either over-preparing (spending weeks on order theory when they need only the basics) or under-preparing (skipping the one concept they actually need).

Each edge in the graph should annotate what specifically is required: not just "learn X" but "from X, you need the definition of Y and the ability to do Z." This is the scaffolding principle from [the previous lesson](./2026-03-01-note-on-designing-effective-lessons.md) applied at the curriculum level.

### Learning paths are graphs, not trees

Real dependency structures are not trees — they have shared dependencies, optional branches, and cycles.

**Shared dependencies.** Partial orders appear as a prerequisite for [Heyting algebras](../../../../mathematics/concepts/heyting-algebra/index.md), [closure operators](../../../../mathematics/concepts/closure-operator/index.md), and [lattice](../../../../../../humanities/theories/math/theories/order/terms/lattice.md) theory. A tree representation would duplicate the [partial orders](../../../../../../humanities/theories/math/theories/order/terms/partial-order.md) node under each; a graph represents it once, with multiple edges pointing to it.

**Optional branches.** To learn about [semiotic](../../../../../../science/theories/linguistics/topics/semiotics/index.md) universes, you do not need to learn about Agda or Lean — those are tools for formalizing proofs, useful but not required for understanding. A curriculum should distinguish required dependencies from optional enrichments.

**Near-cycles.** Semiotics helps motivate the [semiotic universe](../../../../mathematics/objects/universes/semiotic-universe/index.md), and the [semiotic universe](../../../../mathematics/objects/universes/semiotic-universe/index.md) gives formal precision to semiotic concepts. Neither strictly depends on the other, but each deepens understanding of the other. [Jerome Bruner](../../../../../../../references/people/jerome-bruner.md) called this the **[spiral curriculum](../terms/spiral-curriculum.md)**: subjects are revisited at increasing levels of depth, each pass building on the last [@bruner_ProcessEducation_1960]. A dependency graph handles this by having a "basic [semiotics](../../../../../../science/theories/linguistics/topics/semiotics/index.md)" node that is prerequisite-free and an "advanced [semiotics](../../../../../../science/theories/linguistics/topics/semiotics/index.md)" node that depends on formal structures — the spiral is encoded as distinct nodes at different levels.

### Scope honesty

A curriculum defines a path through a subject, but it does not and cannot define the whole subject. Every curriculum makes choices about what to include and exclude, and those choices have [epistemological](../../../../philosophy/theories/western/theories/epistemology/terms/epistemology.md) weight.

This is the "whose knowledge?" question from [Decolonial Pedagogy](./2026-03-01-note-on-decolonial-pedagogy.md) applied to curriculum structure. A [semiotics](../../../../../../science/theories/linguistics/topics/semiotics/index.md) curriculum that covers [Charles Sanders Peirce](../../../../../../../references/people/charles-sanders-peirce.md) and Ferdinand de Saussure but not Indigenous [sign](../../../../../../science/theories/linguistics/theories/semiotics/terms/sign.md) systems is not teaching "[semiotics](../../../../../../science/theories/linguistics/topics/semiotics/index.md)" — it is teaching "European [semiotics](../../../../../../science/theories/linguistics/topics/semiotics/index.md)." A mathematics curriculum that covers the [Heyting](../../../../../../../references/people/arend-heyting.md) algebra axioms but not the philosophical motivations for constructive logic is not teaching "[Heyting algebras](../../../../mathematics/concepts/heyting-algebra/index.md)" — it is teaching "the formal shell of [Heyting](../../../../../../../references/people/arend-heyting.md) algebras."

A responsible curriculum states its scope explicitly: what it covers, what it does not, and what the learner should know about the gaps. This is not a disclaimer — it is part of the curriculum's pedagogical content. The learner who knows the curriculum covers European [semiotics](../../../../../../science/theories/linguistics/topics/semiotics/index.md) and not Indigenous [sign](../../../../../../science/theories/linguistics/theories/semiotics/terms/sign.md) systems is better positioned than the learner who thinks they have learned "[semiotics](../../../../../../science/theories/linguistics/topics/semiotics/index.md)."

Some subjects have dimensions that a text-based vault cannot hold. [Leanne Betasamosake Simpson's](../../../../../../../references/people/leanne-simpson.md) [land-based education](../terms/land-based-education.md) is grounded in sustained relationship with place — it cannot be reduced to lessons in a digital repository without losing what makes it what it is. A curriculum that acknowledges this honestly is more useful than one that pretends its text-based representation is complete.

## Worked example

Suppose you are designing a curriculum for learning about the [semiotic universe](../../../../mathematics/objects/universes/semiotic-universe/semiotic-universe.md). Here is the process.

**Step 1: Identify the terminal goal.** What should the learner be able to do? Let us say: "Explain what the [semiotic universe](../../../../mathematics/objects/universes/semiotic-universe/semiotic-universe.md) is, identify its components ([Heyting](../../../../../../../references/people/arend-heyting.md) algebra, modal closure, [trace comonad](../../../../mathematics/objects/universes/semiotic-universe/terms/trace-comonad.md), [typed lambda calculus](../../../../../../../../math-services-section/services/type-theory-services-section/content/documents/notes/2026-03-01-note-on-typed-lambda-calculus.md), fusion), and describe how the three [closure operators](../../../../mathematics/concepts/closure-operator/index.md) produce the [least fixed point](../../../../mathematics/concepts/fixed-point/index.md)."

**Step 2: Analyze dependencies.** What does the learner need to know to reach that goal?

- What a complete [Heyting](../../../../../../../references/people/arend-heyting.md) algebra is → requires [partial orders](../../../../../../humanities/theories/math/theories/order/terms/partial-order.md), [lattices](../../../../../../humanities/theories/math/theories/order/terms/lattice.md), the implication operation
- What a [closure operator](../../../../mathematics/concepts/closure-operator/index.md) is → requires [partial orders](../../../../../../humanities/theories/math/theories/order/terms/partial-order.md), monotonicity, [fixed points](../../../../mathematics/concepts/fixed-point/index.md)
- What a modal [closure operator](../../../../mathematics/concepts/closure-operator/index.md) does → requires [closure operators](../../../../mathematics/concepts/closure-operator/index.md)
- What a comonad is → requires basic categorical thinking (endofunctor, counit, comultiplication) — or can be taught directly on posets without full [category theory](../../../../mathematics/objects/categories/index.md)
- What a [typed lambda calculus](../../../../../../../../math-services-section/services/type-theory-services-section/content/documents/notes/2026-03-01-note-on-typed-lambda-calculus.md) is → requires understanding of types, terms, functions, application
- What [semiotics](../../../../../../science/theories/linguistics/topics/semiotics/index.md) contributes → requires [signs](../../../../../../science/theories/linguistics/theories/semiotics/terms/sign.md), [semiosis](../../../../../../science/theories/linguistics/theories/semiotics/terms/semiosis.md), [interpretants](../../../../../../science/theories/linguistics/theories/semiotics/terms/interpretant.md) (no math prerequisites)
- What fusion does → requires all of the above

The graph:

```
semiotic universe
├── semantic domain (Heyting algebra + modality + trace)
│   ├── Heyting algebras
│   │   ├── partial orders (completion: check axioms on a relation)
│   │   └── lattices (completion: compute meets and joins)
│   ├── closure operators (completion: check axioms, find fixed points)
│   │   └── partial orders
│   └── comonads on posets (can be taught self-contained)
├── syntactic operators
│   └── typed lambda calculus (completion: type a simple term)
├── fragments and fusion (completion: explain what fusion does in plain language)
│   └── all of the above
└── semiotics (completion: identify sign components in an example)
```

**Step 3: Define completion criteria for each node.** (Shown in parentheses above.) Each criterion is specific and testable — not "understand X" but "do Y."

**Step 4: Identify valid learning paths.** The learner can start with [semiotics](../../../../../../science/theories/linguistics/topics/semiotics/index.md) or partial orders — they are independent. After partial orders, they can study [lattices](../../../../../../humanities/theories/math/theories/order/terms/lattice.md), [Heyting algebras](../../../../mathematics/concepts/heyting-algebra/index.md), and [closure operators](../../../../mathematics/concepts/closure-operator/index.md) in any order. Typed lambda calculus is independent of the math track. Everything converges at "fragments and fusion" and then "[semiotic universe](../../../../mathematics/objects/universes/semiotic-universe/semiotic-universe.md)."

**Step 5: State scope.** This curriculum covers the formal construction. It does not cover: the philosophical motivations for constructive logic (covered in an [intuitionistic logic](../../../../../../../../math-services-section/services/logic-services-section/content/documents/notes/2026-03-01-note-on-intuitionistic-logic.md) curriculum), the relationship to [category theory](../../../../mathematics/objects/categories/index.md) (optional enrichment), or non-European [sign](../../../../../../science/theories/linguistics/theories/semiotics/terms/sign.md) theories (acknowledged gap).

## Check your understanding

<details>
<summary>1. A curriculum lists five lessons numbered 1-5. A learner reads lesson 3 and gets stuck because it uses a concept from lesson 1 but not from lesson 2. What does this tell you about the curriculum's structure?</summary>

The numbered list implies lesson 3 depends on lesson 2, but it actually depends on lesson 1 directly. The linear sequence hides the real dependency structure. A graph would make this clear: lesson 3 has an edge to lesson 1 but not to lesson 2. The learner could have skipped lesson 2 (or done it later) and gone straight from 1 to 3.
</details>

<details>
<summary>2. A curriculum node says its completion criterion is "understand [Heyting algebras](../../../../mathematics/concepts/heyting-algebra/index.md)." What is wrong with this, and how would you fix it?</summary>

"Understand" is not testable — there is no way to determine whether it has been achieved. A better criterion would be something specific: "Given a finite lattice, compute the implication operation for two elements and verify the residuation law." This is testable — either the learner can do it or they cannot.
</details>

<details>
<summary>3. Two subjects each help motivate the other — learning A makes B clearer, and learning B makes A clearer. How do you represent this in a dependency graph without creating a cycle?</summary>

Split each subject into levels. "A (basics)" has no dependency on B. "B (basics)" has no dependency on A. "A (advanced)" depends on "B (basics)." "B (advanced)" depends on "A (basics)." This encodes the spiral: each subject is revisited at greater depth, and each pass can draw on the other subject's foundations. Jerome Bruner called this the spiral curriculum.
</details>

## Common mistakes

- **Confusing a curriculum with a reading list.** A reading list says what to read. A curriculum says what to learn, in what order, with what evidence of learning. The dependency structure, completion criteria, and scope statements are what make it a curriculum rather than a list.
- **Assuming linear order.** Most subjects have dependency graphs, not dependency chains. Flattening a graph into a numbered list creates false dependencies and hides valid alternative paths.
- **Vague prerequisites.** "Requires knowledge of X" tells the learner nothing actionable. Specify what from X is needed and what the learner should be able to do with it.
- **Scope silence.** Every curriculum excludes things. Not stating what is excluded leaves the learner to discover the gaps by surprise — or worse, to assume there are none.
- **Ignoring the spiral.** Some subjects genuinely benefit from being revisited. Treating them as "done after one lesson" misses the way understanding deepens with repeated encounter at increasing sophistication.

## What comes next

These principles — dependency graphs, completion criteria, specific edges, scope honesty — are what the `learn-*` skills in this vault should encode. Each learn skill represents a node in the graph: it states what it teaches, what prerequisite skills must be satisfied first, what completion looks like, and what it does not cover.
