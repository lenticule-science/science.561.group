import Obsmetrologia.Language.Predicating.MarkProvenance
import Obsmetrologia.Language.Positing.Measure

/-!
# Mark provenance of measured evidence

Measurement already has a source discipline: `witnesses` records head tokens
only when an articulating's oriented cell equals the queried cell, and
`no_denial` proves the negative pole can arise only from an articulated
contradictory.  This module closes the symmetric positive-source theorem and
pushes both poles down to primitive-mark provenance.

The result is the metrological path

`Mark → Utterance → Articulating → orientedCell → witnesses → measure`.

No reading is used as evidence for its own provenance.
-/

namespace Obsmetrologia

/-- **Told for.** A positive measured pole at `φ` implies that some
articulating in the trace actually generated `φ`.  This is the positive
counterpart of `no_denial`. -/
theorem told_for (k : Contradictory) (trace : List Articulating) (φ : PredicationCell)
    (h : (measure k trace φ).value.pos = true) :
    ∃ a ∈ trace, a.orientedCell = φ := by
  have h0 : (Reading.ofSlots (!(witnesses φ trace).isEmpty)
      (!(witnesses (φ.contradictory k) trace).isEmpty)).pos = true := h
  rw [Reading.pos_ofSlots] at h0
  cases hm : witnesses φ trace with
  | nil =>
      rw [hm] at h0
      exact absurd h0 (by decide)
  | cons t ts =>
      have hmem : t ∈ witnesses φ trace := by
        rw [hm]
        exact List.Mem.head _
      obtain ⟨a, ha, hao, _⟩ := mem_witnesses φ trace t hmem
      exact ⟨a, ha, hao⟩

/-- Positive measured evidence carries the primitive marks of the queried
cell in the trace's articulated mark provenance. -/
theorem measure_positive_marks_in_trace
    (k : Contradictory) (trace : List Articulating) (φ : PredicationCell)
    (h : (measure k trace φ).value.pos = true) :
    φ.subject.mark ∈ Articulating.traceMarkList trace ∧
    φ.predicate.mark ∈ Articulating.traceMarkList trace ∧
    φ.object.mark ∈ Articulating.traceMarkList trace := by
  obtain ⟨a, ha, hcell⟩ := told_for k trace φ h
  have hs := Articulating.mem_traceMarkList_of_mem_trace ha
    (Articulating.orientedCell_subject_mark_mem_markList a)
  have hp := Articulating.mem_traceMarkList_of_mem_trace ha
    (Articulating.orientedCell_predicate_mark_mem_markList a)
  have ho := Articulating.mem_traceMarkList_of_mem_trace ha
    (Articulating.orientedCell_object_mark_mem_markList a)
  rw [hcell] at hs hp ho
  exact ⟨hs, hp, ho⟩

/-- Negative measured evidence carries the primitive marks of the
*contradictory cell* in the same trace provenance.  In particular the negative
predicate is an articulated contradictory claim, not a denial bit introduced
by measurement. -/
theorem measure_negative_contradictory_marks_in_trace
    (k : Contradictory) (trace : List Articulating) (φ : PredicationCell)
    (h : (measure k trace φ).value.neg = true) :
    (φ.contradictory k).subject.mark ∈ Articulating.traceMarkList trace ∧
    (φ.contradictory k).predicate.mark ∈ Articulating.traceMarkList trace ∧
    (φ.contradictory k).object.mark ∈ Articulating.traceMarkList trace := by
  obtain ⟨a, ha, hcell⟩ := no_denial k trace φ h
  have hs := Articulating.mem_traceMarkList_of_mem_trace ha
    (Articulating.orientedCell_subject_mark_mem_markList a)
  have hp := Articulating.mem_traceMarkList_of_mem_trace ha
    (Articulating.orientedCell_predicate_mark_mem_markList a)
  have ho := Articulating.mem_traceMarkList_of_mem_trace ha
    (Articulating.orientedCell_object_mark_mem_markList a)
  rw [hcell] at hs hp ho
  exact ⟨hs, hp, ho⟩

/-- When both poles are present, the trace contains distinct source
obligations for the queried cell and its contradictory (the witnesses may
coincide only if the codec itself makes those cells coincide). -/
theorem measure_both_sources
    (k : Contradictory) (trace : List Articulating) (φ : PredicationCell)
    (hp : (measure k trace φ).value.pos = true)
    (hn : (measure k trace φ).value.neg = true) :
    (∃ a ∈ trace, a.orientedCell = φ) ∧
    (∃ a ∈ trace, a.orientedCell = φ.contradictory k) :=
  ⟨told_for k trace φ hp, no_denial k trace φ hn⟩

/-- Both measured poles therefore have articulated primitive-mark support in
one trace record. -/
theorem measure_both_mark_support
    (k : Contradictory) (trace : List Articulating) (φ : PredicationCell)
    (hp : (measure k trace φ).value.pos = true)
    (hn : (measure k trace φ).value.neg = true) :
    (φ.subject.mark ∈ Articulating.traceMarkList trace ∧
      φ.predicate.mark ∈ Articulating.traceMarkList trace ∧
      φ.object.mark ∈ Articulating.traceMarkList trace) ∧
    ((φ.contradictory k).subject.mark ∈ Articulating.traceMarkList trace ∧
      (φ.contradictory k).predicate.mark ∈ Articulating.traceMarkList trace ∧
      (φ.contradictory k).object.mark ∈ Articulating.traceMarkList trace) :=
  ⟨measure_positive_marks_in_trace k trace φ hp,
    measure_negative_contradictory_marks_in_trace k trace φ hn⟩

end Obsmetrologia
