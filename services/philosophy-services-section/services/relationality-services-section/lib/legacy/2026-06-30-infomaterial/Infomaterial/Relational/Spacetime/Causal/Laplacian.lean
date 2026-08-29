import Infomaterial.Relational.Spacetime.Causal.Cone

/-!
# Causal Laplacian — light-cone propagation as a closure operator

The finite causal analogue of the Lawvere/Tarski Laplacian `□∘◇`. Over event-supported sections,
the **causal closure** sends a seed support to its causal future closure; its harmonic sections are
exactly the future-closed ones, and — because the causal order is already transitively closed — the
diffusion reaches its harmonic kernel after a single step (a closure-iteration spectral gap of one).
This is the order/Tarski Laplacian projection of light-cone propagation
(`content/.../lorentzian-causal-settling`; cf. `Flow.LawvereLaplacianSpectralGap`), with no inner
product and no free data: the operator is `Spacetime.Causal.Cone.CausalLe` read as a propagation closure.

## Main definitions

* `Section` — a Boolean event support/section.
* `causalClosure` / `causalLaplacian` — the causal future-closure of a section.
* `IsHarmonic` / `FutureClosed` — closure-fixed sections; sections closed under causal precedence.

## Main results

* `causalClosure_infl` / `causalClosure_mono` / `causalClosure_idem` — it is a closure operator.
* `harmonic_iff_futureClosed` — harmonic sections are exactly future-closed sections.
* `causalClosure_least_harmonic` — the closure is the least harmonic section above the seed.
* `causal_diffusion_gap_one` — diffusion reaches equilibrium in one step (spectral-gap projection).
* `causal_laplacian_theory` — the bundled headline.

## References

`content/.../lorentzian-causal-settling`. Built on `Infomaterial.Relational.Spacetime.Causal.Cone`.

## Tags

causal Laplacian, closure operator, harmonic section, light cone, propagation, spectral gap
-/

namespace Infomaterial
namespace Relational.Spacetime.Causal.Laplacian

open Infomaterial.Relational.Spacetime.Causal.Order
open Infomaterial.Relational.Spacetime.Causal.Cone

variable {E : Type} (C : CausalSet E)

/-! ## (A) Sections and the causal closure -/

/-- A Boolean event section/support. -/
abbrev Section (E : Type) := E → Prop

/-- Causal closure of an event section: everything in the causal future of the seed support. -/
def causalClosure (S : Section E) : Section E :=
  fun y => ∃ x, S x ∧ Spacetime.Causal.Cone.CausalLe C x y

/-- The finite causal Lawvere/Tarski Laplacian projection: a round-trip closure along causal cones. -/
def causalLaplacian : Section E → Section E := causalClosure C

/-- A section is harmonic when causal closure fixes it. -/
def IsHarmonic (S : Section E) : Prop := causalLaplacian C S = S

/-- A section is future-closed under causal precedence. -/
def FutureClosed (S : Section E) : Prop :=
  ∀ ⦃x y : E⦄, S x → Spacetime.Causal.Cone.CausalLe C x y → S y

/-! ## (B) The closure operator laws -/

/-- The causal closure is inflationary. -/
theorem causalClosure_infl (S : Section E) :
    ∀ x, S x → causalClosure C S x :=
  fun x hx => ⟨x, hx, Spacetime.Causal.Cone.causalLe_refl C x⟩

/-- The causal closure is monotone. -/
theorem causalClosure_mono {S T : Section E} (hsub : ∀ x, S x → T x) :
    ∀ x, causalClosure C S x → causalClosure C T x := by
  rintro y ⟨x, hxS, hxy⟩
  exact ⟨x, hsub x hxS, hxy⟩

/-- The causal closure is idempotent — the causal order is already transitively closed. -/
theorem causalClosure_idem (S : Section E) :
    causalClosure C (causalClosure C S) = causalClosure C S := by
  funext y
  apply propext
  constructor
  · rintro ⟨x, ⟨z, hzS, hzx⟩, hxy⟩
    exact ⟨z, hzS, Spacetime.Causal.Cone.causalLe_trans C hzx hxy⟩
  · intro hy
    exact ⟨y, hy, Spacetime.Causal.Cone.causalLe_refl C y⟩

/-! ## (C) Harmonic = future-closed -/

/-- Harmonic sections are exactly the future-closed sections. -/
theorem harmonic_iff_futureClosed (S : Section E) :
    IsHarmonic C S ↔ FutureClosed C S := by
  constructor
  · intro h x y hx hxy
    have hcl : causalClosure C S y := ⟨x, hx, hxy⟩
    exact (iff_of_eq (congrFun h y)).mp hcl
  · intro hclosed
    funext y
    apply propext
    constructor
    · rintro ⟨x, hx, hxy⟩
      exact hclosed hx hxy
    · intro hy
      exact ⟨y, hy, Spacetime.Causal.Cone.causalLe_refl C y⟩

/-- The causal closure is the least harmonic section containing the seed. -/
theorem causalClosure_least_harmonic (S T : Section E)
    (hST : ∀ x, S x → T x) (hT : IsHarmonic C T) :
    ∀ x, causalClosure C S x → T x := by
  rintro x ⟨s, hs, hsx⟩
  exact (harmonic_iff_futureClosed C T).mp hT (hST s hs) hsx

/-! ## (D) The spectral-gap projection -/

/-- Diffusion reaches the harmonic kernel after a single closure step — a closure-iteration
spectral gap of one, since `CausalLe` is already transitively closed. -/
theorem causal_diffusion_gap_one (S : Section E) :
    causalLaplacian C (causalLaplacian C S) = causalLaplacian C S :=
  causalClosure_idem C S

/-! ## (E) The bundled headline -/

/-- **The causal Laplacian theory.** The causal Laplacian is a closure operator (inflationary,
monotone, idempotent) whose harmonic sections are exactly the future-closed sections. -/
theorem causal_laplacian_theory :
    (∀ S x, S x → causalLaplacian C S x)
    ∧ (∀ S T, (∀ x, S x → T x) → ∀ x, causalLaplacian C S x → causalLaplacian C T x)
    ∧ (∀ S, causalLaplacian C (causalLaplacian C S) = causalLaplacian C S)
    ∧ (∀ S, IsHarmonic C S ↔ FutureClosed C S) :=
  ⟨fun S x hx => causalClosure_infl C S x hx,
   fun _ _ hsub x h => causalClosure_mono C hsub x h,
   fun S => causalClosure_idem C S,
   fun S => harmonic_iff_futureClosed C S⟩

end Relational.Spacetime.Causal.Laplacian
end Infomaterial
