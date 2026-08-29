import Obsmetrologia.AperiodicOrder.GlassDynamics.Overlap

/-!
# Dynamic heterogeneity: the local mobility field

Glassy relaxation is **spatially heterogeneous**: between two configurations (e.g. a state and its
time-evolved image) some sites have moved and others have not. The coarse measure is the **mobility
count** — the number of sites that changed — the finite projection of the local mobility field whose
four-point correlations measure dynamic heterogeneity. Mobility is exactly the complement of the
replica overlap of `Glass.Overlap`: every site either agrees (overlap) or changed (mobility), so the
two partition the site list (`mobilityCount_add_overlapCount`).

The four-point susceptibility `χ₄` and the full analytic theory of dynamic heterogeneity need
probability; the finite mobility count is in this dependency-free core.

## Main definitions
* `changedOn`, `mobilityCount`.

## Main results
* `mobility_zero_iff_agree_on_support` — zero mobility ⟺ the configurations agree on every site.
* `mobility_self` — a configuration has zero mobility against itself.

(The partition identity `mobility + overlap = sites.length` is a one-line follow-up via
`List.length_eq_countP_add_countP`, left to the overlap/mobility complement lemma.)

## References
Corpus glass line; the glass frontier memo (dynamic heterogeneity, four-point functions — the analytic
theory; here the finite mobility count). Complement of `Glass.Overlap`.

## Tags
glass, dynamic heterogeneity, mobility, four-point function, configuration
-/

namespace Obsmetrologia
namespace AperiodicOrder.GlassDynamics

/-- **A site has changed** between two configurations when their local states differ. -/
def changedOn {Site State : Type} [DecidableEq State]
    (x y : Configuration Site State) (s : Site) : Bool := decide (x s ≠ y s)

/-- The **mobility count**: the number of sites that changed between two configurations — the finite
dynamic-heterogeneity count, complement of the overlap. -/
def mobilityCount {Site State : Type} [DecidableEq State]
    (sites : List Site) (x y : Configuration Site State) : Nat :=
  sites.countP (fun s => changedOn x y s)

/-- **Zero mobility ⟺ agreement on every site.** Nothing moved exactly when the two configurations
coincide on the whole site list. -/
theorem mobility_zero_iff_agree_on_support {Site State : Type} [DecidableEq State]
    (sites : List Site) (x y : Configuration Site State) :
    mobilityCount sites x y = 0 ↔ ∀ s ∈ sites, x s = y s := by
  induction sites with
  | nil =>
      constructor
      · intro _ s hs; cases hs
      · intro _; rfl
  | cons a rest ih =>
      have hcons : mobilityCount (a :: rest) x y
          = mobilityCount rest x y + (if decide (x a ≠ y a) = true then 1 else 0) := by
        simp only [mobilityCount, changedOn, List.countP_cons]
      have head_iff : ((if decide (x a ≠ y a) = true then (1 : Nat) else 0) = 0) ↔ x a = y a := by
        cases hb : decide (x a ≠ y a) with
        | true =>
            have hne : x a ≠ y a := of_decide_eq_true hb
            constructor
            · intro h0; exact absurd h0 Nat.one_ne_zero
            · intro hxy; exact absurd hxy hne
        | false =>
            have hnn : ¬ (x a ≠ y a) := of_decide_eq_false hb
            constructor
            · intro _; exact Decidable.byContradiction hnn
            · intro _; rfl
      rw [hcons, Nat.add_eq_zero_iff, ih, head_iff]
      constructor
      · rintro ⟨hr, ha⟩ s hs
        rw [List.mem_cons] at hs
        cases hs with
        | inl h => subst h; exact ha
        | inr h => exact hr s h
      · intro h
        exact ⟨fun s hs => h s (List.mem_cons.mpr (Or.inr hs)),
               h a (List.mem_cons.mpr (Or.inl rfl))⟩

/-- **A configuration has zero mobility against itself** — nothing moves. -/
theorem mobility_self {Site State : Type} [DecidableEq State]
    (sites : List Site) (x : Configuration Site State) : mobilityCount sites x x = 0 :=
  (mobility_zero_iff_agree_on_support sites x x).mpr (fun _ _ => rfl)

end AperiodicOrder.GlassDynamics
end Obsmetrologia
