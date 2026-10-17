import Obsmetrologia.Closure.RegimeCycle

/-!
# Closure.RegimeComposition — the regime of closures run together

A read built from parts runs the parts' closures together. Its regime data are the
conservative data of the composite, `ClosureRegimeData.both`:

* its base is finite exactly when both bases are;
* it is certified Scott-continuous exactly when both parts are, because Scott-continuity is
  closed under composition and nothing certifies it otherwise;
* its state space has countable cofinality exactly when both do (the product's cofinality is
  the larger).

So a composite's regime is computed from its parts' data, not declared.

## Main results

* `classify_both_ge` — a composite is never cheaper than its costlier part:
  `rank (classify (d.both e)) ≥ max (rank (classify d)) (rank (classify e))`.
* `classify_both_eq_costlier` — the composite's regime is exactly the costlier part's, except
  in one case: a Scott-continuous part whose state space has uncountable cofinality, run with a
  part that is not Scott-continuous. There the composite is aperiodic, and
  `classify_both_jump` exhibits it. Cofinality is idle for a Scott-continuous part on its own,
  but it is not idle in a composite.

Every proof is a case split over the three flags and their two constraints (finite base
forces Scott-continuity and countable cofinality). These are finite checks, and they are
stated as such.
-/

namespace Obsmetrologia

/-- The conservative regime data of two closures run together. -/
def ClosureRegimeData.both (d e : ClosureRegimeData) : ClosureRegimeData where
  scottContinuous := d.scottContinuous && e.scottContinuous
  finiteBase := d.finiteBase && e.finiteBase
  countableCofinality := d.countableCofinality && e.countableCofinality
  fin_scott := fun h => by
    cases hd : d.finiteBase <;> cases he : e.finiteBase <;> rw [hd, he] at h
    · exact nomatch h
    · exact nomatch h
    · exact nomatch h
    · rw [d.fin_scott hd, e.fin_scott he]; rfl
  fin_cof := fun h => by
    cases hd : d.finiteBase <;> cases he : e.finiteBase <;> rw [hd, he] at h
    · exact nomatch h
    · exact nomatch h
    · exact nomatch h
    · rw [d.fin_cof hd, e.fin_cof he]; rfl

/-- The costlier of two regimes, by rank on the tower. -/
def ClosureRegime.costlier (r s : ClosureRegime) : ClosureRegime :=
  if r.rank ≤ s.rank then s else r

/-- The regime three flags select (`classify`, read on bare flags). -/
def regimeOfFlags (f sc c : Bool) : ClosureRegime :=
  if f then ClosureRegime.strict
  else if sc then ClosureRegime.scott
  else if c then ClosureRegime.transfiniteBounded
  else ClosureRegime.aperiodic

theorem classify_eq_flags (d : ClosureRegimeData) :
    classify d = regimeOfFlags d.finiteBase d.scottContinuous d.countableCofinality := rfl

/-- The jump case on bare flags. -/
def jumpsFlags (s1 c1 s2 c2 : Bool) : Bool :=
  (s1 && !c1 && !s2 && c2) || (s2 && !c2 && !s1 && c1)

theorem flags_ge : ∀ f1 s1 c1 f2 s2 c2 : Bool,
    (f1 = true → s1 = true) → (f1 = true → c1 = true) → (f2 = true → s2 = true) → (f2 = true → c2 = true) →
    (regimeOfFlags f1 s1 c1).rank ≤ (regimeOfFlags (f1 && f2) (s1 && s2) (c1 && c2)).rank ∧
    (regimeOfFlags f2 s2 c2).rank ≤ (regimeOfFlags (f1 && f2) (s1 && s2) (c1 && c2)).rank := by
  intro f1 s1 c1 f2 s2 c2
  cases f1 <;> cases s1 <;> cases c1 <;> cases f2 <;> cases s2 <;> cases c2 <;> decide

theorem flags_eq_costlier : ∀ f1 s1 c1 f2 s2 c2 : Bool,
    (f1 = true → s1 = true) → (f1 = true → c1 = true) → (f2 = true → s2 = true) → (f2 = true → c2 = true) →
    jumpsFlags s1 c1 s2 c2 = false →
    regimeOfFlags (f1 && f2) (s1 && s2) (c1 && c2) = (regimeOfFlags f1 s1 c1).costlier (regimeOfFlags f2 s2 c2) := by
  intro f1 s1 c1 f2 s2 c2
  cases f1 <;> cases s1 <;> cases c1 <;> cases f2 <;> cases s2 <;> cases c2 <;> decide

/-- **A composite is never cheaper than its costlier part.** -/
theorem classify_both_ge (d e : ClosureRegimeData) :
    (classify d).rank ≤ (classify (d.both e)).rank ∧ (classify e).rank ≤ (classify (d.both e)).rank :=
  flags_ge _ _ _ _ _ _ d.fin_scott d.fin_cof e.fin_scott e.fin_cof

/-- The one case where a composite outruns both parts: a Scott-continuous part with uncountable
cofinality, run with a part that is not Scott-continuous. -/
def ClosureRegimeData.jumps (d e : ClosureRegimeData) : Bool :=
  jumpsFlags d.scottContinuous d.countableCofinality e.scottContinuous e.countableCofinality

/-- **The composite's regime is the costlier part's**, except when the parts jump. -/
theorem classify_both_eq_costlier (d e : ClosureRegimeData) (h : d.jumps e = false) :
    classify (d.both e) = (classify d).costlier (classify e) :=
  flags_eq_costlier _ _ _ _ _ _ d.fin_scott d.fin_cof e.fin_scott e.fin_cof h

/-- A Scott-continuous datum with uncountable cofinality. -/
def scottUncountable : ClosureRegimeData :=
  ⟨true, false, false, fun h => (nomatch h), fun h => (nomatch h)⟩

/-- A transfinite-bounded datum. -/
def transfiniteDatum : ClosureRegimeData :=
  ⟨false, false, true, fun h => (nomatch h), fun h => (nomatch h)⟩

/-- **The jump, exhibited.** Scott and transfinite-bounded run together are aperiodic. -/
theorem classify_both_jump :
    classify scottUncountable = ClosureRegime.scott ∧
    classify transfiniteDatum = ClosureRegime.transfiniteBounded ∧
    classify (scottUncountable.both transfiniteDatum) = ClosureRegime.aperiodic := by
  decide

end Obsmetrologia
