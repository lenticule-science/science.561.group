import Obsmetrologia.Calculus.Real.MultiplicationOrder
import Obsmetrologia.Calculus.Algebra.RingTactic

/-! # Apartness — the Bishop-constructive alternative to decidable equality on `RReal`

`RReal` order carries no decidable trichotomy (`MultiplicationOrder`'s `Pos`/`lt`
docstrings say so explicitly): there is no `Bool`-valued classifier of `a < b`, `a = b`,
`a > b`. **Apartness** is the positive, witnessed relation Bishop constructivism uses in
place of the negative, uncomputable `a ≠ b`: `a # b` holds when a rational gap has
actually been exhibited between them, at some explicit precision `k`. That precision is
already sitting unused inside `Pos`'s existential witness — `Pos a := ∃ k, invNatP k ≤ a`
— this module names the relation built from it and proves the three defining laws:
irreflexivity, symmetry, and **cotransitivity** (`a # b → ∀ c, a # c ∨ c # b`), the one
that is not free assembly — it is the standard Bishop trisection argument, run against
this corpus's own `Real.seq`/`modulus`/`invNatP` machinery.

## Main definitions

* `Apart` — `a # b := a < b ∨ b < a`.

## Main results

* `apart_irrefl` — no real is apart from itself.
* `apart_symm` — apartness is symmetric.
* `apart_cotrans` — **cotransitivity**: if `a` and `b` are apart, then for any `c`,
  either `a` and `c` are apart or `c` and `b` are apart. The trisection argument.

## References

Bishop, *Foundations of Constructive Analysis* (1967), Ch. 2; `MultiplicationOrder.Pos`/
`lt` (the witnessed strict order this module's relation is built from).
-/

namespace Obsmetrologia
namespace Real.Internal
namespace RReal

/-- **Apartness**: `a` and `b` are apart when one is witnessed strictly below the
other. The positive, computable alternative to `a ≠ b` — a genuine rational gap has been
exhibited, not merely the absence of a proof of equality. -/
def Apart (a b : RReal) : Prop := a < b ∨ b < a

/-- **Irreflexive.** No real is apart from itself — a gap needs two distinct sides. -/
theorem apart_irrefl (a : RReal) : ¬ Apart a a := by
  rintro (h | h) <;> exact lt_irrefl a h

/-- **Symmetric.** Apartness does not privilege a direction. -/
theorem apart_symm {a b : RReal} (h : Apart a b) : Apart b a := h.symm

/-! ## Cotransitivity — the trisection argument

If `a < b`, the witnessed gap `1/(k+1) ≤ b - a` splits into thirds
(`Rat.invNatP_triple`): comparing `c` against a rational within `1/(k+1)` of `c` is a
*decidable* rational comparison (`Rat.le_total`), and lands `c` either in the lower
two-thirds (giving `a < c`) or the upper two-thirds (giving `c < b`) — the two
overlap, so every `c` falls in at least one. -/

/-- **Every real has a rational approximant at any precision.** `x`'s own Cauchy
sequence, read past its modulus, is that witness — the one representative-level fact
the trisection argument needs; everywhere else runs on `ofRat`/`leWithin`. -/
theorem exists_rat_within (x : RReal) (k : Nat) : ∃ q : Rat, Within k x (ofRat q) := by
  refine Quotient.inductionOn x (fun a => ?_)
  refine ⟨a.seq (a.modulus k), ?_, ?_⟩
  · show mk a ≤ ofRat (a.seq (a.modulus k)) + ofRat (Rat.invNatP k)
    rw [← ofRat_add]
    show Real.le a (Real.ofRat (a.seq (a.modulus k) + Rat.invNatP k))
    intro j
    refine ⟨a.modulus k, fun n hn => ?_⟩
    show a.seq n ≤ (a.seq (a.modulus k) + Rat.invNatP k) + Rat.invNatP j
    have hcau : Rat.abs (a.seq n - a.seq (a.modulus k)) ≤ Rat.invNatP k :=
      a.cauchy k n (a.modulus k) hn (Nat.le_refl _)
    have hsub : a.seq n - a.seq (a.modulus k) ≤ Rat.invNatP k :=
      Rat.le_trans (Rat.sub_le_abs _ _) hcau
    have hstep : a.seq n ≤ a.seq (a.modulus k) + Rat.invNatP k := by
      have h2 := Rat.add_le_add_right hsub (a.seq (a.modulus k))
      have e : (a.seq n - a.seq (a.modulus k)) + a.seq (a.modulus k) = a.seq n := by
        show (a.seq n + (-(a.seq (a.modulus k)))) + a.seq (a.modulus k) = a.seq n
        rw [Rat.add_assoc, Rat.add_left_neg, Rat.add_zero]
      rw [e, Rat.add_comm (Rat.invNatP k)] at h2
      exact h2
    exact Rat.le_add_of_le hstep (Rat.invNatP_nonneg j)
  · show ofRat (a.seq (a.modulus k)) ≤ mk a + ofRat (Rat.invNatP k)
    show Real.le (Real.ofRat (a.seq (a.modulus k))) (Real.add a (Real.ofRat (Rat.invNatP k)))
    intro j
    refine ⟨a.modulus k, fun n hn => ?_⟩
    show a.seq (a.modulus k) ≤ a.seq n + Rat.invNatP k + Rat.invNatP j
    have hcau : Rat.abs (a.seq (a.modulus k) - a.seq n) ≤ Rat.invNatP k :=
      a.cauchy k (a.modulus k) n (Nat.le_refl _) hn
    have hsub : a.seq (a.modulus k) - a.seq n ≤ Rat.invNatP k :=
      Rat.le_trans (Rat.sub_le_abs _ _) hcau
    have hstep : a.seq (a.modulus k) ≤ a.seq n + Rat.invNatP k := by
      have h2 := Rat.add_le_add_right hsub (a.seq n)
      have e : (a.seq (a.modulus k) - a.seq n) + a.seq n = a.seq (a.modulus k) := by
        show (a.seq (a.modulus k) + (-(a.seq n))) + a.seq n = a.seq (a.modulus k)
        rw [Rat.add_assoc, Rat.add_left_neg, Rat.add_zero]
      rw [e, Rat.add_comm (Rat.invNatP k)] at h2
      exact h2
    exact Rat.le_add_of_le hstep (Rat.invNatP_nonneg j)

/-- **The trisection step.** If `a < b` with witness `k` (`invNatP k ≤ b - a`), then for
any `c`, either `a < c` or `c < b`: split the gap `η := invNatP(6k+5)` six ways
(`invNatP_double` then `invNatP_triple`, so `6η = invNatP k`), approximate `a` and `c`
each within `η` (`exists_rat_within`), and compare the two rational approximants
decidably (`Rat.le_total`) against a three-`η` threshold. Whichever side wins keeps a
full `η` of slack: `p`'s side gives `c - a ≥ η`, `q`'s side gives `b - c ≥ η`, so the six-way
split is exactly tight enough that no case loses strictness. -/
theorem lt_or_lt_of_witness {a b c : RReal} {k : Nat}
    (hab : ofRat (Rat.invNatP k) ≤ b + (-a)) : a < c ∨ c < b := by
  obtain ⟨p, hp1, hp2⟩ := exists_rat_within a (6 * k + 5)
  obtain ⟨q, hq1, hq2⟩ := exists_rat_within c (6 * k + 5)
  unfold leWithin at hp1 hp2 hq1 hq2
  -- Name the recurring precision-(6k+5) slack `η` and the original gap `δ`, so every
  -- subsequent step is small symbolic arithmetic, not a repeated large expression.
  generalize hη_def : ofRat (Rat.invNatP (6 * k + 5)) = η at hp1 hp2 hq1 hq2
  generalize hδ_def : ofRat (Rat.invNatP k) = δ at hab
  have hδeq6η : δ = η + η + η + η + η + η := by
    have hraw0 : Rat.invNatP k = (Rat.invNatP (6 * k + 5) + Rat.invNatP (6 * k + 5)
          + Rat.invNatP (6 * k + 5))
        + (Rat.invNatP (6 * k + 5) + Rat.invNatP (6 * k + 5) + Rat.invNatP (6 * k + 5)) := by
      have h3 := Rat.invNatP_triple (2 * k + 1)
      have h2 := Rat.invNatP_double k
      have hidx : 3 * (2 * k + 1) + 2 = 6 * k + 5 := by omega
      rw [hidx] at h3
      rw [h3, h2]
    have hraw : Rat.invNatP k = Rat.invNatP (6 * k + 5) + Rat.invNatP (6 * k + 5)
        + Rat.invNatP (6 * k + 5) + Rat.invNatP (6 * k + 5) + Rat.invNatP (6 * k + 5)
        + Rat.invNatP (6 * k + 5) := by
      rw [hraw0]; cring Algebra.ratCommRing
    rw [← hδ_def, ← hη_def, hraw, ofRat_add, ofRat_add, ofRat_add, ofRat_add, ofRat_add]
  have hη3 : η + η + η = ofRat (Rat.invNatP (6 * k + 5) + Rat.invNatP (6 * k + 5)
      + Rat.invNatP (6 * k + 5)) := by rw [← hη_def, ofRat_add, ofRat_add]
  rcases Rat.le_total (p + (Rat.invNatP (6 * k + 5) + Rat.invNatP (6 * k + 5)
      + Rat.invNatP (6 * k + 5))) q with hcase | hcase
  · -- a ≤ p + η, and q ≥ p + 3η with c ≥ q - η, so c ≥ p + 2η ≥ a + η : c - a ≥ η.
    left
    show Pos (c + (-a))
    refine ⟨6 * k + 5, ?_⟩
    rw [hη_def]
    have step1 : ofRat p + (η + η + η) ≤ ofRat q := by
      rw [hη3, ← ofRat_add]; exact ofRat_mono hcase
    have step3 : ofRat p + (η + η + η) ≤ c + η := le_trans step1 hq2
    have step4 : ofRat p + η + η ≤ c := by
      have hc := add_le_add_right step3 (-η)
      have e1 : ofRat p + (η + η + η) + (-η) = ofRat p + η + η := by cring Algebra.rrealCommRing
      have e2 : c + η + (-η) = c := by cring Algebra.rrealCommRing
      rwa [e1, e2] at hc
    have step5 : a + η ≤ c := le_trans (add_le_add_right hp1 η) step4
    have h2 := add_le_add_right step5 (-a)
    have e1 : a + η + (-a) = η := by cring Algebra.rrealCommRing
    rwa [e1] at h2
  · -- q ≤ p + 3η, and a ≥ p - η, b ≥ a + δ = a + 6η, so b ≥ p - η + 6η = p + 5η
    -- while c ≤ q + η ≤ (p+3η)+η = p+4η, giving b - c ≥ (p+5η)-(p+4η) = η.
    right
    show Pos (b + (-c))
    refine ⟨6 * k + 5, ?_⟩
    rw [hη_def]
    have step1 : a + δ ≤ b := by
      have h2 := add_le_add_right hab a
      have e2 : b + (-a) + a = b := by cring Algebra.rrealCommRing
      have e3 : δ + a = a + δ := by cring Algebra.rrealCommRing
      rwa [e2, e3] at h2
    -- p ≤ a + η (hp2), so p + 5η ≤ (a+η) + 5η = a + 6η = a + δ ≤ b
    have step2 : ofRat p + (η + η + η + η + η) ≤ b := by
      have h0 := add_le_add_right hp2 (η + η + η + η + η)
      have e2 : a + η + (η + η + η + η + η) = a + δ := by
        rw [hδeq6η]; cring Algebra.rrealCommRing
      rw [e2] at h0
      exact le_trans h0 step1
    -- q ≤ p + 3η (hcase), and c ≤ q + η (hq1), so c ≤ p + 4η
    have step3 : c ≤ ofRat p + (η + η + η + η) := by
      have hqle : ofRat q ≤ ofRat p + (η + η + η) := by
        rw [hη3, ← ofRat_add]; exact ofRat_mono hcase
      have h1 := add_le_add_right hqle η
      have e1 : ofRat p + (η + η + η) + η = ofRat p + (η + η + η + η) := by
        cring Algebra.rrealCommRing
      rw [e1] at h1
      exact le_trans hq1 h1
    -- b ≥ p + 5η, c ≤ p + 4η, so b - c ≥ (p+5η) - (p+4η) = η
    have hneg : -(ofRat p + (η + η + η + η)) ≤ -c := neg_le_neg step3
    have hstep := add_le_add_left hneg (ofRat p + (η + η + η + η + η))
    have ecancel : ofRat p + (η + η + η + η + η) + (-(ofRat p + (η + η + η + η))) = η := by
      cring Algebra.rrealCommRing
    rw [ecancel] at hstep
    have hfinal : η ≤ ofRat p + (η + η + η + η + η) + (-c) :=
      le_trans hstep (add_le_add_right (le_refl _) (-c))
    exact le_trans hfinal (add_le_add_right step2 (-c))

/-- **Cotransitivity.** If `a` and `b` are apart, then for any `c`, either `a` and `c`
are apart or `c` and `b` are apart — the third defining law of Bishop apartness,
`lt_or_lt_of_witness` read at the `Apart` predicate. -/
theorem apart_cotrans {a b : RReal} (h : Apart a b) (c : RReal) :
    Apart a c ∨ Apart c b := by
  rcases h with hab | hba
  · obtain ⟨k, hk⟩ := hab
    rcases lt_or_lt_of_witness (a := a) (b := b) (c := c) (k := k) hk with h1 | h1
    · exact Or.inl (Or.inl h1)
    · exact Or.inr (Or.inl h1)
  · obtain ⟨k, hk⟩ := hba
    rcases lt_or_lt_of_witness (a := b) (b := a) (c := c) (k := k) hk with h1 | h1
    · exact Or.inr (Or.inr h1)
    · exact Or.inl (Or.inr h1)

end RReal
end Real.Internal
end Obsmetrologia
