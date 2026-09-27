import Obsmetrologia.Articulation.Articulating

/-!
# Articulation Cell — articulating's codomain

A **cell** is an utterance together with, on each of its two hands, the witnesses
that hand has been articulated by: `tokenSlot` and `claimSlot`. A hand is
articulated when its slot holds a witness, and the four corners are the four
patterns of which hands are articulated. A slot only grows; nothing is ever removed
from it, so a cell keeps every witness it was given.

**Articulating places the token.** To articulate an utterance `u` is to put its own
token in the token slot: `articulate u := ⟨u, [u.token], []⟩`. A freshly articulated
cell is therefore at `potential`, never at `absurd`: articulating never produces the
empty cell. **Engaging** puts a witness in the claim slot, reaching `stable`:
`engage c w := { c with claimSlot := w :: c.claimSlot }`.

| Corner      | token hand      | claim hand      |
|-------------|-----------------|-----------------|
| `absurd`    | not articulated | not articulated |
| `potential` | articulated     | not articulated |
| `active`    | not articulated | articulated     |
| `stable`    | articulated     | articulated     |

`absurd` is the un-articulated position, where a cell would sit before any
articulation reaches it. `active` has the claim hand articulated without the token
hand. Articulating produces neither, since it always places the token; both are
reached only downstream of articulating.

These are articulation's names for its corners. How the same four points read as
values, in positing's knowledge and truth orders, belongs to positing
(`Language/Positing/FourCorner.lean`).

Nothing free is introduced: a cell is an `Utterance` plus two witness `Slot`s (each
a `List Token`), and the four corners are *derived* from whether each slot is
empty. The headline result is `Articulating.Corner.card_eq_four`: there are
exactly four corners, proven, not postulated.
-/

namespace Obsmetrologia

/-- A slot: the witnesses carried on one side of a cell. Lossless: it only grows.
Witnesses are tokens — "the mark is a token" (`reading.schema.json`, voidmath) —
on both the token side and the claim side. -/
abbrev Slot := List Token

/-- A cell of articulating's codomain: the utterance, plus, on each side, the
witnesses that side has been articulated by. Presence in a slot is that side's
status; the four corners are the four presence patterns. -/
structure Articulating.Cell where
  utterance : Utterance
  tokenSlot : Slot
  claimSlot : Slot
  deriving DecidableEq, Repr, Inhabited

/-- The typed potential cell: an utterance at the potential corner (token hand
articulated, claim hand not).
This is the Type-level carrier from which predicating proceeds. -/
structure Articulating.PotentialCell where
  utterance : Utterance
  deriving DecidableEq, Repr, Inhabited

/-- The four corners of the partition. These are *names* for the four points of
`Bool × Bool`; they carry no data of their own. -/
inductive Articulating.Corner where
  /-- Neither hand articulated: the un-articulated position. -/
  | absurd
  /-- Token hand articulated, claim hand not. -/
  | potential
  /-- Claim hand articulated, token hand not. -/
  | active
  /-- Both hands articulated. -/
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

/-- A slot emptied by appending two slots is empty exactly when both were:
`(l ++ m).isEmpty = l.isEmpty && m.isEmpty`. Structural on `l`. -/
theorem List.isEmpty_append (l m : Slot) :
    (l ++ m).isEmpty = (l.isEmpty && m.isEmpty) := by
  cases l <;> rfl

namespace Articulating.Cell

/-- Whether the token side has been articulated: the token slot carries a witness. -/
def tokenArticulated (c : Articulating.Cell) : Bool := !c.tokenSlot.isEmpty

/-- Whether the claim side has been articulated: the claim slot carries a witness. -/
def claimArticulated (c : Articulating.Cell) : Bool := !c.claimSlot.isEmpty

/-- The corner a cell sits in, read off its two statuses. -/
def corner (c : Articulating.Cell) : Articulating.Corner :=
  Articulating.Corner.ofStatus c.tokenArticulated c.claimArticulated

/-- **Articulating measures**: the utterance's own token is the witness placed on
the token side; the claim side is left free. -/
def articulate (u : Utterance) : Articulating.Cell := ⟨u, [u.token], []⟩

/-- **The articulated cell is potential, never absurd.** Articulating never
produces the un-articulated position. -/
@[simp] theorem articulate_corner (u : Utterance) :
    (articulate u).corner = Articulating.Corner.potential := rfl

/-- **Engaging**: a witness in the claim slot articulates the claim hand, without
disturbing whatever the token hand already carries. -/
def engage (c : Articulating.Cell) (w : Token) : Articulating.Cell :=
  { c with claimSlot := w :: c.claimSlot }

/-- Engaging a freshly articulated cell reaches `stable`: both hands articulated. -/
@[simp] theorem engage_articulate_corner (u : Utterance) (w : Token) :
    (engage (articulate u) w).corner = Articulating.Corner.stable := rfl

/-- Engaging never touches the token hand's status. -/
theorem engage_tokenArticulated (c : Articulating.Cell) (w : Token) :
    (engage c w).tokenArticulated = c.tokenArticulated := rfl

/-- **The un-articulated position**: both slots empty, the `absurd` corner. This is
where a cell *would* be before any articulation; it is not articulating's output. -/
def unarticulated (u : Utterance) : Articulating.Cell := ⟨u, [], []⟩

@[simp] theorem unarticulated_corner (u : Utterance) :
    (unarticulated u).corner = Articulating.Corner.absurd := rfl

/-- Merge: slotwise union — the witnesses of both cells, kept. -/
def merge (c d : Articulating.Cell) : Articulating.Cell :=
  ⟨c.utterance, c.tokenSlot ++ d.tokenSlot, c.claimSlot ++ d.claimSlot⟩

/-- Merging is a join on the token side's status. -/
private theorem tokenArticulated_merge (c d : Articulating.Cell) :
    (merge c d).tokenArticulated = (c.tokenArticulated || d.tokenArticulated) := by
  show (!((c.tokenSlot ++ d.tokenSlot).isEmpty)) = (!c.tokenSlot.isEmpty || !d.tokenSlot.isEmpty)
  rw [List.isEmpty_append]
  cases c.tokenSlot.isEmpty <;> cases d.tokenSlot.isEmpty <;> rfl

/-- Merging is a join on the claim side's status. -/
private theorem claimArticulated_merge (c d : Articulating.Cell) :
    (merge c d).claimArticulated = (c.claimArticulated || d.claimArticulated) := by
  show (!((c.claimSlot ++ d.claimSlot).isEmpty)) = (!c.claimSlot.isEmpty || !d.claimSlot.isEmpty)
  rw [List.isEmpty_append]
  cases c.claimSlot.isEmpty <;> cases d.claimSlot.isEmpty <;> rfl

/-- The corner of a merge is the presence-join of the corners (= knowledge join):
a side is articulated in the merge exactly when it was articulated on the left or
on the right. -/
theorem corner_merge (c d : Articulating.Cell) :
    (merge c d).corner = Articulating.Corner.ofStatus (c.tokenArticulated || d.tokenArticulated)
                                         (c.claimArticulated || d.claimArticulated) := by
  show Articulating.Corner.ofStatus (merge c d).tokenArticulated (merge c d).claimArticulated =
    Articulating.Corner.ofStatus (c.tokenArticulated || d.tokenArticulated)
      (c.claimArticulated || d.claimArticulated)
  rw [tokenArticulated_merge, claimArticulated_merge]

/-- Structural helper: membership survives appending on the right. Proved by
induction on the membership proof itself (`List.Mem.head`/`List.Mem.tail`), not
through any `propext`-routed `List.mem_append` lemma. -/
private theorem mem_append_left {t : Token} {l : Slot} (m : Slot) (h : t ∈ l) :
    t ∈ l ++ m := by
  induction h with
  | head as => exact List.Mem.head _
  | tail b _ ih => exact List.Mem.tail b ih

/-- **Lossless on the token side**: no token witness is lost by merging. -/
theorem mem_tokenSlot_merge_left (c d : Articulating.Cell) (t : Token)
    (h : t ∈ c.tokenSlot) : t ∈ (merge c d).tokenSlot :=
  mem_append_left d.tokenSlot h

/-- **Lossless on engaging**: the witness just supplied is present in the claim
slot. -/
theorem mem_claimSlot_engage (c : Articulating.Cell) (w : Token) :
    w ∈ (engage c w).claimSlot :=
  List.Mem.head _

end Articulating.Cell

namespace Articulating.PotentialCell

/-- Forget a typed potential cell to the ambient articulation cell: articulating
places the utterance's token. -/
def toCell (c : Articulating.PotentialCell) : Articulating.Cell :=
  Articulating.Cell.articulate c.utterance

@[simp] theorem toCell_corner (c : Articulating.PotentialCell) :
    c.toCell.corner = Articulating.Corner.potential := rfl

/-- Build the typed potential cell carried by an utterance. -/
def initial (u : Utterance) : Articulating.PotentialCell := ⟨u⟩

@[simp] theorem toCell_initial (u : Utterance) :
    (initial u).toCell = ⟨u, [u.token], []⟩ := rfl

end Articulating.PotentialCell

namespace Articulating

/-- The cell an articulating produces: the floor articulates; a pair engages the
head's articulation with the token of the utterance immediately below it. -/
def cell : Articulating → Articulating.Cell
  | .utter u => Articulating.Cell.articulate u
  | .pair u a => Articulating.Cell.engage (Articulating.Cell.articulate u) a.head.token

@[simp] theorem cell_utter (u : Utterance) : cell (.utter u) = Articulating.Cell.articulate u := rfl

@[simp] theorem cell_pair (u : Utterance) (a : Articulating) :
    cell (.pair u a) = Articulating.Cell.engage (Articulating.Cell.articulate u) a.head.token := rfl

/-- **Only potential and stable are articulated.** Absurd and active are never
the output of articulating; they are reached only downstream of it. -/
theorem cell_corner (a : Articulating) :
    (cell a).corner = Articulating.Corner.potential ∨ (cell a).corner = Articulating.Corner.stable := by
  cases a with
  | utter u => exact Or.inl (Articulating.Cell.articulate_corner u)
  | pair u a => exact Or.inr (Articulating.Cell.engage_articulate_corner u a.head.token)

theorem cell_corner_ne_absurd (a : Articulating) : (cell a).corner ≠ Articulating.Corner.absurd := by
  rcases cell_corner a with h | h <;> rw [h] <;> intro hc <;> cases hc

theorem cell_corner_ne_active (a : Articulating) : (cell a).corner ≠ Articulating.Corner.active := by
  rcases cell_corner a with h | h <;> rw [h] <;> intro hc <;> cases hc

/-- The cell's token witness is the head's token. -/
theorem head_token_mem_tokenSlot (a : Articulating) : a.head.token ∈ (cell a).tokenSlot := by
  cases a with
  | utter u => exact List.Mem.head _
  | pair u a => exact List.Mem.head _

end Articulating

namespace Articulating.Cell

/-- The corner classification is surjective onto the four corners: every corner is
realized by some cell over any chosen utterance. The partition has no empty cell.
Exhibited directly: the un-articulated position, the articulated cell, a cell
with only its claim hand witnessed (built directly, not by articulating), and an
engaged cell. -/
theorem corner_surjective (u : Utterance) (k : Articulating.Corner) :
    ∃ c : Articulating.Cell, c.corner = k := by
  cases k
  · exact ⟨unarticulated u, rfl⟩
  · exact ⟨articulate u, rfl⟩
  · exact ⟨⟨u, [], [u.token]⟩, rfl⟩
  · exact ⟨engage (articulate u) u.token, rfl⟩

end Articulating.Cell

end Obsmetrologia
