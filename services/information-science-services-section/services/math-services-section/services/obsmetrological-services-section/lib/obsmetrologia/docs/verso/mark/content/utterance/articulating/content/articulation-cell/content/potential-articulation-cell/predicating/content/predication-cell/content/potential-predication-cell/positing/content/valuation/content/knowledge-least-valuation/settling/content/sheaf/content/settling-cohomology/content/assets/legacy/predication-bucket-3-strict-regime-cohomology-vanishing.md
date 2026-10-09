---
kind: theorem
status: proved
depends-on: [settling-cohomology, settling-associated-sheaf, settling-locally-constant-cohomology, settling-cohomology-vanishes-above-degree-1, four-regime-dichotomy]
---

# Strict regime: full cohomology vanishing above degree 0

For a knowledge presheaf with finite $\mathbf{L}, E, \mathcal{C}$ and closure ordinal $\kappa < \omega$ ([strict regime](../../../../../../../references/four-regime-dichotomy.md)):

$$H^n(\mathbf{T}^*, \mathcal{F}_U^{(\bullet)}) \;\cong\; \begin{cases} \mathbb{Z}^{N_\bullet} & n = 0, \\ 0 & n \geq 1, \end{cases}$$

where $N_\bullet$ counts designated cells in the corresponding designation class — $N_t$ counts $\mathbf{t}$-cells at quiescence, $N_k = N_t + N_\top$ counts $\{\mathbf{t}, \top\}$-designated cells, $N_\top$ counts $\top$-cells only.

## Proof

The strict-regime settling stabilizes at some $\tau^* < \omega$, past which the settling endofunctor is the identity. By [settling-locally-constant cohomology](../../../references/settling-locally-constant-cohomology.md), the unbounded [settling cohomology](../../../settling-cohomology.md) reduces to the bounded computation:

$$H^n(\mathbf{T}^*, \mathcal{F}_U^{(\bullet)}) \;\cong\; H^n(\mathbf{T}^*_{\leq \tau^*}, \mathcal{F}_U^{(\bullet)}).$$

On the finite sub-site $\mathbf{T}^*_{\leq \tau^*}$, all paired Priestley fibers are finite; the settling-axial filtration has finite length; the Čech nerve is a finite simplicial set. The minimal-cochain-complex computation ([@ayzenberg-magai2025] Algorithm 1) for a finite settling-associated sheaf free on finitely many designated cells collapses at $n = 0$ (every generator is a global section) and $n \geq 1$ (no 1-cycles survive in the finite settling-axial direction).

For $H^0$: the free abelian group on cells that persist from stage $\tau^*$ throughout the settling is $\mathbb{Z}^{N_\bullet}$ where $N_\bullet$ is the count of cells in the corresponding designation class. $\square$

## Consequence — trivial classifying invariant

In the strict regime, the [aperiodic classifying invariant](../objects/aperiodic-classifying-invariant.md) $\mathrm{cl}\text{-}\mathrm{inv}(v) \in H^1$ is forced to be zero. By [aperiodic-regime classification](../../../../../../aperiodic-settling/references/aperiodic-regime-classification.md), all strict-regime knowledge presheaves over a common base are MLD-equivalent up to $H^0$-count: the classifying mechanism has no discriminating power on this stratum.

This is consistent with the regime's "full stabilization" character: the settling reaches its eventual state in finitely many steps with no transfinite structural content to record.
