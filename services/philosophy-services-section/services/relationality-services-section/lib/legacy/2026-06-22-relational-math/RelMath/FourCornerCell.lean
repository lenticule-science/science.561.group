/-
# FourCornerCell — the recurring four-corner coherence cell (CONNECTIVE TISSUE)

The corpus's deepest claim — asserted in every cluster but formalized in none — is
that the four verbs (articulating, predicating, positing, settling) are **one
recurring four-corner coherence cell** read at successive depths:

  articulation phases {potential, active, stable, absurd}
    ≅ bilattice charges {⊥ₖ, t, f, ⊤ₖ}
    ≅ status pairs (Bool × Bool)
    ≅ nuclear-quartet corners {free, j₁-fix, j₂-fix, both}.

This module pins the **canonical object** `FourCorner := Bool × Bool` and proves the
first *conflation theorem*: the articulation phase of a cell, read as a four-corner,
**is** its bilattice charge (`Charge := Corner`). Articulating and positing are the
same four-corner cell met at two depths — a theorem, not a comment.

This is the seed of `QuartetRecurrence` (the keystone), which extends the chain to
the nuclear quartet and the modal four. No free data.
-/
import RelMath.ArticulationCell
import RelMath.Four

namespace RelMath

/-- The canonical four-corner object: two binary slot-presences. Every quartet in the
corpus is an instance of this. -/
abbrev FourCorner := Bool × Bool

namespace FourCorner

/-- Read a four-corner as an articulation/charge corner. -/
def toCorner (s : FourCorner) : Corner := Corner.ofStatus s.1 s.2
/-- Read a corner as its slot-presence pair. -/
def ofCorner (c : Corner) : FourCorner := Corner.toStatus c

@[simp] theorem toCorner_ofCorner (c : Corner) : toCorner (ofCorner c) = c := by
  cases c <;> rfl
@[simp] theorem ofCorner_toCorner (s : FourCorner) : ofCorner (toCorner s) = s := by
  obtain ⟨a, b⟩ := s; cases a <;> cases b <;> rfl

/-- `FourCorner ≃ Corner` (a bijection), and since `Charge := Corner`, also
`FourCorner ≃ Charge` — the canonical four-corner *is* the bilattice value object. -/
def cornerBij : Bij FourCorner Corner where
  to := toCorner
  inv := ofCorner
  left := ofCorner_toCorner
  right := toCorner_ofCorner

end FourCorner

/-- The articulation phase of a cell, read as a four-corner: `(token, claim)`. -/
def ArticulationCell.fourCorner (c : ArticulationCell) : FourCorner :=
  (c.tokenArticulated, c.claimArticulated)

/-- **Conflation theorem (articulating ≅ positing).** The articulation phase of a
cell, read as a four-corner, is exactly its corner — and `Corner = Charge`, so it is
exactly its bilattice charge. The two-sided `(token, claim)` partition that
articulating produces and the four-point value positing admits are *one object*. -/
theorem articulation_phase_is_charge (c : ArticulationCell) :
    FourCorner.toCorner c.fourCorner = c.corner := rfl

/-- Restated as a charge equality: the cell's articulation phase, as a four-corner,
is a `Charge`. -/
theorem articulation_phase_charge (c : ArticulationCell) :
    (FourCorner.toCorner c.fourCorner : Charge) = c.corner := rfl

/-- The potential (initial) cell sits at the `(false, false)` corner = `⊥ₖ` (the
knowledge-bottom charge positing seeds). The descent's start is one point in both
readings. -/
theorem potential_is_kBot (u : Utterance) :
    FourCorner.toCorner (ArticulationCell.initial u).fourCorner = Charge.kBot := rfl

end RelMath
