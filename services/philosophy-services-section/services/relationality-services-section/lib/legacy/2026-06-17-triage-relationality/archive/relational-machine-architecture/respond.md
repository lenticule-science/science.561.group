---
specialization: predicate-fiber-composition
composition-left: extending
composition-right: restricting
grounded-in: the-adjoint-structure-of-predication-on-bilattice-valued-fibers
triggered-by: message
occurs-in: relational-machine
date-created: 2026-04-07
---

# Respond

To respond is to compose one's own state with an incoming [message](message.md) and produce a conclusion. In a [relational machine](relational-machine.md), response is the single computation: compose the entity's fiber with the message's fiber, then determine what follows.

The general concept appears across disciplines. In cybernetics (Wiener 1948), response is the output side of a feedback loop — the system senses input, compares against its internal state, and produces output that feeds back. In dialogue, response is a turn — the hearer composes what was said with what they know and produces a reply. In biology, response is stimulus-processing — the organism's state determines how it reacts to the environment.

The specific algebraic mechanism in a bilattice-valued system is the Busaniche-Cignoli (2014) residuation on the twist product: extend (⊙) fuses the two fibers' evidence, restrict (⇒) determines what the entity concludes. The adjunction a ⊙ p ≤_t q iff p ≤_t (a ⇒ q) guarantees these two operations are properly dual.

Two perspectives result from the same adjunction:
- **Composed** (⊙): what's true when these two things meet — for matching, overlap, compatibility
- **Restricted** (⇒): what the entity concludes — for inference, settlement, query answering
