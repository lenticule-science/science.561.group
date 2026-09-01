---
type: theorem
status: proved
depends-on: [negation-twisted-settling, synonymy, synonymy-criterion, negation, equivariant-settling-cohomology]
see-also: [antonymy, antonymy-criterion, strong-mld-via-composed-duality, internal-z2-gauge]
---

# Negation-invisibility of synonymy

For every predication settling $v$ over any base $B = (\mathbf{L}, \mathcal{C}, E, \lambda)$,

$$v \sim_{\mathrm{syn}} \sim(v).$$

The [negation-twist](../objects/negation-twisted-settling.md) $\sim(-): \mathbf{PS}(B) \to \mathbf{PS}(B)$ acts trivially on [synonymy](teaching/explanations/synonymy.md) classes: $[\sim(v)]_{\mathrm{syn}} = [v]_{\mathrm{syn}}$.

## Proof

By the [synonymy criterion](synonymy-criterion.md), the verification is regime-by-regime.

**Strict and Scott-continuous.** $v \sim_{\mathrm{syn}} v'$ iff there is a stage-by-stage bijection of designated-cell sets, up to ordinal shift. By [firing-pattern preservation](../objects/negation-twisted-settling.md): $v$ and $\sim(v)$ have identical designated-cell sets at every stage (on $\mathbf{FOUR}$: $\sim$ fixes $\bot$). The identity bijection at each stage, with shift $\delta = 0$, witnesses $v \sim_{\mathrm{syn}} \sim(v)$. $\square$

**Transfinite-bounded.** $v \sim_{\mathrm{syn}} v'$ iff $\mathrm{cl\text{-}inv}(v) = \mathrm{cl\text{-}inv}(v')$ — their $H^1$ classes agree. The $H^1$-invariant is determined by the firing-ordinal set. By firing-pattern preservation, $v$ and $\sim(v)$ have the same firing-ordinal set; hence the same $\mathrm{cl\text{-}inv}$; hence $v \sim_{\mathrm{syn}} \sim(v)$. $\square$

**Aperiodic.** Identical argument: $\mathrm{cl\text{-}inv}(v)$ in $H^1(\mathbf{T}^*_{\leq \omega_1}, \mathcal{F}_U^{\mathrm{univ}})$ is determined by firing ordinals, which are shared between $v$ and $\sim(v)$. $\square$

## Cohomological reading

The cohomological face of this theorem is the "effective triviality" result in [equivariant-settling-cohomology](equivariant-settling-cohomology.md): for settling-associated sheaves tracking $\mathbf{t}$-cells, the $\mathbb{Z}/2$-gauge action is trivial — equivariant cohomology adds no distinguishing data beyond the ordinary $H^1$ class. The present theorem is the settling-level statement: the ordinary MLD classification, which uses only the $H^1$ rank (not the equivariant structure), cannot distinguish $v$ from $\sim(v)$.

## What negation-invisibility implies for antonymy

Any attempt to define antonymy as "synonymy up to negation-twist" — $v \sim_{\mathrm{ant}}^? v' \;{:=}\; v \sim_{\mathrm{syn}} \sim(v')$ — would reduce to ordinary synonymy, since $[\sim(v')] = [v']$. A non-trivial notion of antonymy must employ a finer equivalence.

## What the negation-twist does distinguish

The $\mathbb{Z}/2$-gauge is invisible to ordinary MLD but visible to [strong-MLD](strong-mld-via-composed-duality.md). The firing-orbit-type function $\tau^{\mathbb D}$ distinguishes truth-only from falsity-only NSC firings; applying $\sim$ flips these types while fixing $\top$-firings. Hence $v \not\sim_{\mathrm{sMLD}} \sim(v)$ whenever $v$ has any truth-only or falsity-only NSC firings. See [antonymy](teaching/explanations/antonymy.md).
