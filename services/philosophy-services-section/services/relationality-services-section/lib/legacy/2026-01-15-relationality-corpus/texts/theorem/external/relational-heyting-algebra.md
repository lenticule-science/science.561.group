---

title: Relational Heyting Algebra
tags:
  - text
  - heyting
  - semantics
depends-on:
  - theorem/internal/logic-algebra
operations:
  - name: order
    symbol: "≤"
    acts:
      - order-recognition
  - name: top
    symbol: "⊤"
    acts:
      - cap-recognition
  - name: bottom
    symbol: "⊥"
    acts:
      - ground-recognition
  - name: meet
    symbol: "∧"
    acts:
      - meet-recognition
  - name: join
    symbol: "∨"
    acts:
      - join-recognition
  - name: implication
    symbol: "⇒"
    acts:
      - imply-recognition
  - name: negation
    symbol: "¬"
    acts:
      - negate
form: research
# Theorem (Relational Heyting Algebra)

Heyting algebras internalize implication and negation inside an ordered lattice.
In the relational calculus, every ingredient is earned as an act in the semantics
stratum.  This text packages those acts as theorems and exhibits the precise
correspondence.

## Lattice structure

**Theorem 1 (Bounded lattice).**  
Acts [Ordering Recognition](../../acts/order-recognition.md),
[Grounding Recognition](../../acts/ground-recognition.md),
[Capping Recognition](../../acts/cap-recognition.md),
[Meeting Recognition](../../acts/meet-recognition.md), and
[Joining Recognition](../../acts/join-recognition.md) present the
recognitions as a bounded lattice.

*Proof.* The preorder `≤` is earned by Ordering Recognition.  Its least and
greatest elements appear in Grounding/Capping recognitions.  Closing the order
under finite meets/joins uses
[Meet Recognition](../../acts/meet-recognition.md) and
[Join Recognition](../../acts/join-recognition.md), giving every pair infimum and
supremum.  Together these witnesses satisfy the lattice axioms. ∎

## Implication and negation

**Theorem 2 (Implication).**  
[Imply Recognition](../../acts/imply-recognition.md) produces the
internal implication `⇒` by composing joins with function formation, and
satisfies the Heyting condition `a ∧ b ≤ c` iff `a ≤ (b ⇒ c)`.

*Proof.* The act applies `JoinRecognition` to the function constructors obtained
earlier in the semantics stratum (in particular
[Form Function Term](../../acts/form-function-term.md)).  Its proof
sketch records the adjunction, so residuation between meets and implication is
forced. ∎

**Theorem 3 (Negation).**  
[Negate](../../acts/negate.md) yields the pseudocomplement operator
`¬a = (a ⇒ ⊥)` in the earned lattice.

*Proof.* The act witnesses `JoinRecognition` through the reflex trace, giving an
operation that sends each recognition to the least object whose meet with it is
Grounding Recognition (⊥).  This is the standard Heyting negation. ∎

## Contexts, carriers, and summary

The remaining semantics acts populate the algebra with contexts and carriers,
allowing interpretations of earlier strata:

| Mathematical notion | Relational act(s) |
| ------------------- | ----------------- |
| Context collections | [Construct Contexts](../../acts/construct-contexts.md), [Collect Contexts](../../acts/collect-contexts.md) |
| Terms / functions   | [Construct Terms](../../acts/construct-terms.md), [Collect Terms](../../acts/collect-terms.md) |
| Evaluation targets  | [Judge Typing](../../acts/judge-typing.md) onward |

**Corollary.** The relational calculus carries a complete Heyting algebra with
⊤, ⊥, meets, joins, implication, and pseudocomplement defined by the acts above.

This algebra serves as the semantics for the trace/term/judgement strata and
anchors future stories (relational toposes, modal systems, temporal calculi).
Subsequent texts can now cite Theorems 1–3 rather than re-deriving the structure.
