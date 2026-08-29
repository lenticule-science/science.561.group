---
kind: theorem
status: proved
symbol: "\\mathbb{N}"
depends-on: [gray-street-fibration-monad, predicate-category]
---

# Emmenegger fibration 2-comonad

The [Gray–Street fibration 2-monad](gray-street-fibration-monad.md) $\mathbb{M}$ on $\mathbf{Cat}/\mathcal{C}$ has a right 2-adjoint $\mathbb{N} : \mathbf{Cat}/\mathcal{C} \to \mathbf{Cat}/\mathcal{C}$, which extends to a lax-idempotent 2-comonad.
Pseudo-coalgebras for $\mathbb{N}$ are (equivalently) cloven Grothendieck fibrations over $\mathcal{C}$.

## Proof

[@emmenegger-et-al2024]. $\square$

## Remark

The 2-adjunction $\mathbb{M} \dashv \mathbb{N}$ has canonical unit, counit, multiplication, and comultiplication 2-cells; together with the (co)lax-idempotent coherence, these form a *diamond* of 2-cells at each iteration level.
The diamond shape persists under Priestley dualization with 2-monad/2-comonad roles swapped.
