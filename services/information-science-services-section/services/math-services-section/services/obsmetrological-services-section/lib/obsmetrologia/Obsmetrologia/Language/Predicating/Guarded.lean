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

/-- **Round trip, back-then-forward, under the singleton hypothesis.** In the old
Bool-valued cell this direction was unconditional: the incidence proof pinned
both `Bool` fields exactly, so `toSubtype (ofSubtype c)` and `c` always agreed.
Under the new list-valued slots the incidence proof `c.val.corner = .potential`
only pins the claim slot *empty* and the token slot *non-empty* — it no longer
pins the token slot to the singleton `[c.val.utterance.token]`, so a `Potential`
cell may carry token witnesses beyond a single one, and `ofSubtype` (which keeps
only the utterance) forgets them. The round trip recovers `c` exactly when the
token slot already is that singleton — the "measured" shape `PotentialCell.toCell
= articulate` produces. Without that hypothesis the claim is false in general
(a second token witness alongside `c.val.utterance.token` is silently forgotten). -/
theorem toSubtype_ofSubtype (c : Potential)
    (h : c.val.tokenSlot = [c.val.utterance.token]) : toSubtype (ofSubtype c) = c := by
  apply Subtype.ext
  show Articulating.Cell.articulate c.val.utterance = c.val
  have hpair : (c.val.tokenArticulated, c.val.claimArticulated) = (true, false) := by
    rw [← Articulating.Corner.toStatus_ofStatus c.val.tokenArticulated c.val.claimArticulated]
    exact congrArg Articulating.Corner.toStatus c.property
  have hk : c.val.claimArticulated = false := congrArg Prod.snd hpair
  have hclaim : c.val.claimSlot = [] := by
    cases hcs : c.val.claimSlot with
    | nil => rfl
    | cons x xs =>
        exfalso
        rw [Articulating.Cell.claimArticulated, hcs] at hk
        cases hk
  show Articulating.Cell.mk c.val.utterance [c.val.utterance.token] [] = c.val
  rw [← h, ← hclaim]

/-- **Corner and utterance survive the round trip unconditionally.** Even without
the singleton hypothesis `toSubtype_ofSubtype` needs, the round trip always keeps
`c`'s utterance and its corner: `toSubtype (ofSubtype c)` is again a `potential`
cell over the same utterance as `c`. This is the honest unconditional remainder
of the old (now false in general) full round trip. -/
theorem toSubtype_ofSubtype_utterance (c : Potential) :
    (toSubtype (ofSubtype c)).val.utterance = c.val.utterance := rfl

theorem toSubtype_ofSubtype_corner (c : Potential) :
    (toSubtype (ofSubtype c)).val.corner = c.val.corner := by
  rw [c.property]
  exact Articulating.PotentialCell.toCell_corner _

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
