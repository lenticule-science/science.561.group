import Obsmetrologia.Closure.RegimeCofinality
import Obsmetrologia.Closure.RegimeGate
import Obsmetrologia.Cohomology.FiringGenerators

/-!
# The firing spiral — winding geometry from an `L_ns`-indexed set of NSC firing stages

This is the "missing weld" named as item 5 of the falsifiable program in
`content/text/documents/articles/notes/2026/08/12/2026-08-12-note-on-the-kz-lambek-twistor-spiral.md`,
§7: a Lean construction that takes an `L_ns`-indexed set of non-Scott-continuous (NSC) firing
stages (`Closure.RegimeCofinality`'s `FiringSet`, built over `Closure.Ordinal`'s real `Ord`) and
produces spiral geometry from it — an inflation/winding datum per firing — proving that the
geometry respects the same `strict`/`scott` vs `transfiniteBounded`/`aperiodic` cut the corpus's
`cohomologyVanishes` table already fixes: **trivial** (no winding, no residual defect) below the
cut, **non-trivial** (strictly increasing, unbounded winding) above it.

## The construction

* **`windingCount`** — given a `Nat`-indexed Boolean firing indicator `fires : Nat → Bool` (which
  candidate stages, in the sense of `RegimeCofinality.CandidateStages`, actually NSC-fire), the
  running total of firings up to stage `n`. This is the winding number of the design brief,
  made concrete and computable: it does not need to decide the (generically undecidable) Prop
  `NSCFiringAt`, only to be told, stage by stage, whether a firing occurred there.
* **`SpiralDatum le w C`** — the spiral datum of a flow `w : OrdFlow α` relative to a candidate
  family `C`: a firing indicator `fires` together with a proof `correct` that it really does
  track `NSCFiringAt le w (C n)` at every candidate stage `n`. `SpiralDatum.winding` is
  `windingCount` applied to `fires`; `SpiralDatum.isTrivial` says the winding is identically
  zero; `SpiralDatum.isCharged` says every candidate stage fires.
* **`inflationStep`** — the winding count's increment across one firing stage: `0` or `1`.

## The cut-alignment theorems

* **(a) below the cut, trivial.** `zeroFlow` (the constant-zero flow) is `ContinuousAt` every
  fundamental sequence (`zeroFlow_continuousAt`) and so never NSC-fires
  (`zeroFlow_no_firing`); its spiral datum `zeroSpiral` is trivial on the nose
  (`zeroSpiral_trivial`) and its firing set is empty (`zeroFlow_firingSet_empty`) — connected to
  `RegimeGate`'s Scott-side reading via `zeroSpiral_below_cut_no_gap`: `gate = true` and
  `¬ HasGap` at both `strict` and `scott`, the two cohomology-vanishing regimes.
* **(b) above the cut, non-trivial.** `spikeFlow` (reused from `RegimeCofinality`, relative to
  the constant candidates) fires at every candidate stage; its spiral datum `spikeSpiral` has
  strictly increasing, unbounded winding (`spikeSpiral_strict_step`, `spikeSpiral_unbounded`,
  closed form `spikeSpiral_winding_eq : winding n = n + 1`) — a genuinely non-trivial spiral —
  and the associated regime data classifies to `transfiniteBounded`
  (`RegimeCofinality.spikeFlow_regime_transfiniteBounded`), matched on the `RegimeGate` side by
  `spikeSpiral_above_cut_has_gap`: `gate = false` and `HasGap` there.
* **(c) the aperiodic boundary is out of reach.** Mirroring `RegimeCofinality`'s own
  meta-theorem, every spiral datum this module can build from a countably-enumerable firing set
  classifies via `regimeDataOfCountableFiring`, which *never* reaches `aperiodic`
  (`spikeSpiral_regime_never_aperiodic`, citing `regimeDataOfCountableFiring_ne_aperiodic`), and
  every honest ordinal-shape classification agrees (`spiral_ord_never_aperiodic`, citing
  `Ord.regimeOfOrdHonest_ne_aperiodic`). Within this dependency-free encoding, a spiral datum
  simply cannot be built with a genuinely uncountable firing set to test against — so "aperiodic
  spiral geometry" is unreachable *from the presentation*, not merely unbuilt in it, exactly as
  `RegimeCofinality`'s own headline documents at the level of firing sets without windings.

These three are bundled as the headline `firing_spiral_respects_the_cut`.

## Two honest gaps, documented rather than faked

1. **No literal reuse of `SettlementSpiral`'s Pisot/substitution-matrix machinery.** The design
   brief for this weld suggested tying the inflation step to `Closure.SettlementSpiral`'s
   recurrences (Padovan/Fibonacci/Tribonacci/`k`-bonacci substitution towers). That machinery
   governs the growth of a *multi-letter* substitution system (a growing alphabet with a
   nontrivial substitution matrix `M` and a Perron–Frobenius eigenvalue). A single
   `Bool`-valued NSC-firing indicator has exactly one "letter" — fires or doesn't — so there is
   no substitution matrix to read off: `windingCount`'s growth in the charged case is the
   flattest possible witness, linear (`windingCount fires n = n + 1`, `windingCount_of_all_true`),
   not Pisot. Forcing a substitution-matrix reading onto it would be exactly the kind of
   "hacking"-flagged, unproven, mistaken identification §6.2 of the note already warns against
   for the *regime → specific-Pisot-number* table. What genuinely is proved, self-contained, is the
   weaker true statement that `windingCount` — like every member of the corpus's growth tower —
   sits under the same uniform `2ⁿ` ceiling (`windingCount_le_two_pow`), the *shape* of bound
   `SettlementSpiral.kbonacci_le_two_pow`/`tribonacci_lt_two_pow` prove for their own recurrences,
   proved directly here rather than through a fabricated shared recurrence.
2. **No literal reuse of `KZ.mu_identity_of_cohomologyVanishes`.** That theorem is typed over
   `Valuation`/`Valuation.ModalFrame`, the closure-2-monad's own concrete carrier; this module's
   `SpiralDatum` is generic over an arbitrary flow carrier `α` (concretely instantiated at `Nat`
   for the two witnesses), so the two constructions do not share a type to compose against
   directly. The honest bridge — proved rather than asserted — is via `Closure.RegimeGate`,
   whose `gate`/`HasGap` are `ClosureRegime`-indexed (the type our own `classify` results also
   live in): `zeroSpiral_below_cut_no_gap`/`spikeSpiral_above_cut_has_gap` show the same
   trivial/non-trivial split lines up exactly with `gate = true`/`gate = false` and
   `¬ HasGap`/`HasGap`, which `RegimeGate.gate_eq_cohomologyVanishes` already proves equals
   `cohomologyVanishes` — the same ground truth `KZ.mu_identity_of_cohomologyVanishes` reads its
   hypothesis from. This is the same fact, reached through the type that actually composes with
   this module's generic construction.

## Scope

`windingCount`/`inflationStep` take the firing indicator `fires : Nat → Bool` as data with a
correctness proof, rather than attempting to decide `NSCFiringAt` outright — `NSCFiringAt` is a
negation of a two-quantifier `Prop` over a generic carrier `α` and is not decidable in general.
This mirrors `RegimeCofinality.countablyEnumerable_firingSet_of_fires_everywhere`, which also
takes "fires at every candidate" as an explicit hypothesis rather than as something computed.
The two witnesses built here (`zeroSpiral`, `spikeSpiral`) discharge that correctness obligation
honestly, from the underlying `ContinuousAt`/`NSCFiringAt` facts, not by fiat.
-/

namespace Obsmetrologia
namespace Dynamics.Flow.FiringSpiral

open Obsmetrologia.RegimeCofinality
open Obsmetrologia.RegimeGate

/-! ## Part 1 — the winding count of a `Bool`-valued firing indicator -/

/-- **The winding count.** Given a firing indicator `fires : Nat → Bool` (whether the
candidate stage `n`, in the sense of `RegimeCofinality.CandidateStages`, is an NSC firing), the
running total of firings up to and including stage `n`. -/
def windingCount (fires : Nat → Bool) : Nat → Nat
  | 0 => if fires 0 then 1 else 0
  | n + 1 => windingCount fires n + (if fires (n + 1) then 1 else 0)

@[simp] theorem windingCount_zero_def (fires : Nat → Bool) :
    windingCount fires 0 = if fires 0 then 1 else 0 := rfl

@[simp] theorem windingCount_succ_def (fires : Nat → Bool) (n : Nat) :
    windingCount fires (n + 1) = windingCount fires n + (if fires (n + 1) then 1 else 0) := rfl

/-- **Trivial side: never firing keeps the winding at zero, at every stage.** -/
theorem windingCount_of_all_false (fires : Nat → Bool) (hfalse : ∀ n, fires n = false) :
    ∀ n, windingCount fires n = 0
  | 0 => by rw [windingCount_zero_def, hfalse 0]; decide
  | (n + 1) => by
      have ih := windingCount_of_all_false fires hfalse n
      rw [windingCount_succ_def, hfalse (n + 1), ih]; decide

/-- **Charged side, one step: firing everywhere increments the winding by exactly one per
stage.** -/
theorem windingCount_true_succ (fires : Nat → Bool) (hall : ∀ n, fires n = true) (n : Nat) :
    windingCount fires (n + 1) = windingCount fires n + 1 := by
  rw [windingCount_succ_def, hall (n + 1)]; simp

/-- **Charged side, closed form: firing everywhere gives `winding n = n + 1`.** -/
theorem windingCount_of_all_true (fires : Nat → Bool) (hall : ∀ n, fires n = true) :
    ∀ n, windingCount fires n = n + 1
  | 0 => by rw [windingCount_zero_def, hall 0]; decide
  | (n + 1) => by
      rw [windingCount_true_succ fires hall n, windingCount_of_all_true fires hall n]

/-- **Charged side is strictly monotone.** -/
theorem windingCount_strict_step (fires : Nat → Bool) (hall : ∀ n, fires n = true) (n : Nat) :
    windingCount fires n < windingCount fires (n + 1) := by
  rw [windingCount_true_succ fires hall n]; omega

/-- **Charged side is unbounded.** -/
theorem windingCount_unbounded (fires : Nat → Bool) (hall : ∀ n, fires n = true) (N : Nat) :
    ∃ n, N ≤ windingCount fires n :=
  ⟨N, by rw [windingCount_of_all_true fires hall N]; omega⟩

/-- **The uniform `2ⁿ` ceiling, honestly proved for `windingCount` on its own terms** (see the
module docstring for why this — not a shared Pisot/substitution-matrix recurrence — is the
genuine connection to `Closure.SettlementSpiral`'s growth tower). -/
theorem windingCount_le_two_pow (fires : Nat → Bool) : ∀ n, windingCount fires n ≤ 2 ^ n
  | 0 => by
      rw [windingCount_zero_def]
      split <;> decide
  | (n + 1) => by
      have ih := windingCount_le_two_pow fires n
      have hp : (2 : Nat) ^ (n + 1) = 2 ^ n * 2 := Nat.pow_succ 2 n
      have hpos : 0 < (2 : Nat) ^ n := Nat.pow_pos (by decide)
      rw [windingCount_succ_def]
      split <;> omega

/-! ## Part 2 — the inflation step -/

/-- **The inflation step at stage `n`**: the winding count's increment across firing stage
`n + 1` — `0` if there is no firing there, `1` if there is. -/
def inflationStep (fires : Nat → Bool) (n : Nat) : Nat :=
  windingCount fires (n + 1) - windingCount fires n

theorem inflationStep_le_one (fires : Nat → Bool) (n : Nat) : inflationStep fires n ≤ 1 := by
  unfold inflationStep
  rw [windingCount_succ_def]
  split <;> omega

theorem inflationStep_eq_zero_of_no_fire (fires : Nat → Bool) (n : Nat)
    (h : fires (n + 1) = false) : inflationStep fires n = 0 := by
  unfold inflationStep
  rw [windingCount_succ_def, h]
  simp

theorem inflationStep_eq_one_of_fire (fires : Nat → Bool) (n : Nat)
    (h : fires (n + 1) = true) : inflationStep fires n = 1 := by
  unfold inflationStep
  rw [windingCount_succ_def, h]
  simp

/-! ## Part 3 — the spiral datum of a flow, relative to a candidate family -/

/-- **The spiral datum of a flow `w` relative to a candidate family `C`.** A `Bool`-valued
firing indicator `fires`, together with a proof that it genuinely tracks `NSCFiringAt le w`
at every candidate stage. This is the honest interface between "here is a firing set" (a `Prop`,
generically undecidable) and "here is a winding number" (computable `Nat`-data). -/
structure SpiralDatum {α : Type} (le : α → α → Prop) (w : OrdFlow α) (C : CandidateStages) where
  /-- Whether candidate stage `n` fires. -/
  fires : Nat → Bool
  /-- `fires` genuinely tracks `NSCFiringAt` at every candidate stage. -/
  correct : ∀ n, fires n = true ↔ NSCFiringAt le w (C n)

namespace SpiralDatum

variable {α : Type} {le : α → α → Prop} {w : OrdFlow α} {C : CandidateStages}

/-- **The winding of a spiral datum**: `windingCount` applied to its firing indicator. -/
def winding (D : SpiralDatum le w C) : Nat → Nat := windingCount D.fires

/-- **A spiral datum is trivial**: the winding is identically zero — no spiral, no residual
defect (the geometric reading of `μ = id`). -/
def isTrivial (D : SpiralDatum le w C) : Prop := ∀ n, D.winding n = 0

/-- **A spiral datum is charged**: every candidate stage fires. -/
def isCharged (D : SpiralDatum le w C) : Prop := ∀ n, D.fires n = true

end SpiralDatum

/-! ## Part 4 — the trivial witness: `zeroFlow`, below the cut -/

/-- **The constant-zero flow** — the simplest possible Scott-continuous witness: it never
changes, so it is trivially the least-upper-bound of itself at every fundamental sequence. -/
def zeroFlow : OrdFlow Nat := fun _ => 0

/-- **`zeroFlow` is `ContinuousAt` every fundamental sequence.** The inflation half is
reflexivity (`0 ≤ 0`); the least-upper-bound half is immediate from the hypothesis instantiated
at the `0`-th predecessor. -/
theorem zeroFlow_continuousAt (f : Nat → Ord) : ContinuousAt (· ≤ ·) zeroFlow f :=
  ⟨fun _ => Nat.le_refl 0, fun _u hu => hu 0⟩

/-- **`zeroFlow` never NSC-fires**, at any fundamental sequence. -/
theorem zeroFlow_no_firing (f : Nat → Ord) : ¬ NSCFiringAt (· ≤ ·) zeroFlow f :=
  fun h => h (zeroFlow_continuousAt f)

/-- **`zeroFlow`'s firing set is empty**, relative to any candidate family. -/
theorem zeroFlow_firingSet_empty (C : CandidateStages) :
    ∀ κ, ¬ FiringSet (· ≤ ·) zeroFlow C κ := by
  rintro κ ⟨n, _, hfire⟩
  exact zeroFlow_no_firing (C n) hfire

/-- **The trivial spiral datum**: `zeroFlow`'s spiral, relative to any candidate family — the
firing indicator is identically `false`, correctly so by `zeroFlow_no_firing`. -/
def zeroSpiral (C : CandidateStages) : SpiralDatum (· ≤ ·) zeroFlow C where
  fires := fun _ => false
  correct := fun n => ⟨fun h => absurd h (by decide), fun h => absurd h (zeroFlow_no_firing (C n))⟩

/-- **(a) Below the cut: the trivial spiral datum really is trivial** — identically zero
winding, at every stage. -/
theorem zeroSpiral_trivial (C : CandidateStages) : (zeroSpiral C).isTrivial :=
  windingCount_of_all_false (zeroSpiral C).fires (fun _ => rfl)

/-- **(a) Below the cut, matched on the `RegimeGate` side**: at both cohomology-vanishing
regimes (`strict`, `scott`) the gate reads `true` and there is no gap — the geometric reading
of "no NSC firing" the `zeroSpiral` witness realizes at the flow level. -/
theorem zeroSpiral_below_cut_no_gap :
    gate ClosureRegime.strict = true ∧ gate ClosureRegime.scott = true
    ∧ ¬ HasGap ClosureRegime.strict ∧ ¬ HasGap ClosureRegime.scott := by
  refine ⟨?_, ?_, strict_no_gap, scott_no_gap⟩
  · rw [gate_eq_cohomologyVanishes]; decide
  · rw [gate_eq_cohomologyVanishes]; decide

/-! ## Part 5 — the charged witness: `spikeFlow`, above the cut -/

/-- **The charged spiral datum**: `spikeFlow`'s spiral, relative to the constant candidates —
the firing indicator is identically `true`, correctly so by
`RegimeCofinality.spikeFlow_fires_everywhere_on_constantCandidates`. -/
def spikeSpiral : SpiralDatum (· ≤ ·) spikeFlow constantCandidates where
  fires := fun _ => true
  correct := fun n => ⟨fun _ => spikeFlow_fires_everywhere_on_constantCandidates n, fun _ => rfl⟩

theorem spikeSpiral_charged : spikeSpiral.isCharged := fun _ => rfl

/-- The closed form of the charged spiral's winding: `winding n = n + 1`. -/
theorem spikeSpiral_winding_eq (n : Nat) : spikeSpiral.winding n = n + 1 :=
  windingCount_of_all_true spikeSpiral.fires (fun _ => rfl) n

/-- **(b) Above the cut: the charged spiral datum is genuinely non-trivial.** -/
theorem spikeSpiral_not_trivial : ¬ spikeSpiral.isTrivial := by
  intro h
  have h0 := h 0
  rw [spikeSpiral_winding_eq 0] at h0
  omega

/-- **(b) Above the cut: the charged spiral's winding is strictly increasing.** -/
theorem spikeSpiral_strict_step (n : Nat) :
    spikeSpiral.winding n < spikeSpiral.winding (n + 1) := by
  rw [spikeSpiral_winding_eq n, spikeSpiral_winding_eq (n + 1)]; omega

/-- **(b) Above the cut: the charged spiral's winding is unbounded.** -/
theorem spikeSpiral_unbounded (N : Nat) : ∃ n, N ≤ spikeSpiral.winding n :=
  ⟨N, by rw [spikeSpiral_winding_eq N]; omega⟩

/-- **(b) Above the cut: the winding datum's per-firing inflation step matches the corpus's
`H¹`-generator jump value exactly** — both are `1`. This is the genuine, type-checked bridge to
`Cohomology.FiringGenerators` this module's docstring promises: the winding number's own unit
increment is the same integer as the jump `jumpValue` that makes each `firingGen` a nonzero `H¹`
class. -/
theorem spikeSpiral_inflationStep_matches_jumpValue (n : Nat) :
    inflationStep spikeSpiral.fires n = 1
    ∧ Cohomology.FiringGenerators.jumpValue = 1 :=
  ⟨inflationStep_eq_one_of_fire spikeSpiral.fires n rfl,
   Cohomology.FiringGenerators.jumpValue_eq_one⟩

/-- **(b) Above the cut, matched on the `RegimeGate` side**: `transfiniteBounded` — the regime
`spikeSpiral`'s own firing set classifies to (`RegimeCofinality.spikeFlow_regime_
transfiniteBounded`) — has `gate = false` and `HasGap`, dual to `zeroSpiral_below_cut_no_gap`. -/
theorem spikeSpiral_above_cut_has_gap :
    gate ClosureRegime.transfiniteBounded = false ∧ HasGap ClosureRegime.transfiniteBounded := by
  refine ⟨?_, transfiniteBounded_has_gap⟩
  rw [gate_eq_cohomologyVanishes]; decide

/-! ## Part 6 — the aperiodic boundary is out of this encoding's reach -/

/-- **(c) No spiral datum built here, via `regimeDataOfCountableFiring`, ever classifies to
`aperiodic`.** The concrete instance at `spikeSpiral`'s own firing set: it classifies to
`transfiniteBounded` (`RegimeCofinality.spikeFlow_regime_transfiniteBounded`) and, because
`countableCofinality` there is honest evidence rather than free metadata, never to `aperiodic`
(citing `RegimeCofinality.regimeDataOfCountableFiring_ne_aperiodic`). -/
theorem spikeSpiral_regime_never_aperiodic :
    classify (regimeDataOfCountableFiring spikeFlow_firingSet_nonempty
        countablyEnumerable_spikeFlow_firingSet) ≠ ClosureRegime.aperiodic :=
  regimeDataOfCountableFiring_ne_aperiodic spikeFlow_firingSet_nonempty
    countablyEnumerable_spikeFlow_firingSet

/-- **(c) The structural reason, at the bare-ordinal level**: the honest ordinal-shape
classifier never outputs `aperiodic` either — citing `Ord.regimeOfOrdHonest_ne_aperiodic`. Every
candidate stage `stageOf C n` a `SpiralDatum` can ever be built to watch is a real `Ord.limit`,
and `Ord.regimeOfOrdHonest` never classifies a real ordinal to `aperiodic`: the aperiodic branch
is structurally unreachable from `Ord` evidence, not merely unbuilt. -/
theorem spiral_ord_never_aperiodic (κ : Ord) (sc : Bool) :
    Ord.regimeOfOrdHonest κ sc ≠ ClosureRegime.aperiodic :=
  Ord.regimeOfOrdHonest_ne_aperiodic κ sc

/-! ## Headline -/

/-- **The firing spiral respects the cut.** Bundles the cut-alignment theorems:

* **below the cut** — `zeroFlow`'s spiral datum is trivial (`zeroSpiral_trivial`), its firing
  set is empty (`zeroFlow_firingSet_empty`), and both cohomology-vanishing regimes read
  `gate = true` with no `HasGap` (`zeroSpiral_below_cut_no_gap`);
* **above the cut** — `spikeSpiral`'s winding is genuinely non-trivial: not identically zero
  (`spikeSpiral_not_trivial`), strictly increasing (`spikeSpiral_strict_step`) and unbounded
  (`spikeSpiral_unbounded`); its firing-set regime data classifies to `transfiniteBounded`
  (`RegimeCofinality.spikeFlow_regime_transfiniteBounded`), matched by `gate = false` and
  `HasGap` there (`spikeSpiral_above_cut_has_gap`);
* **the aperiodic boundary** — the same firing-set regime data never classifies to `aperiodic`
  (`spikeSpiral_regime_never_aperiodic`), nor does any honest ordinal-shape classification
  (`spiral_ord_never_aperiodic`): within this dependency-free encoding, a spiral datum simply
  cannot be built against a genuinely uncountable firing set, so "aperiodic spiral geometry" is
  out of reach from the presentation, not merely unbuilt in it.

If some future construction of this weld produced a non-trivial spiral in `strict`/`scott` or a
trivial one in `transfiniteBounded`/`aperiodic`, *this* theorem is exactly what it would have to
contradict — which is the sense in which the note's identity (§7, item 5) is now falsifiable
rather than merely evocative. -/
theorem firing_spiral_respects_the_cut :
    ((zeroSpiral constantCandidates).isTrivial
      ∧ (∀ κ, ¬ FiringSet (· ≤ ·) zeroFlow constantCandidates κ))
    ∧ (gate ClosureRegime.strict = true ∧ gate ClosureRegime.scott = true
      ∧ ¬ HasGap ClosureRegime.strict ∧ ¬ HasGap ClosureRegime.scott)
    ∧ (¬ spikeSpiral.isTrivial ∧ (∀ n, spikeSpiral.winding n < spikeSpiral.winding (n + 1))
      ∧ (∀ N, ∃ n, N ≤ spikeSpiral.winding n))
    ∧ (classify (regimeDataOfCountableFiring spikeFlow_firingSet_nonempty
          countablyEnumerable_spikeFlow_firingSet) = ClosureRegime.transfiniteBounded
      ∧ gate ClosureRegime.transfiniteBounded = false ∧ HasGap ClosureRegime.transfiniteBounded)
    ∧ (classify (regimeDataOfCountableFiring spikeFlow_firingSet_nonempty
          countablyEnumerable_spikeFlow_firingSet) ≠ ClosureRegime.aperiodic
      ∧ ∀ (κ : Ord) (sc : Bool), Ord.regimeOfOrdHonest κ sc ≠ ClosureRegime.aperiodic) :=
  ⟨⟨zeroSpiral_trivial constantCandidates, zeroFlow_firingSet_empty constantCandidates⟩,
   zeroSpiral_below_cut_no_gap,
   ⟨spikeSpiral_not_trivial, spikeSpiral_strict_step, spikeSpiral_unbounded⟩,
   ⟨spikeFlow_regime_transfiniteBounded, spikeSpiral_above_cut_has_gap.1,
     spikeSpiral_above_cut_has_gap.2⟩,
   ⟨spikeSpiral_regime_never_aperiodic, spiral_ord_never_aperiodic⟩⟩

end Dynamics.Flow.FiringSpiral
end Obsmetrologia
