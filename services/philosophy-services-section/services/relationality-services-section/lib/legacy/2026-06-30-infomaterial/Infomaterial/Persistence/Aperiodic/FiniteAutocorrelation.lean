import Infomaterial.Calculus.Order.SetNumberGraphTheory

/-!
# Finite autocorrelation and homometry (the pair-correlation projection of diffraction)

The analytic heart of aperiodic order is the **diffraction measure** — the Fourier transform of the
autocorrelation of a weighted Dirac comb. That needs translation-bounded measures and Fourier analysis,
out of this dependency-free core. What *is* in core is the **finite, combinatorial invariant**: over a
finite cyclic group `Fin (n+1)`, the **pair-difference (Patterson) count** of an occupation pattern
`w : Fin (n+1) → Bool` at a displacement `d` is the number of occupied sites `p` whose `d`-translate is
also occupied. Two patterns are **homometric** when their pair-difference counts agree at every
displacement — the finite projection of "same diffraction, possibly different structure."

This is explicitly **not** diffraction: there is no Fourier transform, no measure, no Bragg spectrum.
It is the finite autocorrelation / pair-correlation that a later analytic layer would transform.

## Main definitions
* `autocorr` — the finite pair-difference (Patterson) count; `Homometric` — equal autocorrelation.

## Main results
* `autocorr_le` — every autocorrelation value is at most the number of sites.
* `Homometric.refl` / `.symm` / `.trans` — homometry is an equivalence relation.

## References
Corpus quasicrystal line; the quasicrystal frontier memo (weighted Dirac comb, autocorrelation,
diffraction, homometry — the analytic theory; here the finite pair-correlation projection). Do **not** call
this diffraction.

## Tags
quasicrystal, autocorrelation, Patterson, homometry, pair correlation, diffraction projection
-/

namespace Infomaterial
namespace Persistence.Aperiodic

/-- The **finite pair-difference (Patterson) autocorrelation** of an occupation pattern `w` on the
cyclic group `Fin (n+1)`, at displacement `d`: the number of sites `p` with both `p` and its
`d`-translate `p + d` occupied. The finite combinatorial invariant of the autocorrelation of a weighted
Dirac comb. -/
def autocorr (n : Nat) (w : Fin (n + 1) → Bool) (d : Fin (n + 1)) : Nat :=
  (List.finRange (n + 1)).countP (fun p => w p && w (p + d))

/-- **Every autocorrelation value is bounded by the number of sites** — a pair-difference count cannot
exceed the count of all sites. -/
theorem autocorr_le (n : Nat) (w : Fin (n + 1) → Bool) (d : Fin (n + 1)) :
    autocorr n w d ≤ n + 1 := by
  have h : autocorr n w d ≤ (List.finRange (n + 1)).length := List.countP_le_length
  rwa [List.length_finRange] at h

/-- **Homometry**: two patterns have the same pair-difference autocorrelation at every displacement —
the finite projection of "same diffraction." Distinct homometric patterns are the combinatorial witnesses
that the autocorrelation does not determine the structure. -/
def Homometric (n : Nat) (w w' : Fin (n + 1) → Bool) : Prop := autocorr n w = autocorr n w'

/-- Homometry is **reflexive**. -/
theorem Homometric.refl (n : Nat) (w : Fin (n + 1) → Bool) : Homometric n w w := rfl

/-- Homometry is **symmetric**. -/
theorem Homometric.symm {n : Nat} {w w' : Fin (n + 1) → Bool}
    (h : Homometric n w w') : Homometric n w' w := Eq.symm h

/-- Homometry is **transitive**. -/
theorem Homometric.trans {n : Nat} {w w' w'' : Fin (n + 1) → Bool}
    (h : Homometric n w w') (h' : Homometric n w' w'') : Homometric n w w'' := Eq.trans h h'

end Persistence.Aperiodic
end Infomaterial
