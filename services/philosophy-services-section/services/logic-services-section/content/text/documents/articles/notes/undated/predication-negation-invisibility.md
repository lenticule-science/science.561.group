---
type: theorem
status: proved
depends-on: [negation-twisted-settling, synonymy, synonymy-criterion, negation, equivariant-settling-cohomology]
see-also: [antonymy, antonymy-criterion, strong-mld-via-composed-duality, internal-z2-gauge]
title: Negation-invisibility of synonymy
description: For every predication settling $v$ over any base $B = (\mathbf{L}, \mathcal{C}, E, \lambda)$,
---

# Negation-invisibility of synonymy

For every predication settling $v$ over any base $B = (\mathbf{L}, \mathcal{C}, E, \lambda)$,

$$v \sim_{\mathrm{syn}} \sim(v).$$

The [negation-twist](../../research/2026/07/31/lenticule-import/objects/negation-twisted-settling.md) $\sim(-): \mathbf{PS}(B) \to \mathbf{PS}(B)$ acts trivially on [synonymy](../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/mutually-locally-derivable/content/synonymy/synonymy.md) classes: $[\sim(v)]_{\mathrm{syn}} = [v]_{\mathrm{syn}}$.

## Proof

By the [synonymy criterion](../../research/2026/07/31/lenticule-import/from-predicate-category/synonymy-criterion.md), the verification is regime-by-regime.

**Strict and Scott-continuous.** $v \sim_{\mathrm{syn}} v'$ iff there is a stage-by-stage bijection of designated-cell sets, up to ordinal shift. By [firing-pattern preservation](../../research/2026/07/31/lenticule-import/objects/negation-twisted-settling.md): $v$ and $\sim(v)$ have identical designated-cell sets at every stage (on $\mathbf{FOUR}$: $\sim$ fixes $\bot$). The identity bijection at each stage, with shift $\delta = 0$, witnesses $v \sim_{\mathrm{syn}} \sim(v)$. $\square$

**Transfinite-bounded.** $v \sim_{\mathrm{syn}} v'$ iff $\mathrm{cl\text{-}inv}(v) = \mathrm{cl\text{-}inv}(v')$ — their $H^1$ classes agree. The $H^1$-invariant is determined by the firing-ordinal set. By firing-pattern preservation, $v$ and $\sim(v)$ have the same firing-ordinal set; hence the same $\mathrm{cl\text{-}inv}$; hence $v \sim_{\mathrm{syn}} \sim(v)$. $\square$

**Aperiodic.** Identical argument: $\mathrm{cl\text{-}inv}(v)$ in $H^1(\mathbf{T}^*_{\leq \omega_1}, \mathcal{F}_U^{\mathrm{univ}})$ is determined by firing ordinals, which are shared between $v$ and $\sim(v)$. $\square$

## Cohomological reading

The cohomological face of this theorem is the "effective triviality" result in [equivariant-settling-cohomology](../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/sheaf/content/settling-cohomology/references/equivariant-settling-cohomology.md): for settling-associated sheaves tracking $\mathbf{t}$-cells, the $\mathbb{Z}/2$-gauge action is trivial — equivariant cohomology adds no distinguishing data beyond the ordinary $H^1$ class. The present theorem is the settling-level statement: the ordinary MLD classification, which uses only the $H^1$ rank (not the equivariant structure), cannot distinguish $v$ from $\sim(v)$.

## What negation-invisibility implies for antonymy

Any attempt to define antonymy as "synonymy up to negation-twist" — $v \sim_{\mathrm{ant}}^? v' \;{:=}\; v \sim_{\mathrm{syn}} \sim(v')$ — would reduce to ordinary synonymy, since $[\sim(v')] = [v']$. A non-trivial notion of antonymy must employ a finer equivalence.

## What the negation-twist does distinguish

The $\mathbb{Z}/2$-gauge is invisible to ordinary MLD but visible to [strong-MLD](../../research/2026/07/31/lenticule-import/from-predicate-category/strong-mld-via-composed-duality.md). The firing-orbit-type function $\tau^{\mathbb D}$ distinguishes truth-only from falsity-only NSC firings; applying $\sim$ flips these types while fixing $\top$-firings. Hence $v \not\sim_{\mathrm{sMLD}} \sim(v)$ whenever $v$ has any truth-only or falsity-only NSC firings. See [antonymy](../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/mutually-locally-derivable/content/synonymy/content/antonymy/antonymy.md).
