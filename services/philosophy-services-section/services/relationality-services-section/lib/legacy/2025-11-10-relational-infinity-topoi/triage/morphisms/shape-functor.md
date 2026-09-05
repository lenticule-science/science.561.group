---
name: shape-functor
type: morphism
class: functor
symbol: "\\Pi^{\\to}"
realizes: [cohesive-infinity-topos]
depends-on: [cohesive-quadruple, cohesive-infinity-topos]
---

The **shape functor** $\Pi^{\to} : \mathcal{H} \to \infty\text{-Grpd}$ is the leftmost adjoint of the [cohesive quadruple](cohesive-quadruple.md). It assigns to each object $X \in \mathcal{H}$ its *fundamental ∞-groupoid* — the homotopy type obtained by collapsing $X$'s local geometric structure to its outline.

## Properties

1. **Left adjoint to flat:** $\Pi^{\to} \dashv \Box_r$. The unit $X \to \Box_r \Pi^{\to} X$ is the discrete reflection of the shape.
2. **Product-preserving** (Lawvere's connectedness axiom). This is the essential cohesion axiom that distinguishes cohesive ∞-topoi from arbitrary $(\infty, 1)$-topoi over $\infty\text{-Grpd}$.
3. **Computes connected components in degree 0:** $\pi_0\, \Pi^{\to}(X)$ is the set of connected components of $X$ in the relevant geometric sense.

## Position

In the relational reading, $\Pi^{\to}$ is the *collecting* role of coherence — gathering local points into a single outline. In the relational-calculus pilot's [cohesive chain](../../../../../relational-calculus/triage/concepts/cohesive-chain.md) it is named "Shape."

The shape functor is the entry point of the cohesive quadruple from $\mathcal{H}$ to $\infty\text{-Grpd}$; the [crisp functor](crisp-functor.md) $\nabla^{\leftarrow}$ is its dual exit point.
