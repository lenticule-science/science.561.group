---

title: "Predication as Residuation"
description: "Three fields independently discovered that predication — the act of asserting a relationship between subject and object — is a residuation. Lambek found it in grammar, Lawvere in logic, Busaniche-Cignoli in algebra."
date-created: 2026-03-30
requires:
  - residuated-lattice
  - subject-predicate-object
teaches:
  - lambek-calculus
  - hyperdoctrine
  - adjoint-pair
---

Predication is the act of asserting a relationship: "the file extends legibility," "the component requires authentication," "the document cites Shannon." In each case, a predicate takes a subject and an object and produces an assertion. This is Frege's insight (1879): the predicate is an unsaturated function.

Three fields independently discovered the same algebraic structure inside this act.

## Lambek: grammar is residuation

Lambek (1958) asked how a verb combines with its arguments to form a sentence. He proved the combination is a [residuation](../../math/theories/algebra/terms/residuated-lattice.md): given a product $\cdot$ that combines expressions, there are exactly two residuals:

$$a \cdot b \leq c \quad\text{iff}\quad b \leq a \backslash c \quad\text{iff}\quad a \leq c / b$$

The product combines. The left residual asks what must go on the right. The right residual asks what must go on the left. Two argument positions, two residuals, no third option. This is a theorem about the structure of predication in grammar.

## Lawvere: quantifiers are adjoints

Lawvere (1969) found the same structure in categorical logic. The two fundamental operations on predicates in a [hyperdoctrine](../../math/theories/categories/theories/ordinary-categories/terms/hyperdoctrine.md) are:

$$\exists_f \dashv f^* \dashv \forall_f$$

Existential quantification $\exists$ (left adjoint, generative: extends a predicate to a larger context) and universal quantification $\forall$ (right adjoint, constraining: restricts a predicate to where it holds universally). The same adjunction, now in categorical language.

## Busaniche-Cignoli: the bilattice has a residuation

Busaniche & Cignoli (2014) proved that the [twist product](../../math/theories/algebra/terms/twist-product.md) $L \otimes L$ of any commutative residuated lattice inherits a residuation. Instantiating on $\mathbf{2} \otimes \mathbf{2}$ — the four-valued [bilattice](../../math/theories/algebra/terms/bilattice.md) — gives explicit operations $\odot$ (extending) and $\Rightarrow$ (restricting) with:

$$a \odot p \leq_t q \quad\text{iff}\quad p \leq_t (a \Rightarrow q)$$

## One adjunction, three fields

These are the same adjunction:

| Field | Product side | Implication side | What it models |
|-------|-------------|-----------------|----------------|
| Grammar (Lambek) | $a \cdot b$ | $a \backslash c$, $c / b$ | How words combine |
| Logic (Lawvere) | $\exists$ | $\forall$ | How predicates quantify |
| Algebra (Busaniche-Cignoli) | $\odot$ | $\Rightarrow$ | How epistemic states compose |

The product side combines, generates, extends. The implication side tests, constrains, restricts. Every [subject-predicate-object](../terms/subject-predicate-object.md) assertion has both readings, connected by the residuation: asserting that S extends toward O through P is the same as asserting that O restricts S through P.

The bridge between these fields is the theorem that the Lambek calculus is the logic of residuated lattices (Galatos et al. 2007). Grammar, logic, and algebra are studying the same mathematical object. The object is predication.
