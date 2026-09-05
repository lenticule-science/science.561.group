---
name: ritm-existence
type: theorem
class: existence
status: sketch
lean: RelationalInfinityTopoi.ritm_existence
depends-on:
  - ritm
  - cohesive-quadruple
  - relational-infinity-topos
---

Every [cohesive ∞-topos](../teaching/explanations/cohesive-infinity-topos.md) $\mathcal{H}$ admits a canonical [RITM](../objects/ritm.md) structure: the [cohesive quadruple](../morphisms/cohesive-quadruple.md) $\Pi^{\to} \dashv \Box_r \dashv \Diamond_l \dashv \nabla^{\leftarrow}$ extends to the modal data $(\Box, \Diamond)$ on $\mathcal{H}$ in a unique way (up to canonical equivalence) such that $\Box := \Box_r$ and $\Diamond := \Diamond_l$ are KZ-(co)monads on $\mathcal{H}$ and the four sub-modalities (RD, RT, plus the two outer image categories) sit in a coherent $2 \times 2$ diamond.

## Proof sketch

The KZ-laxity of the middle adjoint pair $\Box_r \dashv \Diamond_l$ is automatic in any cohesive ∞-topos: $\Box_r$ is the comonad of the discrete-objects adjunction and $\Diamond_l$ the monad of the codiscrete-objects adjunction, both idempotent, both lax-idempotent (this is a general fact about adjoint quadruples whose outer functors are product-preserving — see [Schreiber 2013](../references/schreiber-2013.md), §3.7).

The $2 \times 2$ diamond's four corners are: $\Box$-modal objects (RD), $\Diamond$-modal objects (RT), the intersection (objects both discrete and codiscrete — exactly the *crisp* objects in the image of $\nabla^{\leftarrow}$ that are also discrete, equivalently the constants), and the union (objects in $\mathcal{H}$, no constraint). The coherence of the diamond is the joint coherence of $\Box$- and $\Diamond$-modality.

## Status

Sketch. The argument above is the standard cohesive-∞-topos one (Schreiber); promoting to `draft` requires writing out the KZ-laxity verification in the [`lean/`](../lean/) project and binding this theorem to it via a `lean:` field.

## Verification on the minimal model

The [presheaf cell](../examples/minimal-presheaf-cell.md) $\mathrm{PSh}(\{0 \to 1\})$ admits a RITM by direct calculation: the four functors $\Pi^{\to}, \Box_r, \Diamond_l, \nabla^{\leftarrow}$ on this presheaf $\infty$-topos are computable in closed form, and the KZ-laxity is checked by evaluating the iterated-flow comparison on the two generators of the walking arrow.
