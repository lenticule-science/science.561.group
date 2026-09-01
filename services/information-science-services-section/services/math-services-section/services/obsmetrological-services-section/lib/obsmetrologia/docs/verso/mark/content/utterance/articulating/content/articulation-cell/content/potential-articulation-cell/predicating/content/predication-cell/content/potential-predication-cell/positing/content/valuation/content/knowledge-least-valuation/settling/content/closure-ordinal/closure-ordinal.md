---
kind: definition
type: ordinal
symbol: "\\kappa"
depends-on: [settling-endofunctor, spatiotemporal-knowledge-presheaf, settling-coalgebra-structure]
---

# Closure ordinal

For a [settling endofunctor](settling-endofunctor.md) $F_U$ starting from initial state $\mathcal{E}_0$, the **closure ordinal**

$$\kappa(F_U, \mathcal{E}_0)$$

is the least ordinal $\tau$ such that $F_U^{\tau+1}(\mathcal{E}_0) = F_U^\tau(\mathcal{E}_0)$.
If no such ordinal exists in the ambient universe, $\kappa = \infty$.

By Knaster–Tarski plus transfinite induction, $\kappa \leq |\mathbf{PrFib}|^+$ in any fixed ambient — the successor cardinal of the 2-category's object class.
