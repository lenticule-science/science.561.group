---
type: question
status: open
explores:
  - teaching/explanations/scott-continuous-closure-rule-system.md
  - ../../../../../../predicated-computing/concepts/closure-rule.md
---

# Four-regime classification of Nix

The concept [scott-continuous-closure-rule-system](teaching/explanations/scott-continuous-closure-rule-system.md) claims Nix sits in the strict or Scott-continuous regime, grounding the claim in the closure-rule-language criterion ("quantifier-free antecedent → Scott-continuous closure"). The full statement of the four-regime-dichotomy theorem — which lives in predication-categories' `theorems/four-regime-dichotomy.md` and is referenced from `closure-rule-language.md` and `non-scott-continuous-firing-ordinal.md` — has not been read by the author of the opening mapping pass.

The question is what additional content the four-regime-dichotomy theorem imposes that the closure-rule-language criterion alone does not capture, and whether Nix actually satisfies the additional content.

## What is unverified

- **The dichotomy's precise four regimes.** Are they exactly *strict, Scott-continuous, transfinite-bounded, aperiodic* (as referenced in `non-scott-continuous-firing-ordinal.md`)? Are there sub-conditions distinguishing strict from Scott-continuous (closure ordinal $< \omega$ vs. $= \omega$)?
- **Nix's specific regime within the Scott-continuous half.** A closure operator with quantifier-free antecedents is Scott-continuous; some such operators are also strict (closure ordinal finite per cell). Nix's closure ordinal at any specific cell is finite (each derivation has finitely many inputs and the rule fires once per derivation). Does this make Nix strict, not just Scott-continuous?
- **The cohomological consequences for Nix.** Per `non-scott-continuous-firing-ordinal.md` line 27, *"each $\mu \in L_{\mathrm{ns}}(\kappa)$ contributes exactly one $\mathbb{Z}$-generator to $H^1$."* If $L_{\mathrm{ns}}$ is empty for Nix, what does $H^1$ of Nix's settling-associated sheaf look like? Trivial?
- **Whether the four-regime-dichotomy theorem assumes a fixed parameter base $(\mathbf{L}, \mathcal{C}, E, \lambda)$.** Nix has no $\mathcal{C}$ in the substrate's sense (per [derivation-as-cell-shape](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/logic-services-section/content/text/glossary/concepts/derivation-as-cell-shape.md)). Does the theorem's statement implicitly assume $\mathcal{C}$ is non-degenerate? If so, the theorem may not apply to Nix in the form claimed by [scott-continuous-closure-rule-system](teaching/explanations/scott-continuous-closure-rule-system.md).

## What would resolve the question

Read predication-categories' `theorems/four-regime-dichotomy.md` and the supporting theorems (the cohomology theorems for each regime). Re-state the regime claim for Nix with the full theorem's content in hand. Re-anchor [scott-continuous-closure-rule-system](teaching/explanations/scott-continuous-closure-rule-system.md) to the actual theorem rather than the closure-rule-language criterion alone, and either confirm Nix's regime or surface an additional mismatch the current concept overlooks.
