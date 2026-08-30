---
title: Designing Effective Lessons
description: "A guide to lesson design using backward design, concrete-before-abstract sequencing, scaffolding, and exercises as engagement checkpoints"
date-created: 2026-03-01 00:00:00
tags: []
teaches:
- Designing Effective Lessons
references:
  freire_PedagogyOppressed_1970:
    title: Pedagogy of the Oppressed
    authors:
    - Freire
    year: 1970
  biggs_TeachingQualityLearning_2011:
    title: Teaching for Quality Learning at University
    authors:
    - Biggs
    year: 2011
  hooks_TeachingTransgress_1994:
    title: 'Teaching to Transgress: Education as the Practice of Freedom'
    authors:
    - Hooks
    year: 1994
  wiggins_UnderstandingDesign_2005:
    title: Understanding by Design
    authors:
    - Wiggins
    year: 2005
requires:
- decolonial-pedagogy
contrasts-with:
- reference-document
addresses:
- banking-model
produces:
- lesson
type: lesson
cites:
  - "Pedagogy of the Oppressed"
  - "Teaching for Quality Learning at University"
  - "Teaching to Transgress: Education as the Practice of Freedom"
  - "Understanding by Design"
---

## What this lesson covers

How to design a lesson that teaches rather than just presents information. The core idea: start from what the learner should be able to do, and build toward that through concrete experience, not through definition-stacking.

## Why it matters

Consider two versions of a lesson on [partial orders](../../../../../../../../../../math-services-section/services/order-services-section/content/text/glossary/terms/partial-order.md).

Version A opens: "A [partial order](../../../../../../../../../../math-services-section/services/order-services-section/content/text/glossary/terms/partial-order.md) is a binary relation $\leq$ on a set $S$ that is reflexive ($a \leq a$), antisymmetric ($a \leq b$ and $b \leq a$ implies $a = b$), and transitive ($a \leq b$ and $b \leq c$ implies $a \leq c$)." It then lists examples, then moves to the next definition.

Version B opens: "You have a shelf of books. Some books cite other books. If book A cites book B, and book B cites book C, then A depends (indirectly) on C. But two books might not cite each other at all — they are incomparable. This 'cites' relation has a structure: it is a [partial order](../../../../../../../../../../math-services-section/services/order-services-section/content/text/glossary/terms/partial-order.md)." Only then does it give the formal definition — and when it does, the reader already has a concrete instance to check each axiom against.

Version A is a reference document. A reader who already understands [partial orders](../../../../../../../../../../math-services-section/services/order-services-section/content/text/glossary/terms/partial-order.md) can look up the definition. A reader who does not will memorize the symbols without grasping what they describe.

Version B is a lesson. The reader arrives at the definition having already encountered the thing it defines.

This difference is not just a matter of style. [Paulo Freire](../../../../../../../../../../information-science-services-section/services/knowledge-services-section/services/research-services-section/content/text/documents/articles/notes/paulo-freire.md) described conventional education as the [banking model](../../../glossary/terms/banking-model.md): the teacher deposits knowledge into passive students, who receive and memorize it [@freire_PedagogyOppressed_1970]. A lesson that opens with a definition and expects the reader to absorb it reproduces the banking model in written form. The alternative — what [Freire](../../../../../../../../../../information-science-services-section/services/knowledge-services-section/services/research-services-section/content/text/documents/articles/notes/paulo-freire.md) called problem-posing education — starts from a situation the learner can engage with and builds understanding through that engagement.

## Prerequisites

[Decolonial Pedagogy](./decolonial-pedagogy.md) — especially the sections on the [banking model](../../../glossary/terms/banking-model.md) and problem-posing education.

## Core concepts

### A lesson is not a reference document

A reference document assumes the reader already understands the subject and needs to look something up. A lesson assumes the reader does not yet understand and needs to build understanding step by step.

Both are useful. A glossary entry for "[Heyting algebra](../../../../mathematics/concepts/heyting-algebra/index.md)" should be precise and complete — someone who knows what a [Heyting algebra](../../../../mathematics/concepts/heyting-algebra/index.md) is can confirm the details. But a lesson on [Heyting algebras](../../../../mathematics/concepts/heyting-algebra/index.md) should help someone who does not yet know what one is arrive at understanding.

The confusion between these two forms is the most common problem in technical writing that claims to teach. The author, who understands the material, writes what they would want to read — a clean summary — rather than what a learner needs to read — a guided construction of understanding.

### Backward design: start from what the learner can do

Grant Wiggins and Jay McTighe's *Understanding by Design* framework proposes working backward from desired understanding [@wiggins_UnderstandingDesign_2005]. The process has three stages:

1. **Identify the desired result.** What should the learner be able to do or explain after completing the lesson? Not "understand X" (too vague) but something specific: "determine whether a given relation is a [partial order](../../../../../../../../../../math-services-section/services/order-services-section/content/text/glossary/terms/partial-order.md)," or "explain why a [Heyting algebra](../../../../mathematics/concepts/heyting-algebra/index.md) does not satisfy the [law of excluded middle](../../../../../../../../../../philosophy-services-section/services/western-services-section/services/analytic-philosophy-services-section/content/text/glossary/terms/law-of-excluded-middle.md)."

2. **Determine acceptable evidence.** How will you (or the learner) know the result has been achieved? This might be a worked problem, a self-check question, or the ability to generate an example. If you cannot describe what "understanding" looks like in practice, the learning goal is not specific enough.

3. **Plan learning experiences.** Only now do you decide what to present and in what order. The content of the lesson is determined by what the learner needs to get from where they are (prerequisites) to where they should be (desired result).

This reversal matters. Most lessons are written forward: the author starts with topic X, writes down everything important about X, and hopes the reader absorbs it. Backward design starts from the destination and asks what path leads there.

### Concrete before abstract

People learn new concepts by connecting them to things they already understand. An abstract definition — however precise — provides nothing to connect to if the reader has not encountered an instance of the thing being defined.

The principle: **every definition should be preceded by an example of what it defines.** Not an example that follows the definition as illustration, but one that comes first and motivates the definition. The reader should encounter the *thing* before encountering the *name for the thing*.

This is not dumbing down. The formal definition still appears, and it should be rigorous. The difference is sequence: experience first, then formalization.

[bell hooks](../../../../../../../../../../information-science-services-section/services/knowledge-services-section/services/research-services-section/content/text/documents/articles/notes/bell-hooks.md) made a related point about engaged pedagogy: learning involves the whole person, not just the cognitive processing of symbols. Starting with a concrete situation engages the learner's experience and judgment; starting with a formula engages only their ability to parse notation [@hooks_TeachingTransgress_1994].

### Scaffolding: meeting learners where they are

Scaffolding means providing temporary support that helps the learner reach something they could not reach alone — and then removing that support as competence develops.

In written lessons, scaffolding takes several forms:

- **Explicit prerequisites with specifics.** Not "familiarity with order theory" but "the definition of a [partial order](../../../../../../../../../../math-services-section/services/order-services-section/content/text/glossary/terms/partial-order.md) and how to check that a relation satisfies the three axioms (see [Heyting Algebras](../../../../../../../../../../math-services-section/services/order-services-section/content/text/documents/articles/notes/heyting-algebras.md), sections 1-2)." The reader needs to know exactly what to review.
- **Bridging statements.** When introducing a new concept, connect it to something from the prerequisites: "In the previous lesson, we saw that a [lattice](../../../../../../../../../../math-services-section/services/order-services-section/content/text/glossary/terms/lattice.md) has meets and joins. A [Heyting](../../../../../../../../../../information-science-services-section/services/knowledge-services-section/services/research-services-section/content/text/documents/articles/notes/arend-heyting.md) algebra adds one more operation — implication — and the question is what implication means when you cannot assume every proposition is true or false."
- **Graduated complexity.** Start with the simplest non-trivial case. If the concept applies to infinite structures, first show it on a finite example. If it involves multiple interacting components, first show each component alone.

The goal is not to make things easy but to make the distance between each step small enough that the learner can cross it.

### Exercises as engagement, not assessment

A lesson without exercises is a monologue. The learner reads, perhaps nods, and moves on — but has not tested whether they actually understood.

Exercises in a self-directed lesson serve a different purpose than in a classroom. They are not for grading. They are checkpoints: moments where the learner stops reading and tries to do something with what they have just learned. This is where understanding either solidifies or reveals its gaps.

Effective self-check questions:

- Ask the learner to **apply** a concept, not just recall a definition. "Is the 'divides' relation on positive integers a [partial order](../../../../../../../../../../math-services-section/services/order-services-section/content/text/glossary/terms/partial-order.md)? Check each axiom." is better than "What are the three axioms of a [partial order](../../../../../../../../../../math-services-section/services/order-services-section/content/text/glossary/terms/partial-order.md)?"
- Include **answers or hints** (in a collapsible section) so the learner can verify immediately. Unanswered exercises in a self-directed lesson create frustration, not learning.
- Target **specific concepts**. Each question should test one idea. If a question requires combining three new concepts, it belongs later in the sequence.

John Biggs calls this **constructive alignment**: the exercises should be aligned with the learning goals, which should be aligned with the teaching activities [@biggs_TeachingQualityLearning_2011]. If the goal is "determine whether a relation is a [partial order](../../../../../../../../../../math-services-section/services/order-services-section/content/text/glossary/terms/partial-order.md)," the exercise should ask the learner to do exactly that — not something adjacent.

## Worked example

Suppose you are writing a lesson on [closure operators](../../../../../../humanities/domains/math/domains/order/texts/closure-operators.md). Here is how backward design reshapes the lesson.

**Step 1: Desired result.** After this lesson, the reader should be able to: (a) determine whether a given function on a poset is a [closure operator](../../../../mathematics/concepts/closure-operator/index.md), (b) compute the [fixed points](../../../../mathematics/concepts/fixed-point/index.md) of a simple [closure operator](../../../../mathematics/concepts/closure-operator/index.md), and (c) explain in plain language what a [closure operator](../../../../mathematics/concepts/closure-operator/index.md) "does" to a structure.

**Step 2: Evidence.** The reader can check the three axioms (monotone, extensive, idempotent) against a given function. The reader can list the [fixed points](../../../../mathematics/concepts/fixed-point/index.md) of a small example. The reader can describe the intuition without using formal symbols.

**Step 3: Plan the lesson.**

- Open with a concrete scenario: "You have a set of statements. Some statements imply others. The 'closure' of a set of statements is everything those statements imply — including indirect consequences. Adding the consequences is a closure operation." This gives the reader something to hold onto.
- Define [closure operator](../../../../mathematics/concepts/closure-operator/index.md) formally, checking each axiom against the scenario: "Monotone: if you start with more statements, you get at least as many consequences. Extensive: the consequences include the original statements. Idempotent: the consequences of the consequences are the same as the consequences."
- Show a small finite example (a 4-element poset, a specific closure function, compute the [fixed points](../../../../mathematics/concepts/fixed-point/index.md) by hand).
- Self-check: "Here is a function $f$ on a 3-element poset. Is it a [closure operator](../../../../mathematics/concepts/closure-operator/index.md)? Which axiom fails if not?"
- Common mistake: "Confusing 'extensive' ($a \leq f(a)$) with 'the function is large.' Extensive means the output is always at least as big as the input — it does not mean the function adds a lot."

Compare this to opening with "A [closure operator](../../../../mathematics/concepts/closure-operator/index.md) on a poset $(P, \leq)$ is a function $f: P \to P$ that is monotone, extensive, and idempotent" and then listing examples. The backward-designed version teaches the same content but in an order that builds understanding.

## Check your understanding

<details>
<summary>1. You are planning a lesson on a new topic. What is the first thing you should decide — the content to cover, or what the learner should be able to do afterward?</summary>

What the learner should be able to do. The content follows from that goal, not the other way around. This is the core of backward design.
</details>

<details>
<summary>2. A lesson opens with three definitions, then gives an example that uses all three. What is wrong with this ordering?</summary>

The definitions precede any concrete experience. The reader has to parse three new abstractions with nothing to anchor them to. The example should come first (or at least one example per definition), so the reader encounters instances before names.
</details>

<details>
<summary>3. A self-check question asks: "In your own words, explain the significance of [closure operators](../../../../mathematics/concepts/closure-operator/index.md) in mathematics." Why is this a poor exercise for a lesson on [closure operators](../../../../mathematics/concepts/closure-operator/index.md)?</summary>

It is too open-ended and does not target a specific concept. A reader could write a vague paragraph and feel satisfied without demonstrating any operational understanding. A better question would ask the reader to check whether a given function is a [closure operator](../../../../mathematics/concepts/closure-operator/index.md), or to compute its [fixed points](../../../../mathematics/concepts/fixed-point/index.md) — something with a definite answer.
</details>

## Common mistakes

- **Writing the lesson you wish you had read** rather than the lesson the learner needs. The author, having already understood the material, writes a clean summary. But the clean summary is what you arrive at after learning — it is not the path to learning.
- **Listing prerequisites without specifics.** "Familiarity with order theory" tells the reader nothing actionable. Which parts of order theory? What should they be able to do?
- **Treating examples as decoration.** Examples that follow definitions ("for example...") are less effective than examples that precede definitions. The example is not illustrating the definition — it is motivating it.
- **Covering too much.** If a lesson introduces more than 3-4 new concepts, the reader runs out of working memory. Split the lesson. A sequence of three focused lessons teaches more than one comprehensive one.
- **No exercises.** A lesson without exercises is a reference document with an encouraging tone. If the learner does not do something, understanding has not been tested.

## What comes next

The principles here apply to any lesson in this vault. The next step is applying them: reviewing existing lessons against these criteria and rewriting where needed. The review-lesson skill provides a structured checklist for this.
