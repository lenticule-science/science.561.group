---
kind: theorem
status: proved
lean:
  - SpatiotemporalKnowledgeSystem.Categorical.TwistProduct.fusion_leT_right
  - SpatiotemporalKnowledgeSystem.Categorical.TwistProduct.fusion_leT_left
  - SpatiotemporalKnowledgeSystem.Categorical.TwistProduct.twResiduum_leT_antitone_left
  - SpatiotemporalKnowledgeSystem.Categorical.TwistProduct.twResiduum_leT_monotone_right
depends-on: [twist-product, left-multiplication-operator, right-residuation-operator, truth-order]
---

# Residuation orbit monotonicity

The [left multiplication operator](../morphisms/left-multiplication-operator.md) $\mathrm{L}_a$ is monotone in the [truth order](../concepts/truth-order.md) $\leq_t$:

$$x \leq_t x' \implies a \odot x \leq_t a \odot x'.$$

The [right residuation operator](../morphisms/right-residuation-operator.md) $\mathrm{R}_a$ is antitone in its first argument and monotone in its second.

## Proof

Follows from the standard residuation identities in the [residuated lattice](../objects/residuated-lattice.md) $\mathbf{L}$ applied cellwise on the carrier $L \times L$ of $\mathbf{L}^\bowtie$. $\square$
