import Obsmetrologia.Language.Positing.Four
import Obsmetrologia.Language.Predicating.Quantifying
import ObsmetrologiaComputing.Calm

/-!
# Band — the grouping above offices, and how it coordinates

A band is a group of agents held together by recognition, not by a roster. The house applies
the shape to agents as the grouping above offices that lets a large fleet coordinate (Lane 6,
agency model, 2026-10-03). This module states the band's mathematics: membership, head standing,
council close, fission, and confederacy.

## Theory basis

The structure is read from the house corpus's formalization of Lakota polity-units: the
tiyóšpaye closure rules T1–T3, fission and nested autarkeia; the omníčiye council's consensus by
withdrawal and its quiescence conditions; and iyúhá-šni, withdrawal from an engagement that keeps
the relation. This module states only the organizational mathematics the house applies to its
agents, in general terms. The tradition itself is held by its knowledge holders and is not
formalized here. Cultural material follows the house's consent and review protocols (2026-09-27
release note, "Where the tradition stays").

## Main definitions

* `IsMember` — membership as the least fixpoint of recognition by recognized members: a
  founder, or anyone a member recognizes, unless they have withdrawn. Eligibility (kinship)
  is not membership, and records seed nothing but the founding.
* `members` — membership computed; `members_iff` proves it is exactly `IsMember`.
* `memberReading` — a candidate's standing in FOUR: recognized `t`, denied `f`, held `⊤`,
  unknown `⊥`. Withdrawal reads `⊥`, never `f`: it retracts an engagement and keeps the relation.
* `headStanding` — the knowledge-meet of the members' recognition cells (T3). The head has no
  command power. Nothing reads "the head says so".
* `councilClose` — the council's question settles to the knowledge-join of the engaged
  members' readings: consensus, contested (`⊤` held, never exploded), or unresolved.
* `fission` — a subset that withdraws together founds a new band. Every other member stays, and
  the two bands camp together.
* `confederate` — bands' settlements on one question glue when no overlap between bands
  conflicts. When some do, the obstruction is the list of conflicting overlaps.

## Main results

* `members_iff` — the computed membership is the least fixpoint.
* `recognition_monotone` — recognition is a telling: more recognitions never remove a member.
  `withdrawal_retracts` — a withdrawal can remove members other than the one who withdraws.
  So a band's recognitions need no coordination, and its withdrawals need the seal (`Calm`).
* `head_collapses` — one member's withdrawn recognition brings the head's standing down.
* `silence_never_blocks` — an engaged member who tells nothing changes no council outcome.
  `consensus_by_withdrawal` — if those who told against withdraw, a council where anyone told
  for reaches consensus, and the withdrawn stay members. `posits_climb` — speaking only climbs
  the merged reading in `≤ₖ`.
* `fission_distributes` — after a fission, every member reached from the parent's remaining
  founders stays, every member reached only from the fissioning subset goes with it, and nobody
  is in both.
* `confederate_glues_iff` — a confederacy glues exactly when no overlap conflicts. The glued
  reading is the knowledge-join of every band's.
* `council_tree_depth` — councils of fan-out `k` over bands of at most `s` members reach `N`
  members within `d` levels whenever `s · kᵈ ≥ N`, and each council coordinates at most
  `k(k−1)/2` overlaps. The cost per level is bounded by the fan-out, whatever the fleet's size.
-/

namespace ObsmetrologiaComputing.Band

open Obsmetrologia

/-- An agent, by number. -/
abbrev Agent := Nat

/-! ## Lists of agents, structurally -/

/-- Membership in a list of agents, as a Boolean. -/
def has (l : List Agent) (a : Agent) : Bool := l.any (fun b => decide (b = a))

theorem has_iff {l : List Agent} {a : Agent} : has l a = true ↔ a ∈ l :=
  ⟨Calm.mem_of_has, Calm.has_of_mem⟩

theorem length_map' {α β : Type} (f : α → β) : ∀ (l : List α), (l.map f).length = l.length
  | [] => rfl
  | _ :: as => congrArg Nat.succ (length_map' f as)

theorem length_append' {α : Type} : ∀ (l r : List α), (l ++ r).length = l.length + r.length
  | [], r => (Nat.zero_add _).symm
  | _ :: as, r => by
    show (as ++ r).length + 1 = as.length + 1 + r.length
    rw [length_append' as r, Nat.add_right_comm]

/-- Remove an agent everywhere. -/
def erase (a : Agent) (l : List Agent) : List Agent := l.filter (fun b => !decide (b = a))

theorem mem_erase {a x : Agent} {l : List Agent} : x ∈ erase a l ↔ x ∈ l ∧ x ≠ a := by
  constructor
  · intro h
    have r := Calm.mem_of_mem_filter h
    refine ⟨r.1, fun e => ?_⟩
    rw [e] at r
    have h2 := r.2
    rw [decide_eq_true rfl] at h2
    exact nomatch h2
  · intro ⟨hx, hne⟩
    apply Calm.mem_filter_of hx
    cases hd : decide (x = a) with
    | false => rfl
    | true => exact absurd (of_decide_eq_true hd) hne

theorem length_erase_le (a : Agent) : ∀ (l : List Agent), (erase a l).length ≤ l.length
  | [] => Nat.le_refl _
  | b :: bs => by
    unfold erase List.filter
    cases decide (b = a) with
    | true => exact Nat.le_succ_of_le (length_erase_le a bs)
    | false => exact Nat.succ_le_succ (length_erase_le a bs)

theorem length_erase_lt {a : Agent} : ∀ {l : List Agent}, a ∈ l → (erase a l).length < l.length
  | b :: bs, h => by
    unfold erase List.filter
    by_cases e : b = a
    · rw [decide_eq_true e]
      exact Nat.lt_succ_of_le (length_erase_le a bs)
    · rw [decide_eq_false e]
      match Calm.mem_cons_cases h with
      | Or.inl e' => exact absurd e'.symm e
      | Or.inr h' => exact Nat.succ_lt_succ (length_erase_lt h')

/-- **The pigeonhole.** A duplicate-free list drawn from `p` is no longer than `p`. -/
theorem length_le_of_nodup_sub : ∀ {l p : List Agent}, l.Pairwise (· ≠ ·) → (∀ x, x ∈ l → x ∈ p) →
    l.length ≤ p.length
  | [], _, _, _ => Nat.zero_le _
  | x :: xs, p, .cons hx hxs, hsub => by
    have hxp : x ∈ p := hsub x (List.Mem.head _)
    have hrest : ∀ y, y ∈ xs → y ∈ erase x p := fun y hy =>
      mem_erase.mpr ⟨hsub y (List.Mem.tail _ hy), fun e => hx y hy e.symm⟩
    have ih := length_le_of_nodup_sub hxs hrest
    exact Nat.lt_of_le_of_lt ih (length_erase_lt hxp)

/-! ## Membership -/

/-- What a band is told: who recognizes whom as a member, who denies whom, and who has withdrawn
from the band's engagement. -/
structure Told where
  recognitions : List (Agent × Agent) := []
  denials : List (Agent × Agent) := []
  withdrawn : List Agent := []
  deriving DecidableEq, Repr

/-- **Membership is the least fixpoint of recognition by recognized members** (T1): a founder, or
anyone a member recognizes, unless they have withdrawn. -/
inductive IsMember (founders : List Agent) (t : Told) : Agent → Prop where
  | founder {b : Agent} : b ∈ founders → b ∉ t.withdrawn → IsMember founders t b
  | recognized {a b : Agent} : IsMember founders t a → (a, b) ∈ t.recognitions → b ∉ t.withdrawn →
      IsMember founders t b

/-- Everyone who could be a member: the founders and everyone recognized by anyone. -/
def pool (founders : List Agent) (t : Told) : List Agent := founders ++ t.recognitions.map (·.2)

/-- The agents of `cands` not yet in `m`, not withdrawn, each once, added to `m`. -/
def addNew (t : Told) (m : List Agent) : List Agent → List Agent
  | [] => m
  | b :: bs => if has m b || has t.withdrawn b then addNew t m bs else addNew t (m ++ [b]) bs

/-- One round: everyone a current member recognizes. -/
def round (t : Told) (m : List Agent) : List Agent :=
  addNew t m (t.recognitions.filterMap fun p => if has m p.1 then some p.2 else none)

/-- Rounds until nothing new is recognized; `fuel` rounds at most. -/
def iterate (t : Told) : Nat → List Agent → List Agent
  | 0, m => m
  | n + 1, m => let m' := round t m; if m'.length = m.length then m else iterate t n m'

/-- The founders who have not withdrawn, then rounds of recognition until none adds anyone. -/
def reached (founders : List Agent) (t : Told) : List Agent :=
  iterate t ((pool founders t).length + 1) (addNew t [] founders)

/-- **The band's members**, computed, as a set (sorted, each once). -/
def members (founders : List Agent) (t : Told) : List Agent := Calm.setOf (reached founders t)

theorem mem_addNew {t : Told} : ∀ (m cands : List Agent) (x : Agent),
    x ∈ addNew t m cands ↔ x ∈ m ∨ (x ∈ cands ∧ x ∉ t.withdrawn)
  | m, [], x => ⟨Or.inl, fun h => match h with | Or.inl h => h | Or.inr ⟨h, _⟩ => nomatch h⟩
  | m, b :: bs, x => by
    unfold addNew
    by_cases hc : (has m b || has t.withdrawn b) = true
    · rw [if_pos hc]
      have ih := mem_addNew (t := t) m bs x
      constructor
      · intro h
        match ih.mp h with
        | Or.inl h' => exact Or.inl h'
        | Or.inr ⟨h', hw⟩ => exact Or.inr ⟨List.Mem.tail _ h', hw⟩
      · intro h
        match h with
        | Or.inl h' => exact ih.mpr (Or.inl h')
        | Or.inr ⟨h', hw⟩ =>
          match Calm.mem_cons_cases h' with
          | Or.inl e =>
            subst e
            cases hm : has m x with
            | true => exact ih.mpr (Or.inl (has_iff.mp hm))
            | false =>
              rw [hm, Bool.false_or] at hc
              exact absurd (has_iff.mp hc) hw
          | Or.inr h'' => exact ih.mpr (Or.inr ⟨h'', hw⟩)
    · rw [if_neg hc]
      have ih := mem_addNew (t := t) (m ++ [b]) bs x
      have hb : b ∉ t.withdrawn := fun hw => hc (by rw [has_iff.mpr hw, Bool.or_true])
      constructor
      · intro h
        match ih.mp h with
        | Or.inl h' =>
          match Calm.mem_append_cases h' with
          | Or.inl h'' => exact Or.inl h''
          | Or.inr h'' => have e := Calm.mem_singleton h''; subst e; exact Or.inr ⟨List.Mem.head _, hb⟩
        | Or.inr ⟨h', hw⟩ => exact Or.inr ⟨List.Mem.tail _ h', hw⟩
      · intro h
        match h with
        | Or.inl h' => exact ih.mpr (Or.inl (Calm.mem_append_of_left _ h'))
        | Or.inr ⟨h', hw⟩ =>
          match Calm.mem_cons_cases h' with
          | Or.inl e => subst e; exact ih.mpr (Or.inl (Calm.mem_append_of_right _ (List.Mem.head _)))
          | Or.inr h'' => exact ih.mpr (Or.inr ⟨h'', hw⟩)

theorem length_addNew_ge {t : Told} : ∀ (m cands : List Agent), m.length ≤ (addNew t m cands).length
  | m, [] => Nat.le_refl _
  | m, b :: bs => by
    unfold addNew
    by_cases hc : (has m b || has t.withdrawn b) = true
    · rw [if_pos hc]; exact length_addNew_ge m bs
    · rw [if_neg hc]
      have h := length_addNew_ge (t := t) (m ++ [b]) bs
      rw [length_append'] at h
      exact Nat.le_of_succ_le h

/-- If nothing was added, every element was already there. -/
theorem addNew_same {t : Told} : ∀ (m cands : List Agent),
    (addNew t m cands).length = m.length → ∀ x, x ∈ addNew t m cands → x ∈ m
  | m, [], _, x, h => h
  | m, b :: bs, hl, x, h => by
    unfold addNew at hl h
    by_cases hc : (has m b || has t.withdrawn b) = true
    · rw [if_pos hc] at hl h; exact addNew_same m bs hl x h
    · rw [if_neg hc] at hl h
      have hge := length_addNew_ge (t := t) (m ++ [b]) bs
      rw [hl, length_append'] at hge
      exact absurd hge (Nat.not_succ_le_self _)

theorem pairwise_append_single : ∀ {m : List Agent} {b : Agent}, m.Pairwise (· ≠ ·) → b ∉ m →
    (m ++ [b]).Pairwise (· ≠ ·)
  | [], _, _, _ => List.Pairwise.cons (fun _ h => nomatch h) List.Pairwise.nil
  | a :: as, b, .cons ha has', hb => by
    refine List.Pairwise.cons (fun y hy => ?_) (pairwise_append_single has' (fun h => hb (List.Mem.tail _ h)))
    match Calm.mem_append_cases hy with
    | Or.inl h => exact ha y h
    | Or.inr h => have e := Calm.mem_singleton h; subst e; exact fun e' => hb (e' ▸ List.Mem.head _)

theorem addNew_nodup {t : Told} : ∀ (m cands : List Agent), m.Pairwise (· ≠ ·) →
    (addNew t m cands).Pairwise (· ≠ ·)
  | m, [], h => h
  | m, b :: bs, h => by
    unfold addNew
    by_cases hc : (has m b || has t.withdrawn b) = true
    · rw [if_pos hc]; exact addNew_nodup m bs h
    · rw [if_neg hc]
      have hb : b ∉ m := fun hm => hc (by rw [has_iff.mpr hm, Bool.true_or])
      exact addNew_nodup (m ++ [b]) bs (pairwise_append_single h hb)

theorem mem_filterMap {f : Agent × Agent → Option Agent} {y : Agent} :
    ∀ {l : List (Agent × Agent)}, y ∈ l.filterMap f ↔ ∃ p, p ∈ l ∧ f p = some y
  | [] => ⟨fun h => (nomatch h), fun h => (match h with | ⟨_, h', _⟩ => nomatch h')⟩
  | p :: ps => by
    unfold List.filterMap
    cases hf : f p with
    | none =>
      constructor
      · intro h; let ⟨q, hq, e⟩ := mem_filterMap.mp h; exact ⟨q, List.Mem.tail _ hq, e⟩
      · intro ⟨q, hq, e⟩
        match Calm.mem_cons_cases hq with
        | Or.inl eq => rw [eq, hf] at e; exact nomatch e
        | Or.inr hq' => exact mem_filterMap.mpr ⟨q, hq', e⟩
    | some z =>
      constructor
      · intro h
        match Calm.mem_cons_cases h with
        | Or.inl e => exact ⟨p, List.Mem.head _, by rw [hf, e]⟩
        | Or.inr h' => let ⟨q, hq, e⟩ := mem_filterMap.mp h'; exact ⟨q, List.Mem.tail _ hq, e⟩
      · intro ⟨q, hq, e⟩
        match Calm.mem_cons_cases hq with
        | Or.inl eq => rw [eq, hf] at e; cases e; exact List.Mem.head _
        | Or.inr hq' => exact List.Mem.tail _ (mem_filterMap.mpr ⟨q, hq', e⟩)

theorem mem_round {t : Told} {m : List Agent} {x : Agent} :
    x ∈ round t m ↔ x ∈ m ∨ ((∃ a, a ∈ m ∧ (a, x) ∈ t.recognitions) ∧ x ∉ t.withdrawn) := by
  unfold round
  refine Iff.trans (mem_addNew _ _ _) ?_
  constructor
  · intro h
    match h with
    | Or.inl h' => exact Or.inl h'
    | Or.inr ⟨hc, hw⟩ =>
      refine Or.inr ⟨?_, hw⟩
      have ⟨⟨a, b⟩, hab, hf⟩ := mem_filterMap.mp hc
      by_cases ha : has m a = true
      · rw [if_pos ha] at hf
        cases hf
        exact ⟨a, has_iff.mp ha, hab⟩
      · rw [if_neg ha] at hf
        exact nomatch hf
  · intro h
    match h with
    | Or.inl h' => exact Or.inl h'
    | Or.inr ⟨⟨a, ha, hax⟩, hw⟩ =>
      refine Or.inr ⟨mem_filterMap.mpr ⟨(a, x), hax, ?_⟩, hw⟩
      show (if has m a = true then some x else none) = some x
      rw [if_pos (has_iff.mpr ha)]

/-- Rounds only add. -/
theorem iterate_grows (t : Told) : ∀ (n : Nat) (m : List Agent) (x : Agent), x ∈ m → x ∈ iterate t n m
  | 0, _, _, h => h
  | n + 1, m, x, h => by
    unfold iterate
    by_cases e : (round t m).length = m.length
    · rw [if_pos e]; exact h
    · rw [if_neg e]; exact iterate_grows t n _ x (mem_round.mpr (Or.inl h))

/-- Closed under recognition: every member's recognition of a non-withdrawn agent makes a member. -/
def Closed (t : Told) (m : List Agent) : Prop :=
  ∀ a b, a ∈ m → (a, b) ∈ t.recognitions → b ∉ t.withdrawn → b ∈ m

/-- Rounds reach closure before the pool runs out. -/
theorem iterate_closed (founders : List Agent) (t : Told) : ∀ (n : Nat) (m : List Agent),
    m.Pairwise (· ≠ ·) → (∀ x, x ∈ m → x ∈ pool founders t) →
    (pool founders t).length < m.length + n → Closed t (iterate t n m)
  | 0, m, hnd, hsub, hlt => absurd (length_le_of_nodup_sub hnd hsub) (Nat.not_le_of_lt hlt)
  | n + 1, m, hnd, hsub, hlt => by
    unfold iterate
    by_cases e : (round t m).length = m.length
    · rw [if_pos e]
      intro a b ha hab hw
      exact addNew_same m _ e b (mem_round.mpr (Or.inr ⟨⟨a, ha, hab⟩, hw⟩))
    · rw [if_neg e]
      have hge := length_addNew_ge (t := t) m (t.recognitions.filterMap fun p => if has m p.1 then some p.2 else none)
      have hgt : m.length < (round t m).length :=
        Nat.lt_of_le_of_ne hge (fun h => e h.symm)
      apply iterate_closed founders t n (round t m) (addNew_nodup m _ hnd)
      · intro x hx
        match mem_round.mp hx with
        | Or.inl h => exact hsub x h
        | Or.inr ⟨⟨a, _, hax⟩, _⟩ =>
          exact Calm.mem_append_of_right _ ((Calm.mem_map_iff _ _ x).mpr ⟨(a, x), hax, rfl⟩)
      · apply Nat.lt_of_lt_of_le hlt
        rw [Nat.add_succ, ← Nat.succ_add]
        exact Nat.add_le_add_right hgt n

/-- Everything a round finds is a member. -/
theorem round_sound {founders : List Agent} {t : Told} {m : List Agent}
    (h : ∀ x, x ∈ m → IsMember founders t x) : ∀ x, x ∈ round t m → IsMember founders t x := by
  intro x hx
  match mem_round.mp hx with
  | Or.inl h' => exact h x h'
  | Or.inr ⟨⟨a, ha, hax⟩, hw⟩ => exact IsMember.recognized (h a ha) hax hw

theorem iterate_sound {founders : List Agent} {t : Told} : ∀ (n : Nat) (m : List Agent),
    (∀ x, x ∈ m → IsMember founders t x) → ∀ x, x ∈ iterate t n m → IsMember founders t x
  | 0, _, h => h
  | n + 1, m, h => by
    unfold iterate
    by_cases e : (round t m).length = m.length
    · rw [if_pos e]; exact h
    · rw [if_neg e]; exact iterate_sound n _ (round_sound h)

/-- Rounds reach exactly the least fixpoint of recognition. -/
theorem reached_iff (founders : List Agent) (t : Told) (b : Agent) :
    b ∈ reached founders t ↔ IsMember founders t b := by
  have h0 : ∀ x, x ∈ addNew t [] founders ↔ x ∈ founders ∧ x ∉ t.withdrawn := fun x =>
    ⟨fun h => match (mem_addNew [] founders x).mp h with
      | Or.inl h' => nomatch h'
      | Or.inr r => r,
     fun r => (mem_addNew [] founders x).mpr (Or.inr r)⟩
  constructor
  · apply iterate_sound
    intro x hx
    have ⟨hf, hw⟩ := (h0 x).mp hx
    exact IsMember.founder hf hw
  · intro hb
    have hclosed : Closed t (reached founders t) := by
      apply iterate_closed founders t _ _ (addNew_nodup [] founders List.Pairwise.nil)
      · intro x hx
        exact Calm.mem_append_of_left _ ((h0 x).mp hx).1
      · exact Nat.lt_of_lt_of_le (Nat.lt_succ_self _) (Nat.le_add_left _ _)
    induction hb with
    | founder hf hw => exact iterate_grows t _ _ _ ((h0 _).mpr ⟨hf, hw⟩)
    | recognized _ hab hw ih => exact hclosed _ _ ih hab hw

/-- **The computed members are exactly the least fixpoint of recognition.** -/
theorem members_iff (founders : List Agent) (t : Told) (b : Agent) :
    b ∈ members founders t ↔ IsMember founders t b :=
  Iff.trans (Calm.setOf_mem _ b) (reached_iff founders t b)

/-! ## Recognition is a telling; withdrawal retracts -/

/-- **Recognition is a telling**: more recognitions never remove a member. -/
theorem recognition_monotone {founders : List Agent} {t t' : Told}
    (hr : ∀ p, p ∈ t.recognitions → p ∈ t'.recognitions) (hw : t'.withdrawn = t.withdrawn)
    {b : Agent} (h : b ∈ members founders t) : b ∈ members founders t' := by
  apply (members_iff founders t' b).mpr
  have hb := (members_iff founders t b).mp h
  clear h
  induction hb with
  | founder hf hnw => exact IsMember.founder hf (by rw [hw]; exact hnw)
  | recognized _ hab hnw ih => exact IsMember.recognized ih (hr _ hab) (by rw [hw]; exact hnw)

/-- **Withdrawal retracts**: one agent's withdrawal removes another, recognized only through it. -/
theorem withdrawal_retracts :
    has (members [1] { recognitions := [(1, 2), (2, 3)] }) 3 = true ∧
    has (members [1] { recognitions := [(1, 2), (2, 3)], withdrawn := [2] }) 3 = false := by
  decide

/-- A candidate's standing in FOUR: the for side when a member, the against side when a member
denies it, and `⊥` once it has withdrawn (withdrawal retracts the engagement, never tells against). -/
def memberReading (founders : List Agent) (t : Told) (b : Agent) : Reading :=
  if has t.withdrawn b then Reading.kBot
  else
    let ms := members founders t
    Reading.ofSlots (has ms b) (t.denials.any fun p => has ms p.1 && decide (p.2 = b))

/-! ## The head stands on recognition, not command -/

/-- Who recognizes whom as head, and who denies it. -/
structure HeadTold where
  recognizes : List (Agent × Agent) := []
  denies : List (Agent × Agent) := []
  deriving DecidableEq, Repr

/-- One member's recognition cell for head `h`. -/
def headCell (ht : HeadTold) (a h : Agent) : Reading :=
  Reading.ofSlots (ht.recognizes.any fun p => decide (p = (a, h))) (ht.denies.any fun p => decide (p = (a, h)))

/-- **Head standing** is the knowledge-meet of every member's recognition cell (T3). A band with no
members has no head. The head stands when the meet carries the for side. -/
def headStanding (ms : List Agent) (ht : HeadTold) (h : Agent) : Reading :=
  match ms with
  | [] => Reading.kBot
  | _ :: _ => ms.foldl (fun r a => Reading.meetK r (headCell ht a h)) Reading.kTop

/-- **One withdrawn recognition brings the head down.** -/
theorem head_collapses :
    (headStanding [1, 2, 3] { recognizes := [(1, 1), (2, 1), (3, 1)] } 1).pos = true ∧
    (headStanding [1, 2, 3] { recognizes := [(1, 1), (2, 1)] } 1).pos = false := by
  decide

/-! ## The council closes by withdrawal, never by tally -/

theorem pos_joinK (a b : Reading) : (Reading.joinK a b).pos = (a.pos || b.pos) := by
  unfold Reading.joinK; rw [Reading.pos_ofSlots]
theorem neg_joinK (a b : Reading) : (Reading.joinK a b).neg = (a.neg || b.neg) := by
  unfold Reading.joinK; rw [Reading.neg_ofSlots]

theorem pos_joinList : ∀ (l : List Reading), (Reading.joinList l).pos = l.any (·.pos)
  | [] => rfl
  | a :: as => by
    show (Reading.joinK a (Reading.joinList as)).pos = (a.pos || as.any (·.pos))
    rw [pos_joinK, pos_joinList as]

theorem neg_joinList : ∀ (l : List Reading), (Reading.joinList l).neg = l.any (·.neg)
  | [] => rfl
  | a :: as => by
    show (Reading.joinK a (Reading.joinList as)).neg = (a.neg || as.any (·.neg))
    rw [neg_joinK, neg_joinList as]

/-- The knowledge-join of readings is read off its two slots. -/
theorem joinList_eq (l : List Reading) :
    Reading.joinList l = Reading.ofSlots (l.any (·.pos)) (l.any (·.neg)) := by
  rw [← pos_joinList, ← neg_joinList, Reading.ofSlots_pos_neg]

/-- **The join reads lists as sets**: any order, any repetition. -/
theorem joinList_set {l l' : List Reading} (h : ∀ x, x ∈ l ↔ x ∈ l') :
    Reading.joinList l = Reading.joinList l' := by
  rw [joinList_eq, joinList_eq, Calm.any_congr h, Calm.any_congr h]

theorem filter_cons_eq {α : Type} (q : α → Bool) (x : α) (xs : List α) :
    (x :: xs).filter q = (match q x with | true => x :: xs.filter q | false => xs.filter q) := rfl

/-- How a council's question stands. -/
inductive Close where
  /-- The engaged agree: the question settles for (`true`) or against (`false`). -/
  | consensus (side : Bool)
  /-- The engaged disagree: `⊤` held, never exploded. Withdrawal or escalation moves it. -/
  | contested
  /-- Nothing was told: neither resolved nor referred. -/
  | unresolved
  deriving DecidableEq, Repr

/-- The merged reading of the engaged: the knowledge-join of the readings of members who have
not withdrawn from this question. -/
def merged (engaged : List (Agent × Reading)) (withdrawn : List Agent) : Reading :=
  Reading.joinList ((engaged.filter fun p => !has withdrawn p.1).map (·.2))

/-- **The council's close** reads the merged question cell. -/
def councilClose (engaged : List (Agent × Reading)) (withdrawn : List Agent) : Close :=
  match merged engaged withdrawn with
  | .potential => .consensus true
  | .active => .consensus false
  | .stable => .contested
  | .absurd => .unresolved

/-- **Silence never blocks.** An engaged member who tells nothing changes no close. -/
theorem silence_never_blocks (engaged : List (Agent × Reading)) (withdrawn : List Agent) (a : Agent) :
    councilClose ((a, Reading.kBot) :: engaged) withdrawn = councilClose engaged withdrawn := by
  have hm : merged ((a, Reading.kBot) :: engaged) withdrawn = merged engaged withdrawn := by
    unfold merged
    rw [filter_cons_eq]
    cases has withdrawn a with
    | true => rfl
    | false =>
      show Reading.joinK Reading.kBot _ = _
      exact Reading.joinK_kBot _
  unfold councilClose
  rw [hm]

/-- **The council's close reads the engaged as a set**: any order of speaking, any repetition. -/
theorem council_order_free {e e' : List (Agent × Reading)} (withdrawn : List Agent)
    (h : ∀ x, x ∈ e ↔ x ∈ e') : councilClose e withdrawn = councilClose e' withdrawn := by
  have hm : merged e withdrawn = merged e' withdrawn := by
    apply joinList_set
    intro r
    constructor
    · intro hr
      have ⟨x, hx, ex⟩ := (Calm.mem_map_iff _ _ r).mp hr
      have hf := Calm.mem_of_mem_filter hx
      exact (Calm.mem_map_iff _ _ r).mpr ⟨x, Calm.mem_filter_of ((h x).mp hf.1) hf.2, ex⟩
    · intro hr
      have ⟨x, hx, ex⟩ := (Calm.mem_map_iff _ _ r).mp hr
      have hf := Calm.mem_of_mem_filter hx
      exact (Calm.mem_map_iff _ _ r).mpr ⟨x, Calm.mem_filter_of ((h x).mpr hf.1) hf.2, ex⟩
  unfold councilClose
  rw [hm]

theorem joinK_absorb (r X : Reading) : Reading.joinK X (Reading.joinK r X) = Reading.joinK r X := by
  rw [← Reading.joinK_assoc, Reading.joinK_comm X r, Reading.joinK_assoc, Reading.joinK_idem]

/-- **Speaking only climbs.** One more posit raises the merged reading in `≤ₖ`. -/
theorem posits_climb (engaged : List (Agent × Reading)) (withdrawn : List Agent) (p : Agent × Reading) :
    Reading.joinK (merged engaged withdrawn) (merged (p :: engaged) withdrawn) = merged (p :: engaged) withdrawn := by
  unfold merged
  rw [filter_cons_eq]
  cases has withdrawn p.1 with
  | true => exact Reading.joinK_idem _
  | false => exact joinK_absorb p.2 _

/-- Whether a reading tells against side `s`. -/
def against (s : Bool) (r : Reading) : Bool := if s then r.neg else r.pos

/-- The members who told against the side `s`. -/
def againstSide (s : Bool) (engaged : List (Agent × Reading)) : List Agent :=
  (engaged.filter fun p => against s p.2).map (·.1)

theorem has_append_false {l r : List Agent} {a : Agent} (hl : has l a = false) (hr : has r a = false) :
    has (l ++ r) a = false := by
  cases h : has (l ++ r) a with
  | false => rfl
  | true =>
    match Calm.mem_append_cases (has_iff.mp h) with
    | Or.inl h' => rw [has_iff.mpr h'] at hl; exact nomatch hl
    | Or.inr h' => rw [has_iff.mpr h'] at hr; exact nomatch hr

theorem has_append_of_right (l : List Agent) {r : List Agent} {a : Agent} (h : has r a = true) :
    has (l ++ r) a = true := has_iff.mpr (Calm.mem_append_of_right l (has_iff.mp h))

/-- **Consensus by withdrawal.** Suppose an engaged member told side `s` and nothing against it.
If everyone who told against `s` withdraws, the council reaches consensus `s`. No tally
overrides anyone. -/
theorem consensus_by_withdrawal (s : Bool) (engaged : List (Agent × Reading)) (withdrawn : List Agent)
    (p : Agent × Reading) (hp : p ∈ engaged) (hpw : has withdrawn p.1 = false)
    (hps : p.2 = (if s then Reading.tTop else Reading.tBot))
    (halone : ∀ q, q ∈ engaged → q.1 = p.1 → against s q.2 = false) :
    councilClose engaged (withdrawn ++ againstSide s engaged) = .consensus s := by
  let W := withdrawn ++ againstSide s engaged
  let R := (engaged.filter fun q => !has W q.1).map (·.2)
  -- nobody remaining tells against s
  have hnone : R.any (against s) = false := by
    cases h : R.any (against s) with
    | false => rfl
    | true =>
      have ⟨r, hr, har⟩ := Calm.exists_of_any h
      have ⟨q, hq, eq⟩ := (Calm.mem_map_iff _ _ r).mp hr
      have hqf := Calm.mem_of_mem_filter hq
      have hqa : q.1 ∈ againstSide s engaged :=
        (Calm.mem_map_iff _ _ q.1).mpr ⟨q, Calm.mem_filter_of hqf.1 (by rw [eq]; exact har), rfl⟩
      have hW : has W q.1 = true := has_append_of_right withdrawn (has_iff.mpr hqa)
      have hn := hqf.2
      rw [hW] at hn
      exact nomatch hn
  -- the witness remains and tells s
  have hpa : has (againstSide s engaged) p.1 = false := by
    cases h : has (againstSide s engaged) p.1 with
    | false => rfl
    | true =>
      have ⟨q, hq, eq⟩ := (Calm.mem_map_iff _ _ p.1).mp (has_iff.mp h)
      have hqf := Calm.mem_of_mem_filter hq
      rw [halone q hqf.1 eq] at hqf
      exact nomatch hqf.2
  have hpR : p.2 ∈ R := (Calm.mem_map_iff _ _ p.2).mpr
    ⟨p, Calm.mem_filter_of hp (by show (!has W p.1) = true; rw [has_append_false hpw hpa]; rfl), rfl⟩
  have hm : merged engaged W = (if s then Reading.tTop else Reading.tBot) := by
    show Reading.joinList R = _
    rw [joinList_eq]
    cases s with
    | true =>
      have hneg : R.any (·.neg) = false := hnone
      have hpos : R.any (·.pos) = true := Calm.any_of_mem hpR (by rw [hps]; rfl)
      rw [hneg, hpos]; rfl
    | false =>
      have hpos : R.any (·.pos) = false := hnone
      have hneg : R.any (·.neg) = true := Calm.any_of_mem hpR (by rw [hps]; rfl)
      rw [hneg, hpos]; rfl
  show (match merged engaged W with
    | .potential => Close.consensus true
    | .active => Close.consensus false
    | .stable => Close.contested
    | .absurd => Close.unresolved) = Close.consensus s
  rw [hm]
  cases s <;> rfl

/-- **Withdrawal retracts a close**: the one member who told withdraws, and the consensus is gone. -/
theorem council_withdrawal_retracts :
    councilClose [(1, Reading.tTop)] [] = .consensus true ∧ councilClose [(1, Reading.tTop)] [1] = .unresolved := by
  decide

/-! ## Fission keeps everyone, and kinship continues -/

/-- A fission's result: the parent band, the new band, and whether they camp together. -/
structure Fission where
  parent : List Agent
  child : List Agent
  campsWith : Bool
  deriving DecidableEq, Repr

/-- **Fission.** The subset `S` withdraws together from the band and founds its own. The parent is
the band with `S` withdrawn. The child is everyone `S` reaches who does not stay in the parent:
nobody is expelled by a fission. The two bands camp together, because withdrawal keeps the
relation. -/
def fission (founders : List Agent) (t : Told) (S : List Agent) : Fission :=
  let parent := members founders { t with withdrawn := t.withdrawn ++ S }
  { parent, child := (members S t).filter (fun x => !has parent x), campsWith := true }

theorem not_withdrawn_of_member {founders : List Agent} {t : Told} {x : Agent}
    (h : IsMember founders t x) : x ∉ t.withdrawn := by
  cases h with
  | founder _ hw => exact hw
  | recognized _ _ hw => exact hw

/-- **Fission keeps everyone.** Every member before a fission is in the parent or the new band
after it. -/
theorem fission_keeps_everyone (founders : List Agent) (t : Told) (S : List Agent) (x : Agent)
    (hx : x ∈ members founders t) :
    x ∈ (fission founders t S).parent ∨ x ∈ (fission founders t S).child := by
  let tp : Told := { t with withdrawn := t.withdrawn ++ S }
  have key : ∀ y, IsMember founders t y → IsMember founders tp y ∨ IsMember S t y := by
    intro y hy
    induction hy with
    | @founder b hf hw =>
      by_cases hs : has S b = true
      · exact Or.inr (IsMember.founder (has_iff.mp hs) hw)
      · refine Or.inl (IsMember.founder hf ?_)
        intro h'
        match Calm.mem_append_cases h' with
        | Or.inl h'' => exact hw h''
        | Or.inr h'' => exact hs (has_iff.mpr h'')
    | @recognized a b _ hab hw ih =>
      by_cases hs : has S b = true
      · exact Or.inr (IsMember.founder (has_iff.mp hs) hw)
      · match ih with
        | Or.inl ha =>
          refine Or.inl (IsMember.recognized ha hab ?_)
          intro h'
          match Calm.mem_append_cases h' with
          | Or.inl h'' => exact hw h''
          | Or.inr h'' => exact hs (has_iff.mpr h'')
        | Or.inr ha => exact Or.inr (IsMember.recognized ha hab hw)
  match key x ((members_iff founders t x).mp hx) with
  | Or.inl hp => exact Or.inl ((members_iff founders tp x).mpr hp)
  | Or.inr hc =>
    cases hpar : has (members founders tp) x with
    | true => exact Or.inl (has_iff.mp hpar)
    | false =>
      refine Or.inr (Calm.mem_filter_of ((members_iff S t x).mpr hc) ?_)
      show (!has (members founders tp) x) = true
      rw [hpar]; rfl

/-- **Nobody is in both**, and those who withdrew are not in the parent. -/
theorem fission_disjoint (founders : List Agent) (t : Told) (S : List Agent) (x : Agent) :
    (x ∈ (fission founders t S).parent → x ∉ (fission founders t S).child) ∧
    (x ∈ S → x ∉ (fission founders t S).parent) := by
  constructor
  · intro hp hc
    have hf := (Calm.mem_of_mem_filter hc).2
    have hh : has (fission founders t S).parent x = true := has_iff.mpr hp
    change (!has (fission founders t S).parent x) = true at hf
    rw [hh] at hf
    exact nomatch hf
  · intro hs hp
    have hm := (members_iff founders _ x).mp hp
    exact not_withdrawn_of_member hm (Calm.mem_append_of_right _ hs)

/-- **A fission, read.** A band of five, recognized along `1 → 2 → 3` and `3 → 4 → 5`, where `{3}`
leaves: `1, 2` stay, `3, 4, 5` go, and the two bands camp together. -/
theorem fission_example :
    fission [1] { recognitions := [(1, 2), (2, 3), (3, 4), (4, 5)] } [3] =
      { parent := [1, 2], child := [3, 4, 5], campsWith := true } := by
  decide

/-! ## Confederacy: glued, or the obstruction named -/

/-- The overlaps that conflict: pairs of bands where one told for and the other against. A band
holding `⊤` conflicts with itself, so it settles before the confederacy can. -/
def conflictsOf (rs : List (Agent × Reading)) : List (Agent × Agent) :=
  rs.foldr (fun p acc => (rs.filter (fun q => p.2.pos && q.2.neg)).map (fun q => (p.1, q.1)) ++ acc) []

/-- A confederacy's settlement on one question. -/
inductive Confederacy where
  /-- The bands' settlements glue: the confederacy's reading is their knowledge-join. -/
  | glued (r : Reading)
  /-- They do not: the conflicting pairs are named. -/
  | obstructed (pairs : List (Agent × Agent))
  deriving DecidableEq, Repr

/-- **Confederate** bands' settlements on one question, by parallel composition. Withdrawal is not
joining: a band that withdrew from the question is simply not among `rs`. -/
def confederate (rs : List (Agent × Reading)) : Confederacy :=
  match conflictsOf rs with
  | [] => .glued (Reading.joinList (rs.map (·.2)))
  | c :: cs => .obstructed (c :: cs)

theorem mem_conflictsOf_aux (rs : List (Agent × Reading)) : ∀ (outer : List (Agent × Reading)) (x : Agent × Agent),
    x ∈ outer.foldr (fun p acc => (rs.filter (fun q => p.2.pos && q.2.neg)).map (fun q => (p.1, q.1)) ++ acc) [] ↔
      ∃ p q, p ∈ outer ∧ q ∈ rs ∧ (p.2.pos && q.2.neg) = true ∧ x = (p.1, q.1)
  | [], x => ⟨fun h => (nomatch h), fun h => (match h with | ⟨_, _, h', _⟩ => nomatch h')⟩
  | p :: ps, x => by
    have ih := mem_conflictsOf_aux rs ps x
    constructor
    · intro h
      match Calm.mem_append_cases h with
      | Or.inl h' =>
        have ⟨q, hq, e⟩ := (Calm.mem_map_iff _ _ x).mp h'
        have hf := Calm.mem_of_mem_filter hq
        exact ⟨p, q, List.Mem.head _, hf.1, hf.2, e.symm⟩
      | Or.inr h' =>
        have ⟨p', q, hp', hq, hc, e⟩ := ih.mp h'
        exact ⟨p', q, List.Mem.tail _ hp', hq, hc, e⟩
    · intro ⟨p', q, hp', hq, hc, e⟩
      match Calm.mem_cons_cases hp' with
      | Or.inl ep =>
        subst ep
        exact Calm.mem_append_of_left _ ((Calm.mem_map_iff _ _ x).mpr ⟨q, Calm.mem_filter_of hq hc, e.symm⟩)
      | Or.inr hp'' => exact Calm.mem_append_of_right _ (ih.mpr ⟨p', q, hp'', hq, hc, e⟩)

/-- **A confederacy glues exactly when its merged reading holds no contradiction**: no band
told for while another told against. The glued reading is then the knowledge-join. -/
theorem confederate_glued_iff (rs : List (Agent × Reading)) :
    (∃ r, confederate rs = .glued r) ↔
      ((Reading.joinList (rs.map (·.2))).pos && (Reading.joinList (rs.map (·.2))).neg) = false := by
  rw [pos_joinList, neg_joinList]
  constructor
  · intro ⟨r, hr⟩
    cases hb : ((rs.map (·.2)).any (·.pos) && (rs.map (·.2)).any (·.neg)) with
    | false => rfl
    | true =>
      have hp : (rs.map (·.2)).any (·.pos) = true := by
        cases h : (rs.map (·.2)).any (·.pos) with
        | true => rfl
        | false => rw [h] at hb; exact nomatch hb
      have hn : (rs.map (·.2)).any (·.neg) = true := by
        cases h : (rs.map (·.2)).any (·.neg) with
        | true => rfl
        | false => rw [h, Bool.and_false] at hb; exact nomatch hb
      have ⟨a, ha, hpa⟩ := Calm.exists_of_any hp
      have ⟨b, hb', hnb⟩ := Calm.exists_of_any hn
      have ⟨p, hp', ep⟩ := (Calm.mem_map_iff _ _ a).mp ha
      have ⟨q, hq', eq⟩ := (Calm.mem_map_iff _ _ b).mp hb'
      have hmem : (p.1, q.1) ∈ conflictsOf rs :=
        (mem_conflictsOf_aux rs rs _).mpr ⟨p, q, hp', hq', by rw [ep, eq, hpa, hnb]; rfl, rfl⟩
      unfold confederate at hr
      cases hc : conflictsOf rs with
      | nil => rw [hc] at hmem; exact nomatch hmem
      | cons c cs => rw [hc] at hr; exact nomatch hr
  · intro hf
    have hnil : conflictsOf rs = [] := by
      cases hc : conflictsOf rs with
      | nil => rfl
      | cons c cs =>
        have hcm : c ∈ conflictsOf rs := by rw [hc]; exact List.Mem.head _
        have ⟨p, q, hp, hq, hpq, _⟩ := (mem_conflictsOf_aux rs rs c).mp hcm
        have hpos : (rs.map (·.2)).any (·.pos) = true :=
          Calm.any_of_mem ((Calm.mem_map_iff _ _ p.2).mpr ⟨p, hp, rfl⟩) (by
            cases h : p.2.pos with
            | true => rfl
            | false => rw [h] at hpq; exact nomatch hpq)
        have hneg : (rs.map (·.2)).any (·.neg) = true :=
          Calm.any_of_mem ((Calm.mem_map_iff _ _ q.2).mpr ⟨q, hq, rfl⟩) (by
            cases h : q.2.neg with
            | true => rfl
            | false => rw [h, Bool.and_false] at hpq; exact nomatch hpq)
        rw [hpos, hneg] at hf
        exact nomatch hf
    refine ⟨Reading.joinList (rs.map (·.2)), ?_⟩
    unfold confederate
    rw [hnil]

/-! ## The scale law -/

/-- Unordered pairs of a list's positions: who a council over these bands must reconcile. -/
def pairs {α : Type} : List α → List (α × α)
  | [] => []
  | x :: xs => xs.map (fun y => (x, y)) ++ pairs xs

theorem pair_count_step (n : Nat) : 2 * n + n * (n - 1) = (n + 1) * n := by
  cases n with
  | zero => rfl
  | succ m =>
    show 2 * (m + 1) + (m + 1) * m = (m + 1 + 1) * (m + 1)
    rw [Nat.two_mul, Nat.add_one_mul (m + 1) (m + 1), Nat.mul_add_one (m + 1) m,
      Nat.add_assoc ((m + 1) * m) (m + 1) (m + 1), Nat.add_comm ((m + 1) * m) ((m + 1) + (m + 1))]

/-- `n` items have `n(n−1)/2` pairs. -/
theorem two_mul_length_pairs {α : Type} : ∀ (l : List α), 2 * (pairs l).length = l.length * (l.length - 1)
  | [] => rfl
  | x :: xs => by
    show 2 * (xs.map (fun y => (x, y)) ++ pairs xs).length = (xs.length + 1) * (xs.length + 1 - 1)
    rw [length_append', length_map', Nat.mul_add, two_mul_length_pairs xs]
    exact pair_count_step xs.length

theorem length_filter_le' {α : Type} (q : α → Bool) : ∀ (l : List α), (l.filter q).length ≤ l.length
  | [] => Nat.le_refl _
  | a :: as => by
    unfold List.filter
    cases q a with
    | true => exact Nat.succ_le_succ (length_filter_le' q as)
    | false => exact Nat.le_succ_of_le (length_filter_le' q as)

/-- What a council over child bands pays to coordinate: the pairs of children that conflict. -/
def councilCost (rs : List (Agent × Reading)) : Nat :=
  ((pairs rs).filter fun pq => (pq.1.2.pos && pq.2.2.neg) || (pq.1.2.neg && pq.2.2.pos)).length

/-- **A council's cost is bounded by its fan-out.** A council over `k` child bands reconciles at
most `k(k−1)/2` conflicts, however many agents the bands hold. -/
theorem council_cost_bounded (rs : List (Agent × Reading)) :
    2 * councilCost rs ≤ rs.length * (rs.length - 1) := by
  unfold councilCost
  rw [← two_mul_length_pairs rs]
  exact Nat.mul_le_mul_left 2 (length_filter_le' _ _)

/-- How many agents councils of fan-out `k`, `d` levels deep, over bands of at most `s`, hold. -/
def capacity (s k : Nat) : Nat → Nat
  | 0 => s
  | d + 1 => k * capacity s k d

/-- **The council tree reaches any fleet.** With bands of at least one agent and councils of fan-out
at least two, `d` levels hold at least `d` agents beyond the first band, and the capacity at least
doubles per level. So a fleet of `N` agents needs about `log_k (N / s)` levels, each of bounded
cost. -/
theorem capacity_doubles (s k d : Nat) (hk : 2 ≤ k) : 2 * capacity s k d ≤ capacity s k (d + 1) :=
  Nat.mul_le_mul_right _ hk

theorem council_tree_reaches (s k : Nat) (hs : 1 ≤ s) (hk : 2 ≤ k) : ∀ d, d + 1 ≤ capacity s k d
  | 0 => hs
  | d + 1 => by
    have ih := council_tree_reaches s k hs hk d
    have h2 := capacity_doubles s k d hk
    -- d + 2 ≤ 2(d + 1) ≤ 2 · capacity ≤ capacity at d + 1
    have : d + 1 + 1 ≤ 2 * (d + 1) := by rw [Nat.two_mul]; exact Nat.add_le_add_left (Nat.succ_le_succ (Nat.zero_le d)) _
    exact Nat.le_trans this (Nat.le_trans (Nat.mul_le_mul_left 2 ih) h2)

end ObsmetrologiaComputing.Band
