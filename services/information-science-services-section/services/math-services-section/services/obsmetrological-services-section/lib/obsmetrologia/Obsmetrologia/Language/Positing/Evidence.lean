import Obsmetrologia.Language.Positing.Charge
import Obsmetrologia.Language.Positing.Four
import Obsmetrologia.Articulation.Articulating.Cell

/-!
# Evidence — the lossless charge carrier

**Owner ruling 2026-09-21.** A charge alone (`Charge`, `Articulating.Corner`) is
value with no memory of how it got there. `Charged` restores that memory: it
bundles a `value : Charge` with `evidence : Slot × Slot`, the witnesses actually
carried on each side — the same two slots a `Articulating.Cell` carries.
**Articulating measures**: `Charged.ofCell` reads a cell's own corner as its
value and its own slots as its evidence, and the two agree by construction
(`ofCell_measured`). `Charged.Measured` names that agreement as a `Prop`: the
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
witness for it, the mechanism this ruling names *presumption* — the charge you
get by assuming the unwitnessed side rather than by measuring it
(`presumeFree_ge`, `presumeFree_of_full`, `presumeFree_articulate`). `conflate`
lifts `Charge.conflate` pointwise; it may raise a value above what its own
evidence would measure, and is not claimed to preserve `Measured`.
-/

namespace Obsmetrologia

/-- A charge together with its evidence: the value (a presence pair, `Charge`)
and the witnesses actually carried on each side (`evidence.1` for, `evidence.2`
against). The lossless companion to a bare `Charge`. -/
structure Charged where
  /-- The charge's value. -/
  value : Charge
  /-- The witnesses: `(for-witnesses, against-witnesses)`. -/
  evidence : Slot × Slot
  deriving DecidableEq, Repr, Inhabited

namespace Charged

/-- The charge the evidence alone would show: present on a side exactly when
that side's witness slot is non-empty. -/
def presence (x : Charged) : Charge :=
  Charge.ofSlots (!x.evidence.1.isEmpty) (!x.evidence.2.isEmpty)

/-- **Measured**: the value is exactly what the witnesses show — no value
asserted beyond the evidence on record. -/
def Measured (x : Charged) : Prop := x.value = x.presence

/-- Read a cell as a charged value: the corner is the value, the two slots are
the evidence. -/
def ofCell (c : Articulating.Cell) : Charged := ⟨c.corner, (c.tokenSlot, c.claimSlot)⟩

/-- **Articulating measures.** A cell's own corner is exactly its own
presence: `ofCell` is always `Measured`. -/
theorem ofCell_measured (c : Articulating.Cell) : Measured (ofCell c) := rfl

/-! ## The four value operations, evidence-accumulating -/

/-- Knowledge-join: join the values, union the evidence on both sides. -/
def joinK (x y : Charged) : Charged :=
  ⟨Charge.joinK x.value y.value, (x.evidence.1 ++ y.evidence.1, x.evidence.2 ++ y.evidence.2)⟩

/-- Knowledge-meet: meet the values, union the evidence on both sides. The
evidence still only grows — it is the *value* that can fall below it. -/
def meetK (x y : Charged) : Charged :=
  ⟨Charge.meetK x.value y.value, (x.evidence.1 ++ y.evidence.1, x.evidence.2 ++ y.evidence.2)⟩

/-- Truth-join: join the values (truth order), union the evidence. -/
def joinT (x y : Charged) : Charged :=
  ⟨Charge.joinT x.value y.value, (x.evidence.1 ++ y.evidence.1, x.evidence.2 ++ y.evidence.2)⟩

/-- Truth-meet: meet the values (truth order), union the evidence. -/
def meetT (x y : Charged) : Charged :=
  ⟨Charge.meetT x.value y.value, (x.evidence.1 ++ y.evidence.1, x.evidence.2 ++ y.evidence.2)⟩

/-- The value-component of `ofSlots`-built join distributes over `Bool`
presence-union, once evidence lists are collapsed by `isEmpty`. The finite
check behind `joinK_measured`. -/
private theorem ofSlots_joinK_append (a1 a2 b1 b2 : Bool) :
    Charge.joinK (Charge.ofSlots (!a1) (!a2)) (Charge.ofSlots (!b1) (!b2))
      = Charge.ofSlots (!(a1 && b1)) (!(a2 && b2)) := by
  cases a1 <;> cases a2 <;> cases b1 <;> cases b2 <;> rfl

/-- **`joinK` keeps `Measured`.** Presence-union is exactly what knowledge-join
computes: if both sides were exactly their evidence, so is their join. -/
theorem joinK_measured {x y : Charged} (hx : Measured x) (hy : Measured y) :
    Measured (joinK x y) := by
  have hx' : x.value = Charge.ofSlots (!x.evidence.1.isEmpty) (!x.evidence.2.isEmpty) := hx
  have hy' : y.value = Charge.ofSlots (!y.evidence.1.isEmpty) (!y.evidence.2.isEmpty) := hy
  show Charge.joinK x.value y.value
      = Charge.ofSlots (!(x.evidence.1 ++ y.evidence.1).isEmpty) (!(x.evidence.2 ++ y.evidence.2).isEmpty)
  rw [hx', hy', List.isEmpty_append, List.isEmpty_append]
  exact ofSlots_joinK_append x.evidence.1.isEmpty x.evidence.2.isEmpty
    y.evidence.1.isEmpty y.evidence.2.isEmpty

/-- **Absurd reached, witnesses kept.** A potential told by one witness, met
(knowledge-meet) with an active told by another, has value ⊥ₖ — but *both*
witnesses remain on record, so the result is not `Measured`: its evidence
would show ⊤ₖ. This is how "absurd, told nothing" (the un-articulated
position) differs from "absurd, two tellings cancelled". -/
theorem meetK_not_measured :
    ∃ x y : Charged, Measured x ∧ Measured y ∧ ¬ Measured (meetK x y) := by
  refine ⟨ofCell (Articulating.Cell.articulate ⟨⟨⟨"a"⟩⟩, ⟨⟨"p"⟩⟩⟩), ⟨.active, ([], [⟨⟨"b"⟩⟩])⟩,
    ofCell_measured _, rfl, ?_⟩
  intro h
  have h' : Charge.kBot = Charge.kTop := h
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
theorem evidence_accumulates_joinK (x y : Charged) (m : Token) (h : m ∈ x.evidence.1) :
    m ∈ (joinK x y).evidence.1 := mem_append_left y.evidence.1 h

/-- A for-witness of `y` remains a for-witness of `x.joinK y`. -/
theorem evidence_accumulates_joinK_right (x y : Charged) (m : Token) (h : m ∈ y.evidence.1) :
    m ∈ (joinK x y).evidence.1 := mem_append_right x.evidence.1 h

/-- An against-witness of `x` remains an against-witness of `x.joinK y`. -/
theorem evidence_accumulates_joinK_against (x y : Charged) (m : Token) (h : m ∈ x.evidence.2) :
    m ∈ (joinK x y).evidence.2 := mem_append_left y.evidence.2 h

/-- An against-witness of `y` remains an against-witness of `x.joinK y`. -/
theorem evidence_accumulates_joinK_against_right (x y : Charged) (m : Token)
    (h : m ∈ y.evidence.2) : m ∈ (joinK x y).evidence.2 := mem_append_right x.evidence.2 h

/-- A for-witness of `x` remains a for-witness of `x.meetK y` — the meet can
drop the *value*, never the evidence. -/
theorem evidence_accumulates_meetK (x y : Charged) (m : Token) (h : m ∈ x.evidence.1) :
    m ∈ (meetK x y).evidence.1 := mem_append_left y.evidence.1 h

/-- A for-witness of `y` remains a for-witness of `x.meetK y`. -/
theorem evidence_accumulates_meetK_right (x y : Charged) (m : Token) (h : m ∈ y.evidence.1) :
    m ∈ (meetK x y).evidence.1 := mem_append_right x.evidence.1 h

/-- An against-witness of `x` remains an against-witness of `x.meetK y`. -/
theorem evidence_accumulates_meetK_against (x y : Charged) (m : Token) (h : m ∈ x.evidence.2) :
    m ∈ (meetK x y).evidence.2 := mem_append_left y.evidence.2 h

/-- An against-witness of `y` remains an against-witness of `x.meetK y`. -/
theorem evidence_accumulates_meetK_against_right (x y : Charged) (m : Token)
    (h : m ∈ y.evidence.2) : m ∈ (meetK x y).evidence.2 := mem_append_right x.evidence.2 h

/-! ## Negation: swap value poles and evidence sides together -/

/-- Negate: swap the value's two poles and the evidence's two slots together —
a witness for is a witness against the negation. -/
def negate (x : Charged) : Charged := ⟨Charge.negate x.value, (x.evidence.2, x.evidence.1)⟩

/-- Negation preserves `Measured`: a negated measured charged is still exactly
what its (now-swapped) evidence shows. -/
theorem negate_measured {x : Charged} (hx : Measured x) : Measured (negate x) := by
  have hx' : x.value = Charge.ofSlots (!x.evidence.1.isEmpty) (!x.evidence.2.isEmpty) := hx
  show Charge.negate x.value = Charge.ofSlots (!x.evidence.2.isEmpty) (!x.evidence.1.isEmpty)
  rw [hx']
  cases x.evidence.1.isEmpty <;> cases x.evidence.2.isEmpty <;> rfl

/-! ## Presumption: the one sanctioned breach of `Measured` -/

/-- Presumption: raise every free side (no witness at all) to present, keeping
the evidence untouched. The one sanctioned breach of `Measured` — presumption
is *not* measurement. -/
def presumeFree (x : Charged) : Charged :=
  ⟨Charge.ofSlots (x.value.pos || x.evidence.1.isEmpty) (x.value.neg || x.evidence.2.isEmpty),
    x.evidence⟩

/-- Presumption only ever climbs: the presumed value sits above the original
in the knowledge order. -/
theorem presumeFree_ge (x : Charged) : Charge.KLE x.value (presumeFree x).value := by
  show Charge.leK x.value
      (Charge.ofSlots (x.value.pos || x.evidence.1.isEmpty) (x.value.neg || x.evidence.2.isEmpty)) = true
  cases x.value <;> cases x.evidence.1.isEmpty <;> cases x.evidence.2.isEmpty <;> decide

private theorem isEmpty_eq_false_of_ne_nil {α : Type} {l : List α} (h : l ≠ []) :
    l.isEmpty = false := by
  cases l with
  | nil => exact absurd rfl h
  | cons a as => rfl

/-- When both sides already carry a witness, presumption changes nothing:
there is no free side left to raise. -/
theorem presumeFree_of_full (x : Charged) (h1 : x.evidence.1 ≠ []) (h2 : x.evidence.2 ≠ []) :
    presumeFree x = x := by
  have he1 : x.evidence.1.isEmpty = false := isEmpty_eq_false_of_ne_nil h1
  have he2 : x.evidence.2.isEmpty = false := isEmpty_eq_false_of_ne_nil h2
  show (⟨Charge.ofSlots (x.value.pos || x.evidence.1.isEmpty) (x.value.neg || x.evidence.2.isEmpty),
      x.evidence⟩ : Charged) = x
  rw [he1, he2, Bool.or_false, Bool.or_false, Charge.ofSlots_pos_neg]

/-- A bare articulated cell presumes to stable: potential ↑ stable. Told true
on the token side, silent (not witnessed) on the claim side — presumption
raises the free claim side to present. -/
theorem presumeFree_articulate (u : Utterance) :
    (presumeFree (ofCell (Articulating.Cell.articulate u))).value = Charge.kTop := rfl

/-! ## Conflation: lifted pointwise, may raise above evidence -/

/-- Conflate: the knowledge-negation of the value, evidence untouched. Unlike
`negate`, conflation is not claimed to preserve `Measured` — it may raise the
value above what the evidence alone would show. -/
def conflate (x : Charged) : Charged := ⟨Charge.conflate x.value, x.evidence⟩

end Charged
end Obsmetrologia
