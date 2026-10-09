import Obsmetrologia.Articulation.Articulating

/-!
# Mark provenance through utterance and articulating

This module makes the library's foundational dependency explicit without adding
a new primitive carrier.  An utterance exposes exactly the two primitive marks
already held by its typed token and claim.  An `Articulating` exposes the finite
mark record obtained by following its constructors.  A trace then exposes the
marks of the articulatings it actually contains.

These are provenance *readouts* of existing constructors.  They do not recover
an erased historical source from a downstream value and they admit no new mark.
-/

namespace Obsmetrologia

namespace Utterance

/-- The primitive marks already carried by an utterance, in token/claim order. -/
def markList (u : Utterance) : List Mark :=
  [u.token.mark, u.claim.mark]

/-- The token-side primitive mark is present in the utterance mark record. -/
theorem token_mark_mem_markList (u : Utterance) :
    u.token.mark ∈ u.markList :=
  List.Mem.head _

/-- The claim-side primitive mark is present in the utterance mark record. -/
theorem claim_mark_mem_markList (u : Utterance) :
    u.claim.mark ∈ u.markList :=
  List.Mem.tail _ (List.Mem.head _)

/-- Every utterance contributes exactly its two typed primitive marks. -/
@[simp] theorem markList_length (u : Utterance) :
    u.markList.length = 2 :=
  rfl

/-- An utterance's mark record is never empty. -/
theorem markList_ne_nil (u : Utterance) :
    u.markList ≠ [] := by
  intro h
  cases h

end Utterance

namespace Articulating

private theorem mem_append_left {α : Type} {x : α} {xs : List α}
    (ys : List α) (h : x ∈ xs) : x ∈ xs ++ ys := by
  induction h with
  | head as => exact List.Mem.head _
  | tail a h ih => exact List.Mem.tail a ih

private theorem mem_append_right {α : Type} (xs : List α) {x : α} {ys : List α}
    (h : x ∈ ys) : x ∈ xs ++ ys := by
  induction xs with
  | nil => exact h
  | cons a as ih => exact List.Mem.tail a (ih h)

/-- The primitive-mark provenance carried by an articulating.  No mark is
introduced here: the record is the concatenation of the utterances already
present in the recursive carrier. -/
def markList : Articulating → List Mark
  | utter u => u.markList
  | pair u a => u.markList ++ a.markList

@[simp] theorem markList_utter (u : Utterance) :
    (utter u).markList = u.markList :=
  rfl

@[simp] theorem markList_pair (u : Utterance) (a : Articulating) :
    (pair u a).markList = u.markList ++ a.markList :=
  rfl

/-- A mark from the head utterance remains present after articulation over a tail. -/
theorem mark_mem_pair_head (u : Utterance) (a : Articulating) {m : Mark}
    (h : m ∈ u.markList) :
    m ∈ (pair u a).markList := by
  show m ∈ u.markList ++ a.markList
  exact mem_append_left a.markList h

/-- A mark from the tail remains present after a new utterance is articulated over it. -/
theorem mark_mem_pair_tail (u : Utterance) (a : Articulating) {m : Mark}
    (h : m ∈ a.markList) :
    m ∈ (pair u a).markList := by
  show m ∈ u.markList ++ a.markList
  exact mem_append_right u.markList h

/-- The head token mark is always supported by the articulating's mark provenance. -/
theorem head_token_mark_mem_markList (a : Articulating) :
    a.head.token.mark ∈ a.markList := by
  cases a with
  | utter u =>
      exact Utterance.token_mark_mem_markList u
  | pair u a =>
      exact mark_mem_pair_head u a (Utterance.token_mark_mem_markList u)

/-- The head claim mark is always supported by the articulating's mark provenance. -/
theorem head_claim_mark_mem_markList (a : Articulating) :
    a.head.claim.mark ∈ a.markList := by
  cases a with
  | utter u =>
      exact Utterance.claim_mark_mem_markList u
  | pair u a =>
      exact mark_mem_pair_head u a (Utterance.claim_mark_mem_markList u)

/-- The floor token mark survives every recursive articulation above it. -/
theorem floor_token_mark_mem_markList :
    ∀ a : Articulating, a.floor.token.mark ∈ a.markList
  | utter u => Utterance.token_mark_mem_markList u
  | pair u a => mark_mem_pair_tail u a (floor_token_mark_mem_markList a)

/-- The floor claim mark survives every recursive articulation above it. -/
theorem floor_claim_mark_mem_markList :
    ∀ a : Articulating, a.floor.claim.mark ∈ a.markList
  | utter u => Utterance.claim_mark_mem_markList u
  | pair u a => mark_mem_pair_tail u a (floor_claim_mark_mem_markList a)

/-- Either typed mark read from the head utterance is in the articulating provenance. -/
theorem head_mark_mem_markList (a : Articulating) (k : Kind) :
    a.head.at_ k ∈ a.markList := by
  cases k with
  | token =>
      exact head_token_mark_mem_markList a
  | claim =>
      exact head_claim_mark_mem_markList a

/-- Either typed mark read from the floor utterance is in the articulating provenance. -/
theorem floor_mark_mem_markList (a : Articulating) (k : Kind) :
    a.floor.at_ k ∈ a.markList := by
  cases k with
  | token =>
      exact floor_token_mark_mem_markList a
  | claim =>
      exact floor_claim_mark_mem_markList a

/-- Every articulating carries at least the two marks of its head utterance. -/
theorem markList_ne_nil (a : Articulating) :
    a.markList ≠ [] := by
  intro h
  have hm := head_token_mark_mem_markList a
  rw [h] at hm
  cases hm

/-- Primitive marks present in a finite trace of articulatings. -/
def traceMarkList : List Articulating → List Mark
  | [] => []
  | a :: trace => a.markList ++ traceMarkList trace

@[simp] theorem traceMarkList_nil :
    traceMarkList [] = [] :=
  rfl

@[simp] theorem traceMarkList_cons (a : Articulating) (trace : List Articulating) :
    traceMarkList (a :: trace) = a.markList ++ traceMarkList trace :=
  rfl

/-- Any mark carried by an articulating occurring in a trace occurs in the
trace-level provenance record.  This structural theorem is the reusable
handoff for downstream measurement proofs. -/
theorem mem_traceMarkList_of_mem_trace {a : Articulating} {trace : List Articulating}
    (ha : a ∈ trace) {m : Mark} (hm : m ∈ a.markList) :
    m ∈ traceMarkList trace := by
  induction ha with
  | head tail =>
      exact mem_append_left (traceMarkList tail) hm
  | tail b _ ih =>
      exact mem_append_right b.markList ih

/-- A traced articulating contributes its head token mark to trace provenance. -/
theorem head_token_mark_mem_traceMarkList {a : Articulating} {trace : List Articulating}
    (ha : a ∈ trace) :
    a.head.token.mark ∈ traceMarkList trace :=
  mem_traceMarkList_of_mem_trace ha (head_token_mark_mem_markList a)

/-- A traced articulating contributes its head claim mark to trace provenance. -/
theorem head_claim_mark_mem_traceMarkList {a : Articulating} {trace : List Articulating}
    (ha : a ∈ trace) :
    a.head.claim.mark ∈ traceMarkList trace :=
  mem_traceMarkList_of_mem_trace ha (head_claim_mark_mem_markList a)

/-- A traced articulating carries its floor token mark into trace provenance. -/
theorem floor_token_mark_mem_traceMarkList {a : Articulating} {trace : List Articulating}
    (ha : a ∈ trace) :
    a.floor.token.mark ∈ traceMarkList trace :=
  mem_traceMarkList_of_mem_trace ha (floor_token_mark_mem_markList a)

/-- A traced articulating carries its floor claim mark into trace provenance. -/
theorem floor_claim_mark_mem_traceMarkList {a : Articulating} {trace : List Articulating}
    (ha : a ∈ trace) :
    a.floor.claim.mark ∈ traceMarkList trace :=
  mem_traceMarkList_of_mem_trace ha (floor_claim_mark_mem_markList a)

end Articulating

end Obsmetrologia
