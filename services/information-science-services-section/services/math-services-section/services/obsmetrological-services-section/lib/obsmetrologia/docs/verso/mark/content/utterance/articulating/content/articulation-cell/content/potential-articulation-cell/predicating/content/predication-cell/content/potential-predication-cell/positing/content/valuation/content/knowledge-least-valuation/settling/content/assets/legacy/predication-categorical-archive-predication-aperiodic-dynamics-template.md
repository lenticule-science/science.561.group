---
type: narrative
discusses: [aperiodic-regime-classification, anderson-putnam-direct-limit, aperiodic-settling, mutually-locally-derivable, settling-cohomology]
---

# The aperiodic-dynamics template

The [aperiodic-regime classification theorem](../../aperiodic-settling/references/aperiodic-regime-classification.md) is the predication settling analogue of [@anderson-putnam1998]'s classification of substitution tilings via inverse-limit cohomology, and more broadly of the aperiodic-tiling cohomology tradition systematized in [@sadun2008]'s *Topology of Tiling Spaces*. The analogy is structural and worth tracing carefully.

## Tilings

A substitution tiling space $\Omega_\omega$ is an inverse limit

$$\Omega_\omega \;\cong\; \lim_{\leftarrow}\, \bigl(\Gamma_\omega \xleftarrow{\omega} \Gamma_\omega \xleftarrow{\omega} \cdots\bigr)$$

of finite cell complexes under a substitution self-map. The [Anderson–Putnam direct limit](../../objects/anderson-putnam-direct-limit.md) makes the cohomology of $\Omega_\omega$ the *direct* limit of induced cohomology maps:

$$\check{H}^n(\Omega_\omega) \;=\; \varinjlim\,\bigl(\check{H}^n(\Gamma_\omega) \xrightarrow{\omega^*} \check{H}^n(\Gamma_\omega) \to \cdots\bigr).$$

Two substitution tilings are *mutually locally derivable* iff their cohomology classes agree ([@anderson-putnam1998]; [@sadun2008] Ch. 4).

## predication settlings

A [aperiodic settling](../../aperiodic-settling/aperiodic-settling.md) is a transfinite coalgebra orbit on the dualized temporal 2-category. Its [settling cohomology](../../sheaf/content/settling-cohomology/settling-cohomology.md) at the closure ordinal is the direct limit of finite-truncation cohomologies under settling-advancement maps:

$$H^1(\mathbf{T}^*_{\leq \omega_1}, \mathcal{F}_U) \;=\; \varinjlim_{\tau < \omega_1}\, H^1(\mathbf{T}^*_{\leq \tau}, \mathcal{F}_U).$$

Two aperiodic settlings are [mutually locally derivable](../../teaching/explanations/mutually-locally-derivable.md) iff their [aperiodic classifying invariants](../../objects/aperiodic-classifying-invariant.md) agree.

## What transfers and what doesn't

The structural story is the same: aperiodic structure is classified cohomologically, via direct limits of finite-stage invariants. What differs is the technical machinery:

- *Tilings* use branched-manifold inverse limits with Čech cohomology and abelian-group coefficients.
- *predication settlings* use bitopological-site direct limits with derived-functor cohomology on $\mathbf{Ab}$.

The branched-manifold / inverse-limit machinery of tilings carries technical baggage — $C^*$-algebras, $K$-theory, Anderson–Putnam collaring, branched-manifold inverse limits — most of which is specific to the geometric tiling setting. The cohomological direct-limit framework transfers cleanly without invoking that machinery.

## Pattern-equivariant cohomology

Kellendonk–Putnam pattern-equivariant cohomology ([@sadun2007], arXiv:math/0602066) provides further language: cohomology that is invariant under the substitution dynamics. A "settling-equivariant cohomology" analogue — cohomology invariant under the [closure 2-monad](../../morphisms/closure-2-monad.md)'s action — would be a natural refinement of the construction here. Not pursued here, but the parallel would track settling pattern-equivariant invariants, complementing the [equivariant settling cohomology](../../sheaf/content/settling-cohomology/references/equivariant-settling-cohomology.md) under the negation gauge.
