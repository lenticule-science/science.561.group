---

introduces: property
description: "A function that preserves order: if a ≤ b then f(a) ≤ f(b). The condition that makes fixpoints exist and closure operators well-behaved."
aliases: [monotone, monotone function, order-preserving, isotone]
specialization: function
enables: [fixpoint, closure]
date-created: 2026-03-31
---

A function $f$ between [partially ordered](./partial-order.md) sets is monotone if it preserves order:

$$a \leq b \implies f(a) \leq f(b)$$

Larger inputs give larger (or equal) outputs. The function never reverses the ordering.

Addition of a positive constant is monotone on numbers: if $a \leq b$ then $a + 3 \leq b + 3$. [Meet](./meet.md) with a fixed element is monotone on a [lattice](./lattice.md): if $a \leq b$ then $a \wedge c \leq b \wedge c$. Negation on the integers is NOT monotone: $2 \leq 5$ but $-2 \geq -5$.

Monotonicity is the condition that makes the Knaster-Tarski theorem work: every monotone function on a [complete lattice](./complete-lattice.md) has a least [fixpoint](./fixpoint.md). This is why [closure](../../algebra/terms/closure.md) reaches a fixpoint — the inference rules on the four-valued [bilattice](../../algebra/terms/bilattice.md) are monotone in the knowledge ordering (Fitting 1991), so iterating them converges.

An **antitone** (order-reversing) function reverses order: $a \leq b \implies f(a) \geq f(b)$. The derivation operators in a [Galois connection](./galois-connection.md) are antitone: more objects means fewer shared attributes, and more required attributes means fewer qualifying objects.

A [bilattice](../../algebra/terms/bilattice.md) homomorphism must be monotone with respect to both orderings — it preserves both the truth ordering and the knowledge ordering. The interlacing condition on a bilattice says all four operations ([meet](./meet.md) and [join](./join.md) in both orderings) are monotone with respect to both orderings.
