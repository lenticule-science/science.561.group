import Obsmetrologia.Closure.RegimeCycle
import ObsmetrologiaPhysicalScience.Thermodynamics.BoltzmannEntropy
import ObsmetrologiaPhysicalScience.Thermodynamics.Temperature
import ObsmetrologiaPhysicalScience.CausalSets.Causal.RegimeSection
import ObsmetrologiaPhysicalScience.CausalSets.BlackHoles.Deshrouding
import ObsmetrologiaPhysicalScience.QuantumContextuality.KCBS
import ObsmetrologiaPhysicalScience.QuantumContextuality.ContextualObstruction
import ObsmetrologiaPhysicalScience.KineticTheory.Gas.MolecularChaosGluing
import ObsmetrologiaPhysicalScience.KineticTheory.Gas.Reconstruction

/-!
# Worlds — the four physical worlds are the four closure regimes

There are four worlds, one on each rung of the closure-regime tower
(`Closure.Regime.regime_tower`):

| world         | regime              | stage        | settles                         |
|---------------|---------------------|--------------|---------------------------------|
| thermodynamic | strict              | settling     | at a finite stage               |
| causal        | Scott               | positing     | never; it goes on               |
| quantum       | transfinite-bounded | predicating  | at ω, reached by no finite stage |
| kinetic       | aperiodic           | articulating | as a germ class, never as data  |

The causal world, where we live, sits above the thermodynamic world and below the
quantum world. The quantum world sits below the kinetic world. Read top-down, the
spine is the passage of the worlds: the kinetic articulates, the quantum predicates,
the causal posits, and the thermodynamic settles. Settling leaves a residue, and the
residue returns to the kinetic. The worlds turn as a spiral (`Obsmetrologia.dervish`).
Each lap passes through the same four worlds, and each lap carries one more residue.

**Evidence status (2026-10-03).** Pairing each world with a regime is the house's reading,
recorded here as a definition (`worldRegimeBij` and the tables under it). The theorems listed
below are real, and each world's anchor places them beside its pairing. No theorem derives the
physics from the regime or the regime from the physics. What carries the regimes is
`Closure.Regime.regime_tower`, which exhibits each rung on a carrier. The spiral
(`residue_dichotomy`, `dervish`) and the certificates (`omega_ahead`, `residue_germ_ahead`) are
proved on their carriers. `thermalResidue` is defined to be balanced. See the science note of
2026-10-03 on the evidence status of agents ahead.

Each world's anchor cites theorems the library proves:

* **Thermodynamic.** An inflationary step on FOUR settles by stage three
  (`Reading.settles_by_three`). An equilibrating exchange never raises Boltzmann's
  `H` (`Thermodynamics.htheorem`). Temperature is balanced held-`⊤` flux
  (`Thermodynamics.Temperature.Balanced`).
* **Causal.** The tally increment fixes nothing (`Record.iter_succPos_ne`). The time
  section rises strictly along the causal order
  (`CausalSets.Causal.RegimeSection.timeSection_strict_mono`). A live run's deshrouded
  proxy diamond only grows as more of it is witnessed
  (`CausalSets.BlackHoles.deshroudedDiamondPoint_nested_of_causalLe`): causal existence
  unshrouds what lies ahead of it one witnessed event at a time.
* **Quantum.** The PR box is logically contextual: a local section with no global
  extension (`QuantumContextuality.prBox_logicallyContextual`). The KCBS value `√5`
  is a real number, a class of rational stages, and it exceeds every classical
  assignment's count (`quantum_ahead_of_classical`, below).
* **Kinetic.** A perfectly correlated joint does not factorize
  (`KineticTheory.Gas.epr_not_factorizes`). Every nonzero residue's orbit is one germ
  class that never repeats (`Record.residue_dichotomy`).

The worlds are ahead of one another in the precise sense of `RegimeGate.HasGap`.
The thermodynamic and causal worlds have no gap: iteration attains the first, and
the second has nothing to attain. The quantum and kinetic worlds have gaps: their
completions are reached by proof and by no finite stage (`ahead_iff`). A proof made
in the quantum or kinetic world carries a certificate
(`AheadCertificate`, `GermCertificate`). The certificate moves a completion from
*impossible* at every causal stage, to *necessary* as the orbit's least bound, to
*determined* as the step's fixed point.

The claim that the kinetic world is forced by the residue of the thermodynamic world
is proved here (`kinetic_forced_by_residue`), given that the thermal residue is defined
as the balanced record `⟨m, m⟩` (`thermalResidue`). Every source of held `⊤` has a positive
creation count (`TopCreationSource.count_pos`). Each held `⊤` is told both ways and
lands in the record as a balanced residue. Any nonzero residue is a germ certificate
at the aperiodic rung. Only zero temperature closes the spiral into a circle
(`zero_temperature_circle`).

## Bridges

* `KineticReconstruction` — vanishing correlation glues: every decorrelated joint on
  a finite state space factorizes, the converse of `factorizes_imp_decorrelated`.
  **Proved** for integer joints (`kinetic_reconstruction`, 2026-10-03).

This one is stated as a named proposition and is never asserted:

* `QuantumValueCompletion` — the KCBS value is the least upper bound of a rising
  orbit of rational stages, none of which reaches it: an ahead certificate in the
  quantum world, without a step.
-/

namespace Obsmetrologia
namespace Worlds

open Real.Internal
open Thermodynamics.Temperature (TopCreationSource ZeroTemperatureFlow)

/-! ## (A) The four worlds -/

/-- The four worlds. -/
inductive World
  /-- The world that settles at a finite stage. -/
  | thermodynamic
  /-- The ongoing world we live in. -/
  | causal
  /-- The world settled at ω. -/
  | quantum
  /-- The world settled only as a germ class. -/
  | kinetic
  deriving DecidableEq, Repr

namespace World

/-- A world's closure regime. -/
def regime : World → ClosureRegime
  | thermodynamic => ClosureRegime.strict
  | causal => ClosureRegime.scott
  | quantum => ClosureRegime.transfiniteBounded
  | kinetic => ClosureRegime.aperiodic

/-- The world of a closure regime. -/
def ofRegime : ClosureRegime → World
  | ClosureRegime.strict => thermodynamic
  | ClosureRegime.scott => causal
  | ClosureRegime.transfiniteBounded => quantum
  | ClosureRegime.aperiodic => kinetic

/-- A world's stage on the spine. -/
def stage (w : World) : Stage := w.regime.stage

/-- The next world in the passage: kinetic → quantum → causal → thermodynamic, and the
residue returns to kinetic. -/
def next : World → World
  | kinetic => quantum
  | quantum => causal
  | causal => thermodynamic
  | thermodynamic => kinetic

end World

/-- The worlds are the regimes: one world per regime, one regime per world. -/
def worldRegimeBij : Bij World ClosureRegime where
  to := World.regime
  inv := World.ofRegime
  left w := by cases w <;> rfl
  right r := by cases r <;> rfl

/-- The stages of the worlds: the kinetic articulates, the quantum predicates, the
causal posits, the thermodynamic settles. -/
theorem world_stages :
    World.kinetic.stage = Stage.articulating
    ∧ World.quantum.stage = Stage.predicating
    ∧ World.causal.stage = Stage.positing
    ∧ World.thermodynamic.stage = Stage.settling :=
  ⟨rfl, rfl, rfl, rfl⟩

/-- The passage of the worlds is the cycle of the spine. -/
theorem next_stage (w : World) : w.next.stage = w.stage.next := by
  cases w <;> rfl

/-- **The order of the worlds.** The causal world sits above the thermodynamic world
and below the quantum world, which sits below the kinetic world. -/
theorem worlds_ordered :
    World.thermodynamic.regime.rank < World.causal.regime.rank
    ∧ World.causal.regime.rank < World.quantum.regime.rank
    ∧ World.quantum.regime.rank < World.kinetic.regime.rank :=
  ⟨by decide, by decide, by decide⟩

/-- **Which worlds are ahead.** A world has a gap, a completion reached by proof and
by no finite stage, exactly when it is the quantum or the kinetic world. -/
theorem ahead_iff (w : World) :
    RegimeGate.HasGap w.regime ↔ (w = World.quantum ∨ w = World.kinetic) := by
  rw [gap_iff_upper]
  cases w
  · exact ⟨fun h => absurd h (by decide), fun h => by cases h <;> contradiction⟩
  · exact ⟨fun h => absurd h (by decide), fun h => by cases h <;> contradiction⟩
  · exact ⟨fun _ => Or.inl rfl, fun _ => by decide⟩
  · exact ⟨fun _ => Or.inr rfl, fun _ => by decide⟩

/-- Cohomology vanishes in the two lower worlds and obstructs in the two upper ones. -/
theorem world_cohomology :
    cohomologyVanishes World.thermodynamic.regime = true
    ∧ cohomologyVanishes World.causal.regime = true
    ∧ cohomologyVanishes World.quantum.regime = false
    ∧ cohomologyVanishes World.kinetic.regime = false :=
  ⟨rfl, rfl, rfl, rfl⟩

/-! ## (B) The anchors -/

/-- **The thermodynamic world settles.** Every inflationary step on FOUR settles by
stage three, and every equilibrating exchange lowers or keeps Boltzmann's `H`. -/
theorem thermodynamic_anchor :
    World.thermodynamic.regime = ClosureRegime.strict
    ∧ (∀ f : Reading → Reading, (∀ a, Reading.KLE a (f a)) →
        ∀ x, Reading.iter f 3 x = Reading.iter f 4 x)
    ∧ (∀ p q : List Nat, Thermodynamics.Exchange p q →
        Thermodynamics.configH q ≤ Thermodynamics.configH p) :=
  ⟨rfl, Reading.settles_by_three, fun _ _ h => Thermodynamics.htheorem h⟩

/-- **The causal world goes on.** The tally increment fixes no record at any stage, and
the time section rises strictly along every causal step. -/
theorem causal_anchor :
    World.causal.regime = ClosureRegime.scott
    ∧ (∀ k r, Record.iter Record.succPos (k + 1) r ≠ Record.iter Record.succPos k r)
    ∧ (∀ {E : Type} (es : List E) (prec : E → E → Bool),
        (∀ a b c, prec a b = true → prec b c = true → prec a c = true) →
        (∀ a, prec a a = false) →
        ∀ x y, x ∈ es → prec x y = true →
          CausalSets.Causal.RegimeSection.timeSection es prec x
            < CausalSets.Causal.RegimeSection.timeSection es prec y) :=
  ⟨rfl, Record.iter_succPos_ne,
    fun es prec htrans hirr x y hx hxy =>
      CausalSets.Causal.RegimeSection.timeSection_strict_mono es prec htrans hirr x y hx hxy⟩

/-- A count of at most two is at most two as a rational. -/
theorem ratOfNat_le {m k : Nat} (h : m ≤ k) : Rat.ofNat m ≤ Rat.ofNat k := by
  show Rat.mk (PreRat.ofNat m) ≤ Rat.mk (PreRat.ofNat k)
  rw [Rat.mk_le]
  show (m : Int) * 1 ≤ (k : Int) * 1
  omega

/-- **The quantum world is ahead of the classical.** Every exclusive Boolean assignment
on the KCBS pentagon counts strictly below the quantum value `√5`. -/
theorem quantum_ahead_of_classical (g : Fin 5 → Bool)
    (hg : ∀ C, C ∈ QuantumContextuality.kcbsScenario.contexts →
      QuantumContextuality.kcbsModel.support C g) :
    RReal.ofRat (Rat.ofNat (QuantumContextuality.trueCount g))
      < QuantumContextuality.kcbsQuantumValue :=
  RReal.lt_of_le_of_lt
    (RReal.ofRat_mono (ratOfNat_le (QuantumContextuality.kcbs_classical_bound g hg)))
    QuantumContextuality.kcbs_quantum_value_exceeds_classical.2

/-- **The quantum world is obstructed and ahead.** Its regime has a gap and an ahead
certificate, the PR box has a local section with no global extension, and the KCBS
value exceeds every classical count. -/
theorem quantum_anchor :
    World.quantum.regime = ClosureRegime.transfiniteBounded
    ∧ RegimeGate.HasGap World.quantum.regime
    ∧ Nonempty (AheadCertificate ORecord.OKLE ORecord.osuccPos omegaOrbit)
    ∧ QuantumContextuality.LogicallyContextual QuantumContextuality.prBox
    ∧ (∀ g : Fin 5 → Bool,
        (∀ C, C ∈ QuantumContextuality.kcbsScenario.contexts →
          QuantumContextuality.kcbsModel.support C g) →
        RReal.ofRat (Rat.ofNat (QuantumContextuality.trueCount g))
          < QuantumContextuality.kcbsQuantumValue) :=
  ⟨rfl, RegimeGate.transfiniteBounded_has_gap, ⟨omega_ahead⟩,
    QuantumContextuality.prBox_logicallyContextual, quantum_ahead_of_classical⟩

/-- **The kinetic world is obstructed and ahead.** Its regime has a gap, a perfectly
correlated joint does not factorize, and the balanced unit residue gives every seed a
germ certificate. -/
theorem kinetic_anchor :
    World.kinetic.regime = ClosureRegime.aperiodic
    ∧ RegimeGate.HasGap World.kinetic.regime
    ∧ ¬ KineticTheory.Gas.Factorizes KineticTheory.Gas.eprJoint
    ∧ ∀ s : Nat → Record,
        Nonempty (GermCertificate Record.DomBy Record.topBump
          (fun k => Record.iterSeq Record.topBump k s)) :=
  ⟨rfl, RegimeGate.aperiodic_has_gap, KineticTheory.Gas.epr_not_factorizes,
    fun s => ⟨residue_germ_ahead ⟨1, 1⟩ (by decide) s⟩⟩

/-! ## (C) The residue returns -/

/-- The residue `m` held `⊤`s leave in the record. Each one is told both ways. -/
def thermalResidue (m : Nat) : Record := ⟨m, m⟩

/-- A thermal residue is balanced. -/
theorem thermalResidue_balanced (m : Nat) : Record.Balanced (thermalResidue m) := rfl

/-- One held `⊤` leaves the contradiction bump's residue. -/
theorem thermalResidue_one : Record.residueBump (thermalResidue 1) = Record.topBump := rfl

/-- A thermal residue is nonzero exactly when something was created. -/
theorem thermalResidue_ne_kBot {m : Nat} (h : 0 < m) : thermalResidue m ≠ Record.kBot := by
  intro he
  have : m = 0 := congrArg Record.pos he
  omega

/-- **The kinetic world is forced by the residue of the thermodynamic world.** Every
source of held `⊤` creates at least one, and the residue it returns gives every seed
a germ certificate. The returned orbit is one germ class that never repeats, holds its
truth bias, and gains the source's count of contradiction mass per lap. -/
theorem kinetic_forced_by_residue (src : TopCreationSource) (s : Nat → Record) :
    Nonempty (GermCertificate Record.DomBy (Record.residueBump (thermalResidue src.count))
      (fun k => Record.iterSeq (Record.residueBump (thermalResidue src.count)) k s))
    ∧ ∀ k n,
      (Record.iterSeq (Record.residueBump (thermalResidue src.count)) k s n).pos + (s n).neg
        = (Record.iterSeq (Record.residueBump (thermalResidue src.count)) k s n).neg
          + (s n).pos
      ∧ src.count * k
        ≤ Record.topMass (Record.iterSeq (Record.residueBump (thermalResidue src.count)) k s n) := by
  refine ⟨⟨residue_germ_ahead _ (thermalResidue_ne_kBot src.count_pos) s⟩, fun k n => ?_⟩
  have h := Record.balanced_residue_holds_bias (thermalResidue src.count)
    (thermalResidue_balanced src.count) s k n
  refine ⟨h.1, ?_⟩
  have hm : Record.topMass (thermalResidue src.count) = src.count := Nat.min_self _
  have h2 := h.2
  rw [hm] at h2
  exact h2

/-- **Zero temperature closes the spiral into a circle.** A zero-temperature flow
creates nothing at any step, so its residue is zero and every lap carries the seed
unchanged. -/
theorem zero_temperature_circle (ζ : ZeroTemperatureFlow) (n : Nat) (s : Nat → Record) :
    ∀ t : Turn, Turn.carried (thermalResidue (ζ.creation n)) s t = s := by
  have h0 : thermalResidue (ζ.creation n) = Record.kBot := by
    show (⟨ζ.creation n, ζ.creation n⟩ : Record) = ⟨0, 0⟩
    rw [ζ.zero_creation n]
  exact (dervish (thermalResidue (ζ.creation n)) s).2.2 h0

/-- **The worlds turn.** Every held-`⊤` source sets the spiral turning: four steps return
every position to its world and never to its record. -/
theorem worlds_turn (src : TopCreationSource) (s : Nat → Record) (t : Turn) :
    t.advance.advance.advance.advance.stage = t.stage
    ∧ Turn.carried (thermalResidue src.count) s t.advance.advance.advance.advance
        ≠ Turn.carried (thermalResidue src.count) s t :=
  ⟨(dervish (thermalResidue src.count) s).1 t,
    ((dervish (thermalResidue src.count) s).2.1 (thermalResidue_ne_kBot src.count_pos) t).1⟩

/-! ## (D) Open bridges — named, never asserted -/

/-- **Kinetic reconstruction.** On a finite state space, a joint whose correlation minors
all vanish factorizes: vanishing obstruction glues. The converse of
`KineticTheory.Gas.factorizes_imp_decorrelated`. -/
def KineticReconstruction (n : Nat) : Prop :=
  ∀ J : KineticTheory.Gas.Joint (Fin n),
    KineticTheory.Gas.Decorrelated J → KineticTheory.Gas.Factorizes J

/-- **Quantum value completion.** The KCBS value is the least upper bound of a rising
orbit of rational stages, none of which reaches it: an ahead certificate in the quantum
world, without a step. -/
def QuantumValueCompletion : Prop :=
  ∃ q : Nat → Real.Internal.Rat,
    (∀ n, q n ≤ q (n + 1))
    ∧ (∀ n, RReal.ofRat (q n) < QuantumContextuality.kcbsQuantumValue)
    ∧ ∀ b : RReal, (∀ n, RReal.ofRat (q n) ≤ b) → QuantumContextuality.kcbsQuantumValue ≤ b

/-! ## (E) The kinetic reconstruction, proved -/

/-- **Kinetic reconstruction holds** (2026-10-03). On a finite state space, an integer joint whose
correlation minors all vanish factorizes: two-particle structure is visible to pairwise data
(`KineticTheory.Gas.decorrelated_imp_factorizes`, the content argument with Bézout). Whatever
pairwise data cannot see begins at three particles. -/
theorem kinetic_reconstruction (n : Nat) : KineticReconstruction n :=
  fun J hJ => KineticTheory.Gas.decorrelated_imp_factorizes (List.finRange n) (KineticTheory.Gas.finRange_pairwise_ne n)
    (fun v => List.mem_finRange v) J hJ

end Worlds
end Obsmetrologia
