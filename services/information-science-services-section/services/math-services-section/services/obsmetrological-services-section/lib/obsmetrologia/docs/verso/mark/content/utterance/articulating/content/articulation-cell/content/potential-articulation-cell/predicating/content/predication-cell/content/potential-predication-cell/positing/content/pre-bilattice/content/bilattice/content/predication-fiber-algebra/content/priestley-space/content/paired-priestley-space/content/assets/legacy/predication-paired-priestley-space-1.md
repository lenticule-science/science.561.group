---
type: definition
class: topological-space
depends-on: [priestley-space, negation]
---

# Paired Priestley space

A **paired Priestley space** is a [Priestley space](priestley-space.md) $X$ equipped with an order-reversing involution $\sigma : X \to X$ — the *swap*. Morphisms are continuous, order-preserving maps that commute with $\sigma$. The category is denoted $\mathbf{PairedPriSp}$.

Paired Priestley spaces are the spatial side of the [Jung–Rivieccio duality](../theorems/jung-rivieccio-duality.md): the swap encodes the bilattice [negation](../morphisms/negation.md), and the underlying Priestley order encodes one of the two bilattice orders, with the other recovered by post-composing with $\sigma$.

## Distinguished example

For $\mathbf{L} = \mathbf{2}$, $\mathrm{Spec}(\mathbf{L})$ is a point, so the dual of [$\mathbf{FOUR}$](four-bilattice.md) is the two-point space $\{+, -\}$ with $\sigma : + \leftrightarrow -$.
