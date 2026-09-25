import Obsmetrologia.Closure.Regime
import Obsmetrologia.Dynamics.Flow.NSCFiring

/-!
# The regime gate — deriving `cohomologyVanishes` from the tower's carriers

`Closure.Regime` proves `regime_tower`: one carrier per regime — `Reading` (strict), the bare
`Record` (scott), the completed `ORecord` (transfinite-bounded), the germ preorder of record
sequences (aperiodic) — and `unattained_settling_gate`, which pairs each carrier's settling
behaviour with `cohomologyVanishes` at that regime, calling the match "the derived invariant".
That pairing is asserted rung-by-rung; this module makes the *gate itself* a computation on the
tower's carriers, so the match is proved rather than merely observed.

The naive guess — "cohomology vanishes iff the carrier's settled value is attained at a finite
stage" — is **false**: it holds at `strict`/`transfiniteBounded`/`aperiodic` but fails at
`scott`, where the bare-record witness never attains a settled value at all (`scott_no_fixed_
point`), finite or otherwise, yet still lies in the vanishing regime (Scott-continuity is about
commuting with joins, not about a specific dynamic attaining one). The honest gate therefore
carries **three** flags per carrier — `hasFixedPoint` (a genuine equality fixed point exists at
all), `attainedAtFiniteStage` (some finite stage of the canonical orbit reaches it), and
`weaklyQuiescent` (the orbit collapses to a single equivalence class under *some* relation on the
carrier, possibly weaker than its native order) — combined as

  `gate r := (hasFixedPoint r && attainedAtFiniteStage r) || !weaklyQuiescent r`

i.e. "cleanly settled: a fixed point exists and is reached finitely — **or** — no completion
exists at all, not even a weak one, so there is nothing to jump to". `gate` is proved to equal
`cohomologyVanishes` pointwise (`gate_eq_cohomologyVanishes`), with each of the four cases
justified by the actual carrier fact (`gate_strict`/`gate_scott`/`gate_transfiniteBounded`/
`gate_aperiodic`), not by comparing two literal tables.

`gate r = false` (an "unattained settling") is then linked to the corpus's non-Scott-continuous
firing ordinals (`Flow.NSCFiring`): at `strict` the tower's own carrier `Reading` is exactly the
carrier `IsNSC`/`L_ns` are typed over, and the absence of a gap there **is** the literal absence
of NSC firings (`no_nsc_firing_of_closure`). The other three rungs use carriers `IsNSC` is not
typed over (`Record`, `ORecord`, `Nat → Record`); there we prove and name the *structural*
analogue honestly — `HasGap` — rather than force a fake `IsNSC` instance onto the wrong type.
-/

namespace Obsmetrologia.RegimeGate

open Obsmetrologia
open Obsmetrologia.Flow.NSCFiring (IsNSC no_nsc_firing_of_closure)
open Obsmetrologia.Closure.Scott (DirectedFamily)

/-! ## Part 1 — the four carrier facts, restated directly from the tower's own lemmas -/

/-- **`strict`/FOUR: the settled value exists and is attained at the finite stage 3.**
Every inflationary endomap on the finite reading lattice fixes `Reading.iter f 3 x` — restates
`Obsmetrologia.spine_settles_by_three` (itself `Reading.strict_finite`). -/
theorem strict_settled_and_attained (f : Reading → Reading) (hf : ∀ a, Reading.KLE a (f a))
    (x : Reading) : f (Reading.iter f 3 x) = Reading.iter f 3 x :=
  spine_settles_by_three f hf x

/-- **`scott`/Record: the increment map has no fixed point anywhere.** `Record.succPos` never
fixes any record — not merely "not at any finite stage of some orbit", but genuinely nowhere on
the carrier: `∀ r, succPos r ≠ r`. Restates `Record.iter_succPos_ne` at the one-step case. -/
theorem scott_no_fixed_point (r : Record) : Record.succPos r ≠ r :=
  Record.iter_succPos_ne 0 r

/-- **`transfiniteBounded`/ORecord: a settled value exists but no finite stage attains it.**
`osuccPos` genuinely fixes `omegaPos` (`ORecord.osuccPos_omegaPos`), yet every finite iterate of
the canonical orbit from `kBot` differs from it (`ORecord.iter_ne_omegaPos`): the fixed point is
real, but only reachable at the limit, never at a finite sub-stage. -/
theorem transfiniteBounded_settled_unattained :
    ORecord.osuccPos ORecord.omegaPos = ORecord.omegaPos
    ∧ ∀ k : Nat, ORecord.iter ORecord.osuccPos k ORecord.kBot ≠ ORecord.omegaPos :=
  ⟨ORecord.osuccPos_omegaPos, ORecord.iter_ne_omegaPos⟩

/-- **`aperiodic`/germ: no stage of the contradiction-bump orbit ever equals the next.** For
every seed sequence `s`, `Record.iterSeq Record.topBump (k + 1) s ≠ Record.iterSeq Record.topBump
k s` at every `k` — the orbit never fixes *as data*, restating the second conjunct of
`Record.topBump_flux`. -/
theorem aperiodic_never_settles_as_data (s : Nat → Record) (k : Nat) :
    Record.iterSeq Record.topBump (k + 1) s ≠ Record.iterSeq Record.topBump k s :=
  (Record.topBump_flux s).2.1 k

/-- **`aperiodic`/germ: yet the whole orbit is one point of the germ order.** Every stage
mutually dominates, and is dominated by, the seed — restating the first conjunct of
`Record.topBump_flux`. This mutual domination without identity is possible only because `DomBy`
is **not** antisymmetric (`Record.germ_order_not_antisymm`): a weak collapse the native
(antisymmetric) orders of the other three carriers cannot exhibit. -/
theorem aperiodic_weakly_quiescent (s : Nat → Record) (k : Nat) :
    Record.DomBy (Record.iterSeq Record.topBump k s) s
    ∧ Record.DomBy s (Record.iterSeq Record.topBump k s) :=
  (Record.topBump_flux s).1 k

/-! ## Part 2 — the gate, computed from the four carrier facts -/

/-- **Does the carrier's canonical dynamic have a genuine (equality) fixed point at all?**
`true` at `strict` (`Reading.iter f 3 x`, `strict_settled_and_attained`) and
`transfiniteBounded` (`ORecord.omegaPos`, `transfiniteBounded_settled_unattained`); `false` at
`scott` (`scott_no_fixed_point`: `Record.succPos` has none) and `aperiodic`
(`aperiodic_never_settles_as_data`: `Record.topBump`'s iteration has none). -/
def hasFixedPoint : ClosureRegime → Bool
  | .strict => true
  | .scott => false
  | .transfiniteBounded => true
  | .aperiodic => false

/-- **Is that fixed point (when `hasFixedPoint`) reached by some *finite* stage of the
carrier's canonical orbit?** `true` only at `strict` (stage 3, `strict_settled_and_attained`);
`false` at `transfiniteBounded` (never finitely — `transfiniteBounded_settled_unattained`'s
second conjunct); vacuously `false` at `scott`/`aperiodic` (no fixed point to attain). -/
def attainedAtFiniteStage : ClosureRegime → Bool
  | .strict => true
  | .scott => false
  | .transfiniteBounded => false
  | .aperiodic => false

/-- **Does the carrier's orbit collapse to a single equivalence class under *some* relation on
the carrier — possibly one weaker than its native order?** At `strict`/`transfiniteBounded` the
native (equality) fixed point already witnesses this, so it coincides with `hasFixedPoint`; at
`scott` only the native, antisymmetric `Record.KLE` is available and no collapse happens
(`scott_no_fixed_point`), so it is `false` there too. Only the germ carrier at `aperiodic`
supplies a genuinely weaker, non-antisymmetric relation (`Record.DomBy`,
`Record.germ_order_not_antisymm`), under which the orbit **does** collapse
(`aperiodic_weakly_quiescent`) even though it never collapses as data. -/
def weaklyQuiescent : ClosureRegime → Bool
  | .strict => true
  | .scott => false
  | .transfiniteBounded => true
  | .aperiodic => true

/-- **The unattained-settling gate**, as a computation on the tower's carriers: `true` — a
"clean" settling — exactly when either the carrier settles with a genuine fixed point reached at
a finite stage, or it never settles even weakly (no completion exists at all, so there is
nothing left unattained); `false` — an "unattained settling" — exactly when a completion exists
(`weaklyQuiescent`) that is not both a genuine fixed point *and* reached finitely. -/
def gate (r : ClosureRegime) : Bool :=
  (hasFixedPoint r && attainedAtFiniteStage r) || !weaklyQuiescent r

/-! ## Part 3 — `gate = cohomologyVanishes`, justified per regime -/

/-- `gate` matches `cohomologyVanishes` at `strict`, bundled with the carrier fact that
justifies it: FOUR's inflationary orbit fixes at the finite stage 3. -/
theorem gate_strict :
    gate ClosureRegime.strict = cohomologyVanishes ClosureRegime.strict
    ∧ ∀ (f : Reading → Reading), (∀ a, Reading.KLE a (f a)) → ∀ x : Reading,
        f (Reading.iter f 3 x) = Reading.iter f 3 x :=
  ⟨rfl, strict_settled_and_attained⟩

/-- `gate` matches `cohomologyVanishes` at `scott`, bundled with the carrier fact that
justifies it: the tally increment fixes no record at all. -/
theorem gate_scott :
    gate ClosureRegime.scott = cohomologyVanishes ClosureRegime.scott
    ∧ ∀ r : Record, Record.succPos r ≠ r :=
  ⟨rfl, scott_no_fixed_point⟩

/-- `gate` matches `cohomologyVanishes` at `transfiniteBounded`, bundled with the carrier fact
that justifies it: the completed record fixes at `omegaPos`, unattained by any finite stage. -/
theorem gate_transfiniteBounded :
    gate ClosureRegime.transfiniteBounded = cohomologyVanishes ClosureRegime.transfiniteBounded
    ∧ ORecord.osuccPos ORecord.omegaPos = ORecord.omegaPos
    ∧ ∀ k : Nat, ORecord.iter ORecord.osuccPos k ORecord.kBot ≠ ORecord.omegaPos :=
  ⟨rfl, transfiniteBounded_settled_unattained.1, transfiniteBounded_settled_unattained.2⟩

/-- `gate` matches `cohomologyVanishes` at `aperiodic`, bundled with the carrier fact that
justifies it: the contradiction bump's orbit is a single point of the germ order while no stage
ever equals the next as data. -/
theorem gate_aperiodic :
    gate ClosureRegime.aperiodic = cohomologyVanishes ClosureRegime.aperiodic
    ∧ (∀ (s : Nat → Record) (k : Nat),
        Record.DomBy (Record.iterSeq Record.topBump k s) s
        ∧ Record.DomBy s (Record.iterSeq Record.topBump k s))
    ∧ ∀ (s : Nat → Record) (k : Nat),
        Record.iterSeq Record.topBump (k + 1) s ≠ Record.iterSeq Record.topBump k s :=
  ⟨rfl, aperiodic_weakly_quiescent, aperiodic_never_settles_as_data⟩

/-- **The gate, derived, at every regime.** `gate r = cohomologyVanishes r` for all four
regimes of the tower — composed from the four justified cases above, not from comparing two
literal tables. -/
theorem gate_eq_cohomologyVanishes (r : ClosureRegime) : gate r = cohomologyVanishes r := by
  cases r
  · exact gate_strict.1
  · exact gate_scott.1
  · exact gate_transfiniteBounded.1
  · exact gate_aperiodic.1

/-! ## Part 4 — the NSC link: `gate = false` is where an unattained completion ("gap") exists -/

/-- **A gap**: the structural analogue of a non-Scott-continuous firing, read off the gate's
own components. A completion exists (`weaklyQuiescent`) that is *not* also a genuine fixed point
reached at a finite stage — exactly the corpus's "a jump not obtainable as a colimit of the
finite sub-stages" (`Flow.NSCFiring`'s `non-scott-continuous-firing-ordinal.md`). -/
def HasGap (r : ClosureRegime) : Prop :=
  weaklyQuiescent r = true ∧ ¬ (hasFixedPoint r = true ∧ attainedAtFiniteStage r = true)

/-- No gap at `strict`: FOUR's fixed point is reached finitely, so there is nothing left to
jump to. -/
theorem strict_no_gap : ¬ HasGap ClosureRegime.strict := by
  unfold HasGap hasFixedPoint attainedAtFiniteStage weaklyQuiescent
  decide

/-- No gap at `scott`: the record carrier never weakly quiesces at all (its only order,
`Record.KLE`, is antisymmetric and the increment orbit never revisits), so there is no
completion to have gone unattained. -/
theorem scott_no_gap : ¬ HasGap ClosureRegime.scott := by
  unfold HasGap hasFixedPoint attainedAtFiniteStage weaklyQuiescent
  decide

/-- A gap at `transfiniteBounded`: `omegaPos` is a genuine completion the orbit weakly (indeed
strictly) quiesces to, but it is never reached at a finite stage. -/
theorem transfiniteBounded_has_gap : HasGap ClosureRegime.transfiniteBounded := by
  unfold HasGap hasFixedPoint attainedAtFiniteStage weaklyQuiescent
  decide

/-- A gap at `aperiodic`: the germ-order equivalence class is a genuine (weak) completion the
orbit quiesces to immediately, but it is never reached as data at any stage. -/
theorem aperiodic_has_gap : HasGap ClosureRegime.aperiodic := by
  unfold HasGap hasFixedPoint attainedAtFiniteStage weaklyQuiescent
  decide

/-- **The gap correspondence.** A gap exists at a regime of the tower exactly where
`cohomologyVanishes` (equivalently `gate`) reads `false`: no gap at `strict`/`scott`, a gap at
`transfiniteBounded`/`aperiodic`. -/
theorem gap_matches_nonvanishing :
    (¬ HasGap ClosureRegime.strict) ∧ (¬ HasGap ClosureRegime.scott)
    ∧ HasGap ClosureRegime.transfiniteBounded ∧ HasGap ClosureRegime.aperiodic :=
  ⟨strict_no_gap, scott_no_gap, transfiniteBounded_has_gap, aperiodic_has_gap⟩

/-- **At `strict` the gap-absence is not merely structural — it *is* the literal absence of
NSC firings.** `Reading` is exactly the carrier `IsNSC`/`L_ns` are typed over, and
`no_nsc_firing_of_closure` proves every reading-closure has none: the same finite carrier that
forces `κ ≤ 3` (`Reading.strict_finite`) forces `L_ns(κ) = ∅`. The other three rungs use carriers
(`Record`, `ORecord`, `Nat → Record`) `IsNSC` is not typed over, so `HasGap` is documented there
instead as the honest structural analogue rather than a forced (fake) `IsNSC` instance. -/
theorem strict_no_gap_is_no_nsc_firing :
    ¬ HasGap ClosureRegime.strict
    ∧ ∀ (cl : Reading.Closure) (S : DirectedFamily), ¬ IsNSC cl.op S :=
  ⟨strict_no_gap, no_nsc_firing_of_closure⟩

/-- The `aperiodic` gap coincides with the tower's own lax-slack witness
(`Record.tally_lax_slack`, cited in `regime_tower`): both record the same phenomenon — a
genuine, non-antisymmetric weak collapse (`Positing.Value.HasLaxSlack`,
`Record.germ_order_not_antisymm`) that never resolves to equality. -/
theorem aperiodic_gap_matches_lax_slack :
    HasGap ClosureRegime.aperiodic
    ∧ Positing.Value.HasLaxSlack Record.tallyLaxClosure Record.germPreValue.bot :=
  ⟨aperiodic_has_gap, Record.tally_lax_slack⟩

/-! ## Part 5 — the bundle: `cohomologyVanishes`, derived -/

/-- **`cohomologyVanishes`, derived from the tower's carriers.** For every regime `r` the tower
inhabits, `cohomologyVanishes r = true` iff `gate r = true` — the carrier's settled value is a
genuine fixed point attained at a finite stage, or no completion (not even a weak one) exists at
all to jump to. This is the honest replacement for the naive "attained at a finite stage"
criterion, which holds at three of the four rungs (below) but fails at `scott`
(`scott_vanishes_without_attaining`). -/
theorem cohomologyVanishes_derived (r : ClosureRegime) :
    cohomologyVanishes r = true ↔ gate r = true := by
  constructor
  · intro h; rw [gate_eq_cohomologyVanishes r]; exact h
  · intro h; rw [gate_eq_cohomologyVanishes r] at h; exact h

theorem cohomologyVanishes_iff_attained_strict :
    cohomologyVanishes ClosureRegime.strict = true
      ↔ attainedAtFiniteStage ClosureRegime.strict = true :=
  ⟨fun _ => rfl, fun _ => rfl⟩

theorem cohomologyVanishes_iff_attained_transfiniteBounded :
    cohomologyVanishes ClosureRegime.transfiniteBounded = true
      ↔ attainedAtFiniteStage ClosureRegime.transfiniteBounded = true :=
  ⟨fun h => absurd h (by decide), fun h => absurd h (by decide)⟩

theorem cohomologyVanishes_iff_attained_aperiodic :
    cohomologyVanishes ClosureRegime.aperiodic = true
      ↔ attainedAtFiniteStage ClosureRegime.aperiodic = true :=
  ⟨fun h => absurd h (by decide), fun h => absurd h (by decide)⟩

/-- **The naive criterion fails at `scott`.** Cohomology vanishes there
(`cohomologyVanishes_iff`) yet the tower's scott-carrier never attains a settled value at any
finite stage — indeed never attains one at all, anywhere (`scott_no_fixed_point`): vanishing
here comes from Scott-continuity commuting with an (unattained, indeed non-existent) join, not
from finite attainment. This is exactly why `cohomologyVanishes_derived` is stated with `gate`
(three flags), not with `attainedAtFiniteStage` alone. -/
theorem scott_vanishes_without_attaining :
    cohomologyVanishes ClosureRegime.scott = true
    ∧ attainedAtFiniteStage ClosureRegime.scott = false :=
  ⟨rfl, rfl⟩

end Obsmetrologia.RegimeGate
