---
type: narrative
discusses: [predicate-category, closure-operator, predicate-category-naturality, predication-fiber-functor, predicate-generator-exhaustiveness]
---

# Why predicate composition is a closure constraint, not a morphism

A natural impulse in setting up a category of predicates is to make predicate-composition $p \sqcap q$ a morphism of $\mathcal{C}$. This work deliberately does not. Composition is instead handled by the [closure operator](../../morphisms/closure-operator.md) as a constraint on valuations:

$$v_\tau(p \sqcap q)(s, o) \;=\; v_\tau(p)(s, o) \;\wedge_k\; v_\tau(q)(s, o)$$

at quiescence — assuming $\Pi$ contains a designated composite $p \sqcap q$ at all.

## The structural reason

The pointwise map $A_p \times A_q \to A_{p \sqcap q}$ given by $(v_p, v_q) \mapsto v_p \wedge_k v_q$ depends on *two* independent valuations. A $\mathcal{C}$-morphism must induce a unary fiber-map $f^* : A_p \to A_q$ — a function of one valuation. There is no way to package "the conjunction of two predicates' values" as a unary functor from a single $\mathcal{C}$-morphism without breaking the configuration-space structure.

Equivalently: the [predication fiber functor](../../../../../../../pre-bilattice/content/bilattice/content/predication-fiber-algebra/references/predication-fiber-functor.md) $F : \mathcal{C}^{\mathrm{op}} \to \mathbf{DBiLat}(\mathbf{L})$ sends $\mathcal{C}$-morphisms to bilattice homomorphisms; bilattice homomorphisms are 1-place maps; predicate-composition is a 2-place operation on values. The shapes do not match.

## What this buys

Keeping composition outside $\mathcal{C}$ has three structural payoffs.

First, the [generator inventory](../../../../../../../pre-bilattice/content/bilattice/content/predication-fiber-algebra/content/predication-fibration/explanations/exhaustiveness-of-four-predication-cell-complex-site-generators.md) — specialization, converse, subject-projection, object-projection — exhausts the *natural unary* fiber-homomorphism classes (under $\mathrm{Sym}(E)$-equivariance and $|E| \geq 3$). If composition were forced into $\mathcal{C}$ it would not fit the classification, and the four-generator picture would become five-or-more-generators-plus-binary-operations.

Second, $\mathcal{C}$ stays small and computable. Every $\mathcal{C}$-morphism is a single index-map plus sub-support data. The category is presentable and easy to reason about; it has finite limits in the cases of interest and supports clean Beck–Chevalley arguments.

Third, the closure-operator framing is exactly where one *wants* composition handled: as a coherence requirement that the inferential dynamics enforces. If $\Pi$ contains $p \sqcap q$, the closure can either fire to produce the conjunction or not, and the choice is at the level of inference rules — application-specific. The framework does not prejudge what predicate-composition should mean; the closure operator decides.

## The tradeoff

Composite predicates are not first-class participants in the [predicate-category naturality](../../../../../../../../../../../../predicate-category/content/predicate-category-naturality/predicate-category-naturality.md) condition. A pre-closure settling may have $v_\tau(p \sqcap q)$ disagreeing with $v_\tau(p) \wedge_k v_\tau(q)$; only at quiescence does the composite fall into agreement. This matches the operational reality of inference: composites *acquire* their values as the system reasons, rather than carrying them as static functorial data.

That asymmetry — generators in $\mathcal{C}$, composites in the closure — is one of the structural choices distinguishing this framework from classical hyperdoctrines, where everything is uniformly functorial.
