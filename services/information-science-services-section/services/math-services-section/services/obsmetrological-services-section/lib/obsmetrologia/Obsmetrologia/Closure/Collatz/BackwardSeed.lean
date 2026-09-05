import Obsmetrologia.Closure.Collatz.ResidueGap

/-!
# Collatz backward cylinder seeds

The residue-gap face can be read backward through the finite parity cylinder.
For a word `w`, a backward cylinder seed is a representative `n < 2^|w|` whose
length-`|w|` parity word is exactly `w`. The existing residue construction shows
that, for a parent barrier `p`, the inverse residue modulo `parentM p` is exactly
the backward seed for the first-passage cylinder `p ++ [E]`.

## Main definitions

* `BackwardCylinderSeed` — a finite cylinder representative for a parity word.
* `FirstPassageBackwardSeed` — the representative for `p ++ [E]`.
* `BadFirstPassageBackwardSeed` — a backward seed whose first-passage iterate
  does not descend.

## Main results

* `parentBarrier_inverseResidue_is_backwardSeed` — the inverse residue is the
  backward seed of the first-passage cylinder.
* `inTwoGenSemigroup_iff_badBackwardSeed` — semigroup membership is exactly a
  bad backward seed.
* `parentBarrierGap_iff_backwardSeeds_descend` — the parent-barrier gap is
  exactly strict descent of all nontrivial first-passage backward seeds.
* `firstPassageBackwardSeeds_descend_of_offset_bound` — seeds whose
  `D`-multiple exceeds the offset upper envelope descend unconditionally.

## Tags

collatz, backward seed, cylinder, semigroup gap
-/

namespace Obsmetrologia
namespace Closure
namespace Collatz

/-! ## Backward finite-cylinder representatives -/

/-- A representative of the finite parity cylinder for `w`, bounded by the binary
modulus of its length. -/
def BackwardCylinderSeed (w : List Branch) (n : Nat) : Prop :=
  n < 2 ^ w.length ∧ parityWord n w.length = w

/-- Every finite parity word has a backward cylinder seed. -/
theorem backwardCylinderSeed_exists (w : List Branch) :
    ∃ n, BackwardCylinderSeed w n := by
  simpa [BackwardCylinderSeed] using parityWord_surj w

/-- The backward seed of a first-passage parent-barrier cylinder. -/
abbrev FirstPassageBackwardSeed (p : List Branch) (n : Nat) : Prop :=
  BackwardCylinderSeed (p ++ [Branch.E]) n

/-- A first-passage backward seed is bounded by the parent-barrier modulus. -/
theorem firstPassageBackwardSeed_bound_parentM {p : List Branch} {n : Nat}
    (hseed : FirstPassageBackwardSeed p n) : n < parentM p := by
  have hlen : (p ++ [Branch.E]).length = p.length + 1 := by
    rw [List.length_append]
    rfl
  have hpow : 2 ^ (p ++ [Branch.E]).length = parentM p := by
    rw [hlen, parentM_eq_pow]
  rw [← hpow]
  exact hseed.1

/-! ## Parent-barrier inverse residues as backward seeds -/

/-- The inverse residue of a parent barrier is exactly the backward seed of its
first-passage cylinder. -/
theorem parentBarrier_inverseResidue_is_backwardSeed {p : List Branch} {r : Nat}
    (hp : ParentBarrier p)
    (hrM : r < parentM p)
    (hrmod : (parentD p * r) % parentM p = parentC p % parentM p) :
    FirstPassageBackwardSeed p r := by
  constructor
  · rw [parentM_eq_pow p] at hrM
    simpa [FirstPassageBackwardSeed, BackwardCylinderSeed, List.length_append] using hrM
  · exact parentBarrier_residue_realizes_firstPassage (p := p) (r := r) hp hrM hrmod

/-- A bad first-passage backward seed is a cylinder representative whose
first-passage iterate does not strictly descend. -/
def BadFirstPassageBackwardSeed (p : List Branch) (n : Nat) : Prop :=
  FirstPassageBackwardSeed p n ∧ n ≤ orbit n (p ++ [Branch.E]).length

/-- No bad first-passage backward seed exists at any nontrivial parent barrier. -/
def NoBadFirstPassageBackwardSeed : Prop :=
  ∀ p : List Branch, ParentBarrier p → ¬ TrivialParentBarrier p →
    ¬ ∃ n, BadFirstPassageBackwardSeed p n

/-- For a fixed parent barrier, semigroup membership is exactly existence of a
bad first-passage backward seed. -/
theorem inTwoGenSemigroup_iff_badBackwardSeed {p : List Branch}
    (hp : ParentBarrier p) :
    InTwoGenSemigroup (parentC p) (parentD p) (parentM p) ↔
      ∃ n, BadFirstPassageBackwardSeed p n := by
  rw [inTwoGenSemigroup_iff_badCylinderSeed hp]
  constructor
  · rintro ⟨n, hnM, hword, hbad⟩
    refine ⟨n, ?_, hbad⟩
    constructor
    · rw [parentM_eq_pow p] at hnM
      simpa [FirstPassageBackwardSeed, BackwardCylinderSeed, List.length_append] using hnM
    · exact hword
  · rintro ⟨n, hseed, hbad⟩
    exact ⟨n, firstPassageBackwardSeed_bound_parentM hseed, hseed.2, hbad⟩

/-- The parent-barrier gap is exactly emptiness of the bad backward-seed
language. -/
theorem parentBarrierGap_iff_no_badBackwardSeed :
    ParentBarrierGap ↔ NoBadFirstPassageBackwardSeed := by
  constructor
  · intro hgap p hp hnt hbad
    have hmem := (inTwoGenSemigroup_iff_badBackwardSeed hp).mpr hbad
    exact hgap p hp hnt hmem
  · intro hno p hp hnt hmem
    exact hno p hp hnt ((inTwoGenSemigroup_iff_badBackwardSeed hp).mp hmem)

/-- The parent-barrier gap is exactly strict descent of every nontrivial
first-passage backward seed. -/
theorem parentBarrierGap_iff_backwardSeeds_descend :
    ParentBarrierGap ↔
      ∀ p : List Branch, ParentBarrier p → ¬ TrivialParentBarrier p →
        ∀ n, FirstPassageBackwardSeed p n → orbit n (p ++ [Branch.E]).length < n := by
  rw [parentBarrierGap_iff_no_badBackwardSeed]
  constructor
  · intro hno p hp hnt n hseed
    exact Nat.lt_of_not_ge fun hbad => hno p hp hnt ⟨n, hseed, hbad⟩
  · intro hdesc p hp hnt
    rintro ⟨n, hseed, hbad⟩
    have hlt := hdesc p hp hnt n hseed
    omega

/-- The carry form of the parent-barrier gap is exactly emptiness of the bad
backward-seed language. -/
theorem parentBarrierResidueCarryGap_iff_no_badBackwardSeed :
    ParentBarrierResidueCarryGap ↔ NoBadFirstPassageBackwardSeed := by
  rw [← parentBarrierGap_iff_parentBarrierResidueCarryGap]
  exact parentBarrierGap_iff_no_badBackwardSeed

/-- The carry form of the parent-barrier gap is exactly strict descent of every
nontrivial first-passage backward seed. -/
theorem parentBarrierResidueCarryGap_iff_backwardSeeds_descend :
    ParentBarrierResidueCarryGap ↔
      ∀ p : List Branch, ParentBarrier p → ¬ TrivialParentBarrier p →
        ∀ n, FirstPassageBackwardSeed p n → orbit n (p ++ [Branch.E]).length < n := by
  rw [← parentBarrierGap_iff_parentBarrierResidueCarryGap]
  exact parentBarrierGap_iff_backwardSeeds_descend

/-- **Descent above the offset envelope.** A first-passage backward seed whose
`D`-multiple exceeds the offset upper envelope `2^{L−a}(3^a − 2^a)` descends.
Failure of the parent-barrier gap is thereby confined, per barrier, to seeds
`n` with `parentD p · n` at most the envelope. -/
theorem firstPassageBackwardSeeds_descend_of_offset_bound {p : List Branch}
    {n : Nat} (hp : ParentBarrier p) (hseed : FirstPassageBackwardSeed p n)
    (hbig : 2 ^ (p.length - oddCount p) * (3 ^ oddCount p - 2 ^ oddCount p) <
      parentD p * n) :
    orbit n (p ++ [Branch.E]).length < n := by
  refine (firstPassage_descent_iff_gap hp hseed.2).mpr ?_
  have hC := trace_C_upper_bound p
  have hCp : parentC p = (traceOfWord p).C := rfl
  omega

end Collatz
end Closure
end Obsmetrologia
