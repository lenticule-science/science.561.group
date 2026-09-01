import Obsmetrologia.Language.Predicating.Cell

/-!
# Guarded predicating — discharging the blueprint's proof-obligation promise

The blueprint (`docs/blueprint/src/chapters/articulation-predication/02-predication-seed.tex`,
`thm:predicating-proper`) promises that predicating is defined on an articulation
cell **only with a proof that the cell is in the potential corner** — the
incidence argument is meant to be load-bearing, not decorative. The Lean so far
instead reaches predicating through `Articulating.PotentialCell`, an unconstrained
wrapper carrying an utterance with no proof obligation at all: the "potential"-ness
is asserted by the type's name, not demanded by a hypothesis.

This module makes the blueprint literally true. Recall the corner reading
(authoritative, ruled 2026-08-05, `docs/history/corner-naming-convention.md`):
`absurd` = (told none) = ⊥ₖ, the initial cell; `potential` = (told true) = t, one
articulation past absurd; `active` = (told false) = f; `stable` = (told both) =
⊤ₖ. Predicating proceeds from **potential** — told-true — one articulation after
the absurd birth.

What this module derives, from what:

* `Articulating.Cell.predicatingOf` — predicating taking an *explicit* proof
  `c.corner = .potential` as its second argument, built directly against the
  general `Articulating.Cell` rather than the `PotentialCell` wrapper.
* `predicatingOf` agrees with the existing `PredicationCell.predicating` on every
  cell reachable from a `PotentialCell` (`predicatingOf_toCell`).
* The two carriers of "a cell known to be potential" — `PotentialCell` and the
  subtype `{c // c.corner = .potential}` — are in a proof-relevant round trip:
  both composites are the identity, pointwise, no `funext`.
* A cell born `absurd` cannot supply the hypothesis `predicatingOf` demands
  (`absurd_cannot_predicate`) — named honestly in its own docstring as
  constructor-distinctness, not a deep result.

What remains open: this module does not retrofit `PredicationCell.predicating`
itself to take the guard (that would touch `Cell.lean`, which this task does not
edit), nor does it show the round trip is the *only* such equivalence — only that
this one exists and both composites hit the identity.
-/

namespace Obsmetrologia

namespace Articulating.Cell

/-- **Predicating, guarded.** Predicating out of a general articulation cell `c`,
carrying the incidence proof `_h : c.corner = .potential` the blueprint's
`thm:predicating-proper` calls for as an actual argument. Computationally this is
the same seed `PredicationCell.seed` always was — `_h` is not used in the body, it
is the type-level admission ticket the blueprint asks predicating to require. -/
def predicatingOf (c : Articulating.Cell) (_h : c.corner = Articulating.Corner.potential) :
    PredicationCell :=
  PredicationCell.seed c.utterance

end Articulating.Cell

namespace PredicationCell

/-- **The two carriers agree.** Guarded predicating on the cell `pc.toCell`
underlying a typed potential cell, using the proof `toCell_corner` supplies, is the
same predication as the existing `predicating pc`. Both sides reduce to
`seed pc.utterance`, so this holds definitionally. -/
theorem predicatingOf_toCell (pc : Articulating.PotentialCell) :
    Articulating.Cell.predicatingOf pc.toCell (Articulating.PotentialCell.toCell_corner pc)
      = predicating pc :=
  rfl

end PredicationCell

namespace Articulating.PotentialCell

/-- The potential corner subtype: cells carrying their own proof of sitting in the
`potential` corner. The other carrier of "a cell known to be told-true". -/
abbrev Potential := {c : Articulating.Cell // c.corner = Articulating.Corner.potential}

/-- Forward: a typed potential cell embeds into the potential-corner subtype via
`toCell`, carrying the existing `toCell_corner` proof along. -/
def toSubtype (pc : Articulating.PotentialCell) : Potential :=
  ⟨pc.toCell, pc.toCell_corner⟩

/-- Backward: a potential-corner subtype element forgets its incidence proof and
keeps only the underlying utterance. -/
def ofSubtype (c : Potential) : Articulating.PotentialCell :=
  ⟨c.val.utterance⟩

/-- **Round trip, forward-then-back.** Recovering a `PotentialCell` from its own
`toSubtype` image returns the same utterance it started with — pointwise identity,
no `funext`. -/
@[simp] theorem ofSubtype_toSubtype (pc : Articulating.PotentialCell) :
    ofSubtype (toSubtype pc) = pc := rfl

/-- **Round trip, back-then-forward.** A potential-corner subtype element, sent
through `ofSubtype` and back through `toSubtype`, recovers the *same* cell — not
merely an equivalent one. The proof carries no freedom: `h : c.val.corner =
.potential` forces the pair `(tokenArticulated, claimArticulated)` to
`(true, false)` (the only status pair `Corner.ofStatus` sends to `potential`), so
`toSubtype (ofSubtype c)` and `c` share both the utterance and the two `Bool`
fields; the proof components then agree by `Subtype` proof-irrelevance. -/
theorem toSubtype_ofSubtype (c : Potential) : toSubtype (ofSubtype c) = c := by
  apply Subtype.ext
  obtain ⟨⟨u, t, k⟩, hc⟩ := c
  show (Articulating.PotentialCell.toCell ⟨u⟩) = Articulating.Cell.mk u t k
  -- `corner` only reads the two `Bool` fields, so the incidence proof reduces to a
  -- statement about `t k : Bool` alone — `u` drops out entirely.
  have hc' : Articulating.Corner.ofStatus t k = Articulating.Corner.potential := hc
  simp only [Articulating.PotentialCell.toCell]
  cases t <;> cases k <;>
    first
      | rfl
      | exact absurd hc' (by decide)

end Articulating.PotentialCell

namespace Articulating.Cell

/-- **The born cell cannot predicate.** A cell in the `absurd` corner (told none,
the initial cell) can never supply `predicatingOf`'s hypothesis: `absurd` and
`potential` are distinct constructors of `Corner`. This is deliberately kept
shallow — it is a naming of constructor-distinctness, not a deep result — but it
is the honest Lean shape of "predicating cannot proceed straight from the absurd
birth": one articulation, from told-none to told-true, is required first. -/
theorem absurd_cannot_predicate (c : Articulating.Cell) (h : c.corner = Articulating.Corner.absurd) :
    c.corner ≠ Articulating.Corner.potential := by
  rw [h]; decide

end Articulating.Cell

end Obsmetrologia
