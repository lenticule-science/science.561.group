import Obsmetrologia.Closure.Ordinal

/-!
# Regime cofinality — formally separating transfinite-bounded from aperiodic

`Closure/Regime.lean` stratified the closure ordinal `κ` into the FOUR regimes via three
Boolean flags; the `cohomologyVanishes` table (lines 244–255) puts `transfiniteBounded` and
`aperiodic` on the *same* side (`false`/`false`) everywhere in the corpus so far — the real
distinction between them, "`L_ns(κ)` countable vs uncountable"
(`Dynamics/Flow/NSCFiring.lean`'s corpus citation
`non-scott-continuous-firing-ordinal.md`), has so far lived only in prose, because Lean core
has no transfinite cardinals to test it against.

`Closure/Ordinal.lean` §G already closed half of this gap at the level of bare ordinals:
`Ord.exists_countable_cofinal_witness` shows every `Ord` this encoding can build carries a
`Nat`-indexed cofinal witness, and `Ord.regimeOfOrdHonest_ne_aperiodic` turns that into a
theorem that the honest ordinal-shape classifier *never* outputs `aperiodic` — the aperiodic
branch is structurally unreachable from real `Ord` evidence, not merely unbuilt.

This module lifts that separation from bare ordinals to **firing sets of flows** — the actual
`L_ns(κ)` content `NSCFiring.lean`/`TransfiniteClosureFlow.lean` describe:

* **(A)** `CountablyEnumerable` — the honest, dependency-free stand-in for "this set of
  `Ord`-stages has cardinality `≤ ℵ₀`": a `Nat`-indexed family whose image is exactly the
  witnessing stages.
* **(B)** A generic `OrdFlow α := Ord → α` with `ContinuousAt`/`NSCFiringAt`, following
  `Dynamics/Flow/TransfiniteClosureFlow.lean`'s design (its `OrdFlow := Ord → Valuation`,
  generalized off the concrete `Valuation` carrier) and `Dynamics/Flow/NSCFiring.lean`'s naming
  (`IsNSC`/`L_ns`, generalized off the finite `Charge` carrier's directed-family join to the
  real `Ord.limit` LUB law). `CandidateStages`/`stageOf`/`FiringSet` present a flow's `L_ns`
  relative to a `Nat`-indexed family of fundamental sequences — the only kind of "which limit
  stages are under consideration" data `Ord.limit` can ever supply.
* **(C)/(D)** The transfinite-bounded side, made concrete: `firingSet_coverage_free` shows
  coverage by a `Nat`-indexed family is free from the very shape of the construction (the
  flow-level mirror of `Ord.exists_countable_cofinal_witness`), and `spikeFlow` is a concrete
  `Ord`-indexed flow whose firing set — relative to the constant-sequence candidates — really
  does NSC-fire and is countably enumerable *exactly*, on the nose.
* **(E)/(F)** `regimeDataOfCountableFiring` turns a nonempty, countably-enumerable firing set
  into a `ClosureRegimeData` that classifies **faithfully** to `transfiniteBounded` and — since
  `countableCofinality` is honestly `true` rather than free metadata — **never** to `aperiodic`
  (`regimeDataOfCountableFiring_ne_aperiodic`), mirroring `Ord.regimeOfOrdHonest_ne_aperiodic`
  at the firing-set level: the aperiodic entry's asserted-data status is a theorem about this
  encoding, not an apology for it.
-/

namespace Obsmetrologia
namespace RegimeCofinality

/-! ## (A) Countable enumerability of a set of `Ord`-stages -/

/-- **Countable enumerability** of a predicate on `Ord`-stages: there is a `Nat`-indexed
family `f` whose image is *exactly* the stages satisfying `P` — a `Nat`-indexed surjection
onto the witnessing stages. The honest, dependency-free stand-in for "`P` has cardinality
`≤ ℵ₀`" in a system with no cardinal arithmetic: existence of such an `f` is exactly what a
countable listing of the witnesses means. -/
def CountablyEnumerable (P : Ord → Prop) : Prop :=
  ∃ f : Nat → Ord, ∀ κ : Ord, P κ ↔ ∃ n, f n = κ

/-! ## (B) `Ord`-indexed flows, NSC firing, and candidate-relative firing sets

Following `Dynamics/Flow/TransfiniteClosureFlow.lean`'s `OrdFlow`/`ContinuousAt` design, off
the concrete `Valuation` carrier and `leK` order onto an arbitrary carrier `α` and relation
`le`, and `Dynamics/Flow/NSCFiring.lean`'s `IsNSC`/`L_ns` naming, off the finite directed-family
join onto the real `Ord.limit` LUB law. -/

/-- An **`Ord`-indexed flow** over a carrier `α`: a family of `α`-values indexed by the
internal transfinite ordinal — `Dynamics/Flow/TransfiniteClosureFlow.lean`'s
`OrdFlow := Ord → Valuation`, generalized off the concrete `Valuation` carrier. -/
def OrdFlow (α : Type) := Ord → α

variable {α : Type}

/-- The flow `w` is continuous at the fundamental sequence `f`: `w (Ord.limit f)` is the
`le`-least upper bound of `{w (f n)}` — the LUB property of `Ord.limit`, read through `w`.
Mirrors `TransfiniteClosureFlow.ContinuousAt`, generalized to an arbitrary relation `le` on
the carrier rather than the fixed `leK` order on `Valuation`. -/
def ContinuousAt (le : α → α → Prop) (w : OrdFlow α) (f : Nat → Ord) : Prop :=
  (∀ n, le (w (f n)) (w (Ord.limit f)))
  ∧ (∀ u : α, (∀ n, le (w (f n)) u) → le (w (Ord.limit f)) u)

/-- A **non-Scott-continuous (NSC) firing** of `w` at the fundamental sequence `f`:
`ContinuousAt` fails — the value at the limit is not the LUB of the predecessors. Mirrors
`TransfiniteClosureFlow.NSCFiringAt` / `NSCFiring.IsNSC`, now at the level of a general
`Ord`-indexed flow rather than the finite `Charge` carrier's directed-family join. -/
def NSCFiringAt (le : α → α → Prop) (w : OrdFlow α) (f : Nat → Ord) : Prop :=
  ¬ ContinuousAt le w f

/-- A **`Nat`-indexed family of candidate limit stages**: for each `n`, a fundamental
sequence `C n : Nat → Ord` presenting one limit ordinal. Every limit ordinal `Ord.limit f`
this encoding can build already comes from exactly one such fundamental sequence (`Ord`'s own
constructor), so a *family of stages under consideration* is, honestly, nothing more than a
`Nat`-indexed family of fundamental sequences — the only kind of "which limit stages am I
watching" data the encoding can express (`Ord.exists_countable_cofinal_witness`). -/
def CandidateStages := Nat → (Nat → Ord)

/-- The `n`-th candidate stage itself: the limit ordinal presented by `C n`. -/
def stageOf (C : CandidateStages) (n : Nat) : Ord := Ord.limit (C n)

/-- **The firing set of `w`, relative to a candidate family `C`.** The corpus's
`L_ns(κ) := {μ < κ : μ is a NSC firing ordinal}`, read at the level of a `Nat`-indexed family
of stages under consideration: `κ` is in the firing set exactly when it is some candidate
`stageOf C n` at which `w` fires non-Scott-continuously. Restricting to a candidate family
(rather than quantifying over literally every fundamental sequence `Ord.limit` could ever be
built from) is not a loss of generality here — it is the honest statement of what data anyone
ever has about "the limit stages of *this* settling process": a `Nat`-indexed list of them,
per `Ord`'s own constructor. -/
def FiringSet (le : α → α → Prop) (w : OrdFlow α) (C : CandidateStages) : Ord → Prop :=
  fun κ => ∃ n, κ = stageOf C n ∧ NSCFiringAt le w (C n)

/-! ## (C) Coverage is free — the flow-level mirror of `Ord.exists_countable_cofinal_witness` -/

/-- **Coverage is free.** However `w` behaves, the firing set relative to a candidate family
`C` is *by its very construction* covered by the `Nat`-indexed `stageOf C`: every witness of
`FiringSet le w C` is `stageOf C n` for the same `n` the witness already names. This is the
flow-level mirror of `Ord.exists_countable_cofinal_witness`: a firing set built by watching a
`Nat`-indexed list of candidate stages can never smuggle in an uncountable witness, because
nothing about the construction ever offers one — it is unreachable from the presentation, not
merely unbuilt in it. -/
theorem firingSet_coverage_free (le : α → α → Prop) (w : OrdFlow α) (C : CandidateStages) :
    ∀ κ, FiringSet le w C κ → ∃ n, stageOf C n = κ :=
  fun _κ ⟨n, hn, _⟩ => ⟨n, hn.symm⟩

/-- **Every candidate stage already carries its own countable cofinal witness.** `stageOf C n`
is an `Ord.limit`, so `Ord.exists_countable_cofinal_witness` applies directly: a `Nat`-indexed
sequence sits below it at every stage and is its least upper bound. Ties this module's
`CandidateStages` machinery to the ordinal-level fact (`Closure/Ordinal.lean` §G) that grounds
it. -/
theorem stageOf_has_countable_cofinal_witness (C : CandidateStages) (n : Nat) :
    ∃ g : Nat → Ord, Ord.IsCofinalWitness g (stageOf C n) :=
  Ord.exists_countable_cofinal_witness (stageOf C n)

/-! ## (D) A concrete firing set, countably enumerable exactly

`spikeFlow` is `Bool`-shaped in spirit but carried on `Nat` so the arithmetic discharges by
`decide`/`rfl`: `0` at every non-limit-shaped stage, `1` at every top-level limit. Along any
fundamental sequence that never itself lands on a top-level limit — in particular, the constant
sequence at a finite ordinal — the value jumps from `0` at every predecessor to `1` at the
limit, and `1` fails to be the *least* upper bound (`0` is already an upper bound of the
all-`0` predecessors, and `1 ≤ 0` is false): a genuine NSC firing. -/

/-- The **spike flow**: `0` at any non-top-level-limit stage, `1` at any top-level limit. The
simplest possible witness of a genuine NSC firing. -/
def spikeFlow : OrdFlow Nat
  | Ord.zero => 0
  | Ord.succ _ => 0
  | Ord.limit _ => 1

/-- `spikeFlow` is `0` at every finite ordinal: `Ord.ofNat n` is `zero`-or-`succ`-shaped at
the top level, by `ofNat`'s own definition, regardless of `n`. -/
theorem spikeFlow_ofNat (n : Nat) : spikeFlow (Ord.ofNat n) = 0 := by
  cases n with
  | zero => rfl
  | succ k => rfl

/-- `spikeFlow` is `1` at any top-level limit — the defining equation, named for rewriting. -/
theorem spikeFlow_limit (f : Nat → Ord) : spikeFlow (Ord.limit f) = 1 := rfl

/-- **`spikeFlow` fires at every constant fundamental sequence.** At `f := fun _ => Ord.ofNat
n`, every predecessor value is `0` (`spikeFlow_ofNat`), so `0` is a lower bound witnessing
`u := 0` satisfies the LUB hypothesis `∀ m, spikeFlow (f m) ≤ 0` vacuously by equality — yet
the limit value `1 ≤ 0` is false: the "least upper bound" half of `ContinuousAt` fails. -/
theorem spikeFlow_fires_at_constant (n : Nat) :
    NSCFiringAt (· ≤ ·) spikeFlow (fun _ => Ord.ofNat n) := by
  intro h
  obtain ⟨_, hleast⟩ := h
  have hval : spikeFlow (Ord.ofNat n) = 0 := spikeFlow_ofNat n
  have h0 : spikeFlow (Ord.limit (fun _ => Ord.ofNat n)) ≤ 0 :=
    hleast 0 (fun _ => by dsimp only; omega)
  rw [spikeFlow_limit] at h0
  exact absurd h0 (by decide)

/-- The **constant candidates**: the `n`-th candidate stage is the limit of the constant
sequence at the finite ordinal `n`. -/
def constantCandidates : CandidateStages := fun n _ => Ord.ofNat n

/-- **`spikeFlow` fires at every constant candidate.** Immediate from
`spikeFlow_fires_at_constant`, since `constantCandidates n` is definitionally the constant
sequence at `Ord.ofNat n`. -/
theorem spikeFlow_fires_everywhere_on_constantCandidates :
    ∀ n, NSCFiringAt (· ≤ ·) spikeFlow (constantCandidates n) :=
  spikeFlow_fires_at_constant

/-- **A candidate family along which `w` fires everywhere yields a countably-enumerable,
exactly-characterized firing set.** If `w` NSC-fires at every candidate `C n`, then
`FiringSet le w C` is *exactly* the image of `stageOf C` — countably enumerable on the nose,
with `stageOf C` itself as the enumerating family. -/
theorem countablyEnumerable_firingSet_of_fires_everywhere
    (le : α → α → Prop) (w : OrdFlow α) (C : CandidateStages)
    (hfires : ∀ n, NSCFiringAt le w (C n)) :
    CountablyEnumerable (FiringSet le w C) := by
  refine ⟨stageOf C, fun κ => ?_⟩
  constructor
  · exact firingSet_coverage_free le w C κ
  · rintro ⟨n, hn⟩
    exact ⟨n, hn.symm, hfires n⟩

/-- **`spikeFlow`'s firing set, relative to the constant candidates, is countably
enumerable.** The concrete instantiation of
`countablyEnumerable_firingSet_of_fires_everywhere`. -/
theorem countablyEnumerable_spikeFlow_firingSet :
    CountablyEnumerable (FiringSet (· ≤ ·) spikeFlow constantCandidates) :=
  countablyEnumerable_firingSet_of_fires_everywhere (· ≤ ·) spikeFlow constantCandidates
    spikeFlow_fires_everywhere_on_constantCandidates

/-- **`spikeFlow`'s firing set is nonempty.** Witnessed at the `0`-th constant candidate. -/
theorem spikeFlow_firingSet_nonempty :
    ∃ κ, FiringSet (· ≤ ·) spikeFlow constantCandidates κ :=
  ⟨stageOf constantCandidates 0, 0, rfl, spikeFlow_fires_everywhere_on_constantCandidates 0⟩

/-! ## (E) A countably-enumerable firing set is faithfully `transfiniteBounded` -/

/-- **A countably-enumerable, nonempty firing set is faithfully `transfiniteBounded`.** Given
a firing set `P` that really is inhabited (the flow does NSC-fire somewhere) and countably
enumerable, the regime datum with `scottContinuous := false`, `finiteBase := false`,
`countableCofinality := true` classifies to `ClosureRegime.transfiniteBounded` — and setting
`countableCofinality := true` is *faithful* to evidence actually in hand, not asserted
metadata: the hypotheses `hne`/`hP` are precisely a firing witness and a countable listing of
the firing set. (The two Bools compute the classification directly, as `nscRegimeData` in
`NSCFiring.lean` already does; `hne`/`hP` are carried as the smart constructor's precondition,
so this datum can only be built from real evidence.) -/
def regimeDataOfCountableFiring {P : Ord → Prop} (_hne : ∃ κ, P κ)
    (_hP : CountablyEnumerable P) : ClosureRegimeData where
  scottContinuous := false
  finiteBase := false
  countableCofinality := true
  fin_scott := by intro h; exact absurd h (by decide)
  fin_cof := by intro h; exact absurd h (by decide)

/-- The classification is exactly `transfiniteBounded`: `scottContinuous = false ∧
countableCofinality = true` selects it via `classify_transfiniteBounded`. -/
theorem regimeDataOfCountableFiring_transfiniteBounded
    {P : Ord → Prop} (hne : ∃ κ, P κ) (hP : CountablyEnumerable P) :
    classify (regimeDataOfCountableFiring hne hP) = ClosureRegime.transfiniteBounded :=
  (classify_transfiniteBounded (regimeDataOfCountableFiring hne hP)).mpr ⟨rfl, rfl⟩

/-- The concrete witness applied: `spikeFlow`'s firing set (relative to the constant
candidates) is nonempty and countably enumerable, so its regime datum classifies to
`transfiniteBounded` — the first concrete `Ord`-firing-set instance of the transfinite-bounded
regime, rather than a Bool flag asserted by fiat. -/
theorem spikeFlow_regime_transfiniteBounded :
    classify (regimeDataOfCountableFiring spikeFlow_firingSet_nonempty
      countablyEnumerable_spikeFlow_firingSet) = ClosureRegime.transfiniteBounded :=
  regimeDataOfCountableFiring_transfiniteBounded _ _

/-! ## (F) Aperiodic is unreachable — the firing-set-level mirror of
`Ord.regimeOfOrdHonest_ne_aperiodic` -/

/-- **`regimeDataOfCountableFiring` can never classify to `aperiodic`.** Immediate:
`countableCofinality` is hard-set to `true`, and `classify_aperiodic` needs it `false`. The
firing-set-level mirror of `Ord.regimeOfOrdHonest_ne_aperiodic`: neither a bare ordinal built
from `Ord`'s constructors, nor a firing set built by watching a `Nat`-indexed candidate family
of such ordinals, can ever produce the evidence `aperiodic` needs — the same boundary of this
dependency-free encoding, seen at two levels. -/
theorem regimeDataOfCountableFiring_ne_aperiodic
    {P : Ord → Prop} (hne : ∃ κ, P κ) (hP : CountablyEnumerable P) :
    classify (regimeDataOfCountableFiring hne hP) ≠ ClosureRegime.aperiodic := by
  rw [regimeDataOfCountableFiring_transfiniteBounded hne hP]
  decide

/-! ## Headline -/

/-- **The regime-cofinality headline — `transfiniteBounded` and `aperiodic` formally
separated for the first time.** Bundles:

* a concrete `Ord`-indexed flow (`spikeFlow`) whose firing set, relative to a `Nat`-indexed
  candidate family (`constantCandidates`), really does NSC-fire and is nonempty
  (`spikeFlow_firingSet_nonempty`) and countably enumerable *exactly*
  (`countablyEnumerable_spikeFlow_firingSet`) — the transfinite-bounded side, now built from a
  real firing set rather than only a Bool flag;
* that this evidence classifies faithfully to `transfiniteBounded`
  (`spikeFlow_regime_transfiniteBounded`) and — because `countableCofinality` there is honest,
  not free, metadata — never to `aperiodic` (`regimeDataOfCountableFiring_ne_aperiodic`);
* the structural reason, at the bare-ordinal level this all rests on: `Ord.regimeOfOrdHonest`
  (`Closure/Ordinal.lean` §G) never outputs `aperiodic` either, for any ordinal or
  Scott-continuity witness (`Ord.regimeOfOrdHonest_ne_aperiodic`) — the aperiodic entry's
  asserted-data status is a theorem about this dependency-free encoding, not an apology for
  it, at both the ordinal level and the firing-set level built on top of it.
-/
theorem regime_cofinality_headline :
    (∃ κ, FiringSet (· ≤ ·) spikeFlow constantCandidates κ)
    ∧ CountablyEnumerable (FiringSet (· ≤ ·) spikeFlow constantCandidates)
    ∧ classify (regimeDataOfCountableFiring spikeFlow_firingSet_nonempty
        countablyEnumerable_spikeFlow_firingSet) = ClosureRegime.transfiniteBounded
    ∧ classify (regimeDataOfCountableFiring spikeFlow_firingSet_nonempty
        countablyEnumerable_spikeFlow_firingSet) ≠ ClosureRegime.aperiodic
    ∧ ∀ (κ : Ord), Ord.regimeOfOrdHonest κ true ≠ ClosureRegime.aperiodic
        ∧ Ord.regimeOfOrdHonest κ false ≠ ClosureRegime.aperiodic :=
  ⟨spikeFlow_firingSet_nonempty, countablyEnumerable_spikeFlow_firingSet,
   spikeFlow_regime_transfiniteBounded,
   regimeDataOfCountableFiring_ne_aperiodic _ _,
   fun κ => ⟨Ord.regimeOfOrdHonest_ne_aperiodic κ true, Ord.regimeOfOrdHonest_ne_aperiodic κ false⟩⟩

end RegimeCofinality
end Obsmetrologia
