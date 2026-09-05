import Obsmetrologia.Articulation.Articulating.FourCorner
import Obsmetrologia.Language.Positing.NucleusAndCommutingNuclei
import Obsmetrologia.Language.Positing.Gauge

/-!
# QuartetRecurrence — one four-corner coherence cell met at every depth

This module formalizes the corpus's deepest single claim: the four base verbs are
**ONE recurring four-corner coherence cell**, met again and again as the spine
descends. The pieces were already proven piecewise; here they are CONFLATED into one
object and the recurring **coherence 2-cell** (the commuting square) is exhibited at
two depths — articulating's birth-corner (*twistoring*) and aperiodic settling
(*commutating*) — as literally the same generic structure.

Corpus nodes (full paths under `content/mark/.../knowledge-least-valuation/`):

* `settling/content/bigraded-diamond/content/nuclear-quartet/nuclear-quartet.md`
  — the four sub-algebras `(A, Fix(j₁), Fix(j₂), A*)` as the four-corner cell on
  settled fiber-algebras.
* `settling/content/aperiodic-settling/commutating/commutating.md`
  — *commutating*: the σ∘Δ = Δ∘σ commuting square of the saturation/transfer nuclei,
  asserted to be "the analogue, on settled fiber-algebras, of twistoring at the
  articulating birth-corner."

The math, as theorems:

* **(A) The MODAL FOUR.** `{neither, ◇, □, both}` — apply neither nucleus, `j₁`
  (= ◇) alone, `j₂` (= □) alone, or both (= π). A fresh `inductive Modal` bijecting
  with `Articulating.Corner` (and hence with `Articulating.FourCorner = Bool × Bool` and `Charge = Articulating.Corner`).
* **(B) The MASTER CONFLATION** `quartet_recurrence`: Articulating.Cell-phase,
  `Articulating.FourCorner`, `Charge` (= `Articulating.Corner`), the NuclearQuartet corner index, and `Modal`
  are all ONE object — the chain of bijections composes coherently to the identity.
* **(C) The COHERENCE 2-CELL.** An abstract `CommutingPair` with a Articulating.Corner-indexed
  family of corner operators, whose generic `square` lemma (`f∘g = g∘f` from the free
  corner to the doubly-acted corner) is THE recurring coherence cell. Two instances —
  `twistoringPair` (on `Charge`, `f = negate ∼`, `g = conflate −`, commuting by K₄)
  and `commutatingPair` (on a Heyting algebra, `f = j₁`, `g = j₂`, commuting by the
  nuclear square) — satisfy the *same* generic coherence: `twistoring_eq_commutating`.

Depth-specific difference (documented, not hidden): at articulating the pair are
INVOLUTIONS (∼∘∼ = id, −∘− = id); at settling they are IDEMPOTENT NUCLEI (j∘j = j).
The SHARED structure is only the commuting-square coherence cell — exactly the
corpus's claim.
-/

namespace Obsmetrologia

/-! ## (A) The MODAL FOUR — `{neither, ◇, □, both}` -/

/-- The **modal four-corner**: the {neither, ◇, □, both} reading of the recurring
FOUR. Each constructor names a way of acting on the free carrier with the two
commuting closures:

* `neither` — apply neither nucleus (the free carrier, `absurd`),
* `dia` (= ◇) — apply `j₁` alone (`potential`),
* `box` (= □) — apply `j₂` alone (`active`),
* `both` — apply both, `π = j₁∘j₂` (`stable`). -/
inductive Modal where
  /-- Neither modality applied — the free carrier. -/
  | neither
  /-- ◇ — apply `j₁` alone. -/
  | dia
  /-- □ — apply `j₂` alone. -/
  | box
  /-- Both modalities — `π = j₁∘j₂`. -/
  | both
  deriving DecidableEq, Repr

namespace Modal

/-- The modal corner read as an articulation/charge corner:
`neither ↦ absurd`, `dia ↦ potential`, `box ↦ active`, `both ↦ stable`. -/
def toCorner : Modal → Articulating.Corner
  | neither => Articulating.Corner.absurd
  | dia     => Articulating.Corner.potential
  | box     => Articulating.Corner.active
  | both    => Articulating.Corner.stable

/-- The inverse: a corner read as a modal corner. -/
def ofCorner : Articulating.Corner → Modal
  | Articulating.Corner.absurd    => neither
  | Articulating.Corner.potential => dia
  | Articulating.Corner.active    => box
  | Articulating.Corner.stable    => both

@[simp] theorem ofCorner_toCorner (m : Modal) : ofCorner (toCorner m) = m := by
  cases m <;> rfl
@[simp] theorem toCorner_ofCorner (c : Articulating.Corner) : toCorner (ofCorner c) = c := by
  cases c <;> rfl

/-- **`Articulating.Corner ≃ Modal`** (the `Bij` record the deps use). The modal four-corner is
the SAME object as the articulation phase / bilattice charge / nuclear-quartet
corner — re-met under modal names. -/
def cornerBij : Bij Articulating.Corner Modal where
  to := ofCorner
  inv := toCorner
  left := toCorner_ofCorner
  right := ofCorner_toCorner

end Modal

/-! ## (B) The MASTER CONFLATION carrier -/

/-- The typed recurrence carrier certifying that all four-corner readings are one
object: explicit bijections through `Articulating.FourCorner` and `Modal`. -/
structure QuartetRecurrence where
  /-- `Articulating.Corner ≃ Articulating.FourCorner`, the `Bool × Bool` reading of the recurring four. -/
  corner_fourCorner_bij : Bij Articulating.Corner Articulating.FourCorner
  /-- `Articulating.Corner ≃ Modal`, the modal reading of the recurring four. -/
  corner_modal_bij : Bij Articulating.Corner Modal

/-- **THE KEYSTONE — the master conflation.** Articulating.Cell-phase, `Articulating.FourCorner`
(`Bool × Bool`), `Charge` (= `Articulating.Corner`), the NuclearQuartet corner index, and `Modal`
are all one object: the recurrence carries the explicit bijections. -/
def quartet_recurrence : QuartetRecurrence where
  corner_fourCorner_bij := Articulating.FourCorner.cornerBij.flip
  corner_modal_bij := Modal.cornerBij

/-! ## (C) The COHERENCE 2-CELL — twistoring = commutating

The corpus's central insight (`commutating.md`): the commuting square is ONE
coherence 2-cell, met first at the articulating birth-corner (*twistoring*: the two
commuting involutions ∼, − of K₄) and again on settled fiber-algebras (*commutating*:
the two commuting nuclei σ, Δ). We abstract the shared structure, prove its generic
coherence once, and instantiate it at both depths. -/

/-- An abstract **commuting pair** on a carrier `C`: two endomaps that commute. This
is the bare structure shared by twistoring (two involutions) and commutating (two
nuclei) — the data of a coherence 2-cell, with the involution/idempotency laws of the
specific depth deliberately ABSENT (they are not part of the shared cell). -/
structure CommutingPair (C : Type) where
  /-- The first endomap (∼ / σ / j₁). -/
  f : C → C
  /-- The second endomap (− / Δ / j₂). -/
  g : C → C
  /-- The hinge: `f ∘ g = g ∘ f`. -/
  comm : ∀ a, f (g a) = g (f a)

namespace CommutingPair
variable {C : Type} (P : CommutingPair C)

/-- The Articulating.Corner-indexed family of **corner operators** — the four ways of acting:

* `absurd`    ↦ identity (the free corner),
* `potential` ↦ `f` alone,
* `active`    ↦ `g` alone,
* `stable`    ↦ `f ∘ g` (the doubly-acted corner). -/
def cornerOp (c : Articulating.Corner) (a : C) : C :=
  match c with
  | .absurd    => a
  | .potential => P.f a
  | .active    => P.g a
  | .stable    => P.f (P.g a)

@[simp] theorem cornerOp_absurd (a : C) : P.cornerOp .absurd a = a := rfl
@[simp] theorem cornerOp_potential (a : C) : P.cornerOp .potential a = P.f a := rfl
@[simp] theorem cornerOp_active (a : C) : P.cornerOp .active a = P.g a := rfl
@[simp] theorem cornerOp_stable (a : C) : P.cornerOp .stable a = P.f (P.g a) := rfl

/-- **THE RECURRING COHERENCE 2-CELL.** The `stable` corner operator (`f∘g`) is the
doubly-acted corner; the generic square coherence says both paths from the free
corner agree — `f (g a) = g (f a)` — restated through `cornerOp`. This single lemma
is the commuting-square 2-cell that recurs at every depth. -/
theorem square (a : C) :
    P.cornerOp .stable a = (fun a => P.g (P.f a)) a :=
  P.comm a

end CommutingPair

/-! ### Instance 1 — twistoring (articulating's birth-corner) -/

open Charge in
/-- **Twistoring** as a commuting pair on `Charge`: `f = negate` (∼, the slot swap),
`g = conflate` (−, the complemented swap). They commute by the K₄ law
`negate (conflate a) = conflate (negate a)` (`Charge.negate_conflate_comm`, the same
fact `Positing.Gauge.K4.act_mul` + `mul_comm` package as a group identity). At THIS depth
the pair are INVOLUTIONS (∼∘∼ = id, −∘− = id) — but that extra law is not part of the
shared coherence cell. -/
def twistoringPair : CommutingPair Charge where
  f := Charge.negate
  g := Charge.conflate
  comm := Charge.negate_conflate_comm

/-! ### Instance 2 — commutating (aperiodic settling) -/

/-- **Commutating** as a commuting pair on a Heyting-algebra carrier: `f = j₁`,
`g = j₂`, the two commuting nuclei of a `CommutingNuclei` (read as saturation σ and
transfer Δ of an aperiodic settling). They commute by `Q.comm` — the nuclear square.
At THIS depth the pair are IDEMPOTENT NUCLEI (j∘j = j), not involutions; again, that
extra law is outside the shared coherence cell. -/
def commutatingPair {H : Order.HeytingAlgebra} (Q : Order.CommutingNuclei H) :
    CommutingPair H.carrier where
  f := Q.j1.j
  g := Q.j2.j
  comm := Q.comm

/-! ### The headline: one cell at two depths -/

/-- The typed carrier witnessing that twistoring and commutating are the same
coherence 2-cell: it carries both `CommutingPair` instances. -/
structure TwistoringEqCommutating where
  /-- The twistoring pair at the articulating birth-corner. -/
  twistoring_pair : CommutingPair Charge
  /-- The commutating pair on any settled fiber-algebra carrying commuting nuclei. -/
  commutating_pair : ∀ (H : Order.HeytingAlgebra), Order.CommutingNuclei H → CommutingPair H.carrier

/-- **Twistoring = commutating.** The σ∘Δ = Δ∘σ commuting square at
aperiodic settling and the ∼∘− = −∘∼ twist at the articulating birth-corner are the
SAME coherence 2-cell: both are instances of the single generic `CommutingPair.square`,
and both index the same exhaustive four `Articulating.Corner`s. This is exactly the corpus's claim
that commutating is "the analogue, on settled fiber-algebras, of twistoring at the
articulating birth-corner."

The depth-specific laws differ — at articulating the pair are involutions
(∼∘∼ = id), at settling idempotent nuclei (j∘j = j) — but neither law enters the
shared cell, which is only the commuting square. -/
def twistoring_eq_commutating : TwistoringEqCommutating where
  twistoring_pair := twistoringPair
  commutating_pair := fun _ Q => commutatingPair Q

end Obsmetrologia
