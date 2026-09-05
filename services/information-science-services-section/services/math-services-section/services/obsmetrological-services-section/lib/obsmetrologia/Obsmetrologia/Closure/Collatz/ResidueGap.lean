import Obsmetrologia.Closure.Collatz.SemigroupGap

/-!
# Collatz parent-barrier gap, sharpened to a residue inequality

`SemigroupGap` reduced non-descent of the first-passage word to membership of the offset `C` in
the two-generator numerical semigroup `⟨D, M⟩` with `D = 2B - A`, `M = 2B`. For a parent barrier
`D` is odd and `M` is a power of two, so `gcd(D, M) = 1`: there is **no gcd obstruction**, and the
gap is purely a residue/size phenomenon (`_triage/collatz_semigroup_gap_refinement_note.md`).

This module proves that refinement. Writing `r = C · D⁻¹ mod M` (the least residue, which exists
since `D` is invertible mod `M`), membership becomes a single inequality:

  `C ∈ ⟨D, M⟩  ↔  D · r ≤ C`,

so non-membership is `D · r - C > 0`, and the conjectural gap for nontrivial parent barriers is
`D · r - C ≥ M` (margin `≥ 1`). The semigroup-nonmembership hole is thereby sharpened into a
concrete modular inequality — the form the Python search verified.

Congruence is the bare residue form `a % M = b % M` (the corpus `ModEq`); the `mod`↔`dvd` bridges
are built from core `Nat.div_add_mod`, since this core carries no `Nat.ModEq`.

## Main results

* `modEq_mul_cancel` — cancel a coprime factor in a congruence.
* `inTwoGenSemigroup_iff_residue` — membership ⟺ `D · r ≤ C` for the residue `r`.

## Tags

collatz, numerical semigroup, modular inverse, residue gap
-/

namespace Obsmetrologia
namespace Closure
namespace Collatz

/-- **Bézout's identity** over `Int`, by the extended Euclidean recursion: there are integer
coefficients with `a·x + b·y = gcd a b`. -/
theorem bezout (a b : Nat) :
    ∃ x y : Int, (a : Int) * x + (b : Int) * y = (Nat.gcd a b : Int) := by
  induction a, b using Nat.gcd.induction with
  | H0 n => exact ⟨0, 1, by simp⟩
  | H1 m n hm ih =>
    obtain ⟨x, y, h⟩ := ih
    refine ⟨y - ((n / m : Nat) : Int) * x, x, ?_⟩
    rw [Nat.gcd_rec, ← h]
    have hcast : ((n % m : Nat) : Int) = (n : Int) - (m : Int) * ((n / m : Nat) : Int) := by
      have h2 : (m : Int) * ((n / m : Nat) : Int) + ((n % m : Nat) : Int) = (n : Int) := by
        rw [← Int.natCast_mul, ← Int.natCast_add, Nat.div_add_mod]
      omega
    rw [hcast, Int.mul_sub, Int.sub_mul, Int.mul_assoc]; omega

/-- **Modular inverse exists** (over `Int`) for a coprime modulus: `M ∣ D·x - 1` for some `x`.
Immediate from Bézout. -/
theorem mod_inverse_exists {D M : Nat} (hcop : Nat.Coprime D M) :
    ∃ x : Int, (M : Int) ∣ ((D : Int) * x - 1) := by
  obtain ⟨x, y, hxy⟩ := bezout D M
  rw [hcop] at hxy
  refine ⟨x, -y, ?_⟩
  rw [Int.mul_neg]; omega

/-- Equal residues give a divisibility of the difference (the `mod → dvd` bridge). -/
theorem dvd_sub_of_mod_eq {M a b : Nat} (hmod : a % M = b % M) (hab : a ≤ b) :
    M ∣ (b - a) := by
  refine ⟨b / M - a / M, ?_⟩
  have hb := Nat.div_add_mod b M
  have ha := Nat.div_add_mod a M
  have hmul : M * (b / M - a / M) = M * (b / M) - M * (a / M) := by
    rw [Nat.mul_comm M (b / M - a / M), Nat.sub_mul, Nat.mul_comm (b / M) M,
      Nat.mul_comm (a / M) M]
  rw [hmul]; omega

/-- A divisibility of the difference gives equal residues (the `dvd → mod` bridge). -/
theorem mod_eq_of_dvd_sub {M a b : Nat} (hd : M ∣ (b - a)) (hab : a ≤ b) :
    a % M = b % M := by
  obtain ⟨c, hc⟩ := hd
  have hb : b = a + M * c := by omega
  rw [hb, Nat.add_mul_mod_self_left]

/-- The `Int → Nat` residue bridge: if `M` divides `↑a - ↑b` over `Int`, the naturals agree
mod `M`. -/
theorem mod_eq_of_intCast_dvd {M a b : Nat} (hd : (M : Int) ∣ ((a : Int) - (b : Int))) :
    a % M = b % M := by
  rcases Nat.le_total a b with hab | hba
  · have h0 := Int.dvd_neg.mpr hd
    have he : -((a : Int) - (b : Int)) = ((b - a : Nat) : Int) := by
      rw [Int.natCast_sub hab]; omega
    rw [he] at h0
    exact mod_eq_of_dvd_sub (Int.ofNat_dvd.mp h0) hab
  · have he : ((a : Int) - (b : Int)) = ((a - b : Nat) : Int) := (Int.natCast_sub hba).symm
    rw [he] at hd
    exact (mod_eq_of_dvd_sub (Int.ofNat_dvd.mp hd) hba).symm

/-- Cancel a coprime factor in a congruence: if `D` is coprime to `M`, then `D·a ≡ D·b (mod M)`
forces `a ≡ b (mod M)`. -/
theorem modEq_mul_cancel {D M : Nat} (hcop : Nat.Coprime D M) {a b : Nat}
    (h : (D * a) % M = (D * b) % M) : a % M = b % M := by
  have hms : ∀ x y : Nat, D * x - D * y = D * (x - y) := by
    intro x y
    rw [Nat.mul_comm D x, Nat.mul_comm D y, Nat.mul_comm D (x - y), Nat.sub_mul]
  rcases Nat.le_total a b with hab | hba
  · have hd : D * a ≤ D * b := Nat.mul_le_mul_left D hab
    have hdvd : M ∣ D * b - D * a := dvd_sub_of_mod_eq h hd
    rw [hms b a] at hdvd
    exact mod_eq_of_dvd_sub (hcop.symm.dvd_of_dvd_mul_left hdvd) hab
  · have hd : D * b ≤ D * a := Nat.mul_le_mul_left D hba
    have hdvd : M ∣ D * a - D * b := dvd_sub_of_mod_eq h.symm hd
    rw [hms a b] at hdvd
    exact (mod_eq_of_dvd_sub (hcop.symm.dvd_of_dvd_mul_left hdvd) hba).symm

/-- **The least residue exists.** For coprime `D, M` (`M > 0`) there is `r < M` with
`D · r ≡ C (mod M)` — i.e. `r = C · D⁻¹ mod M`, the modular inverse applied to `C`. -/
theorem exists_residue {C D M : Nat} (hcop : Nat.Coprime D M) (hM : 0 < M) :
    ∃ r, r < M ∧ (D * r) % M = C % M := by
  obtain ⟨x, k, hk⟩ := mod_inverse_exists hcop
  have hMne : (M : Int) ≠ 0 := by exact_mod_cast (show M ≠ 0 by omega)
  have hMpos : (0 : Int) < (M : Int) := by exact_mod_cast hM
  refine ⟨(((C : Int) * x) % (M : Int)).toNat, ?_, ?_⟩
  · have h2 : 0 ≤ ((C : Int) * x) % (M : Int) := Int.emod_nonneg _ hMne
    have h1 : ((C : Int) * x) % (M : Int) < (M : Int) := Int.emod_lt_of_pos _ hMpos
    omega
  · apply mod_eq_of_intCast_dvd
    have hrcast : ((((C : Int) * x) % (M : Int)).toNat : Int) = ((C : Int) * x) % (M : Int) :=
      Int.toNat_of_nonneg (Int.emod_nonneg _ hMne)
    have hemod : ((C : Int) * x) % (M : Int)
        = (C : Int) * x - (M : Int) * (((C : Int) * x) / (M : Int)) := Int.emod_def _ _
    refine ⟨(C : Int) * k - (D : Int) * (((C : Int) * x) / (M : Int)), ?_⟩
    have hDx : (D : Int) * x = 1 + (M : Int) * k := by omega
    have hDCx : (D : Int) * ((C : Int) * x) = (C : Int) * (1 + (M : Int) * k) := by
      rw [← Int.mul_assoc, Int.mul_comm (D : Int) (C : Int), Int.mul_assoc, hDx]
    have e1 : (C : Int) * ((M : Int) * k) = (M : Int) * ((C : Int) * k) := by
      rw [← Int.mul_assoc, Int.mul_comm (C : Int) (M : Int), Int.mul_assoc]
    have e2 : (D : Int) * ((M : Int) * (((C : Int) * x) / (M : Int)))
        = (M : Int) * ((D : Int) * (((C : Int) * x) / (M : Int))) := by
      rw [← Int.mul_assoc, Int.mul_comm (D : Int) (M : Int), Int.mul_assoc]
    rw [Int.natCast_mul, hrcast, hemod, Int.mul_sub, hDCx, Int.mul_add, Int.mul_one, Int.mul_sub]
    omega

/-- **The residue-gap refinement.** For coprime `D, M` and the least residue `r < M` with
`D · r ≡ C (mod M)`, the offset `C` lies in the semigroup `⟨D, M⟩` exactly when `D · r ≤ C`.
Hence non-membership is the modular inequality `C < D · r` (the gap `D · r - C`). -/
theorem inTwoGenSemigroup_iff_residue {C D M r : Nat}
    (hcop : Nat.Coprime D M) (hrM : r < M) (hr : (D * r) % M = C % M) :
    InTwoGenSemigroup C D M ↔ D * r ≤ C := by
  constructor
  · rintro ⟨m, n, hC⟩
    have hDm : (D * m) % M = C % M := by rw [hC, Nat.add_mul_mod_self_left]
    have hcancel : r % M = m % M := modEq_mul_cancel hcop (hr.trans hDm.symm)
    have hrmod : r = m % M := by rwa [Nat.mod_eq_of_lt hrM] at hcancel
    have hrle : r ≤ m := by rw [hrmod]; exact Nat.mod_le m M
    calc D * r ≤ D * m := Nat.mul_le_mul_left D hrle
      _ ≤ D * m + M * n := Nat.le_add_right _ _
      _ = C := hC.symm
  · intro hle
    obtain ⟨q, hq⟩ := dvd_sub_of_mod_eq hr hle
    exact ⟨r, q, by omega⟩

/-- **Residue characterization of the gap (fully constructed).** For coprime `D, M` (`M > 0`)
there is a least residue `r < M` for which membership in `⟨D, M⟩` is the inequality `D · r ≤ C`.
Combines `exists_residue` (the modular inverse, built from Bézout) with the residue iff; no residue
is assumed. The conjectural gap for nontrivial parent barriers is then `C < D · r`. -/
theorem residue_characterization {C D M : Nat} (hcop : Nat.Coprime D M) (hM : 0 < M) :
    ∃ r, r < M ∧ (InTwoGenSemigroup C D M ↔ D * r ≤ C) := by
  obtain ⟨r, hrM, hr⟩ := exists_residue hcop hM
  exact ⟨r, hrM, inTwoGenSemigroup_iff_residue hcop hrM hr⟩

/-! ## Connecting the gap to the residue inequality for parent barriers -/

/-- Non-membership from the residue inequality: if the residue `r` of `C` satisfies `C < D·r`,
then `C ∉ ⟨D, M⟩`. -/
theorem gap_of_residue {C D M : Nat} (hcop : Nat.Coprime D M) (hM : 0 < M)
    (h : ∀ r, r < M → (D * r) % M = C % M → C < D * r) :
    ¬ InTwoGenSemigroup C D M := by
  obtain ⟨r, hrM, hr⟩ := exists_residue hcop hM
  rw [inTwoGenSemigroup_iff_residue hcop hrM hr]
  have := h r hrM hr
  omega

/-- Powers of three are odd. -/
theorem three_pow_mod_two (n : Nat) : 3 ^ n % 2 = 1 := by
  induction n with
  | zero => decide
  | succ k ih => rw [Nat.pow_succ]; omega

/-- The parent expansion coefficient `A = 3^{oddCount}` is odd. -/
theorem parentA_odd (p : List Branch) : parentA p % 2 = 1 := by
  unfold parentA; rw [trace_A_eq_three_pow_oddCount]; exact three_pow_mod_two _

/-- At a parent barrier the gap generator `D = 2B - A` is odd (even minus odd). -/
theorem parentD_odd {p : List Branch} (hp : ParentBarrier p) : parentD p % 2 = 1 := by
  have hA : parentA p % 2 = 1 := parentA_odd p
  have hAB : parentA p < 2 * parentB p := hp.2.1
  unfold parentD; omega

/-- The modulus `M = 2B = 2^{|p|+1}` is a power of two. -/
theorem parentM_eq_pow (p : List Branch) : parentM p = 2 ^ (p.length + 1) := by
  unfold parentM parentB; rw [trace_B_eq_two_pow_length, Nat.pow_succ]; omega

/-- The modulus is positive. -/
theorem parentM_pos (p : List Branch) : 0 < parentM p := by
  have h := trace_B_pos p; unfold parentM parentB; omega

/-- An odd number is coprime to `2`. -/
theorem coprime_of_odd_two {D : Nat} (h : D % 2 = 1) : Nat.Coprime D 2 := by
  have hgD : Nat.gcd D 2 ∣ D := Nat.gcd_dvd_left D 2
  have hg : Nat.gcd D 2 ∣ 2 := Nat.gcd_dvd_right D 2
  have hle : Nat.gcd D 2 ≤ 2 := Nat.le_of_dvd (by decide) hg
  have hpos : 0 < Nat.gcd D 2 := Nat.gcd_pos_iff.mpr (Or.inr (by decide))
  show Nat.gcd D 2 = 1
  rcases Nat.lt_or_ge (Nat.gcd D 2) 2 with hlt | hge
  · omega
  · exfalso
    have heq : Nat.gcd D 2 = 2 := by omega
    rw [heq] at hgD
    obtain ⟨c, hc⟩ := hgD
    omega

/-- An odd number is coprime to every power of two. -/
theorem coprime_odd_two_pow {D : Nat} (h : D % 2 = 1) (k : Nat) : Nat.Coprime D (2 ^ k) :=
  (coprime_of_odd_two h).pow_right k

/-- For a parent barrier, `D` and `M` are coprime: `D` odd, `M` a power of two. -/
theorem parentD_coprime_parentM {p : List Branch} (hp : ParentBarrier p) :
    Nat.Coprime (parentD p) (parentM p) := by
  rw [parentM_eq_pow]
  exact coprime_odd_two_pow (parentD_odd hp) (p.length + 1)

/-- The **sharp residue form** of the parent-barrier gap: for every nontrivial parent barrier,
the residue `r` of `C = parentC p` satisfies `C < D·r`. -/
def ParentBarrierResidueGap : Prop :=
  ∀ p : List Branch, ParentBarrier p → ¬ TrivialParentBarrier p →
    ∀ r, r < parentM p → (parentD p * r) % parentM p = parentC p % parentM p →
      parentC p < parentD p * r

/-- Under a residue congruence modulo a positive modulus, strict residue descent is
equivalent to carrying by at least one full modulus. -/
theorem residue_lt_iff_modulus_le_sub {C D M r : Nat}
    (hM : 0 < M) (hmod : (D * r) % M = C % M) :
    C < D * r ↔ M ≤ D * r - C := by
  constructor
  · intro hlt
    have hle : C ≤ D * r := Nat.le_of_lt hlt
    have hdvd : M ∣ D * r - C := dvd_sub_of_mod_eq hmod.symm hle
    obtain ⟨q, hq⟩ := hdvd
    cases q with
    | zero =>
      have hdiff : 0 < D * r - C := Nat.sub_pos_of_lt hlt
      rw [hq, Nat.mul_zero] at hdiff
      exact False.elim (Nat.not_lt_zero _ hdiff)
    | succ q =>
      rw [hq]
      have hqpos : 1 ≤ q.succ := Nat.succ_pos q
      have hmul := Nat.mul_le_mul_left M hqpos
      simpa [Nat.mul_one] using hmul
  · intro hcarry
    have hdiff : 0 < D * r - C := Nat.lt_of_lt_of_le hM hcarry
    by_cases hlt : C < D * r
    · exact hlt
    · have hge : D * r ≤ C := Nat.le_of_not_gt hlt
      have hsub : D * r - C = 0 := Nat.sub_eq_zero_of_le hge
      rw [hsub] at hdiff
      exact False.elim (Nat.not_lt_zero _ hdiff)

/-- The **carry form** of the parent-barrier residue gap: the congruent residue
`D·r` does not merely exceed `C`; it exceeds `C` by at least one full modulus
`M = 2^{|p|+1}`. This is the high-2-adic-digit face of the same lock. -/
def ParentBarrierResidueCarryGap : Prop :=
  ∀ p : List Branch, ParentBarrier p → ¬ TrivialParentBarrier p →
    ∀ r, r < parentM p → (parentD p * r) % parentM p = parentC p % parentM p →
      parentM p ≤ parentD p * r - parentC p

/-- The sharp residue inequality is equivalent to its carry form. -/
theorem parentBarrierResidueGap_iff_parentBarrierResidueCarryGap :
    ParentBarrierResidueGap ↔ ParentBarrierResidueCarryGap := by
  constructor
  · intro hres p hp hnt r hrM hr
    exact (residue_lt_iff_modulus_le_sub (parentM_pos p) hr).mp
      (hres p hp hnt r hrM hr)
  · intro hcarry p hp hnt r hrM hr
    exact (residue_lt_iff_modulus_le_sub (parentM_pos p) hr).mpr
      (hcarry p hp hnt r hrM hr)

/-- The sharp residue gap implies the semigroup gap — so proving the concrete modular inequality
`C < D·r` for every nontrivial parent barrier discharges `ParentBarrierGap`. -/
theorem parentBarrierResidueGap_implies_parentBarrierGap
    (hres : ParentBarrierResidueGap) : ParentBarrierGap := by
  intro p hp hnt
  exact gap_of_residue (parentD_coprime_parentM hp) (parentM_pos p) (hres p hp hnt)

/-- The semigroup gap implies the sharp residue inequality: if `C` were not below
`D·r`, the residue characterization would put `C` in `⟨D, M⟩`. -/
theorem parentBarrierGap_implies_parentBarrierResidueGap
    (hgap : ParentBarrierGap) : ParentBarrierResidueGap := by
  intro p hp hnt r hrM hr
  have hnotmem : ¬ InTwoGenSemigroup (parentC p) (parentD p) (parentM p) :=
    hgap p hp hnt
  have hiff := inTwoGenSemigroup_iff_residue (parentD_coprime_parentM hp) hrM hr
  exact Nat.lt_of_not_ge fun hle => hnotmem (hiff.mpr hle)

/-- The parent-barrier semigroup gap is exactly the sharp residue inequality `C < D·r`
at every nontrivial parent barrier. -/
theorem parentBarrierGap_iff_parentBarrierResidueGap :
    ParentBarrierGap ↔ ParentBarrierResidueGap := by
  exact ⟨parentBarrierGap_implies_parentBarrierResidueGap,
    parentBarrierResidueGap_implies_parentBarrierGap⟩

/-- The parent-barrier semigroup gap is exactly the carry inequality
`M ≤ D·r - C` at every nontrivial parent barrier residue. -/
theorem parentBarrierGap_iff_parentBarrierResidueCarryGap :
    ParentBarrierGap ↔ ParentBarrierResidueCarryGap := by
  rw [parentBarrierGap_iff_parentBarrierResidueGap]
  exact parentBarrierResidueGap_iff_parentBarrierResidueCarryGap

/-- **Frontier alias in residue form.** The existing semigroup-gap frontier
`parentBarrierGap_holds` transported across the proved equivalence, so the same
single open input can be read directly as the modular inequality `C < D·r` for
every nontrivial parent barrier. -/
theorem parentBarrierResidueGap_holds : ParentBarrierResidueGap :=
  parentBarrierGap_implies_parentBarrierResidueGap parentBarrierGap_holds

/-- **Frontier alias in carry form.** The same parent-barrier gap frontier read as
the high-2-adic-digit carry inequality `M ≤ D·r - C`. -/
theorem parentBarrierResidueCarryGap_holds : ParentBarrierResidueCarryGap :=
  parentBarrierResidueGap_iff_parentBarrierResidueCarryGap.mp
    parentBarrierResidueGap_holds

/-- **First-passage margin identity.** For a parent barrier `p` and any seed `n` realizing the
first-passage word `p ++ [E]`, the semigroup datum and the orbit are tied by
`D·n + M·orbit n = C + M·n`. The gap margin `D·n - C` is exactly `M·(n - orbit n)`, so the
semigroup certificate at `n` (`D·n ≤ C`) coincides with non-descent (`n ≤ orbit n`), and `C < D·n`
with strict descent. -/
theorem firstPassage_margin {p : List Branch} {n : Nat}
    (hp : ParentBarrier p)
    (hword : parityWord n (p ++ [Branch.E]).length = p ++ [Branch.E]) :
    parentD p * n + parentM p * orbit n (p ++ [Branch.E]).length
      = parentC p + parentM p * n := by
  have hstar : parentM p * orbit n (p ++ [Branch.E]).length
      = parentA p * n + parentC p := by
    have hk := affine_trace_parityWord n (p ++ [Branch.E]).length
    rw [hword, trace_parent_append_E] at hk
    simpa [parentM] using hk
  have hD : parentD p + parentA p = parentM p := by
    have h2 : parentA p < 2 * parentB p := hp.2.1
    unfold parentD parentM
    omega
  rw [hstar]
  have hmix : parentD p * n + parentA p * n = parentM p * n := by
    rw [← Nat.add_mul, hD]
  omega

/-- The first-passage word descends at a realizing seed `n` exactly when `C < D·n` — the gap
inequality read at that seed. The least realizing seed is the worst case, so `ParentBarrierGap`
is the descent of the least representative of every nontrivial cylinder. -/
theorem firstPassage_descent_iff_gap {p : List Branch} {n : Nat}
    (hp : ParentBarrier p)
    (hword : parityWord n (p ++ [Branch.E]).length = p ++ [Branch.E]) :
    orbit n (p ++ [Branch.E]).length < n ↔ parentC p < parentD p * n := by
  have hm := firstPassage_margin hp hword
  have hMpos := parentM_pos p
  refine ⟨fun h => ?_, fun h => ?_⟩
  · have h2 : parentM p * (orbit n (p ++ [Branch.E]).length + 1) ≤ parentM p * n :=
      Nat.mul_le_mul_left (parentM p) h
    rw [Nat.mul_succ] at h2
    omega
  · refine Nat.lt_of_not_le (fun hle => ?_)
    have hmul := Nat.mul_le_mul_left (parentM p) hle
    omega

/-- Any seed realizing the first-passage word solves the parent-barrier residue
equation. -/
theorem firstPassage_seed_residue {p : List Branch} {n : Nat}
    (hp : ParentBarrier p)
    (hword : parityWord n (p ++ [Branch.E]).length = p ++ [Branch.E]) :
    (parentD p * n) % parentM p = parentC p % parentM p := by
  have hmargin := firstPassage_margin (p := p) (n := n) hp hword
  apply mod_eq_of_intCast_dvd
  refine ⟨((n : Int) - (orbit n (p ++ [Branch.E]).length : Int)), ?_⟩
  have hcast :
      ((parentD p * n + parentM p * orbit n (p ++ [Branch.E]).length : Nat) : Int) =
        ((parentC p + parentM p * n : Nat) : Int) := by
    exact congrArg (fun x : Nat => (x : Int)) hmargin
  simp at hcast ⊢
  rw [Int.mul_sub]
  omega

/-- In the finite parent-barrier modulus, a first-passage seed is the unique
inverse residue. -/
theorem firstPassage_seed_eq_residue {p : List Branch} {n r : Nat}
    (hp : ParentBarrier p)
    (hnM : n < parentM p)
    (hword : parityWord n (p ++ [Branch.E]).length = p ++ [Branch.E])
    (hrM : r < parentM p)
    (hrmod : (parentD p * r) % parentM p = parentC p % parentM p) :
    n = r := by
  have hnmod := firstPassage_seed_residue (p := p) (n := n) hp hword
  have hmul :
      (parentD p * n) % parentM p = (parentD p * r) % parentM p := by
    rw [hnmod, hrmod]
  have hmod := modEq_mul_cancel (D := parentD p) (M := parentM p)
    (parentD_coprime_parentM hp) hmul
  simpa [Nat.mod_eq_of_lt hnM, Nat.mod_eq_of_lt hrM] using hmod

/-! ## The parity-word coding is the full 2-shift

The parity words are the **full** shift on `{E, O}` — every transition is allowed — so the coding
`n ↦ parityWord n k` descends to a bijection `ℤ/2^k ≅ {E,O}^k` (the Terras parity vector). The
realizing residue of a first-passage word is its least cylinder seed. The core is residue-periodicity:
one settling stage `step` carries `mod 2^{k+1}` agreement down to `mod 2^k`. -/

/-- Equal parity gives equal branch letter. -/
theorem branch_mod {n n' : Nat} (h : n % 2 = n' % 2) : branch n = branch n' := by
  rcases (show n % 2 = 0 ∨ n % 2 = 1 from by omega) with h0 | h1
  · rw [branch_even h0, branch_even (by omega)]
  · rw [branch_odd (by omega), branch_odd (by omega)]

/-- **One settling stage is residue-periodic**: agreement `mod 2^{k+1}` forces the steps to agree
`mod 2^k`. The `E` (halving) and `O` (`(3·+1)/2`) branches each descend one power of two. -/
theorem step_mod {k n n' : Nat} (h : n % 2 ^ (k + 1) = n' % 2 ^ (k + 1)) :
    step n % 2 ^ k = step n' % 2 ^ k := by
  have hpow : 2 ^ (k + 1) = 2 * 2 ^ k := by rw [Nat.pow_succ]; omega
  have hdvd2 : (2 : Nat) ∣ 2 ^ (k + 1) := ⟨2 ^ k, by rw [hpow]⟩
  suffices H : ∀ a b : Nat, a % 2 ^ (k + 1) = b % 2 ^ (k + 1) → a ≤ b →
      step a % 2 ^ k = step b % 2 ^ k by
    rcases Nat.le_total n n' with hle | hle
    · exact H n n' h hle
    · exact (H n' n h.symm hle).symm
  intro a b hab hle
  have hdvd : 2 ^ (k + 1) ∣ (b - a) := dvd_sub_of_mod_eq hab hle
  have hpar : a % 2 = b % 2 := by
    rw [← Nat.mod_mod_of_dvd a hdvd2, ← Nat.mod_mod_of_dvd b hdvd2, hab]
  rcases (show a % 2 = 0 ∨ a % 2 = 1 from by omega) with h0 | h1
  · have ea := step_even_eq h0
    have eb := step_even_eq (show b % 2 = 0 by omega)
    have hba : b - a = 2 * (step b - step a) := by omega
    have hd2 : 2 ^ (k + 1) ∣ 2 * (step b - step a) := by rw [← hba]; exact hdvd
    rw [hpow] at hd2
    exact mod_eq_of_dvd_sub (Nat.dvd_of_mul_dvd_mul_left (by omega) hd2) (by omega)
  · have ea := step_odd_eq (show a % 2 ≠ 0 by omega)
    have eb := step_odd_eq (show b % 2 ≠ 0 by omega)
    have hba : 2 * (step b - step a) = 3 * (b - a) := by omega
    have hd2 : 2 ^ (k + 1) ∣ 2 * (step b - step a) := by
      rw [hba]; obtain ⟨c, hc⟩ := hdvd; exact ⟨3 * c, by rw [hc]; ac_rfl⟩
    rw [hpow] at hd2
    exact mod_eq_of_dvd_sub (Nat.dvd_of_mul_dvd_mul_left (by omega) hd2) (by omega)

/-- **Parity words are residue-periodic**: `n ≡ n' (mod 2^k)` realize the same length-`k` parity word.
The `mod 2^k` reduction is a complete invariant of the coding — the full-shift conjugacy. -/
theorem parityWord_mod : ∀ (k n n' : Nat), n % 2 ^ k = n' % 2 ^ k →
    parityWord n k = parityWord n' k
  | 0, _, _, _ => rfl
  | k + 1, n, n', h => by
    have hdvd2 : (2 : Nat) ∣ 2 ^ (k + 1) := ⟨2 ^ k, by rw [Nat.pow_succ]; omega⟩
    have hpar : n % 2 = n' % 2 := by
      rw [← Nat.mod_mod_of_dvd n hdvd2, ← Nat.mod_mod_of_dvd n' hdvd2, h]
    rw [parityWord_succ, parityWord_succ, branch_mod hpar,
      parityWord_mod k (step n) (step n') (step_mod h)]

/-- **The coding is surjective**: every length-`k` parity word is realized by a residue `n < 2^k` —
its least cylinder seed. The `E` letter prepends `n = 2m`; the `O` letter solves `3n ≡ 2m-1`
`(mod 2^{k+1})` via the modular inverse of `3` (`exists_residue`), the realizing seed being automatically
odd. Together with `parityWord_mod`, this is the full-shift conjugacy `ℤ/2^k ≅ {E,O}^k`. -/
theorem parityWord_surj : ∀ (w : List Branch), ∃ n, n < 2 ^ w.length ∧ parityWord n w.length = w
  | [] => ⟨0, by decide, rfl⟩
  | b :: w => by
    obtain ⟨m, hmlt, hmw⟩ := parityWord_surj w
    cases b with
    | E =>
      refine ⟨2 * m, ?_, ?_⟩
      · show 2 * m < 2 ^ (w.length + 1)
        rw [Nat.pow_succ]; omega
      · show parityWord (2 * m) (w.length + 1) = Branch.E :: w
        have hs : step (2 * m) = m := by
          unfold step; rw [if_pos (show (2 * m) % 2 = 0 by omega)]; omega
        rw [parityWord_succ, branch_even (show (2 * m) % 2 = 0 by omega), hs, hmw]
    | O =>
      have hcop : Nat.Coprime 3 (2 ^ (w.length + 1)) :=
        coprime_odd_two_pow (by decide) (w.length + 1)
      have hMpos : 0 < 2 ^ (w.length + 1) := Nat.pow_pos (by decide)
      obtain ⟨r, hrlt, hr⟩ :=
        exists_residue (C := 2 * m + (2 ^ (w.length + 1) - 1)) hcop hMpos
      have hMw : 2 ^ (w.length + 1) = 2 * 2 ^ w.length := by rw [Nat.pow_succ]; omega
      have h2M : (2 : Nat) ∣ 2 ^ (w.length + 1) := ⟨2 ^ w.length, by rw [hMw]⟩
      have hpar : (3 * r) % 2 = (2 * m + (2 ^ (w.length + 1) - 1)) % 2 := by
        rw [← Nat.mod_mod_of_dvd (3 * r) h2M,
          ← Nat.mod_mod_of_dvd (2 * m + (2 ^ (w.length + 1) - 1)) h2M, hr]
      have hMmod2 : 2 ^ (w.length + 1) % 2 = 0 := by rw [hMw]; omega
      have hrodd : r % 2 = 1 := by omega
      have e_odd : 2 * step r = 3 * r + 1 := step_odd_eq (by omega)
      have key : (3 * r + 1) % 2 ^ (w.length + 1) = (2 * m) % 2 ^ (w.length + 1) := by
        rw [Nat.add_mod, hr, ← Nat.add_mod]
        have h3 : 2 * m + (2 ^ (w.length + 1) - 1) + 1 = 2 * m + 2 ^ (w.length + 1) := by omega
        rw [h3, Nat.add_mod_right]
      have key2 : (2 * step r) % 2 ^ (w.length + 1) = (2 * m) % 2 ^ (w.length + 1) := by
        rw [e_odd]; exact key
      rw [hMw, Nat.mul_mod_mul_left, Nat.mul_mod_mul_left] at key2
      have hstepmod : step r % 2 ^ w.length = m % 2 ^ w.length := by omega
      refine ⟨r, hrlt, ?_⟩
      show parityWord r (w.length + 1) = Branch.O :: w
      rw [parityWord_succ, branch_odd (show r % 2 ≠ 0 by omega),
        parityWord_mod w.length (step r) m hstepmod, hmw]

/-- **The gap is the descent of the cylinder seed.** For a parent barrier `p`, let `n` be the seed
realizing the first-passage word `p ++ [E]` (its least cylinder representative, `n < M`). Then the
semigroup gap `C ∉ ⟨D, M⟩` — whose universal form over nontrivial barriers is `ParentBarrierGap` —
holds *exactly* when `n` strictly descends under the first-passage word. So the gap conjecture is the
first-passage descent of least cylinder representatives. -/
theorem gap_iff_cylinderSeed_descends {p : List Branch} (hp : ParentBarrier p) :
    ∃ n, n < parentM p ∧ parityWord n (p ++ [Branch.E]).length = p ++ [Branch.E] ∧
      (¬ InTwoGenSemigroup (parentC p) (parentD p) (parentM p)
        ↔ orbit n (p ++ [Branch.E]).length < n) := by
  obtain ⟨n, hnlt, hword⟩ := parityWord_surj (p ++ [Branch.E])
  have hlen : (p ++ [Branch.E]).length = p.length + 1 := by rw [List.length_append]; rfl
  have hnM : n < parentM p := by
    rw [parentM_eq_pow]; rw [hlen] at hnlt; exact hnlt
  have hres_eq : (parentD p * n) % parentM p = parentC p % parentM p :=
    firstPassage_seed_residue hp hword
  refine ⟨n, hnM, hword, ?_⟩
  rw [inTwoGenSemigroup_iff_residue (parentD_coprime_parentM hp) hnM hres_eq,
    firstPassage_descent_iff_gap hp hword]
  exact Nat.not_le

/-- The unique inverse residue of a parent barrier is the least representative
of the first-passage cylinder `p ++ [E]`. -/
theorem parentBarrier_residue_realizes_firstPassage {p : List Branch} {r : Nat}
    (hp : ParentBarrier p)
    (hrM : r < parentM p)
    (hrmod : (parentD p * r) % parentM p = parentC p % parentM p) :
    parityWord r (p ++ [Branch.E]).length = p ++ [Branch.E] := by
  obtain ⟨n, hnM, hword, _hiff⟩ := gap_iff_cylinderSeed_descends hp
  have hnr : n = r :=
    firstPassage_seed_eq_residue (p := p) (n := n) (r := r) hp hnM hword hrM hrmod
  simpa [← hnr] using hword

/-- For the unique inverse residue, first-passage cylinder descent is exactly the
residue inequality `C < D*r`. -/
theorem parentBarrier_residue_descent_iff_gap {p : List Branch} {r : Nat}
    (hp : ParentBarrier p)
    (hrM : r < parentM p)
    (hrmod : (parentD p * r) % parentM p = parentC p % parentM p) :
    orbit r (p ++ [Branch.E]).length < r ↔ parentC p < parentD p * r :=
  firstPassage_descent_iff_gap hp
    (parentBarrier_residue_realizes_firstPassage (p := p) (r := r) hp hrM hrmod)

/-- **A semigroup certificate is a bad cylinder seed.** If the parent offset lies in
`⟨D,M⟩`, then the least seed in the corresponding first-passage cylinder is
non-descending. This is the finite-state attack face: any bad semigroup witness
appears as an actual non-descending cylinder representative. -/
theorem badCylinderSeed_of_semigroup_certificate {p : List Branch}
    (hp : ParentBarrier p)
    (hmem : InTwoGenSemigroup (parentC p) (parentD p) (parentM p)) :
    ∃ n, n < parentM p ∧
      parityWord n (p ++ [Branch.E]).length = p ++ [Branch.E] ∧
      n ≤ orbit n (p ++ [Branch.E]).length := by
  obtain ⟨n, hnM, hword, hiff⟩ := gap_iff_cylinderSeed_descends hp
  refine ⟨n, hnM, hword, Nat.le_of_not_gt ?_⟩
  intro hdesc
  exact (hiff.mpr hdesc) hmem

/-- **A bad cylinder seed gives a semigroup certificate.** Non-descent of a seed in
the first-passage cylinder is exactly the semigroup obstruction read back through
the residue equation of that cylinder. -/
theorem semigroup_certificate_of_badCylinderSeed {p : List Branch} {n : Nat}
    (hp : ParentBarrier p)
    (hnM : n < parentM p)
    (hword : parityWord n (p ++ [Branch.E]).length = p ++ [Branch.E])
    (hbad : n ≤ orbit n (p ++ [Branch.E]).length) :
    InTwoGenSemigroup (parentC p) (parentD p) (parentM p) := by
  have hres_eq : (parentD p * n) % parentM p = parentC p % parentM p := by
    exact firstPassage_seed_residue hp hword
  have hle : parentD p * n ≤ parentC p := by
    exact Nat.le_of_not_gt fun hlt => by
      have hdesc := (firstPassage_descent_iff_gap hp hword).mpr hlt
      omega
  exact (inTwoGenSemigroup_iff_residue (parentD_coprime_parentM hp) hnM hres_eq).mpr hle

/-- **Bad semigroup membership equals non-descending cylinder membership.** For a fixed
parent barrier, membership of `C` in `⟨D,M⟩` is equivalent to existence of a
non-descending seed in the finite first-passage cylinder. -/
theorem inTwoGenSemigroup_iff_badCylinderSeed {p : List Branch}
    (hp : ParentBarrier p) :
    InTwoGenSemigroup (parentC p) (parentD p) (parentM p) ↔
      ∃ n, n < parentM p ∧
        parityWord n (p ++ [Branch.E]).length = p ++ [Branch.E] ∧
        n ≤ orbit n (p ++ [Branch.E]).length := by
  constructor
  · exact badCylinderSeed_of_semigroup_certificate hp
  · rintro ⟨n, hnM, hword, hbad⟩
    exact semigroup_certificate_of_badCylinderSeed hp hnM hword hbad

/-- **Parent-barrier gap as emptiness of the bad-cylinder language.** The remaining
semigroup gap is equivalent to saying that no nontrivial parent-barrier cylinder
contains a non-descending representative. This is the hook for a sofic or
finite-state emptiness certificate. -/
theorem parentBarrierGap_iff_no_badCylinderSeed :
    ParentBarrierGap ↔
      ∀ p : List Branch, ParentBarrier p → ¬ TrivialParentBarrier p →
        ¬ ∃ n, n < parentM p ∧
          parityWord n (p ++ [Branch.E]).length = p ++ [Branch.E] ∧
          n ≤ orbit n (p ++ [Branch.E]).length := by
  constructor
  · intro hgap p hp hnt hbad
    have hmem := (inTwoGenSemigroup_iff_badCylinderSeed hp).mpr hbad
    exact hgap p hp hnt hmem
  · intro hno p hp hnt hmem
    exact hno p hp hnt ((inTwoGenSemigroup_iff_badCylinderSeed hp).mp hmem)

/-- **`ParentBarrierGap` ⟺ first-passage descent of least cylinder representatives.** The semigroup-gap
conjecture (`SemigroupGap`) is equivalent to: every nontrivial first-passage cylinder's least
representative strictly descends. This is the restatement of the frontier hole as the corpus
§6.4 descent — the arithmetic gap and the dynamical descent are one statement. -/
theorem parentBarrierGap_iff_cylinderSeeds_descend :
    ParentBarrierGap ↔
      ∀ p : List Branch, ParentBarrier p → ¬ TrivialParentBarrier p →
        ∀ n, n < parentM p → parityWord n (p ++ [Branch.E]).length = p ++ [Branch.E] →
          orbit n (p ++ [Branch.E]).length < n := by
  constructor
  · intro hgap p hp hnt n hnM hword
    have hmem : ¬ InTwoGenSemigroup (parentC p) (parentD p) (parentM p) := hgap p hp hnt
    have hres_eq : (parentD p * n) % parentM p = parentC p % parentM p := by
      have hm := firstPassage_margin hp hword
      rw [← Nat.add_mul_mod_self_left (parentD p * n) (parentM p)
        (orbit n (p ++ [Branch.E]).length), hm, Nat.add_mul_mod_self_left]
    rw [inTwoGenSemigroup_iff_residue (parentD_coprime_parentM hp) hnM hres_eq] at hmem
    rw [firstPassage_descent_iff_gap hp hword]
    exact Nat.not_le.mp hmem
  · intro hdesc p hp hnt
    obtain ⟨n, hnM, hword, hiff⟩ := gap_iff_cylinderSeed_descends hp
    exact hiff.mpr (hdesc p hp hnt n hnM hword)

/-- **Residue gap ⟺ first-passage cylinder descent.** After the residue refinement, the same
descent skeleton is stated directly in modular-inequality form: `C < D·r` for every
nontrivial parent barrier is equivalent to strict descent of every seed in the corresponding
first-passage cylinder. -/
theorem parentBarrierResidueGap_iff_cylinderSeeds_descend :
    ParentBarrierResidueGap ↔
      ∀ p : List Branch, ParentBarrier p → ¬ TrivialParentBarrier p →
        ∀ n, n < parentM p → parityWord n (p ++ [Branch.E]).length = p ++ [Branch.E] →
          orbit n (p ++ [Branch.E]).length < n := by
  rw [← parentBarrierGap_iff_parentBarrierResidueGap]
  exact parentBarrierGap_iff_cylinderSeeds_descend

/-- **Carry gap iff bad-cylinder emptiness.** The high-2-adic carry form of the
parent-barrier gap is exactly the absence of non-descending representatives in
nontrivial first-passage cylinders. -/
theorem parentBarrierResidueCarryGap_iff_no_badCylinderSeed :
    ParentBarrierResidueCarryGap ↔
      ∀ p : List Branch, ParentBarrier p → ¬ TrivialParentBarrier p →
        ¬ ∃ n, n < parentM p ∧
          parityWord n (p ++ [Branch.E]).length = p ++ [Branch.E] ∧
          n ≤ orbit n (p ++ [Branch.E]).length := by
  rw [← parentBarrierGap_iff_parentBarrierResidueCarryGap]
  exact parentBarrierGap_iff_no_badCylinderSeed

/-- **Carry gap iff first-passage cylinder descent.** In carry language, the
remaining parent-barrier boundary is exactly strict descent throughout every
nontrivial first-passage cylinder. -/
theorem parentBarrierResidueCarryGap_iff_cylinderSeeds_descend :
    ParentBarrierResidueCarryGap ↔
      ∀ p : List Branch, ParentBarrier p → ¬ TrivialParentBarrier p →
        ∀ n, n < parentM p → parityWord n (p ++ [Branch.E]).length = p ++ [Branch.E] →
          orbit n (p ++ [Branch.E]).length < n := by
  rw [← parentBarrierResidueGap_iff_parentBarrierResidueCarryGap]
  exact parentBarrierResidueGap_iff_cylinderSeeds_descend

/-! ## The sub-modulus collapse: membership is bare divisibility -/

/-- **When the offset is below the modulus, the semigroup collapses to a divisibility.** If `C < M`
then any representation `C = D·m + M·n` must have `n = 0` (else `M·n ≥ M > C`), so membership in
`⟨D, M⟩` is exactly `D ∣ C` — the second generator drops out entirely. -/
theorem inTwoGenSemigroup_iff_dvd_of_lt {C D M : Nat} (hCM : C < M) :
    InTwoGenSemigroup C D M ↔ D ∣ C := by
  constructor
  · rintro ⟨m, n, hC⟩
    have hn : n = 0 := by
      rcases Nat.eq_zero_or_pos n with h | h
      · exact h
      · have h1 : M * 1 ≤ M * n := Nat.mul_le_mul_left M h
        omega
    subst hn
    exact ⟨m, by omega⟩
  · rintro ⟨m, hm⟩
    exact ⟨m, 0, by omega⟩

/-- **The parent-barrier gap is non-divisibility, below the modulus.** For a parent barrier whose
offset is below its modulus (`C < M`), the semigroup gap `C ∉ ⟨D, M⟩` is exactly `D ∤ C` — the
numerical-semigroup nonmembership sharpens to a single non-divisibility of the affine offset by the
descent generator. -/
theorem parentGap_iff_not_dvd {p : List Branch} (hCM : parentC p < parentM p) :
    ¬ InTwoGenSemigroup (parentC p) (parentD p) (parentM p) ↔ ¬ (parentD p ∣ parentC p) :=
  not_congr (inTwoGenSemigroup_iff_dvd_of_lt hCM)

/-! ## The 2-adic valuation — the seed of the place at 2

`Real.Internal` builds ℝ as the κ=ω Scott-continuous completion of ℚ at the archimedean absolute
value. The 2-adic integers `ℤ₂` are the **same completion machine** at the non-archimedean absolute
value `|n|₂ = 2^{-v₂(n)}`. Here is its seed: the 2-adic valuation `v₂`, whose divisibility law makes
the Collatz cylinders (`parityWord_mod`) literal 2-adic balls. -/

/-- The **2-adic valuation** `v₂(n)`: the exponent of the largest power of two dividing `n`
(`v₂(0) := 0`). -/
def twoAdicVal : Nat → Nat
  | 0 => 0
  | (n + 1) => if (n + 1) % 2 = 0 then twoAdicVal ((n + 1) / 2) + 1 else 0
  decreasing_by exact Nat.div_lt_self (by omega) (by omega)

/-- An odd number has 2-adic valuation `0`. -/
theorem twoAdicVal_odd {n : Nat} (h : n % 2 = 1) : twoAdicVal n = 0 := by
  cases n with
  | zero => simp at h
  | succ m =>
    rw [twoAdicVal, if_neg (by omega)]

/-- Doubling raises the 2-adic valuation by one. -/
theorem twoAdicVal_double {n : Nat} (hn : 0 < n) : twoAdicVal (2 * n) = twoAdicVal n + 1 := by
  obtain ⟨m, rfl⟩ : ∃ m, n = m + 1 := ⟨n - 1, by omega⟩
  rw [show 2 * (m + 1) = (2 * m + 1) + 1 from by omega, twoAdicVal, if_pos (by omega),
    show ((2 * m + 1) + 1) / 2 = m + 1 from by omega]

/-- `v₂(2^k) = k` — the powers of two are the valuation's own scale. -/
theorem twoAdicVal_two_pow (k : Nat) : twoAdicVal (2 ^ k) = k := by
  induction k with
  | zero => exact twoAdicVal_odd (by decide)
  | succ k ih =>
    rw [Nat.pow_succ, Nat.mul_comm (2 ^ k) 2,
      twoAdicVal_double (Nat.pow_pos (by decide)), ih]

/-- **The valuation–ball law.** `2^k ∣ n ⟺ k ≤ v₂(n)`: a power of two divides exactly up to the
valuation. This makes "agree mod `2^k`" the 2-adic ball `v₂(·) ≥ k`. -/
theorem dvd_two_pow_iff_le_twoAdicVal : ∀ (n : Nat), 0 < n → ∀ (k : Nat),
    2 ^ k ∣ n ↔ k ≤ twoAdicVal n := by
  intro n
  induction n using Nat.strongRecOn with
  | ind n ih =>
    intro hn k
    cases k with
    | zero =>
      rw [Nat.pow_zero]
      exact ⟨fun _ => Nat.zero_le _, fun _ => Nat.one_dvd n⟩
    | succ k =>
      rcases (show n % 2 = 0 ∨ n % 2 = 1 from by omega) with he | ho
      · obtain ⟨j, rfl⟩ : ∃ j, n = 2 * j := ⟨n / 2, by omega⟩
        have hj : 0 < j := by omega
        rw [twoAdicVal_double hj, Nat.pow_succ, Nat.mul_comm (2 ^ k) 2,
          Nat.mul_dvd_mul_iff_left (by decide : 0 < 2), ih j (by omega) hj k]
        constructor <;> intro h <;> omega
      · rw [twoAdicVal_odd ho]
        constructor
        · intro hdvd
          exact absurd (Nat.dvd_trans ⟨2 ^ k, by rw [Nat.pow_succ, Nat.mul_comm]⟩ hdvd) (by omega)
        · intro h
          exact absurd h (by omega)

/-- **The parity coding is 2-adically continuous.** Seeds within 2-adic distance `2^{-k}` — i.e.
`v₂(n − n') ≥ k` — agree on their first `k` branches. So `parityWord_mod` is the statement that the
Collatz coding `n ↦ Q(n)` is 1-Lipschitz for the 2-adic metric: the cylinders are 2-adic balls. -/
theorem parityWord_twoAdic {n n' k : Nat} (hlt : n' < n)
    (h : k ≤ twoAdicVal (n - n')) : parityWord n k = parityWord n' k := by
  apply parityWord_mod
  have hdvd : 2 ^ k ∣ (n - n') := (dvd_two_pow_iff_le_twoAdicVal (n - n') (by omega) k).mpr h
  exact (mod_eq_of_dvd_sub hdvd (by omega : n' ≤ n)).symm

end Collatz
end Closure
end Obsmetrologia
