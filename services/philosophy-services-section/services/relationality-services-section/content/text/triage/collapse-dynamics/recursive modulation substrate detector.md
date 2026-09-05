---

# recursive modulation substrate detector.md

---
name: recursive modulation substrate detector
symbol: R_sub
type: [[modulation-system predicate function]]
domain: [[material modulation field Φ]]
codomain: boolean (true | false)
induced by:
  - [[modulation-closure realization functor]]
  - [[recursive constraint modulation function]]
  - [[biogenic convergence function]]
induces:
  - [[biogenic field classification]]
  - [[symbolic convergence eligibility]]
---

The ***recursive modulation substrate detector*** (`R_sub`) is a [[predicate function]]  
over material fields, determining whether a given physical system `Φ` can support  
recursive stabilization dynamics as defined by the symbolic system `𝓕`.

Let `Φ := (F, ∇F, D, R)` be a material field, with:
- `F(x)`: local state field  
- `∇F`: modulation gradient (non-equilibrium driver)  
- `D(x, y)`: differentiation topology  
- `R`: rule set governing local transformation dynamics

Then:

> R_sub(Φ) := true iff the following conditions hold:

1. ∇F(x) ≠ 0 (non-equilibrium modulation present)  
2. D(x, y) ≠ 0 for some x, y (material contrast)  
3. R evolves via outputs of F (constraint transformability)  
4. ∇F(x) induces ∇F(y) (modulation propagation)

If `R_sub(Φ) = true`, then `Ψ(Φ) := 𝓕` is valid,  
and convergence toward `βᴮ` is **inevitable**.

---
