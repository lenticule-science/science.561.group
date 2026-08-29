---
kind: theorem
status: sketch
depends-on: [non-scott-continuous-firing-ordinal, settling-cohomology, settling-associated-sheaf, four-regime-dichotomy, scott-continuous-closure]
---

# Transfinite-bounded regime: $H^1$-generators at non-Scott-continuous firings

For a knowledge presheaf in [transfinite-bounded regime](four-regime-dichotomy.md) with closure ordinal $\omega < \kappa < $ state-space cofinality:

$$H^1(\mathbf{T}^*_{\leq \kappa}, \mathcal{F}_U) \;\cong\; \bigoplus_{\mu \in L_{\mathrm{ns}}(\kappa)} \mathbb{Z},$$

one copy of $\mathbb{Z}$ per [non-Scott-continuous firing ordinal](../concepts/non-scott-continuous-firing-ordinal.md) below $\kappa$, with generator $e_\mu$ corresponding to the newly-added cell at $\mu$. Higher cohomology vanishes by [settling cohomology vanishes above degree 1](settling-cohomology-vanishes-above-degree-1.md).

## Proof

The settling in the transfinite-bounded regime is Scott-continuous on each directed sub-system not crossing a firing ordinal; between firing ordinals, Scott-continuous arguments apply (filtered colimits of trivial cohomology) and give vanishing $H^1$.

**Generator construction at each firing.** At a non-Scott-continuous firing ordinal $\mu$, the settling's failure to commute with filtered colimits produces a cokernel in the chain map $\varinjlim_\sigma \mathcal{F}_U|_\sigma \to \mathcal{F}_U|_\mu$. This cokernel lives in one degree of the total complex (the "jump degree") and contributes exactly one new generator to $H^1$ at the firing ordinal.

Concretely: at $\mu$, the cell $(s_\mu, o_\mu) \in E \times E$ newly added by the non-Scott-continuous closure firing contributes an element $e_\mu \in \mathcal{F}_U^{(t)}(q_\mu, \mu)$ not in the image of any $\mathcal{F}_U^{(t)}(q', \sigma)$ for $\sigma < \mu$. This element is a cocycle (in the kernel of the next differential because no later firing eliminates it) but not a coboundary (no earlier element maps to it). So $[e_\mu] \in H^1$ is non-zero.

**Linear independence.** The collection $\{[e_\mu]\}_{\mu \in L_{\mathrm{ns}}(\kappa)}$ is $\mathbb{Z}$-linearly independent: a linear combination $\sum_\mu a_\mu e_\mu = 0$ in $H^1$ means it is a coboundary, which requires the original cochain to be in the image of $\mathcal{F}_U|_\sigma$ for some $\sigma < \min\{\mu : a_\mu \neq 0\}$ — contradicting the newly-addedness of each $e_\mu$ at its respective $\mu$.

**Completeness.** Every $H^1$-class arises as such a linear combination: the [@ayzenberg-magai2025] minimal-cochain-complex algorithm applied to the transfinite-bounded cochain complex has generators indexed by newly-added cells at firing ordinals, and these are exactly the $e_\mu$. $\square$

## The aperiodic classifying invariant in the transfinite-bounded regime

The [aperiodic classifying invariant](../objects/aperiodic-classifying-invariant.md) for a transfinite-bounded settling is

$$\mathrm{cl}\text{-}\mathrm{inv}(v) \;=\; \sum_{\mu \in L_{\mathrm{ns}}(\kappa)} e_\mu \;\in\; H^1(\mathbf{T}^*_{\leq \kappa}, \mathcal{F}_U^{(t)})$$

— the sum of all non-Scott-continuous firing contributions. The "identity class" definition coincides with summing all non-trivial $H^1$-generators.

## MLD interpretation

Two transfinite-bounded knowledge presheaves are [mutually-locally-derivable](../concepts/mutually-locally-derivable.md) iff their non-Scott-continuous-firing-set structures agree up to settling-shift. This is concretely checkable — finer than MLD-equivalence for the strict regime (trivial invariant), coarser than full settling-isomorphism.
