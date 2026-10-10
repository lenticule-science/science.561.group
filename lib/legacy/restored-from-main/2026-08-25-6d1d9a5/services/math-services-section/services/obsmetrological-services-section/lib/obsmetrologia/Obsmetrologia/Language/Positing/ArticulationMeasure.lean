import Obsmetrologia.Articulation.Articulating.Cell
import Obsmetrologia.Language.Spine

/-!
# Positing.ArticulationMeasure — charge measured from articulation status

`Spine` names the gap directly: *"Nothing in this module derives either
coordinate of a charge... any reading of a supplied `Charge` or `Record` as
[evidence] remains a caller-side requirement, not a construction provided
here."* This module closes that gap for the one coordinate that needs no
caller at all — an articulation cell's own status record already **is** an
evidence pair, once read through the corner convention.

Under the authoritative reading (evidence reading, ruled 2026-08-05,
`docs/history/corner-naming-convention.md`): `absurd = (false,false)` = told
none = `⊥ₖ` (the initial cell), `potential = (true,false)` = told true = `t`,
`active = (false,true)` = told false = `f`, `stable = (true,true)` = told
both = `⊤ₖ`. Since `Charge := Articulating.Corner` definitionally
(`Positing.Charge`), a cell's own `corner` reading already **is** a charge, at
no further cost. `measure` names that identity so a caller can obtain a
charge *from the articulation record itself* — the identity read at two
depths this module is built to state honestly: nothing new is derived, but
what was implicit is made available exactly where `Spine.posit` otherwise
demands an admitted charge from outside.

## Main definitions

* `Articulating.Cell.measure` — the charge read off a cell's own status.
* `Articulating.Cell.meme` — the posit at a cell's own claim, with its charge
  DERIVED via `measure`, not caller-supplied.
* `Articulating.Cell.deltaValuation` — the knowledge-least valuation except at
  a cell's own claim, where it carries the cell's measured charge (the shape
  `ValuationTrace.memeAdvance` folds one step of).
* `Articulating.Cell.statusLe` — the pointwise `≤` order on two cells'
  `(token, claim)` status pairs (no shared utterance required).

## Main results

* `measure_absurd` / `measure_potential` / `measure_active` / `measure_stable`
  — the four tellings, named.
* `meme_initial_charge` — a freshly initial cell (born absurd, told none)
  measures — and posits — to `Charge.kBot`.
* `measure_mono` — `statusLe c d → Charge.leK (measure c) (measure d)`: to
  articulate further only ever raises the measured charge in `≤ₖ`.
* `deltaValuation_mono` — at a shared claim, a status-increasing pair of
  cells measures to a `≤ₖ`-increasing pair of delta valuations.

## What stays open

This module derives *one* coordinate — the charge a cell's own status
supplies — from that status alone. It does not resolve, and does not need to
resolve, whether a *measured* charge and an independently *seeded*
(caller-supplied, `Spine.posit`) charge at the same claim should ever be
required to agree, or how the two interact under settling; that
measured-vs-seeded semantics question is left exactly where
`docs/history/corner-naming-convention.md` leaves it, open.
-/

namespace Obsmetrologia
namespace Articulating.Cell

/-! ## The measured charge -/

/-- The charge measured off a cell's own articulation status. `Charge` and
`Articulating.Corner` are the same four-point type (`Charge :=
Articulating.Corner`, definitional), so this is the identity read at two
depths: the corner a cell already sits in, handed back as its charge. Trivial
definitionally; name-load-bearing because it lets a caller obtain a charge
*from the record itself*, closing the gap `Spine` leaves caller-side. -/
def measure (c : Articulating.Cell) : Charge := c.corner

/-- The posit at a cell's own claim, whose charge is DERIVED from the cell's
own status via `measure` — not admitted by a caller, unlike `Spine.posit`. -/
def meme (c : Articulating.Cell) : Meme :=
  Spine.posit (Claim.seed c.utterance) c.measure

@[simp] theorem meme_cell (c : Articulating.Cell) :
    c.meme.cell = Claim.seed c.utterance := rfl

@[simp] theorem meme_charge (c : Articulating.Cell) :
    c.meme.charge = c.measure := rfl

/-! ## The four tellings, by name -/

@[simp] theorem measure_absurd (u : Utterance) :
    measure ⟨u, false, false⟩ = Charge.kBot := rfl

@[simp] theorem measure_potential (u : Utterance) :
    measure ⟨u, true, false⟩ = Charge.tTop := rfl

@[simp] theorem measure_active (u : Utterance) :
    measure ⟨u, false, true⟩ = Charge.tBot := rfl

@[simp] theorem measure_stable (u : Utterance) :
    measure ⟨u, true, true⟩ = Charge.kTop := rfl

/-- A freshly initial cell (born absurd, told none) measures — and posits —
to the knowledge-bottom charge: the derived and the seeded readings agree at
the one point both are pinned. -/
@[simp] theorem meme_initial_charge (u : Utterance) :
    (Articulating.Cell.initial u).meme.charge = Charge.kBot := rfl

/-! ## Articulating further only raises the measured charge -/

/-- The status order between two (possibly differently uttered) articulation
cells: each of `c`'s two statuses implies the like status of `d`. Stated on
the status pairs themselves — no shared utterance is required, since this
compares evidence tellings, not cells over one claim. -/
def statusLe (c d : Articulating.Cell) : Bool :=
  (!c.tokenArticulated || d.tokenArticulated) && (!c.claimArticulated || d.claimArticulated)

/-- The Bool-only content of `measure_mono`, isolated so the four-bool case
exhaustion below never has to carry an `Utterance` (which `decide` cannot
close over as a free variable). -/
private theorem leK_ofStatus (t1 k1 t2 k2 : Bool)
    (h : ((!t1 || t2) && (!k1 || k2)) = true) :
    Charge.leK (Articulating.Corner.ofStatus t1 k1)
      (Articulating.Corner.ofStatus t2 k2) = true := by
  revert h
  cases t1 <;> cases k1 <;> cases t2 <;> cases k2 <;> decide

/-- **To articulate is to raise `≤ₖ`.** If `d` tells everything `c` tells (and
possibly more), `d`'s measured charge sits above `c`'s in the knowledge order.
Proved by exhausting the four `(token, claim)` bools of each cell — the same
finite-check idiom `Charge.lean` uses throughout. -/
theorem measure_mono (c d : Articulating.Cell) (h : statusLe c d = true) :
    Charge.leK (measure c) (measure d) = true :=
  leK_ofStatus c.tokenArticulated c.claimArticulated d.tokenArticulated d.claimArticulated h

/-! ## The measured bridge to valuations -/

/-- The knowledge-least valuation, except at a cell's own claim, where it
carries the cell's measured charge — the exact shape
`ValuationTrace.memeAdvance` folds in one step, specialized to a
knowledge-least base. -/
def deltaValuation (c : Articulating.Cell) : Valuation :=
  fun φ => if φ = c.meme.cell then c.measure else Charge.kBot

/-- At a **shared** claim (same utterance), a status-increasing pair of cells
measures to a `≤ₖ`-increasing pair of delta valuations: articulation history
driving one claim's charge upward is visible one level up, as a
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
    exact Charge.kBot_leK Charge.kBot

end Articulating.Cell
end Obsmetrologia
