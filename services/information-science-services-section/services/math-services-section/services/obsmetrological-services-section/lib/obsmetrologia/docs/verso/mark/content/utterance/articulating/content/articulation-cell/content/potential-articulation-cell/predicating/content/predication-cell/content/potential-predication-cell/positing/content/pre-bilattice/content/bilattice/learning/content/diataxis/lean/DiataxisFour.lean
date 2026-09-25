import Obsmetrologia.Language.Positing.Quartet

/-!
# DiataxisFour — the documentation quartet is the recurring FOUR

> **Home & verification.** This module is recorded in `content/` as the formal artifact
> of the `diataxis` node (`../diataxis.md`), beside the paper it witnesses
> (`../docs/explanations/diataxis-is-the-recurring-four.md`). It is written against the
> `Obsmetrologia` Lean library and was checked there with **zero axioms**
> (`lean_verify Obsmetrologia.Diataxis.diataxis_is_recurring_four`). It does not build in
> place — it imports `Obsmetrologia.Language.Positing.Quartet`. To re-check: copy this file
> into the Obsmetrologia lake project (e.g. `Obsmetrologia/Language/Positing/`), add it to the
> `Obsmetrologia` import root, and run `lake build` / `lean_diagnostic_messages`.

The corpus already *uses* Diátaxis (tutorial / how-to / explanation / reference) as a
documentation discipline laid **over** the mathematics. This module proves the
stronger claim of the companion paper: the Diátaxis quartet is **not an overlay**, it
is *another incarnation of the same four-corner object* `Corner` already met as
articulation phase, bilattice `Reading`, `Modal` `{neither,◇,□,both}`, and the
predicate `Generator`s (`QuartetRecurrence`).

The bijection is **forced** by Diátaxis's own two axes. Daniele Procida splits the
four documents on two independent binary axes:

* **acquisition ↔ application** ("study" vs "work"): tutorials/explanation serve
  acquisition; how-to/reference serve application;
* **action ↔ cognition** ("practical steps" vs "theoretical knowledge"):
  tutorials/how-to are practical; explanation/reference are theoretical.

These are exactly the two articulation coordinates `(token, claim)` (= `Reading.pos`,
`Reading.neg`): `token`-articulated **is** *application* (orienting to use/work) and
`claim`-articulated **is** *cognition* (orienting to the proposition/why). So:

| Diátaxis     | `Corner`    | `(token, claim)` | `Reading` | Procida axes              |
|--------------|-------------|------------------|----------|---------------------------|
| `tutorial`   | `absurd`    | `(no, no)`       | `⊥ₖ`     | acquisition + action      |
| `howTo`      | `potential` | `(yes, no)`      | `t`      | application + action      |
| `explanation`| `active`    | `(no, yes)`      | `f`      | acquisition + cognition   |
| `reference`  | `stable`    | `(yes, yes)`     | `⊤ₖ`     | application + cognition   |

Because the bijection lands on `Reading`, Diátaxis inherits the **bilattice's two
graded orders** — Procida draws a flat 2×2, but the four modes secretly carry:

* the **knowledge order** `≤ₖ` (how decontextualized / how much is spelled out):
  `tutorial (⊥ₖ) <ₖ howTo, explanation <ₖ reference (⊤ₖ)` — the scaffolding gradient;
* the **truth order** `≤ₜ` (how definite/actionable):
  `explanation (f) <ₜ tutorial, reference <ₜ howTo (t)`.

and the **Klein-four symmetry** `K₄ = ⟨~, −⟩` becomes the two Diátaxis *diagonals*:

* `conflate −` = `tutorial ↔ reference` (the **learning↔lookup** duality): reverses
  `≤ₖ`, preserves `≤ₜ`, fixes `howTo`/`explanation`;
* `negate  ~` = `howTo ↔ explanation` (the **doing↔understanding** duality): reverses
  `≤ₜ`, preserves `≤ₖ`, fixes `tutorial`/`reference`.

Every theorem here is `cases`/`decide`-closed, so the bundle depends on no axioms
beyond the existing keystone's `{propext, Quot.sound}` (in fact none).
-/

namespace Obsmetrologia

open Articulating

/-! ## The Diátaxis four-corner -/

/-- The four **Diátaxis** documentation modes, named for their canonical role. Each
constructor is one corner of the recurring FOUR; the data lives entirely in
`Corner` (see `toCorner`), so this carries nothing new. -/
inductive Diataxis where
  /-- A learning-oriented guided run — neither the task nor the claim presupposed
  (the `absurd`/`⊥ₖ` corner). -/
  | tutorial
  /-- A task-oriented procedure — the concrete task (`token`) articulated, the why
  (`claim`) not (the `potential`/`t` corner). -/
  | howTo
  /-- An understanding-oriented account — the why (`claim`) articulated, no concrete
  task (the `active`/`f` corner). -/
  | explanation
  /-- An information-oriented specification — both sides articulated, fully
  decontextualized (the `stable`/`⊤ₖ` corner). -/
  | reference
  deriving DecidableEq, Repr, Inhabited

namespace Diataxis

/-- The complete list of modes. -/
def all : List Diataxis := [tutorial, howTo, explanation, reference]

/-! ## (1) Diátaxis IS `Corner` — the conflation bijection -/

/-- Read a Diátaxis mode as its articulation/reading corner. -/
def toCorner : Diataxis → Corner
  | tutorial    => Corner.absurd
  | howTo       => Corner.potential
  | explanation => Corner.active
  | reference   => Corner.stable

/-- Read a corner as the Diátaxis mode it indexes. -/
def ofCorner : Corner → Diataxis
  | Corner.absurd    => tutorial
  | Corner.potential => howTo
  | Corner.active    => explanation
  | Corner.stable    => reference

@[simp] theorem ofCorner_toCorner (d : Diataxis) : ofCorner (toCorner d) = d := by
  cases d <;> rfl
@[simp] theorem toCorner_ofCorner (c : Corner) : toCorner (ofCorner c) = c := by
  cases c <;> rfl

/-- **`Diataxis ≃ Corner`.** The documentation quartet is the SAME object as the
articulation phase / bilattice reading / modal four / predicate generators — re-met
under documentation names. This is the `Bij` the recurrence record consumes. -/
def cornerBij : Bij Diataxis Corner where
  to := toCorner
  inv := ofCorner
  left := ofCorner_toCorner
  right := toCorner_ofCorner

/-- Exhaustive: exactly four documentation modes — no fifth surface. -/
theorem card_four : all.length = 4 := rfl

/-! ## (2) The two axes are Procida's two axes (faithfully)

`token`-articulated (`Reading.pos`) is *application* (study↔work); `claim`-articulated
(`Reading.neg`) is *cognition* (practical↔theoretical). The groupings below are
exactly Procida's compass. -/

/-- The **application** coordinate (Procida's acquisition↔application axis): is the
concrete task/`token` articulated? -/
def application (d : Diataxis) : Bool := Reading.pos (toCorner d)

/-- The **cognition** coordinate (Procida's action↔cognition axis): is the
proposition/`claim` articulated? -/
def cognition (d : Diataxis) : Bool := Reading.neg (toCorner d)

/-- The application column is exactly `{howTo, reference}` — Procida's "work" side. -/
theorem application_iff (d : Diataxis) :
    application d = true ↔ d = howTo ∨ d = reference := by
  cases d <;> decide

/-- The cognition row is exactly `{explanation, reference}` — Procida's "theory"
side. -/
theorem cognition_iff (d : Diataxis) :
    cognition d = true ↔ d = explanation ∨ d = reference := by
  cases d <;> decide

/-- The `(application, cognition)` pair is exactly the four-corner status of the
mode's corner: the Diátaxis compass IS the `(token, claim)` partition. -/
theorem axes_eq_fourCorner (d : Diataxis) :
    (application d, cognition d) = FourCorner.ofCorner (toCorner d) := by
  cases d <;> rfl

/-! ## (3) The K₄ symmetry is the two Diátaxis diagonals

`conflate` and `negate` (the bilattice's two order-dualities) act on `Reading = Corner`;
transported along `cornerBij` they are the two diagonal swaps of the Diátaxis square. -/

/-- The **learning↔lookup** duality `conflate −` (the main diagonal): swaps the
fully-scaffolded `tutorial` with the fully-decontextualized `reference`, fixing the
two middles. Reverses `≤ₖ`, preserves `≤ₜ`. -/
def lookupDual (d : Diataxis) : Diataxis := ofCorner (Reading.conflate (toCorner d))

/-- The **doing↔understanding** duality `negate ~` (the anti-diagonal): swaps the
definite `howTo` with the discursive `explanation`, fixing `tutorial`/`reference`.
Reverses `≤ₜ`, preserves `≤ₖ`. -/
def doingDual (d : Diataxis) : Diataxis := ofCorner (Reading.negate (toCorner d))

@[simp] theorem lookupDual_tutorial    : lookupDual tutorial    = reference   := rfl
@[simp] theorem lookupDual_reference   : lookupDual reference   = tutorial    := rfl
@[simp] theorem lookupDual_howTo       : lookupDual howTo       = howTo       := rfl
@[simp] theorem lookupDual_explanation : lookupDual explanation = explanation := rfl

@[simp] theorem doingDual_howTo        : doingDual howTo        = explanation := rfl
@[simp] theorem doingDual_explanation  : doingDual explanation  = howTo       := rfl
@[simp] theorem doingDual_tutorial     : doingDual tutorial     = tutorial    := rfl
@[simp] theorem doingDual_reference    : doingDual reference    = reference   := rfl

/-- Both dualities are involutions, they commute, and their composite is the
**antipode** (`negConf`, swapping both diagonals) — the Klein-four `K₄ = ℤ/2 × ℤ/2`
of the documentation square, exactly `Reading.klein_four` re-met on `Diataxis`. -/
theorem klein_four (d : Diataxis) :
    lookupDual (lookupDual d) = d
      ∧ doingDual (doingDual d) = d
      ∧ lookupDual (doingDual d) = doingDual (lookupDual d)
      ∧ lookupDual (doingDual d) = ofCorner (Reading.negConf (toCorner d)) := by
  cases d <;> decide

/-! ## (4) The headline — Diátaxis is yet another face of the recurring four -/

/-- The bundle certifying that `Diataxis` joins `quartet_recurrence`: it bijects with
`Corner` (hence with `FourCorner`, `Reading`, `Modal`, `Generator`), it is exhaustively
four, its two axes are Procida's two axes / the `(token, claim)` partition, and its
two diagonals are the bilattice's K₄ dualities. -/
structure DiataxisIsRecurringFour where
  /-- `Diataxis → Corner → Diataxis = id`. -/
  diataxis_corner_diataxis : ∀ d : Diataxis, ofCorner (toCorner d) = d
  /-- `Corner → Diataxis → Corner = id` (so `Diataxis` is exactly `Corner`). -/
  corner_diataxis_corner : ∀ c : Corner, toCorner (ofCorner c) = c
  /-- The compass `(application, cognition)` is the `(token, claim)` four-corner. -/
  axes_are_status : ∀ d : Diataxis,
    (application d, cognition d) = FourCorner.ofCorner (toCorner d)
  /-- Exhaustive: exactly four modes. -/
  card_four : all.length = 4
  /-- The learning↔lookup diagonal is `conflate`. -/
  lookup_is_conflate : ∀ d : Diataxis,
    lookupDual d = ofCorner (Reading.conflate (toCorner d))
  /-- The doing↔understanding diagonal is `negate`. -/
  doing_is_negate : ∀ d : Diataxis,
    doingDual d = ofCorner (Reading.negate (toCorner d))

/-- **THE DIÁTAXIS FACE.** The documentation quartet is the recurring FOUR: the same
four-corner object `quartet_recurrence` exhibits as articulation phase, bilattice
reading, modal four, and predicate generators is *also* the Diátaxis tetrad, with
Procida's two axes the `(token, claim)` partition and Procida's two diagonals the
bilattice K₄. No axioms. -/
theorem diataxis_is_recurring_four : DiataxisIsRecurringFour where
  diataxis_corner_diataxis := ofCorner_toCorner
  corner_diataxis_corner := toCorner_ofCorner
  axes_are_status := axes_eq_fourCorner
  card_four := card_four
  lookup_is_conflate := fun _ => rfl
  doing_is_negate := fun _ => rfl

/-- Composed with the keystone's modal reading: a Diátaxis mode names a modal corner —
`tutorial ↦ neither`, `howTo ↦ ◇`, `explanation ↦ □`, `reference ↦ both`. The
documentation compass and the `{neither,◇,□,both}` modal square are one object. -/
def toModal (d : Diataxis) : Modal := Modal.ofCorner (toCorner d)

@[simp] theorem toModal_tutorial    : toModal tutorial    = Modal.neither := rfl
@[simp] theorem toModal_howTo       : toModal howTo       = Modal.dia     := rfl
@[simp] theorem toModal_explanation : toModal explanation = Modal.box     := rfl
@[simp] theorem toModal_reference   : toModal reference   = Modal.both    := rfl

end Diataxis

end Obsmetrologia
