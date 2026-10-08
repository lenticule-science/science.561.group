import ObsmetrologiaPhysicalScience.KineticTheory.Gas.MolecularChaosGluing
import Obsmetrologia.Closure.Collatz.ResidueGap

/-!
# Reconstruction — two-particle molecular chaos is recovered from its correlations

`MolecularChaosGluing` proves the obstruction direction: a factorized joint has every connected
correlation (2×2 minor) zero. This module proves the converse on a finite state space, for
integer joints: **a joint whose correlation minors all vanish factorizes**. Two-particle
structure is therefore visible to pairwise (second-order) data. Anything pairwise data cannot
see begins at three particles.

The proof is the content argument. A nonzero joint has a nonzero row. That row's entries have a
common divisor `g` that is an integer combination of them (Bézout, `list_bezout`). Divided by
`g`, the row is primitive: its entries combine to `1`. Every other row is proportional to it,
because the minors vanish. The combination coefficients turn that proportion into an integer
factor.

## Main results

* `list_bezout` — the entries `f w` over a duplicate-free list have a common divisor that is an
  integer combination of them, nonzero when some entry is.
* `decorrelated_imp_factorizes` — over a finite state space listed without repetition, a
  decorrelated integer joint factorizes.

## References

The finite, integer case of the rank-one reconstruction named open in
`Worlds.KineticReconstruction`. Lanford's propagation of chaos over a continuum is a different,
analytic statement.

## Tags

molecular chaos, factorization, rank one, Bézout, content
-/

namespace Obsmetrologia
namespace KineticTheory.Gas

/-- The sum of `f w` over a list. -/
def lsum {α : Type} (ws : List α) (f : α → Int) : Int := ws.foldr (fun w acc => f w + acc) 0

theorem lsum_cons {α : Type} (w : α) (ws : List α) (f : α → Int) :
    lsum (w :: ws) f = f w + lsum ws f := rfl

theorem lsum_mul_right {α : Type} (ws : List α) (f : α → Int) (k : Int) :
    lsum ws (fun w => f w * k) = lsum ws f * k := by
  induction ws with
  | nil => show (0 : Int) = 0 * k; rw [Int.zero_mul]
  | cons w ws ih => rw [lsum_cons, lsum_cons, ih, Int.add_mul]

theorem lsum_congr {α : Type} (ws : List α) (f g : α → Int) (h : ∀ w, w ∈ ws → f w = g w) :
    lsum ws f = lsum ws g := by
  induction ws with
  | nil => rfl
  | cons w ws ih =>
    rw [lsum_cons, lsum_cons, h w (List.Mem.head _), ih (fun x hx => h x (List.Mem.tail _ hx))]

/-- The absolute value of an integer, as a sign times it. -/
theorem natAbs_eq_sign_mul (z : Int) : ((z.natAbs : Nat) : Int) = (if 0 ≤ z then 1 else -1) * z := by
  by_cases h : 0 ≤ z
  · rw [if_pos h]; omega
  · rw [if_neg h]; omega

/-- A natural that divides an integer's absolute value divides the integer. -/
theorem natCast_dvd_of_dvd_natAbs {n : Nat} {z : Int} (h : n ∣ z.natAbs) : (n : Int) ∣ z :=
  Int.ofNat_dvd_left.mpr h

/-- **Bézout over a list.** The entries `f w` over a duplicate-free list have a common divisor
`g` that is an integer combination of them; `g` is nonzero when some entry is. -/
theorem list_bezout {α : Type} [DecidableEq α] (f : α → Int) : ∀ (ws : List α), ws.Pairwise (· ≠ ·) →
    ∃ (g : Int) (s : α → Int), lsum ws (fun w => s w * f w) = g ∧ (∀ w, w ∈ ws → g ∣ f w) ∧
      (∀ w, w ∈ ws → f w ≠ 0 → g ≠ 0)
  | [], _ => ⟨0, fun _ => 0, rfl, fun _ h => (nomatch h), fun _ h => (nomatch h)⟩
  | x :: xs, .cons hx hxs => by
    obtain ⟨g', s', hsum, hdvd, hnz⟩ := list_bezout f xs hxs
    obtain ⟨a, b, hab⟩ := Closure.Collatz.bezout (f x).natAbs g'.natAbs
    let sx : Int := if 0 ≤ f x then 1 else -1
    let sg : Int := if 0 ≤ g' then 1 else -1
    have habs_x : ((f x).natAbs : Int) = sx * f x := natAbs_eq_sign_mul (f x)
    have habs_g : (g'.natAbs : Int) = sg * g' := natAbs_eq_sign_mul g'
    refine ⟨(Nat.gcd (f x).natAbs g'.natAbs : Int), fun w => if w = x then a * sx else b * sg * s' w, ?_, ?_, ?_⟩
    · rw [lsum_cons]
      dsimp only
      rw [if_pos rfl]
      have htail : lsum xs (fun w => (if w = x then a * sx else b * sg * s' w) * f w) = b * (sg * g') := by
        have e : lsum xs (fun w => (if w = x then a * sx else b * sg * s' w) * f w) =
            lsum xs (fun w => s' w * f w * (b * sg)) := by
          apply lsum_congr
          intro w hw
          have hne : w ≠ x := fun e => hx w hw e.symm
          rw [if_neg hne]
          iring
        rw [e, lsum_mul_right, hsum]
        iring
      rw [htail, ← habs_g, ← hab]
      have e2 : a * sx * f x = (f x).natAbs * a := by rw [habs_x]; iring
      rw [e2]
      iring
    · intro w hw
      match List.mem_cons.mp hw with
      | Or.inl e =>
        rw [e]
        exact natCast_dvd_of_dvd_natAbs (Nat.gcd_dvd_left _ _)
      | Or.inr hw' =>
        exact Int.dvd_trans (natCast_dvd_of_dvd_natAbs (Nat.gcd_dvd_right _ _)) (hdvd w hw')
    · intro w hw hfw
      intro h0
      have hgcd : Nat.gcd (f x).natAbs g'.natAbs = 0 := by exact_mod_cast h0
      have ⟨h1, h2⟩ := Nat.gcd_eq_zero_iff.mp hgcd
      match List.mem_cons.mp hw with
      | Or.inl e => exact hfw (by rw [e]; exact Int.natAbs_eq_zero.mp h1)
      | Or.inr hw' => exact hnz w hw' hfw (Int.natAbs_eq_zero.mp h2)

/-- **Decorrelated integer joints factorize.** Over a finite state space listed without
repetition, a joint whose every connected-correlation minor vanishes is a product of
single-particle data. -/
theorem decorrelated_imp_factorizes {V : Type} [DecidableEq V] (vs : List V)
    (hnd : vs.Pairwise (· ≠ ·)) (hall : ∀ v, v ∈ vs) (J : Joint V) (hJ : Decorrelated J) :
    Factorizes J := by
  cases hany : vs.any (fun v => vs.any (fun w => J v w != 0)) with
  | false =>
    refine ⟨fun _ => 0, fun _ => 0, fun v w => ?_⟩
    rw [Int.zero_mul]
    by_cases h : J v w = 0
    · exact h
    · have : vs.any (fun v => vs.any (fun w => J v w != 0)) = true :=
        List.any_eq_true.mpr ⟨v, hall v, List.any_eq_true.mpr ⟨w, hall w, by simp [h]⟩⟩
      rw [hany] at this
      exact nomatch this
  | true =>
    obtain ⟨a0, -, ha0⟩ := List.any_eq_true.mp hany
    obtain ⟨c0, -, hc0⟩ := List.any_eq_true.mp ha0
    have hne : J a0 c0 ≠ 0 := by simpa using hc0
    obtain ⟨g, s, hsum, hdvd, hnz⟩ := list_bezout (fun w => J a0 w) vs hnd
    have hg : g ≠ 0 := hnz c0 (hall c0) hne
    let q : V → Int := fun w => J a0 w / g
    have hq : ∀ w, J a0 w = g * q w := fun w => (Int.mul_ediv_cancel' (hdvd w (hall w))).symm
    refine ⟨fun v => lsum vs (fun w => s w * J v w), q, fun v w' => ?_⟩
    -- every row is proportional to row a0
    have key : ∀ w, J v w * q w' = J v w' * q w := by
      intro w
      have h := hJ v a0 w w'
      unfold corr at h
      rw [hq w', hq w] at h
      apply Int.eq_of_mul_eq_mul_left hg
      have e : g * (J v w * q w') = J v w * (g * q w') := by iring
      have e' : g * (J v w' * q w) = J v w' * (g * q w) := by iring
      rw [e, e']
      omega
    -- the row's primitive part combines to one
    have hone : lsum vs (fun w => s w * q w) = 1 := by
      apply Int.eq_of_mul_eq_mul_right hg
      rw [← lsum_mul_right, Int.one_mul]
      calc lsum vs (fun w => s w * q w * g)
          = lsum vs (fun w => s w * J a0 w) := by
            apply lsum_congr
            intro w _
            rw [hq w]
            iring
        _ = g := hsum
    show J v w' = lsum vs (fun w => s w * J v w) * q w'
    rw [← lsum_mul_right]
    have e3 : lsum vs (fun w => s w * J v w * q w') = lsum vs (fun w => s w * q w * J v w') := by
      apply lsum_congr
      intro w _
      have := key w
      calc s w * J v w * q w' = s w * (J v w * q w') := by iring
        _ = s w * (J v w' * q w) := by rw [this]
        _ = s w * q w * J v w' := by iring
    rw [e3, lsum_mul_right, hone, Int.one_mul]

/-- `Fin n` listed in order, without repetition. -/
theorem finRange_pairwise_ne : ∀ n, (List.finRange n).Pairwise (· ≠ ·)
  | 0 => by rw [List.finRange_zero]; exact List.Pairwise.nil
  | n + 1 => by
    rw [List.finRange_succ]
    refine List.Pairwise.cons (fun y hy => ?_)
      (List.pairwise_map.mpr ((finRange_pairwise_ne n).imp fun h e => h (Fin.succ_inj.mp e)))
    obtain ⟨i, _, rfl⟩ := List.mem_map.mp hy
    exact (Fin.succ_ne_zero i).symm

end KineticTheory.Gas
end Obsmetrologia
