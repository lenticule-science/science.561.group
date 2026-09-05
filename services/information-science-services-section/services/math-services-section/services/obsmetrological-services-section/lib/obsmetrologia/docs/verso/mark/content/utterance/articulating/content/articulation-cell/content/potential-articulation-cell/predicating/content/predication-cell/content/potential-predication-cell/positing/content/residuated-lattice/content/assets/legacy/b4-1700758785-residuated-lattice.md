---

introduces: algebraic-structure
description: "A lattice equipped with a monoidal product and its residual implication, connected by an adjunction: a · b ≤ c iff b ≤ a → c."
aliases: [residuated lattices]
specialization: [lattice, monoid]
made-of: [lattice, product, residual-implication, identity-element]
operations: [product, residual-implication]
laws: [residuation, associativity, monotonicity]
variants: [commutative-residuated-lattice, integral-residuated-lattice, bounded-residuated-lattice]
adjunction: adjoint-pair
logic-of: lambek-calculus
produced-on: twist-product
sheaf-representation: rasouli-2023
structural-rules-dropped: [contraction, weakening]
instances: [bilattice]
introduced-by: ward-dilworth-1939
contemporary-reference: galatos-jipsen-kowalski-ono-2007
date-created: 2026-03-30
---

A residuated [lattice](../../order/objects/lattice.md) is a lattice $(L, \wedge, \vee)$ equipped with a monoidal product $\cdot$ and a residual implication $\to$ satisfying the **residuation law**:

$$a \cdot b \leq c \quad\text{if and only if}\quad b \leq a \to c$$

The product $\cdot$ is associative with an identity element $e$ (making $(L, \cdot, e)$ a monoid). The residuation law says: the product and implication are adjoint. The product combines; the implication tests what must hold for the combination to stay below a bound.

In the non-commutative case, the product has two residuals — a left residual $a \backslash c$ and a right residual $c / b$ — because the two argument positions of $\cdot$ are distinguishable:

$$a \cdot b \leq c \quad\text{iff}\quad b \leq a \backslash c \quad\text{iff}\quad a \leq c / b$$

In the commutative case ($a \cdot b = b \cdot a$), the two residuals coincide into a single $\to$.

Galatos, Jipsen, Kowalski, & Ono (2007) proved that the [Lambek calculus](../../logic/concepts/lambek-calculus.md) — the logic of how predicates combine with their arguments — is the logic of residuated lattices. The $/$ and $\backslash$ of categorial grammar are residuals in the algebraic sense.

A residuated lattice is **integral** if the monoidal identity $e$ is the top element of the lattice ($e = \top$). It is **commutative** if $a \cdot b = b \cdot a$. Every [Heyting algebra](../../logic/objects/heyting-algebra.md) is an integral commutative residuated lattice where the product is meet and the residual is the Heyting implication.

The [twist product](./twist-product.md) $L \otimes L$ of a commutative residuated lattice inherits a residuation (Busaniche & Cignoli 2014), giving the four-valued [bilattice](./bilattice.md) its algebraic operations.
