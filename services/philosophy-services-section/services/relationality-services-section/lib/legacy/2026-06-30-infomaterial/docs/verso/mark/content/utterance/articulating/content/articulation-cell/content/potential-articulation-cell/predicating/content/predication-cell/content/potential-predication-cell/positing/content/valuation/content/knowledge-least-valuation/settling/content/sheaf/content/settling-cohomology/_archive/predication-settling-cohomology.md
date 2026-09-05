---
type: definition
realizes: [cohomological-equivalence]
class: derived-functor
symbol: "H^n(\\mathbf{T}^*, -)"
closes: settling-associated-sheaf
depends-on: [bitopological-settling-site, kz-coherent-sheaf, kz-coherent-sheaves-reflective, settling-associated-sheaf, settling-bound]
---

# Settling cohomology

The cohomology of a [KZ-coherent sheaf](teaching/explanations/kz-coherent-sheaf.md) on the [bitopological settling site](bitopological-settling-site.md), defined as right-derived functors of bounded global sections plus a direct limit over the [settling bound](settling-bound.md).

## Bounded global sections

The site $\mathbf{T}^*_{\mathrm{site}}$ does not in general have a terminal object — the [predicate category](predicate-category.md) $\mathcal{C}$ has a terminal predicate but the settling direction is unbounded. Cohomology is defined relative to a bounded sub-site.

For $\sigma \leq \kappa$ (or $\sigma < \infty$), let $\mathbf{T}^*_{\leq \sigma}$ be the full subcategory of $\mathbf{T}^*_{\mathrm{site}}$ on objects $(q, \tau, U)$ with $\tau \leq \sigma$, with topology $J_{\leq \sigma}$ inherited by restriction. The **bounded global sections functor** is

$$\Gamma_{\leq \sigma}(F) \;:=\; \varprojlim_{(q, \tau, U) \in \mathbf{T}^{*, \mathrm{op}}_{\leq \sigma}} F(q, \tau, U).$$

When $\sigma$ is a successor ordinal with a canonical maximum object — e.g., for $\mathcal{C}$ with terminal predicate $\mathbf{1}_\mathcal{C}$ and $\sigma$ a successor, the object $(\mathbf{1}_\mathcal{C}, \sigma, X^\sigma_{\mathbf{1}_\mathcal{C}})$ — $\Gamma_{\leq \sigma}(F)$ simplifies to $F(\mathbf{1}_\mathcal{C}, \sigma, X^\sigma_{\mathbf{1}_\mathcal{C}})$.

## Definition

For a sheaf $F \in \mathrm{Sh}^{\mathrm{KZ}}(\mathbf{T}^*, J)$ and an ordinal bound $\sigma$, the **$n$-th bounded cohomology** is

$$H^n(\mathbf{T}^*_{\leq \sigma}, F) \;:=\; R^n \Gamma_{\leq \sigma}(F),$$

the $n$-th right-derived functor. The **unbounded cohomology** is the direct limit

$$H^n(\mathbf{T}^*, F) \;:=\; \varinjlim_\sigma \, H^n(\mathbf{T}^*_{\leq \sigma}, F),$$

compatible with the settling's monotone structure.

Well-definedness: the source category has [enough injectives](../theorems/kz-coherent-sheaves-reflective.md), $\Gamma_{\leq \sigma}$ is left-exact, and standard derived-functor machinery ([@kashiwara-schapira2006] §13.3) produces $R^n \Gamma_{\leq \sigma}$ canonically. Filtered colimits in $\mathbf{Ab}$ are exact (AB5), so the direct-limit step preserves the $\delta$-functor structure.

## Low-degree interpretation

**$H^0$.** Sections consistent across all predicates, all settling stages, all pairwise-Stone clopens. For the [settling-associated sheaf](settling-associated-sheaf.md):

$$H^0(\mathbf{T}^*, \mathcal{F}_U) \;\cong\; \mathbb{Z}^{\Delta^{+,*}_\infty},$$

the free abelian group on points eventually designated across the full settling. Counts cells of the converged state. For the [paraconsistent variant](paraconsistent-settling-associated-sheaf.md), $H^0$ also counts $\top$-valued cells.

**$H^1$.** First obstructions — gluing failures not detected at the level of sections. Two physical interpretations specialize a single structural fact (obstructions to extending local consistency to global consistency):

- *CRDT-coordination obstructions.* For two replicas with merge $v_1 \vee_k v_2$, a non-trivial class in $H^1$ of the associated [replica Mayer–Vietoris](../theorems/replica-mayer-vietoris.md) cover indicates the local states cannot be merged without coordination. The [CRDT convergence](../theorems/crdt-convergence.md) theorem is equivalent to vanishing of a specific $H^1$-class.

- *Aperiodic-settling non-stabilization obstructions.* For a [aperiodic-regime](../theorems/four-regime-dichotomy.md) settling, $H^1(\mathbf{T}^*_{\leq \omega_1}, \mathcal{F}_U)$ contains the [aperiodic classifying invariant](aperiodic-classifying-invariant.md). Zero iff the settling stabilizes before $\omega_1$; non-zero iff genuinely aperiodic.

**$H^{\geq 2}$.** Vanishes for settling-associated sheaves under $\mathrm{cd}(\mathcal{C}^{\mathrm{op}}) \leq 1$ on the [predicate category](predicate-category.md): [settling-cohomology vanishes above degree 1](../theorems/settling-cohomology-vanishes-above-degree-1.md). The hypothesis holds automatically for all corpus instances built from the four predicate generators on finite predicate sets; downstream theorems using $H^{\geq 2} = 0$ — most prominently the [SKH deformation Ext-classification](../theorems/skh-deformation-ext-classification.md)'s unobstructedness — inherit it.
