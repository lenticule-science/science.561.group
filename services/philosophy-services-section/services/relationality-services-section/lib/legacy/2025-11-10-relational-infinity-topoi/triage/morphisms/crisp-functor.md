---
name: crisp-functor
type: morphism
class: functor
symbol: "\\nabla^{\\leftarrow}"
realizes: [cohesive-infinity-topos]
depends-on: [cohesive-quadruple, cohesive-infinity-topos]
---

The **crisp functor** $\nabla^{\leftarrow} : \infty\text{-Grpd} \to \mathcal{H}$ is the rightmost adjoint of the [cohesive quadruple](cohesive-quadruple.md). It assigns to each $\infty$-groupoid $A$ its *codiscrete realization* in $\mathcal{H}$ — the object on which every $\infty$-groupoid morphism $A \to \Gamma X$ lifts uniquely to $\nabla^{\leftarrow} A \to X$.

## Properties

1. **Right adjoint to sharp:** $\Diamond_l \dashv \nabla^{\leftarrow}$ (in the form needed for the codiscrete-objects characterization). Combined with $\nabla^{\leftarrow}$'s further left adjoint chain back into the quadruple, this completes the cohesive structure.
2. **Product-preserving** (Lawvere's dual connectedness axiom).
3. **Image is the codiscrete objects:** $X \in \mathcal{H}$ is in the essential image of $\nabla^{\leftarrow}$ iff $\Diamond_l X \simeq X$.

## Position

In the relational reading, $\nabla^{\leftarrow}$ is the *dispersing* role of coherence — taking an $\infty$-groupoid of points and dispersing it into a fully coherent codiscrete object. In the relational-calculus pilot's [cohesive chain](../../../../../relational-calculus/triage/concepts/cohesive-chain.md) it is named "Crisp."

The crisp functor is the exit point of the cohesive quadruple from $\infty\text{-Grpd}$ back into $\mathcal{H}$, dual to the [shape functor](shape-functor.md)'s entry point. Together they witness the *cohesion* of $\mathcal{H}$: an object is cohesive when its shape and crisp realization fit into a coherent comparison.
