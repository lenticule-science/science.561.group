---
name: heyting-closure-shadow
type: theorem
class: shadow
status: sketch
lean: RelationalInfinityTopoi.heyting_closure_shadow
depends-on:
  - heyting-algebra-shadow
  - cohesive-quadruple
  - "../../../../../relational-calculus/triage/theorems/heyting-closure-of-movement-i.md"
---

The [cohesive quadruple](../morphisms/cohesive-quadruple.md) on a [cohesive ∞-topos](../teaching/explanations/cohesive-infinity-topos.md) $\mathcal{H}$ descends, via the [Heyting-algebra shadow](../teaching/explanations/heyting-algebra-shadow.md) $h(-)$, to exactly the four-operation closure of the relational-calculus pilot's [Movement-I closure theorem](../../../../../relational-calculus/triage/theorems/heyting-closure-of-movement-i.md) on the Heyting algebra $h(X)$ of subobjects of any object $X \in \mathcal{H}$.

## Statement

For every $X \in \mathcal{H}$, the four cohesive functors $\Pi^{\to}, \Box_r, \Diamond_l, \nabla^{\leftarrow}$ act on $X$ via maps in $\mathcal{H}$ that, after applying the $(-1)$-truncation $h(-)$ on the slice $\mathcal{H}_{/X}$, become respectively the four operations $\Pi, \Box, \Diamond, \nabla$ on the complete Heyting algebra $h(X)$. The induced quadruple on $h(X)$ is the closure under $\land, \lor, \Rightarrow, \neg, \top, \bot$ from the [Movement-I closure theorem](../../../../../relational-calculus/triage/theorems/heyting-closure-of-movement-i.md), with the cohesive functors furnishing modal-operator structure on top of the Heyting structure.

## Proof sketch

The shadow operation $h(-) := \tau_{\leq -1}\, \mathcal{H}_{/-}$ is functorial and preserves left/right adjoints in the appropriate sense. The cohesive quadruple's adjoint structure therefore descends. The identification of the descended operations with the Movement-I quartet is by direct calculation: $\Pi^{\to}$'s shadow is the $\Sigma$-quantifier $\exists$ on subobjects (the join $\lor$); $\Box_r$'s shadow is the *interior* operator (the necessity-modality $\Box$); $\Diamond_l$'s shadow is the *closure* operator (the possibility-modality $\Diamond$); $\nabla^{\leftarrow}$'s shadow is the $\Pi$-quantifier $\forall$ (the meet $\land$ in the appropriate sense).

## Status

Sketch. The shadow-of-adjoint-quadruple calculation is standard; the identification with Movement I requires inspecting the Movement-I closure theorem's exact axiomatization, which the relational-calculus pilot has at status `sketch`. Promotion of either depends on the other.
