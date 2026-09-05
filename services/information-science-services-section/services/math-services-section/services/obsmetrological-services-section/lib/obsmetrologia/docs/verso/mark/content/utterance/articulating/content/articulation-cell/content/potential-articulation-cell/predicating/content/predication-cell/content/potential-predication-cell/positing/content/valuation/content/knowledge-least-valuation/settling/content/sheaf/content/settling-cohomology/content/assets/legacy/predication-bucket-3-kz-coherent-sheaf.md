---
kind: concept
type: condition
depends-on: [bitopological-settling-site, temporal-2-category, gray-street-fibration-monad, emmenegger-fibration-comonad, closure-2-monad]
---

# KZ-coherent sheaf

A descent condition that handles the 2-cell content of [aperiodic regime](../theorems/four-regime-dichotomy.md) at the level of *sheaves* on the [bitopological settling site](../objects/bitopological-settling-site.md), rather than building 2-site machinery into the site itself.

A sheaf $F$ on $(\mathbf{T}^*, J)$ is **KZ-coherent** iff for every pair of parallel 1-cells

$$f, f' : (q', \tau', U') \to (q, \tau, U)$$

connected by an invertible 2-cell $\alpha : f \Rightarrow f'$ arising from the KZ-lax-idempotent coherence of [$\mathbb{M} \dashv \mathbb{N}$](../theorems/emmenegger-fibration-comonad.md) or of [$\mathrm{Cl}$](../morphisms/closure-2-monad.md) on the [temporal 2-category](../objects/temporal-2-category.md), the induced section maps agree:

$$F(f) \;=\; F(f') \,:\; F(q, \tau, U) \to F(q', \tau', U').$$

The full subcategory of KZ-coherent sheaves is denoted $\mathrm{Sh}^{\mathrm{KZ}}(\mathbf{T}^*, J)$. Throughout the cohomological development "sheaf on $\mathbf{T}^*$" means KZ-coherent sheaf, and $H^n(\mathbf{T}^*, F)$ refers to cohomology computed in this subcategory.

## Why this condition

The site is 1-truncated; the temporal 2-category $\mathbf{T}(\mathcal{C}, \lambda)$ carries non-trivial 2-cells throughout in the aperiodic regime ([transfinite-induction settling](../examples/transfinite-induction-settling.md) Corollary 3.3.7). KZ-coherence requires that a sheaf assign the same data to two parallel routes between objects whenever those routes are KZ-equivalent — i.e., that the sheaf does not see distinctions between routes that the underlying 2-categorical structure declares equivalent. The condition is non-trivial only in the transfinite-bounded and aperiodic regimes; in [the strict and Scott-continuous regimes](../theorems/four-regime-dichotomy.md) all KZ 2-cells are identity and the condition is vacuous.
