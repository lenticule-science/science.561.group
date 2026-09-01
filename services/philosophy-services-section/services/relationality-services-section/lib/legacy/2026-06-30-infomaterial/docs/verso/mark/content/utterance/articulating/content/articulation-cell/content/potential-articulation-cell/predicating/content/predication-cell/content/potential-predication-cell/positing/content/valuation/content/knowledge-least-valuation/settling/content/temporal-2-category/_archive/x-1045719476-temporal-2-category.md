---
kind: definition
type: 2-category
symbol: "\\mathbf{T}"
depends-on: [predicate-category, settling-bound, gray-street-fibration-monad, emmenegger-fibration-comonad]
---

# Temporal 2-category

The temporal 2-category $\mathbf{T}(\mathcal{C}, \lambda)$ over a [predicate category](predicate-category.md) $\mathcal{C}$ and [settling bound](settling-bound.md) $\lambda$ has:

- **0-cells:** pairs $(\tau, X)$ with $\tau < \lambda$ an ordinal and $X \in \mathbf{Cat}/\mathcal{C}$.
- **1-cells:** morphisms $(\sigma, X) \to (\tau, Y)$ for $\sigma \leq \tau$ in $\lambda$ are $\mathbf{Cat}/\mathcal{C}$-morphisms $\mathbb{M}^\beta \mathbb{N}^\alpha X \to Y$ for some decomposition $\tau - \sigma = \alpha + \beta$.
- **2-cells:** $\mathbf{Cat}/\mathcal{C}$-2-cells, plus the canonical coherence 2-cells of the 2-adjunction $\mathbb{M} \dashv \mathbb{N}$ (unit, counit, multiplication, comultiplication; see [Emmenegger fibration 2-comonad](../theorems/emmenegger-fibration-comonad.md)) and the (co)lax-idempotent coherence 2-cells.

The 1-cells encode "advance the settling by $\alpha + \beta$ ordinal steps" — $\alpha$ applications of [$\mathbb{N}$](../theorems/emmenegger-fibration-comonad.md) followed by $\beta$ applications of [$\mathbb{M}$](../theorems/gray-street-fibration-monad.md). The 2-cells encode the (co)lax coherence of both 2-monads.

## Strict-idempotent collapse

When $\mathbb{M}$ and $\mathbb{N}$ are strict-idempotent (the strict regime), the 2-cells in $\mathbf{T}(\mathcal{C}, \lambda)$ are identities, and $\mathbf{T}(\mathcal{C}, \lambda)$ collapses to the [settling bound](settling-bound.md) $\lambda$ as a 1-category. The linear settling of the original [knowledge presheaf](spatiotemporal-knowledge-presheaf.md) is recovered exactly in this regime.

## The KZ-lax-idempotent diamond

The lax-idempotent 2-adjunction $\mathbb{M} \dashv \mathbb{N}$ on $\mathbf{Cat}/\mathcal{C}$ carries a square of canonical 2-cells at each iteration level: unit $\eta : 1 \Rightarrow \mathbb{M}$, counit $\epsilon : \mathbb{N} \Rightarrow 1$, multiplication $\mu : \mathbb{M}^2 \Rightarrow \mathbb{M}$, comultiplication $\delta : \mathbb{N} \Rightarrow \mathbb{N}^2$. Adjoint triangle equalities witnessed by invertible 2-cells make this square a *diamond*. In the lax-idempotent case the 2-cells carry additional Kelly–Lack coherence.
