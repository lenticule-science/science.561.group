import Obsmetrologia.AperiodicOrder.Tiling.Moduli
import Obsmetrologia.AperiodicOrder.Tiling.StepN.MetallicPowerLens
import Obsmetrologia.Closure.Ordinal

/-!
# Metallic moduli witnesses

This module connects the substitution moduli carrier from `Moduli` with the StepN metallic
power lens without making either side depend on the other. The bridge is deliberately one-way:
a step-`n` moduli representative yields a finite ordinal witness and the metallic recurrence at
that same StepN coordinate. The converse classification of arbitrary moduli points by a
metallic lens is not asserted here.

## Main definitions

* `MetallicModuliWitness` — a step-rule representative of a moduli point whose public stage
  is an ordinal `κ`, with `κ = ofNat n` for the underlying finite StepN coordinate.

## Main results

* `metallicModuliWitness_of_rule` — an explicit rule yields a witness at `ofNat n`.
* `metallicModuliWitness_exists_of_M` — membership in `M n p` entails such a witness.
* `metallicModuliWitness_isFinite` and `metallicModuliWitness_regime_strict` — the witness
  uses the ordinal's own finite shape.
* `metallicModuliWitness_power_expansion` — the same StepN coordinate carries the metallic
  power expansion.
* `MetallicModuliWitness.shift` — step-shift advances the witness by ordinal successor while
  preserving the moduli point.
-/

namespace Obsmetrologia
namespace AperiodicOrder.Tiling.Moduli

open Obsmetrologia.AperiodicOrder.Tiling.StepN

/-- A **metallic substitution-moduli witness** at ordinal stage `κ`: a concrete step-`n`
substitution rule realizing the moduli point `p`, together with the proof that the exposed
ordinal stage is the finite ordinal `ofNat n`.

The stage `n` is still needed for `Fin n` substitution data, but the public clock of the witness
is `κ : Ord`; the finite Nat stage is a coordinate of the richer ordinal witness. -/
structure MetallicModuliWitness (κ : Ord) (p : ModuliPoint) where
  /-- The finite StepN coordinate whose ordinal image is `κ`. -/
  stage : Nat
  /-- The primitive step rule realizing the moduli point. -/
  rule : StepRule stage
  /-- The rule realizes the advertised moduli point. -/
  realizes : toModuli rule = p
  /-- The closure clock is the finite ordinal attached to the StepN coordinate. -/
  ordinal_eq : κ = Ord.ofNat stage

/-- An explicit step-`n` rule carries a metallic substitution-moduli witness at the finite
ordinal `ofNat n`. -/
def metallicModuliWitness_of_rule {n : Nat} (r : StepRule n) :
    MetallicModuliWitness (Ord.ofNat n) (toModuli r) :=
  { stage := n, rule := r, realizes := rfl, ordinal_eq := rfl }

/-- Every realized step-`n` moduli point entails a metallic substitution-moduli witness at
the finite ordinal `ofNat n`. This is a proposition-level extraction because `M n p` is a
`Prop` existential. -/
theorem metallicModuliWitness_exists_of_M {n : Nat} {p : ModuliPoint} (h : M n p) :
    ∃ w : MetallicModuliWitness (Ord.ofNat n) p, w.stage = n := by
  obtain ⟨r, hp⟩ := h
  exact ⟨{ stage := n, rule := r, realizes := hp, ordinal_eq := rfl }, rfl⟩

/-- A metallic substitution-moduli witness lies in the step sub-stack named by its finite
coordinate. -/
theorem MetallicModuliWitness.mem_M {κ : Ord} {p : ModuliPoint}
    (w : MetallicModuliWitness κ p) : M w.stage p :=
  ⟨w.rule, w.realizes⟩

/-- The ordinal carried by a metallic substitution-moduli witness is finite. -/
theorem metallicModuliWitness_isFinite {κ : Ord} {p : ModuliPoint}
    (w : MetallicModuliWitness κ p) : κ.isFinite = true := by
  cases w with
  | mk stage rule realizes ordinal_eq =>
    cases ordinal_eq
    exact Ord.ofNat_isFinite stage

/-- A metallic substitution-moduli witness reads as the strict closure regime from its ordinal
shape. -/
theorem metallicModuliWitness_regime_strict {κ : Ord} {p : ModuliPoint}
    (w : MetallicModuliWitness κ p) (sc cc : Bool) :
    Ord.regimeOfOrd κ sc cc = ClosureRegime.strict := by
  cases w with
  | mk stage rule realizes ordinal_eq =>
    cases ordinal_eq
    exact Ord.finite_ord_is_strict stage sc cc

/-- The metallic power expansion attached to the same StepN coordinate as a moduli witness. -/
theorem metallicModuliWitness_power_expansion {κ : Ord} {p : ModuliPoint}
    (w : MetallicModuliWitness κ p) :
    ∀ k : Nat,
      zpow (metallicZ w.stage) k =
        (coef w.stage k).1 * metallicZ w.stage + (coef w.stage k).2 := by
  intro k
  exact metallic_power_expansion w.stage k

/-- Step-shift advances a metallic substitution-moduli witness by ordinal successor while
preserving the realized moduli point. -/
def MetallicModuliWitness.shift {κ : Ord} {p : ModuliPoint}
    (w : MetallicModuliWitness κ p) : MetallicModuliWitness (Ord.succ κ) p where
  stage := w.stage + 1
  rule := stepShift w.rule
  realizes := (toModuli_stepShift w.rule).trans w.realizes
  ordinal_eq := by
    cases w with
    | mk stage rule realizes ordinal_eq =>
      cases ordinal_eq
      rfl

/-- The metallic/moduli bridge currently proved: step-substack membership yields an ordinal
metallic witness; every such witness has finite/strict ordinal shape, realizes its moduli
sub-stack, and carries the metallic power expansion at the same StepN coordinate. -/
theorem metallic_moduli_bridge :
    (∀ {n : Nat} {p : ModuliPoint}, M n p →
      ∃ w : MetallicModuliWitness (Ord.ofNat n) p, w.stage = n)
    ∧ (∀ {κ : Ord} {p : ModuliPoint} (w : MetallicModuliWitness κ p),
      κ.isFinite = true
        ∧ (∀ sc cc : Bool, Ord.regimeOfOrd κ sc cc = ClosureRegime.strict)
        ∧ M w.stage p
        ∧ ∀ k : Nat,
          zpow (metallicZ w.stage) k =
            (coef w.stage k).1 * metallicZ w.stage + (coef w.stage k).2)
    ∧ (∀ {κ : Ord} {p : ModuliPoint} (w : MetallicModuliWitness κ p),
      (MetallicModuliWitness.shift w).realizes =
        (toModuli_stepShift w.rule).trans w.realizes) :=
  ⟨fun h => metallicModuliWitness_exists_of_M h,
   fun w =>
    ⟨metallicModuliWitness_isFinite w,
     fun sc cc => metallicModuliWitness_regime_strict w sc cc,
     w.mem_M,
     metallicModuliWitness_power_expansion w⟩,
   fun _ => rfl⟩

end AperiodicOrder.Tiling.Moduli
end Obsmetrologia
