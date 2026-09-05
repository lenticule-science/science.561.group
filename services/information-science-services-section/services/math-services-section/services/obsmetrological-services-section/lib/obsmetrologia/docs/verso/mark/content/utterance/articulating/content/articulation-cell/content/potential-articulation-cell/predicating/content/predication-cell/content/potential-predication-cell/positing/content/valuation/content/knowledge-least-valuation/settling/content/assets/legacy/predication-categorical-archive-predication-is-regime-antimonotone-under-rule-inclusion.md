---
title: "Is the settling regime antimonotone under closure-rule system inclusion?"
kind: question
status: answered
asked-at: 2026-05-11
answered-at: 2026-05-11
answer-summary: "Yes. If S' ⊆ S then reg(S') ≤ reg(S): removing rules cannot increase the regime. The non-Scott-continuous firing ordinals of a sub-system are a subset of those of the full system."
---

## Is settling regime antimonotone under rule-set inclusion?

The settlement-path engineering theorem ([settlement-path-as-regime-descent](../../../engineering/theories/tech/theories/computing/theories/predicated-computing/theories/agential-orchestration-platform/theorems/settlement-path-as-regime-descent.md)) claims that maturation F₀ → F₁ → F₂ → F₃ is a *strict descent* through regimes. The underlying predication-category claim is that regime is monotonically controlled by the closure-rule system: adding rules with higher antecedent complexity raises the regime, and removing them lowers it.

## Answer

For $\mathcal{S}' \subseteq \mathcal{S}$, every non-Scott-continuous firing ordinal of $\mathcal{S}'$ is also a non-Scott-continuous firing ordinal of $\mathcal{S}$ (since the firing uses a rule from $\mathcal{S}' \subseteq \mathcal{S}$). So $L_{\mathrm{ns}}(\mathcal{S}') \subseteq L_{\mathrm{ns}}(\mathcal{S})$, hence $\kappa(\mathcal{S}') \leq \kappa(\mathcal{S})$, hence $\mathrm{reg}(\mathcal{S}') \leq \mathrm{reg}(\mathcal{S})$ in the [regime chain order](../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/regime-chain-order.md).

Removing rules cannot increase the regime.

The formal theorem is [regime-antimonotonicity](../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/regime-antimonotonicity.md).
