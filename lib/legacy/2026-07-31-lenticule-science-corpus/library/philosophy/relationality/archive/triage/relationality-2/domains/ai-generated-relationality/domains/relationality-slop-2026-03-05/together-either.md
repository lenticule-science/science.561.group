---
title: "Together / Either"
date-created: 2026-03-05T00:00:00
type: term
canonical-name: Together / Either
movement: I
draft-names:
  draft-1: "(implicit in 'coherence' — not named separately)"
  draft-3-PRE: "Together / Either"
  draft-3-foundations: "∧ (meet) / ∨ (join) on Fix(c)"
  draft-11: "MeetRecognition / JoinRecognition"
  draft-12: "∧ (meet) / ∨ (join)"
stability: high — present across drafts, names vary
---

The binary operations on the field of recognition. Together is joint recognition of both operands (conjunction, meet). Either is recognition of at least one operand (disjunction, join).

## What they are

PRE: "Together: joint recognition of both operands. Standard symbol: ∧ or ⊗." "Either: alternative recognition; at least one of the operands. Standard symbol: ∨."

PRE Theorem 1: Together(a,b) Includes a; Includes(a, Either(a,b)); Excludes(a,b) iff Equal(Together(a,b), Bottom).

Draft 12: Derived from the subobject lattice — meet is pullback, join is least upper bound. "The Heyting pre-algebra of the recognition field."

Draft 11: MeetRecognition, JoinRecognition — recognition operators within the generative closure.

## Properties

- Together: commutative, associative, monotone in both arguments
- Either: commutative, associative
- Together and Either form a bounded distributive lattice with Top and Bottom
- This lattice is the ground for Induces (implication via residuation)

## Relationships

- Arise from: Includes, Excludes (as operations on the ordered field)
- Enable: Induces (Together left-adjoint to Induces)
- Enable: Negate (defined as Induces(a, Bottom))
