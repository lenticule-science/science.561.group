---
type: narrative
discusses: [settling-moduli-stack-theorem, predication-fiber-algebra, parameter-base-topology, priestley-dual-cover-topology, twist-product]
---

# Descent via fiber-algebra sheaf

The [settling moduli stack theorem](../theorems/settling-moduli-stack-theorem.md) has one structural idea behind a long list of cases. Worth stating cleanly, because the same idea can mislead if applied wrong.

## The single fact

> The [predication fiber algebra](../objects/predication-fiber-algebra.md) $A_q = \mathbf{L}^{\bowtie E \times E}$ is a sheaf of equational algebras on the [parameter base category](../objects/parameter-base-category.md) with the [parameter base topology](../objects/parameter-base-topology.md), and **all predication settling structure is equationally specified in it**.

Equational statements in a sheaf of algebras descend by the sheaf condition: a property satisfied on each piece of a cover, agreeing on overlaps, holds on the glued whole. Combining the two — fiber algebra is a sheaf, predication settling structure is equational in fiber algebra — gives descent for predication settling structure.

## What "equationally specified" means here

Each of the seven structural components of a predication settling is a cellwise statement on the fiber algebra:

- **Fiber algebra** — pointwise [twist product](../objects/twist-product.md), functorial in $\mathbf{L}$.
- **Fibration reindexing** — the four [predicate generators](/predication-categories/library/predication-cell-complex-site/content/explanations/exhaustiveness-of-four-predication-cell-complex-site-generators.md), each a specific cellwise reindexing on $E \times E$.
- **Hyperdoctrinal conditions** — adjoint quantifier biconditionals, Frobenius, Beck–Chevalley, comprehension; each cellwise in $\mathbf{L}^\bowtie$.
- **Closure operator conditions** — monotone, inflationary, idempotent, $\mathcal{C}$-natural; each cellwise.
- **Increment sequence** — cellwise points in the fiber algebra.
- **Settling orbit** — cellwise points; settling monotonicity is cellwise $\leq_k$-inequality.

The [Priestley-dual cover topology](../objects/priestley-dual-cover-topology.md) is non-trivial precisely on $\mathrm{ResLat}_{\mathrm{dist}}$; the other three components ($\mathcal{C}, E, \lambda$) carry trivial topology, so they introduce no descent conditions on settling-morphism data.

## What it is *not*

The structural idea is *not* property-likeness. The Kelly–Lack property-likeness theorems for hyperdoctrines, [closure algebras](../theorems/closure-2-monad-lax-idempotence.md), and [$\mathbb{N}$-pseudo-coalgebras](../theorems/emmenegger-fibration-comonad.md) say something different: *given a base object, the structure on it is unique if it exists*. That is *fiber-level uniqueness*, not *cover-level descent*. The two are easy to conflate but distinct:

- Property-likeness answers: "If I have a fibration $\mathcal{E} \to \mathcal{C}$, is the cloven structure unique?"
- Descent answers: "If I have local fibrations $\mathcal{E}_i \to \mathcal{C}$ over a cover, with compatible iso-data, do they glue to a global fibration?"

The stack theorem needs descent, not property-likeness. Conflating them — invoking property-likeness for descent at, say, D3–D5 in the [stack theorem](../theorems/settling-moduli-stack-theorem.md) — produces a wrong proof: a fiber-level uniqueness argument can't establish cover-level gluing. The actual mechanism is sheaf-theoretic equational descent on the fiber algebra; property-likeness is supplementary, not a substitute.

What property-likeness *does* give is post-hoc rigidity: once descent has succeeded in producing a glued fibration, the Kelly–Lack theorems guarantee the hyperdoctrinal/closure structure on it is unique. The descent runs on its own; property-likeness ensures the answer is well-defined.

## Why this is clean

The proof of the [settling moduli stack theorem](../theorems/settling-moduli-stack-theorem.md) reduces to:

1. $\mathbf{L}$ descends as an equational algebra on $J_{\mathrm{ResLat}}$ (Beck monadicity for equational varieties).
2. $\mathbf{L}^{\bowtie E \times E}$ descends as a pointwise functor preserving equalizers.
3. Every other piece of settling data is equational in $\mathbf{L}^{\bowtie E \times E}$, so descends by sheaf-theoretic equational descent.

The seven components D1–D7 are seven instances of step 3, each a paragraph-length verification. The intellectual work is concentrated in steps 1 and 2; the rest is mechanical.

This is what makes the [stack theorem](../theorems/settling-moduli-stack-theorem.md) feasible: the predication settling machinery is heavy, but it is heavy in a *structurally homogeneous* way — every piece is cellwise in the fiber algebra, and the fiber algebra is a sheaf. One fact propagates to seven.
