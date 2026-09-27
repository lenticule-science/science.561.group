import Obsmetrologia.Language.Positing.Reading
import Obsmetrologia.Language.Positing.Four
import Obsmetrologia.Articulation.Articulating.Cell

/-!
# Evidence — the lossless reading carrier

**Owner ruling 2026-09-21.** A reading alone (`Reading`, `Articulating.Corner`) is
value with no memory of how it got there. `Valued` restores that memory: it
bundles a `value : Reading` with `evidence : Slot × Slot`, the witnesses actually
carried on each side — the same two slots a `Articulating.Cell` carries.
**Articulating measures**: `Valued.ofCell` reads a cell's own corner as its
value and its own slots as its evidence, and the two agree by construction
(`ofCell_measured`). `Valued.Measured` names that agreement as a `Prop`: the
value is *exactly* what the evidence shows, no more, no less.

Evidence is **lossless** by the same discipline as `Slot`: the value ops here
(`joinK`, `meetK`, `joinT`, `meetT`) all union the evidence on both sides,
whatever they do to the value. `joinK` keeps `Measured` — presence-union is
exactly what knowledge-join computes (`joinK_measured`). `meetK` does **not**:
two measured chargeds can meet to a value strictly below what their combined
evidence would show. This is the ruling's central case —
**absurd reached, witnesses kept** (`meetK_not_measured`): a potential told
by one witness, met with an active told by another, collapses in *value* to
⊥ₖ while both witnesses remain on record. That is how "absurd, told nothing"
(the un-articulated position) differs from "absurd, two tellings cancelled" —
the same value, a different history, and the history is the evidence that
never gets thrown away (`evidence_accumulates_joinK` and its mates).

`negate` swaps the value's two poles *and* the evidence's two slots together,
so it stays `Measured` (`negate_measured`): a witness for is a witness against
its negation. `presumeFree` is the **one sanctioned breach of `Measured`**: it
raises a free side (no witness at all) to present without manufacturing a
witness for it, the mechanism this ruling names *presumption* — the reading you
get by assuming the unwitnessed side rather than by measuring it
(`presumeFree_ge`, `presumeFree_of_full`, `presumeFree_articulate`). `conflate`
lifts `Reading.conflate` pointwise; it may raise a value above what its own
evidence would measure, and is not claimed to preserve `Measured`.
-/

namespace Obsmetrologia

/-- A reading together with its evidence: the value (a presence pair, `Reading`)
and the witnesses actually carried on each side (`evidence.1` for, `evidence.2`
against). The lossless companion to a bare `Reading`. -/
structure Valued where
  /-- The charge's value. -/
  value : Reading
  /-- The witnesses: `(for-witnesses, against-witnesses)`. -/
  evidence : Slot × Slot
  deriving DecidableEq, Repr, Inhabited

namespace Valued

/-- The reading the evidence alone would show: present on a side exactly when
that side's witness slot is non-empty. -/
def presence (x : Valued) : Reading :=
  Reading.ofSlots (!x.evidence.1.isEmpty) (!x.evidence.2.isEmpty)

/-- **Measured**: the value is exactly what the witnesses show — no value
asserted beyond the evidence on record. -/
def Measured (x : Valued) : Prop := x.value = x.presence

/-- Read a cell as a valued value: the corner is the value, the two slots are
the evidence. -/
def ofCell (c : Articulating.Cell) : Valued := ⟨c.corner, (c.subjectSlot, c.objectSlot)⟩

/-- **Articulating measures.** A cell's own corner is exactly its own
presence: `ofCell` is always `Measured`. -/
theorem ofCell_measured (c : Articulating.Cell) : Measured (ofCell c) := rfl

/-! ## The four value operations, evidence-accumulating -/

/-- Knowledge-join: join the values, union the evidence on both sides. -/
def joinK (x y : Valued) : Valued :=
  ⟨Reading.joinK x.value y.value, (x.evidence.1 ++ y.evidence.1, x.evidence.2 ++ y.evidence.2)⟩

/-- Knowledge-meet: meet the values, union the evidence on both sides. The
evidence still only grows — it is the *value* that can fall below it. -/
def meetK (x y : Valued) : Valued :=
  ⟨Reading.meetK x.value y.value, (x.evidence.1 ++ y.evidence.1, x.evidence.2 ++ y.evidence.2)⟩

/-- Truth-join: join the values (truth order), union the evidence. -/
def joinT (x y : Valued) : Valued :=
  ⟨Reading.joinT x.value y.value, (x.evidence.1 ++ y.evidence.1, x.evidence.2 ++ y.evidence.2)⟩

/-- Truth-meet: meet the values (truth order), union the evidence. -/
def meetT (x y : Valued) : Valued :=
  ⟨Reading.meetT x.value y.value, (x.evidence.1 ++ y.evidence.1, x.evidence.2 ++ y.evidence.2)⟩

/-- The value-component of `ofSlots`-built join distributes over `Bool`
presence-union, once evidence lists are collapsed by `isEmpty`. The finite
check behind `joinK_measured`. -/
private theorem ofSlots_joinK_append (a1 a2 b1 b2 : Bool) :
    Reading.joinK (Reading.ofSlots (!a1) (!a2)) (Reading.ofSlots (!b1) (!b2))
      = Reading.ofSlots (!(a1 && b1)) (!(a2 && b2)) := by
  cases a1 <;> cases a2 <;> cases b1 <;> cases b2 <;> rfl

/-- **`joinK` keeps `Measured`.** Presence-union is exactly what knowledge-join
computes: if both sides were exactly their evidence, so is their join. -/
theorem joinK_measured {x y : Valued} (hx : Measured x) (hy : Measured y) :
    Measured (joinK x y) := by
  have hx' : x.value = Reading.ofSlots (!x.evidence.1.isEmpty) (!x.evidence.2.isEmpty) := hx
  have hy' : y.value = Reading.ofSlots (!y.evidence.1.isEmpty) (!y.evidence.2.isEmpty) := hy
  show Reading.joinK x.value y.value
      = Reading.ofSlots (!(x.evidence.1 ++ y.evidence.1).isEmpty) (!(x.evidence.2 ++ y.evidence.2).isEmpty)
  rw [hx', hy', List.isEmpty_append, List.isEmpty_append]
  exact ofSlots_joinK_append x.evidence.1.isEmpty x.evidence.2.isEmpty
    y.evidence.1.isEmpty y.evidence.2.isEmpty

/-- **Absurd reached, witnesses kept.** A potential told by one witness, met
(knowledge-meet) with an active told by another, has value ⊥ₖ — but *both*
witnesses remain on record, so the result is not `Measured`: its evidence
would show ⊤ₖ. This is how "absurd, told nothing" (the un-articulated
position) differs from "absurd, two tellings cancelled". -/
theorem meetK_not_measured :
    ∃ x y : Valued, Measured x ∧ Measured y ∧ ¬ Measured (meetK x y) := by
  refine ⟨ofCell (Articulating.Cell.articulate ⟨⟨⟨"a"⟩⟩, ⟨⟨"p"⟩⟩⟩), ⟨.active, ([], [⟨⟨"b"⟩⟩])⟩,
    ofCell_measured _, rfl, ?_⟩
  intro h
  have h' : Reading.kBot = Reading.kTop := h
  exact absurd h' (by decide)

/-! ## Evidence accumulates: membership is never lost -/

/-- Structural membership-under-append on the left, proved by induction on the
membership proof itself (no `List.mem_append`). -/
private theorem mem_append_left {α : Type} {t : α} {l : List α} (m : List α)
    (h : t ∈ l) : t ∈ l ++ m := by
  induction h with
  | head as => exact List.Mem.head _
  | tail b _ ih => exact List.Mem.tail b ih

/-- Structural membership-under-append on the right, proved by induction on
the left list. -/
private theorem mem_append_right {α : Type} {t : α} (l : List α) {m : List α}
    (h : t ∈ m) : t ∈ l ++ m := by
  induction l with
  | nil => exact h
  | cons a as ih => exact List.Mem.tail a ih

/-- A for-witness of `x` remains a for-witness of `x.joinK y`. -/
theorem evidence_accumulates_joinK (x y : Valued) (m : Token) (h : m ∈ x.evidence.1) :
    m ∈ (joinK x y).evidence.1 := mem_append_left y.evidence.1 h

/-- A for-witness of `y` remains a for-witness of `x.joinK y`. -/
theorem evidence_accumulates_joinK_right (x y : Valued) (m : Token) (h : m ∈ y.evidence.1) :
    m ∈ (joinK x y).evidence.1 := mem_append_right x.evidence.1 h

/-- An against-witness of `x` remains an against-witness of `x.joinK y`. -/
theorem evidence_accumulates_joinK_against (x y : Valued) (m : Token) (h : m ∈ x.evidence.2) :
    m ∈ (joinK x y).evidence.2 := mem_append_left y.evidence.2 h

/-- An against-witness of `y` remains an against-witness of `x.joinK y`. -/
theorem evidence_accumulates_joinK_against_right (x y : Valued) (m : Token)
    (h : m ∈ y.evidence.2) : m ∈ (joinK x y).evidence.2 := mem_append_right x.evidence.2 h

/-- A for-witness of `x` remains a for-witness of `x.meetK y` — the meet can
drop the *value*, never the evidence. -/
theorem evidence_accumulates_meetK (x y : Valued) (m : Token) (h : m ∈ x.evidence.1) :
    m ∈ (meetK x y).evidence.1 := mem_append_left y.evidence.1 h

/-- A for-witness of `y` remains a for-witness of `x.meetK y`. -/
theorem evidence_accumulates_meetK_right (x y : Valued) (m : Token) (h : m ∈ y.evidence.1) :
    m ∈ (meetK x y).evidence.1 := mem_append_right x.evidence.1 h

/-- An against-witness of `x` remains an against-witness of `x.meetK y`. -/
theorem evidence_accumulates_meetK_against (x y : Valued) (m : Token) (h : m ∈ x.evidence.2) :
    m ∈ (meetK x y).evidence.2 := mem_append_left y.evidence.2 h

/-- An against-witness of `y` remains an against-witness of `x.meetK y`. -/
theorem evidence_accumulates_meetK_against_right (x y : Valued) (m : Token)
    (h : m ∈ y.evidence.2) : m ∈ (meetK x y).evidence.2 := mem_append_right x.evidence.2 h

/-! ## Negation: swap value poles and evidence sides together -/

/-- Negate: swap the value's two poles and the evidence's two slots together —
a witness for is a witness against the negation. -/
def negate (x : Valued) : Valued := ⟨Reading.negate x.value, (x.evidence.2, x.evidence.1)⟩

/-- Negation preserves `Measured`: a negated measured valued is still exactly
what its (now-swapped) evidence shows. -/
theorem negate_measured {x : Valued} (hx : Measured x) : Measured (negate x) := by
  have hx' : x.value = Reading.ofSlots (!x.evidence.1.isEmpty) (!x.evidence.2.isEmpty) := hx
  show Reading.negate x.value = Reading.ofSlots (!x.evidence.2.isEmpty) (!x.evidence.1.isEmpty)
  rw [hx']
  cases x.evidence.1.isEmpty <;> cases x.evidence.2.isEmpty <;> rfl

/-! ## Presumption: the one sanctioned breach of `Measured` -/

/-- Presumption: raise every free side (no witness at all) to present, keeping
the evidence untouched. The one sanctioned breach of `Measured` — presumption
is *not* measurement. -/
def presumeFree (x : Valued) : Valued :=
  ⟨Reading.ofSlots (x.value.pos || x.evidence.1.isEmpty) (x.value.neg || x.evidence.2.isEmpty),
    x.evidence⟩

/-- Presumption only ever climbs: the presumed value sits above the original
in the knowledge order. -/
theorem presumeFree_ge (x : Valued) : Reading.KLE x.value (presumeFree x).value := by
  show Reading.leK x.value
      (Reading.ofSlots (x.value.pos || x.evidence.1.isEmpty) (x.value.neg || x.evidence.2.isEmpty)) = true
  cases x.value <;> cases x.evidence.1.isEmpty <;> cases x.evidence.2.isEmpty <;> decide

private theorem isEmpty_eq_false_of_ne_nil {α : Type} {l : List α} (h : l ≠ []) :
    l.isEmpty = false := by
  cases l with
  | nil => exact absurd rfl h
  | cons a as => rfl

/-- When both sides already carry a witness, presumption changes nothing:
there is no free side left to raise. -/
theorem presumeFree_of_full (x : Valued) (h1 : x.evidence.1 ≠ []) (h2 : x.evidence.2 ≠ []) :
    presumeFree x = x := by
  have he1 : x.evidence.1.isEmpty = false := isEmpty_eq_false_of_ne_nil h1
  have he2 : x.evidence.2.isEmpty = false := isEmpty_eq_false_of_ne_nil h2
  show (⟨Reading.ofSlots (x.value.pos || x.evidence.1.isEmpty) (x.value.neg || x.evidence.2.isEmpty),
      x.evidence⟩ : Valued) = x
  rw [he1, he2, Bool.or_false, Bool.or_false, Reading.ofSlots_pos_neg]

/-- A bare articulated cell presumes to stable: potential ↑ stable. Told true
on the token side, silent (not witnessed) on the claim side — presumption
raises the free claim side to present. -/
theorem presumeFree_articulate (u : Utterance) :
    (presumeFree (ofCell (Articulating.Cell.articulate u))).value = Reading.kTop := rfl

/-! ## Conflation: lifted pointwise, may raise above evidence -/

/-- Conflate: the knowledge-negation of the value, evidence untouched. Unlike
`negate`, conflation is not claimed to preserve `Measured` — it may raise the
value above what the evidence alone would show. -/
def conflate (x : Valued) : Valued := ⟨Reading.conflate x.value, x.evidence⟩

end Valued
end Obsmetrologia
