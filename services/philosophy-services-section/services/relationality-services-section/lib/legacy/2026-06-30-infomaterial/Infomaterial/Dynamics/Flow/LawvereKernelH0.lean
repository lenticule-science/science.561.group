import Infomaterial.Dynamics.Flow.LawvereLaplacianSpectralGap

/-!
# The Lawvere harmonic kernel is the degree-0 cohomology object `H⁰`

`LawvereLaplacianSpectralGap` characterizes the harmonic kernel `{v // L v = v}` only *definitionally*
as the fixed-point set (`isHarmonic_iff_fixed` is `Iff.rfl`), and the settling Laplacianizer takes
`H⁰ := {v // closureOp v = v}` with the Hodge map as the identity — so "kernel `≅` H⁰" there is
literally `rfl`. This module gives `H⁰` a **genuinely different presentation** — the degree-0
cohomology object as the **global sections**, i.e. the *image* of the settling closure
`{v // ∃ u, closureOp u = v}` — and proves the harmonic kernel naturally isomorphic to it. The
isomorphism is **not** definitional: a global section is closure-fixed only by **idempotence** of the
closure (`content/.../settling-cohomology`; `content/.../moduli-theories-laplacianizers`).

## Main definitions

* `HarmonicKernel` — the Lawvere Laplacian's kernel, `{v // IsHarmonic v}`.
* `H0Object` — the degree-0 cohomology object: global sections = the image of the settling closure.
* `toH0` / `fromH0` — the Hodge maps between them.

## Main results

* `mem_h0_iff_harmonic` — global section ⟺ harmonic (the image of the closure is its fixed-point set,
  by idempotence) — the membership-level Hodge identity, not definitional.
* `harmonic_kernel_h0_iso` — the bundled headline: the harmonic kernel is isomorphic to `H⁰`.

## References

`content/.../settling-cohomology`, `content/.../moduli-theories-laplacianizers`. Built on
`Infomaterial.Flow.LawvereLaplacianSpectralGap`.

## Tags

Lawvere Laplacian, harmonic kernel, degree-0 cohomology, global sections, Hodge isomorphism
-/

namespace Infomaterial
namespace LawvereLaplacian

open Infomaterial.Valuation
open Infomaterial.Valuation.ModalFrame

variable (M : ModalFrame)

/-! ## (A) The two objects -/

/-- The **harmonic kernel** of the Lawvere Laplacian: the valuations it fixes. -/
abbrev HarmonicKernel : Type := { v : Valuation // IsHarmonic M v }

/-- The **degree-0 cohomology object `H⁰`** as the global sections: the *image* of the settling
closure. Definitionally distinct from the fixed-point set — membership is "settled form of some
seed," not "closure-fixed." -/
abbrev H0Object : Type := { v : Valuation // ∃ u : Valuation, M.closureOp u = v }

/-! ## (B) The membership-level Hodge identity -/

/-- **A valuation is a global section iff it is harmonic.** The image of the settling closure equals
its fixed-point set — the forward direction is genuine, needing `closureOp_idem` (a closure of a
closure is already closed); only the backward direction is the trivial "a fixed point is its own
image." -/
theorem mem_h0_iff_harmonic (v : Valuation) :
    (∃ u : Valuation, M.closureOp u = v) ↔ IsHarmonic M v := by
  constructor
  · rintro ⟨u, hu⟩
    exact (isHarmonic_iff_fixed M v).mpr (by rw [← hu, M.closureOp_idem])
  · intro h
    exact ⟨v, (isHarmonic_iff_fixed M v).mp h⟩

/-! ## (C) The Hodge maps and the isomorphism -/

/-- Forward Hodge map: a harmonic valuation names a global section (it is its own closure image). -/
def toH0 : HarmonicKernel M → H0Object M :=
  fun c => ⟨c.val, ⟨c.val, (isHarmonic_iff_fixed M c.val).mp c.property⟩⟩

/-- Backward Hodge map: a global section is harmonic (closure-fixed by idempotence). -/
def fromH0 : H0Object M → HarmonicKernel M :=
  fun c => ⟨c.val, (mem_h0_iff_harmonic M c.val).mp c.property⟩

/-- **The harmonic kernel is isomorphic to `H⁰`.** The image of the settling closure (global
sections) and the Lawvere-harmonic kernel coincide as objects: a valuation is a global section iff it
is harmonic, and the Hodge maps `toH0`/`fromH0` are mutually inverse. The forward identification needs
idempotence — it is a theorem, not the definitional identity of the fixed-point presentation. -/
theorem harmonic_kernel_h0_iso :
    (∀ v : Valuation, (∃ u : Valuation, M.closureOp u = v) ↔ IsHarmonic M v)
    ∧ (∀ c : HarmonicKernel M, fromH0 M (toH0 M c) = c)
    ∧ (∀ c : H0Object M, toH0 M (fromH0 M c) = c) :=
  ⟨fun v => mem_h0_iff_harmonic M v,
   fun _ => Subtype.ext rfl,
   fun _ => Subtype.ext rfl⟩

end LawvereLaplacian
end Infomaterial
