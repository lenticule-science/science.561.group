---

introduces: logic
description: "A substructural logic formalizing how predicates combine with arguments, equivalent to the logic of residuated lattices."
aliases: [Lambek calculus, syntactic calculus]
specialization: substructural-logic
algebraic-semantics: residuated-lattice
connectives: [product, left-residual, right-residual]
structural-rules-dropped: [contraction, weakening, exchange]
complete-semantics: concept-lattice
generates: context-free-language
commutative-case-collapses-to: single-implication
introduced-by: lambek-1958
algebraic-bridge: galatos-jipsen-kowalski-ono-2007
completeness-for-concept-lattices: wurm-2012
pentus-result: generates-exactly-context-free-languages
categorical-form: adjoint-pair
categorical-instance: "∃ ⊣ ∀"
date-created: 2026-03-30
---

The Lambek calculus (Lambek 1958) formalizes how a functor — a predicate, a verb, any expression that takes arguments — combines with its arguments to produce a complete expression.

A product operation $\cdot$ combines two expressions. The calculus introduces two residuals:

$$a \cdot b \leq c \quad\text{iff}\quad b \leq a \backslash c \quad\text{iff}\quad a \leq c / b$$

The left residual $a \backslash c$ asks: what must combine with $a$ on the right to yield something below $c$? The right residual $c / b$ asks: what must combine with $b$ on the left? These two residuals exhaust the modes of functor-argument interaction. The product has two argument positions, so there are exactly two residuals.

Galatos, Jipsen, Kowalski, & Ono (2007) proved the Lambek calculus is the logic of [residuated lattices](../../algebra/terms/residuated-lattice.md). The $/$ and $\backslash$ of categorial grammar are residuals in the algebraic sense, and the full theory of residuated lattices applies to predicate-argument combination.

In the commutative case ($a \cdot b = b \cdot a$), the two residuals coincide into a single implication $\to$. The adjunction retains two sides: the product side (combining, generating) and the implication side (testing, constraining).

Lawvere (1969) identified the same adjunction in categorical logic: existential quantification $\exists$ (left adjoint to substitution) and universal quantification $\forall$ (right adjoint) are the categorical form of the two residuals.

Wurm (2012) proved that syntactic concept lattices — [concept lattices](../../order/terms/concept-lattice.md) arising from distributional data — give complete semantics for the full Lambek calculus.

Pentus (1993) proved Lambek grammars generate exactly the context-free languages.
