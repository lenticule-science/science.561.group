import Obsmetrologia.Closure.Operator
import Obsmetrologia.Closure.Ordinal.Finite
import Obsmetrologia.Language.Positing.Record
import Obsmetrologia.Language.Positing.Four

/-!
# Closure-ordinal regime stratification — the FOUR regimes

`ClosureOrdinal` proved the spine's **strict-finite regime**: every inflationary
endomap on the reading lattice settles by step 3, the closure ordinal `κ ≤ 3`. The
corpus's full picture is that the closure ordinal `κ` stratifies into **four
mutually-exclusive, jointly-exhaustive regimes** at the ordinal boundaries `ω` and
`ω₁` (formalizes
`content/mark/.../settling/content/closure-ordinal/closure-ordinal.md` — the ordinal
`κ(F_U, ℰ₀)` — and the theorem
`content/mark/.../settling/references/four-regime-dichotomy.md`):

  * **strict**            `κ < ω`        — finite base `(L, E, C)` all finite;
  * **Scott**             `κ = ω`        — Scott-continuous closure, infinite base;
  * **transfinite-bounded** `ω < κ < ω₁` — non-Scott-continuous, countable cofinality;
  * **aperiodic**         `κ ≥ ω₁`       — non-Scott-continuous, uncountable cofinality.

We model `κ` here by the corpus's own **equivalent decidable characterizations** (the transfinite ordinal itself is built in `Closure.OrdinalCore`/`Closure.Ordinal`; from
`four-regime-dichotomy.md`): each regime is determined by three Boolean flags — is
the closure Scott-continuous, is the base finite, is the cofinality countable — with
the corpus's two implications

  * `finiteBase → scottContinuous`         (a finite base forces Scott-continuity);
  * `finiteBase → countableCofinality`     (a finite base forces countable cofinality)

as structure fields. On this `ClosureRegimeData` we prove the **four-regime dichotomy**:
the four characterizations are mutually exclusive and jointly exhaustive, and
`classify` selects the unique one. Each regime is the regime of one stage of the language
spine (`Stage.regime`): articulating aperiodic, predicating transfinite-bounded, positing
Scott-continuous, settling strict-finite. The spine's ClosureRegimeData has
`finiteBase = true`, so `classify` puts it in `strict` (`spine_is_strict`), the settling
stage's regime (`spine_settles_in_settling_regime`), re-expressing
`ClosureOrdinal.strict_finite`'s `κ ≤ 3`. Finally we record the
dichotomy's **regime-dependent cohomology** table: `H¹ = 0` exactly in the strict and
Scott regimes; the KZ diamond is fully alive only aperiodically.
-/

namespace Obsmetrologia

/-! ## (A) The four regimes -/

/-- The four closure-ordinal regimes — the strata of `κ` at the boundaries `ω`, `ω₁`.
One per corner of the recurring FOUR. -/
inductive ClosureRegime
  | strict
  | scott
  | transfiniteBounded
  | aperiodic
  deriving DecidableEq, Repr

/-! ## (B) Decidable regime data and the classifier

We carry the corpus's equivalent decidable data here — three Boolean flags + the two corpus
implications as proof fields (the ordinal is built in `Closure.Ordinal`). -/

/-- The decidable characterization data of a settling problem: whether its closure is
Scott-continuous, whether its base `(L, E, C)` is finite, whether its state space has
countable cofinality — together with the corpus's two constraints (a finite base
forces both Scott-continuity and countable cofinality). These three Bools are exactly
what `four-regime-dichotomy.md` uses to decide `κ`'s stratum. -/
structure ClosureRegimeData where
  /-- The closure operator is Scott-continuous (commutes with directed `ω`-joins). -/
  scottContinuous : Bool
  /-- The base `(L, E, C)` is all finite — the strict hypothesis. -/
  finiteBase : Bool
  /-- The state space has countable cofinality (`κ` stays countable). -/
  countableCofinality : Bool
  /-- Corpus constraint: a finite base forces Scott-continuity. -/
  fin_scott : finiteBase = true → scottContinuous = true
  /-- Corpus constraint: a finite base forces countable cofinality. -/
  fin_cof : finiteBase = true → countableCofinality = true

/-- Classify regime data into its regime via the corpus equivalences: strict if the
base is finite (`κ < ω`); else Scott if the closure is Scott-continuous (`κ = ω`);
else transfinite-bounded if the cofinality is countable (`ω < κ < ω₁`); else aperiodic
(`κ ≥ ω₁`). -/
def classify (d : ClosureRegimeData) : ClosureRegime :=
  if d.finiteBase then ClosureRegime.strict
  else if d.scottContinuous then ClosureRegime.scott
  else if d.countableCofinality then ClosureRegime.transfiniteBounded
  else ClosureRegime.aperiodic

/-! ## (C) The four-regime dichotomy — mutually exclusive, jointly exhaustive

The per-regime characterization lemmas, then the bundled dichotomy. Proved by
destructuring the Bool flags (`decide` cannot quantify over the structure). -/

/-- **Strict ⟺ finite base.** `classify d = strict` exactly when the base is finite. -/
theorem classify_strict (d : ClosureRegimeData) :
    classify d = ClosureRegime.strict ↔ d.finiteBase = true := by
  obtain ⟨s, f, c, hsc, hcc⟩ := d
  cases f <;> cases s <;> cases c <;>
    first
      | exact Bool.noConfusion (hsc rfl)
      | exact Bool.noConfusion (hcc rfl)
      | simp [classify]

/-- **Scott ⟺ Scott-continuous ∧ ¬finite base.** -/
theorem classify_scott (d : ClosureRegimeData) :
    classify d = ClosureRegime.scott ↔ (d.scottContinuous = true ∧ d.finiteBase = false) := by
  obtain ⟨s, f, c, hsc, hcc⟩ := d
  cases f <;> cases s <;> cases c <;>
    first
      | exact Bool.noConfusion (hsc rfl)
      | exact Bool.noConfusion (hcc rfl)
      | simp [classify]

/-- **Transfinite-bounded ⟺ ¬Scott-continuous ∧ countable cofinality.** (The
constraint `finiteBase → scottContinuous` makes the `¬finiteBase` clause redundant:
`¬scottContinuous` already forces `¬finiteBase`.) -/
theorem classify_transfiniteBounded (d : ClosureRegimeData) :
    classify d = ClosureRegime.transfiniteBounded ↔
      (d.scottContinuous = false ∧ d.countableCofinality = true) := by
  obtain ⟨s, f, c, hsc, hcc⟩ := d
  cases f <;> cases s <;> cases c <;>
    first
      | exact Bool.noConfusion (hsc rfl)
      | exact Bool.noConfusion (hcc rfl)
      | simp [classify]

/-- **Aperiodic ⟺ ¬Scott-continuous ∧ ¬countable cofinality.** -/
theorem classify_aperiodic (d : ClosureRegimeData) :
    classify d = ClosureRegime.aperiodic ↔
      (d.scottContinuous = false ∧ d.countableCofinality = false) := by
  obtain ⟨s, f, c, hsc, hcc⟩ := d
  cases f <;> cases s <;> cases c <;>
    first
      | exact Bool.noConfusion (hsc rfl)
      | exact Bool.noConfusion (hcc rfl)
      | simp [classify]

/-- **Joint exhaustiveness.** Every regime datum classifies to one of the four
regimes — trivially, since `classify` is total into `ClosureRegime`. -/
theorem classify_exhaustive (d : ClosureRegimeData) :
    classify d = ClosureRegime.strict ∨ classify d = ClosureRegime.scott
      ∨ classify d = ClosureRegime.transfiniteBounded ∨ classify d = ClosureRegime.aperiodic := by
  cases classify d <;> decide

/-- **The four-regime dichotomy.** Bundles joint exhaustiveness with the
four corpus characterizations: for any `ClosureRegimeData`, `classify` lands in one of the
four regimes, and each regime is selected by exactly its corpus condition —
*finite base* / *Scott-continuous, infinite base* / *non-Scott, countable cofinality*
/ *non-Scott, uncountable cofinality*. Together with the implications between the
conditions, exactly one holds, so the four conditions are mutually exclusive and
jointly exhaustive — `four-regime-dichotomy.md` over the decidable characterization. -/
theorem four_regime_dichotomy (d : ClosureRegimeData) :
    (classify d = ClosureRegime.strict ∨ classify d = ClosureRegime.scott
      ∨ classify d = ClosureRegime.transfiniteBounded ∨ classify d = ClosureRegime.aperiodic)
    ∧ (classify d = ClosureRegime.strict ↔ d.finiteBase = true)
    ∧ (classify d = ClosureRegime.scott ↔ (d.scottContinuous = true ∧ d.finiteBase = false))
    ∧ (classify d = ClosureRegime.transfiniteBounded ↔
        (d.scottContinuous = false ∧ d.countableCofinality = true))
    ∧ (classify d = ClosureRegime.aperiodic ↔
        (d.scottContinuous = false ∧ d.countableCofinality = false)) :=
  ⟨classify_exhaustive d, classify_strict d, classify_scott d,
    classify_transfiniteBounded d, classify_aperiodic d⟩

/-! ## (D) Each regime is the regime of one stage

The four regimes pair with the four stages of the language spine, in order: articulating is
aperiodic, predicating is transfinite-bounded, positing is Scott-continuous, and settling is
strict-finite. Read along the spine the regime descends, each stage's characteristic closure
tamer than the one before it; section (E) proves the last pairing for the spine itself
(`spine_settles_in_settling_regime`).

A regime is the character of one stage's closure; a corner (`Articulating.Corner`) is a value
inside a stage. The two fours are different objects and are not identified here. -/

/-- The four stages of the language spine, in the order the spine composes them. -/
inductive Stage where
  /-- Articulating: an utterance brings a relation into being; its closure is aperiodic. -/
  | articulating
  /-- Predicating: an articulated relation read as a claim of a subject toward an object;
its closure is transfinite-bounded. -/
  | predicating
  /-- Positing: evidence admitted at predicated cells, measured off a trace; its closure is
Scott-continuous. -/
  | positing
  /-- Settling: the modal closure iterated until nothing changes; its closure is strict-finite. -/
  | settling
  deriving DecidableEq, Repr

/-- A stage's regime: articulating is aperiodic, predicating transfinite-bounded, positing
Scott-continuous, settling strict-finite. -/
def Stage.regime : Stage → ClosureRegime
  | Stage.articulating => ClosureRegime.aperiodic
  | Stage.predicating => ClosureRegime.transfiniteBounded
  | Stage.positing => ClosureRegime.scott
  | Stage.settling => ClosureRegime.strict

/-- The stage whose regime this is. -/
def ClosureRegime.stage : ClosureRegime → Stage
  | ClosureRegime.aperiodic => Stage.articulating
  | ClosureRegime.transfiniteBounded => Stage.predicating
  | ClosureRegime.scott => Stage.positing
  | ClosureRegime.strict => Stage.settling

/-- Each regime belongs to exactly one stage and each stage has exactly one regime. -/
def regimeStageBij : Bij ClosureRegime Stage where
  to := ClosureRegime.stage
  inv := Stage.regime
  left r := by cases r <;> rfl
  right s := by cases s <;> rfl

/-! ## (E) The spine sits in the strict regime

`ClosureOrdinal.strict_finite` proved the spine's `κ ≤ 3` over the finite reading
lattice: the strict-finite regime. We exhibit its `ClosureRegimeData` (finite base, hence —
by the corpus constraints — Scott-continuous and countable cofinality) and prove it
classifies to `strict`, connecting the dichotomy to `ClosureOrdinal`. -/

/-- The spine's regime data: the finite reading lattice is a **finite base**, so (by the
corpus constraints, discharged here since `finiteBase = true → · = true`) it is also
Scott-continuous and of countable cofinality. This is the `ClosureRegimeData` of every
inflationary reading endomap, whose `κ ≤ 3` is `ClosureOrdinal.strict_finite`. -/
def spineData : ClosureRegimeData where
  scottContinuous := true
  finiteBase := true
  countableCofinality := true
  fin_scott := fun _ => rfl
  fin_cof := fun _ => rfl

/-- **The spine is strict.** The finite reading lattice's regime data classifies to
`ClosureRegime.strict` — the strict-finite regime whose `κ ≤ 3` is
`ClosureOrdinal.strict_finite` / `Reading.settles_by_three`. The decidable dichotomy
recovers the spine's regime. -/
theorem spine_is_strict : classify spineData = ClosureRegime.strict :=
  rfl

/-- **The spine settles in the settling stage's regime.** The finite reading lattice's regime
is the regime the settling stage pairs with. -/
theorem spine_settles_in_settling_regime : classify spineData = Stage.regime Stage.settling :=
  rfl

/-- The spine's strictness, witnessed concretely: `Reading.strict_finite` exhibits the
`κ ≤ 3` settling bound (`SettlesBy f x 3`) for every inflationary endomap on the
reading lattice — the operational content of `classify spineData = strict`. -/
theorem spine_settles_by_three (f : Reading → Reading) (hf : ∀ a, Reading.KLE a (f a))
    (x : Reading) : Reading.SettlesBy f x 3 := Reading.strict_finite f hf x

/-! ## (F) ClosureRegime-dependent cohomology

From the dichotomy's *regime-dependent structure of the KZ diamond* table: the strict
and Scott-continuous regimes have `H¹ = 0` for the settling-associated sheaf; in the
transfinite-bounded and aperiodic regimes the cohomology is non-trivial. The KZ
diamond is "fully alive" only aperiodically. -/

/-- Whether the settling-associated sheaf's `H¹` vanishes in a given regime: `true`
(cohomology vanishes) in the strict and Scott regimes; `false` in the transfinite-
bounded and aperiodic regimes, where the cohomological content is concentrated. -/
def cohomologyVanishes : ClosureRegime → Bool
  | ClosureRegime.strict => true
  | ClosureRegime.scott => true
  | ClosureRegime.transfiniteBounded => false
  | ClosureRegime.aperiodic => false

/-- **Cohomology vanishes exactly in the strict and Scott regimes.** `H¹ = 0` iff the
regime is `strict` or `scott`; the KZ diamond is alive (cohomology non-trivial) only
in the transfinite-bounded and aperiodic regimes. Proven by exhaustion. -/
theorem cohomologyVanishes_iff (r : ClosureRegime) :
    cohomologyVanishes r = true ↔ (r = ClosureRegime.strict ∨ r = ClosureRegime.scott) := by
  cases r <;> simp [cohomologyVanishes]

/-- The spine, being strict, has vanishing cohomology: the finite settling carries no
`H¹`. A direct corollary of `spine_is_strict` and `cohomologyVanishes_iff`. -/
theorem spine_cohomology_vanishes : cohomologyVanishes (classify spineData) = true := by
  rw [spine_is_strict]; rfl

/-! ## The regime tower — one derived family inhabits the column -/

/-- **The regime tower.** The regime column, inhabited by one derived family
of value carriers: the bounded quotient FOUR settles by stage three
(strict-finite); the topless record admits an inflationary monotone dynamic
with no finite settling stage (the ω-escape); the completed record settles
exactly at stage ω — no finite arrival, the stage-ω value fixed and the
orbit's least upper bound (transfinite-bounded); and the germ preorder of
record sequences carries genuine lax-idempotence slack, possible only where
antisymmetry fails (the aperiodic signature). Each regime is a deficiency of
the carrier's bound structure, exhibited by derivation rather than asserted
as regime data. -/
theorem regime_tower :
    (∀ f : Reading → Reading, (∀ a, Reading.KLE a (f a)) →
        ∀ x, Reading.iter f 3 x = Reading.iter f 4 x)
    ∧ (∀ k r, Record.iter Record.succPos (k + 1) r ≠ Record.iter Record.succPos k r)
    ∧ ((∀ k, ORecord.iter ORecord.osuccPos k ORecord.kBot ≠ ORecord.omegaPos)
        ∧ (∀ k, ORecord.OKLE (ORecord.iter ORecord.osuccPos k ORecord.kBot) ORecord.omegaPos)
        ∧ (∀ b, (∀ k, ORecord.OKLE (ORecord.iter ORecord.osuccPos k ORecord.kBot) b) →
            ORecord.OKLE ORecord.omegaPos b)
        ∧ ORecord.osuccPos ORecord.omegaPos = ORecord.omegaPos)
    ∧ Positing.Value.HasLaxSlack Record.tallyLaxClosure Record.germPreValue.bot :=
  ⟨Reading.settles_by_three, Record.iter_succPos_ne,
    ⟨ORecord.iter_ne_omegaPos, ORecord.iter_le_omegaPos, ORecord.omegaPos_least,
      ORecord.osuccPos_omegaPos⟩,
    Record.tally_lax_slack⟩

/-- **The regime gate is the unattained-settling gate.** On the tower's four
dynamics, a settled value that no finite stage attains exists exactly at the
rungs where `cohomologyVanishes` is `false`: on FOUR every inflationary step
attains its settled value at stage three; on the record the tally increment
fixes nothing; on the completed record the stage-ω value is fixed and no
finite stage reaches it; on the germ carrier the contradiction bump's orbit
is a single point of the germ order while no stage equals the next. -/
theorem unattained_settling_gate :
    (cohomologyVanishes ClosureRegime.strict = true
      ∧ ∀ (f : Reading → Reading), (∀ a, Reading.KLE a (f a)) →
          ∀ x, f (Reading.iter f 3 x) = Reading.iter f 3 x)
    ∧ (cohomologyVanishes ClosureRegime.scott = true
      ∧ ∀ r : Record, Record.succPos r ≠ r)
    ∧ (cohomologyVanishes ClosureRegime.transfiniteBounded = false
      ∧ ORecord.osuccPos ORecord.omegaPos = ORecord.omegaPos
      ∧ ∀ k, ORecord.iter ORecord.osuccPos k ORecord.kBot ≠ ORecord.omegaPos)
    ∧ (cohomologyVanishes ClosureRegime.aperiodic = false
      ∧ (∀ (s : Nat → Record) (k : Nat),
          Record.DomBy (Record.iterSeq Record.topBump k s) s
          ∧ Record.DomBy s (Record.iterSeq Record.topBump k s))
      ∧ ∀ (s : Nat → Record) (k : Nat),
          Record.iterSeq Record.topBump (k + 1) s ≠ Record.iterSeq Record.topBump k s) :=
  ⟨⟨rfl, fun f hf x => spine_settles_by_three f hf x⟩,
   ⟨rfl, fun r => Record.iter_succPos_ne 0 r⟩,
   ⟨rfl, ORecord.osuccPos_omegaPos, ORecord.iter_ne_omegaPos⟩,
   ⟨rfl, fun s k => (Record.topBump_flux s).1 k,
     fun s k => (Record.topBump_flux s).2.1 k⟩⟩

end Obsmetrologia
