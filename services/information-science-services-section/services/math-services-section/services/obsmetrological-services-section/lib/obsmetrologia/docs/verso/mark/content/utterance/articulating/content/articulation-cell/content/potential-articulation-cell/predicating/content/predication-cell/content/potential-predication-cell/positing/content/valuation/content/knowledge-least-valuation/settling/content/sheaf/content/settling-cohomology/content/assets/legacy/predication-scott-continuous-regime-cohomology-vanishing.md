---
type: theorem
status: proved
depends-on: [settling-cohomology, settling-associated-sheaf, scott-continuous-closure, settling-continuity, four-regime-dichotomy, strict-regime-cohomology-vanishing]
---

# Scott-continuous regime: $\omega$-Scott cohomology vanishing

For a predication settling with infinite $E$ or $\mathcal{C}$ but [Scott-continuous closure](../../../../../../../../../../../pre-bilattice/content/bilattice/content/predication-fiber-algebra/content/closure-operator/content/scott-continuous-closure/scott-continuous-closure.md) and closure ordinal $\kappa \leq \omega$ ([Scott-continuous regime](../../../../../../../references/four-regime-dichotomy.md)):

$$H^n(\mathbf{T}^*, \mathcal{F}_U^{(\bullet)}) \;\cong\; \begin{cases} \displaystyle\varinjlim_{n < \omega} \mathbb{Z}^{N_\bullet(n)} & n = 0, \\ 0 & n \geq 1. \end{cases}$$

## Proof

Scott-continuity gives that the [settling-associated sheaf](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../engineering-services-section/services/computer-engineering-services-section/services/computer-systems-engineering-services-section/services/agent-computer-system-engineering-services-section/apps/agentic-relation-engine/lib/relating/docs/settling-associated-sheaf.md) on the $\omega$-limit is the filtered colimit of the finite-stage sheaves:

$$\mathcal{F}_U|_\omega \;\cong\; \varinjlim_{n < \omega} \mathcal{F}_U|_n.$$

Derived functors commute with filtered colimits in $\mathbf{Ab}$ (AB5; [@grothendieck1957]):

$$H^q(\mathbf{T}^*_{\leq \omega}, \mathcal{F}_U^{(\bullet)}) \;\cong\; \varinjlim_{n < \omega} H^q(\mathbf{T}^*_{\leq n}, \mathcal{F}_U^{(\bullet)}).$$

Each finite-stage cohomology vanishes in positive degree by [strict-regime cohomology vanishing](../../../references/strict-regime-cohomology-vanishing.md); the filtered colimit of zero abelian groups is zero, so $H^{\geq 1} = 0$.

For $H^0$: the colimit of the finite-designation counts $\mathbb{Z}^{N_\bullet(n)}$ is the direct-limit abelian group, an $\aleph_0$-rank free $\mathbb{Z}$-module enumerating cells eventually designated across the full settling. $\square$

## Scott-continuity as a cohomological criterion

Scott-continuity is precisely what makes filtered colimits commute with the settling endofunctor — and hence commute with derived functors. A failure of Scott-continuity at some ordinal $\mu$ means $\mathcal{F}_U$ has a "jump" at $\mu$ not present in the filtered colimit of earlier stages. These jumps are exactly the generators of $H^1$ in [transfinite-bounded regime](transfinite-bounded-regime-h1-generators.md).

Hence vanishing in the strict and Scott-continuous regimes shares a common cause — Scott-continuity (vacuous in the strict regime, hypothetical in the Scott-continuous regime) makes filtered colimits commute with derived functors — while the transfinite-bounded and aperiodic regimes pick up cohomological content precisely where this commutativity fails.

## Consequence — trivial classifying invariant

As in the strict regime, the [aperiodic classifying invariant](../objects/aperiodic-classifying-invariant.md) is zero on the Scott-continuous regime; the classifying mechanism distinguishes Scott-continuous settlings only by $H^0$-count. The structural content of a Scott-continuous settling is exhausted by *which* cells are eventually designated; *when* they are designated does not contribute cohomologically.
