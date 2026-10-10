import Obsmetrologia.Articulation.Articulating
import Obsmetrologia.Language.Predicating.Claim
import Obsmetrologia.Language.Positing.Meme
import Obsmetrologia.Language.Positing.Record
import Obsmetrologia.Language.Settling

/-!
# Language spine

The smallest typed composition of the language stages.

`articulate` makes an `Articulating` from two marks; `predicate` reads its
head as the predicating locus; `posit` admits a caller-supplied `Charge` at
that locus; and `settle` applies an explicit `Charge.Closure`.  Nothing in
this module derives either coordinate of a charge.  In particular, any
reading of a supplied `Charge` or `Record` as refutational evidence remains a
caller-side requirement, not a construction provided here.
-/

namespace Obsmetrologia
namespace Spine

/-- Mark to articulating: the primitive articulated utterance. -/
def articulate (token claim : Mark) : Articulating :=
  .utter ⟨token, claim⟩

/-- Articulating to predicating: the oriented claim locus of the head utterance. -/
def predicate (a : Articulating) : Claim :=
  Claim.seed a.head

/-- Positing admits a caller-supplied FOUR charge at an already-established locus. -/
def posit (locus : Claim) (admitted : Charge) : Meme :=
  ⟨locus, admitted⟩

/-- The record reading of positing uses the existing tally-to-charge readout;
it does not derive the tallies. -/
def positRecord (locus : Claim) (record : Record) : Meme :=
  posit locus record.charge

/-- Settling preserves the predicating locus and applies only the explicitly
supplied closure to the admitted charge. -/
def settle (closure : Charge.Closure) (m : Meme) : Meme :=
  ⟨m.cell, Charge.settle closure m.charge⟩

/-- The literal Mark → Articulating → Predicating → Positing → Settling composite. -/
def run (closure : Charge.Closure) (token claim : Mark) (admitted : Charge) : Meme :=
  settle closure (posit (predicate (articulate token claim)) admitted)

@[simp] theorem predicate_articulate (token claim : Mark) :
    predicate (articulate token claim) = Claim.seed ⟨token, claim⟩ := rfl

@[simp] theorem posit_cell (locus : Claim) (admitted : Charge) :
    (posit locus admitted).cell = locus := rfl

@[simp] theorem posit_charge (locus : Claim) (admitted : Charge) :
    (posit locus admitted).charge = admitted := rfl

@[simp] theorem positRecord_cell (locus : Claim) (record : Record) :
    (positRecord locus record).cell = locus := rfl

@[simp] theorem positRecord_charge (locus : Claim) (record : Record) :
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
    (run closure token claim admitted).cell = predicate (articulate token claim) := rfl

/-- The composite's output charge is fixed by its supplied closure. -/
theorem run_charge_fixed (closure : Charge.Closure) (token claim : Mark) (admitted : Charge) :
    closure.op (run closure token claim admitted).charge =
      (run closure token claim admitted).charge :=
  settle_charge_fixed closure (posit (predicate (articulate token claim)) admitted)

/-- The composite settles above its supplied admission; no evidence source is introduced. -/
theorem run_admitted_le_settled (closure : Charge.Closure) (token claim : Mark)
    (admitted : Charge) :
    Charge.KLE admitted (run closure token claim admitted).charge :=
  admitted_le_settled closure (posit (predicate (articulate token claim)) admitted)

end Spine
end Obsmetrologia
