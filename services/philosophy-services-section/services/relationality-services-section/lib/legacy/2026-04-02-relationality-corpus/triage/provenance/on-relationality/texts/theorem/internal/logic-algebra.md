---

title: Relational Logic Algebra
tags:
  - order
  - lattice
  - heyting
depends-on:
  - order-recognition
  - ground-recognition
  - cap-recognition
  - meet-recognition
  - join-recognition
  - imply-recognition
  - negate
form: research
# Theorem (Relational Logic Algebra)

The semantics layer already forms a bounded lattice with implication and
negation, i.e., a Heyting algebra.  The acts listed above witness each piece:

1. `OrderRecognition`, `GroundRecognition`, and `CapRecognition` earn the
   preorder with ⊥ and ⊤.
2. `MeetRecognition` and `JoinRecognition` provide finite meets/joins.
3. `ImplyRecognition` and `Negate` give the Heyting implication and
   pseudocomplement.

These recognitions form the algebraic backbone for external logic
correspondences.
