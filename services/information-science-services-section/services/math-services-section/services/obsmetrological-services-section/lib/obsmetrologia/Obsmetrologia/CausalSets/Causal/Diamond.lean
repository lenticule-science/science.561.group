import Obsmetrologia.CausalSets.Dimension.OrderingFraction
import Obsmetrologia.CausalSets.Causal.Cone
import Obsmetrologia.CausalSets.Causal.Laplacian

/-!
# The diamond's causal-spectral portrait — the canonical worked example

The four-event causal diamond is Obsmetrologia's demonstration object. `MyrheimMeyer` already gives its
rational geometry ($r=5/6$), Euler characteristic, and classifying data; this module assembles those
with the cone-field, spacelike, and causal-Laplacian readings into one portrait
\[
  \text{diamond} = (r = 5/6 \mid \chi = 5 \mid \mathrm{clInv} = 0 \mid b \perp c \mid
  \text{harmonic causal closure} \mid \text{gap-one diffusion}).
\]
The diamond's settled order `diamondPrec` is already transitive and irreflexive, so it packages
directly as a `CausalSet (Fin 4)` (its acyclicity witness is `decide`-checked). The middle pair
`b, c` is spacelike at the causal-set level, proved by reflecting `reaches` into the Boolean order.

## Main definitions

* `diamondCausalSet` — the four-event diamond as a `CausalSet (Fin 4)`.

## Main results

* `reaches_imp_prec` — path reachability collapses to the (already transitive) Boolean order.
* `diamond_b_spacelike_c` — the middle pair is spacelike.
* `diamond_closedFuture_harmonic` — every reflexive future cone is harmonic for the causal Laplacian.
* `diamond_spectral_spacetime_portrait` — the bundled portrait.

## References

`content/.../lorentzian-causal-settling`, `content/.../myrheim-meyer-dimension`. Built on
`Obsmetrologia.CausalSets.Dimension.OrderingFraction`, `ConeField`, `CausalLaplacian`.

## Tags

causal diamond, Myrheim--Meyer, spacelike, harmonic, causal Laplacian, worked example
-/

namespace Obsmetrologia
namespace CausalSets.Causal.Diamond

open Obsmetrologia.CausalSets.Causal.Order
open Obsmetrologia.CausalSets.Causal.Cone
open Obsmetrologia.CausalSets.Causal.Laplacian

/-! ## (A) The diamond as a causal set -/

/-- The diamond order is transitive (it is already its own transitive closure). -/
theorem diamond_trans : ∀ a b c : Fin 4,
    CausalSets.Dimension.OrderingFraction.diamondPrec a b = true → CausalSets.Dimension.OrderingFraction.diamondPrec b c = true →
    CausalSets.Dimension.OrderingFraction.diamondPrec a c = true := by decide

/-- The diamond order is irreflexive — no closed timelike curve. -/
theorem diamond_irrefl : ∀ v : Fin 4, ¬ CausalSets.Dimension.OrderingFraction.diamondPrec v v = true := by decide

/-- The four-event causal diamond as a `CausalSet (Fin 4)`: the seed `≺₀` is the (already
transitive, irreflexive) diamond order, so the acyclicity witness is the order itself. -/
def diamondCausalSet : CausalSet (Fin 4) where
  events := CausalSets.Dimension.OrderingFraction.fourEvents
  events_nodup := CausalSets.Dimension.OrderingFraction.fourEvents_nodup
  prec0 := CausalSets.Dimension.OrderingFraction.diamondPrec
  acyclic :=
    { lt := fun u v => CausalSets.Dimension.OrderingFraction.diamondPrec u v = true
      edge_lt := fun h => h
      lt_trans := fun hab hbc => diamond_trans _ _ _ hab hbc
      lt_irrefl := fun v => diamond_irrefl v }

/-! ## (B) Reachability collapses to the Boolean order -/

/-- Every directed `≺₀`-path in the diamond is already a single Boolean order step — the diamond
order is transitively closed, so `reaches` adds nothing. -/
theorem reaches_imp_prec {a b : Fin 4} (h : diamondCausalSet.reaches a b) :
    CausalSets.Dimension.OrderingFraction.diamondPrec a b = true := by
  induction h with
  | last hab => exact hab
  | cons hab _ ih => exact diamond_trans _ _ _ hab ih

/-! ## (C) The cone portrait (Boolean counts) -/

/-- Strict future cone of the bottom apex `a = 0`: `{b, c, d}`, three events. -/
theorem diamond_future_count_a :
    (CausalSets.Dimension.OrderingFraction.fourEvents.filter (fun x => CausalSets.Dimension.OrderingFraction.diamondPrec 0 x)).length = 3 := by decide

/-- Strict future cone of `b = 1`: `{d}`, one event. -/
theorem diamond_future_count_b :
    (CausalSets.Dimension.OrderingFraction.fourEvents.filter (fun x => CausalSets.Dimension.OrderingFraction.diamondPrec 1 x)).length = 1 := by decide

/-- Strict future cone of `c = 2`: `{d}`, one event. -/
theorem diamond_future_count_c :
    (CausalSets.Dimension.OrderingFraction.fourEvents.filter (fun x => CausalSets.Dimension.OrderingFraction.diamondPrec 2 x)).length = 1 := by decide

/-- Strict future cone of the top apex `d = 3`: empty. -/
theorem diamond_future_count_d :
    (CausalSets.Dimension.OrderingFraction.fourEvents.filter (fun x => CausalSets.Dimension.OrderingFraction.diamondPrec 3 x)).length = 0 := by decide

/-- Strict past cone of the top apex `d = 3`: `{a, b, c}`, three events. -/
theorem diamond_past_count_d :
    (CausalSets.Dimension.OrderingFraction.fourEvents.filter (fun x => CausalSets.Dimension.OrderingFraction.diamondPrec x 3)).length = 3 := by decide

/-! ## (D) The spacelike middle pair -/

/-- The middle pair `b = 1`, `c = 2` is Boolean-incomparable. -/
theorem diamond_b_c_bool :
    CausalSets.Dimension.OrderingFraction.diamondPrec 1 2 = false ∧ CausalSets.Dimension.OrderingFraction.diamondPrec 2 1 = false := by decide

/-- The middle pair is spacelike at the causal-set level: neither reaches the other. -/
theorem diamond_b_spacelike_c : CausalSets.Causal.Cone.Spacelike diamondCausalSet 1 2 := by
  refine ⟨fun h => ?_, fun h => ?_⟩
  · exact absurd (reaches_imp_prec h) (by decide)
  · exact absurd (reaches_imp_prec h) (by decide)

/-! ## (E) Harmonic causal closure and gap-one diffusion -/

/-- Every reflexive future cone of the diamond is harmonic for the causal Laplacian. -/
theorem diamond_closedFuture_harmonic (x : Fin 4) :
    CausalSets.Causal.Laplacian.IsHarmonic diamondCausalSet (CausalSets.Causal.Cone.ClosedFuture diamondCausalSet x) := by
  refine (CausalSets.Causal.Laplacian.harmonic_iff_futureClosed diamondCausalSet _).mpr ?_
  intro p q hp hpq
  exact CausalSets.Causal.Cone.causalLe_trans diamondCausalSet hp hpq

/-! ## (F) The bundled portrait -/

/-- **The diamond's full causal-spectral portrait.** Rational geometry $r=5/6$, Euler
characteristic $\chi=5$, vanishing classifying invariant, the spacelike middle pair (Boolean and
causal-set level), and gap-one causal-Laplacian diffusion. -/
theorem diamond_spectral_spacetime_portrait :
    CausalSets.Dimension.OrderingFraction.orderingFraction CausalSets.Dimension.OrderingFraction.fourEvents CausalSets.Dimension.OrderingFraction.diamondPrec
        = CausalSets.Dimension.OrderingFraction.fiveSixths
    ∧ CausalSets.Dimension.OrderingFraction.eulerChar CausalSets.Dimension.OrderingFraction.fourEvents CausalSets.Dimension.OrderingFraction.diamondPrec = 5
    ∧ CausalSets.Dimension.OrderingFraction.strictClassifying.clInv = 0
    ∧ CausalSets.Dimension.OrderingFraction.diamondPrec 1 2 = false ∧ CausalSets.Dimension.OrderingFraction.diamondPrec 2 1 = false
    ∧ CausalSets.Causal.Cone.Spacelike diamondCausalSet 1 2
    ∧ (∀ S, CausalSets.Causal.Laplacian.causalLaplacian diamondCausalSet
              (CausalSets.Causal.Laplacian.causalLaplacian diamondCausalSet S)
            = CausalSets.Causal.Laplacian.causalLaplacian diamondCausalSet S) :=
  ⟨CausalSets.Dimension.OrderingFraction.diamond_spacetime_portrait.1,
   CausalSets.Dimension.OrderingFraction.diamond_spacetime_portrait.2.1,
   CausalSets.Dimension.OrderingFraction.diamond_spacetime_portrait.2.2,
   diamond_b_c_bool.1,
   diamond_b_c_bool.2,
   diamond_b_spacelike_c,
   fun S => CausalSets.Causal.Laplacian.causalClosure_idem diamondCausalSet S⟩

end CausalSets.Causal.Diamond
end Obsmetrologia
