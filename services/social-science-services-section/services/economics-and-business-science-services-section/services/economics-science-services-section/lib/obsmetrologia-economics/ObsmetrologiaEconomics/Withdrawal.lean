/-!
# Withdrawal — consensus by withdrawal over a storage model of participation

Specification: the Tidepool protocol, revision 3, section A4 and Appendix A.8 (`WithdrawalAllocatorV1`),
with section 2.5 (storage holds operational state; cells hold the monotone record).

A question is answered by *quiescence*: after the window closes, the answer is read off who took part.
Each member's participation is a storage field with four values, `silent | assented | objected |
withdrawn`; the contract keeps three counters over it. A member who withdraws is counted out of the
engaged set rather than dropped to a bottom value, and a lone objection never flattens the default.

What this module fixes:

* **The counters** (`counts`): `heard` is the number of members who assented or objected,
  `withdrawn` the number withdrawn, `objections` the number objected. Silence adds to nothing
  (`silence_is_bottom`): the unheard are exactly the members counted in none of the three
  (`unheard`, with `heard + withdrawn + unheard = length`).
* **The answer** (`quiesce`): nobody heard is `adjourned` (the standing formula does not execute: `F0`
  does); objections at or above the quorum is `escalated` (the standing formula does not execute); anything
  else is `consensus` and the standing formula executes. The three cases are exhaustive (`quiesce_cases`)
  and an objection count under the quorum, with someone heard, always keeps the default
  (`lone_objection_keeps_default`, and over a storage list `lone_objection_over_storage`). `quiesce`
  ignores `withdrawn`; the argument is kept because the contract's signature carries it.
* **One member, one position** (`Store`, `step`): a member's act changes exactly their own entry in the
  status list and appends exactly one cell to the cell list, which therefore only grows
  (`step_touches_one`, `withdraw_touches_one`, `step_cells_grow`).
* **Withdrawal only lowers engagement** (`engaged_antitone`): turning any set of entries into
  `withdrawn` never raises `heard` or `objections` and never lowers `withdrawn`.
* **Termination** (`terminates`): the answer is a total function of the finite status list, computed by
  one structural pass over it.

All of it is over `Nat` and finite lists. Where the contract stores counters as `uint32`, this module
agrees with it as long as the member count is below `2^32` (the registry's cap is far smaller).
`rejoin` is modelled as returning a member to `silent`: the contract flips the flag back and tells a
fresh `rejoined` cell, and the member must act again to be heard. Every subtraction below
carries its hypothesis; no truncated subtraction stands in for a revert.
-/

namespace Obsmetrologia
namespace Economics
namespace Withdrawal

/-! ## Participation and its counters -/

/-- A member's participation in one question: the storage field `status[q][member]`. -/
inductive Participation where
  | silent
  | assented
  | objected
  | withdrawn
  deriving DecidableEq, Repr

open Participation

/-- Add one member's participation to the counters `(heard, withdrawn, objections)`. -/
def tally : Participation → Nat × Nat × Nat → Nat × Nat × Nat
  | silent, (h, w, o) => (h, w, o)
  | assented, (h, w, o) => (h + 1, w, o)
  | objected, (h, w, o) => (h + 1, w, o + 1)
  | withdrawn, (h, w, o) => (h, w + 1, o)

/-- **The counters** over the storage list: `(heard, withdrawn, objections)`. Those who assented or
objected are heard; an objection is also heard. -/
def counts : List Participation → Nat × Nat × Nat
  | [] => (0, 0, 0)
  | p :: ps => tally p (counts ps)

@[simp] theorem counts_nil : counts [] = (0, 0, 0) := rfl
@[simp] theorem counts_cons (p : Participation) (ps : List Participation) :
    counts (p :: ps) = tally p (counts ps) := rfl

/-- Members counted in none of the three counters, given the counters and the member count `n` with the
hypothesis that they fit. -/
def unheard (n heard withdrawn : Nat) (_h : heard + withdrawn ≤ n) : Nat := n - heard - withdrawn

/-- Heard and withdrawn members never exceed the members, and objections are among the heard. -/
theorem counts_bounds (ps : List Participation) :
    (counts ps).1 + (counts ps).2.1 ≤ ps.length ∧ (counts ps).2.2 ≤ (counts ps).1 := by
  induction ps with
  | nil => simp
  | cons p ps ih =>
    simp only [counts_cons]
    generalize counts ps = c at ih ⊢
    obtain ⟨h, w, o⟩ := c
    obtain ⟨ih1, ih2⟩ := ih
    dsimp only at ih1 ih2
    cases p <;> simp only [tally, List.length_cons] <;> exact ⟨by omega, by omega⟩

theorem heard_add_withdrawn_le (ps : List Participation) :
    (counts ps).1 + (counts ps).2.1 ≤ ps.length := (counts_bounds ps).1

theorem objections_le_heard (ps : List Participation) : (counts ps).2.2 ≤ (counts ps).1 :=
  (counts_bounds ps).2

/-- The unheard, heard and withdrawn partition the members. -/
theorem unheard_partition (ps : List Participation) :
    (counts ps).1 + (counts ps).2.1
        + unheard ps.length (counts ps).1 (counts ps).2.1 (heard_add_withdrawn_le ps)
      = ps.length := by
  unfold unheard
  rw [Nat.sub_sub]
  exact Nat.add_sub_of_le (heard_add_withdrawn_le ps)

/-- **Silence is bottom.** A member who has said nothing changes no counter. -/
theorem silence_is_bottom (ps : List Participation) : counts (ps ++ [silent]) = counts ps := by
  induction ps with
  | nil => rfl
  | cons p ps ih => simp [ih]

/-- Silence anywhere is invisible to the counters. -/
theorem counts_silent_cons (ps : List Participation) : counts (silent :: ps) = counts ps := rfl

/-- The counters do not depend on the order of the list: swapping the first two entries leaves them. -/
theorem counts_swap (p q : Participation) (ps : List Participation) :
    counts (p :: q :: ps) = counts (q :: p :: ps) := by
  simp only [counts_cons]
  generalize counts ps = c
  obtain ⟨h, w, o⟩ := c
  cases p <;> cases q <;> rfl

/-! ## The answer -/

/-- The outcome of a quiesced question (the contract's `Pending` is the state before quiescence). -/
inductive Outcome where
  | consensus
  | escalated
  | adjourned
  deriving DecidableEq, Repr

open Outcome

/-- **Quiescence.** The outcome and whether the standing formula executes. Nobody heard: `adjourned`
(and `F0` executes instead). Objections at or above the quorum: `escalated` (no standing formula).
Otherwise `consensus`, the standing formula executes, a minority objection being recorded. The count
of the withdrawn plays no part; it is an argument because the contract's signature carries it. -/
def quiesce (heard _withdrawn objections quorum : Nat) : Outcome × Bool :=
  if heard = 0 then (adjourned, false)
  else if quorum ≤ objections then (escalated, false)
  else (consensus, true)

/-- The three cases, exhaustively. -/
theorem quiesce_cases (heard withdrawn objections quorum : Nat) :
    (heard = 0 ∧ quiesce heard withdrawn objections quorum = (adjourned, false)) ∨
    (heard ≠ 0 ∧ quorum ≤ objections ∧ quiesce heard withdrawn objections quorum = (escalated, false)) ∨
    (heard ≠ 0 ∧ objections < quorum ∧ quiesce heard withdrawn objections quorum = (consensus, true)) := by
  unfold quiesce
  by_cases h : heard = 0
  · simp [h]
  · by_cases hq : quorum ≤ objections
    · simp [h, hq]
    · right; right
      refine ⟨h, by omega, ?_⟩
      simp [h, hq]

/-- **A lone objection never flattens the allocation.** Objections under the quorum, with someone heard,
keep the default: the standing formula executes. -/
theorem lone_objection_keeps_default (heard withdrawn objections quorum : Nat)
    (hobj : objections < quorum) (hheard : 0 < heard) :
    (quiesce heard withdrawn objections quorum).2 = true := by
  unfold quiesce
  have h1 : heard ≠ 0 := by omega
  have h2 : ¬ quorum ≤ objections := by omega
  simp [h1, h2]

/-- Under the quorum with someone heard, the outcome is `consensus`. -/
theorem under_quorum_is_consensus (heard withdrawn objections quorum : Nat)
    (hobj : objections < quorum) (hheard : 0 < heard) :
    (quiesce heard withdrawn objections quorum).1 = consensus := by
  unfold quiesce
  have h1 : heard ≠ 0 := by omega
  have h2 : ¬ quorum ≤ objections := by omega
  simp [h1, h2]

/-- The standing formula executes exactly on `consensus`. -/
theorem executes_iff_consensus (heard withdrawn objections quorum : Nat) :
    (quiesce heard withdrawn objections quorum).2 = true ↔
      (quiesce heard withdrawn objections quorum).1 = consensus := by
  unfold quiesce
  by_cases h : heard = 0 <;> by_cases hq : quorum ≤ objections <;> simp [h, hq]

/-- Withdrawal changes nothing in the answer except through the other two counters. -/
theorem quiesce_ignores_withdrawn (heard w w' objections quorum : Nat) :
    quiesce heard w objections quorum = quiesce heard w' objections quorum := rfl

/-- The answer read off the storage list. -/
def quiesceOf (ps : List Participation) (quorum : Nat) : Outcome × Bool :=
  quiesce (counts ps).1 (counts ps).2.1 (counts ps).2.2 quorum

/-- **A lone objection, over storage.** One member objected, everyone else assented or stayed silent or
withdrew, and the quorum is two or more: the standing formula executes. Stated for any list whose
objection counter is one. -/
theorem lone_objection_over_storage (ps : List Participation) (quorum : Nat)
    (hone : (counts ps).2.2 = 1) (hq : 2 ≤ quorum) :
    (quiesceOf ps quorum).2 = true := by
  have hle := objections_le_heard ps
  exact lone_objection_keeps_default _ _ _ _ (by omega) (by omega)

/-- **Termination.** The answer is a total function of the finite status list: one structural pass
computes the counters, and one comparison reads them; every list has an answer, and it is one of the
three outcomes. -/
theorem terminates (ps : List Participation) (quorum : Nat) :
    ∃ o b, quiesceOf ps quorum = (o, b) ∧ (o = consensus ∨ o = escalated ∨ o = adjourned) := by
  refine ⟨(quiesceOf ps quorum).1, (quiesceOf ps quorum).2, rfl, ?_⟩
  cases (quiesceOf ps quorum).1 <;> simp

/-! ## Withdrawal only lowers engagement -/

/-- `Lowers ps ps'`: `ps'` is `ps` with some entries replaced by `withdrawn`. -/
inductive Lowers : List Participation → List Participation → Prop where
  | nil : Lowers [] []
  | keep (p : Participation) {ps ps' : List Participation} : Lowers ps ps' → Lowers (p :: ps) (p :: ps')
  | drop (p : Participation) {ps ps' : List Participation} : Lowers ps ps' → Lowers (p :: ps) (withdrawn :: ps')

theorem lowers_refl : ∀ ps : List Participation, Lowers ps ps
  | [] => .nil
  | p :: ps => .keep p (lowers_refl ps)

theorem lowers_length {ps ps' : List Participation} (h : Lowers ps ps') : ps.length = ps'.length := by
  induction h with
  | nil => rfl
  | keep _ _ ih => simp [ih]
  | drop _ _ ih => simp [ih]

/-- **Engagement is antitone under withdrawal.** Withdrawing members never raises `heard` or
`objections`, and never lowers `withdrawn`: a member counted out stays out of the engaged set. -/
theorem engaged_antitone {ps ps' : List Participation} (h : Lowers ps ps') :
    (counts ps').1 ≤ (counts ps).1 ∧ (counts ps').2.2 ≤ (counts ps).2.2 ∧
      (counts ps).2.1 ≤ (counts ps').2.1 := by
  induction h with
  | nil => simp
  | @keep p ps ps' _ ih =>
    simp only [counts_cons]
    generalize counts ps = c at ih ⊢
    generalize counts ps' = c' at ih ⊢
    obtain ⟨h, w, o⟩ := c
    obtain ⟨h', w', o'⟩ := c'
    obtain ⟨ih1, ih2, ih3⟩ := ih
    dsimp only at ih1 ih2 ih3
    cases p <;> simp only [tally] <;> exact ⟨by omega, by omega, by omega⟩
  | @drop p ps ps' _ ih =>
    simp only [counts_cons]
    generalize counts ps = c at ih ⊢
    generalize counts ps' = c' at ih ⊢
    obtain ⟨h, w, o⟩ := c
    obtain ⟨h', w', o'⟩ := c'
    obtain ⟨ih1, ih2, ih3⟩ := ih
    dsimp only at ih1 ih2 ih3
    cases p <;> simp only [tally] <;> exact ⟨by omega, by omega, by omega⟩

/-- Setting any one entry to `withdrawn` is a lowering. -/
theorem lowers_set_withdrawn : ∀ (ps : List Participation) (i : Nat),
    Lowers ps (ps.set i withdrawn)
  | [], _ => by simpa using Lowers.nil
  | p :: ps, 0 => by simpa using Lowers.drop p (lowers_refl ps)
  | p :: ps, i + 1 => by simpa using Lowers.keep p (lowers_set_withdrawn ps i)

/-- One withdrawal never raises `heard` or `objections`. -/
theorem withdraw_engaged_antitone (ps : List Participation) (i : Nat) :
    (counts (ps.set i withdrawn)).1 ≤ (counts ps).1 ∧
      (counts (ps.set i withdrawn)).2.2 ≤ (counts ps).2.2 :=
  ⟨(engaged_antitone (lowers_set_withdrawn ps i)).1, (engaged_antitone (lowers_set_withdrawn ps i)).2.1⟩

/-- A withdrawal can lower objections below the quorum, but only by removing an objector's entry:
under a fixed list of everyone else, objections that were under the quorum stay under it. -/
theorem withdraw_keeps_default (ps : List Participation) (i quorum : Nat)
    (hobj : (counts ps).2.2 < quorum) :
    (counts (ps.set i withdrawn)).2.2 < quorum :=
  Nat.lt_of_le_of_lt (withdraw_engaged_antitone ps i).2 hobj

/-! ## The storage model: one member, one position, one cell -/

/-- What a member can do to their own entry. -/
inductive Act where
  | assent
  | object
  | withdraw
  | rejoin
  deriving DecidableEq, Repr

/-- The participation an act leaves in storage. `rejoin` returns the member to `silent`. -/
def Act.status : Act → Participation
  | .assent => assented
  | .object => objected
  | .withdraw => withdrawn
  | .rejoin => silent

/-- The record of a telling: the member's position and the act told (`assentedTo`, `objectedTo`,
`withdrewFrom`, `rejoined`, subject `q#n`; `n` is the position in the cell list). -/
structure Cell where
  member : Nat
  act : Act
  deriving DecidableEq, Repr

/-- The storage of one question: the status list and the cell list (the audit record). -/
structure Store where
  status : List Participation
  cells : List Cell

/-- **A member's act**: set their own entry and tell one fresh cell. -/
def step (s : Store) (i : Nat) (a : Act) : Store where
  status := s.status.set i a.status
  cells := s.cells ++ [⟨i, a⟩]

/-- The status list keeps its length. -/
theorem step_length (s : Store) (i : Nat) (a : Act) : (step s i a).status.length = s.status.length := by
  simp [step]

/-- **An act touches one position.** Every position but the actor's is unchanged, and the actor's
entry (when `i` is a member) becomes the act's status; the positions that differ are within `{i}`. -/
theorem step_touches_one (s : Store) (i : Nat) (a : Act) (hi : i < s.status.length) :
    (∀ j, j ≠ i → (step s i a).status[j]? = s.status[j]?) ∧
    (step s i a).status[i]? = some a.status ∧
    (∀ j, (step s i a).status[j]? ≠ s.status[j]? → j = i) := by
  refine ⟨?_, ?_, ?_⟩
  · intro j hj
    simp [step, Ne.symm hj]
  · simp [step, hi]
  · intro j hj
    by_cases hne : j = i
    · exact hne
    · exact absurd (by simp [step, Ne.symm hne]) hj

/-- **The cell list only grows**, by exactly one cell, and the old cells are kept in place. -/
theorem step_cells_grow (s : Store) (i : Nat) (a : Act) :
    (step s i a).cells.length = s.cells.length + 1 ∧ s.cells <+: (step s i a).cells := by
  refine ⟨by simp [step], ?_⟩
  simp only [step]
  exact List.prefix_append _ _

/-- **Withdrawing touches one member.** The position of the withdrawing member becomes `withdrawn`,
no other position changes, and exactly one `withdrewFrom` cell is appended. -/
theorem withdraw_touches_one (s : Store) (i : Nat) (hi : i < s.status.length) :
    (step s i .withdraw).status[i]? = some withdrawn ∧
    (∀ j, j ≠ i → (step s i .withdraw).status[j]? = s.status[j]?) ∧
    (step s i .withdraw).cells = s.cells ++ [⟨i, .withdraw⟩] := by
  obtain ⟨h1, h2, _⟩ := step_touches_one s i .withdraw hi
  exact ⟨h2, h1, rfl⟩

/-- A withdrawal moves the counters only by lowering `heard` and `objections` and raising `withdrawn`. -/
theorem withdraw_counts (s : Store) (i : Nat) :
    (counts (step s i .withdraw).status).1 ≤ (counts s.status).1 ∧
    (counts (step s i .withdraw).status).2.2 ≤ (counts s.status).2.2 ∧
    (counts s.status).2.1 ≤ (counts (step s i .withdraw).status).2.1 :=
  engaged_antitone (lowers_set_withdrawn s.status i)

/-! ## The house cases, by `decide` -/

example : quiesce 0 3 0 1 = (adjourned, false) := by decide
example : quiesce 0 3 5 1 = (adjourned, false) := by decide
example : quiesce 5 0 3 3 = (escalated, false) := by decide
example : quiesce 5 0 2 3 = (consensus, true) := by decide
example : quiesce 5 4 0 1 = (consensus, true) := by decide
example : quiesce 1 0 1 1 = (escalated, false) := by decide
example : quiesce 3 0 1 2 = (consensus, true) := by decide

example : counts [silent, assented, objected, withdrawn] = (2, 1, 1) := by decide
example : counts [] = (0, 0, 0) := by decide
example : counts [objected, objected, silent] = (2, 0, 2) := by decide
example : counts ([assented, objected] ++ [silent]) = counts [assented, objected] := by decide

/-- A lone objector among five assenters under quorum two keeps the default. -/
example : quiesceOf [assented, assented, assented, assented, assented, objected] 2 = (consensus, true) := by
  decide

/-- Withdrawing the only objector leaves a clean consensus. -/
example : quiesceOf ([assented, objected].set 1 withdrawn) 1 = (consensus, true) := by decide

/-- Withdrawing the only voice adjourns. -/
example : quiesceOf ([assented].set 0 withdrawn) 1 = (adjourned, false) := by decide

end Withdrawal
end Economics
end Obsmetrologia
