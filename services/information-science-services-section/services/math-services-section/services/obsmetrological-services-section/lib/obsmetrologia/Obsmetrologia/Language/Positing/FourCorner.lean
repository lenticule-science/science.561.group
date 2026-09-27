import Obsmetrologia.Articulation.Articulating.Cell
import Obsmetrologia.Language.Positing.Four

/-!
# FourCorner — the articulation corners read as positing's values

Articulating partitions a cell by which hands of its utterance are articulated: the
four corners `absurd`, `potential`, `active`, `stable` are the four patterns of
`(token articulated, claim articulated)`, the canonical object
`Articulating.FourCorner := Bool × Bool`. Articulation names them and nothing more.

Positing admits value, and its value object is that same four-point object
(`Reading := Articulating.Corner`). This module states the identification at the
positing stage, where values and their two orders exist: a cell's articulation
pattern, read as a value, is its corner (`articulation_phase_is_reading`). The
knowledge-order names of the corners are the house names; the Belnap names
(`⊥ₖ`, `t`, `f`, `⊤ₖ`) are how the same points read in the truth order, which
positing introduces. They are not readings articulating makes.
-/

namespace Obsmetrologia

/-- The canonical four-corner object: which of the utterance's two hands are
articulated. -/
abbrev Articulating.FourCorner := Bool × Bool

namespace Articulating.FourCorner

/-- Read a four-corner as an articulation/reading corner. -/
def toCorner (s : Articulating.FourCorner) : Articulating.Corner := Articulating.Corner.ofStatus s.1 s.2
/-- Read a corner as its slot-presence pair. -/
def ofCorner (c : Articulating.Corner) : Articulating.FourCorner := Articulating.Corner.toStatus c

@[simp] theorem toCorner_ofCorner (c : Articulating.Corner) : toCorner (ofCorner c) = c := by
  cases c <;> rfl
@[simp] theorem ofCorner_toCorner (s : Articulating.FourCorner) : ofCorner (toCorner s) = s := by
  obtain ⟨a, b⟩ := s; cases a <;> cases b <;> rfl

/-- `Articulating.FourCorner ≃ Articulating.Corner`: the four hand-patterns are the four
corners. Since positing's `Reading := Articulating.Corner`, positing's value object is
this same four-point object. -/
def cornerBij : Bij Articulating.FourCorner Articulating.Corner where
  to := toCorner
  inv := ofCorner
  left := ofCorner_toCorner
  right := toCorner_ofCorner

end Articulating.FourCorner

/-- A cell's articulation pattern: whether its token hand and its claim hand are
articulated. -/
def Articulating.Cell.fourCorner (c : Articulating.Cell) : Articulating.FourCorner :=
  (c.tokenArticulated, c.claimArticulated)

/-- **The articulation pattern is the corner.** A cell's `(token, claim)` articulation
pattern, read as a four-corner, is its corner; and since positing's value object is the
corner, positing can read a cell's articulation pattern as a value. -/
theorem articulation_phase_is_reading (c : Articulating.Cell) :
    Articulating.FourCorner.toCorner c.fourCorner = c.corner := rfl

/-- The same identification stated as a value at positing: the cell's articulation
pattern, as a four-corner, is a `Reading`. -/
theorem articulation_phase_reading (c : Articulating.Cell) :
    (Articulating.FourCorner.toCorner c.fourCorner : Reading) = c.corner := rfl

/-- The absurd corner, where neither hand is articulated, is read at positing as the
knowledge-bottom `⊥ₖ`, the value positing seeds before anything is admitted. Articulating
never produces this corner. -/
theorem absurd_is_kBot (u : Utterance) :
    Articulating.FourCorner.toCorner (Articulating.Cell.unarticulated u).fourCorner = Reading.kBot := rfl

/-- A freshly articulated cell is at the potential corner (token hand articulated,
claim hand not). Read at positing in the truth order, that point is the Belnap
value `t`. The truth-order reading is positing's; articulating itself only places
the token. -/
theorem articulate_is_tTop (u : Utterance) :
    Articulating.FourCorner.toCorner (Articulating.Cell.articulate u).fourCorner = Reading.tTop := rfl

end Obsmetrologia
