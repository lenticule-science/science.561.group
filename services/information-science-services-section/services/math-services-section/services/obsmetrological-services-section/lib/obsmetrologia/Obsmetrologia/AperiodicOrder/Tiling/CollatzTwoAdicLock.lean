import Obsmetrologia.Dynamics.Flow.BlowupClassification
import Obsmetrologia.AperiodicOrder.Tiling.InverseHull
import Obsmetrologia.AperiodicOrder.Tiling.FiniteInfiniteCharger
import Obsmetrologia.Closure.Collatz.BackwardMargin
import Obsmetrologia.Closure.Collatz.CanonicalBarrierSeed
import Obsmetrologia.Closure.Collatz.Settling
import Obsmetrologia.AperiodicOrder.Tiling.Autopoiesis

/-!
# The Collatz residue lock as a two-adic inverse-system face

The parent-barrier residue gap has a carry form:
`parentM p <= parentD p * r - parentC p`. Since `parentM p = 2^(p.length+1)`,
that carry is a statement about the residue stage modulo a power of two.

This module connects the Collatz lock to the aperiodic inverse-hull machinery by
building the finite residue tower `Fin (2^n)` with prefix restriction. It does
not prove the parent-barrier gap. It records the native carrier on which the
carry face lives, and it proves the exact package accounting:
`CollatzFrontierInputs` is the two-adic gap together with the named one-lock
collapse.

## Main definitions

* `twoAdicResidueSystem` — the inverse system of residues modulo `2^n`.
* `twoAdicThreadOfNat` — the coherent residue thread of an ordinary natural.
* `twoAdicThreadOfNat_eq_iff_all_residues_eq` — equality of ordinary residue
  threads is exactly agreement at every finite binary stage.
* `twoAdicOdometer` — the `+1` odometer action on coherent binary residue
  threads, agreeing with successor on ordinary naturals.
* `ParentBarrierTwoAdicCarryGap` — the parent-barrier carry gap with `M` written
  explicitly as `2^(p.length+1)`.
* `ParentBarrierTwoAdicUniqueResidueGap` — the same lock as a unique inverse
  residue in the binary stage whose carry is at least the modulus.
* `ParentBarrierTwoAdicCarryQuotientGap` — the same lock as a positive carry
  quotient for that unique residue.
* `parentBarrierTwoAdicCarryQuotient` — the exact quotient whose positivity is
  checked by the finite parent-barrier audit.
* `parentBarrierTwoAdicCarryQuotientOrdinal` — the same quotient exposed as a
  finite ordinal.
* `TwoAdicPositiveCylinderLift` — equality in a finite two-adic cylinder plus a
  positive whole-modulus lift inside that cylinder.
* `ParentBarrierTwoAdicCylinderLiftGap` — the parent-barrier gap in native
  inverse-hull cylinder-lift form.

## Main results

* `parentBarrierResidueCarryGap_iff_parentBarrierTwoAdicCarryGap` — the carry
  face from `ResidueGap` is exactly the explicit two-adic carry form.
* `parentBarrierGap_iff_parentBarrierTwoAdicCarryGap` — the parent-barrier
  semigroup gap is exactly the explicit two-adic carry form.
* `parentBarrierTwoAdicCarryGap_iff_uniqueResidueGap` — the explicit carry form is
  exactly the unique-residue carry form.
* `twoAdicPositiveCylinderLift_iff_modulus_le_sub` — a positive cylinder lift is
  exactly congruence modulo the binary stage plus a full-modulus positive carry.
* `parentBarrierTwoAdicCylinderLiftGap_iff_carryGap` — the inverse-hull
  cylinder-lift face is directly the carry inequality face.
* `parentBarrierTwoAdicCarryGap_iff_carryQuotientGap` — the carry form is exactly
  existence of a positive carry quotient.
* `parentBarrierGap_iff_parentBarrierTwoAdicCarryQuotientPositive` — the
  semigroup gap is exactly positivity of the explicit quotient value.
* `parentBarrierTwoAdicCarryQuotientOrdinal_eq_backwardCarryQuotient` — the
  two-adic quotient is the backward-margin quotient.
* `parentBarrierGap_iff_parentBarrierTwoAdicCylinderLiftGap` — the semigroup gap
  is exactly the positive two-adic cylinder-lift face.
* `parentBarrierTwoAdicCarryQuotientPositive_iff_cylinderSeeds_descend` — the
  quotient state is exactly the first-passage cylinder-descent skeleton.
* `parentBarrierTwoAdicCylinderLiftGap_iff_cylinderSeeds_descend` — the same
  descent skeleton through the positive cylinder-lift face.
* `canonicalDenominatorBound_lands_finiteCoalgebra` — the canonical
  denominator-bound route lands on the finite-coalgebra K4 face while carrying
  the backward-seed descent payload.
* `badBackwardSeedCell_induces_fSideFiring` — a bad backward-seed boundary is
  precisely the `fSide` firing out of a typed potential cell.
* `parentBarrierGap_iff_noUngroundedClaimSideFiringAtParentBarrier` — the
  remaining parent-barrier gap as absence of ungrounded claim-side firing.
* `frontierInputs_iff_twoAdicCarryQuotientPositive_and_oneLock` — the frontier
  package as quotient positivity plus the named one-lock implication.
* `frontierInputs_iff_twoAdicCylinderLiftGap_and_oneLock` — the frontier package
  as positive cylinder lift plus the named one-lock implication.
* `collatz_from_parentBarrierTwoAdicCarryGap_and_noPositiveInfiniteBarrierStream`
  — the conditional termination route through the explicit two-adic lock.
* `closureOrdinalStage_exists_iff_reachesTerminal_of_twoAdicCarryGap_and_noPositiveInfiniteBarrierStream`
  — the κ/stopping-stage bridge through the explicit two-adic lock.
* `frontierInputs_iff_twoAdicUniqueResidueGap_and_oneLock` — the full frontier
  package as unique inverse-residue gap plus the named one-lock collapse.
* `parentBarrierOneLockCollapse_iff_twoAdicCarryQuotientPositive_alone_solves_kappa_package`
  — the κ/stopping-stage package through exact carry-quotient positivity.
* `parentBarrierOneLockCollapse_iff_twoAdicCylinderLiftGap_alone_solves_kappa_package`
  — the κ/stopping-stage package through the positive cylinder-lift face.
* `kappaPackage_of_twoAdicCylinderLiftGap_and_oneLock` — the forward κ/stopping
  package from the cylinder-lift gap plus the named one-lock collapse.
* `parentBarrierTwoAdicCarryGap_holds` — the same frontier alias transported to
  the two-adic face.

## Tags

collatz, two-adic, inverse system, residue gap
-/

namespace Obsmetrologia
namespace AperiodicOrder.Tiling

open Obsmetrologia.Closure.Collatz

/-! ## The binary residue inverse system -/

/-- The finite `2^n` residue stage. -/
def twoAdicStage (n : Nat) : Type := Fin (2 ^ n)

/-- Restrict a residue modulo `2^n` to its prefix modulo `2^m`. -/
def twoAdicRestrict {m n : Nat} (_h : m <= n) (x : twoAdicStage n) :
    twoAdicStage m :=
  ⟨x.val % 2 ^ m, Nat.mod_lt _ (Nat.pow_pos (by decide : 0 < 2))⟩

/-- The binary residue prefix tower: stages are residues modulo `2^n`, and bonding
maps restrict high-precision residues to lower precision. -/
def twoAdicResidueSystem : InverseSystem where
  stage := twoAdicStage
  proj := @twoAdicRestrict
  proj_id := by
    intro _n _h x
    apply Fin.ext
    exact Nat.mod_eq_of_lt x.isLt
  proj_comp := by
    intro _m _n _k hmn _hnk _hmk x
    apply Fin.ext
    exact Nat.mod_mod_of_dvd x.val (Nat.pow_dvd_pow 2 hmn)

/-- A coherent binary residue thread. -/
abbrev TwoAdicResidueThread : Type := twoAdicResidueSystem.Thread

/-- The coherent residue thread of an ordinary natural number. -/
def twoAdicThreadOfNat (x : Nat) : TwoAdicResidueThread where
  at_ n := ⟨x % 2 ^ n, Nat.mod_lt _ (Nat.pow_pos (by decide : 0 < 2))⟩
  coh := by
    intro _m _n h
    apply Fin.ext
    exact Nat.mod_mod_of_dvd x (Nat.pow_dvd_pow 2 h)

/-- The stage projection of the ordinary residue thread is the expected residue modulo
`2^n`. -/
theorem twoAdicThreadOfNat_proj (x n : Nat) :
    (twoAdicResidueSystem.projAt n (twoAdicThreadOfNat x)).val = x % 2 ^ n := rfl

/-- Two ordinary naturals have the same binary residue thread if their residues agree
at every finite `2^n` stage. This is the Collatz-specialized stage-separation
principle inherited from the inverse-hull carrier. -/
theorem twoAdicThreadOfNat_ext {x y : Nat}
    (h : ∀ n, x % 2 ^ n = y % 2 ^ n) :
    twoAdicThreadOfNat x = twoAdicThreadOfNat y := by
  apply twoAdicResidueSystem.hull_separated_by_stages
  intro k
  apply Fin.ext
  simpa [twoAdicThreadOfNat_proj] using h k

/-- Equality of ordinary residue threads is exactly equality at every finite binary
stage. This is the native inverse-hull reading of a two-adic digit pattern:
nothing is visible in the thread beyond its coherent finite `2^n` residues. -/
theorem twoAdicThreadOfNat_eq_iff_all_residues_eq (x y : Nat) :
    twoAdicThreadOfNat x = twoAdicThreadOfNat y ↔
      ∀ n, x % 2 ^ n = y % 2 ^ n := by
  constructor
  · intro h n
    have hproj := congrArg (fun t : TwoAdicResidueThread =>
      (twoAdicResidueSystem.projAt n t).val) h
    simpa [twoAdicThreadOfNat_proj] using hproj
  · exact twoAdicThreadOfNat_ext

/-- Equality of the stage-`n` projections of ordinary residue threads is exactly
congruence modulo `2^n`. This is the finite-cylinder reading of a binary digit
prefix. -/
theorem twoAdicThreadOfNat_proj_eq_iff_mod_eq (x y n : Nat) :
    twoAdicResidueSystem.projAt n (twoAdicThreadOfNat x) =
        twoAdicResidueSystem.projAt n (twoAdicThreadOfNat y) ↔
      x % 2 ^ n = y % 2 ^ n := by
  constructor
  · intro h
    exact congrArg Fin.val h
  · intro h
    apply Fin.ext
    simpa [twoAdicThreadOfNat_proj] using h

/-- A positive lift inside a finite two-adic cylinder. The two naturals have the
same stage-`k` binary projection, and the first is obtained from the second by a
positive whole number of `2^k`-laps. -/
def TwoAdicPositiveCylinderLift (k x y : Nat) : Prop :=
  twoAdicResidueSystem.projAt k (twoAdicThreadOfNat x) =
      twoAdicResidueSystem.projAt k (twoAdicThreadOfNat y) ∧
    ∃ q, x = y + 2 ^ k * (q + 1)

/-- A positive finite two-adic cylinder lift is exactly equality of residues
modulo the binary stage together with a carry of at least one full modulus. -/
theorem twoAdicPositiveCylinderLift_iff_modulus_le_sub (k x y : Nat) :
    TwoAdicPositiveCylinderLift k x y ↔
      x % 2 ^ k = y % 2 ^ k ∧ 2 ^ k <= x - y := by
  constructor
  · intro h
    obtain ⟨hproj, q, hq⟩ := h
    have hmod := (twoAdicThreadOfNat_proj_eq_iff_mod_eq x y k).mp hproj
    constructor
    · exact hmod
    · rw [hq, Nat.add_sub_cancel_left]
      exact Nat.le_mul_of_pos_right (2 ^ k) (Nat.succ_pos q)
  · intro h
    obtain ⟨hmod, hcarry⟩ := h
    have hyx : y <= x := by omega
    have hdvd : 2 ^ k ∣ x - y := dvd_sub_of_mod_eq hmod.symm hyx
    obtain ⟨q, hq⟩ := hdvd
    have hqpos : 0 < q := by
      cases q with
      | zero => omega
      | succ q => omega
    obtain ⟨q', hq'⟩ := Nat.exists_eq_succ_of_ne_zero (Nat.ne_of_gt hqpos)
    refine ⟨?_, q', ?_⟩
    · exact (twoAdicThreadOfNat_proj_eq_iff_mod_eq x y k).mpr hmod
    · have hx : x = y + (x - y) := (Nat.add_sub_of_le hyx).symm
      rw [hx, hq, hq']

/-- The finite-stage binary odometer step. -/
def twoAdicStageSucc (n : Nat) (x : twoAdicStage n) : twoAdicStage n :=
  ⟨(x.val + 1) % 2 ^ n, Nat.mod_lt _ (Nat.pow_pos (by decide : 0 < 2))⟩

/-- The finite-stage odometer commutes with binary prefix restriction. -/
theorem twoAdicStageSucc_restrict {m n : Nat} (h : m <= n) (x : twoAdicStage n) :
    twoAdicRestrict h (twoAdicStageSucc n x) =
      twoAdicStageSucc m (twoAdicRestrict h x) := by
  apply Fin.ext
  dsimp [twoAdicRestrict, twoAdicStageSucc]
  have hdvd : 2 ^ m ∣ 2 ^ n := Nat.pow_dvd_pow 2 h
  rw [Nat.mod_mod_of_dvd _ hdvd]
  simp [Nat.add_mod]

/-- The binary odometer action on coherent residue threads. -/
def twoAdicOdometer (t : TwoAdicResidueThread) : TwoAdicResidueThread where
  at_ n := twoAdicStageSucc n (twoAdicResidueSystem.projAt n t)
  coh := by
    intro m n h
    calc
      twoAdicResidueSystem.proj h
          (twoAdicStageSucc n (twoAdicResidueSystem.projAt n t))
          = twoAdicStageSucc m
              (twoAdicResidueSystem.proj h (twoAdicResidueSystem.projAt n t)) := by
            exact twoAdicStageSucc_restrict h (twoAdicResidueSystem.projAt n t)
      _ = twoAdicStageSucc m (twoAdicResidueSystem.projAt m t) := by
            rw [twoAdicResidueSystem.projAt_coh h t]

/-- Stage projection of the binary odometer is ordinary successor modulo `2^n`. -/
theorem twoAdicOdometer_proj (t : TwoAdicResidueThread) (n : Nat) :
    (twoAdicResidueSystem.projAt n (twoAdicOdometer t)).val =
      ((twoAdicResidueSystem.projAt n t).val + 1) % 2 ^ n := rfl

/-- On ordinary naturals embedded as residue threads, the binary odometer is the
successor map. -/
theorem twoAdicOdometer_threadOfNat (x : Nat) :
    twoAdicOdometer (twoAdicThreadOfNat x) = twoAdicThreadOfNat (x + 1) := by
  apply twoAdicResidueSystem.hull_separated_by_stages
  intro n
  apply Fin.ext
  simp [twoAdicOdometer_proj, twoAdicThreadOfNat_proj, Nat.add_mod]

/-! ## The Collatz lock on the two-adic tower -/

/-- On a parent barrier, `parentD` is a unit at the explicit binary modulus. -/
theorem parentD_coprime_twoAdicModulus {p : List Branch} (hp : ParentBarrier p) :
    (parentD p).Coprime (2 ^ (p.length + 1)) := by
  simpa [parentM_eq_pow p] using parentD_coprime_parentM hp

/-- A parent barrier has a residue solving `parentD p * r = parentC p` in the
explicit binary stage. -/
theorem parentBarrier_twoAdicResidue_exists {p : List Branch} (hp : ParentBarrier p) :
    ∃ r, r < 2 ^ (p.length + 1) ∧
      (parentD p * r) % 2 ^ (p.length + 1) =
        parentC p % 2 ^ (p.length + 1) := by
  exact exists_residue (C := parentC p) (D := parentD p)
    (M := 2 ^ (p.length + 1))
    (parentD_coprime_twoAdicModulus hp)
    (Nat.pow_pos (by decide : 0 < 2))

/-- The parent-barrier residue in the explicit binary stage is unique. -/
theorem parentBarrier_twoAdicResidue_unique {p : List Branch}
    (hp : ParentBarrier p) {r s : Nat}
    (hr : r < 2 ^ (p.length + 1))
    (hs : s < 2 ^ (p.length + 1))
    (hrmod : (parentD p * r) % 2 ^ (p.length + 1) =
      parentC p % 2 ^ (p.length + 1))
    (hsmod : (parentD p * s) % 2 ^ (p.length + 1) =
      parentC p % 2 ^ (p.length + 1)) :
    r = s := by
  have hmul :
      (parentD p * r) % 2 ^ (p.length + 1) =
        (parentD p * s) % 2 ^ (p.length + 1) := by
    rw [hrmod, hsmod]
  have hmod := modEq_mul_cancel
    (D := parentD p) (M := 2 ^ (p.length + 1))
    (parentD_coprime_twoAdicModulus hp) hmul
  simpa [Nat.mod_eq_of_lt hr, Nat.mod_eq_of_lt hs] using hmod

/-- The parent-barrier gap in explicit `2^k` carry form. -/
def ParentBarrierTwoAdicCarryGap : Prop :=
  ∀ p : List Branch, ParentBarrier p → ¬ TrivialParentBarrier p →
    ∀ r, r < 2 ^ (p.length + 1) →
      (parentD p * r) % 2 ^ (p.length + 1) = parentC p % 2 ^ (p.length + 1) →
        2 ^ (p.length + 1) <= parentD p * r - parentC p

/-- The parent-barrier gap in unique binary-residue form: the unique residue solving
`parentD p * r = parentC p` modulo `2^(p.length+1)` has carry at least the modulus. -/
def ParentBarrierTwoAdicUniqueResidueGap : Prop :=
  ∀ p : List Branch, ParentBarrier p → ¬ TrivialParentBarrier p →
    ∃ r, (r < 2 ^ (p.length + 1) ∧
      (parentD p * r) % 2 ^ (p.length + 1) =
        parentC p % 2 ^ (p.length + 1) ∧
          2 ^ (p.length + 1) <= parentD p * r - parentC p) ∧
      ∀ s, s < 2 ^ (p.length + 1) →
        (parentD p * s) % 2 ^ (p.length + 1) =
          parentC p % 2 ^ (p.length + 1) →
            2 ^ (p.length + 1) <= parentD p * s - parentC p → s = r

/-- The parent-barrier gap in positive carry-quotient form: the unique binary
inverse residue does not merely produce a positive difference, but carries by
`q + 1` whole binary moduli:
`D * r = C + 2^(|p|+1) * (q + 1)`. The open problem is to show that this
positive carry quotient exists for every nontrivial parent barrier. -/
def ParentBarrierTwoAdicCarryQuotientGap : Prop :=
  ∀ p : List Branch, ParentBarrier p → ¬ TrivialParentBarrier p →
    ∃ r q, r < 2 ^ (p.length + 1) ∧
      (parentD p * r) % 2 ^ (p.length + 1) =
        parentC p % 2 ^ (p.length + 1) ∧
      parentD p * r = parentC p + 2 ^ (p.length + 1) * (q + 1)

/-- The explicit natural carry quotient at a parent-barrier residue:
`(D * r - C) / 2^(|p|+1)`. The parent-barrier gap is exactly the assertion that
this quotient is positive at every nontrivial parent-barrier inverse residue. -/
def parentBarrierTwoAdicCarryQuotient (p : List Branch) (r : Nat) : Nat :=
  (parentD p * r - parentC p) / 2 ^ (p.length + 1)

/-- The explicit two-adic carry quotient as a finite ordinal. -/
def parentBarrierTwoAdicCarryQuotientOrdinal (p : List Branch) (r : Nat) : Ord :=
  Ord.ofNat (parentBarrierTwoAdicCarryQuotient p r)

/-- The parent-barrier gap as positivity of the explicit carry quotient. -/
def ParentBarrierTwoAdicCarryQuotientPositive : Prop :=
  ∀ p : List Branch, ParentBarrier p → ¬ TrivialParentBarrier p →
    ∀ r, r < 2 ^ (p.length + 1) →
      (parentD p * r) % 2 ^ (p.length + 1) =
        parentC p % 2 ^ (p.length + 1) →
          0 < parentBarrierTwoAdicCarryQuotient p r

/-- The parent-barrier gap as a positive lift inside the finite two-adic
cylinder over `C`: the inverse residue `r` makes `D*r` land in the same
stage-`|p|+1` cylinder as `C`, and the lift is by a positive whole number of
binary moduli. -/
def ParentBarrierTwoAdicCylinderLiftGap : Prop :=
  ∀ p : List Branch, ParentBarrier p → ¬ TrivialParentBarrier p →
    ∃ r, r < 2 ^ (p.length + 1) ∧
      TwoAdicPositiveCylinderLift (p.length + 1) (parentD p * r) (parentC p)

/-- The all-residue carry form is equivalent to the unique binary-residue carry form. -/
theorem parentBarrierTwoAdicCarryGap_iff_uniqueResidueGap :
    ParentBarrierTwoAdicCarryGap ↔ ParentBarrierTwoAdicUniqueResidueGap := by
  constructor
  · intro hgap p hp hnt
    obtain ⟨r, hr, hmod⟩ := parentBarrier_twoAdicResidue_exists hp
    refine ⟨r, ?_, ?_⟩
    · exact ⟨hr, hmod, hgap p hp hnt r hr hmod⟩
    · intro s hs hmods _hcarrys
      exact parentBarrier_twoAdicResidue_unique hp hs hr hmods hmod
  · intro hunique p hp hnt r hr hmod
    obtain ⟨s, hs, _hsunique⟩ := hunique p hp hnt
    have hrs : r = s :=
      parentBarrier_twoAdicResidue_unique hp hr hs.1 hmod hs.2.1
    rw [hrs]
    exact hs.2.2

/-- The inverse-hull cylinder-lift face is directly the explicit carry-gap face.
The cylinder equality is congruence modulo `2^(|p|+1)`, while positive lift is
precisely the full-modulus carry inequality. -/
theorem parentBarrierTwoAdicCylinderLiftGap_iff_carryGap :
    ParentBarrierTwoAdicCylinderLiftGap ↔ ParentBarrierTwoAdicCarryGap := by
  constructor
  · intro hlift p hp hnt r hr hmod
    obtain ⟨s, hs, hliftS⟩ := hlift p hp hnt
    have hlift_arith :=
      (twoAdicPositiveCylinderLift_iff_modulus_le_sub
        (p.length + 1) (parentD p * s) (parentC p)).mp hliftS
    have hrs : r = s := parentBarrier_twoAdicResidue_unique hp hr hs hmod hlift_arith.1
    rw [hrs]
    exact hlift_arith.2
  · intro hcarry p hp hnt
    obtain ⟨r, hr, hmod⟩ := parentBarrier_twoAdicResidue_exists hp
    refine ⟨r, hr, ?_⟩
    exact (twoAdicPositiveCylinderLift_iff_modulus_le_sub
      (p.length + 1) (parentD p * r) (parentC p)).mpr
        ⟨hmod, hcarry p hp hnt r hr hmod⟩

/-- The all-residue carry form is equivalent to the positive carry-quotient form.
This is the transducer-state face of the lock: the quotient
`(D * r - C) / 2^(|p|+1)` is forced to be positive. -/
theorem parentBarrierTwoAdicCarryGap_iff_carryQuotientGap :
    ParentBarrierTwoAdicCarryGap ↔ ParentBarrierTwoAdicCarryQuotientGap := by
  constructor
  · intro hgap p hp hnt
    obtain ⟨r, hr, hmod⟩ := parentBarrier_twoAdicResidue_exists hp
    have hcarry := hgap p hp hnt r hr hmod
    have hle : parentC p ≤ parentD p * r := by omega
    have hdvd : 2 ^ (p.length + 1) ∣ parentD p * r - parentC p := by
      exact dvd_sub_of_mod_eq hmod.symm hle
    obtain ⟨q, hq⟩ := hdvd
    have hMpos : 0 < 2 ^ (p.length + 1) := Nat.pow_pos (by decide : 0 < 2)
    have hqpos : 0 < q := by
      cases q with
      | zero => omega
      | succ q => omega
    obtain ⟨q', hq'⟩ : ∃ q', q = q' + 1 := ⟨q - 1, by omega⟩
    refine ⟨r, q', hr, hmod, ?_⟩
    calc
      parentD p * r = parentC p + (parentD p * r - parentC p) :=
        (Nat.add_sub_of_le hle).symm
      _ = parentC p + 2 ^ (p.length + 1) * (q' + 1) := by
        rw [hq, hq']
  · intro hquot p hp hnt r hr hmod
    obtain ⟨s, q, hs, hsmod, hsq⟩ := hquot p hp hnt
    have hrs : r = s := parentBarrier_twoAdicResidue_unique hp hr hs hmod hsmod
    rw [hrs]
    have hMpos : 0 < 2 ^ (p.length + 1) := Nat.pow_pos (by decide : 0 < 2)
    have hle : parentC p ≤ parentD p * s := by omega
    have hdiff :
        parentD p * s - parentC p = 2 ^ (p.length + 1) * (q + 1) := by
      rw [hsq, Nat.add_sub_cancel_left]
    rw [hdiff]
    exact Nat.le_mul_of_pos_right (2 ^ (p.length + 1)) (Nat.succ_pos q)

/-- The all-residue carry form is exactly positivity of the explicit carry
quotient `(D * r - C) / 2^(|p|+1)` at every nontrivial parent-barrier inverse
residue. -/
theorem parentBarrierTwoAdicCarryGap_iff_carryQuotientPositive :
    ParentBarrierTwoAdicCarryGap ↔ ParentBarrierTwoAdicCarryQuotientPositive := by
  constructor
  · intro hgap p hp hnt r hr hmod
    exact Nat.div_pos (hgap p hp hnt r hr hmod) (Nat.pow_pos (by decide : 0 < 2))
  · intro hpos p hp hnt r hr hmod
    have hMpos : 0 < 2 ^ (p.length + 1) := Nat.pow_pos (by decide : 0 < 2)
    have hq : 1 ≤ parentBarrierTwoAdicCarryQuotient p r :=
      Nat.succ_le_of_lt (hpos p hp hnt r hr hmod)
    have hmul := (Nat.le_div_iff_mul_le hMpos).mp hq
    simpa [parentBarrierTwoAdicCarryQuotient, Nat.one_mul] using hmul

/-- The two-adic carry quotient and the backward-margin carry quotient are the
same finite ordinal; only the displayed modulus differs. -/
theorem parentBarrierTwoAdicCarryQuotientOrdinal_eq_backwardCarryQuotient
    (p : List Branch) (r : Nat) :
    parentBarrierTwoAdicCarryQuotientOrdinal p r =
      firstPassageBackwardCarryQuotient p r := by
  unfold parentBarrierTwoAdicCarryQuotientOrdinal parentBarrierTwoAdicCarryQuotient
    firstPassageBackwardCarryQuotient
  rw [← parentM_eq_pow p]

/-- Positivity of the explicit two-adic carry quotient can be read entirely in the
finite ordinal fragment. -/
theorem parentBarrierTwoAdicCarryQuotientPositive_iff_ordinal :
    ParentBarrierTwoAdicCarryQuotientPositive ↔
      ∀ p : List Branch, ParentBarrier p → ¬ TrivialParentBarrier p →
        ∀ r, r < 2 ^ (p.length + 1) →
          (parentD p * r) % 2 ^ (p.length + 1) =
            parentC p % 2 ^ (p.length + 1) →
            Ord.Le (Ord.succ Ord.zero)
              (parentBarrierTwoAdicCarryQuotientOrdinal p r) := by
  constructor
  · intro hpos p hp hnt r hr hmod
    rw [parentBarrierTwoAdicCarryQuotientOrdinal]
    change Ord.Le (Ord.ofNat 1)
      (Ord.ofNat (parentBarrierTwoAdicCarryQuotient p r))
    rw [Ord.ofNat_le_ofNat_iff]
    exact Nat.succ_le_iff.mpr (hpos p hp hnt r hr hmod)
  · intro hord p hp hnt r hr hmod
    have h := hord p hp hnt r hr hmod
    rw [parentBarrierTwoAdicCarryQuotientOrdinal] at h
    change Ord.Le (Ord.ofNat 1)
      (Ord.ofNat (parentBarrierTwoAdicCarryQuotient p r)) at h
    rw [Ord.ofNat_le_ofNat_iff] at h
    exact Nat.succ_le_iff.mp h

/-- The positive carry-quotient existence form is the same as positivity of the
explicit quotient at every inverse residue. -/
theorem parentBarrierTwoAdicCarryQuotientGap_iff_carryQuotientPositive :
    ParentBarrierTwoAdicCarryQuotientGap ↔
      ParentBarrierTwoAdicCarryQuotientPositive := by
  rw [← parentBarrierTwoAdicCarryGap_iff_carryQuotientGap]
  exact parentBarrierTwoAdicCarryGap_iff_carryQuotientPositive

/-- The quotient form is exactly the inverse-hull cylinder-lift form. The
congruence part is the equality of stage projections in `twoAdicResidueSystem`;
the quotient part is a positive whole-modulus lift inside that cylinder. -/
theorem parentBarrierTwoAdicCylinderLiftGap_iff_carryQuotientGap :
    ParentBarrierTwoAdicCylinderLiftGap ↔
      ParentBarrierTwoAdicCarryQuotientGap := by
  constructor
  · intro hlift p hp hnt
    obtain ⟨r, hr, hproj, q, hq⟩ := hlift p hp hnt
    refine ⟨r, q, hr, ?_, hq⟩
    exact (twoAdicThreadOfNat_proj_eq_iff_mod_eq
      (parentD p * r) (parentC p) (p.length + 1)).mp hproj
  · intro hquot p hp hnt
    obtain ⟨r, q, hr, hmod, hq⟩ := hquot p hp hnt
    refine ⟨r, hr, ?_, q, hq⟩
    exact (twoAdicThreadOfNat_proj_eq_iff_mod_eq
      (parentD p * r) (parentC p) (p.length + 1)).mpr hmod

/-- The inverse-hull cylinder-lift form is exactly positivity of the explicit
carry quotient. -/
theorem parentBarrierTwoAdicCylinderLiftGap_iff_carryQuotientPositive :
    ParentBarrierTwoAdicCylinderLiftGap ↔
      ParentBarrierTwoAdicCarryQuotientPositive := by
  rw [parentBarrierTwoAdicCylinderLiftGap_iff_carryQuotientGap]
  exact parentBarrierTwoAdicCarryQuotientGap_iff_carryQuotientPositive

/-- The carry face from `ResidueGap` is exactly the explicit `2^k` two-adic carry
form. -/
theorem parentBarrierResidueCarryGap_iff_parentBarrierTwoAdicCarryGap :
    ParentBarrierResidueCarryGap ↔ ParentBarrierTwoAdicCarryGap := by
  constructor
  · intro hcarry p hp hnt r hr hmod
    have hM : parentM p = 2 ^ (p.length + 1) := parentM_eq_pow p
    have hrM : r < parentM p := by
      rw [hM]
      exact hr
    have hmodM : (parentD p * r) % parentM p = parentC p % parentM p := by
      rw [hM]
      exact hmod
    have hout := hcarry p hp hnt r hrM hmodM
    rw [hM] at hout
    exact hout
  · intro htwo p hp hnt r hr hmod
    have hM : parentM p = 2 ^ (p.length + 1) := parentM_eq_pow p
    have hr2 : r < 2 ^ (p.length + 1) := by
      rw [← hM]
      exact hr
    have hmod2 :
        (parentD p * r) % 2 ^ (p.length + 1) =
          parentC p % 2 ^ (p.length + 1) := by
      rw [← hM]
      exact hmod
    have hout := htwo p hp hnt r hr2 hmod2
    rw [← hM] at hout
    exact hout

/-- The explicit two-adic carry face is exactly finite bad-cylinder emptiness. -/
theorem parentBarrierTwoAdicCarryGap_iff_no_badCylinderSeed :
    ParentBarrierTwoAdicCarryGap ↔
      ∀ p : List Branch, ParentBarrier p → ¬ TrivialParentBarrier p →
        ¬ ∃ n, n < parentM p ∧
          parityWord n (p ++ [Branch.E]).length = p ++ [Branch.E] ∧
          n ≤ orbit n (p ++ [Branch.E]).length := by
  rw [← parentBarrierResidueCarryGap_iff_parentBarrierTwoAdicCarryGap]
  exact parentBarrierResidueCarryGap_iff_no_badCylinderSeed

/-- The explicit two-adic carry face is exactly first-passage cylinder descent. -/
theorem parentBarrierTwoAdicCarryGap_iff_cylinderSeeds_descend :
    ParentBarrierTwoAdicCarryGap ↔
      ∀ p : List Branch, ParentBarrier p → ¬ TrivialParentBarrier p →
        ∀ n, n < parentM p → parityWord n (p ++ [Branch.E]).length = p ++ [Branch.E] →
          orbit n (p ++ [Branch.E]).length < n := by
  rw [← parentBarrierResidueCarryGap_iff_parentBarrierTwoAdicCarryGap]
  exact parentBarrierResidueCarryGap_iff_cylinderSeeds_descend

/-- The explicit two-adic carry face is exactly emptiness of the bad
first-passage backward-seed language. -/
theorem parentBarrierTwoAdicCarryGap_iff_no_badBackwardSeed :
    ParentBarrierTwoAdicCarryGap ↔ NoBadFirstPassageBackwardSeed := by
  rw [← parentBarrierResidueCarryGap_iff_parentBarrierTwoAdicCarryGap]
  exact parentBarrierResidueCarryGap_iff_no_badBackwardSeed

/-- The positive cylinder-lift face is exactly emptiness of the bad
first-passage backward-seed language. -/
theorem parentBarrierTwoAdicCylinderLiftGap_iff_no_badBackwardSeed :
    ParentBarrierTwoAdicCylinderLiftGap ↔ NoBadFirstPassageBackwardSeed :=
  parentBarrierTwoAdicCylinderLiftGap_iff_carryGap.trans
    parentBarrierTwoAdicCarryGap_iff_no_badBackwardSeed

/-- Positivity of the explicit carry quotient is exactly emptiness of the bad
first-passage backward-seed language. -/
theorem parentBarrierTwoAdicCarryQuotientPositive_iff_no_badBackwardSeed :
    ParentBarrierTwoAdicCarryQuotientPositive ↔ NoBadFirstPassageBackwardSeed :=
  parentBarrierTwoAdicCarryGap_iff_carryQuotientPositive.symm.trans
    parentBarrierTwoAdicCarryGap_iff_no_badBackwardSeed

/-- The explicit two-adic carry face is exactly strict descent of every
nontrivial first-passage backward seed. -/
theorem parentBarrierTwoAdicCarryGap_iff_backwardSeeds_descend :
    ParentBarrierTwoAdicCarryGap ↔
      ∀ p : List Branch, ParentBarrier p → ¬ TrivialParentBarrier p →
        ∀ n, FirstPassageBackwardSeed p n →
          orbit n (p ++ [Branch.E]).length < n := by
  rw [← parentBarrierResidueCarryGap_iff_parentBarrierTwoAdicCarryGap]
  exact parentBarrierResidueCarryGap_iff_backwardSeeds_descend

/-- The canonical denominator-bound route is the finite-coalgebra K4 face: it
uses the bounded backward-cylinder representative and reads as the arrow-dual
generator `K4.neg`, while carrying the actual descent payload. -/
theorem canonicalDenominatorBound_lands_finiteCoalgebra {a b : Nat}
    (hp : ParentBarrier (canonicalWord a b))
    (hD : 2 ^ (b + 1) ≤ parentD (canonicalWord a b)) :
    (∀ n, FirstPassageBackwardSeed (canonicalWord a b) n →
      orbit n (canonicalWord a b ++ [Branch.E]).length < n) ∧
      Charger.toK4 Charger.finiteCoalgebra = Positing.Gauge.K4.neg := by
  exact ⟨canonicalWord_backwardSeeds_descend_of_denominator_bound hp hD, rfl⟩

/-- The full-modulus carry face is exactly the unique binary-residue carry face. -/
theorem parentBarrierResidueCarryGap_iff_parentBarrierTwoAdicUniqueResidueGap :
    ParentBarrierResidueCarryGap ↔ ParentBarrierTwoAdicUniqueResidueGap := by
  rw [parentBarrierResidueCarryGap_iff_parentBarrierTwoAdicCarryGap]
  exact parentBarrierTwoAdicCarryGap_iff_uniqueResidueGap

/-- The full-modulus carry face is exactly the positive carry-quotient face. -/
theorem parentBarrierResidueCarryGap_iff_parentBarrierTwoAdicCarryQuotientGap :
    ParentBarrierResidueCarryGap ↔ ParentBarrierTwoAdicCarryQuotientGap := by
  rw [parentBarrierResidueCarryGap_iff_parentBarrierTwoAdicCarryGap]
  exact parentBarrierTwoAdicCarryGap_iff_carryQuotientGap

/-- The full-modulus carry face is exactly positivity of the explicit carry
quotient. -/
theorem parentBarrierResidueCarryGap_iff_parentBarrierTwoAdicCarryQuotientPositive :
    ParentBarrierResidueCarryGap ↔ ParentBarrierTwoAdicCarryQuotientPositive := by
  rw [parentBarrierResidueCarryGap_iff_parentBarrierTwoAdicCarryGap]
  exact parentBarrierTwoAdicCarryGap_iff_carryQuotientPositive

/-- The full-modulus carry face is exactly the positive cylinder-lift face. -/
theorem parentBarrierResidueCarryGap_iff_parentBarrierTwoAdicCylinderLiftGap :
    ParentBarrierResidueCarryGap ↔ ParentBarrierTwoAdicCylinderLiftGap := by
  rw [parentBarrierResidueCarryGap_iff_parentBarrierTwoAdicCarryGap]
  exact parentBarrierTwoAdicCylinderLiftGap_iff_carryGap.symm

/-- The residue inequality face is exactly the explicit `2^k` two-adic carry
form. -/
theorem parentBarrierResidueGap_iff_parentBarrierTwoAdicCarryGap :
    ParentBarrierResidueGap ↔ ParentBarrierTwoAdicCarryGap := by
  rw [parentBarrierResidueGap_iff_parentBarrierResidueCarryGap]
  exact parentBarrierResidueCarryGap_iff_parentBarrierTwoAdicCarryGap

/-- The residue inequality face is exactly the unique binary-residue carry face. -/
theorem parentBarrierResidueGap_iff_parentBarrierTwoAdicUniqueResidueGap :
    ParentBarrierResidueGap ↔ ParentBarrierTwoAdicUniqueResidueGap := by
  rw [parentBarrierResidueGap_iff_parentBarrierTwoAdicCarryGap]
  exact parentBarrierTwoAdicCarryGap_iff_uniqueResidueGap

/-- The residue inequality face is exactly the positive carry-quotient face. -/
theorem parentBarrierResidueGap_iff_parentBarrierTwoAdicCarryQuotientGap :
    ParentBarrierResidueGap ↔ ParentBarrierTwoAdicCarryQuotientGap := by
  rw [parentBarrierResidueGap_iff_parentBarrierTwoAdicCarryGap]
  exact parentBarrierTwoAdicCarryGap_iff_carryQuotientGap

/-- The residue inequality face is exactly positivity of the explicit carry
quotient. -/
theorem parentBarrierResidueGap_iff_parentBarrierTwoAdicCarryQuotientPositive :
    ParentBarrierResidueGap ↔ ParentBarrierTwoAdicCarryQuotientPositive := by
  rw [parentBarrierResidueGap_iff_parentBarrierTwoAdicCarryGap]
  exact parentBarrierTwoAdicCarryGap_iff_carryQuotientPositive

/-- The residue inequality face is exactly the positive cylinder-lift face. -/
theorem parentBarrierResidueGap_iff_parentBarrierTwoAdicCylinderLiftGap :
    ParentBarrierResidueGap ↔ ParentBarrierTwoAdicCylinderLiftGap := by
  rw [parentBarrierResidueGap_iff_parentBarrierTwoAdicCarryGap]
  exact parentBarrierTwoAdicCylinderLiftGap_iff_carryGap.symm

/-- The parent-barrier semigroup gap is exactly the explicit `2^k` two-adic carry
form — the one-lock arithmetic face restated in this carrier. -/
theorem parentBarrierGap_iff_parentBarrierTwoAdicCarryGap :
    ParentBarrierGap ↔ ParentBarrierTwoAdicCarryGap := by
  rw [parentBarrierGap_iff_parentBarrierResidueCarryGap]
  exact parentBarrierResidueCarryGap_iff_parentBarrierTwoAdicCarryGap

/-- The parent-barrier semigroup gap is exactly the unique binary-residue carry face. -/
theorem parentBarrierGap_iff_parentBarrierTwoAdicUniqueResidueGap :
    ParentBarrierGap ↔ ParentBarrierTwoAdicUniqueResidueGap := by
  rw [parentBarrierGap_iff_parentBarrierTwoAdicCarryGap]
  exact parentBarrierTwoAdicCarryGap_iff_uniqueResidueGap

/-- The parent-barrier semigroup gap is exactly the positive carry-quotient face. -/
theorem parentBarrierGap_iff_parentBarrierTwoAdicCarryQuotientGap :
    ParentBarrierGap ↔ ParentBarrierTwoAdicCarryQuotientGap := by
  rw [parentBarrierGap_iff_parentBarrierTwoAdicCarryGap]
  exact parentBarrierTwoAdicCarryGap_iff_carryQuotientGap

/-- The parent-barrier semigroup gap is exactly positivity of the explicit carry
quotient `(D * r - C) / 2^(|p|+1)`. This is the exact formal state checked by the
finite parent-barrier margin audit. -/
theorem parentBarrierGap_iff_parentBarrierTwoAdicCarryQuotientPositive :
    ParentBarrierGap ↔ ParentBarrierTwoAdicCarryQuotientPositive := by
  rw [parentBarrierGap_iff_parentBarrierTwoAdicCarryGap]
  exact parentBarrierTwoAdicCarryGap_iff_carryQuotientPositive

/-- The explicit two-adic quotient-positive face is the same lock as positivity
of every first-passage backward carry quotient ordinal. -/
theorem parentBarrierTwoAdicCarryQuotientPositive_iff_backwardCarryQuotients_positive :
    ParentBarrierTwoAdicCarryQuotientPositive ↔
      ∀ p : List Branch, ParentBarrier p → ¬ TrivialParentBarrier p →
        ∀ n, FirstPassageBackwardSeed p n →
          Ord.Le (Ord.succ Ord.zero) (firstPassageBackwardCarryQuotient p n) := by
  rw [← parentBarrierGap_iff_parentBarrierTwoAdicCarryQuotientPositive]
  exact parentBarrierGap_iff_backwardCarryQuotients_positive

/-! ## The claim-side firing inducer -/

/-- No ungrounded claim-side firing at parent-barrier first passage: no initial
cell may fire by `fSide` into the first-passage backward-seed boundary
for a nontrivial parent barrier. -/
def NoUngroundedClaimSideFiringAtParentBarrier : Prop :=
  ∀ u : Utterance,
    ∀ p : List Branch, ParentBarrier p → ¬ TrivialParentBarrier p →
      ∀ n, (hseed : FirstPassageBackwardSeed p n) →
        Blowup.cellType (Articulating.Cell.initial u).corner
            (firstPassageBackwardSeedCell u p n hseed).corner ≠
          some Blowup.FiringType.fSide

/-- A bad backward-seed boundary is exactly an `fSide` firing out of the empty
initial cell: the claim side has fired without the positive-carry token. -/
theorem badBackwardSeedCell_induces_fSideFiring
    (u : Utterance) {p : List Branch} {n : Nat}
    (hp : ParentBarrier p)
    (hseed : FirstPassageBackwardSeed p n)
    (hbad : BadFirstPassageBackwardSeed p n) :
    Blowup.cellType (Articulating.Cell.initial u).corner
        (firstPassageBackwardSeedCell u p n hseed).corner =
      some Blowup.FiringType.fSide := by
  rw [Articulating.Cell.corner_initial]
  rw [(firstPassageBackwardSeedCell_active_iff_bad u hp hseed).mpr hbad]
  rfl

/-- The bad backward-seed boundary is gauge-carried by FOUR negation from the
claim-side firing to the token-side firing. -/
theorem badBackwardSeedCell_negates_to_tSideFiring
    (u : Utterance) {p : List Branch} {n : Nat}
    (hp : ParentBarrier p)
    (hseed : FirstPassageBackwardSeed p n)
    (hbad : BadFirstPassageBackwardSeed p n) :
    Blowup.cellType (D4.D8.act D4.D8.neg (Articulating.Cell.initial u).corner)
        (D4.D8.act D4.D8.neg
          (firstPassageBackwardSeedCell u p n hseed).corner) =
      some Blowup.FiringType.tSide := by
  rw [Articulating.Cell.corner_initial]
  rw [(firstPassageBackwardSeedCell_active_iff_bad u hp hseed).mpr hbad]
  rfl

/-- Rotating the bad backward-seed boundary by the D4 `negSwap` cycle reaches the
natural token-side firing after passing through the potential corner. -/
theorem badBackwardSeedCell_d4_bypasses_to_tSideFiring
    (u : Utterance) {p : List Branch} {n : Nat}
    (hp : ParentBarrier p)
    (hseed : FirstPassageBackwardSeed p n)
    (hbad : BadFirstPassageBackwardSeed p n) :
    Blowup.cellType
        (D4.D8.act D4.D8.negSwap
          (firstPassageBackwardSeedCell u p n hseed).corner)
        (D4.D8.act D4.D8.negSwap
          (D4.D8.act D4.D8.negSwap
            (firstPassageBackwardSeedCell u p n hseed).corner)) =
      some Blowup.FiringType.tSide := by
  rw [(firstPassageBackwardSeedCell_active_iff_bad u hp hseed).mpr hbad]
  rfl

/-- The D4 `confSwap` bypass carries a bad backward-seed boundary to the stable
corner, where both token and claim are present. -/
theorem badBackwardSeedCell_confSwap_repairs_to_stable
    (u : Utterance) {p : List Branch} {n : Nat}
    (hp : ParentBarrier p)
    (hseed : FirstPassageBackwardSeed p n)
    (hbad : BadFirstPassageBackwardSeed p n) :
    D4.D8.act D4.D8.confSwap
        (firstPassageBackwardSeedCell u p n hseed).corner =
      Articulating.Corner.stable := by
  rw [(firstPassageBackwardSeedCell_active_iff_bad u hp hseed).mpr hbad]
  rfl

/-- First-passage backward seeds over a fixed parent barrier are the same finite
inverse-residue representative. -/
theorem firstPassageBackwardSeed_unique {p : List Branch} {n m : Nat}
    (hp : ParentBarrier p)
    (hseed : FirstPassageBackwardSeed p n)
    (hseed' : FirstPassageBackwardSeed p m) :
    n = m :=
  firstPassage_seed_eq_residue hp
    (firstPassageBackwardSeed_bound_parentM hseed) hseed.2
    (firstPassageBackwardSeed_bound_parentM hseed')
    (firstPassage_seed_residue hp hseed'.2)

/-- The realized first-passage boundary is closed under the K4 negation gauge:
every K4-negated seed boundary is realized again as a first-passage seed
boundary over the same parent barrier. -/
def K4NegClosedFirstPassageBoundary (u : Utterance) : Prop :=
  ∀ p : List Branch, ParentBarrier p → ¬ TrivialParentBarrier p →
    ∀ n, (hseed : FirstPassageBackwardSeed p n) →
      ∃ m, ∃ hseed' : FirstPassageBackwardSeed p m,
        (firstPassageBackwardSeedCell u p m hseed').corner =
          D4.D8.act D4.D8.neg
            (firstPassageBackwardSeedCell u p n hseed).corner

/-- The realized first-passage boundary is closed under the D4 `negSwap` bypass:
one bypass rotation of any realized seed boundary is realized again as a
first-passage seed boundary over the same parent barrier. -/
def D4NegSwapClosedFirstPassageBoundary (u : Utterance) : Prop :=
  ∀ p : List Branch, ParentBarrier p → ¬ TrivialParentBarrier p →
    ∀ n, (hseed : FirstPassageBackwardSeed p n) →
      ∃ m, ∃ hseed' : FirstPassageBackwardSeed p m,
        (firstPassageBackwardSeedCell u p m hseed').corner =
          D4.D8.act D4.D8.negSwap
            (firstPassageBackwardSeedCell u p n hseed).corner

/-- The K4 negation gauge closes exactly the bad first-passage boundary edge:
if a bad boundary appears, its K4-negated corner is realized again over the same
parent barrier. -/
def K4NegClosesBadFirstPassageBoundary (u : Utterance) : Prop :=
  ∀ p : List Branch, ParentBarrier p → ¬ TrivialParentBarrier p →
    ∀ n, (hseed : FirstPassageBackwardSeed p n) →
      BadFirstPassageBackwardSeed p n →
        ∃ m, ∃ hseed' : FirstPassageBackwardSeed p m,
          (firstPassageBackwardSeedCell u p m hseed').corner =
            D4.D8.act D4.D8.neg
              (firstPassageBackwardSeedCell u p n hseed).corner

/-- The D4 `confSwap` bypass closes exactly the bad first-passage boundary edge:
if a bad boundary appears, its repaired stable corner is realized again over the
same parent barrier. -/
def D4ConfSwapClosesBadFirstPassageBoundary (u : Utterance) : Prop :=
  ∀ p : List Branch, ParentBarrier p → ¬ TrivialParentBarrier p →
    ∀ n, (hseed : FirstPassageBackwardSeed p n) →
      BadFirstPassageBackwardSeed p n →
        ∃ m, ∃ hseed' : FirstPassageBackwardSeed p m,
          (firstPassageBackwardSeedCell u p m hseed').corner =
            D4.D8.act D4.D8.confSwap
              (firstPassageBackwardSeedCell u p n hseed).corner

/-- The D4 `negSwap` bypass closes exactly the bad first-passage boundary edge:
if a bad boundary appears, its bypass corner is realized again over the same
parent barrier. -/
def D4NegSwapClosesBadFirstPassageBoundary (u : Utterance) : Prop :=
  ∀ p : List Branch, ParentBarrier p → ¬ TrivialParentBarrier p →
    ∀ n, (hseed : FirstPassageBackwardSeed p n) →
      BadFirstPassageBackwardSeed p n →
        ∃ m, ∃ hseed' : FirstPassageBackwardSeed p m,
          (firstPassageBackwardSeedCell u p m hseed').corner =
            D4.D8.act D4.D8.negSwap
              (firstPassageBackwardSeedCell u p n hseed).corner

/-- If the realized first-passage boundary carries the K4 negation gauge, then a
bad seed would have to realize the true-only potential corner, impossible for
first-passage seed cells. -/
theorem parentBarrierGap_of_k4NegClosedFirstPassageBoundary
    (u : Utterance)
    (hclosed : K4NegClosedFirstPassageBoundary u) :
    ParentBarrierGap := by
  rw [parentBarrierGap_iff_no_badBackwardSeed]
  intro p hp hnt
  rintro ⟨n, hbad⟩
  obtain ⟨m, hseed', hcorner⟩ := hclosed p hp hnt n hbad.1
  have hactive := (firstPassageBackwardSeedCell_active_iff_bad u hp hbad.1).mpr hbad
  rw [hactive] at hcorner
  exact firstPassageBackwardSeedCell_ne_potential u hseed' hcorner

/-- If the realized first-passage boundary carries the D4 `negSwap` bypass, then
a bad seed would have to realize the empty absurd corner, impossible for
first-passage seed cells. -/
theorem parentBarrierGap_of_d4NegSwapClosedFirstPassageBoundary
    (u : Utterance)
    (hclosed : D4NegSwapClosedFirstPassageBoundary u) :
    ParentBarrierGap := by
  rw [parentBarrierGap_iff_no_badBackwardSeed]
  intro p hp hnt
  rintro ⟨n, hbad⟩
  obtain ⟨m, hseed', hcorner⟩ := hclosed p hp hnt n hbad.1
  have hactive := (firstPassageBackwardSeedCell_active_iff_bad u hp hbad.1).mpr hbad
  rw [hactive] at hcorner
  exact firstPassageBackwardSeedCell_ne_absurd u hseed' hcorner

/-- The parent-barrier gap is exactly bad-edge K4 closure: if a bad seed exists,
closing its K4-negated corner would force a true-only realized boundary, while
under the gap there are no bad seeds to close. -/
theorem parentBarrierGap_iff_k4NegClosesBadFirstPassageBoundary
    (u : Utterance) :
    ParentBarrierGap ↔ K4NegClosesBadFirstPassageBoundary u := by
  constructor
  · intro hgap p hp hnt n _hseed hbad
    exact False.elim
      ((parentBarrierGap_iff_no_badBackwardSeed.mp hgap) p hp hnt ⟨n, hbad⟩)
  · intro hclosed
    rw [parentBarrierGap_iff_no_badBackwardSeed]
    intro p hp hnt
    rintro ⟨n, hbad⟩
    obtain ⟨m, hseed', hcorner⟩ := hclosed p hp hnt n hbad.1 hbad
    have hactive := (firstPassageBackwardSeedCell_active_iff_bad u hp hbad.1).mpr hbad
    rw [hactive] at hcorner
    exact firstPassageBackwardSeedCell_ne_potential u hseed' hcorner

/-- The parent-barrier gap is exactly bad-edge D4 bypass closure: if a bad seed
exists, closing its `negSwap` bypass would force an empty absurd realized
boundary, while under the gap there are no bad seeds to close. -/
theorem parentBarrierGap_iff_d4NegSwapClosesBadFirstPassageBoundary
    (u : Utterance) :
    ParentBarrierGap ↔ D4NegSwapClosesBadFirstPassageBoundary u := by
  constructor
  · intro hgap p hp hnt n _hseed hbad
    exact False.elim
      ((parentBarrierGap_iff_no_badBackwardSeed.mp hgap) p hp hnt ⟨n, hbad⟩)
  · intro hclosed
    rw [parentBarrierGap_iff_no_badBackwardSeed]
    intro p hp hnt
    rintro ⟨n, hbad⟩
    obtain ⟨m, hseed', hcorner⟩ := hclosed p hp hnt n hbad.1 hbad
    have hactive := (firstPassageBackwardSeedCell_active_iff_bad u hp hbad.1).mpr hbad
    rw [hactive] at hcorner
    exact firstPassageBackwardSeedCell_ne_absurd u hseed' hcorner

/-- If bad first-passage boundaries are closed under the D4 `confSwap` repair,
then a bad seed is identified with a realized stable repaired seed over the same
finite parent-barrier residue, contradicting badness. -/
theorem parentBarrierGap_of_d4ConfSwapClosesBadFirstPassageBoundary
    (u : Utterance)
    (hclosed : D4ConfSwapClosesBadFirstPassageBoundary u) :
    ParentBarrierGap := by
  rw [parentBarrierGap_iff_no_badBackwardSeed]
  intro p hp hnt
  rintro ⟨n, hbad⟩
  obtain ⟨m, hseed', hcorner⟩ := hclosed p hp hnt n hbad.1 hbad
  have hstable :
      (firstPassageBackwardSeedCell u p m hseed').corner =
        Articulating.Corner.stable := by
    rw [hcorner]
    exact badBackwardSeedCell_confSwap_repairs_to_stable u hp hbad.1 hbad
  have hnotbad :
      ¬ BadFirstPassageBackwardSeed p m :=
    (firstPassageBackwardSeedCell_stable_iff_not_bad u hp hseed').mp hstable
  have hmn : n = m := firstPassageBackwardSeed_unique hp hbad.1 hseed'
  subst m
  exact hnotbad hbad

/-- The parent-barrier gap is exactly bad-edge D4 `confSwap` repair closure:
under the gap there are no bad edges to repair, while any realized `confSwap`
repair carries a bad edge into the stable/not-bad face of the same finite
first-passage residue. -/
theorem parentBarrierGap_iff_d4ConfSwapClosesBadFirstPassageBoundary
    (u : Utterance) :
    ParentBarrierGap ↔ D4ConfSwapClosesBadFirstPassageBoundary u := by
  constructor
  · intro hgap p hp hnt n _hseed hbad
    exact False.elim
      ((parentBarrierGap_iff_no_badBackwardSeed.mp hgap) p hp hnt ⟨n, hbad⟩)
  · exact parentBarrierGap_of_d4ConfSwapClosesBadFirstPassageBoundary u

/-- Once a bad backward-seed boundary is at the active corner, the table reads
the active-to-stable step as a top firing. -/
theorem badBackwardSeedCell_activeToStable_isTopFiring
    (u : Utterance) {p : List Branch} {n : Nat}
    (hp : ParentBarrier p)
    (hseed : FirstPassageBackwardSeed p n)
    (hbad : BadFirstPassageBackwardSeed p n) :
    Blowup.cellType
        (firstPassageBackwardSeedCell u p n hseed).corner
        Articulating.Corner.stable =
      some Blowup.FiringType.top := by
  rw [(firstPassageBackwardSeedCell_active_iff_bad u hp hseed).mpr hbad]
  rfl

/-- A bad backward-seed cell has no nontrivial monotone forward repair below
stable: every nontrivial forward firing out of it is the top/consistency-failure
row and lands at `stable`. -/
theorem badBackwardSeedCell_nontrivial_forward_firing_isTop
    (u : Utterance) {p : List Branch} {n : Nat}
    (hp : ParentBarrier p)
    (hseed : FirstPassageBackwardSeed p n)
    (hbad : BadFirstPassageBackwardSeed p n)
    {after : Articulating.Corner}
    (hle :
      Charge.leK
        (firstPassageBackwardSeedCell u p n hseed).corner after = true)
    (hne : after ≠
      (firstPassageBackwardSeedCell u p n hseed).corner) :
    Blowup.cellType
        (firstPassageBackwardSeedCell u p n hseed).corner after =
          some Blowup.FiringType.top ∧
      after = Articulating.Corner.stable := by
  have hactive :=
    (firstPassageBackwardSeedCell_active_iff_bad u hp hseed).mpr hbad
  rw [hactive] at hle hne ⊢
  exact Blowup.active_nontrivial_forward_cellType_top hle hne

/-- If the nontrivial forward move out of a bad seed is realized again as a
first-passage seed, the realized successor is no longer bad. -/
theorem badBackwardSeedCell_nontrivial_forward_realizedSeed_not_bad
    (u : Utterance) {p : List Branch} {n m : Nat}
    (hp : ParentBarrier p)
    (hseed : FirstPassageBackwardSeed p n)
    (hbad : BadFirstPassageBackwardSeed p n)
    (hseed' : FirstPassageBackwardSeed p m)
    (hle :
      Charge.leK
        (firstPassageBackwardSeedCell u p n hseed).corner
        (firstPassageBackwardSeedCell u p m hseed').corner = true)
    (hne :
      (firstPassageBackwardSeedCell u p m hseed').corner ≠
        (firstPassageBackwardSeedCell u p n hseed).corner) :
    ¬ BadFirstPassageBackwardSeed p m := by
  have htop :=
    badBackwardSeedCell_nontrivial_forward_firing_isTop u hp hseed hbad hle hne
  exact
    (firstPassageBackwardSeedCell_stable_iff_not_bad u hp hseed').mp
      htop.2

/-- A realized nontrivial forward successor of a bad seed carries a positive
first-passage ordinal carry quotient. -/
theorem badBackwardSeedCell_nontrivial_forward_realizedSeed_carryPositive
    (u : Utterance) {p : List Branch} {n m : Nat}
    (hp : ParentBarrier p)
    (hseed : FirstPassageBackwardSeed p n)
    (hbad : BadFirstPassageBackwardSeed p n)
    (hseed' : FirstPassageBackwardSeed p m)
    (hle :
      Charge.leK
        (firstPassageBackwardSeedCell u p n hseed).corner
        (firstPassageBackwardSeedCell u p m hseed').corner = true)
    (hne :
      (firstPassageBackwardSeedCell u p m hseed').corner ≠
        (firstPassageBackwardSeedCell u p n hseed).corner) :
    Ord.zero.succ.Le (firstPassageBackwardCarryQuotient p m) := by
  have hnotbad :=
    badBackwardSeedCell_nontrivial_forward_realizedSeed_not_bad
      u hp hseed hbad hseed' hle hne
  exact
    (firstPassageBackwardSeed_carryQuotient_positive_iff_not_bad hp hseed').mpr
      hnotbad

/-- In the nuclear reading, a bad backward-seed boundary is the transferring
nucleus corner. -/
theorem badBackwardSeedCell_isTransferring
    (u : Utterance) {p : List Branch} {n : Nat}
    (hp : ParentBarrier p)
    (hseed : FirstPassageBackwardSeed p n)
    (hbad : BadFirstPassageBackwardSeed p n)
    {H : Order.HeytingAlgebra} (Q : Order.CommutingNuclei H) (a : H.carrier) :
    Autopoiesis.cellCorner Q
        (firstPassageBackwardSeedCell u p n hseed).corner a =
      (Autopoiesis.transferring Q).j a := by
  rw [(firstPassageBackwardSeedCell_active_iff_bad u hp hseed).mpr hbad]
  rfl

/-- The parent-barrier gap is exactly absence of ungrounded `fSide` claim
firings out of initial cells at nontrivial first-passage boundaries. -/
theorem parentBarrierGap_iff_noUngroundedClaimSideFiringAtParentBarrier :
    ParentBarrierGap ↔ NoUngroundedClaimSideFiringAtParentBarrier := by
  constructor
  · intro hgap u p hp hnt n hseed hf
    have hnoactive :=
      (parentBarrierGap_iff_no_activeBackwardSeedCell u).mp
        hgap p hp hnt n hseed
    rw [Articulating.Cell.corner_initial] at hf
    cases hcorner : (firstPassageBackwardSeedCell u p n hseed).corner
    · simp [Blowup.cellType, hcorner] at hf
    · simp [Blowup.cellType, hcorner] at hf
    · exact hnoactive hcorner
    · simp [Blowup.cellType, hcorner] at hf
  · intro hno
    refine (parentBarrierGap_iff_no_activeBackwardSeedCell default).mpr ?_
    intro p hp hnt n hseed hactive
    have hf : Blowup.cellType (Articulating.Cell.initial default).corner
            (firstPassageBackwardSeedCell default p n hseed).corner =
          some Blowup.FiringType.fSide := by
      exact badBackwardSeedCell_induces_fSideFiring default hp hseed
        ((firstPassageBackwardSeedCell_active_iff_bad default hp hseed).mp hactive)
    exact hno default p hp hnt n hseed hf

/-- Every realized nontrivial first-passage backward seed cell is fully
token-grounded at the stable corner. -/
def TokenGroundedFirstPassageBackwardSeeds (u : Utterance) : Prop :=
  ∀ p : List Branch, ParentBarrier p → ¬ TrivialParentBarrier p →
    ∀ n, (hseed : FirstPassageBackwardSeed p n) →
      (firstPassageBackwardSeedCell u p n hseed).corner =
        Articulating.Corner.stable

/-- Absence of ungrounded claim-side firing is exactly that every realized
first-passage backward seed cell is fully token-grounded. -/
theorem noUngroundedClaimSideFiringAtParentBarrier_iff_stableBackwardSeedCell
    (u : Utterance) :
    NoUngroundedClaimSideFiringAtParentBarrier ↔
      TokenGroundedFirstPassageBackwardSeeds u :=
  parentBarrierGap_iff_noUngroundedClaimSideFiringAtParentBarrier.symm.trans
    (parentBarrierGap_iff_stableBackwardSeedCell u)

/-- No bad first-passage backward seed is exactly the token-grounded realized
seed-cell invariant. -/
theorem noBadFirstPassageBackwardSeed_iff_tokenGroundedFirstPassageBackwardSeeds
    (u : Utterance) :
    NoBadFirstPassageBackwardSeed ↔
      TokenGroundedFirstPassageBackwardSeeds u :=
  parentBarrierGap_iff_no_badBackwardSeed.symm.trans
    (parentBarrierGap_iff_stableBackwardSeedCell u)

/-- Absence of ungrounded claim-side firing is exactly bad-edge K4 closure. -/
theorem noUngroundedClaimSideFiringAtParentBarrier_iff_k4NegClosesBadFirstPassageBoundary
    (u : Utterance) :
    NoUngroundedClaimSideFiringAtParentBarrier ↔
      K4NegClosesBadFirstPassageBoundary u :=
  parentBarrierGap_iff_noUngroundedClaimSideFiringAtParentBarrier.symm.trans
    (parentBarrierGap_iff_k4NegClosesBadFirstPassageBoundary u)

/-- Absence of ungrounded claim-side firing is exactly bad-edge D4 `negSwap`
bypass closure. -/
theorem noUngroundedClaimSideFiringAtParentBarrier_iff_d4NegSwapClosesBadFirstPassageBoundary
    (u : Utterance) :
    NoUngroundedClaimSideFiringAtParentBarrier ↔
      D4NegSwapClosesBadFirstPassageBoundary u :=
  parentBarrierGap_iff_noUngroundedClaimSideFiringAtParentBarrier.symm.trans
    (parentBarrierGap_iff_d4NegSwapClosesBadFirstPassageBoundary u)

/-- Absence of ungrounded claim-side firing is exactly bad-edge D4 `confSwap`
repair closure. -/
theorem noUngroundedClaimSideFiringAtParentBarrier_iff_d4ConfSwapClosesBadFirstPassageBoundary
    (u : Utterance) :
    NoUngroundedClaimSideFiringAtParentBarrier ↔
      D4ConfSwapClosesBadFirstPassageBoundary u :=
  parentBarrierGap_iff_noUngroundedClaimSideFiringAtParentBarrier.symm.trans
    (parentBarrierGap_iff_d4ConfSwapClosesBadFirstPassageBoundary u)

/-- Absence of ungrounded claim-side firing is exactly the sharp residue
inequality at every nontrivial parent barrier. -/
theorem noUngroundedClaimSideFiringAtParentBarrier_iff_parentBarrierResidueGap :
    NoUngroundedClaimSideFiringAtParentBarrier ↔ ParentBarrierResidueGap :=
  parentBarrierGap_iff_noUngroundedClaimSideFiringAtParentBarrier.symm.trans
    parentBarrierGap_iff_parentBarrierResidueGap

/-- Absence of ungrounded claim-side firing is exactly the residue-carry
inequality, the high two-adic-digit form of the same parent-barrier gap. -/
theorem noUngroundedClaimSideFiringAtParentBarrier_iff_parentBarrierResidueCarryGap :
    NoUngroundedClaimSideFiringAtParentBarrier ↔ ParentBarrierResidueCarryGap :=
  parentBarrierGap_iff_noUngroundedClaimSideFiringAtParentBarrier.symm.trans
    parentBarrierGap_iff_parentBarrierResidueCarryGap

/-- Absence of ungrounded claim-side firing is exactly emptiness of the bad
first-passage backward-seed language. -/
theorem noUngroundedClaimSideFiringAtParentBarrier_iff_no_badBackwardSeed :
    NoUngroundedClaimSideFiringAtParentBarrier ↔
      NoBadFirstPassageBackwardSeed :=
  parentBarrierGap_iff_noUngroundedClaimSideFiringAtParentBarrier.symm.trans
    parentBarrierGap_iff_no_badBackwardSeed

/-- Absence of ungrounded claim-side firing is exactly positivity of every
first-passage backward carry quotient ordinal. -/
theorem noUngroundedClaimSideFiringAtParentBarrier_iff_backwardCarryQuotients_positive :
    NoUngroundedClaimSideFiringAtParentBarrier ↔
      ∀ p : List Branch, ParentBarrier p → ¬ TrivialParentBarrier p →
        ∀ n, FirstPassageBackwardSeed p n →
          Ord.Le (Ord.succ Ord.zero) (firstPassageBackwardCarryQuotient p n) :=
  (parentBarrierGap_iff_noUngroundedClaimSideFiringAtParentBarrier.symm.trans
      parentBarrierGap_iff_parentBarrierTwoAdicCarryQuotientPositive).trans
    parentBarrierTwoAdicCarryQuotientPositive_iff_backwardCarryQuotients_positive

/-- Bad-edge K4 closure is the residue inequality read through the firing
boundary. -/
theorem k4NegClosesBadFirstPassageBoundary_iff_parentBarrierResidueGap
    (u : Utterance) :
    K4NegClosesBadFirstPassageBoundary u ↔ ParentBarrierResidueGap :=
  (noUngroundedClaimSideFiringAtParentBarrier_iff_k4NegClosesBadFirstPassageBoundary u).symm.trans
    noUngroundedClaimSideFiringAtParentBarrier_iff_parentBarrierResidueGap

/-- Bad-edge D4 `negSwap` closure is the residue inequality read through the
firing boundary. -/
theorem d4NegSwapClosesBadFirstPassageBoundary_iff_parentBarrierResidueGap
    (u : Utterance) :
    D4NegSwapClosesBadFirstPassageBoundary u ↔ ParentBarrierResidueGap :=
  (noUngroundedClaimSideFiringAtParentBarrier_iff_d4NegSwapClosesBadFirstPassageBoundary u).symm.trans
    noUngroundedClaimSideFiringAtParentBarrier_iff_parentBarrierResidueGap

/-- Bad-edge D4 `confSwap` repair closure is the residue inequality read through
the firing boundary. -/
theorem d4ConfSwapClosesBadFirstPassageBoundary_iff_parentBarrierResidueGap
    (u : Utterance) :
    D4ConfSwapClosesBadFirstPassageBoundary u ↔ ParentBarrierResidueGap :=
  (noUngroundedClaimSideFiringAtParentBarrier_iff_d4ConfSwapClosesBadFirstPassageBoundary u).symm.trans
    noUngroundedClaimSideFiringAtParentBarrier_iff_parentBarrierResidueGap

/-- Bad-edge K4 closure is exactly emptiness of the bad first-passage
backward-seed language. -/
theorem k4NegClosesBadFirstPassageBoundary_iff_no_badBackwardSeed
    (u : Utterance) :
    K4NegClosesBadFirstPassageBoundary u ↔
      NoBadFirstPassageBackwardSeed :=
  (noUngroundedClaimSideFiringAtParentBarrier_iff_k4NegClosesBadFirstPassageBoundary u).symm.trans
    noUngroundedClaimSideFiringAtParentBarrier_iff_no_badBackwardSeed

/-- Bad-edge D4 `negSwap` closure is exactly emptiness of the bad
first-passage backward-seed language. -/
theorem d4NegSwapClosesBadFirstPassageBoundary_iff_no_badBackwardSeed
    (u : Utterance) :
    D4NegSwapClosesBadFirstPassageBoundary u ↔
      NoBadFirstPassageBackwardSeed :=
  (noUngroundedClaimSideFiringAtParentBarrier_iff_d4NegSwapClosesBadFirstPassageBoundary u).symm.trans
    noUngroundedClaimSideFiringAtParentBarrier_iff_no_badBackwardSeed

/-- Bad-edge D4 `confSwap` repair closure is exactly emptiness of the bad
first-passage backward-seed language. -/
theorem d4ConfSwapClosesBadFirstPassageBoundary_iff_no_badBackwardSeed
    (u : Utterance) :
    D4ConfSwapClosesBadFirstPassageBoundary u ↔
      NoBadFirstPassageBackwardSeed :=
  (noUngroundedClaimSideFiringAtParentBarrier_iff_d4ConfSwapClosesBadFirstPassageBoundary u).symm.trans
    noUngroundedClaimSideFiringAtParentBarrier_iff_no_badBackwardSeed

/-- Bad-edge K4 closure is exactly positivity of every first-passage backward
carry quotient ordinal. -/
theorem k4NegClosesBadFirstPassageBoundary_iff_backwardCarryQuotients_positive
    (u : Utterance) :
    K4NegClosesBadFirstPassageBoundary u ↔
      ∀ p : List Branch, ParentBarrier p → ¬ TrivialParentBarrier p →
        ∀ n, FirstPassageBackwardSeed p n →
          Ord.Le (Ord.succ Ord.zero) (firstPassageBackwardCarryQuotient p n) :=
  (noUngroundedClaimSideFiringAtParentBarrier_iff_k4NegClosesBadFirstPassageBoundary u).symm.trans
    noUngroundedClaimSideFiringAtParentBarrier_iff_backwardCarryQuotients_positive

/-- Bad-edge D4 `negSwap` closure is exactly positivity of every
first-passage backward carry quotient ordinal. -/
theorem d4NegSwapClosesBadFirstPassageBoundary_iff_backwardCarryQuotients_positive
    (u : Utterance) :
    D4NegSwapClosesBadFirstPassageBoundary u ↔
      ∀ p : List Branch, ParentBarrier p → ¬ TrivialParentBarrier p →
        ∀ n, FirstPassageBackwardSeed p n →
          Ord.Le (Ord.succ Ord.zero) (firstPassageBackwardCarryQuotient p n) :=
  (noUngroundedClaimSideFiringAtParentBarrier_iff_d4NegSwapClosesBadFirstPassageBoundary u).symm.trans
    noUngroundedClaimSideFiringAtParentBarrier_iff_backwardCarryQuotients_positive

/-- Bad-edge D4 `confSwap` repair closure is exactly positivity of every
first-passage backward carry quotient ordinal. -/
theorem d4ConfSwapClosesBadFirstPassageBoundary_iff_backwardCarryQuotients_positive
    (u : Utterance) :
    D4ConfSwapClosesBadFirstPassageBoundary u ↔
      ∀ p : List Branch, ParentBarrier p → ¬ TrivialParentBarrier p →
        ∀ n, FirstPassageBackwardSeed p n →
          Ord.Le (Ord.succ Ord.zero) (firstPassageBackwardCarryQuotient p n) :=
  (noUngroundedClaimSideFiringAtParentBarrier_iff_d4ConfSwapClosesBadFirstPassageBoundary u).symm.trans
    noUngroundedClaimSideFiringAtParentBarrier_iff_backwardCarryQuotients_positive

/-- Bad-edge K4 closure is exactly the token-grounded realized seed-cell
invariant. -/
theorem k4NegClosesBadFirstPassageBoundary_iff_stableBackwardSeedCell
    (u : Utterance) :
    K4NegClosesBadFirstPassageBoundary u ↔
      TokenGroundedFirstPassageBackwardSeeds u :=
  (noUngroundedClaimSideFiringAtParentBarrier_iff_k4NegClosesBadFirstPassageBoundary u).symm.trans
    (noUngroundedClaimSideFiringAtParentBarrier_iff_stableBackwardSeedCell u)

/-- Bad-edge D4 `negSwap` closure is exactly the token-grounded realized
seed-cell invariant. -/
theorem d4NegSwapClosesBadFirstPassageBoundary_iff_stableBackwardSeedCell
    (u : Utterance) :
    D4NegSwapClosesBadFirstPassageBoundary u ↔
      TokenGroundedFirstPassageBackwardSeeds u :=
  (noUngroundedClaimSideFiringAtParentBarrier_iff_d4NegSwapClosesBadFirstPassageBoundary u).symm.trans
    (noUngroundedClaimSideFiringAtParentBarrier_iff_stableBackwardSeedCell u)

/-- Bad-edge D4 `confSwap` repair closure is exactly the token-grounded realized
seed-cell invariant. -/
theorem d4ConfSwapClosesBadFirstPassageBoundary_iff_stableBackwardSeedCell
    (u : Utterance) :
    D4ConfSwapClosesBadFirstPassageBoundary u ↔
      TokenGroundedFirstPassageBackwardSeeds u :=
  (noUngroundedClaimSideFiringAtParentBarrier_iff_d4ConfSwapClosesBadFirstPassageBoundary u).symm.trans
    (noUngroundedClaimSideFiringAtParentBarrier_iff_stableBackwardSeedCell u)

/-- Bad-edge K4 closure directly grounds every realized first-passage backward
seed cell at the fully tokened corner. -/
theorem stableBackwardSeedCell_of_k4NegClosesBadFirstPassageBoundary
    (u : Utterance)
    (hclosed : K4NegClosesBadFirstPassageBoundary u) :
    TokenGroundedFirstPassageBackwardSeeds u :=
  (k4NegClosesBadFirstPassageBoundary_iff_stableBackwardSeedCell u).mp hclosed

/-- Bad-edge D4 `negSwap` closure directly grounds every realized
first-passage backward seed cell at the fully tokened corner. -/
theorem stableBackwardSeedCell_of_d4NegSwapClosesBadFirstPassageBoundary
    (u : Utterance)
    (hclosed : D4NegSwapClosesBadFirstPassageBoundary u) :
    TokenGroundedFirstPassageBackwardSeeds u :=
  (d4NegSwapClosesBadFirstPassageBoundary_iff_stableBackwardSeedCell u).mp hclosed

/-- Bad-edge D4 `confSwap` repair closure directly grounds every realized
first-passage backward seed cell at the fully tokened corner. -/
theorem stableBackwardSeedCell_of_d4ConfSwapClosesBadFirstPassageBoundary
    (u : Utterance)
    (hclosed : D4ConfSwapClosesBadFirstPassageBoundary u) :
    TokenGroundedFirstPassageBackwardSeeds u :=
  (d4ConfSwapClosesBadFirstPassageBoundary_iff_stableBackwardSeedCell u).mp hclosed

/-- Absence of bad first-passage backward seeds directly grounds every realized
seed cell at the fully tokened corner. -/
theorem tokenGroundedFirstPassageBackwardSeeds_of_noBadFirstPassageBackwardSeed
    (u : Utterance)
    (hnoBad : NoBadFirstPassageBackwardSeed) :
    TokenGroundedFirstPassageBackwardSeeds u :=
  (noBadFirstPassageBackwardSeed_iff_tokenGroundedFirstPassageBackwardSeeds u).mp
    hnoBad

/-- Token-grounded realized seed cells rule out bad first-passage backward
seeds. -/
theorem noBadFirstPassageBackwardSeed_of_tokenGroundedFirstPassageBackwardSeeds
    (u : Utterance)
    (hgrounded : TokenGroundedFirstPassageBackwardSeeds u) :
    NoBadFirstPassageBackwardSeed :=
  (noBadFirstPassageBackwardSeed_iff_tokenGroundedFirstPassageBackwardSeeds u).mpr
    hgrounded

/-- A bad first-passage backward seed contradicts token grounding directly:
the realized seed cell would be both active and stable. -/
theorem badBackwardSeed_contradiction_of_tokenGroundedFirstPassageBackwardSeeds
    (u : Utterance)
    (hgrounded : TokenGroundedFirstPassageBackwardSeeds u)
    {p : List Branch} {n : Nat}
    (hp : ParentBarrier p) (hnt : ¬ TrivialParentBarrier p)
    (hseed : FirstPassageBackwardSeed p n)
    (hbad : BadFirstPassageBackwardSeed p n) :
    False := by
  have hstable := hgrounded p hp hnt n hseed
  have hactive := (firstPassageBackwardSeedCell_active_iff_bad u hp hseed).mpr hbad
  rw [hstable] at hactive
  cases hactive

/-- Bad-edge K4 closure rules out every bad first-passage backward seed. -/
theorem no_badBackwardSeed_of_k4NegClosesBadFirstPassageBoundary
    (u : Utterance)
    (hclosed : K4NegClosesBadFirstPassageBoundary u) :
    NoBadFirstPassageBackwardSeed :=
  (k4NegClosesBadFirstPassageBoundary_iff_no_badBackwardSeed u).mp hclosed

/-- Bad-edge D4 `negSwap` closure rules out every bad first-passage backward
seed. -/
theorem no_badBackwardSeed_of_d4NegSwapClosesBadFirstPassageBoundary
    (u : Utterance)
    (hclosed : D4NegSwapClosesBadFirstPassageBoundary u) :
    NoBadFirstPassageBackwardSeed :=
  (d4NegSwapClosesBadFirstPassageBoundary_iff_no_badBackwardSeed u).mp hclosed

/-- Bad-edge D4 `confSwap` repair closure rules out every bad first-passage
backward seed. -/
theorem no_badBackwardSeed_of_d4ConfSwapClosesBadFirstPassageBoundary
    (u : Utterance)
    (hclosed : D4ConfSwapClosesBadFirstPassageBoundary u) :
    NoBadFirstPassageBackwardSeed :=
  (d4ConfSwapClosesBadFirstPassageBoundary_iff_no_badBackwardSeed u).mp hclosed

/-- Under bad-edge K4 closure, a bad first-passage backward seed contradicts
the token-grounded realized seed-cell invariant. -/
theorem badBackwardSeed_contradiction_of_k4NegClosesBadFirstPassageBoundary
    (u : Utterance)
    (hclosed : K4NegClosesBadFirstPassageBoundary u)
    {p : List Branch} {n : Nat}
    (hp : ParentBarrier p) (hnt : ¬ TrivialParentBarrier p)
    (hseed : FirstPassageBackwardSeed p n)
    (hbad : BadFirstPassageBackwardSeed p n) :
    False := by
  exact
    badBackwardSeed_contradiction_of_tokenGroundedFirstPassageBackwardSeeds
      u (stableBackwardSeedCell_of_k4NegClosesBadFirstPassageBoundary u hclosed)
      hp hnt hseed hbad

/-- Under bad-edge D4 `negSwap` closure, a bad first-passage backward seed
contradicts the token-grounded realized seed-cell invariant. -/
theorem badBackwardSeed_contradiction_of_d4NegSwapClosesBadFirstPassageBoundary
    (u : Utterance)
    (hclosed : D4NegSwapClosesBadFirstPassageBoundary u)
    {p : List Branch} {n : Nat}
    (hp : ParentBarrier p) (hnt : ¬ TrivialParentBarrier p)
    (hseed : FirstPassageBackwardSeed p n)
    (hbad : BadFirstPassageBackwardSeed p n) :
    False := by
  exact
    badBackwardSeed_contradiction_of_tokenGroundedFirstPassageBackwardSeeds
      u (stableBackwardSeedCell_of_d4NegSwapClosesBadFirstPassageBoundary
        u hclosed) hp hnt hseed hbad

/-- Under bad-edge D4 `confSwap` repair closure, a bad first-passage backward
seed contradicts the token-grounded realized seed-cell invariant. -/
theorem badBackwardSeed_contradiction_of_d4ConfSwapClosesBadFirstPassageBoundary
    (u : Utterance)
    (hclosed : D4ConfSwapClosesBadFirstPassageBoundary u)
    {p : List Branch} {n : Nat}
    (hp : ParentBarrier p) (hnt : ¬ TrivialParentBarrier p)
    (hseed : FirstPassageBackwardSeed p n)
    (hbad : BadFirstPassageBackwardSeed p n) :
    False := by
  exact
    badBackwardSeed_contradiction_of_tokenGroundedFirstPassageBackwardSeeds
      u (stableBackwardSeedCell_of_d4ConfSwapClosesBadFirstPassageBoundary
        u hclosed) hp hnt hseed hbad

/-- The parent-barrier semigroup gap is exactly the inverse-hull cylinder-lift
face: the inverse residue places `D*r` in the same finite two-adic cylinder as
`C`, and the lift is by a positive whole binary modulus. -/
theorem parentBarrierGap_iff_parentBarrierTwoAdicCylinderLiftGap :
    ParentBarrierGap ↔ ParentBarrierTwoAdicCylinderLiftGap := by
  rw [parentBarrierGap_iff_parentBarrierTwoAdicCarryGap]
  exact parentBarrierTwoAdicCylinderLiftGap_iff_carryGap.symm

/-! ## The D4/K4 boundary closure bridge to the cylinder-lift face -/

/-- K4 closure of the realized first-passage boundary supplies the inverse-hull
cylinder-lift gap. -/
theorem parentBarrierTwoAdicCylinderLiftGap_of_k4NegClosedFirstPassageBoundary
    (u : Utterance)
    (hclosed : K4NegClosedFirstPassageBoundary u) :
    ParentBarrierTwoAdicCylinderLiftGap :=
  parentBarrierGap_iff_parentBarrierTwoAdicCylinderLiftGap.mp
    (parentBarrierGap_of_k4NegClosedFirstPassageBoundary u hclosed)

/-- D4 `negSwap` closure of the realized first-passage boundary supplies the
inverse-hull cylinder-lift gap. -/
theorem parentBarrierTwoAdicCylinderLiftGap_of_d4NegSwapClosedFirstPassageBoundary
    (u : Utterance)
    (hclosed : D4NegSwapClosedFirstPassageBoundary u) :
    ParentBarrierTwoAdicCylinderLiftGap :=
  parentBarrierGap_iff_parentBarrierTwoAdicCylinderLiftGap.mp
    (parentBarrierGap_of_d4NegSwapClosedFirstPassageBoundary u hclosed)

/-- Bad-edge K4 closure supplies the inverse-hull cylinder-lift gap. -/
theorem parentBarrierTwoAdicCylinderLiftGap_of_k4NegClosesBadFirstPassageBoundary
    (u : Utterance)
    (hclosed : K4NegClosesBadFirstPassageBoundary u) :
    ParentBarrierTwoAdicCylinderLiftGap :=
  parentBarrierGap_iff_parentBarrierTwoAdicCylinderLiftGap.mp
    ((parentBarrierGap_iff_k4NegClosesBadFirstPassageBoundary u).mpr hclosed)

/-- Bad-edge D4 `negSwap` bypass closure supplies the inverse-hull cylinder-lift
gap. -/
theorem parentBarrierTwoAdicCylinderLiftGap_of_d4NegSwapClosesBadFirstPassageBoundary
    (u : Utterance)
    (hclosed : D4NegSwapClosesBadFirstPassageBoundary u) :
    ParentBarrierTwoAdicCylinderLiftGap :=
  parentBarrierGap_iff_parentBarrierTwoAdicCylinderLiftGap.mp
    ((parentBarrierGap_iff_d4NegSwapClosesBadFirstPassageBoundary u).mpr hclosed)

/-- Bad-edge D4 `confSwap` repair closure supplies the inverse-hull
cylinder-lift gap. -/
theorem parentBarrierTwoAdicCylinderLiftGap_of_d4ConfSwapClosesBadFirstPassageBoundary
    (u : Utterance)
    (hclosed : D4ConfSwapClosesBadFirstPassageBoundary u) :
    ParentBarrierTwoAdicCylinderLiftGap :=
  parentBarrierGap_iff_parentBarrierTwoAdicCylinderLiftGap.mp
    ((parentBarrierGap_iff_d4ConfSwapClosesBadFirstPassageBoundary u).mpr hclosed)

/-- K4 boundary closure plus the cylinder-lift-to-contraction payload gives the
Collatz frontier-input package. -/
theorem frontierInputs_of_k4NegClosedFirstPassageBoundary_and_cylinderLiftContracts
    (u : Utterance)
    (hclosed : K4NegClosedFirstPassageBoundary u)
    (hcontracts : ParentBarrierTwoAdicCylinderLiftGap → EveryNonterminalContracts) :
    CollatzFrontierInputs := by
  let hlift : ParentBarrierTwoAdicCylinderLiftGap :=
    parentBarrierTwoAdicCylinderLiftGap_of_k4NegClosedFirstPassageBoundary u hclosed
  exact
    { residueGap := parentBarrierResidueGap_iff_parentBarrierTwoAdicCylinderLiftGap.mpr
        hlift
      noPositiveInfiniteBarrierStream :=
        everyNonterminalContracts_iff_noPositiveInfiniteBarrierStream.mp
          (hcontracts hlift) }

/-- D4 `negSwap` boundary closure plus the cylinder-lift-to-contraction payload
gives the Collatz frontier-input package. -/
theorem frontierInputs_of_d4NegSwapClosedFirstPassageBoundary_and_cylinderLiftContracts
    (u : Utterance)
    (hclosed : D4NegSwapClosedFirstPassageBoundary u)
    (hcontracts : ParentBarrierTwoAdicCylinderLiftGap → EveryNonterminalContracts) :
    CollatzFrontierInputs := by
  let hlift : ParentBarrierTwoAdicCylinderLiftGap :=
    parentBarrierTwoAdicCylinderLiftGap_of_d4NegSwapClosedFirstPassageBoundary u hclosed
  exact
    { residueGap := parentBarrierResidueGap_iff_parentBarrierTwoAdicCylinderLiftGap.mpr
        hlift
      noPositiveInfiniteBarrierStream :=
        everyNonterminalContracts_iff_noPositiveInfiniteBarrierStream.mp
          (hcontracts hlift) }

/-- Bad-edge K4 closure plus the cylinder-lift-to-contraction payload gives the
Collatz frontier-input package. -/
theorem frontierInputs_of_k4NegClosesBadFirstPassageBoundary_and_cylinderLiftContracts
    (u : Utterance)
    (hclosed : K4NegClosesBadFirstPassageBoundary u)
    (hcontracts : ParentBarrierTwoAdicCylinderLiftGap → EveryNonterminalContracts) :
    CollatzFrontierInputs := by
  let hlift : ParentBarrierTwoAdicCylinderLiftGap :=
    parentBarrierTwoAdicCylinderLiftGap_of_k4NegClosesBadFirstPassageBoundary u hclosed
  exact
    { residueGap := parentBarrierResidueGap_iff_parentBarrierTwoAdicCylinderLiftGap.mpr
        hlift
      noPositiveInfiniteBarrierStream :=
        everyNonterminalContracts_iff_noPositiveInfiniteBarrierStream.mp
          (hcontracts hlift) }

/-- Bad-edge D4 `negSwap` bypass closure plus the cylinder-lift-to-contraction
payload gives the Collatz frontier-input package. -/
theorem frontierInputs_of_d4NegSwapClosesBadFirstPassageBoundary_and_cylinderLiftContracts
    (u : Utterance)
    (hclosed : D4NegSwapClosesBadFirstPassageBoundary u)
    (hcontracts : ParentBarrierTwoAdicCylinderLiftGap → EveryNonterminalContracts) :
    CollatzFrontierInputs := by
  let hlift : ParentBarrierTwoAdicCylinderLiftGap :=
    parentBarrierTwoAdicCylinderLiftGap_of_d4NegSwapClosesBadFirstPassageBoundary u
      hclosed
  exact
    { residueGap := parentBarrierResidueGap_iff_parentBarrierTwoAdicCylinderLiftGap.mpr
        hlift
      noPositiveInfiniteBarrierStream :=
        everyNonterminalContracts_iff_noPositiveInfiniteBarrierStream.mp
          (hcontracts hlift) }

/-- Bad-edge D4 `confSwap` repair closure plus the cylinder-lift-to-contraction
payload gives the Collatz frontier-input package. -/
theorem frontierInputs_of_d4ConfSwapClosesBadFirstPassageBoundary_and_cylinderLiftContracts
    (u : Utterance)
    (hclosed : D4ConfSwapClosesBadFirstPassageBoundary u)
    (hcontracts : ParentBarrierTwoAdicCylinderLiftGap → EveryNonterminalContracts) :
    CollatzFrontierInputs := by
  let hlift : ParentBarrierTwoAdicCylinderLiftGap :=
    parentBarrierTwoAdicCylinderLiftGap_of_d4ConfSwapClosesBadFirstPassageBoundary
      u hclosed
  exact
    { residueGap := parentBarrierResidueGap_iff_parentBarrierTwoAdicCylinderLiftGap.mpr
        hlift
      noPositiveInfiniteBarrierStream :=
        everyNonterminalContracts_iff_noPositiveInfiniteBarrierStream.mp
          (hcontracts hlift) }

/-- K4 boundary closure plus the cylinder-lift-to-contraction payload implies
accelerated Collatz termination. -/
theorem collatz_from_k4NegClosedFirstPassageBoundary_and_cylinderLiftContracts
    (u : Utterance)
    (hclosed : K4NegClosedFirstPassageBoundary u)
    (hcontracts : ParentBarrierTwoAdicCylinderLiftGap → EveryNonterminalContracts) :
    ∀ n, 0 < n → ReachesTerminal n :=
  collatz_from_frontierInputs
    (frontierInputs_of_k4NegClosedFirstPassageBoundary_and_cylinderLiftContracts
      u hclosed hcontracts)

/-- D4 `negSwap` boundary closure plus the cylinder-lift-to-contraction payload
implies accelerated Collatz termination. -/
theorem collatz_from_d4NegSwapClosedFirstPassageBoundary_and_cylinderLiftContracts
    (u : Utterance)
    (hclosed : D4NegSwapClosedFirstPassageBoundary u)
    (hcontracts : ParentBarrierTwoAdicCylinderLiftGap → EveryNonterminalContracts) :
    ∀ n, 0 < n → ReachesTerminal n :=
  collatz_from_frontierInputs
    (frontierInputs_of_d4NegSwapClosedFirstPassageBoundary_and_cylinderLiftContracts
      u hclosed hcontracts)

/-- Bad-edge K4 closure plus the cylinder-lift-to-contraction payload implies
accelerated Collatz termination. -/
theorem collatz_from_k4NegClosesBadFirstPassageBoundary_and_cylinderLiftContracts
    (u : Utterance)
    (hclosed : K4NegClosesBadFirstPassageBoundary u)
    (hcontracts : ParentBarrierTwoAdicCylinderLiftGap → EveryNonterminalContracts) :
    ∀ n, 0 < n → ReachesTerminal n :=
  collatz_from_frontierInputs
    (frontierInputs_of_k4NegClosesBadFirstPassageBoundary_and_cylinderLiftContracts
      u hclosed hcontracts)

/-- Bad-edge D4 `negSwap` bypass closure plus the cylinder-lift-to-contraction
payload implies accelerated Collatz termination. -/
theorem collatz_from_d4NegSwapClosesBadFirstPassageBoundary_and_cylinderLiftContracts
    (u : Utterance)
    (hclosed : D4NegSwapClosesBadFirstPassageBoundary u)
    (hcontracts : ParentBarrierTwoAdicCylinderLiftGap → EveryNonterminalContracts) :
    ∀ n, 0 < n → ReachesTerminal n :=
  collatz_from_frontierInputs
    (frontierInputs_of_d4NegSwapClosesBadFirstPassageBoundary_and_cylinderLiftContracts
      u hclosed hcontracts)

/-- Bad-edge D4 `confSwap` repair closure plus the cylinder-lift-to-contraction
payload implies accelerated Collatz termination. -/
theorem collatz_from_d4ConfSwapClosesBadFirstPassageBoundary_and_cylinderLiftContracts
    (u : Utterance)
    (hclosed : D4ConfSwapClosesBadFirstPassageBoundary u)
    (hcontracts : ParentBarrierTwoAdicCylinderLiftGap → EveryNonterminalContracts) :
    ∀ n, 0 < n → ReachesTerminal n :=
  collatz_from_frontierInputs
    (frontierInputs_of_d4ConfSwapClosesBadFirstPassageBoundary_and_cylinderLiftContracts
      u hclosed hcontracts)

/-- Bad-edge D4 `confSwap` repair closure plus absence of positive infinite
barrier streams implies accelerated Collatz termination. -/
theorem collatz_from_d4ConfSwapClosesBadFirstPassageBoundary_and_noPositiveInfiniteBarrierStream
    (u : Utterance)
    (hclosed : D4ConfSwapClosesBadFirstPassageBoundary u)
    (hbar : NoPositiveInfiniteBarrierStream) :
    ∀ n, 0 < n → ReachesTerminal n :=
  collatz_from_parentBarrierResidueGap_and_noPositiveInfiniteBarrierStream
    ((d4ConfSwapClosesBadFirstPassageBoundary_iff_parentBarrierResidueGap u).mp
      hclosed)
    hbar

/-- Bad-edge D4 `confSwap` repair closure plus eventual contraction implies
accelerated Collatz termination. -/
theorem collatz_from_d4ConfSwapClosesBadFirstPassageBoundary_and_everyNonterminalContracts
    (u : Utterance)
    (hclosed : D4ConfSwapClosesBadFirstPassageBoundary u)
    (hcontracts : EveryNonterminalContracts) :
    ∀ n, 0 < n → ReachesTerminal n :=
  collatz_from_d4ConfSwapClosesBadFirstPassageBoundary_and_noPositiveInfiniteBarrierStream
    u hclosed
    (everyNonterminalContracts_iff_noPositiveInfiniteBarrierStream.mp hcontracts)

/-- Bad-edge D4 `confSwap` repair closure plus finite parent-barrier cylinder
extraction implies accelerated Collatz termination. -/
theorem collatz_from_d4ConfSwapClosesBadFirstPassageBoundary_and_parentBarrierCylinders
    (u : Utterance)
    (hclosed : D4ConfSwapClosesBadFirstPassageBoundary u)
    (hcyl : EveryNonterminalHasParentBarrierCylinder) :
    ∀ n, 0 < n → ReachesTerminal n :=
  collatz_from_d4ConfSwapClosesBadFirstPassageBoundary_and_noPositiveInfiniteBarrierStream
    u hclosed
    (everyNonterminalHasParentBarrierCylinder_iff_noPositiveInfiniteBarrierStream.mp
      hcyl)

/-- Bad-edge D4 `confSwap` repair closure plus absence of positive infinite
barrier streams gives the full Collatz κ package. -/
theorem kappaPackage_of_d4ConfSwapClosesBadFirstPassageBoundary_and_noPositiveInfiniteBarrierStream
    (u : Utterance)
    (hclosed : D4ConfSwapClosesBadFirstPassageBoundary u)
    (hbar : NoPositiveInfiniteBarrierStream) :
    ∀ m, 0 < m →
      ReachesTerminal m ∧ (∃ k, ClosureOrdinalStage m k) ∧
        ∃ k, TotalStoppingStage m k := by
  intro m hm
  have hres : ParentBarrierResidueGap :=
    (d4ConfSwapClosesBadFirstPassageBoundary_iff_parentBarrierResidueGap u).mp
      hclosed
  have hterm : ReachesTerminal m :=
    collatz_from_d4ConfSwapClosesBadFirstPassageBoundary_and_noPositiveInfiniteBarrierStream
      u hclosed hbar m hm
  have hclosure : ∃ k, ClosureOrdinalStage m k :=
    (closureOrdinalStage_exists_iff_reachesTerminal_of_residueGap_and_noPositiveInfiniteBarrierStream
      hres hbar m hm).mpr hterm
  have htotal : ∃ k, TotalStoppingStage m k :=
    (totalStoppingStage_exists_iff_reachesTerminal_of_residueGap_and_noPositiveInfiniteBarrierStream
      hres hbar m hm).mpr hterm
  exact ⟨hterm, hclosure, htotal⟩

/-- Bad-edge D4 `confSwap` repair closure plus eventual contraction gives the
full Collatz κ package. -/
theorem kappaPackage_of_d4ConfSwapClosesBadFirstPassageBoundary_and_everyNonterminalContracts
    (u : Utterance)
    (hclosed : D4ConfSwapClosesBadFirstPassageBoundary u)
    (hcontracts : EveryNonterminalContracts) :
    ∀ m, 0 < m →
      ReachesTerminal m ∧ (∃ k, ClosureOrdinalStage m k) ∧
        ∃ k, TotalStoppingStage m k := by
  have hbar : NoPositiveInfiniteBarrierStream :=
    everyNonterminalContracts_iff_noPositiveInfiniteBarrierStream.mp hcontracts
  exact
    kappaPackage_of_d4ConfSwapClosesBadFirstPassageBoundary_and_noPositiveInfiniteBarrierStream
      u hclosed hbar

/-- Bad-edge D4 `confSwap` repair closure plus finite parent-barrier cylinder
extraction gives the full Collatz κ package. -/
theorem kappaPackage_of_d4ConfSwapClosesBadFirstPassageBoundary_and_parentBarrierCylinders
    (u : Utterance)
    (hclosed : D4ConfSwapClosesBadFirstPassageBoundary u)
    (hcyl : EveryNonterminalHasParentBarrierCylinder) :
    ∀ m, 0 < m →
      ReachesTerminal m ∧ (∃ k, ClosureOrdinalStage m k) ∧
        ∃ k, TotalStoppingStage m k :=
  kappaPackage_of_d4ConfSwapClosesBadFirstPassageBoundary_and_noPositiveInfiniteBarrierStream
    u hclosed
    (everyNonterminalHasParentBarrierCylinder_iff_noPositiveInfiniteBarrierStream.mp
      hcyl)

/-- D4 `confSwap` closure alone solves Collatz exactly when it supplies the
no-positive-infinite-barrier-stream carrier. -/
theorem d4ConfSwapClosesBadFirstPassageBoundary_alone_solves_collatz_iff_implies_noPositiveInfiniteBarrierStream
    (u : Utterance) :
    (D4ConfSwapClosesBadFirstPassageBoundary u →
      ∀ n, 0 < n → ReachesTerminal n) ↔
      D4ConfSwapClosesBadFirstPassageBoundary u →
        NoPositiveInfiniteBarrierStream := by
  constructor
  · intro hsolve hclosed
    exact noPositiveInfiniteBarrierStream_of_acceleratedCollatz
      (hsolve hclosed)
  · intro hbar hclosed
    exact
      collatz_from_d4ConfSwapClosesBadFirstPassageBoundary_and_noPositiveInfiniteBarrierStream
        u hclosed (hbar hclosed)

/-- D4 `confSwap` closure alone solves Collatz exactly when it supplies eventual
nonterminal contraction. -/
theorem d4ConfSwapClosesBadFirstPassageBoundary_alone_solves_collatz_iff_implies_everyNonterminalContracts
    (u : Utterance) :
    (D4ConfSwapClosesBadFirstPassageBoundary u →
      ∀ n, 0 < n → ReachesTerminal n) ↔
      D4ConfSwapClosesBadFirstPassageBoundary u →
        EveryNonterminalContracts := by
  rw [
    d4ConfSwapClosesBadFirstPassageBoundary_alone_solves_collatz_iff_implies_noPositiveInfiniteBarrierStream
  ]
  constructor
  · intro hbar hclosed
    exact everyNonterminalContracts_iff_noPositiveInfiniteBarrierStream.mpr
      (hbar hclosed)
  · intro hcontracts hclosed
    exact everyNonterminalContracts_iff_noPositiveInfiniteBarrierStream.mp
      (hcontracts hclosed)

/-- D4 `confSwap` closure alone solves Collatz exactly when it supplies finite
parent-barrier cylinder extraction. -/
theorem d4ConfSwapClosesBadFirstPassageBoundary_alone_solves_collatz_iff_implies_parentBarrierCylinders
    (u : Utterance) :
    (D4ConfSwapClosesBadFirstPassageBoundary u →
      ∀ n, 0 < n → ReachesTerminal n) ↔
      D4ConfSwapClosesBadFirstPassageBoundary u →
        EveryNonterminalHasParentBarrierCylinder := by
  rw [
    d4ConfSwapClosesBadFirstPassageBoundary_alone_solves_collatz_iff_implies_noPositiveInfiniteBarrierStream
  ]
  constructor
  · intro hbar hclosed
    exact everyNonterminalHasParentBarrierCylinder_iff_noPositiveInfiniteBarrierStream.mpr
      (hbar hclosed)
  · intro hcyl hclosed
    exact everyNonterminalHasParentBarrierCylinder_iff_noPositiveInfiniteBarrierStream.mp
      (hcyl hclosed)

/-- D4 `confSwap` closure alone gives the full κ package exactly when it supplies
the no-positive-infinite-barrier-stream carrier. -/
theorem d4ConfSwapClosesBadFirstPassageBoundary_alone_solves_kappaPackage_iff_implies_noPositiveInfiniteBarrierStream
    (u : Utterance) :
    (D4ConfSwapClosesBadFirstPassageBoundary u →
      ∀ m, 0 < m →
        ReachesTerminal m ∧ (∃ k, ClosureOrdinalStage m k) ∧
          ∃ k, TotalStoppingStage m k) ↔
      D4ConfSwapClosesBadFirstPassageBoundary u →
        NoPositiveInfiniteBarrierStream := by
  constructor
  · intro hsolve hclosed
    exact noPositiveInfiniteBarrierStream_of_acceleratedCollatz
      (fun n hn => (hsolve hclosed n hn).1)
  · intro hbar hclosed
    exact
      kappaPackage_of_d4ConfSwapClosesBadFirstPassageBoundary_and_noPositiveInfiniteBarrierStream
        u hclosed (hbar hclosed)

/-- D4 `confSwap` closure alone gives the full κ package exactly when it supplies
eventual nonterminal contraction. -/
theorem d4ConfSwapClosesBadFirstPassageBoundary_alone_solves_kappaPackage_iff_implies_everyNonterminalContracts
    (u : Utterance) :
    (D4ConfSwapClosesBadFirstPassageBoundary u →
      ∀ m, 0 < m →
        ReachesTerminal m ∧ (∃ k, ClosureOrdinalStage m k) ∧
          ∃ k, TotalStoppingStage m k) ↔
      D4ConfSwapClosesBadFirstPassageBoundary u →
        EveryNonterminalContracts := by
  rw [
    d4ConfSwapClosesBadFirstPassageBoundary_alone_solves_kappaPackage_iff_implies_noPositiveInfiniteBarrierStream
  ]
  constructor
  · intro hbar hclosed
    exact everyNonterminalContracts_iff_noPositiveInfiniteBarrierStream.mpr
      (hbar hclosed)
  · intro hcontracts hclosed
    exact everyNonterminalContracts_iff_noPositiveInfiniteBarrierStream.mp
      (hcontracts hclosed)

/-- D4 `confSwap` closure alone gives the full κ package exactly when it supplies
finite parent-barrier cylinder extraction. -/
theorem d4ConfSwapClosesBadFirstPassageBoundary_alone_solves_kappaPackage_iff_implies_parentBarrierCylinders
    (u : Utterance) :
    (D4ConfSwapClosesBadFirstPassageBoundary u →
      ∀ m, 0 < m →
        ReachesTerminal m ∧ (∃ k, ClosureOrdinalStage m k) ∧
          ∃ k, TotalStoppingStage m k) ↔
      D4ConfSwapClosesBadFirstPassageBoundary u →
        EveryNonterminalHasParentBarrierCylinder := by
  rw [
    d4ConfSwapClosesBadFirstPassageBoundary_alone_solves_kappaPackage_iff_implies_noPositiveInfiniteBarrierStream
  ]
  constructor
  · intro hbar hclosed
    exact everyNonterminalHasParentBarrierCylinder_iff_noPositiveInfiniteBarrierStream.mpr
      (hbar hclosed)
  · intro hcyl hclosed
    exact everyNonterminalHasParentBarrierCylinder_iff_noPositiveInfiniteBarrierStream.mp
      (hcyl hclosed)

/-- Positivity of the explicit carry quotient is exactly descent of the least
first-passage cylinder representatives, read
through the quotient state checked by the finite audit. -/
theorem parentBarrierTwoAdicCarryQuotientPositive_iff_cylinderSeeds_descend :
    ParentBarrierTwoAdicCarryQuotientPositive ↔
      ∀ p : List Branch, ParentBarrier p → ¬ TrivialParentBarrier p →
        ∀ n, n < parentM p →
          parityWord n (p ++ [Branch.E]).length = p ++ [Branch.E] →
            orbit n (p ++ [Branch.E]).length < n := by
  rw [← parentBarrierResidueGap_iff_parentBarrierTwoAdicCarryQuotientPositive]
  exact parentBarrierResidueGap_iff_cylinderSeeds_descend

/-- The positive two-adic cylinder-lift face is exactly descent of the least
first-passage cylinder representatives, read
directly through the inverse-hull cylinder carrier. -/
theorem parentBarrierTwoAdicCylinderLiftGap_iff_cylinderSeeds_descend :
    ParentBarrierTwoAdicCylinderLiftGap ↔
      ∀ p : List Branch, ParentBarrier p → ¬ TrivialParentBarrier p →
        ∀ n, n < parentM p →
          parityWord n (p ++ [Branch.E]).length = p ++ [Branch.E] →
            orbit n (p ++ [Branch.E]).length < n := by
  rw [parentBarrierTwoAdicCylinderLiftGap_iff_carryQuotientPositive]
  exact parentBarrierTwoAdicCarryQuotientPositive_iff_cylinderSeeds_descend

/-! ## The termination reduction through the two-adic lock -/

/-- The two-adic carry gap and the crossing hypothesis give universal descent below
self. -/
theorem allFallBelow_of_twoAdicCarryGap_and_crossing
    (htwo : ParentBarrierTwoAdicCarryGap) (hcross : EveryNonterminalHasCrossing) :
    ∀ n, 2 < n → FallsBelowSelf n :=
  allFallBelow_of_residueGap_and_crossing
    (parentBarrierResidueGap_iff_parentBarrierTwoAdicCarryGap.mpr htwo) hcross

/-- The two-adic carry gap and absence of positive infinite barrier streams give
universal descent below self. -/
theorem allFallBelow_of_twoAdicCarryGap_and_noPositiveInfiniteBarrierStream
    (htwo : ParentBarrierTwoAdicCarryGap) (hbar : NoPositiveInfiniteBarrierStream) :
    ∀ n, 2 < n → FallsBelowSelf n :=
  allFallBelow_of_residueGap_and_noPositiveInfiniteBarrierStream
    (parentBarrierResidueGap_iff_parentBarrierTwoAdicCarryGap.mpr htwo) hbar

/-- The explicit two-adic carry gap and crossing hypothesis imply accelerated Collatz
termination. -/
theorem collatz_from_parentBarrierTwoAdicCarryGap_and_crossing
    (htwo : ParentBarrierTwoAdicCarryGap) (hcross : EveryNonterminalHasCrossing) :
    ∀ n, 0 < n → ReachesTerminal n :=
  collatz_from_parentBarrierResidueGap_and_crossing
    (parentBarrierResidueGap_iff_parentBarrierTwoAdicCarryGap.mpr htwo) hcross

/-- The explicit two-adic carry gap and absence of positive infinite barrier streams
imply accelerated Collatz termination. -/
theorem collatz_from_parentBarrierTwoAdicCarryGap_and_noPositiveInfiniteBarrierStream
    (htwo : ParentBarrierTwoAdicCarryGap) (hbar : NoPositiveInfiniteBarrierStream) :
    ∀ n, 0 < n → ReachesTerminal n :=
  collatz_from_parentBarrierResidueGap_and_noPositiveInfiniteBarrierStream
    (parentBarrierResidueGap_iff_parentBarrierTwoAdicCarryGap.mpr htwo) hbar

/-- Once the two-adic carry gap is supplied, accelerated Collatz is equivalent to the
absence of positive infinite barrier streams. -/
theorem acceleratedCollatz_iff_noPositiveInfiniteBarrierStream_of_twoAdicCarryGap
    (htwo : ParentBarrierTwoAdicCarryGap) :
    (∀ n, 0 < n → ReachesTerminal n) ↔ NoPositiveInfiniteBarrierStream := by
  constructor
  · exact noPositiveInfiniteBarrierStream_of_acceleratedCollatz
  · exact collatz_from_parentBarrierTwoAdicCarryGap_and_noPositiveInfiniteBarrierStream htwo

/-- A one-lock reduction to the explicit two-adic carry gap is equivalent to deriving
the no-positive-infinite-barrier-stream condition from that same two-adic carry gap. -/
theorem twoAdicCarryGap_alone_solves_collatz_iff_twoAdicCarryGap_implies_noStream :
    (ParentBarrierTwoAdicCarryGap → ∀ n, 0 < n → ReachesTerminal n) ↔
      (ParentBarrierTwoAdicCarryGap → NoPositiveInfiniteBarrierStream) := by
  constructor
  · intro hterm htwo
    exact noPositiveInfiniteBarrierStream_of_acceleratedCollatz (hterm htwo)
  · intro hbar htwo
    exact collatz_from_parentBarrierTwoAdicCarryGap_and_noPositiveInfiniteBarrierStream
      htwo (hbar htwo)

/-- Equivalently, a one-lock reduction to the explicit two-adic carry gap is a proof
that the same lock forces bare eventual coefficient contraction. -/
theorem twoAdicCarryGap_alone_solves_collatz_iff_twoAdicCarryGap_implies_everyNonterminalContracts :
    (ParentBarrierTwoAdicCarryGap → ∀ n, 0 < n → ReachesTerminal n) ↔
      (ParentBarrierTwoAdicCarryGap → EveryNonterminalContracts) := by
  constructor
  · intro hterm htwo
    exact everyNonterminalContracts_iff_noPositiveInfiniteBarrierStream.mpr
      (noPositiveInfiniteBarrierStream_of_acceleratedCollatz (hterm htwo))
  · intro hcontracts htwo
    exact collatz_from_parentBarrierTwoAdicCarryGap_and_crossing htwo
      (everyNonterminalContracts_implies_crossing (hcontracts htwo))

/-- If the explicit two-adic carry gap itself rules out positive infinite barrier
streams, then the two-frontier package collapses to that single two-adic
lock. Conversely, such a collapse gives the no-stream consequence. -/
theorem frontierInputs_iff_twoAdicCarryGap_of_twoAdicCarryGap_implies_noStream :
    (ParentBarrierTwoAdicCarryGap → NoPositiveInfiniteBarrierStream) ↔
      (CollatzFrontierInputs ↔ ParentBarrierTwoAdicCarryGap) := by
  constructor
  · intro hbar
    constructor
    · intro h
      exact parentBarrierResidueGap_iff_parentBarrierTwoAdicCarryGap.mp h.residueGap
    · intro htwo
      exact ⟨parentBarrierResidueGap_iff_parentBarrierTwoAdicCarryGap.mpr htwo,
        hbar htwo⟩
  · intro hcollapse htwo
    exact (hcollapse.mpr htwo).noPositiveInfiniteBarrierStream

/-- If the unique binary-residue carry gap itself rules out positive infinite
barrier streams, then the two-frontier package collapses to that single
unique-residue lock. Conversely, such a collapse gives the no-stream consequence. -/
theorem frontierInputs_iff_twoAdicUniqueResidueGap_of_twoAdicUniqueResidueGap_implies_noStream :
    (ParentBarrierTwoAdicUniqueResidueGap → NoPositiveInfiniteBarrierStream) ↔
      (CollatzFrontierInputs ↔ ParentBarrierTwoAdicUniqueResidueGap) := by
  constructor
  · intro hbar
    constructor
    · intro h
      exact parentBarrierResidueGap_iff_parentBarrierTwoAdicUniqueResidueGap.mp
        h.residueGap
    · intro hunique
      exact ⟨parentBarrierResidueGap_iff_parentBarrierTwoAdicUniqueResidueGap.mpr
        hunique, hbar hunique⟩
  · intro hcollapse hunique
    exact (hcollapse.mpr hunique).noPositiveInfiniteBarrierStream

/-- The frontier package is the explicit two-adic carry gap together with
the named one-lock implication. -/
theorem frontierInputs_iff_twoAdicCarryGap_and_oneLock :
    CollatzFrontierInputs ↔ ParentBarrierTwoAdicCarryGap ∧ ParentBarrierOneLockCollapse := by
  constructor
  · intro h
    exact ⟨parentBarrierGap_iff_parentBarrierTwoAdicCarryGap.mp
        (parentBarrierResidueGap_implies_parentBarrierGap h.residueGap),
      fun _ => h.noPositiveInfiniteBarrierStream⟩
  · rintro ⟨htwo, hlock⟩
    exact frontierInputs_iff_parentBarrierGap_and_oneLock.mpr
      ⟨parentBarrierGap_iff_parentBarrierTwoAdicCarryGap.mpr htwo, hlock⟩

/-- The frontier package is the unique binary inverse-residue gap together
with the named one-lock implication. -/
theorem frontierInputs_iff_twoAdicUniqueResidueGap_and_oneLock :
    CollatzFrontierInputs ↔ ParentBarrierTwoAdicUniqueResidueGap ∧ ParentBarrierOneLockCollapse := by
  constructor
  · intro h
    exact ⟨parentBarrierGap_iff_parentBarrierTwoAdicUniqueResidueGap.mp
        (parentBarrierResidueGap_implies_parentBarrierGap h.residueGap),
      fun _ => h.noPositiveInfiniteBarrierStream⟩
  · rintro ⟨hunique, hlock⟩
    exact frontierInputs_iff_parentBarrierGap_and_oneLock.mpr
      ⟨parentBarrierGap_iff_parentBarrierTwoAdicUniqueResidueGap.mpr hunique, hlock⟩

/-- The frontier package is explicit carry-quotient positivity together
with the named one-lock implication. -/
theorem frontierInputs_iff_twoAdicCarryQuotientPositive_and_oneLock :
    CollatzFrontierInputs ↔
      ParentBarrierTwoAdicCarryQuotientPositive ∧ ParentBarrierOneLockCollapse := by
  constructor
  · intro h
    exact ⟨parentBarrierGap_iff_parentBarrierTwoAdicCarryQuotientPositive.mp
        (parentBarrierResidueGap_implies_parentBarrierGap h.residueGap),
      fun _ => h.noPositiveInfiniteBarrierStream⟩
  · rintro ⟨hquot, hlock⟩
    exact frontierInputs_iff_parentBarrierGap_and_oneLock.mpr
      ⟨parentBarrierGap_iff_parentBarrierTwoAdicCarryQuotientPositive.mpr hquot, hlock⟩

/-- The frontier package is the inverse-hull cylinder-lift gap together
with the named one-lock implication. -/
theorem frontierInputs_iff_twoAdicCylinderLiftGap_and_oneLock :
    CollatzFrontierInputs ↔
      ParentBarrierTwoAdicCylinderLiftGap ∧ ParentBarrierOneLockCollapse := by
  constructor
  · intro h
    exact ⟨parentBarrierGap_iff_parentBarrierTwoAdicCylinderLiftGap.mp
        (parentBarrierResidueGap_implies_parentBarrierGap h.residueGap),
      fun _ => h.noPositiveInfiniteBarrierStream⟩
  · rintro ⟨hlift, hlock⟩
    exact frontierInputs_iff_parentBarrierGap_and_oneLock.mpr
      ⟨parentBarrierGap_iff_parentBarrierTwoAdicCylinderLiftGap.mpr hlift, hlock⟩

/-- The frontier package is the positive two-adic cylinder-lift gap
together with finite parent-barrier cylinder extraction for every nonterminal
seed. -/
theorem frontierInputs_iff_twoAdicCylinderLiftGap_and_parentBarrierCylinders :
    CollatzFrontierInputs ↔
      ParentBarrierTwoAdicCylinderLiftGap ∧ EveryNonterminalHasParentBarrierCylinder := by
  constructor
  · intro h
    exact ⟨parentBarrierGap_iff_parentBarrierTwoAdicCylinderLiftGap.mp
        (parentBarrierResidueGap_implies_parentBarrierGap h.residueGap),
      everyNonterminalHasParentBarrierCylinder_iff_noPositiveInfiniteBarrierStream.mpr
        h.noPositiveInfiniteBarrierStream⟩
  · rintro ⟨hlift, hcyl⟩
    exact
      { residueGap := parentBarrierResidueGap_iff_parentBarrierTwoAdicCylinderLiftGap.mpr
          hlift
        noPositiveInfiniteBarrierStream :=
          everyNonterminalHasParentBarrierCylinder_iff_noPositiveInfiniteBarrierStream.mp
            hcyl }

/-- K4 boundary closure plus finite parent-barrier cylinder extraction gives the
Collatz frontier-input package. -/
theorem frontierInputs_of_k4NegClosedFirstPassageBoundary_and_parentBarrierCylinders
    (u : Utterance)
    (hclosed : K4NegClosedFirstPassageBoundary u)
    (hcyl : EveryNonterminalHasParentBarrierCylinder) :
    CollatzFrontierInputs :=
  frontierInputs_iff_twoAdicCylinderLiftGap_and_parentBarrierCylinders.mpr
    ⟨parentBarrierTwoAdicCylinderLiftGap_of_k4NegClosedFirstPassageBoundary u hclosed,
      hcyl⟩

/-- D4 `negSwap` boundary closure plus finite parent-barrier cylinder extraction
gives the Collatz frontier-input package. -/
theorem frontierInputs_of_d4NegSwapClosedFirstPassageBoundary_and_parentBarrierCylinders
    (u : Utterance)
    (hclosed : D4NegSwapClosedFirstPassageBoundary u)
    (hcyl : EveryNonterminalHasParentBarrierCylinder) :
    CollatzFrontierInputs :=
  frontierInputs_iff_twoAdicCylinderLiftGap_and_parentBarrierCylinders.mpr
    ⟨parentBarrierTwoAdicCylinderLiftGap_of_d4NegSwapClosedFirstPassageBoundary u hclosed,
      hcyl⟩

/-- Bad-edge K4 closure plus finite parent-barrier cylinder extraction gives the
Collatz frontier-input package. -/
theorem frontierInputs_of_k4NegClosesBadFirstPassageBoundary_and_parentBarrierCylinders
    (u : Utterance)
    (hclosed : K4NegClosesBadFirstPassageBoundary u)
    (hcyl : EveryNonterminalHasParentBarrierCylinder) :
    CollatzFrontierInputs :=
  frontierInputs_iff_twoAdicCylinderLiftGap_and_parentBarrierCylinders.mpr
    ⟨parentBarrierTwoAdicCylinderLiftGap_of_k4NegClosesBadFirstPassageBoundary u hclosed,
      hcyl⟩

/-- Bad-edge D4 `negSwap` bypass closure plus finite parent-barrier cylinder
extraction gives the Collatz frontier-input package. -/
theorem frontierInputs_of_d4NegSwapClosesBadFirstPassageBoundary_and_parentBarrierCylinders
    (u : Utterance)
    (hclosed : D4NegSwapClosesBadFirstPassageBoundary u)
    (hcyl : EveryNonterminalHasParentBarrierCylinder) :
    CollatzFrontierInputs :=
  frontierInputs_iff_twoAdicCylinderLiftGap_and_parentBarrierCylinders.mpr
    ⟨parentBarrierTwoAdicCylinderLiftGap_of_d4NegSwapClosesBadFirstPassageBoundary u
        hclosed,
      hcyl⟩

/-- K4 boundary closure plus finite parent-barrier cylinder extraction excludes
cylinder-avoiding barrier streams. -/
theorem noCylinderAvoidingBarrierStream_of_k4NegClosedFirstPassageBoundary_and_parentBarrierCylinders
    (u : Utterance)
    (hclosed : K4NegClosedFirstPassageBoundary u)
    (hcyl : EveryNonterminalHasParentBarrierCylinder) :
    ¬ ∃ n, CylinderAvoidingBarrierStream n :=
  frontierInputs_excludes_cylinderAvoidingBarrierStream
    (frontierInputs_of_k4NegClosedFirstPassageBoundary_and_parentBarrierCylinders
      u hclosed hcyl)

/-- D4 `negSwap` boundary closure plus finite parent-barrier cylinder extraction
excludes cylinder-avoiding barrier streams. -/
theorem noCylinderAvoidingBarrierStream_of_d4NegSwapClosedFirstPassageBoundary_and_parentBarrierCylinders
    (u : Utterance)
    (hclosed : D4NegSwapClosedFirstPassageBoundary u)
    (hcyl : EveryNonterminalHasParentBarrierCylinder) :
    ¬ ∃ n, CylinderAvoidingBarrierStream n :=
  frontierInputs_excludes_cylinderAvoidingBarrierStream
    (frontierInputs_of_d4NegSwapClosedFirstPassageBoundary_and_parentBarrierCylinders
      u hclosed hcyl)

/-- Bad-edge K4 closure plus finite parent-barrier cylinder extraction excludes
cylinder-avoiding barrier streams. -/
theorem noCylinderAvoidingBarrierStream_of_k4NegClosesBadFirstPassageBoundary_and_parentBarrierCylinders
    (u : Utterance)
    (hclosed : K4NegClosesBadFirstPassageBoundary u)
    (hcyl : EveryNonterminalHasParentBarrierCylinder) :
    ¬ ∃ n, CylinderAvoidingBarrierStream n :=
  frontierInputs_excludes_cylinderAvoidingBarrierStream
    (frontierInputs_of_k4NegClosesBadFirstPassageBoundary_and_parentBarrierCylinders
      u hclosed hcyl)

/-- Bad-edge D4 `negSwap` bypass closure plus finite parent-barrier cylinder
extraction excludes cylinder-avoiding barrier streams. -/
theorem noCylinderAvoidingBarrierStream_of_d4NegSwapClosesBadFirstPassageBoundary_and_parentBarrierCylinders
    (u : Utterance)
    (hclosed : D4NegSwapClosesBadFirstPassageBoundary u)
    (hcyl : EveryNonterminalHasParentBarrierCylinder) :
    ¬ ∃ n, CylinderAvoidingBarrierStream n :=
  frontierInputs_excludes_cylinderAvoidingBarrierStream
    (frontierInputs_of_d4NegSwapClosesBadFirstPassageBoundary_and_parentBarrierCylinders
      u hclosed hcyl)

/-- K4 boundary closure plus finite parent-barrier cylinder extraction implies
accelerated Collatz termination. -/
theorem collatz_from_k4NegClosedFirstPassageBoundary_and_parentBarrierCylinders
    (u : Utterance)
    (hclosed : K4NegClosedFirstPassageBoundary u)
    (hcyl : EveryNonterminalHasParentBarrierCylinder) :
    ∀ n, 0 < n → ReachesTerminal n :=
  collatz_from_frontierInputs
    (frontierInputs_of_k4NegClosedFirstPassageBoundary_and_parentBarrierCylinders
      u hclosed hcyl)

/-- D4 `negSwap` boundary closure plus finite parent-barrier cylinder extraction
implies accelerated Collatz termination. -/
theorem collatz_from_d4NegSwapClosedFirstPassageBoundary_and_parentBarrierCylinders
    (u : Utterance)
    (hclosed : D4NegSwapClosedFirstPassageBoundary u)
    (hcyl : EveryNonterminalHasParentBarrierCylinder) :
    ∀ n, 0 < n → ReachesTerminal n :=
  collatz_from_frontierInputs
    (frontierInputs_of_d4NegSwapClosedFirstPassageBoundary_and_parentBarrierCylinders
      u hclosed hcyl)

/-- Bad-edge K4 closure plus finite parent-barrier cylinder extraction implies
accelerated Collatz termination. -/
theorem collatz_from_k4NegClosesBadFirstPassageBoundary_and_parentBarrierCylinders
    (u : Utterance)
    (hclosed : K4NegClosesBadFirstPassageBoundary u)
    (hcyl : EveryNonterminalHasParentBarrierCylinder) :
    ∀ n, 0 < n → ReachesTerminal n :=
  collatz_from_frontierInputs
    (frontierInputs_of_k4NegClosesBadFirstPassageBoundary_and_parentBarrierCylinders
      u hclosed hcyl)

/-- Bad-edge D4 `negSwap` bypass closure plus finite parent-barrier cylinder
extraction implies accelerated Collatz termination. -/
theorem collatz_from_d4NegSwapClosesBadFirstPassageBoundary_and_parentBarrierCylinders
    (u : Utterance)
    (hclosed : D4NegSwapClosesBadFirstPassageBoundary u)
    (hcyl : EveryNonterminalHasParentBarrierCylinder) :
    ∀ n, 0 < n → ReachesTerminal n :=
  collatz_from_frontierInputs
    (frontierInputs_of_d4NegSwapClosesBadFirstPassageBoundary_and_parentBarrierCylinders
      u hclosed hcyl)

/-- The named one-lock collapse proposition is exactly the statement that the
unique binary-residue carry gap rules out positive infinite barrier streams. -/
theorem parentBarrierOneLockCollapse_iff_twoAdicUniqueResidueGap_implies_noStream :
    ParentBarrierOneLockCollapse ↔
      (ParentBarrierTwoAdicUniqueResidueGap → NoPositiveInfiniteBarrierStream) := by
  unfold ParentBarrierOneLockCollapse
  constructor
  · intro hcollapse hunique
    exact hcollapse
      (parentBarrierGap_iff_parentBarrierTwoAdicUniqueResidueGap.mpr hunique)
  · intro hcollapse hgap
    exact hcollapse
      (parentBarrierGap_iff_parentBarrierTwoAdicUniqueResidueGap.mp hgap)

/-- The named one-lock collapse proposition is exactly the statement that
explicit carry-quotient positivity rules out positive infinite barrier streams. -/
theorem parentBarrierOneLockCollapse_iff_twoAdicCarryQuotientPositive_implies_noStream :
    ParentBarrierOneLockCollapse ↔
      (ParentBarrierTwoAdicCarryQuotientPositive → NoPositiveInfiniteBarrierStream) := by
  unfold ParentBarrierOneLockCollapse
  constructor
  · intro hcollapse hquot
    exact hcollapse
      (parentBarrierGap_iff_parentBarrierTwoAdicCarryQuotientPositive.mpr hquot)
  · intro hcollapse hgap
    exact hcollapse
      (parentBarrierGap_iff_parentBarrierTwoAdicCarryQuotientPositive.mp hgap)

/-- The named one-lock collapse proposition is exactly the statement that the
inverse-hull cylinder-lift gap rules out positive infinite barrier streams. -/
theorem parentBarrierOneLockCollapse_iff_twoAdicCylinderLiftGap_implies_noStream :
    ParentBarrierOneLockCollapse ↔
      (ParentBarrierTwoAdicCylinderLiftGap → NoPositiveInfiniteBarrierStream) := by
  unfold ParentBarrierOneLockCollapse
  constructor
  · intro hcollapse hlift
    exact hcollapse
      (parentBarrierGap_iff_parentBarrierTwoAdicCylinderLiftGap.mpr hlift)
  · intro hcollapse hgap
    exact hcollapse
      (parentBarrierGap_iff_parentBarrierTwoAdicCylinderLiftGap.mp hgap)

/-- The named one-lock collapse proposition is exactly the statement that the
inverse-hull cylinder-lift gap forces finite parent-barrier cylinder extraction
for every nonterminal seed. -/
theorem parentBarrierOneLockCollapse_iff_twoAdicCylinderLiftGap_implies_parentBarrierCylinders :
    ParentBarrierOneLockCollapse ↔
      (ParentBarrierTwoAdicCylinderLiftGap → EveryNonterminalHasParentBarrierCylinder) := by
  rw [parentBarrierOneLockCollapse_iff_twoAdicCylinderLiftGap_implies_noStream]
  constructor
  · intro hbar hlift
    exact everyNonterminalHasParentBarrierCylinder_iff_noPositiveInfiniteBarrierStream.mpr
      (hbar hlift)
  · intro hcyl hlift
    exact everyNonterminalHasParentBarrierCylinder_iff_noPositiveInfiniteBarrierStream.mp
      (hcyl hlift)

/-- The named one-lock collapse proposition is exactly the statement that
explicit carry-quotient positivity forces eventual coefficient contraction. -/
theorem parentBarrierOneLockCollapse_iff_twoAdicCarryQuotientPositive_implies_everyNonterminalContracts :
    ParentBarrierOneLockCollapse ↔
      (ParentBarrierTwoAdicCarryQuotientPositive → EveryNonterminalContracts) := by
  rw [parentBarrierOneLockCollapse_iff_twoAdicCarryQuotientPositive_implies_noStream]
  constructor
  · intro hbar hquot
    exact everyNonterminalContracts_iff_noPositiveInfiniteBarrierStream.mpr (hbar hquot)
  · intro hcontracts hquot
    exact everyNonterminalContracts_iff_noPositiveInfiniteBarrierStream.mp (hcontracts hquot)

/-- The named one-lock collapse proposition is exactly the statement that the
inverse-hull cylinder-lift gap forces eventual coefficient contraction. -/
theorem parentBarrierOneLockCollapse_iff_twoAdicCylinderLiftGap_implies_everyNonterminalContracts :
    ParentBarrierOneLockCollapse ↔
      (ParentBarrierTwoAdicCylinderLiftGap → EveryNonterminalContracts) := by
  rw [parentBarrierOneLockCollapse_iff_twoAdicCylinderLiftGap_implies_noStream]
  constructor
  · intro hbar hlift
    exact everyNonterminalContracts_iff_noPositiveInfiniteBarrierStream.mpr (hbar hlift)
  · intro hcontracts hlift
    exact everyNonterminalContracts_iff_noPositiveInfiniteBarrierStream.mp (hcontracts hlift)

/-- The named one-lock collapse proposition is exactly the statement that
explicit carry-quotient positivity forces every nonterminal seed to have a first
coefficient crossing. -/
theorem parentBarrierOneLockCollapse_iff_twoAdicCarryQuotientPositive_implies_everyNonterminalHasCrossing :
    ParentBarrierOneLockCollapse ↔
      (ParentBarrierTwoAdicCarryQuotientPositive → EveryNonterminalHasCrossing) := by
  rw [parentBarrierOneLockCollapse_iff_twoAdicCarryQuotientPositive_implies_noStream]
  constructor
  · intro hbar hquot
    exact everyNonterminalHasCrossing_iff_noPositiveInfiniteBarrierStream.mpr (hbar hquot)
  · intro hcross hquot
    exact everyNonterminalHasCrossing_iff_noPositiveInfiniteBarrierStream.mp (hcross hquot)

/-- The named one-lock collapse proposition is exactly the statement that the
inverse-hull cylinder-lift gap forces every nonterminal seed to have a first
coefficient crossing. -/
theorem parentBarrierOneLockCollapse_iff_twoAdicCylinderLiftGap_implies_everyNonterminalHasCrossing :
    ParentBarrierOneLockCollapse ↔
      (ParentBarrierTwoAdicCylinderLiftGap → EveryNonterminalHasCrossing) := by
  rw [parentBarrierOneLockCollapse_iff_twoAdicCylinderLiftGap_implies_noStream]
  constructor
  · intro hbar hlift
    exact everyNonterminalHasCrossing_iff_noPositiveInfiniteBarrierStream.mpr (hbar hlift)
  · intro hcross hlift
    exact everyNonterminalHasCrossing_iff_noPositiveInfiniteBarrierStream.mp (hcross hlift)

/-- The named one-lock collapse proposition is exactly the statement that the
unique binary-residue carry gap forces eventual coefficient contraction. -/
theorem parentBarrierOneLockCollapse_iff_twoAdicUniqueResidueGap_implies_everyNonterminalContracts :
    ParentBarrierOneLockCollapse ↔
      (ParentBarrierTwoAdicUniqueResidueGap → EveryNonterminalContracts) := by
  rw [parentBarrierOneLockCollapse_iff_twoAdicUniqueResidueGap_implies_noStream]
  constructor
  · intro hbar hunique
    exact everyNonterminalContracts_iff_noPositiveInfiniteBarrierStream.mpr
      (hbar hunique)
  · intro hcontracts hunique
    exact everyNonterminalContracts_iff_noPositiveInfiniteBarrierStream.mp
      (hcontracts hunique)

/-- The named one-lock collapse proposition is exactly the statement that the
unique binary-residue carry gap forces every nonterminal seed to have a first
coefficient crossing. -/
theorem parentBarrierOneLockCollapse_iff_twoAdicUniqueResidueGap_implies_everyNonterminalHasCrossing :
    ParentBarrierOneLockCollapse ↔
      (ParentBarrierTwoAdicUniqueResidueGap → EveryNonterminalHasCrossing) := by
  rw [parentBarrierOneLockCollapse_iff_twoAdicUniqueResidueGap_implies_noStream]
  constructor
  · intro hbar hunique
    exact everyNonterminalHasCrossing_iff_noPositiveInfiniteBarrierStream.mpr
      (hbar hunique)
  · intro hcross hunique
    exact everyNonterminalHasCrossing_iff_noPositiveInfiniteBarrierStream.mp
      (hcross hunique)

/-- The named one-lock collapse proposition is exactly the package-level collapse
to the explicit two-adic carry gap. -/
theorem parentBarrierOneLockCollapse_iff_frontierInputs_twoAdicCarryGap :
    ParentBarrierOneLockCollapse ↔
      (CollatzFrontierInputs ↔ ParentBarrierTwoAdicCarryGap) := by
  rw [parentBarrierOneLockCollapse_iff_frontierInputs_parentBarrierGap]
  constructor
  · intro hcollapse
    constructor
    · intro h
      exact parentBarrierGap_iff_parentBarrierTwoAdicCarryGap.mp (hcollapse.mp h)
    · intro htwo
      exact hcollapse.mpr (parentBarrierGap_iff_parentBarrierTwoAdicCarryGap.mpr htwo)
  · intro hcollapse
    constructor
    · intro h
      exact parentBarrierGap_iff_parentBarrierTwoAdicCarryGap.mpr
        (hcollapse.mp h)
    · intro hgap
      exact hcollapse.mpr
        (parentBarrierGap_iff_parentBarrierTwoAdicCarryGap.mp hgap)

/-- The named one-lock collapse proposition is exactly the statement that the
explicit two-adic carry gap alone implies accelerated Collatz termination. -/
theorem parentBarrierOneLockCollapse_iff_twoAdicCarryGap_alone_solves_collatz :
    ParentBarrierOneLockCollapse ↔
      (ParentBarrierTwoAdicCarryGap → ∀ n, 0 < n → ReachesTerminal n) := by
  rw [parentBarrierOneLockCollapse_iff_parentBarrierGap_alone_solves_collatz]
  constructor
  · intro hterm htwo
    exact hterm (parentBarrierGap_iff_parentBarrierTwoAdicCarryGap.mpr htwo)
  · intro hterm hgap
    exact hterm (parentBarrierGap_iff_parentBarrierTwoAdicCarryGap.mp hgap)

/-- The named one-lock collapse proposition is exactly the package-level collapse
to the unique binary-residue carry gap. -/
theorem parentBarrierOneLockCollapse_iff_frontierInputs_twoAdicUniqueResidueGap :
    ParentBarrierOneLockCollapse ↔
      (CollatzFrontierInputs ↔ ParentBarrierTwoAdicUniqueResidueGap) := by
  rw [parentBarrierOneLockCollapse_iff_frontierInputs_twoAdicCarryGap]
  constructor
  · intro hcollapse
    constructor
    · intro h
      exact parentBarrierTwoAdicCarryGap_iff_uniqueResidueGap.mp
        (hcollapse.mp h)
    · intro hunique
      exact hcollapse.mpr
        (parentBarrierTwoAdicCarryGap_iff_uniqueResidueGap.mpr hunique)
  · intro hcollapse
    constructor
    · intro h
      exact parentBarrierTwoAdicCarryGap_iff_uniqueResidueGap.mpr
        (hcollapse.mp h)
    · intro htwo
      exact hcollapse.mpr
        (parentBarrierTwoAdicCarryGap_iff_uniqueResidueGap.mp htwo)

/-- The named one-lock collapse proposition is exactly the statement that the
unique binary-residue carry gap alone implies accelerated Collatz termination. -/
theorem parentBarrierOneLockCollapse_iff_twoAdicUniqueResidueGap_alone_solves_collatz :
    ParentBarrierOneLockCollapse ↔
      (ParentBarrierTwoAdicUniqueResidueGap → ∀ n, 0 < n → ReachesTerminal n) := by
  rw [parentBarrierOneLockCollapse_iff_twoAdicCarryGap_alone_solves_collatz]
  constructor
  · intro hterm hunique
    exact hterm (parentBarrierTwoAdicCarryGap_iff_uniqueResidueGap.mpr hunique)
  · intro hterm htwo
    exact hterm (parentBarrierTwoAdicCarryGap_iff_uniqueResidueGap.mp htwo)

/-! ## The settlement bridge through the two-adic lock -/

/-- The two-adic carry gap and crossing hypothesis identify reached-set quiescence
with terminal reachability. -/
theorem reachedQuiesces_iff_reachesTerminal_of_twoAdicCarryGap_and_crossing
    (htwo : ParentBarrierTwoAdicCarryGap) (hcross : EveryNonterminalHasCrossing)
    (m : Nat) (hm : 0 < m) :
    (∃ k, ReachedQuiesces m k) ↔ ReachesTerminal m :=
  reachedQuiesces_iff_reachesTerminal_of_residueGap_and_crossing
    (parentBarrierResidueGap_iff_parentBarrierTwoAdicCarryGap.mpr htwo)
    hcross m hm

/-- The two-adic carry gap and absence of positive infinite barrier streams identify
reached-set quiescence with terminal reachability. -/
theorem reachedQuiesces_iff_reachesTerminal_of_twoAdicCarryGap_and_noPositiveInfiniteBarrierStream
    (htwo : ParentBarrierTwoAdicCarryGap) (hbar : NoPositiveInfiniteBarrierStream)
    (m : Nat) (hm : 0 < m) :
    (∃ k, ReachedQuiesces m k) ↔ ReachesTerminal m :=
  reachedQuiesces_iff_reachesTerminal_of_residueGap_and_noPositiveInfiniteBarrierStream
    (parentBarrierResidueGap_iff_parentBarrierTwoAdicCarryGap.mpr htwo)
    hbar m hm

/-- The two-adic carry gap and crossing hypothesis identify finite closure-ordinal
stage existence with terminal reachability. -/
theorem closureOrdinalStage_exists_iff_reachesTerminal_of_twoAdicCarryGap_and_crossing
    (htwo : ParentBarrierTwoAdicCarryGap) (hcross : EveryNonterminalHasCrossing)
    (m : Nat) (hm : 0 < m) :
    (∃ k, ClosureOrdinalStage m k) ↔ ReachesTerminal m :=
  closureOrdinalStage_exists_iff_reachesTerminal_of_residueGap_and_crossing
    (parentBarrierResidueGap_iff_parentBarrierTwoAdicCarryGap.mpr htwo)
    hcross m hm

/-- The two-adic carry gap and absence of positive infinite barrier streams identify
finite closure-ordinal stage existence with terminal reachability. -/
theorem closureOrdinalStage_exists_iff_reachesTerminal_of_twoAdicCarryGap_and_noPositiveInfiniteBarrierStream
    (htwo : ParentBarrierTwoAdicCarryGap) (hbar : NoPositiveInfiniteBarrierStream)
    (m : Nat) (hm : 0 < m) :
    (∃ k, ClosureOrdinalStage m k) ↔ ReachesTerminal m :=
  closureOrdinalStage_exists_iff_reachesTerminal_of_residueGap_and_noPositiveInfiniteBarrierStream
    (parentBarrierResidueGap_iff_parentBarrierTwoAdicCarryGap.mpr htwo)
    hbar m hm

/-- The two-adic carry gap and crossing hypothesis identify total-stopping-stage
existence with terminal reachability. -/
theorem totalStoppingStage_exists_iff_reachesTerminal_of_twoAdicCarryGap_and_crossing
    (htwo : ParentBarrierTwoAdicCarryGap) (hcross : EveryNonterminalHasCrossing)
    (m : Nat) (hm : 0 < m) :
    (∃ k, TotalStoppingStage m k) ↔ ReachesTerminal m :=
  totalStoppingStage_exists_iff_reachesTerminal_of_residueGap_and_crossing
    (parentBarrierResidueGap_iff_parentBarrierTwoAdicCarryGap.mpr htwo)
    hcross m hm

/-- The two-adic carry gap and absence of positive infinite barrier streams identify
total-stopping-stage existence with terminal reachability. -/
theorem totalStoppingStage_exists_iff_reachesTerminal_of_twoAdicCarryGap_and_noPositiveInfiniteBarrierStream
    (htwo : ParentBarrierTwoAdicCarryGap) (hbar : NoPositiveInfiniteBarrierStream)
    (m : Nat) (hm : 0 < m) :
    (∃ k, TotalStoppingStage m k) ↔ ReachesTerminal m :=
  totalStoppingStage_exists_iff_reachesTerminal_of_residueGap_and_noPositiveInfiniteBarrierStream
    (parentBarrierResidueGap_iff_parentBarrierTwoAdicCarryGap.mpr htwo)
    hbar m hm

/-- A one-frontier reduction to the explicit two-adic carry gap gives the full
termination/κ/total-stopping package exactly when the same two-adic carry gap
rules out positive infinite barrier streams. -/
theorem twoAdicCarryGap_alone_solves_kappa_package_iff_twoAdicCarryGap_implies_noStream :
    (ParentBarrierTwoAdicCarryGap → ∀ m, 0 < m →
        ReachesTerminal m ∧
          (∃ k, ClosureOrdinalStage m k) ∧
            (∃ k, TotalStoppingStage m k)) ↔
      (ParentBarrierTwoAdicCarryGap → NoPositiveInfiniteBarrierStream) := by
  constructor
  · intro hpack htwo
    exact noPositiveInfiniteBarrierStream_of_acceleratedCollatz
      (fun n hn => (hpack htwo n hn).1)
  · intro hbar htwo m hm
    have hterm : ReachesTerminal m :=
      collatz_from_parentBarrierTwoAdicCarryGap_and_noPositiveInfiniteBarrierStream
        htwo (hbar htwo) m hm
    have hclosure : ∃ k, ClosureOrdinalStage m k :=
      (closureOrdinalStage_exists_iff_reachesTerminal_of_twoAdicCarryGap_and_noPositiveInfiniteBarrierStream
        htwo (hbar htwo) m hm).mpr hterm
    have htotal : ∃ k, TotalStoppingStage m k :=
      (totalStoppingStage_exists_iff_reachesTerminal_of_twoAdicCarryGap_and_noPositiveInfiniteBarrierStream
        htwo (hbar htwo) m hm).mpr hterm
    exact ⟨hterm, hclosure, htotal⟩

/-- The named one-lock collapse proposition is exactly the statement that the
explicit two-adic carry gap alone gives terminal reachability plus the finite
closure-ordinal and total-stopping stages. -/
theorem parentBarrierOneLockCollapse_iff_twoAdicCarryGap_alone_solves_kappa_package :
    ParentBarrierOneLockCollapse ↔
      (ParentBarrierTwoAdicCarryGap → ∀ m, 0 < m →
        ReachesTerminal m ∧
          (∃ k, ClosureOrdinalStage m k) ∧
            (∃ k, TotalStoppingStage m k)) := by
  rw [parentBarrierOneLockCollapse_iff_parentBarrierGap_alone_solves_kappa_package]
  constructor
  · intro hpack htwo
    exact hpack (parentBarrierGap_iff_parentBarrierTwoAdicCarryGap.mpr htwo)
  · intro hpack hgap
    exact hpack (parentBarrierGap_iff_parentBarrierTwoAdicCarryGap.mp hgap)

/-- The named one-lock collapse proposition is exactly the statement that the
unique binary-residue carry gap alone gives terminal reachability plus the finite
closure-ordinal and total-stopping stages. -/
theorem parentBarrierOneLockCollapse_iff_twoAdicUniqueResidueGap_alone_solves_kappa_package :
    ParentBarrierOneLockCollapse ↔
      (ParentBarrierTwoAdicUniqueResidueGap → ∀ m, 0 < m →
        ReachesTerminal m ∧
          (∃ k, ClosureOrdinalStage m k) ∧
            (∃ k, TotalStoppingStage m k)) := by
  rw [parentBarrierOneLockCollapse_iff_twoAdicCarryGap_alone_solves_kappa_package]
  constructor
  · intro hpack hunique
    exact hpack (parentBarrierTwoAdicCarryGap_iff_uniqueResidueGap.mpr hunique)
  · intro hpack htwo
    exact hpack (parentBarrierTwoAdicCarryGap_iff_uniqueResidueGap.mp htwo)

/-- A one-frontier reduction to exact carry-quotient positivity gives the full
termination/κ/total-stopping package exactly when the same quotient positivity
rules out positive infinite barrier streams. -/
theorem twoAdicCarryQuotientPositive_alone_solves_kappa_package_iff_twoAdicCarryQuotientPositive_implies_noStream :
    (ParentBarrierTwoAdicCarryQuotientPositive → ∀ m, 0 < m →
        ReachesTerminal m ∧
          (∃ k, ClosureOrdinalStage m k) ∧
            (∃ k, TotalStoppingStage m k)) ↔
      (ParentBarrierTwoAdicCarryQuotientPositive → NoPositiveInfiniteBarrierStream) := by
  rw [← parentBarrierTwoAdicCarryGap_iff_carryQuotientPositive]
  exact twoAdicCarryGap_alone_solves_kappa_package_iff_twoAdicCarryGap_implies_noStream

/-- The named one-lock collapse proposition is exactly the statement that exact
carry-quotient positivity alone gives terminal reachability plus the finite
closure-ordinal and total-stopping stages. -/
theorem parentBarrierOneLockCollapse_iff_twoAdicCarryQuotientPositive_alone_solves_kappa_package :
    ParentBarrierOneLockCollapse ↔
      (ParentBarrierTwoAdicCarryQuotientPositive → ∀ m, 0 < m →
        ReachesTerminal m ∧
          (∃ k, ClosureOrdinalStage m k) ∧
            (∃ k, TotalStoppingStage m k)) := by
  rw [parentBarrierOneLockCollapse_iff_twoAdicCarryGap_alone_solves_kappa_package]
  constructor
  · intro hpack hquot
    exact hpack (parentBarrierTwoAdicCarryGap_iff_carryQuotientPositive.mpr hquot)
  · intro hpack htwo
    exact hpack (parentBarrierTwoAdicCarryGap_iff_carryQuotientPositive.mp htwo)

/-- A one-frontier reduction to the positive two-adic cylinder-lift gap gives the
full termination/κ/total-stopping package exactly when the same cylinder-lift
gap rules out positive infinite barrier streams. -/
theorem twoAdicCylinderLiftGap_alone_solves_kappa_package_iff_twoAdicCylinderLiftGap_implies_noStream :
    (ParentBarrierTwoAdicCylinderLiftGap → ∀ m, 0 < m →
        ReachesTerminal m ∧
          (∃ k, ClosureOrdinalStage m k) ∧
            (∃ k, TotalStoppingStage m k)) ↔
      (ParentBarrierTwoAdicCylinderLiftGap → NoPositiveInfiniteBarrierStream) := by
  rw [parentBarrierTwoAdicCylinderLiftGap_iff_carryQuotientPositive]
  exact twoAdicCarryQuotientPositive_alone_solves_kappa_package_iff_twoAdicCarryQuotientPositive_implies_noStream

/-- The named one-lock collapse proposition is exactly the statement that the
positive two-adic cylinder-lift gap alone gives terminal reachability plus the
finite closure-ordinal and total-stopping stages. -/
theorem parentBarrierOneLockCollapse_iff_twoAdicCylinderLiftGap_alone_solves_kappa_package :
    ParentBarrierOneLockCollapse ↔
      (ParentBarrierTwoAdicCylinderLiftGap → ∀ m, 0 < m →
        ReachesTerminal m ∧
          (∃ k, ClosureOrdinalStage m k) ∧
            (∃ k, TotalStoppingStage m k)) := by
  rw [parentBarrierOneLockCollapse_iff_twoAdicCarryQuotientPositive_alone_solves_kappa_package]
  constructor
  · intro hpack hlift
    exact hpack (parentBarrierTwoAdicCylinderLiftGap_iff_carryQuotientPositive.mp hlift)
  · intro hpack hquot
    exact hpack (parentBarrierTwoAdicCylinderLiftGap_iff_carryQuotientPositive.mpr hquot)

/-- Forward use of the named one-lock collapse at the explicit two-adic carry
face: from the carry gap and the one-lock collapse, terminal reachability,
finite closure-ordinal-stage existence, and finite total-stopping-stage
existence all follow. -/
theorem kappaPackage_of_twoAdicCarryGap_and_oneLock
    (htwo : ParentBarrierTwoAdicCarryGap) (hlock : ParentBarrierOneLockCollapse) :
    ∀ m, 0 < m →
      ReachesTerminal m ∧
        (∃ k, ClosureOrdinalStage m k) ∧
          (∃ k, TotalStoppingStage m k) :=
  (parentBarrierOneLockCollapse_iff_twoAdicCarryGap_alone_solves_kappa_package.mp
    hlock) htwo

/-- Forward use of the named one-lock collapse at the unique binary-residue face. -/
theorem kappaPackage_of_twoAdicUniqueResidueGap_and_oneLock
    (hunique : ParentBarrierTwoAdicUniqueResidueGap)
    (hlock : ParentBarrierOneLockCollapse) :
    ∀ m, 0 < m →
      ReachesTerminal m ∧
        (∃ k, ClosureOrdinalStage m k) ∧
          (∃ k, TotalStoppingStage m k) :=
  (parentBarrierOneLockCollapse_iff_twoAdicUniqueResidueGap_alone_solves_kappa_package.mp
    hlock) hunique

/-- Forward use of the named one-lock collapse at the exact carry-quotient face. -/
theorem kappaPackage_of_twoAdicCarryQuotientPositive_and_oneLock
    (hquot : ParentBarrierTwoAdicCarryQuotientPositive)
    (hlock : ParentBarrierOneLockCollapse) :
    ∀ m, 0 < m →
      ReachesTerminal m ∧
        (∃ k, ClosureOrdinalStage m k) ∧
          (∃ k, TotalStoppingStage m k) :=
  (parentBarrierOneLockCollapse_iff_twoAdicCarryQuotientPositive_alone_solves_kappa_package.mp
    hlock) hquot

/-- Forward use of the named one-lock collapse at the positive two-adic
cylinder-lift face. -/
theorem kappaPackage_of_twoAdicCylinderLiftGap_and_oneLock
    (hlift : ParentBarrierTwoAdicCylinderLiftGap)
    (hlock : ParentBarrierOneLockCollapse) :
    ∀ m, 0 < m →
      ReachesTerminal m ∧
        (∃ k, ClosureOrdinalStage m k) ∧
          (∃ k, TotalStoppingStage m k) :=
  (parentBarrierOneLockCollapse_iff_twoAdicCylinderLiftGap_alone_solves_kappa_package.mp
    hlock) hlift

/-- Positive two-adic cylinder lift plus finite parent-barrier cylinder extraction
gives the full terminal/closure-ordinal/total-stopping package. -/
theorem kappaPackage_of_twoAdicCylinderLiftGap_and_parentBarrierCylinders
    (hlift : ParentBarrierTwoAdicCylinderLiftGap)
    (hcyl : EveryNonterminalHasParentBarrierCylinder) :
    ∀ m, 0 < m →
      ReachesTerminal m ∧
        (∃ k, ClosureOrdinalStage m k) ∧
          (∃ k, TotalStoppingStage m k) := by
  let htwo : ParentBarrierTwoAdicCarryGap :=
    parentBarrierTwoAdicCylinderLiftGap_iff_carryGap.mp hlift
  let hbar : NoPositiveInfiniteBarrierStream :=
    everyNonterminalHasParentBarrierCylinder_iff_noPositiveInfiniteBarrierStream.mp
      hcyl
  intro m hm
  have hterm : ReachesTerminal m :=
    collatz_from_parentBarrierTwoAdicCarryGap_and_noPositiveInfiniteBarrierStream
      htwo hbar m hm
  have hclosure : ∃ k, ClosureOrdinalStage m k :=
    (closureOrdinalStage_exists_iff_reachesTerminal_of_twoAdicCarryGap_and_noPositiveInfiniteBarrierStream
      htwo hbar m hm).mpr hterm
  have htotal : ∃ k, TotalStoppingStage m k :=
    (totalStoppingStage_exists_iff_reachesTerminal_of_twoAdicCarryGap_and_noPositiveInfiniteBarrierStream
      htwo hbar m hm).mpr hterm
  exact ⟨hterm, hclosure, htotal⟩

/-- K4 boundary closure plus finite parent-barrier cylinder extraction gives the
full terminal/closure-ordinal/total-stopping package. -/
theorem kappaPackage_of_k4NegClosedFirstPassageBoundary_and_parentBarrierCylinders
    (u : Utterance)
    (hclosed : K4NegClosedFirstPassageBoundary u)
    (hcyl : EveryNonterminalHasParentBarrierCylinder) :
    ∀ m, 0 < m →
      ReachesTerminal m ∧
        (∃ k, ClosureOrdinalStage m k) ∧
          (∃ k, TotalStoppingStage m k) :=
  kappaPackage_of_twoAdicCylinderLiftGap_and_parentBarrierCylinders
    (parentBarrierTwoAdicCylinderLiftGap_of_k4NegClosedFirstPassageBoundary
      u hclosed)
    hcyl

/-- D4 `negSwap` boundary closure plus finite parent-barrier cylinder extraction
gives the full terminal/closure-ordinal/total-stopping package. -/
theorem kappaPackage_of_d4NegSwapClosedFirstPassageBoundary_and_parentBarrierCylinders
    (u : Utterance)
    (hclosed : D4NegSwapClosedFirstPassageBoundary u)
    (hcyl : EveryNonterminalHasParentBarrierCylinder) :
    ∀ m, 0 < m →
      ReachesTerminal m ∧
        (∃ k, ClosureOrdinalStage m k) ∧
          (∃ k, TotalStoppingStage m k) :=
  kappaPackage_of_twoAdicCylinderLiftGap_and_parentBarrierCylinders
    (parentBarrierTwoAdicCylinderLiftGap_of_d4NegSwapClosedFirstPassageBoundary
      u hclosed)
    hcyl

/-- Bad-edge K4 closure plus finite parent-barrier cylinder extraction gives the
full terminal/closure-ordinal/total-stopping package. -/
theorem kappaPackage_of_k4NegClosesBadFirstPassageBoundary_and_parentBarrierCylinders
    (u : Utterance)
    (hclosed : K4NegClosesBadFirstPassageBoundary u)
    (hcyl : EveryNonterminalHasParentBarrierCylinder) :
    ∀ m, 0 < m →
      ReachesTerminal m ∧
        (∃ k, ClosureOrdinalStage m k) ∧
          (∃ k, TotalStoppingStage m k) :=
  kappaPackage_of_twoAdicCylinderLiftGap_and_parentBarrierCylinders
    (parentBarrierTwoAdicCylinderLiftGap_of_k4NegClosesBadFirstPassageBoundary
      u hclosed)
    hcyl

/-- Bad-edge D4 `negSwap` closure plus finite parent-barrier cylinder extraction
gives the full terminal/closure-ordinal/total-stopping package. -/
theorem kappaPackage_of_d4NegSwapClosesBadFirstPassageBoundary_and_parentBarrierCylinders
    (u : Utterance)
    (hclosed : D4NegSwapClosesBadFirstPassageBoundary u)
    (hcyl : EveryNonterminalHasParentBarrierCylinder) :
    ∀ m, 0 < m →
      ReachesTerminal m ∧
        (∃ k, ClosureOrdinalStage m k) ∧
          (∃ k, TotalStoppingStage m k) :=
  kappaPackage_of_twoAdicCylinderLiftGap_and_parentBarrierCylinders
    (parentBarrierTwoAdicCylinderLiftGap_of_d4NegSwapClosesBadFirstPassageBoundary
      u hclosed)
    hcyl

/-- Frontier alias in explicit `2^k` carry form. -/
theorem parentBarrierTwoAdicCarryGap_holds : ParentBarrierTwoAdicCarryGap :=
  parentBarrierResidueCarryGap_iff_parentBarrierTwoAdicCarryGap.mp
    parentBarrierResidueCarryGap_holds

end AperiodicOrder.Tiling
end Obsmetrologia
