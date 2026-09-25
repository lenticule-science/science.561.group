---
type: theorem
status: proved
depends-on: [non-scott-continuous-firing-ordinal, settling-cohomology, settling-associated-sheaf, transfinite-bounded-regime-h1-generators, anderson-putnam-direct-limit, four-regime-dichotomy, aperiodic-settling]
---

# Aperiodic-regime cohomology via direct limit

> **Status note.** `proved`. The additional content of this theorem beyond its dependency on [transfinite-bounded-regime-h1-generators](transfinite-bounded-regime-h1-generators.md) (now also `proved`) is structurally trivial: filtered colimit of finite-stage cohomologies, where each stage is handled by a named theorem, and the colimit is the standard categorical operation on $\mathbf{Ab}$.

For a predication settling in [aperiodic regime](../../../../../references/four-regime-dichotomy.md) with closure ordinal $\kappa \geq \omega_1$:

$$H^1(\mathbf{T}^*_{\leq \kappa}, \mathcal{F}_U^{(t)}) \;\cong\; \varinjlim_{\tau < \kappa} \, H^1(\mathbf{T}^*_{\leq \tau}, \mathcal{F}_U^{(t)}) \;\cong\; \bigoplus_{\mu \in L_{\mathrm{ns}}(\kappa)} \mathbb{Z}.$$

## Proof

The direct-limit formula is the unbounded definition of [settling cohomology](../../settling-cohomology/settling-cohomology.md) combined with the aperiodic-regime structure. Each truncation $\mathbf{T}^*_{\leq \tau}$ for $\tau < \kappa$ falls in [the Scott-continuous or transfinite-bounded regime](../../../../../references/four-regime-dichotomy.md) depending on whether it contains [non-Scott-continuous firing ordinals](../../../../settling-continuity/content/non-scott-continuous-firing-ordinal/non-scott-continuous-firing-ordinal.md):

- For Scott-continuous truncations, $H^1(\mathbf{T}^*_{\leq \tau}, \mathcal{F}_U^{(t)}) = 0$.
- For transfinite-bounded truncations, [transfinite-bounded-regime $H^1$-generators](transfinite-bounded-regime-h1-generators.md) gives $H^1(\mathbf{T}^*_{\leq \tau}) \cong \bigoplus_{\mu \in L_{\mathrm{ns}}(\tau)} \mathbb{Z}$.

The direct-limit transitions are generator-including inclusions: each new firing ordinal $\mu < \kappa$ adds one new generator $e_\mu$ to the system. The filtered colimit is the direct sum over the full $L_{\mathrm{ns}}(\kappa)$. $\square$

## The Anderson–Putnam template

The proof structure mirrors the [Anderson–Putnam direct-limit](../objects/anderson-putnam-direct-limit.md) construction for substitution tilings: finite-stage cohomologies are individually tractable, the directed system has well-defined transitions, and the cohomology of the unbounded object is the colimit. Tiling cohomology uses simplicial-complex inverse limits with abelian-group coefficients; the present setting uses bitopological-site direct limits with the same coefficients. The framework transfers cleanly.

## Combinatorial restatement of the classification

Combining the present theorem with [aperiodic-regime classification](../../../../aperiodic-settling/references/aperiodic-regime-classification.md) and [transfinite-bounded-regime $H^1$-generators](transfinite-bounded-regime-h1-generators.md):

For two aperiodic settlings $v, v'$ over a common base,

$$v \sim_{\mathrm{MLD}} v' \;\iff\; L_{\mathrm{ns}}(\kappa, v) \,\cong\, L_{\mathrm{ns}}(\kappa, v') \,\text{ as settling-shift-classes,}$$

where $L_{\mathrm{ns}}(\kappa, v)$ is the non-Scott-continuous firing-ordinal set of $v$. MLD-equivalence is decided by comparing firing-ordinal sets up to settling-shift — a concrete combinatorial criterion making the [aperiodic classification](../../../../aperiodic-settling/references/aperiodic-regime-classification.md) directly checkable on specific settlings.
