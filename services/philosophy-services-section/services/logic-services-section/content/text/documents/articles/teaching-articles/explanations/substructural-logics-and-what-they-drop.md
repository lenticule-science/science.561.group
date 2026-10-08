---
title: "Substructural Logics and What They Drop"
description: "Classical logic assumes hypotheses can be duplicated, discarded, and reordered. Dropping these assumptions yields linear logic, relevance logic, and the Lambek calculus — each with distinct algebraic semantics."
date-created: 2026-03-30
depends-on:
  - logic
introduces:
  - substructural-logic
  - linear-logic
  - lambek-calculus
  - residuated-lattice
type: comparison
status: current
---
Classical logic has three structural rules that are so basic they are usually invisible:

**Contraction**: if you can prove $B$ using $A$ twice, you can prove $B$ using $A$ once. Hypotheses are reusable.

**Weakening**: if you can prove $B$ from $A$, you can still prove $B$ if you add an unused hypothesis $C$. Unused hypotheses are harmless.

**Exchange**: the order of hypotheses does not matter. $A, B \vdash C$ and $B, A \vdash C$ are the same thing.

These rules say: hypotheses are abstract facts with no cost, no order, and no limit on use. This is fine when you are reasoning about timeless mathematical truths. It breaks down when hypotheses are resources, actions, or utterances — things that get consumed, depend on sequence, or cannot be freely duplicated.

[Substructural logics](../../../../../../../../../information-science-services-section/services/math-services-section/content/text/glossary/terms/substructural-logic.md) drop one or more of these rules:

**Drop contraction and weakening → [Linear logic](../../../../../../../../../information-science-services-section/services/math-services-section/content/text/glossary/terms/linear-logic.md)** (Girard 1987). Each hypothesis is used exactly once. Proofs track resources: using a premise consumes it. The connectives split into multiplicatives (tensor $\otimes$ and par $\parr$, which combine resources) and additives (with $\&$ and plus $\oplus$, which offer choices). The "of course" modality $!A$ restores unlimited use when needed. Linear logic's tensor and linear implication form the fundamental adjunction $\otimes \dashv \multimap$.

**Drop all three → [Lambek calculus](../../../../../../../../../information-science-services-section/services/math-services-section/content/text/glossary/terms/lambek-calculus.md)** (Lambek 1958). Hypotheses are ordered, used exactly once, and cannot be reordered. This is the logic of how words combine into sentences: in "the cat sat," the order matters, each word is used once, and you cannot add irrelevant words without changing the sentence. The Lambek calculus has two implications ($/$ and $\backslash$) corresponding to the two directions of combination: "what goes on the right" and "what goes on the left."

**Drop contraction → Relevance logic**. Every hypothesis must be used at least once. No idle premises. Proofs must be relevant to their conclusions.

Galatos, Jipsen, Kowalski, & Ono (2007) proved the algebraic connection: substructural logics are the logics of [residuated lattices](../../research/2026/07/algebra/objects/residuated-lattice.md). Each structural rule corresponds to an algebraic condition:

| Structural rule | Algebraic condition | Logic when dropped |
|----------------|--------------------|--------------------|
| Contraction | $a \cdot a \leq a$ (idempotence) | Linear, Lambek |
| Weakening | $a \leq e$ (integrality) | Linear, Lambek |
| Exchange | $a \cdot b = b \cdot a$ (commutativity) | Lambek |

So the landscape of substructural logics IS the landscape of residuated lattice varieties. Commutative residuated lattices give commutative linear logic. Non-commutative ones give the Lambek calculus. Integral commutative ones give intuitionistic logic (Heyting algebras).

The four-valued [bilattice](../../research/2026/07/algebra/objects/bilattice.md) $\mathbf{2} \otimes \mathbf{2}$ is a commutative residuated lattice (Busaniche & Cignoli 2014). Its logic is a commutative substructural logic — specifically, a fragment of linear logic (Jakl 2025). When predicates are valued in this bilattice, the resources being tracked are [epistemic states](../../../../../../../../../information-science-services-section/content/text/glossary/terms/epistemic-state.md): assertions that can be affirmed, denied, contested, or unattested.
