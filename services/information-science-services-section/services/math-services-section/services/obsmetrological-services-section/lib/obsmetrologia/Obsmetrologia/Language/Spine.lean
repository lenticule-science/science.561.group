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
`predicate` reads its head as the predicating locus; `posit` admits a
caller-supplied `Charge` at that locus; and `settle` applies an explicit
`Charge.Closure`.  Nothing in `run`'s own composite derives either
coordinate of a charge — `admitted` is a caller-supplied value, the value
algebra's raw material, not a construction of admission.  In particular,
any reading of a supplied `Charge` or `Record` as refutational evidence
remains a caller-side requirement, not a construction provided here.

**The measured composite** (`runTrace`, below `run`) is the re-based spine:
articulate a trace, predicate its cells (`Articulating.orientedCell`),
*measure* the charge from the trace itself (`Obsmetrologia.measure`, ruled
2026-09-21 in `Positing/Measure.lean`) rather than accept it from the
caller, then settle. `run` is kept exactly as it was — the value-algebra
composite, useful whenever a charge is legitimately supplied rather than
measured — and `runTrace` sits beside it as the composite that actually
derives its charge from evidence.
-/

namespace Obsmetrologia
namespace Spine

/-- Typed hands to articulating: the primitive articulated utterance. -/
def articulate (t : Token) (c : Claim) : Articulating :=
  .utter ⟨t, c⟩

/-- Articulating to predicating: the oriented claim locus of the head utterance. -/
def predicate (a : Articulating) : PredicationCell :=
  PredicationCell.seed a.head

/-- Positing admits a caller-supplied FOUR charge at an already-established locus. -/
def posit (locus : PredicationCell) (admitted : Charge) : Meme :=
  ⟨locus, admitted⟩

/-- The record reading of positing uses the existing tally-to-charge readout;
it does not derive the tallies. -/
def positRecord (locus : PredicationCell) (record : Record) : Meme :=
  posit locus record.charge

/-- Settling preserves the predicating locus and applies only the explicitly
supplied closure to the admitted charge. -/
def settle (closure : Charge.Closure) (m : Meme) : Meme :=
  ⟨m.cell, Charge.settle closure m.charge⟩

/-- The literal Mark → Articulating → Predicating → Positing → Settling composite. -/
def run (closure : Charge.Closure) (token claim : Mark) (admitted : Charge) : Meme :=
  settle closure (posit (predicate (articulate ⟨token⟩ ⟨claim⟩)) admitted)

@[simp] theorem predicate_articulate (token claim : Mark) :
    predicate (articulate ⟨token⟩ ⟨claim⟩) = PredicationCell.seed ⟨⟨token⟩, ⟨claim⟩⟩ := rfl

@[simp] theorem posit_cell (locus : PredicationCell) (admitted : Charge) :
    (posit locus admitted).cell = locus := rfl

@[simp] theorem posit_charge (locus : PredicationCell) (admitted : Charge) :
    (posit locus admitted).charge = admitted := rfl

@[simp] theorem positRecord_cell (locus : PredicationCell) (record : Record) :
    (positRecord locus record).cell = locus := rfl

@[simp] theorem positRecord_charge (locus : PredicationCell) (record : Record) :
    (positRecord locus record).charge = record.charge := rfl

/-- Settlement cannot change which predicating locus is being settled. -/
@[simp] theorem settle_cell (closure : Charge.Closure) (m : Meme) :
    (settle closure m).cell = m.cell := rfl

@[simp] theorem settle_charge (closure : Charge.Closure) (m : Meme) :
    (settle closure m).charge = Charge.settle closure m.charge := rfl

/-- The settled charge is fixed by the explicit closure. -/
theorem settle_charge_fixed (closure : Charge.Closure) (m : Meme) :
    closure.op (settle closure m).charge = (settle closure m).charge :=
  Charge.settle_fixed closure m.charge

/-- Settlement is knowledge-inflationary relative to precisely the admitted charge. -/
theorem admitted_le_settled (closure : Charge.Closure) (m : Meme) :
    Charge.KLE m.charge (settle closure m).charge :=
  closure.infl m.charge

@[simp] theorem run_cell (closure : Charge.Closure) (token claim : Mark) (admitted : Charge) :
    (run closure token claim admitted).cell = predicate (articulate ⟨token⟩ ⟨claim⟩) := rfl

/-- The composite's output charge is fixed by its supplied closure. -/
theorem run_charge_fixed (closure : Charge.Closure) (token claim : Mark) (admitted : Charge) :
    closure.op (run closure token claim admitted).charge =
      (run closure token claim admitted).charge :=
  settle_charge_fixed closure (posit (predicate (articulate ⟨token⟩ ⟨claim⟩)) admitted)

/-- The composite settles above its supplied admission; no evidence source is introduced. -/
theorem run_admitted_le_settled (closure : Charge.Closure) (token claim : Mark)
    (admitted : Charge) :
    Charge.KLE admitted (run closure token claim admitted).charge :=
  admitted_le_settled closure (posit (predicate (articulate ⟨token⟩ ⟨claim⟩)) admitted)

/-! ## Spine re-base: the measured composite

`run` above stays exactly as it was — `admitted` is caller-supplied, the
value algebra's raw material, not a construction of admission. `measure`
and `runTrace` are the *measured* composite: the charge is derived from a
trace of articulatings (`Obsmetrologia.measure`, `Positing/Measure.lean`),
not accepted as an opaque input. -/

/-- The measured valuation read off a trace: bare charges only, forgetting
the evidence `Obsmetrologia.measure` carries alongside it. -/
def measure (k : Contrary) (trace : List Articulating) : Valuation :=
  CValuation.value (Obsmetrologia.measured k trace)

/-- **Knowledge-least = un-articulated.** An empty trace measures exactly
the knowledge-least valuation: the value at cells no articulating has
reached. Nothing is seeded onto an articulated cell — it is measured, and an
empty trace has measured nothing. -/
theorem measure_nil_knowledgeLeast (k : Contrary) :
    ∀ φ, measure k [] φ = Valuation.knowledgeLeast φ :=
  fun φ => Obsmetrologia.measure_nil k φ

/-- The re-based composite: articulate a trace, predicate its cells, measure
the charge from the trace itself, then settle. Where `run` accepts a
caller-supplied charge, `runTrace` derives it. -/
def runTrace (closure : Charge.Closure) (k : Contrary) (trace : List Articulating)
    (φ : PredicationCell) : Meme :=
  settle closure ⟨φ, (Obsmetrologia.measure k trace φ).value⟩

@[simp] theorem runTrace_cell (closure : Charge.Closure) (k : Contrary)
    (trace : List Articulating) (φ : PredicationCell) :
    (runTrace closure k trace φ).cell = φ := rfl

/-- The measured composite's output charge is fixed by its supplied closure. -/
theorem runTrace_charge_fixed (closure : Charge.Closure) (k : Contrary)
    (trace : List Articulating) (φ : PredicationCell) :
    closure.op (runTrace closure k trace φ).charge = (runTrace closure k trace φ).charge :=
  Charge.settle_fixed closure (Obsmetrologia.measure k trace φ).value

/-- On an empty trace the measured composite settles exactly the closed
knowledge-least seed: nothing measured, closed. -/
theorem runTrace_nil (closure : Charge.Closure) (k : Contrary) (φ : PredicationCell) :
    (runTrace closure k [] φ).charge = Charge.settle closure Charge.kBot := by
  show Charge.settle closure (Obsmetrologia.measure k [] φ).value
      = Charge.settle closure Charge.kBot
  rw [Obsmetrologia.measure_nil]

/-- The measured composite settles above precisely what was measured — the
closure's inflation, applied to actual evidence rather than a caller-opaque
admission. -/
theorem runTrace_measured_le_settled (closure : Charge.Closure) (k : Contrary)
    (trace : List Articulating) (φ : PredicationCell) :
    Charge.KLE (Obsmetrologia.measure k trace φ).value (runTrace closure k trace φ).charge :=
  closure.infl (Obsmetrologia.measure k trace φ).value

end Spine
end Obsmetrologia
