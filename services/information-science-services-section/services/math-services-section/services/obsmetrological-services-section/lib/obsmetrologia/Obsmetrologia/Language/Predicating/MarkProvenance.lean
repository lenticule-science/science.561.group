import Obsmetrologia.Articulation.Articulating.MarkProvenance
import Obsmetrologia.Language.Predicating.Oriented

/-!
# Predication-cell provenance from articulated marks

The oriented cell is a downstream readout of an `Articulating`.  This module
records two complementary facts:

* every coordinate mark of a generated oriented cell is already present in the
  generating articulating's mark provenance;
* every bare `PredicationCell` has a synthetic articulated source built only
  from that cell's own marks.

The second fact is generability, not provenance recovery.  `orientedCell` is
not injective: distinct articulated histories can have the same downstream
cell.  The collision below is kept as a permanent falsifier against treating a
synthetic section as historical reconstruction.
-/

namespace Obsmetrologia

namespace PredicationCell

/-- The three primitive marks visible in a predication cell, in
subject/predicate/object order. -/
def markList (φ : PredicationCell) : List Mark :=
  [φ.subject.mark, φ.predicate.mark, φ.object.mark]

theorem subject_mark_mem_markList (φ : PredicationCell) :
    φ.subject.mark ∈ φ.markList :=
  List.Mem.head _

theorem predicate_mark_mem_markList (φ : PredicationCell) :
    φ.predicate.mark ∈ φ.markList :=
  List.Mem.tail _ (List.Mem.head _)

theorem object_mark_mem_markList (φ : PredicationCell) :
    φ.object.mark ∈ φ.markList :=
  List.Mem.tail _ (List.Mem.tail _ (List.Mem.head _))

@[simp] theorem markList_length (φ : PredicationCell) :
    φ.markList.length = 3 :=
  rfl

/-- A synthetic articulated source for a predication cell.  It uses only the
cell's existing token/claim marks and duplicates the predicate at the tail; it
does not claim to recover the historical articulating that produced the cell. -/
def syntheticSource (φ : PredicationCell) : Articulating :=
  Articulating.pair
    ⟨φ.subject, φ.predicate⟩
    (Articulating.utter ⟨φ.object, φ.predicate⟩)

/-- The synthetic source is a section of `orientedCell`: every bare cell is
generable from an articulating without introducing a fresh primitive mark. -/
@[simp] theorem syntheticSource_orientedCell (φ : PredicationCell) :
    Articulating.orientedCell (syntheticSource φ) = φ := by
  cases φ
  rfl

/-- A predication cell is generated when some articulating has it as its
oriented-cell readout. -/
def Generated (φ : PredicationCell) : Prop :=
  ∃ a : Articulating, a.orientedCell = φ

/-- Every predication cell is generable from articulated marks. -/
theorem generated (φ : PredicationCell) :
    Generated φ :=
  ⟨syntheticSource φ, syntheticSource_orientedCell φ⟩

end PredicationCell

namespace Articulating

/-- The subject mark of a generated oriented cell comes from the articulating head. -/
theorem orientedCell_subject_mark_mem_markList (a : Articulating) :
    a.orientedCell.subject.mark ∈ a.markList := by
  rw [orientedCell_subject]
  exact head_token_mark_mem_markList a

/-- The predicate mark of a generated oriented cell comes from the articulating head. -/
theorem orientedCell_predicate_mark_mem_markList (a : Articulating) :
    a.orientedCell.predicate.mark ∈ a.markList := by
  rw [orientedCell_predicate]
  exact head_claim_mark_mem_markList a

/-- The object mark of a generated oriented cell comes from the token of the
utterance immediately below the head; on the floor it is the head token itself. -/
theorem orientedCell_object_mark_mem_markList (a : Articulating) :
    a.orientedCell.object.mark ∈ a.markList := by
  cases a with
  | utter u =>
      exact Utterance.token_mark_mem_markList u
  | pair u tail =>
      exact mark_mem_pair_tail u tail (head_token_mark_mem_markList tail)

/-- All three visible cell marks are supported by one retained articulating. -/
theorem orientedCell_marks_supported (a : Articulating) :
    a.orientedCell.subject.mark ∈ a.markList ∧
    a.orientedCell.predicate.mark ∈ a.markList ∧
    a.orientedCell.object.mark ∈ a.markList :=
  ⟨orientedCell_subject_mark_mem_markList a,
    orientedCell_predicate_mark_mem_markList a,
    orientedCell_object_mark_mem_markList a⟩

/-- A concrete utterance used only for the provenance-collision regression. -/
def provenanceCollisionUtterance : Utterance :=
  ⟨⟨⟨"source"⟩⟩, ⟨⟨"relates"⟩⟩⟩

/-- The short history in the provenance-collision regression. -/
def provenanceCollisionShort : Articulating :=
  pair provenanceCollisionUtterance (utter provenanceCollisionUtterance)

/-- The longer history has one additional recursive layer below the same
immediate head/tail boundary. -/
def provenanceCollisionLong : Articulating :=
  pair provenanceCollisionUtterance
    (pair provenanceCollisionUtterance (utter provenanceCollisionUtterance))

/-- The two regression histories are genuinely different carriers. -/
theorem provenanceCollision_ne :
    provenanceCollisionShort ≠ provenanceCollisionLong := by
  decide

/-- The oriented-cell readout forgets the extra history below the immediate
tail head, so the two distinct carriers produce the same predication cell. -/
theorem provenanceCollision_orientedCell_eq :
    provenanceCollisionShort.orientedCell =
      provenanceCollisionLong.orientedCell :=
  rfl

/-- Oriented predication cells do not determine articulated history. -/
theorem orientedCell_not_injective :
    ¬ Function.Injective orientedCell := by
  intro h
  exact provenanceCollision_ne (h provenanceCollision_orientedCell_eq)

end Articulating

namespace PredicationCell

/-- The synthetic source supports the cell's subject mark. -/
theorem syntheticSource_subject_mark_mem (φ : PredicationCell) :
    φ.subject.mark ∈ (syntheticSource φ).markList := by
  have h :=
    Articulating.orientedCell_subject_mark_mem_markList (syntheticSource φ)
  rw [syntheticSource_orientedCell] at h
  exact h

/-- The synthetic source supports the cell's predicate mark. -/
theorem syntheticSource_predicate_mark_mem (φ : PredicationCell) :
    φ.predicate.mark ∈ (syntheticSource φ).markList := by
  have h :=
    Articulating.orientedCell_predicate_mark_mem_markList (syntheticSource φ)
  rw [syntheticSource_orientedCell] at h
  exact h

/-- The synthetic source supports the cell's object mark. -/
theorem syntheticSource_object_mark_mem (φ : PredicationCell) :
    φ.object.mark ∈ (syntheticSource φ).markList := by
  have h :=
    Articulating.orientedCell_object_mark_mem_markList (syntheticSource φ)
  rw [syntheticSource_orientedCell] at h
  exact h

/-- The complete coordinate-support receipt for a synthesized source. -/
theorem syntheticSource_marks_supported (φ : PredicationCell) :
    φ.subject.mark ∈ (syntheticSource φ).markList ∧
    φ.predicate.mark ∈ (syntheticSource φ).markList ∧
    φ.object.mark ∈ (syntheticSource φ).markList :=
  ⟨syntheticSource_subject_mark_mem φ,
    syntheticSource_predicate_mark_mem φ,
    syntheticSource_object_mark_mem φ⟩

/-- Synthetic generation is not historical provenance recovery: there is an
articulating whose downstream cell synthesizes to a different, shorter history. -/
theorem syntheticSource_not_provenance_recovery :
    ∃ a : Articulating, syntheticSource a.orientedCell ≠ a := by
  refine ⟨Articulating.provenanceCollisionLong, ?_⟩
  change Articulating.provenanceCollisionShort ≠
    Articulating.provenanceCollisionLong
  exact Articulating.provenanceCollision_ne

end PredicationCell

end Obsmetrologia
