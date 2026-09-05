---
kind: theorem
status: proved
lean:
  - SpatiotemporalKnowledgeSystem.Homebrew.Algebra.FOURTheorems.exists_fusion_not_commute_negation
  - SpatiotemporalKnowledgeSystem.Homebrew.Algebra.FOURTheorems.exists_twResiduum_not_commute_negation
depends-on: [four-bilattice, twist-product-fusion, twist-product-right-residual, negation, conflation]
---

# Contrapositive failure

Neither the [twist-product fusion](../morphisms/twist-product-fusion.md) $\odot$ nor the [twist-product right residual](../morphisms/twist-product-right-residual.md) $\Rightarrow$ commutes with the [negation](../morphisms/negation.md) $\sim$ or [conflation](../morphisms/conflation.md) $-$ in general. Specifically, there exist $a, b \in$ [$\mathbf{FOUR}$](../objects/four-bilattice.md) with $\sim(a \odot b) \neq \sim a \odot \sim b$, and $a', b' \in \mathbf{FOUR}$ with $\sim(a' \Rightarrow b') \neq \sim a' \Rightarrow \sim b'$.

## Proof

For $\odot$, take $a = \mathbf{t}, b = \mathbf{f}$. Then

$$\mathbf{t} \odot \mathbf{f} = \langle 1 \cdot 0,\ (1 \to 1) \wedge (0 \to 0) \rangle = \langle 0, 1 \rangle = \mathbf{f},$$

so $\sim(\mathbf{t} \odot \mathbf{f}) = \sim \mathbf{f} = \mathbf{t}$. Conversely,

$$\sim \mathbf{t} \odot \sim \mathbf{f} = \mathbf{f} \odot \mathbf{t} = \mathbf{f}$$

by absorption of $\mathbf{f}$ under $\odot$. So $\mathbf{t} \neq \mathbf{f}$.

For $\Rightarrow$, take $a' = \bot, b' = \mathbf{t}$. Then

$$\bot \Rightarrow \mathbf{t} = \langle (0 \to 1) \wedge (0 \to 0),\ 0 \cdot 0 \rangle = \langle 1, 0 \rangle = \mathbf{t},$$

so $\sim(\bot \Rightarrow \mathbf{t}) = \mathbf{f}$. Conversely,

$$\sim \bot \Rightarrow \sim \mathbf{t} = \bot \Rightarrow \mathbf{f} = \langle (0 \to 0) \wedge (1 \to 0),\ 0 \cdot 1 \rangle = \langle 0, 0 \rangle = \bot.$$

So $\mathbf{f} \neq \bot$. $\square$

## Remark

The failure of naive contrapositive and the success of the [Nelson identity](nelson-identity.md) — Nelson's corrected contrapositive — are two sides of the same structural fact: the twist-product residuation has a non-trivial interaction with negation, captured exactly by the Nelson identity.
