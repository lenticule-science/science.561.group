---
type: theorem
status: sketch
depends-on: [antonymy, negation-twisted-settling, negation-invisibility, strong-mld-via-composed-duality, synonymy-criterion, four-regime-dichotomy]
see-also: [synonymy-criterion, settling-fiber-groupoid, mutually-locally-derivable, equivariant-settling-cohomology]
---

# Antonymy criterion

> **Status.** Sketch — the regime-specific detection in the transfinite-bounded and aperiodic cases depends on [strong-mld-via-composed-duality](strong-mld-via-composed-duality.md), whose spatial-side preservation is sketch status. The strict and Scott-continuous cases are fully proved (they reduce to [synonymy-criterion](synonymy-criterion.md) by [negation-invisibility](negation-invisibility.md)).

Let $v, v'$ be [predication settlings](../objects/predication-settling.md) over a common base $B = (\mathbf{L}, \mathcal{C}, E, \lambda)$ with $\mathrm{reg}(v) = \mathrm{reg}(v')$. Then $v \sim_{\mathrm{ant}} v'$ iff the regime-specific condition holds:

| Regime | $v \sim_{\mathrm{ant}} v'$ iff |
|---|---|
| Strict | $v \sim_{\mathrm{syn}} v'$ (antonymy = synonymy; negation-invisibility) |
| Scott-continuous | $v \sim_{\mathrm{syn}} v'$ (same) |
| Transfinite-bounded | same firing ordinals AND $\tau^{\mathbb D}(v) = \varepsilon \circ \tau^{\mathbb D}(v')$, where $\varepsilon$ flips truth-only $\leftrightarrow$ falsity-only and fixes $\top$ |
| Aperiodic | same, in $H^1(\mathbf{T}^*_{\leq \omega_1}, \mathcal{F}_U^{\mathrm{univ}}) \times \mathrm{Orbit}(v)$ |

## Proof

**Strict and Scott-continuous.** By [negation-invisibility](negation-invisibility.md), $[\sim(v')]_{\mathrm{syn}} = [v']_{\mathrm{syn}}$. Hence:

$$v \sim_{\mathrm{ant}} v' \;\iff\; v \sim_{\mathrm{sMLD}} \sim(v') \;\iff\; v \sim_{\mathrm{MLD}} \sim(v') \;\iff\; v \sim_{\mathrm{MLD}} v' \;\iff\; v \sim_{\mathrm{syn}} v'.$$

(In these regimes, strong-MLD = ordinary MLD since there are no NSC firings and $\tau^{\mathbb D}$ is vacuous.) $\square$

**Transfinite-bounded.** By [strong-MLD classification](strong-mld-via-composed-duality.md): $v \sim_{\mathrm{sMLD}} \sim(v')$ iff $\mathrm{cl\text{-}inv}^{\mathbb D}(v) = \mathrm{cl\text{-}inv}^{\mathbb D}(\sim(v'))$.

The ordinary component: $\mathrm{cl\text{-}inv}(v) = \mathrm{cl\text{-}inv}(\sim(v'))$. By [firing-pattern preservation](../objects/negation-twisted-settling.md), $\sim(v')$ has the same firing ordinals as $v'$, so $\mathrm{cl\text{-}inv}(\sim(v')) = \mathrm{cl\text{-}inv}(v')$. The condition reduces to: same firing ordinals for $v$ and $v'$.

The orbit-type component: $\tau^{\mathbb D}(v) = \tau^{\mathbb D}(\sim(v'))$. Applying $\sim$ flips each NSC firing's type (truth-only $\leftrightarrow$ falsity-only, $\top \mapsto \top$): $\tau^{\mathbb D}(\sim(v'))(\mu) = \varepsilon(\tau^{\mathbb D}(v')(\mu))$ for each $\mu \in L_{\mathrm{ns}}$. The condition becomes $\tau^{\mathbb D}(v) = \varepsilon \circ \tau^{\mathbb D}(v')$. $\square$ (sketch, pending strong-MLD spatial-side)

**Aperiodic.** Identical argument in $H^1(\mathbf{T}^*_{\leq \omega_1}, \mathcal{F}_U^{\mathrm{univ}}) \times \mathrm{Orbit}(v)$. $\square$ (sketch)

## Comparison with the synonymy criterion

| Regime | $v \sim_{\mathrm{syn}} v'$ iff | $v \sim_{\mathrm{ant}} v'$ iff |
|---|---|---|
| Strict | stage-by-stage bijection of designated-cell sets | (same — antonymy = synonymy) |
| Scott-continuous | same | (same) |
| Transfinite-bounded | $\mathrm{cl\text{-}inv}(v) = \mathrm{cl\text{-}inv}(v')$ | same firing ordinals AND $\tau^{\mathbb D}(v) = \varepsilon \circ \tau^{\mathbb D}(v')$ |
| Aperiodic | $H^1$-class agreement in $H^1(\mathbf{T}^*_{\leq \omega_1}, \mathcal{F}_U^{\mathrm{univ}})$ | same AND evidence-flipped orbit-type agreement |

The antonymy criterion is strictly finer than synonymy in the transfinite-bounded and aperiodic regimes. Synonymy checks whether two settlings share firing ordinals; antonymy additionally checks whether they fire with evidence-flipped polarity at every such ordinal.

## Self-antonymy criterion

$v \sim_{\mathrm{ant}} v$ iff $v \sim_{\mathrm{sMLD}} \sim(v)$, which holds iff $\tau^{\mathbb D}(v) = \varepsilon \circ \tau^{\mathbb D}(v)$ — every NSC firing of $v$ is a $\top$-firing ($\varepsilon$ fixes only $\top$). In strict and Scott-continuous regimes, $v$ is trivially self-antonymous (no NSC firings). In the higher regimes, self-antonymy is the paraconsistent condition.
