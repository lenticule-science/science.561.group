---
title: Relational Heyting Algebra
aliases:
  - Relational Heyting Algebra
  - relational heyting algebra
keywords:
  - text
  - heyting
  - semantics
operations:
  - name: order
  - name: top
  - name: bottom
  - name: meet
  - name: join
  - name: implication
  - name: negation
depends-on:
  - theorem/internal/logic-algebra
description: Heyting algebras internalize implication and negation inside an ordered lattice.
---

# Theorem (Relational Heyting Algebra)

Heyting algebras internalize implication and negation inside an ordered lattice.
In the relational calculus, every ingredient is earned as an act in the semantics
stratum.  This text packages those acts as theorems and exhibits the precise
correspondence.

## Lattice structure

**Theorem 1 (Bounded lattice).**  
Acts [Ordering Recognition](../../../../../../services/relationality-services-section/content/text/documents/articles/notes/order-recognition.md),
[Grounding Recognition](../../../../../../services/relationality-services-section/content/text/documents/articles/notes/ground-recognition.md),
[Capping Recognition](../../../../../../services/relationality-services-section/content/text/documents/articles/notes/cap-recognition.md),
[Meeting Recognition](../../../../../../services/relationality-services-section/content/text/documents/articles/notes/meet-recognition.md), and
[Joining Recognition](../../../../../../services/relationality-services-section/content/text/documents/articles/notes/join-recognition.md) present the
recognitions as a bounded lattice.

*Proof.* The preorder `≤` is earned by Ordering Recognition.  Its least and
greatest elements appear in Grounding/Capping recognitions.  Closing the order
under finite meets/joins uses
[Meet Recognition](../../../../../../services/relationality-services-section/content/text/documents/articles/notes/meet-recognition.md) and
[Join Recognition](../../../../../../services/relationality-services-section/content/text/documents/articles/notes/join-recognition.md), giving every pair infimum and
supremum.  Together these witnesses satisfy the lattice axioms. ∎

## Implication and negation

**Theorem 2 (Implication).**  
[Imply Recognition](../../../../../../services/relationality-services-section/content/text/documents/articles/notes/imply-recognition.md) produces the
internal implication `⇒` by composing joins with function formation, and
satisfies the Heyting condition `a ∧ b ≤ c` iff `a ≤ (b ⇒ c)`.

*Proof.* The act applies `JoinRecognition` to the function constructors obtained
earlier in the semantics stratum (in particular
[Form Function Term](../../../../../../services/relationality-services-section/content/text/documents/articles/notes/form-function-term.md)).  Its proof
sketch records the adjunction, so residuation between meets and implication is
forced. ∎

**Theorem 3 (Negation).**  
[Negate](../../../../../../services/relationality-services-section/content/text/glossary/terms/negate.md) yields the pseudocomplement operator
`¬a = (a ⇒ ⊥)` in the earned lattice.

*Proof.* The act witnesses `JoinRecognition` through the reflex trace, giving an
operation that sends each recognition to the least object whose meet with it is
Grounding Recognition (⊥).  This is the standard Heyting negation. ∎

## Contexts, carriers, and summary

The remaining semantics acts populate the algebra with contexts and carriers,
allowing interpretations of earlier strata:

| Mathematical notion | Relational act(s) |
| ------------------- | ----------------- |
| Context collections | [Construct Contexts](../../../../../../services/relationality-services-section/content/text/documents/articles/notes/construct-contexts.md), [Collect Contexts](../../../../../../services/relationality-services-section/content/text/documents/articles/notes/collect-contexts.md) |
| Terms / functions   | [Construct Terms](../../../../../../services/relationality-services-section/content/text/documents/articles/notes/construct-terms.md), [Collect Terms](../../../../../../services/relationality-services-section/content/text/documents/articles/notes/collect-terms.md) |
| Evaluation targets  | [Judge Typing](../../../../../../services/relationality-services-section/content/text/documents/articles/notes/judge-typing.md) onward |

**Corollary.** The relational calculus carries a complete Heyting algebra with
⊤, ⊥, meets, joins, implication, and pseudocomplement defined by the acts above.

This algebra serves as the semantics for the trace/term/judgement strata and
anchors future stories (relational toposes, modal systems, temporal calculi).
Subsequent texts can now cite Theorems 1–3 rather than re-deriving the structure.
