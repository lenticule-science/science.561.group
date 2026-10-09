---

introduces: property
description: "The property that order does not matter: a · b = b · a. Distinguishes commutative algebra from non-commutative, and linear logic from the Lambek calculus."
aliases: [ commutativity, commutative, commutative law, Commutativity ]
applies-to: binary-operation
date-created: 2026-03-30

---

A [binary operation](./binary-operation.md) $\ast$ is commutative if order does not matter:

$$a \ast b = b \ast a$$

Addition is commutative: $3 + 5 = 5 + 3$. Multiplication is commutative: $3 \times 5 = 5 \times 3$. Function composition is not: $g \circ f \neq f \circ g$ in general. Matrix multiplication is not.

Commutativity distinguishes algebraic families:

- A commutative [group](./group.md) is an [abelian group](./abelian-group.md).
- A commutative [ring](./ring.md) has $ab = ba$ for all elements.
- A commutative [residuated lattice](./residuated-lattice.md) has $a \cdot b = b \cdot a$, so the two residuals ($/$  and $\backslash$) coincide into a single implication $\to$.

In [substructural logic](./substructural-logic.md), commutativity corresponds to the exchange rule: the order of hypotheses does not matter. Dropping exchange gives the [Lambek calculus](./lambek-calculus.md), where the two residuals are genuinely different (forward application $/$ vs. backward application $\backslash$). Keeping exchange gives commutative [linear logic](./linear-logic.md), where a single implication suffices.

The four-valued [bilattice](./bilattice.md) $\mathbf{2} \otimes \mathbf{2}$ is a commutative residuated lattice (Busaniche & Cignoli 2014): $a \odot b = b \odot a$. The two sides of the Lambek residuation collapse, and extending/restricting become two readings of a single adjunction.
