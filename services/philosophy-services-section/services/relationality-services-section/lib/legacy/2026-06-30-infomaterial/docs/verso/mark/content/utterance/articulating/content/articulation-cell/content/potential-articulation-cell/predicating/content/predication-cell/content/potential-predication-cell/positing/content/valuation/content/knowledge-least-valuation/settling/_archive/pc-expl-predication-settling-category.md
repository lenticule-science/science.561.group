---
name: predication settling category
description: The category $\mathbf{PS}(\mathbf{L}, \mathcal{C}, E, \lambda)$ whose objects are predication-settlings over a common base and whose morphisms are predication-settling-preorder-morphisms. A thin poset-category indexed by the pointwise-and-stepwise knowledge-order relation on valuations; the categorical home for settling-level operations like delta-injection, positing, and closure-2-monad action.
---

The category, denoted $\mathbf{PS}(\mathbf{L}, \mathcal{C}, E, \lambda)$, whose objects are [predication-settlings](../../../../code/structures/predication-settling.md) over the common base $(\mathbf{L}, \mathcal{C}, E, \lambda)$ and whose morphisms are [predication-settling-preorder-morphisms](../../../../code/transformers/predication-settling-preorder-morphism.md). The category status — that the proposed data satisfy Mac Lane's category axioms — is the content of [predication-settling-objects-and-preorder-morphisms-form-a-category](../../../learning/claims/predication-settling-objects-and-preorder-morphisms-form-a-category.md).

## The role

$\mathbf{PS}$ is the *categorical home* for reasoning about settlings as objects-with-morphisms in the [order-of-knowledge](order-of-knowledge.md) direction. Where the [predication-settling](../../../../code/structures/predication-settling.md) record gives a single settling as a $\leq_k$-monotone trajectory of valuations, $\mathbf{PS}$ gives the *collection* of settlings together with the directed relations between them — the relations that say "settling $v'$ is everywhere-and-always at least as knowledge-settled as $v$." Three pressures distinguish the role:

**Thin hom-sets.** Between any two settlings $v, v'$ over the same base, $\mathbf{PS}(v, v')$ contains at most one morphism — either the preorder-morphism exists (when the underlying pointwise-and-stepwise $\leq_k$-relation holds) or the hom-set is empty. There is no parallel-arrow content to track; the category's structure is exhausted by *which settlings preorder-morphism into which*. Equational coherence (associativity, identity laws) holds vacuously because any two parallel arrows in a one-element set are equal.

**Antisymmetry.** Mutual preorder-morphisms $v \to v'$ and $v' \to v$ force settling-equality: if $v_\tau(p) \leq_k v'_\tau(p)$ and $v'_\tau(p) \leq_k v_\tau(p)$ pointwise for every $p, \tau$, antisymmetry of $\leq_k$ on $\mathbf{L}^\bowtie$ (per [pre-bilattice](../../../../code/structures/pre-bilattice.md)) gives $v_\tau(p) = v'_\tau(p)$ for every $p, \tau$, which is settling-equality. So the underlying preorder on settlings is antisymmetric, and $\mathbf{PS}$ is a *poset-category* — equivalent to the order-category of a partial order on settlings.

**Base-relative.** $\mathbf{PS}$ is parameterized by the base $(\mathbf{L}, \mathcal{C}, E, \lambda)$. Settlings over different bases — different residuated lattices, different predicate categories, different entity sets, or different settling bounds — inhabit different $\mathbf{PS}$ categories. The category is not a *single* large category encompassing all settlings; it is a *family* of categories, one per base. Cross-base relations are a separate categorical structure (a 2-category whose 1-cells are base-morphisms and whose 2-cells are settling-preorder-morphisms) and are not what $\mathbf{PS}$ names.

## Realization

The defining data is given by the claim. Briefly: $\mathrm{Ob}(\mathbf{PS})$ is the class of predication-settlings over the fixed base; $\mathbf{PS}(v, v')$ is the singleton $\{\mathrm{morph}_{v \to v'}\}$ when $v_\tau(p) \leq_k v'_\tau(p)$ in $A_p$ pointwise for every $p \in \mathcal{C}$ and $\tau < \lambda$, and is empty otherwise; composition is the unique morphism existing in the target hom-set (justified by transitivity of $\leq_k$); identity at $v$ is the unique morphism in $\mathbf{PS}(v, v)$ (justified by reflexivity of $\leq_k$).

## Transverse role: the modeling category

The same class of settlings, indexed instead by the [order-of-truth](order-of-truth.md), supports a transverse morphism class — the [modeling-morphism](../../../../code/transformers/modeling-morphism.md). Settlings $v, v'$ admit a modeling-morphism $v \models v'$ iff $v_\tau(p)(s, o) \leq_t v'_\tau(p)(s, o)$ for every $p, \tau, s, o$. This is a different category structure on the same object class — call it $\mathbf{PS}_t$ when disambiguation matters — with the same thin / poset-category shape but indexed by the truth-order instead.

$\mathbf{PS}$ and $\mathbf{PS}_t$ are not interchangeable. The knowledge-order axis carries the settling discipline (settling-monotonicity is stated in $\leq_k$); the truth-order axis carries the modeling relation. The two orders are transverse per [order-of-knowledge](order-of-knowledge.md), and so are the categories they index.

## What this concept makes available

The category status established by the claim makes the following statable as morphism-level facts in $\mathbf{PS}$ rather than as relation-on-settlings facts re-derived in each downstream context:

- **Delta-injection** — the operation placing a single datum at a single cell. As an operation on settlings, it produces a settling whose value at one indexed cell at one step has been raised in $\leq_k$ and is otherwise unchanged. The codomain is therefore reachable from the domain by a $\mathbf{PS}$-morphism (and the operation lifts to a $\mathbf{PS}$-endomorphism when extended to act on the originating settling).
- **Positing morphism** — the operation $v \mapsto v \vee_k \delta_{\phi, q}$ joining a settling with a cell-indicator valuation. By the knowledge-monotonicity of $\vee_k$, the result is everywhere-and-always at least as knowledge-settled as the input; so the operation is a $\mathbf{PS}$-endomorphism. This is the subject of a separate claim.
- **Closure-2-monad action.** The [closure-2-monad](../../../../code/transformers/closure-2-monad.md) is a 2-functor on the 2-category of predication-fibrations; restricted to a fixed base, its underlying 1-functorial action on settlings is a $\mathbf{PS}$-endomorphism.

Each of these operations is *stated* in terms of valuations and the $\leq_k$-relation; $\mathbf{PS}$ gives the categorical wrapping under which they compose, admit identities, and inherit Mac Lane-coherence for free.

## What this concept does not name

- **A single predication-settling.** That is [predication-settling](../../../../code/structures/predication-settling.md). $\mathbf{PS}$ is the *category of* settlings, not any settling.
- **The truth-order morphism class.** That is [modeling-morphism](../../../../code/transformers/modeling-morphism.md), naming a transverse category on the same object class.
- **Cross-base relations between settlings.** $\mathbf{PS}$ is parameterized by a fixed base; cross-base content lives in a higher-categorical structure not addressed here.
- **The 2-category $\mathbf{PrFib}$ of predication-fibrations.** That is the larger context the closure-2-monad acts on. $\mathbf{PS}$ is a 1-category, not a 2-category.

## See also

- [predication-settling-objects-and-preorder-morphisms-form-a-category](../../../learning/claims/predication-settling-objects-and-preorder-morphisms-form-a-category.md) — the claim that $\mathbf{PS}$ satisfies Mac Lane's axioms.
- [predication-settling](../../../../code/structures/predication-settling.md) — the object class.
- [predication-settling-preorder-morphism](../../../../code/transformers/predication-settling-preorder-morphism.md) — the morphism class.
- [modeling-morphism](../../../../code/transformers/modeling-morphism.md) — the transverse morphism class indexed by the truth-order.
- [order-of-knowledge](order-of-knowledge.md), [order-of-truth](order-of-truth.md) — the two transverse orders the two morphism classes index.
- [predication-fiber-algebra](../../../../code/structures/predication-fiber-algebra.md), [predication-valuation](../../../../code/structures/predication-valuation.md) — the pointwise carriers where $\leq_k$ acts.
- [closure-2-monad](../../../../code/transformers/closure-2-monad.md) — the 2-functor whose 1-categorical restriction acts on $\mathbf{PS}$.
- [joining-by-knowledge](../../../../code/transformers/joining-by-knowledge.md) — the binary operation whose monotonicity gives positing as a $\mathbf{PS}$-endomorphism.
