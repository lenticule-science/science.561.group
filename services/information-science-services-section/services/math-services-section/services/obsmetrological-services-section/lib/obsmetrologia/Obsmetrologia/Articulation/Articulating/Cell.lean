import Obsmetrologia.Articulation.Articulating

/-!
# Articulation Cell — articulating's codomain

Articulating opens the space of possible predications. A predication has two
positions, a **subject** and an **object**, and the claim is the relation between
them, not a third position. A **cell** is an utterance together with a slot for each
position: `subjectSlot` and `objectSlot`, each the list of token witnesses that fill
it. A position is filled when its slot holds a witness, and the four corners are the
four patterns of which positions are filled. A slot only grows; nothing is ever
removed from it, so a cell keeps every witness it was given.

**Articulating fills the subject.** To articulate an utterance `u` is to put its own
token in the subject slot: `articulate u := ⟨u, [u.token], []⟩`. A freshly
articulated cell is therefore at `potential`, never at `absurd`: articulating never
produces the empty cell. **Engaging** puts a token in the object slot, reaching
`stable`: `engage c w := { c with objectSlot := w :: c.objectSlot }`. In the
articulating recursion, `pair u a` engages the head's cell with the token of the
utterance beneath it, so the tail supplies the head's object.

| Corner      | subject    | object     |
|-------------|------------|------------|
| `absurd`    | empty      | empty      |
| `potential` | filled     | empty      |
| `active`    | empty      | filled     |
| `stable`    | filled     | filled     |

`absurd` is the un-articulated position, where a cell would sit before any
articulation reaches it. `active` has an object without a subject. Articulating
produces neither, since it always fills the subject; both are reached only
downstream of articulating.

These are articulation's names for its corners. Value does not enter here: how the
same four points read as values, in positing's knowledge and truth orders, belongs
to positing (`Language/Positing/FourCorner.lean`).

Nothing free is introduced: a cell is an `Utterance` plus two witness `Slot`s (each
a `List Token`), and the four corners are *derived* from whether each slot is
empty. The headline result is `Articulating.Corner.card_eq_four`: there are
exactly four corners, proven, not postulated.
-/

namespace Obsmetrologia

/-- A slot: the witnesses filling one position of a cell. Lossless: it only grows.
Witnesses are tokens — "the mark is a token" (`reading.schema.json`, voidmath) —
in both the subject and the object position. -/
abbrev Slot := List Token

/-- A cell of articulating's codomain: the utterance, plus, for each position
(subject, object), the witnesses that fill it. Presence in a slot is that position's
status; the four corners are the four presence patterns. -/
structure Articulating.Cell where
  utterance : Utterance
  subjectSlot : Slot
  objectSlot : Slot
  deriving DecidableEq, Repr, Inhabited

/-- The typed potential cell: an utterance at the potential corner (subject filled,
object not).
This is the Type-level carrier from which predicating proceeds. -/
structure Articulating.PotentialCell where
  utterance : Utterance
  deriving DecidableEq, Repr, Inhabited

/-- The four corners of the partition. These are *names* for the four points of
`Bool × Bool`; they carry no data of their own. -/
inductive Articulating.Corner where
  /-- Neither position filled: the un-articulated position. -/
  | absurd
  /-- Subject filled, object not. -/
  | potential
  /-- Object filled, subject not. -/
  | active
  /-- Subject and object both filled. -/
  | stable
  deriving DecidableEq, Repr, Inhabited

namespace Articulating.Corner

/-- The complete list of corners. -/
def all : List Articulating.Corner := [absurd, potential, active, stable]

/-- Classify a `(subject, object)` status pair into its corner. The bijection with
`Bool × Bool` runs through here. -/
def ofStatus : Bool → Bool → Articulating.Corner
  | false, false => absurd
  | true,  false => potential
  | false, true  => active
  | true,  true  => stable

/-- The inverse: the `(subject, object)` status pair a corner stands for. -/
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
cardinality is four — derived from the predication's two positions, not posited.
One position would give two, three would give eight; two gives four. -/
theorem card_eq_four : all.length = 4 := rfl

end Articulating.Corner

/-- A slot emptied by appending two slots is empty exactly when both were:
`(l ++ m).isEmpty = l.isEmpty && m.isEmpty`. Structural on `l`. -/
theorem List.isEmpty_append (l m : Slot) :
    (l ++ m).isEmpty = (l.isEmpty && m.isEmpty) := by
  cases l <;> rfl

namespace Articulating.Cell

/-- Whether the subject is filled: the subject slot carries a witness. -/
def subjectArticulated (c : Articulating.Cell) : Bool := !c.subjectSlot.isEmpty

/-- Whether the object is filled: the object slot carries a witness. -/
def objectArticulated (c : Articulating.Cell) : Bool := !c.objectSlot.isEmpty

/-- The corner a cell sits in, read off its two statuses. -/
def corner (c : Articulating.Cell) : Articulating.Corner :=
  Articulating.Corner.ofStatus c.subjectArticulated c.objectArticulated

/-- **Articulating fills the subject**: the utterance's own token is the witness
placed in the subject slot; the object slot is left empty. -/
def articulate (u : Utterance) : Articulating.Cell := ⟨u, [u.token], []⟩

/-- **The articulated cell is potential, never absurd.** Articulating never
produces the un-articulated position. -/
@[simp] theorem articulate_corner (u : Utterance) :
    (articulate u).corner = Articulating.Corner.potential := rfl

/-- **Engaging**: a token in the object slot fills the object, without disturbing
whatever the subject slot already carries. -/
def engage (c : Articulating.Cell) (w : Token) : Articulating.Cell :=
  { c with objectSlot := w :: c.objectSlot }

/-- Engaging a freshly articulated cell reaches `stable`: subject and object filled. -/
@[simp] theorem engage_articulate_corner (u : Utterance) (w : Token) :
    (engage (articulate u) w).corner = Articulating.Corner.stable := rfl

/-- Engaging never touches the subject's status. -/
theorem engage_subjectArticulated (c : Articulating.Cell) (w : Token) :
    (engage c w).subjectArticulated = c.subjectArticulated := rfl

/-- **The un-articulated position**: both slots empty, the `absurd` corner. This is
where a cell *would* be before any articulation; it is not articulating's output. -/
def unarticulated (u : Utterance) : Articulating.Cell := ⟨u, [], []⟩

@[simp] theorem unarticulated_corner (u : Utterance) :
    (unarticulated u).corner = Articulating.Corner.absurd := rfl

/-- Merge: slotwise union — the witnesses of both cells, kept. -/
def merge (c d : Articulating.Cell) : Articulating.Cell :=
  ⟨c.utterance, c.subjectSlot ++ d.subjectSlot, c.objectSlot ++ d.objectSlot⟩

/-- Merging is a join on the subject's status. -/
private theorem subjectArticulated_merge (c d : Articulating.Cell) :
    (merge c d).subjectArticulated = (c.subjectArticulated || d.subjectArticulated) := by
  show (!((c.subjectSlot ++ d.subjectSlot).isEmpty)) = (!c.subjectSlot.isEmpty || !d.subjectSlot.isEmpty)
  rw [List.isEmpty_append]
  cases c.subjectSlot.isEmpty <;> cases d.subjectSlot.isEmpty <;> rfl

/-- Merging is a join on the object's status. -/
private theorem objectArticulated_merge (c d : Articulating.Cell) :
    (merge c d).objectArticulated = (c.objectArticulated || d.objectArticulated) := by
  show (!((c.objectSlot ++ d.objectSlot).isEmpty)) = (!c.objectSlot.isEmpty || !d.objectSlot.isEmpty)
  rw [List.isEmpty_append]
  cases c.objectSlot.isEmpty <;> cases d.objectSlot.isEmpty <;> rfl

/-- The corner of a merge is the presence-join of the corners (= knowledge join):
a position is filled in the merge exactly when it was filled on the left or on the
right. -/
theorem corner_merge (c d : Articulating.Cell) :
    (merge c d).corner = Articulating.Corner.ofStatus (c.subjectArticulated || d.subjectArticulated)
                                         (c.objectArticulated || d.objectArticulated) := by
  show Articulating.Corner.ofStatus (merge c d).subjectArticulated (merge c d).objectArticulated =
    Articulating.Corner.ofStatus (c.subjectArticulated || d.subjectArticulated)
      (c.objectArticulated || d.objectArticulated)
  rw [subjectArticulated_merge, objectArticulated_merge]

/-- Structural helper: membership survives appending on the right. Proved by
induction on the membership proof itself (`List.Mem.head`/`List.Mem.tail`), not
through any `propext`-routed `List.mem_append` lemma. -/
private theorem mem_append_left {t : Token} {l : Slot} (m : Slot) (h : t ∈ l) :
    t ∈ l ++ m := by
  induction h with
  | head as => exact List.Mem.head _
  | tail b _ ih => exact List.Mem.tail b ih

/-- **Lossless in the subject slot**: no subject witness is lost by merging. -/
theorem mem_subjectSlot_merge_left (c d : Articulating.Cell) (t : Token)
    (h : t ∈ c.subjectSlot) : t ∈ (merge c d).subjectSlot :=
  mem_append_left d.subjectSlot h

/-- **Lossless on engaging**: the witness just supplied is present in the object
slot. -/
theorem mem_objectSlot_engage (c : Articulating.Cell) (w : Token) :
    w ∈ (engage c w).objectSlot :=
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
theorem head_token_mem_subjectSlot (a : Articulating) : a.head.token ∈ (cell a).subjectSlot := by
  cases a with
  | utter u => exact List.Mem.head _
  | pair u a => exact List.Mem.head _

end Articulating

namespace Articulating.Cell

/-- The corner classification is surjective onto the four corners: every corner is
realized by some cell over any chosen utterance. The partition has no empty cell.
Exhibited directly: the un-articulated position, the articulated cell, a cell
with only its object filled (built directly, not by articulating), and an
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
