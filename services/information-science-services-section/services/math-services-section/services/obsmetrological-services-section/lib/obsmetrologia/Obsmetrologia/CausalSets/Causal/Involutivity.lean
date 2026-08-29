import Obsmetrologia.CausalSets.Causal.Cohomology

/-!
# Causal involutivity — coisotropy of the wavefront along bicharacteristics

The Kashiwara–Schapira microsupport is **involutive** (coisotropic): it is preserved by the
bicharacteristic flow. The smooth statement rests on the symplectic structure of `T*M`; the discrete
projection rests instead on the cochain complex of `CausalCohomology` — and it is exactly the cocycle
condition `δ¹ φ = 0`, read as propagation.

A 2-simplex `a ≤ b ≤ c` is the discrete **bicharacteristic triangle**: its first leg `(a,b)` and
second leg `(b,c)` are composable null segments (tip of the first = base of the second), and its long
edge `(a,c)` is their composite. For a **cocycle** `φ` (a closed 1-cochain), `δ¹ φ = 0` rearranges to

  `φ(a,c) = φ(a,b) + φ(b,c)`

— the charge is **additive along every bicharacteristic**, the discrete "closed form integrates
path-independently". That additivity is the coisotropy: the microlocal datum propagates consistently
along null geodesics. From it, the **wavefront is involutive** — a singular composite edge `(a,c)`
*decomposes*: at least one of its bicharacteristic segments is singular too (a covector in the
wavefront cannot sit on a composite with both segments smooth). The singularity is carried by the
bicharacteristic, not isolated on the long edge.

A **bridge, not an identity**: there is no symplectic form, only the cochain complex; the Hamiltonian-flow-as-symplectomorphism stays the open frontier (`thm:cotangent-symplectic-flow`). What
is captured is the propagation content of involutivity — additivity and wavefront decomposition along
bicharacteristics — derived from `δ¹ φ = 0`.

## Main definitions

* `Bichar` — two 1-simplices compose as a bicharacteristic (tip of first = base of second).

## Main results

* `edges_composable` — the two legs of a 2-simplex are bicharacteristic-composable.
* `cocycle_additive` — a cocycle is additive along every bicharacteristic (coisotropy).
* `wavefront_involutive` — the wavefront of a cocycle is closed under bicharacteristic decomposition.
* `causal_involutivity` — the bundled headline.

## References

`content/.../lorentzian-causal-settling`. Built on `Obsmetrologia.CausalSets.Causal.Cohomology`; the
propagation half of `thm:cotangent-symplectic-flow`.

## Tags

involutivity, coisotropy, bicharacteristic, cocycle, wavefront, propagation of singularities
-/

namespace Obsmetrologia
namespace CausalSets.Causal.Involutivity

open Obsmetrologia.CausalSets.Causal.Order
open Obsmetrologia.CausalSets.Causal.Cone
open Obsmetrologia.CausalSets.Causal.Cohomology

variable {E : Type} (C : CausalSet E)

/-! ## (A) The bicharacteristic relation -/

/-- Two causal 1-simplices are **bicharacteristic-composable** when the tip of the first is the base
of the second — the discrete null-geodesic step `(a,b) ⤳ (b,c)`. -/
def Bichar (ξ η : OneSimplex C) : Prop := ξ.val.2 = η.val.1

/-- **The two legs of a 2-simplex are bicharacteristic-composable.** In the triangle `a ≤ b ≤ c`, the
first leg `(a,b)` and the second leg `(b,c)` share the middle event `b` — they compose, and the long
edge `(a,c)` is their composite. -/
theorem edges_composable (t : TwoSimplex C) : Bichar C (edge01 C t) (edge12 C t) := rfl

/-! ## (B) Coisotropy — a cocycle is additive along bicharacteristics -/

/-- **Coisotropy / path-independence.** A cocycle is **additive along every bicharacteristic**: the
charge on the composite edge `(a,c)` is the sum of the charges on the two legs `(a,b)`, `(b,c)`. This
is `δ¹ φ = 0` rearranged — the discrete closed-form integrates path-independently, the propagation
content of involutivity. -/
theorem cocycle_additive {φ : C1 C} (hφ : Cocycle C φ) (t : TwoSimplex C) :
    φ (edge02 C t) = φ (edge01 C t) + φ (edge12 C t) := by
  have hzero := congrFun hφ t
  simp only [delta1] at hzero
  omega

/-! ## (C) Involutivity — the wavefront decomposes along bicharacteristics -/

/-- **The wavefront of a cocycle is involutive.** A singular composite edge `(a,c)` — a wavefront
covector on the long edge of a bicharacteristic triangle — **decomposes**: at least one of its legs
`(a,b)`, `(b,c)` is singular too. A covector in the wavefront cannot sit on a composite with both
bicharacteristic segments smooth; the singularity is carried along the null geodesic, not isolated.
This is the discrete coisotropy of the microsupport, derived from additivity. -/
theorem wavefront_involutive {φ : C1 C} (hφ : Cocycle C φ) (t : TwoSimplex C)
    (h : Wavefront C φ (edge02 C t)) :
    Wavefront C φ (edge01 C t) ∨ Wavefront C φ (edge12 C t) := by
  have hadd := cocycle_additive C hφ t
  by_cases h1 : φ (edge01 C t) = 0
  · right
    intro h12
    apply h
    omega
  · exact Or.inl h1

/-! ## (D) The composite stays in the cone -/

/-- The composite edge of a bicharacteristic triangle is causal — the bicharacteristic stays inside
the causal cone (the null geodesic does not leave the future). -/
theorem bicharacteristic_causal (t : TwoSimplex C) :
    CausalLe C (edge02 C t).val.1 (edge02 C t).val.2 :=
  (edge02 C t).property

/-! ## (E) The bundled headline -/

/-- **Causal involutivity.** On the causal cochain complex, the cocycle condition `δ¹ φ = 0` *is* the
discrete coisotropy of the wavefront:

* **bicharacteristics compose** (`edges_composable`) — the legs of a 2-simplex are composable null
  segments;
* **coisotropy** (`cocycle_additive`) — a cocycle is additive along every bicharacteristic, the
  charge on a composite is the sum over its legs (path-independence);
* **involutivity** (`wavefront_involutive`) — the wavefront of a cocycle is closed under
  bicharacteristic decomposition: a singular composite edge has a singular leg;
* **confinement** (`bicharacteristic_causal`) — the composite stays in the causal cone.

A bridge, not an identity: the symplectic Hamiltonian flow stays open
(`thm:cotangent-symplectic-flow`); this is the propagation content of involutivity, from `δ¹ = 0`. -/
theorem causal_involutivity :
    (∀ t : TwoSimplex C, Bichar C (edge01 C t) (edge12 C t))
    ∧ (∀ (φ : C1 C), Cocycle C φ →
        ∀ t : TwoSimplex C, φ (edge02 C t) = φ (edge01 C t) + φ (edge12 C t))
    ∧ (∀ (φ : C1 C), Cocycle C φ → ∀ t : TwoSimplex C,
        Wavefront C φ (edge02 C t) →
          Wavefront C φ (edge01 C t) ∨ Wavefront C φ (edge12 C t))
    ∧ (∀ t : TwoSimplex C, CausalLe C (edge02 C t).val.1 (edge02 C t).val.2) :=
  ⟨edges_composable C,
   fun _ hφ t => cocycle_additive C hφ t,
   fun _ hφ t h => wavefront_involutive C hφ t h,
   bicharacteristic_causal C⟩

end CausalSets.Causal.Involutivity
end Obsmetrologia
