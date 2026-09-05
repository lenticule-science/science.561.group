import Obsmetrologia.Articulation.Articulating.Cell
import Obsmetrologia.Closure.OrdinalCore
import Obsmetrologia.Closure.Collatz.BackwardSeed

/-!
# Collatz backward-margin ordinals

The backward-seed layer identifies the inverse residue of a parent barrier with
the finite representative of the first-passage cylinder `p ++ [E]`. This module
reads the resulting margin as a finite ordinal. The Collatz trace equations are
still arithmetic over `Nat`, but the public carrier for the margin, descent
amount, and parent modulus is `Ord.ofNat`, the finite fragment of the project's
own ordinal type.

The positive carry in the residue formulation is therefore an ordinal statement:
the finite ordinal `parentM p` lies below the finite margin ordinal.

## Main definitions

* `firstPassageBackwardMargin` — the finite ordinal for `D*n - C`.
* `firstPassageBackwardDescentAmount` — the finite ordinal for
  `n - T^|pE|(n)`.
* `firstPassageBackwardModulus` — the finite ordinal for `parentM p`.
* `firstPassageBackwardCarryQuotient` — the finite ordinal for the whole-modulus
  carry quotient `(D*n - C) / parentM p`.
* `firstPassageBackwardSeedCell` — the token/claim articulation cell whose token
  side is the positive carry quotient and whose claim side is the seed claim.

## Main results

* `firstPassageBackwardMargin_eq_ofNat_modulus_mul_descentAmount` — the margin
  identity, exposed as finite-ordinal equality.
* `firstPassageBackwardSeed_descent_iff_margin_positive` — descent is positive
  margin ordinal.
* `firstPassageBackwardSeed_descent_iff_fullCarry` — descent is full-modulus
  ordinal carry.
* `firstPassageBackwardCarryQuotient_eq_descentAmount` — the carry quotient is
  the descent amount.
* `firstPassageBackwardSeedCell_active_iff_bad` — the bad seed is exactly the
  claim-without-token corner.
* `parentBarrierGap_iff_no_activeBackwardSeedCell` — the parent-barrier gap as
  absence of that corner at every nontrivial first-passage backward seed.
* `parentBarrierGap_iff_backwardMargins_fullCarry` — the parent-barrier gap as
  full ordinal carry for every nontrivial first-passage backward seed.

## Tags

collatz, backward seed, margin, ordinal, carry, first-passage descent
-/

namespace Obsmetrologia
namespace Closure
namespace Collatz

/-! ## Finite-fragment helpers -/

private theorem nat_pos_iff_le_mul_left {a b : Nat} (ha : 0 < a) :
    0 < b ↔ a ≤ a * b := by
  constructor
  · intro hb
    cases b with
    | zero => omega
    | succ b =>
        have hle : 1 ≤ b.succ := Nat.succ_pos b
        simpa [Nat.mul_one] using Nat.mul_le_mul_left a hle
  · intro h
    cases b with
    | zero =>
        rw [Nat.mul_zero] at h
        omega
    | succ _ => omega

private theorem nat_pos_iff_mul_pos_left {a b : Nat} (ha : 0 < a) :
    0 < b ↔ 0 < a * b := by
  constructor
  · intro hb
    exact Nat.mul_pos ha hb
  · intro h
    cases b with
    | zero =>
        rw [Nat.mul_zero] at h
        exact False.elim (Nat.not_lt_zero _ h)
    | succ _ => omega

private theorem nat_one_le_iff_one_le_mul_left {a b : Nat} (ha : 0 < a) :
    1 ≤ b ↔ 1 ≤ a * b := by
  constructor
  · intro hb
    have hbpos : 0 < b := by omega
    have hmul := (nat_pos_iff_mul_pos_left ha).mp hbpos
    omega
  · intro h
    have hmul : 0 < a * b := by omega
    have hbpos := (nat_pos_iff_mul_pos_left ha).mpr hmul
    omega

private theorem nat_one_le_iff_le_mul_left {a b : Nat} (ha : 0 < a) :
    1 ≤ b ↔ a ≤ a * b := by
  constructor
  · intro hb
    have hbpos : 0 < b := by omega
    exact (nat_pos_iff_le_mul_left ha).mp hbpos
  · intro h
    have hbpos := (nat_pos_iff_le_mul_left ha).mpr h
    omega

private def firstPassageBackwardMarginNat (p : List Branch) (n : Nat) : Nat :=
  parentD p * n - parentC p

private def firstPassageBackwardDescentAmountNat (p : List Branch) (n : Nat) : Nat :=
  n - orbit n (p ++ [Branch.E]).length

/-! ## The backward margin as a finite ordinal -/

/-- The first-passage backward margin `D*n - C` as a finite ordinal. -/
def firstPassageBackwardMargin (p : List Branch) (n : Nat) : Ord :=
  Ord.ofNat (firstPassageBackwardMarginNat p n)

/-- The descent amount of the first-passage backward seed as a finite ordinal. -/
def firstPassageBackwardDescentAmount (p : List Branch) (n : Nat) : Ord :=
  Ord.ofNat (firstPassageBackwardDescentAmountNat p n)

/-- The parent-barrier modulus as a finite ordinal. -/
def firstPassageBackwardModulus (p : List Branch) : Ord :=
  Ord.ofNat (parentM p)

/-- The whole-modulus carry quotient of the first-passage backward margin as a
finite ordinal. -/
def firstPassageBackwardCarryQuotient (p : List Branch) (n : Nat) : Ord :=
  Ord.ofNat ((parentD p * n - parentC p) / parentM p)

private theorem firstPassageBackwardMarginNat_eq_modulus_mul_descentAmountNat
    {p : List Branch} {n : Nat}
    (hp : ParentBarrier p)
    (hseed : FirstPassageBackwardSeed p n) :
    firstPassageBackwardMarginNat p n =
      parentM p * firstPassageBackwardDescentAmountNat p n := by
  have hm := firstPassage_margin hp hseed.2
  have hmul : parentM p * firstPassageBackwardDescentAmountNat p n =
      parentM p * n - parentM p * orbit n (p ++ [Branch.E]).length := by
    rw [firstPassageBackwardDescentAmountNat,
      Nat.mul_comm (parentM p) (n - orbit n (p ++ [Branch.E]).length),
      Nat.sub_mul, Nat.mul_comm n (parentM p),
      Nat.mul_comm (orbit n (p ++ [Branch.E]).length) (parentM p)]
  rw [hmul]
  unfold firstPassageBackwardMarginNat
  omega

/-- The backward margin is the finite ordinal of the parent modulus times the
finite descent amount. -/
theorem firstPassageBackwardMargin_eq_ofNat_modulus_mul_descentAmount
    {p : List Branch} {n : Nat}
    (hp : ParentBarrier p)
    (hseed : FirstPassageBackwardSeed p n) :
    firstPassageBackwardMargin p n =
      Ord.ofNat (parentM p * firstPassageBackwardDescentAmountNat p n) := by
  exact congrArg Ord.ofNat
    (firstPassageBackwardMarginNat_eq_modulus_mul_descentAmountNat hp hseed)

/-- A first-passage backward seed descends exactly when its descent-amount
ordinal is positive. -/
theorem firstPassageBackwardSeed_descent_iff_descentAmount_positive
    {p : List Branch} {n : Nat} :
    orbit n (p ++ [Branch.E]).length < n ↔
      Ord.Le (Ord.succ Ord.zero) (firstPassageBackwardDescentAmount p n) := by
  rw [firstPassageBackwardDescentAmount]
  change orbit n (p ++ [Branch.E]).length < n ↔
    Ord.Le (Ord.ofNat 1) (Ord.ofNat (firstPassageBackwardDescentAmountNat p n))
  rw [Ord.ofNat_le_ofNat_iff]
  unfold firstPassageBackwardDescentAmountNat
  constructor
  · intro h
    exact Nat.succ_le_iff.mpr (Nat.sub_pos_of_lt h)
  · intro h
    exact Nat.lt_of_sub_pos (Nat.succ_le_iff.mp h)

/-- A first-passage backward seed descends exactly when its margin ordinal is
positive. -/
theorem firstPassageBackwardSeed_descent_iff_margin_positive
    {p : List Branch} {n : Nat}
    (hp : ParentBarrier p)
    (hseed : FirstPassageBackwardSeed p n) :
    orbit n (p ++ [Branch.E]).length < n ↔
      Ord.Le (Ord.succ Ord.zero) (firstPassageBackwardMargin p n) := by
  rw [firstPassageBackwardSeed_descent_iff_descentAmount_positive,
    firstPassageBackwardMargin_eq_ofNat_modulus_mul_descentAmount hp hseed]
  change Ord.Le (Ord.ofNat 1) (firstPassageBackwardDescentAmount p n) ↔
    Ord.Le (Ord.ofNat 1)
      (Ord.ofNat (parentM p * firstPassageBackwardDescentAmountNat p n))
  rw [firstPassageBackwardDescentAmount]
  rw [Ord.ofNat_le_ofNat_iff]
  rw [Ord.ofNat_le_ofNat_iff]
  exact nat_one_le_iff_one_le_mul_left (parentM_pos p)

/-- A first-passage backward seed descends exactly when its margin ordinal carries
by at least the parent-modulus ordinal. -/
theorem firstPassageBackwardSeed_descent_iff_fullCarry
    {p : List Branch} {n : Nat}
    (hp : ParentBarrier p)
    (hseed : FirstPassageBackwardSeed p n) :
    orbit n (p ++ [Branch.E]).length < n ↔
      Ord.Le (firstPassageBackwardModulus p) (firstPassageBackwardMargin p n) := by
  rw [firstPassageBackwardSeed_descent_iff_descentAmount_positive,
    firstPassageBackwardModulus,
    firstPassageBackwardMargin_eq_ofNat_modulus_mul_descentAmount hp hseed]
  change Ord.Le (Ord.ofNat 1) (firstPassageBackwardDescentAmount p n) ↔
    Ord.Le (Ord.ofNat (parentM p))
      (Ord.ofNat (parentM p * firstPassageBackwardDescentAmountNat p n))
  rw [firstPassageBackwardDescentAmount]
  rw [Ord.ofNat_le_ofNat_iff]
  rw [Ord.ofNat_le_ofNat_iff]
  exact nat_one_le_iff_le_mul_left (parentM_pos p)

/-- The first-passage backward carry quotient is exactly the descent amount, as a
finite ordinal. -/
theorem firstPassageBackwardCarryQuotient_eq_descentAmount
    {p : List Branch} {n : Nat}
    (hp : ParentBarrier p)
    (hseed : FirstPassageBackwardSeed p n) :
    firstPassageBackwardCarryQuotient p n =
      firstPassageBackwardDescentAmount p n := by
  unfold firstPassageBackwardCarryQuotient firstPassageBackwardDescentAmount
  congr 1
  have hm := firstPassage_margin hp hseed.2
  have hmul : parentM p * (n - orbit n (p ++ [Branch.E]).length) =
      parentM p * n - parentM p * orbit n (p ++ [Branch.E]).length := by
    rw [Nat.mul_comm (parentM p) (n - orbit n (p ++ [Branch.E]).length),
      Nat.sub_mul, Nat.mul_comm n (parentM p),
      Nat.mul_comm (orbit n (p ++ [Branch.E]).length) (parentM p)]
  have hmargin : parentD p * n - parentC p =
      parentM p * (n - orbit n (p ++ [Branch.E]).length) := by
    rw [hmul]
    omega
  rw [hmargin]
  exact Nat.mul_div_right _ (parentM_pos p)

/-- A first-passage backward seed descends exactly when its whole-modulus carry
quotient ordinal is positive. -/
theorem firstPassageBackwardSeed_descent_iff_carryQuotient_positive
    {p : List Branch} {n : Nat}
    (hp : ParentBarrier p)
    (hseed : FirstPassageBackwardSeed p n) :
    orbit n (p ++ [Branch.E]).length < n ↔
      Ord.Le (Ord.succ Ord.zero) (firstPassageBackwardCarryQuotient p n) := by
  rw [firstPassageBackwardCarryQuotient_eq_descentAmount hp hseed]
  exact firstPassageBackwardSeed_descent_iff_descentAmount_positive

/-- For a first-passage backward seed, carrying a full parent modulus is the same
ordinal fact as having positive whole-modulus carry quotient. -/
theorem firstPassageBackwardSeed_fullCarry_iff_carryQuotient_positive
    {p : List Branch} {n : Nat}
    (hp : ParentBarrier p)
    (hseed : FirstPassageBackwardSeed p n) :
    Ord.Le (firstPassageBackwardModulus p) (firstPassageBackwardMargin p n) ↔
      Ord.Le (Ord.succ Ord.zero) (firstPassageBackwardCarryQuotient p n) := by
  rw [← firstPassageBackwardSeed_descent_iff_fullCarry hp hseed,
    firstPassageBackwardSeed_descent_iff_carryQuotient_positive hp hseed]

/-- A first-passage backward seed has positive carry quotient exactly when it is
not a bad backward seed. -/
theorem firstPassageBackwardSeed_carryQuotient_positive_iff_not_bad
    {p : List Branch} {n : Nat}
    (hp : ParentBarrier p)
    (hseed : FirstPassageBackwardSeed p n) :
    Ord.Le (Ord.succ Ord.zero) (firstPassageBackwardCarryQuotient p n) ↔
      ¬ BadFirstPassageBackwardSeed p n := by
  constructor
  · intro hpos hbad
    have hlt :=
      (firstPassageBackwardSeed_descent_iff_carryQuotient_positive hp hseed).mpr hpos
    exact Nat.not_lt_of_ge hbad.2 hlt
  · intro hnot
    have hlt : orbit n (p ++ [Branch.E]).length < n := by
      by_cases hlt : orbit n (p ++ [Branch.E]).length < n
      · exact hlt
      · exact False.elim (hnot ⟨hseed, Nat.le_of_not_gt hlt⟩)
    exact (firstPassageBackwardSeed_descent_iff_carryQuotient_positive hp hseed).mp hlt

/-- A first-passage backward seed carries a full modulus exactly when it is not a
bad backward seed. -/
theorem firstPassageBackwardSeed_fullCarry_iff_not_bad
    {p : List Branch} {n : Nat}
    (hp : ParentBarrier p)
    (hseed : FirstPassageBackwardSeed p n) :
    Ord.Le (firstPassageBackwardModulus p) (firstPassageBackwardMargin p n) ↔
      ¬ BadFirstPassageBackwardSeed p n := by
  constructor
  · intro hcarry hbad
    have hlt := (firstPassageBackwardSeed_descent_iff_fullCarry hp hseed).mpr hcarry
    exact Nat.not_lt_of_ge hbad.2 hlt
  · intro hnot
    have hlt : orbit n (p ++ [Branch.E]).length < n := by
      by_cases hlt : orbit n (p ++ [Branch.E]).length < n
      · exact hlt
      · exact False.elim (hnot ⟨hseed, Nat.le_of_not_gt hlt⟩)
    exact (firstPassageBackwardSeed_descent_iff_fullCarry hp hseed).mp hlt

/-! ## Token/claim boundary cell -/

/-- The articulation cell of a first-passage backward seed boundary. The seed
proof makes the claim side present; the token side records the positive
carry-quotient witness. -/
def firstPassageBackwardSeedCell (u : Utterance) (p : List Branch) (n : Nat)
    (_hseed : FirstPassageBackwardSeed p n) : Articulating.Cell where
  utterance := u
  tokenArticulated :=
    if 0 < (parentD p * n - parentC p) / parentM p then true else false
  claimArticulated := true

/-- For an actual first-passage backward seed, the bad seed is exactly the
claim-without-token corner. -/
theorem firstPassageBackwardSeedCell_active_iff_bad
    (u : Utterance) {p : List Branch} {n : Nat}
    (hp : ParentBarrier p)
    (hseed : FirstPassageBackwardSeed p n) :
    (firstPassageBackwardSeedCell u p n hseed).corner =
      Articulating.Corner.active ↔ BadFirstPassageBackwardSeed p n := by
  unfold firstPassageBackwardSeedCell Articulating.Cell.corner
  by_cases hposNat : 0 < (parentD p * n - parentC p) / parentM p
  · rw [if_pos hposNat]
    have hpos : Ord.Le (Ord.succ Ord.zero) (firstPassageBackwardCarryQuotient p n) := by
      unfold firstPassageBackwardCarryQuotient
      change Ord.Le (Ord.ofNat 1) (Ord.ofNat ((parentD p * n - parentC p) / parentM p))
      rw [Ord.ofNat_le_ofNat_iff]
      exact Nat.succ_le_iff.mpr hposNat
    have hnotBad :=
      (firstPassageBackwardSeed_carryQuotient_positive_iff_not_bad hp hseed).mp hpos
    constructor
    · intro hactive
      cases hactive
    · intro hbad
      exact False.elim (hnotBad hbad)
  · rw [if_neg hposNat]
    have hnotPos : ¬ Ord.Le (Ord.succ Ord.zero) (firstPassageBackwardCarryQuotient p n) := by
      intro hpos
      unfold firstPassageBackwardCarryQuotient at hpos
      change Ord.Le (Ord.ofNat 1)
        (Ord.ofNat ((parentD p * n - parentC p) / parentM p)) at hpos
      rw [Ord.ofNat_le_ofNat_iff] at hpos
      exact hposNat (Nat.succ_le_iff.mp hpos)
    have hbad : BadFirstPassageBackwardSeed p n := by
      by_cases hle : n ≤ orbit n (p ++ [Branch.E]).length
      · exact ⟨hseed, hle⟩
      · have hlt : orbit n (p ++ [Branch.E]).length < n := Nat.lt_of_not_ge hle
        have hpos :=
          (firstPassageBackwardSeed_descent_iff_carryQuotient_positive hp hseed).mp hlt
        exact False.elim (hnotPos hpos)
    constructor
    · intro _hactive
      exact hbad
    · intro _hbad
      rfl

/-- For an actual first-passage backward seed, the non-bad case is exactly the
corner where both the seed claim and its carry token are present. -/
theorem firstPassageBackwardSeedCell_stable_iff_not_bad
    (u : Utterance) {p : List Branch} {n : Nat}
    (hp : ParentBarrier p)
    (hseed : FirstPassageBackwardSeed p n) :
    (firstPassageBackwardSeedCell u p n hseed).corner =
      Articulating.Corner.stable ↔ ¬ BadFirstPassageBackwardSeed p n := by
  unfold firstPassageBackwardSeedCell Articulating.Cell.corner
  by_cases hposNat : 0 < (parentD p * n - parentC p) / parentM p
  · rw [if_pos hposNat]
    have hpos : Ord.Le (Ord.succ Ord.zero) (firstPassageBackwardCarryQuotient p n) := by
      unfold firstPassageBackwardCarryQuotient
      change Ord.Le (Ord.ofNat 1) (Ord.ofNat ((parentD p * n - parentC p) / parentM p))
      rw [Ord.ofNat_le_ofNat_iff]
      exact Nat.succ_le_iff.mpr hposNat
    have hnotBad :=
      (firstPassageBackwardSeed_carryQuotient_positive_iff_not_bad hp hseed).mp hpos
    constructor
    · intro _hstable
      exact hnotBad
    · intro _hnotBad
      rfl
  · rw [if_neg hposNat]
    constructor
    · intro hstable
      cases hstable
    · intro hnot
      have hpos' :=
        (firstPassageBackwardSeed_carryQuotient_positive_iff_not_bad hp hseed).mpr hnot
      unfold firstPassageBackwardCarryQuotient at hpos'
      change Ord.Le (Ord.ofNat 1)
        (Ord.ofNat ((parentD p * n - parentC p) / parentM p)) at hpos'
      rw [Ord.ofNat_le_ofNat_iff] at hpos'
      exact False.elim (hposNat (Nat.succ_le_iff.mp hpos'))

/-- A realized first-passage backward seed boundary is never the empty
absurd corner; the seed proof already supplies the claim side. -/
theorem firstPassageBackwardSeedCell_ne_absurd
    (u : Utterance) {p : List Branch} {n : Nat}
    (hseed : FirstPassageBackwardSeed p n) :
    (firstPassageBackwardSeedCell u p n hseed).corner ≠
      Articulating.Corner.absurd := by
  unfold firstPassageBackwardSeedCell Articulating.Cell.corner
  by_cases hposNat : 0 < (parentD p * n - parentC p) / parentM p
  · rw [if_pos hposNat]
    intro h
    cases h
  · rw [if_neg hposNat]
    intro h
    cases h

/-- A realized first-passage backward seed boundary is never the token-only
potential corner; it has the claim side by construction. -/
theorem firstPassageBackwardSeedCell_ne_potential
    (u : Utterance) {p : List Branch} {n : Nat}
    (hseed : FirstPassageBackwardSeed p n) :
    (firstPassageBackwardSeedCell u p n hseed).corner ≠
      Articulating.Corner.potential := by
  unfold firstPassageBackwardSeedCell Articulating.Cell.corner
  by_cases hposNat : 0 < (parentD p * n - parentC p) / parentM p
  · rw [if_pos hposNat]
    intro h
    cases h
  · rw [if_neg hposNat]
    intro h
    cases h

/-! ## Global boundary forms -/

/-- The parent-barrier gap is exactly positivity of every nontrivial
first-passage backward margin ordinal. -/
theorem parentBarrierGap_iff_backwardMargins_positive :
    ParentBarrierGap ↔
      ∀ p : List Branch, ParentBarrier p → ¬ TrivialParentBarrier p →
        ∀ n, FirstPassageBackwardSeed p n →
          Ord.Le (Ord.succ Ord.zero) (firstPassageBackwardMargin p n) := by
  rw [parentBarrierGap_iff_backwardSeeds_descend]
  constructor
  · intro hdesc p hp hnt n hseed
    exact (firstPassageBackwardSeed_descent_iff_margin_positive hp hseed).mp
      (hdesc p hp hnt n hseed)
  · intro hmargin p hp hnt n hseed
    exact (firstPassageBackwardSeed_descent_iff_margin_positive hp hseed).mpr
      (hmargin p hp hnt n hseed)

/-- The parent-barrier gap is exactly full-modulus carry of every nontrivial
first-passage backward margin ordinal. -/
theorem parentBarrierGap_iff_backwardMargins_fullCarry :
    ParentBarrierGap ↔
      ∀ p : List Branch, ParentBarrier p → ¬ TrivialParentBarrier p →
        ∀ n, FirstPassageBackwardSeed p n →
          Ord.Le (firstPassageBackwardModulus p) (firstPassageBackwardMargin p n) := by
  rw [parentBarrierGap_iff_backwardSeeds_descend]
  constructor
  · intro hdesc p hp hnt n hseed
    exact (firstPassageBackwardSeed_descent_iff_fullCarry hp hseed).mp
      (hdesc p hp hnt n hseed)
  · intro hcarry p hp hnt n hseed
    exact (firstPassageBackwardSeed_descent_iff_fullCarry hp hseed).mpr
      (hcarry p hp hnt n hseed)

/-- The parent-barrier gap is exactly positivity of every nontrivial
first-passage backward carry quotient ordinal. -/
theorem parentBarrierGap_iff_backwardCarryQuotients_positive :
    ParentBarrierGap ↔
      ∀ p : List Branch, ParentBarrier p → ¬ TrivialParentBarrier p →
        ∀ n, FirstPassageBackwardSeed p n →
          Ord.Le (Ord.succ Ord.zero) (firstPassageBackwardCarryQuotient p n) := by
  rw [parentBarrierGap_iff_backwardSeeds_descend]
  constructor
  · intro hdesc p hp hnt n hseed
    exact (firstPassageBackwardSeed_descent_iff_carryQuotient_positive hp hseed).mp
      (hdesc p hp hnt n hseed)
  · intro hquot p hp hnt n hseed
    exact (firstPassageBackwardSeed_descent_iff_carryQuotient_positive hp hseed).mpr
      (hquot p hp hnt n hseed)

/-- The parent-barrier gap is exactly absence of the claim-without-token corner
at every nontrivial first-passage backward seed boundary. -/
theorem parentBarrierGap_iff_no_activeBackwardSeedCell (u : Utterance) :
    ParentBarrierGap ↔
      ∀ p : List Branch, ParentBarrier p → ¬ TrivialParentBarrier p →
        ∀ n, (hseed : FirstPassageBackwardSeed p n) →
          (firstPassageBackwardSeedCell u p n hseed).corner ≠
            Articulating.Corner.active := by
  rw [parentBarrierGap_iff_no_badBackwardSeed]
  constructor
  · intro hno p hp hnt n hseed hactive
    have hbad := (firstPassageBackwardSeedCell_active_iff_bad u hp hseed).mp hactive
    exact hno p hp hnt ⟨n, hbad⟩
  · intro hnoactive p hp hnt
    rintro ⟨n, hbad⟩
    have hactive := (firstPassageBackwardSeedCell_active_iff_bad u hp hbad.1).mpr hbad
    exact hnoactive p hp hnt n hbad.1 hactive

/-- The parent-barrier gap is exactly the statement that every realized
first-passage backward seed cell is fully token-grounded. -/
theorem parentBarrierGap_iff_stableBackwardSeedCell (u : Utterance) :
    ParentBarrierGap ↔
      ∀ p : List Branch, ParentBarrier p → ¬ TrivialParentBarrier p →
        ∀ n, (hseed : FirstPassageBackwardSeed p n) →
          (firstPassageBackwardSeedCell u p n hseed).corner =
            Articulating.Corner.stable := by
  constructor
  · intro hgap p hp hnt n hseed
    have hnotBad : ¬ BadFirstPassageBackwardSeed p n := by
      intro hbad
      exact (parentBarrierGap_iff_no_badBackwardSeed.mp hgap) p hp hnt ⟨n, hbad⟩
    exact (firstPassageBackwardSeedCell_stable_iff_not_bad u hp hseed).mpr hnotBad
  · intro hstable
    exact (parentBarrierGap_iff_no_activeBackwardSeedCell u).mpr
      (fun p hp hnt n hseed hactive => by
        rw [hstable p hp hnt n hseed] at hactive
        cases hactive)

/-- Fully token-grounded first-passage backward seed cells are exactly the
positive carry-quotient ordinal face. -/
theorem stableBackwardSeedCell_iff_backwardCarryQuotients_positive
    (u : Utterance) :
    (∀ p : List Branch, ParentBarrier p → ¬ TrivialParentBarrier p →
      ∀ n, (hseed : FirstPassageBackwardSeed p n) →
        (firstPassageBackwardSeedCell u p n hseed).corner =
          Articulating.Corner.stable) ↔
      ∀ p : List Branch, ParentBarrier p → ¬ TrivialParentBarrier p →
        ∀ n, FirstPassageBackwardSeed p n →
          Ord.Le (Ord.succ Ord.zero) (firstPassageBackwardCarryQuotient p n) :=
  (parentBarrierGap_iff_stableBackwardSeedCell u).symm.trans
    parentBarrierGap_iff_backwardCarryQuotients_positive

end Collatz
end Closure
end Obsmetrologia
