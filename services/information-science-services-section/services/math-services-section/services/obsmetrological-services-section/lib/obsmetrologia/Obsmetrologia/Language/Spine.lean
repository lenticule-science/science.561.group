import Obsmetrologia.Articulation.Articulating
import Obsmetrologia.Language.Predicating.Claim
import Obsmetrologia.Language.Positing.Meme
import Obsmetrologia.Language.Positing.Measure
import Obsmetrologia.Language.Positing.Record
import Obsmetrologia.Language.Settling
import Obsmetrologia.Language.Settling.Cones

/-!
# Language spine

The smallest typed composition of the language stages.

`articulate` makes an `Articulating` from a typed token and claim;
`predicate` reads its oriented cell (`Articulating.orientedCell`: the head's
token, the head's claim, the tail's head token) as the predicating locus; `posit` admits a
caller-supplied `Reading` at that locus; and `settle` applies an explicit
`Reading.Closure`.  Nothing in `run`'s own composite derives either
coordinate of a reading — `admitted` is a caller-supplied value, the value
algebra's raw material, not a construction of admission.  In particular,
any reading of a supplied `Reading` or `Record` as refutational evidence
remains a caller-side requirement, not a construction provided here.

**The measured composite** (`runTrace`, below `run`) is the re-based spine:
articulate a trace, predicate its cells (the same `predicate`),
*measure* the reading from the trace itself (`Obsmetrologia.measure`, ruled
2026-09-21 in `Positing/Measure.lean`) rather than accept it from the
caller, then settle. `run` is kept exactly as it was — the value-algebra
composite, useful whenever a reading is legitimately supplied rather than
measured — and `runTrace` sits beside it as the composite that actually
derives its reading from evidence.
-/

namespace Obsmetrologia
namespace Spine

/-- Typed hands to articulating: the primitive articulated utterance. -/
def articulate (t : Token) (c : Claim) : Articulating :=
  .utter ⟨t, c⟩

/-- Articulating to predicating: the oriented cell, the head articulated over the tail. On
the floor (`utter u`) it is the reflexive seed of the one utterance (`predicate_utter`); at
depth one and above its object is the tail's head token, the one composition the recursion
determines without a choice. It is the cell measuring reads by, so the literal composite and
the measured composite predicate alike. -/
def predicate (a : Articulating) : PredicationCell :=
  a.orientedCell

/-- On the floor the spine's predicate is the reflexive seed. -/
@[simp] theorem predicate_utter (u : Utterance) :
    predicate (.utter u) = PredicationCell.seed u := rfl

/-- The spine predicates exactly what measuring reads. -/
theorem predicate_eq_orientedCell (a : Articulating) :
    predicate a = Articulating.orientedCell a := rfl

/-- Depth one generates orientation: the spine's predicate can have subject distinct from object. -/
theorem predicate_oriented :
    ∃ a : Articulating, (predicate a).subject ≠ (predicate a).object :=
  Articulating.orientation_generated

/-- Positing admits a caller-supplied FOUR reading at an already-established locus. -/
def posit (locus : PredicationCell) (admitted : Reading) : Meme :=
  ⟨locus, admitted⟩

/-- The record reading of positing uses the existing tally-to-reading readout;
it does not derive the tallies. -/
def positRecord (locus : PredicationCell) (record : Record) : Meme :=
  posit locus record.reading

/-- Settling preserves the predicating locus and applies only the explicitly
supplied closure to the admitted reading. -/
def settle (closure : Reading.Closure) (m : Meme) : Meme :=
  ⟨m.cell, Reading.settle closure m.reading⟩

/-- The literal Mark → Articulating → Predicating → Positing → Settling composite. -/
def run (closure : Reading.Closure) (token claim : Mark) (admitted : Reading) : Meme :=
  settle closure (posit (predicate (articulate ⟨token⟩ ⟨claim⟩)) admitted)

@[simp] theorem predicate_articulate (token claim : Mark) :
    predicate (articulate ⟨token⟩ ⟨claim⟩) = PredicationCell.seed ⟨⟨token⟩, ⟨claim⟩⟩ := rfl

@[simp] theorem posit_cell (locus : PredicationCell) (admitted : Reading) :
    (posit locus admitted).cell = locus := rfl

@[simp] theorem posit_reading (locus : PredicationCell) (admitted : Reading) :
    (posit locus admitted).reading = admitted := rfl

@[simp] theorem positRecord_cell (locus : PredicationCell) (record : Record) :
    (positRecord locus record).cell = locus := rfl

@[simp] theorem positRecord_reading (locus : PredicationCell) (record : Record) :
    (positRecord locus record).reading = record.reading := rfl

/-- Settlement cannot change which predicating locus is being settled. -/
@[simp] theorem settle_cell (closure : Reading.Closure) (m : Meme) :
    (settle closure m).cell = m.cell := rfl

@[simp] theorem settle_reading (closure : Reading.Closure) (m : Meme) :
    (settle closure m).reading = Reading.settle closure m.reading := rfl

/-- The settled reading is fixed by the explicit closure. -/
theorem settle_reading_fixed (closure : Reading.Closure) (m : Meme) :
    closure.op (settle closure m).reading = (settle closure m).reading :=
  Reading.settle_fixed closure m.reading

/-- Settlement is knowledge-inflationary relative to precisely the admitted reading. -/
theorem admitted_le_settled (closure : Reading.Closure) (m : Meme) :
    Reading.KLE m.reading (settle closure m).reading :=
  closure.infl m.reading

@[simp] theorem run_cell (closure : Reading.Closure) (token claim : Mark) (admitted : Reading) :
    (run closure token claim admitted).cell = predicate (articulate ⟨token⟩ ⟨claim⟩) := rfl

/-- The composite's output reading is fixed by its supplied closure. -/
theorem run_reading_fixed (closure : Reading.Closure) (token claim : Mark) (admitted : Reading) :
    closure.op (run closure token claim admitted).reading =
      (run closure token claim admitted).reading :=
  settle_reading_fixed closure (posit (predicate (articulate ⟨token⟩ ⟨claim⟩)) admitted)

/-- The composite settles above its supplied admission; no evidence source is introduced. -/
theorem run_admitted_le_settled (closure : Reading.Closure) (token claim : Mark)
    (admitted : Reading) :
    Reading.KLE admitted (run closure token claim admitted).reading :=
  admitted_le_settled closure (posit (predicate (articulate ⟨token⟩ ⟨claim⟩)) admitted)

/-! ## Spine re-base: the measured composite

`run` above stays exactly as it was — `admitted` is caller-supplied, the
value algebra's raw material, not a construction of admission. `measure`
and `runTrace` are the *measured* composite: the reading is derived from a
trace of articulatings (`Obsmetrologia.measure`, `Positing/Measure.lean`),
not accepted as an opaque input. -/

/-- The measured valuation read off a trace: bare readings only, forgetting
the evidence `Obsmetrologia.measure` carries alongside it. -/
def measure (k : Contradictory) (trace : List Articulating) : Valuation :=
  CValuation.value (Obsmetrologia.measured k trace)

/-- **Knowledge-least = un-articulated.** An empty trace measures exactly
the knowledge-least valuation: the value at cells no articulating has
reached. Nothing is seeded onto an articulated cell — it is measured, and an
empty trace has measured nothing. -/
theorem measure_nil_knowledgeLeast (k : Contradictory) :
    ∀ φ, measure k [] φ = Valuation.knowledgeLeast φ :=
  fun φ => Obsmetrologia.measure_nil k φ

/-- The re-based composite: articulate a trace, predicate its cells, measure
the reading from the trace itself, then settle. Where `run` accepts a
caller-supplied reading, `runTrace` derives it. -/
def runTrace (closure : Reading.Closure) (k : Contradictory) (trace : List Articulating)
    (φ : PredicationCell) : Meme :=
  settle closure ⟨φ, (Obsmetrologia.measure k trace φ).value⟩

@[simp] theorem runTrace_cell (closure : Reading.Closure) (k : Contradictory)
    (trace : List Articulating) (φ : PredicationCell) :
    (runTrace closure k trace φ).cell = φ := rfl

/-- The measured composite's output reading is fixed by its supplied closure. -/
theorem runTrace_reading_fixed (closure : Reading.Closure) (k : Contradictory)
    (trace : List Articulating) (φ : PredicationCell) :
    closure.op (runTrace closure k trace φ).reading = (runTrace closure k trace φ).reading :=
  Reading.settle_fixed closure (Obsmetrologia.measure k trace φ).value

/-- On an empty trace the measured composite settles exactly the closed
knowledge-least seed: nothing measured, closed. -/
theorem runTrace_nil (closure : Reading.Closure) (k : Contradictory) (φ : PredicationCell) :
    (runTrace closure k [] φ).reading = Reading.settle closure Reading.kBot := by
  show Reading.settle closure (Obsmetrologia.measure k [] φ).value
      = Reading.settle closure Reading.kBot
  rw [Obsmetrologia.measure_nil]

/-- The measured composite settles above precisely what was measured — the
closure's inflation, applied to actual evidence rather than a caller-opaque
admission. -/
theorem runTrace_measured_le_settled (closure : Reading.Closure) (k : Contradictory)
    (trace : List Articulating) (φ : PredicationCell) :
    Reading.KLE (Obsmetrologia.measure k trace φ).value (runTrace closure k trace φ).reading :=
  closure.infl (Obsmetrologia.measure k trace φ).value

end Spine
end Obsmetrologia
