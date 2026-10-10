import Obsmetrologia.Articulation.Articulating.Cell
import Obsmetrologia.Language.Spine

/-!
# Positing.ArticulationMeasure — reading measured from articulation status

`Spine` names the gap directly: *"Nothing in this module derives either
coordinate of a reading... any reading of a supplied `Reading` or `Record` as
[evidence] remains a caller-side requirement, not a construction provided
here."* This module closes that gap for the one coordinate that needs no
caller at all — an articulation cell's own status record already **is** an
evidence pair, once read through the corner convention.

Under the authoritative reading (evidence reading, ruled 2026-08-05,
`docs/history/corner-naming-convention.md`): `absurd = (false,false)` = told
none = `⊥ₖ` (the initial cell), `potential = (true,false)` = told true = `t`,
`active = (false,true)` = told false = `f`, `stable = (true,true)` = told
both = `⊤ₖ`. Since `Reading := Articulating.Corner` definitionally
(`Positing.Reading`), a cell's own `corner` reading already **is** a reading, at
no further cost. `measure` names that identity so a caller can obtain a
reading *from the articulation record itself* — the identity read at two
depths this module is built to state honestly: nothing new is derived, but
what was implicit is made available exactly where `Spine.posit` otherwise
demands an admitted reading from outside.

## Main definitions

* `Articulating.Cell.measure` — the reading read off a cell's own status.
* `Articulating.Cell.meme` — the posit at a cell's own claim, with its reading
  DERIVED via `measure`, not caller-supplied.
* `Articulating.Cell.deltaValuation` — the knowledge-least valuation except at
  a cell's own claim, where it carries the cell's measured reading (the shape
  `ValuationTrace.memeAdvance` folds one step of).
* `Articulating.Cell.statusLe` — the pointwise `≤` order on two cells'
  `(token, claim)` status pairs (no shared utterance required).

## Main results

* `measure_absurd` / `measure_potential` / `measure_active` / `measure_stable`
  — the four tellings, named.
* `meme_initial_reading` — a freshly initial cell (born absurd, told none)
  measures — and posits — to `Reading.kBot`.
* `measure_mono` — `statusLe c d → Reading.leK (measure c) (measure d)`: to
  articulate further only ever raises the measured reading in `≤ₖ`.
* `deltaValuation_mono` — at a shared claim, a status-increasing pair of
  cells measures to a `≤ₖ`-increasing pair of delta valuations.

## What stays open

This module derives *one* coordinate — the reading a cell's own status
supplies — from that status alone. It does not resolve, and does not need to
resolve, whether a *measured* reading and an independently *seeded*
(caller-supplied, `Spine.posit`) reading at the same claim should ever be
required to agree, or how the two interact under settling; that
measured-vs-seeded semantics question is left exactly where
`docs/history/corner-naming-convention.md` leaves it, open.
-/

namespace Obsmetrologia
namespace Articulating.Cell

/-! ## The measured reading -/

/-- The reading measured off a cell's own articulation status. `Reading` and
`Articulating.Corner` are the same four-point type (`Reading :=
Articulating.Corner`, definitional), so this is the identity read at two
depths: the corner a cell already sits in, handed back as its reading. Trivial
definitionally; name-load-bearing because it lets a caller obtain a reading
*from the record itself*, closing the gap `Spine` leaves caller-side. -/
def measure (c : Articulating.Cell) : Reading := c.corner

/-- The posit at a cell's own claim, whose reading is DERIVED from the cell's
own status via `measure` — not admitted by a caller, unlike `Spine.posit`. -/
def meme (c : Articulating.Cell) : Meme :=
  Spine.posit (PredicationCell.seed c.utterance) c.measure

@[simp] theorem meme_cell (c : Articulating.Cell) :
    c.meme.cell = PredicationCell.seed c.utterance := rfl

@[simp] theorem meme_reading (c : Articulating.Cell) :
    c.meme.reading = c.measure := rfl

/-! ## The four tellings, by name -/

@[simp] theorem measure_absurd (u : Utterance) :
    measure (unarticulated u) = Reading.kBot := rfl

@[simp] theorem measure_potential (u : Utterance) :
    measure (articulate u) = Reading.tTop := rfl

/-- The active corner is never articulating's own output — it is reached only
by the value algebra. Exhibited directly, by fiat, as a cell witnessed on the
claim side alone: `⟨u, [], [w]⟩`. This is a value-algebra construction, not an
articulation. -/
@[simp] theorem measure_active (u : Utterance) (w : Token) :
    measure ⟨u, [], [w]⟩ = Reading.tBot := rfl

@[simp] theorem measure_stable (u : Utterance) (w : Token) :
    measure (engage (articulate u) w) = Reading.kTop := rfl

/-- A freshly un-articulated cell (born absurd, told none) measures — and posits —
to the knowledge-bottom reading: the derived and the seeded readings agree at
the one point both are pinned. -/
@[simp] theorem meme_initial_reading (u : Utterance) :
    (Articulating.Cell.unarticulated u).meme.reading = Reading.kBot := rfl

/-! ## Articulating further only raises the measured reading -/

/-- The status order between two (possibly differently uttered) articulation
cells: each of `c`'s two statuses implies the like status of `d`. Stated on
the status pairs themselves — no shared utterance is required, since this
compares evidence tellings, not cells over one claim. -/
def statusLe (c d : Articulating.Cell) : Bool :=
  (!c.subjectArticulated || d.subjectArticulated) && (!c.objectArticulated || d.objectArticulated)

/-- The Bool-only content of `measure_mono`, isolated so the four-bool case
exhaustion below never has to carry an `Utterance` (which `decide` cannot
close over as a free variable). -/
private theorem leK_ofStatus (t1 k1 t2 k2 : Bool)
    (h : ((!t1 || t2) && (!k1 || k2)) = true) :
    Reading.leK (Articulating.Corner.ofStatus t1 k1)
      (Articulating.Corner.ofStatus t2 k2) = true := by
  revert h
  cases t1 <;> cases k1 <;> cases t2 <;> cases k2 <;> decide

/-- **To articulate is to raise `≤ₖ`.** If `d` tells everything `c` tells (and
possibly more), `d`'s measured reading sits above `c`'s in the knowledge order.
Proved by exhausting the four `(token, claim)` bools of each cell — the same
finite-check idiom `Reading.lean` uses throughout. -/
theorem measure_mono (c d : Articulating.Cell) (h : statusLe c d = true) :
    Reading.leK (measure c) (measure d) = true :=
  leK_ofStatus c.subjectArticulated c.objectArticulated d.subjectArticulated d.objectArticulated h

/-! ## The measured bridge to valuations -/

/-- The knowledge-least valuation, except at a cell's own claim, where it
carries the cell's measured reading — the exact shape
`ValuationTrace.memeAdvance` folds in one step, specialized to a
knowledge-least base. -/
def deltaValuation (c : Articulating.Cell) : Valuation :=
  fun φ => if φ = c.meme.cell then c.measure else Reading.kBot

/-- At a **shared** claim (same utterance), a status-increasing pair of cells
measures to a `≤ₖ`-increasing pair of delta valuations: articulation history
driving one claim's reading upward is visible one level up, as a
`Valuation.leK` step. -/
theorem deltaValuation_mono (c d : Articulating.Cell) (hu : c.utterance = d.utterance)
    (h : statusLe c d = true) :
    Valuation.leK c.deltaValuation d.deltaValuation := by
  have hcell : d.meme.cell = c.meme.cell := by simp [meme_cell, hu]
  intro φ
  simp only [deltaValuation, hcell]
  by_cases hφ : φ = c.meme.cell
  · rw [if_pos hφ, if_pos hφ]
    exact measure_mono c d h
  · rw [if_neg hφ, if_neg hφ]
    exact Reading.kBot_leK Reading.kBot

end Articulating.Cell
end Obsmetrologia
