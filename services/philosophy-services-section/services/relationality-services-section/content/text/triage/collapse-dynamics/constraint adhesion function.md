---
name: constraint adhesion function
symbol: A
type: "[[inter-entity modulation predicate]]"
domains:
  - "[[quantum entity]]"
codomain: "[[adhesion relation]]"
induced by:
  - "[[modulation interference function]]"
  - "[[constraint completion function]]"
induces:
  - "[[modulation coupling function]]"
---

The ***constraint adhesion function*** (`A`) is [[induce|induced]] by stabilized [[modulation interference]] between two [[quantum entities]] `Q₁` and `Q₂`, under aligned [[modulation vector]]s and shared [[constraint completion]].

It evaluates whether two constraint-stable entities can **persistently couple modulation** at their shared edge.

Let:
- `E(Q₁, Q₂)` be the [[shared boundary]] or edge interaction region  
- `Φ(x)` be the [[modulation interference function]]  
- `V(Q)` be the modulation vector field for quantum entity `Q`

Then:
> A(Q₁, Q₂) := ∃ x ∈ E(Q₁, Q₂): Φ(x) stabilizes ∧ V(Q₁)(x) ∥ V(Q₂)(x)

That is, `A` returns true where interference stabilizes at the shared edge,  
and the modulation vectors of both entities align in direction and phase.

The result may be interpreted as:
- a boolean adhesion relation (`A = true/false`)  
- or a localized adhesion field marking `x` where adhesion holds

This function enables:
- [[boundary stabilization]]  
- [[modulation entrainment]]  
- and potential [[coherent modulation coupling]] across entities
