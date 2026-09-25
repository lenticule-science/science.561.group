import Obsmetrologia.Language.Positing.Four
import Obsmetrologia.Language.Positing.ReadingTactic

/-!
# Bigraded cohomology — the aperiodic-regime trichotomy and the ℤ/2 gauge

`Sheaf` proved `H¹ = 0` in the finite/strict regime. The **aperiodic** regime
(κ ≥ ω₁) is exactly where `H¹` need **not** vanish, and the corpus classifies it
bigraded by the hyperdoctrine's two adjoint systems.

The newly-designated cells of a settling split **disjointly**:
`Δ⁺ = Δ⁺ᵗ ⊔ Δ⁺ᵀ` — the `t`-only ("told true") part and the `⊤`-only ("told both")
part — so the settling-associated sheaf splits `F^(k) ≅ F^(t) ⊕ F^(⊤)` (truth-side ⊕
inconsistency-side), with `F^(⊤) = 0` iff there are no `⊤`-cells.

The **bigraded classifying invariant** is the nonzero-pattern of `(H¹_t, H¹_⊤)` — and
it is *itself the four-point FOUR object* (the recurrence). Its **trichotomy** on the
nontrivial stratum:

* **consistent** — only `t`-firings (`F^(⊤) = 0`); the strict/Scott-continuous case;
* **paraconsistent** — only `⊤`-firings;
* **mixed** — both.

The **internal `ℤ/2` gauge** is bilattice negation `~` (the Klein-four's `~` from
`Four`). It acts:

* **trivially on the `⊤`-summand** — `⊤` is `~`-fixed, so the inconsistency content is
  gauge-invariant;
* **sign-flipping on the `t`-summand** — `~` swaps `t ↔ f`, so a `t`-firing maps to an
  `f`-firing.

Hence paraconsistent points are **gauge-stable**, classical points are **gauge-moved**.
No free data.
-/

namespace Obsmetrologia

/-- `List.any` respects pointwise-equal predicates. -/
theorem any_congr {α : Type} (l : List α) {p q : α → Bool} (h : ∀ a, p a = q a) :
    l.any p = l.any q := by
  induction l with
  | nil => rfl
  | cons a t ih => simp only [List.any_cons, h a, ih]

namespace Reading

/-- A `t`-firing: a designated truth cell. -/
def isTruthFiring (c : Reading) : Bool := decide (c = tTop)
/-- An `f`-firing (the gauge-image of a `t`-firing). -/
def isFalseFiring (c : Reading) : Bool := decide (c = tBot)
/-- An inconsistency: a `⊤`-cell ("told both"). -/
def isInconsistency (c : Reading) : Bool := decide (c = kTop)

/-- The split is **disjoint**: no cell is both a `t`-firing and a `⊤`-firing. -/
theorem truth_incons_disjoint (c : Reading) : ¬(isTruthFiring c = true ∧ isInconsistency c = true) := by
  reading

/-- Negation swaps `t`/`f` and fixes `⊤`/`⊥` — the gauge action on a single reading. -/
theorem isInconsistency_negate (c : Reading) : isInconsistency (negate c) = isInconsistency c := by
  reading
theorem isTruthFiring_negate (c : Reading) : isTruthFiring (negate c) = isFalseFiring c := by
  reading

end Reading

/-! ## The bigraded invariant and its trichotomy -/

/-- Truth-side content over a finite cell list: is there a `t`-firing? (`H¹_t ≠ 0`.) -/
def truthContent (cells : List PredicationCell) (v : Valuation) : Bool :=
  cells.any (fun φ => Reading.isTruthFiring (v φ))
/-- Inconsistency-side content: is there a `⊤`-cell? (`H¹_⊤ ≠ 0`, i.e. `F^(⊤) ≠ 0`.) -/
def inconsistencyContent (cells : List PredicationCell) (v : Valuation) : Bool :=
  cells.any (fun φ => Reading.isInconsistency (v φ))
/-- False-side content (the gauge-image of the truth side). -/
def falseContent (cells : List PredicationCell) (v : Valuation) : Bool :=
  cells.any (fun φ => Reading.isFalseFiring (v φ))

/-- The four regimes the bigraded invariant `(H¹_t, H¹_⊤)` falls into. -/
inductive Regime
  | trivial
  | consistent
  | paraconsistent
  | mixed
  deriving DecidableEq, Repr

/-- Classify a settling by its bigraded invariant `(truth-content, inconsistency-content)`
— itself the four-point FOUR object. -/
def regimeOf (t i : Bool) : Regime :=
  match t, i with
  | false, false => .trivial
  | true,  false => .consistent
  | false, true  => .paraconsistent
  | true,  true  => .mixed

/-- **The aperiodic-regime trichotomy.** On the nontrivial stratum (some firing), a
settling is consistent, paraconsistent, or mixed — disjoint and jointly exhaustive. -/
theorem trichotomy (t i : Bool) (h : t || i = true) :
    regimeOf t i = .consistent ∨ regimeOf t i = .paraconsistent ∨ regimeOf t i = .mixed := by
  reading

/-- **Consistent ⟺ the inconsistency sheaf vanishes** (`F^(⊤) = 0`) — the
strict/Scott-continuous collapse where the bigrading degenerates to `H^n_t`. -/
theorem consistent_iff (t i : Bool) :
    regimeOf t i = .consistent ↔ (t = true ∧ i = false) := by
  reading

/-- **Paraconsistent ⟺ only `⊤`-firings.** -/
theorem paraconsistent_iff (t i : Bool) :
    regimeOf t i = .paraconsistent ↔ (t = false ∧ i = true) := by
  reading

/-! ## The internal ℤ/2 gauge (negation) -/

/-- The internal `ℤ/2` gauge on valuations: pointwise bilattice negation `~`. -/
def negateVal (v : Valuation) : Valuation := fun φ => Reading.negate (v φ)

/-- **The gauge fixes the inconsistency side.** `F^(⊤)` is gauge-invariant because `⊤`
is a `~`-fixed value — the trivial `ℤ/2`-action on the `⊤`-summand. -/
theorem gauge_fixes_inconsistency (cells : List PredicationCell) (v : Valuation) :
    inconsistencyContent cells (negateVal v) = inconsistencyContent cells v :=
  any_congr cells (fun φ => Reading.isInconsistency_negate (v φ))

/-- **The gauge sign-flips the truth side.** A `t`-firing of `~v` is exactly an
`f`-firing of `v` — the `t ↔ f` swap on the `t`-summand. -/
theorem gauge_flips_truth (cells : List PredicationCell) (v : Valuation) :
    truthContent cells (negateVal v) = falseContent cells v :=
  any_congr cells (fun φ => Reading.isTruthFiring_negate (v φ))

/-- **Paraconsistent points are gauge-stable.** If every cell of `v` is `⊥` or `⊤`
(no `t`/`f` content — the paraconsistent moduli condition), the gauge fixes `v`
entirely. -/
theorem paraconsistent_gauge_stable (v : Valuation)
    (h : ∀ φ, v φ = Reading.kBot ∨ v φ = Reading.kTop) : negateVal v = v := by
  funext φ
  rcases h φ with hb | ht
  · show Reading.negate (v φ) = v φ; rw [hb]; rfl
  · show Reading.negate (v φ) = v φ; rw [ht]; rfl

/-- **Classical points are gauge-moved.** A `t`-cell is sent to an `f`-cell — `~` is
not the identity there. -/
theorem classical_gauge_moves (v : Valuation) (φ : PredicationCell) (h : v φ = Reading.tTop) :
    negateVal v φ ≠ v φ := by
  show Reading.negate (v φ) ≠ v φ; rw [h]; decide

end Obsmetrologia
