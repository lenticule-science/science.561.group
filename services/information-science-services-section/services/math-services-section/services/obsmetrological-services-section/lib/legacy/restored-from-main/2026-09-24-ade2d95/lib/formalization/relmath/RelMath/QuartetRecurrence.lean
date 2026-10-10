/-
# QuartetRecurrence — the keystone: one four-corner coherence cell met at every depth

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
  with `Corner` (and hence with `FourCorner = Bool × Bool` and `Charge = Corner`).
* **(B) The MASTER CONFLATION** `quartet_recurrence`: ArticulationCell-phase,
  `FourCorner`, `Charge` (= `Corner`), the NuclearQuartet corner index, and `Modal`
  are all ONE object — the chain of bijections composes coherently to the identity.
* **(C) The COHERENCE 2-CELL.** An abstract `CommutingPair` with a Corner-indexed
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
import RelMath.FourCornerCell
import RelMath.NucleusAndCommutingNuclei
import RelMath.KleinFourGauge

namespace RelMath

/-! ## (A) The MODAL FOUR — `{neither, ◇, □, both}` -/

/-- The **modal four-corner**: the {neither, ◇, □, both} reading of the recurring
FOUR. Each constructor names a way of acting on the free carrier with the two
commuting closures:

* `neither` — apply neither nucleus (the free carrier, `potential`),
* `dia` (= ◇) — apply `j₁` alone (`active`),
* `box` (= □) — apply `j₂` alone (`stable`),
* `both` — apply both, `π = j₁∘j₂` (`absurd`). -/
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
`neither ↦ potential`, `dia ↦ active`, `box ↦ stable`, `both ↦ absurd`. -/
def toCorner : Modal → Corner
  | neither => Corner.potential
  | dia     => Corner.active
  | box     => Corner.stable
  | both    => Corner.absurd

/-- The inverse: a corner read as a modal corner. -/
def ofCorner : Corner → Modal
  | Corner.potential => neither
  | Corner.active    => dia
  | Corner.stable    => box
  | Corner.absurd    => both

@[simp] theorem ofCorner_toCorner (m : Modal) : ofCorner (toCorner m) = m := by
  cases m <;> rfl
@[simp] theorem toCorner_ofCorner (c : Corner) : toCorner (ofCorner c) = c := by
  cases c <;> rfl

/-- **`Corner ≃ Modal`** (the `Bij` record the deps use). The modal four-corner is
the SAME object as the articulation phase / bilattice charge / nuclear-quartet
corner — re-met under modal names. -/
def cornerBij : Bij Corner Modal where
  to := ofCorner
  inv := toCorner
  left := toCorner_ofCorner
  right := ofCorner_toCorner

end Modal

/-! ## (B) The MASTER CONFLATION theorem -/

/-- The bundle of round-trip witnesses certifying that ALL the four-corner readings
are one object: the chains of bijections through `FourCorner`, through `Modal`, and
the articulation-phase identity, each compose to the identity. -/
structure QuartetRecurrence where
  /-- `Corner → FourCorner → Corner = id` (positing's `Bool×Bool` reading is faithful). -/
  corner_fourCorner_corner : ∀ c : Corner, FourCorner.toCorner (FourCorner.ofCorner c) = c
  /-- `Corner → Modal → Corner = id` (the modal reading is faithful). -/
  corner_modal_corner : ∀ c : Corner, Modal.toCorner (Modal.ofCorner c) = c
  /-- `Modal → Corner → Modal = id` (and so `Modal` is exactly `Corner`). -/
  modal_corner_modal : ∀ m : Modal, Modal.ofCorner (Modal.toCorner m) = m
  /-- The articulation phase of a cell, as a four-corner, IS its bilattice charge
  (reused from `articulation_phase_is_charge`). -/
  articulation_is_charge : ∀ c : ArticulationCell,
    FourCorner.toCorner c.fourCorner = c.corner
  /-- Exhaustive: there are exactly four corners — no fifth reading. -/
  card_four : Corner.all.length = 4

/-- **THE KEYSTONE — the master conflation.** ArticulationCell-phase, `FourCorner`
(`Bool × Bool`), `Charge` (= `Corner`), the NuclearQuartet corner index, and `Modal`
are ALL ONE object: every reading's round-trip is the identity, the articulation
phase is the charge, and the cell is exhaustively four-cornered. This is the corpus's
"one four-corner cell met at successive depths," made a single theorem.

Each field is `rfl`/`cases`-proven or a reuse of a dep lemma, so the whole bundle
depends on at most `{propext, Quot.sound}` (in fact: no axioms). -/
theorem quartet_recurrence : QuartetRecurrence where
  corner_fourCorner_corner := FourCorner.toCorner_ofCorner
  corner_modal_corner := Modal.toCorner_ofCorner
  modal_corner_modal := Modal.ofCorner_toCorner
  articulation_is_charge := articulation_phase_is_charge
  card_four := Corner.card_eq_four

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

/-- The Corner-indexed family of **corner operators** — the four ways of acting:

* `potential` ↦ identity (the free corner),
* `active`    ↦ `f` alone,
* `stable`    ↦ `g` alone,
* `absurd`    ↦ `f ∘ g` (the doubly-acted corner). -/
def cornerOp (c : Corner) (a : C) : C :=
  match c with
  | .potential => a
  | .active    => P.f a
  | .stable    => P.g a
  | .absurd    => P.f (P.g a)

@[simp] theorem cornerOp_potential (a : C) : P.cornerOp .potential a = a := rfl
@[simp] theorem cornerOp_active (a : C) : P.cornerOp .active a = P.f a := rfl
@[simp] theorem cornerOp_stable (a : C) : P.cornerOp .stable a = P.g a := rfl
@[simp] theorem cornerOp_absurd (a : C) : P.cornerOp .absurd a = P.f (P.g a) := rfl

/-- **THE RECURRING COHERENCE 2-CELL.** The `absurd` corner operator (`f∘g`) is the
doubly-acted corner; the generic square coherence says both paths from the free
corner agree — `f (g a) = g (f a)` — restated through `cornerOp`. This single lemma
is the commuting-square 2-cell that recurs at every depth. -/
theorem square (a : C) :
    P.cornerOp .absurd a = (fun a => P.g (P.f a)) a :=
  P.comm a

end CommutingPair

/-! ### Instance 1 — twistoring (articulating's birth-corner) -/

open Charge in
/-- **Twistoring** as a commuting pair on `Charge`: `f = negate` (∼, the slot swap),
`g = conflate` (−, the complemented swap). They commute by the K₄ law
`negate (conflate a) = conflate (negate a)` (`Charge.negate_conflate_comm`, the same
fact `KleinFour.K4.act_mul` + `mul_comm` package as a group identity). At THIS depth
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

/-- The bundle witnessing that twistoring and commutating are the SAME coherence
2-cell: each instance satisfies the generic `CommutingPair.square` at every point, and
the underlying Corner index is exhaustively four. The two `square` fields are the
*same* generic lemma instantiated at the two depths. -/
structure TwistoringEqCommutating where
  /-- The twistoring commuting square (σ∘Δ-shaped here as ∼∘−): the generic coherence
  at the articulating birth-corner. -/
  twistoring_square : ∀ a : Charge,
    twistoringPair.cornerOp .absurd a = (fun a => twistoringPair.g (twistoringPair.f a)) a
  /-- The commutating commuting square: the generic coherence on a settled
  fiber-algebra, for ANY commuting-nuclei pair. -/
  commutating_square : ∀ (H : Order.HeytingAlgebra) (Q : Order.CommutingNuclei H)
    (a : H.carrier),
    (commutatingPair Q).cornerOp .absurd a
      = (fun a => (commutatingPair Q).g ((commutatingPair Q).f a)) a
  /-- Both four-corner cells exhaust the SAME four `Corner`s — no fifth corner at
  either depth (`Corner.card_eq_four`). -/
  card_four : Corner.all.length = 4

/-- **Twistoring = commutating.** The σ∘Δ = Δ∘σ commuting square at
aperiodic settling and the ∼∘− = −∘∼ twist at the articulating birth-corner are the
SAME coherence 2-cell: both are instances of the single generic `CommutingPair.square`,
and both index the same exhaustive four `Corner`s. This is exactly the corpus's claim
that commutating is "the analogue, on settled fiber-algebras, of twistoring at the
articulating birth-corner."

The depth-specific laws differ — at articulating the pair are involutions
(∼∘∼ = id), at settling idempotent nuclei (j∘j = j) — but neither law enters the
shared cell, which is only the commuting square. -/
theorem twistoring_eq_commutating : TwistoringEqCommutating where
  twistoring_square := twistoringPair.square
  commutating_square := fun _ Q => (commutatingPair Q).square
  card_four := Corner.card_eq_four

end RelMath
