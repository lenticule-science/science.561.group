import Obsmetrologia.Articulation.Articulating

/-!
# Articulation Cell — articulating's codomain

An **articulation cell** is what an utterance *becomes* once articulating acts on
it: the utterance together with a record, for each side, of whether that side has
been articulated. Two independent binary statuses (token-articulated,
claim-articulated) give exactly **four** cells — the partition the utterance's pair
structure was for.

By `(token, claim)` articulation status the four corners are:

| Cell        | token | claim | reading                                           |
|-------------|-------|-------|---------------------------------------------------|
| `absurd`    | no    | no    | neither side told — the initial cell               |
| `potential` | yes   | no    | told true: token articulated, claim not            |
| `active`    | no    | yes   | told false: claim articulated, token not            |
| `stable`    | yes   | yes   | told both: both sides articulated                   |

Nothing free is introduced: a cell is an `Utterance` plus two `Bool`s, and the
four corners are *derived* as the image of `Bool × Bool`. The headline result is
`Articulating.Corner.card_eq_four`: there are exactly four cells — proven, not postulated.

**Naming convention (authoritative, ruled 2026-08-05).** This table — the
*evidence reading* — is the deliberate convention: `absurd` is the (no, no)
initial cell, the claim with no evidence that holds only because nothing
constrains it; `stable` is the (yes, yes) told-both terminus, the ≤ₖ-absorbing
point no further telling can move. RelMath and `assets/legacy/` prose use the
older rotated labeling (`potential` initial, `absurd` both-told) and are kept
as honest history. See `docs/history/corner-naming-convention.md`.
-/

namespace Obsmetrologia

/-- A cell of articulating's codomain: the utterance, plus whether each side has
been articulated. Pure structure over `Utterance` and `Bool` — no new data. -/
structure Articulating.Cell where
  utterance : Utterance
  tokenArticulated : Bool
  claimArticulated : Bool
  deriving DecidableEq, Repr, Inhabited

/-- The typed potential cell: an utterance told true (token articulated, claim not).
This is the Type-level carrier from which predicating proceeds. -/
structure Articulating.PotentialCell where
  utterance : Utterance
  deriving DecidableEq, Repr, Inhabited

/-- The four corners of the partition. These are *names* for the four points of
`Bool × Bool`; they carry no data of their own. -/
inductive Articulating.Corner where
  /-- Neither side articulated — told none. The initial cell: the claim that
  holds only because nothing constrains it. -/
  | absurd
  /-- Token articulated, claim not — told true. -/
  | potential
  /-- Claim articulated, token not — told false. -/
  | active
  /-- Both sides articulated — told both. -/
  | stable
  deriving DecidableEq, Repr, Inhabited

namespace Articulating.Corner

/-- The complete list of corners. -/
def all : List Articulating.Corner := [absurd, potential, active, stable]

/-- Classify a `(token, claim)` status pair into its corner. The bijection with
`Bool × Bool` runs through here. -/
def ofStatus : Bool → Bool → Articulating.Corner
  | false, false => absurd
  | true,  false => potential
  | false, true  => active
  | true,  true  => stable

/-- The inverse: the `(token, claim)` status pair a corner stands for. -/
def toStatus : Articulating.Corner → Bool × Bool
  | absurd    => (false, false)
  | potential => (true,  false)
  | active    => (false, true)
  | stable    => (true,  true)

@[simp] theorem ofStatus_toStatus (c : Articulating.Corner) :
    ofStatus (c.toStatus.1) (c.toStatus.2) = c := by cases c <;> rfl

@[simp] theorem toStatus_ofStatus (t k : Bool) :
    (ofStatus t k).toStatus = (t, k) := by cases t <;> cases k <;> rfl

/-- Every corner appears in `all`. -/
theorem mem_all (c : Articulating.Corner) : c ∈ all := by cases c <;> simp [all]

/-- `all` lists the corners without repetition. -/
theorem nodup_all : all.Nodup := by decide

/-- **There are exactly four cells.** The headline of this stage: the partition's
cardinality is four — derived from the two-sidedness of the utterance, not posited.
One kind would give two, three would give eight; two gives four. -/
theorem card_eq_four : all.length = 4 := rfl

end Articulating.Corner

namespace Articulating.Cell

/-- The corner a cell sits in, read off its two statuses. -/
def corner (c : Articulating.Cell) : Articulating.Corner :=
  Articulating.Corner.ofStatus c.tokenArticulated c.claimArticulated

/-- The cell over `u` whose initial presentation carries neither telling. -/
def initial (u : Utterance) : Articulating.Cell := ⟨u, false, false⟩

@[simp] theorem corner_initial (u : Utterance) : (initial u).corner = .absurd := rfl

end Articulating.Cell

namespace Articulating.PotentialCell

/-- Forget a typed potential cell (told true) to the ambient articulation cell. -/
def toCell (c : Articulating.PotentialCell) : Articulating.Cell :=
  ⟨c.utterance, true, false⟩

@[simp] theorem toCell_corner (c : Articulating.PotentialCell) :
    c.toCell.corner = Articulating.Corner.potential := rfl

/-- Build the typed potential cell carried by an utterance. -/
def initial (u : Utterance) : Articulating.PotentialCell := ⟨u⟩

@[simp] theorem toCell_initial (u : Utterance) :
    (initial u).toCell = ⟨u, true, false⟩ := rfl

end Articulating.PotentialCell

namespace Articulating.Cell

/-- The corner classification is surjective onto the four corners: every corner is
realized by some cell over any chosen utterance. The partition has no empty cell. -/
theorem corner_surjective (u : Utterance) (k : Articulating.Corner) :
    ∃ c : Articulating.Cell, c.corner = k := by
  refine ⟨⟨u, k.toStatus.1, k.toStatus.2⟩, ?_⟩
  simp [corner, Articulating.Corner.ofStatus_toStatus]

end Articulating.Cell

end Obsmetrologia
