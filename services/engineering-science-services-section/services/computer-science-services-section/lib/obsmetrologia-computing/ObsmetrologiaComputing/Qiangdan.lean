import ObsmetrologiaComputing.Calm

/-!
# Qiangdan — which bid wins an order

*Qiangdan* (抢单, "grabbing the order") is how a micro-enterprise takes up an aim: it bids by
wagering targets on the aim's measures, and the order goes to the best bid. This module states
which bid is best, as a law over the bids' targets.

Each measure of an aim has a direction: a reading meets a target at or above it (`more`), or at
or below it (`less`). A bid commits a target on some of the measures; a measure it leaves
uncommitted is worse than any target. One bid **dominates** another when it is at least as good
on every measure and strictly better on one (Pareto dominance). The **winners** are the earliest
undominated bids.

## Main definitions

* `Direction`, `Bid`, `atLeast`, `dominates`.
* `undominated`, `winners`.

## Main results

* `dominates_irrefl`, `dominates_trans`: dominance is a strict partial order.
* `undominated_nonempty`, `winners_nonempty`: a nonempty field of bids has a winner.
* `winners_congr`: the winners depend only on which bids were made, never on the order they
  arrived in.
* `winners_of_incomparable`: when no bid dominates another, the winners are the earliest bids.
  This is the first-qualified-commitment rule, which the comparator extends.
* `winners_not_monotone`: a later, better bid unseats the winner, so the choice is not
  coordination-free. It reads a sealed past (`Calm`), like every other coordinated move.

Every theorem uses no axioms.
-/

namespace ObsmetrologiaComputing.Qiangdan

open ObsmetrologiaComputing.Calm (has has_of_mem mem_of_has any_of_mem exists_of_any
  mem_filter_of mem_of_mem_filter filter_eq_self)

/-- Which way a measure is better. -/
inductive Direction where
  | more | less
  deriving DecidableEq, Repr

/-- A bid: its bidder, when it was made, and its targets as (measure, target) pairs. -/
structure Bid where
  player : Nat
  time : Nat
  targets : List (Nat × Nat)
  deriving DecidableEq, Repr

/-- The target a bid commits on a measure: its first entry for it, if any. -/
def targetOf : List (Nat × Nat) → Nat → Option Nat
  | [], _ => none
  | (μ, t) :: rest, ν => if μ == ν then some t else targetOf rest ν

/-- Whether target `x` is at least as good as target `y` in direction `d`. No commitment is
worse than every target. -/
def atLeast : Direction → Option Nat → Option Nat → Bool
  | _, _, none => true
  | _, none, some _ => false
  | .more, some a, some b => decide (b ≤ a)
  | .less, some a, some b => decide (a ≤ b)

theorem atLeast_refl : ∀ (d : Direction) (x : Option Nat), atLeast d x x = true
  | _, none => rfl
  | .more, some a => decide_eq_true (Nat.le_refl a)
  | .less, some a => decide_eq_true (Nat.le_refl a)

theorem atLeast_trans : ∀ (d : Direction) (x y z : Option Nat),
    atLeast d x y = true → atLeast d y z = true → atLeast d x z = true
  | _, _, _, none, _, _ => rfl
  | _, _, none, some _, _, h => nomatch h
  | _, none, some _, some _, h, _ => nomatch h
  | .more, some a, some b, some c, h1, h2 =>
    decide_eq_true (Nat.le_trans (of_decide_eq_true h2) (of_decide_eq_true h1))
  | .less, some a, some b, some c, h1, h2 =>
    decide_eq_true (Nat.le_trans (of_decide_eq_true h1) (of_decide_eq_true h2))

/-- At least as good on every measure of the aim. -/
def covers (ms : List (Nat × Direction)) (x y : Bid) : Bool :=
  ms.all fun m => atLeast m.2 (targetOf x.targets m.1) (targetOf y.targets m.1)

/-- Strictly better on some measure: `y` is not at least as good as `x` there. -/
def exceeds (ms : List (Nat × Direction)) (x y : Bid) : Bool :=
  ms.any fun m => !atLeast m.2 (targetOf y.targets m.1) (targetOf x.targets m.1)

/-- **Dominance**: at least as good on every measure and strictly better on one. -/
def dominates (ms : List (Nat × Direction)) (x y : Bid) : Bool :=
  covers ms x y && exceeds ms x y

/-! ## Dominance is a strict partial order -/

theorem all_of_mem {α : Type} {p : α → Bool} : ∀ {l : List α}, l.all p = true → ∀ x, x ∈ l → p x = true
  | [], _, _, h => nomatch h
  | a :: l, h, x, hx => by
    have h' : (p a && l.all p) = true := h
    cases hp : p a with
    | false => rw [hp] at h'; exact nomatch h'
    | true =>
      rw [hp] at h'
      cases hx with
      | head => exact hp
      | tail _ hx => exact all_of_mem h' x hx

theorem all_of_forall {α : Type} {p : α → Bool} : ∀ {l : List α}, (∀ x, x ∈ l → p x = true) → l.all p = true
  | [], _ => rfl
  | a :: l, h => by
    show (p a && l.all p) = true
    rw [h a (List.Mem.head l), all_of_forall (fun x hx => h x (List.Mem.tail a hx))]
    rfl

theorem covers_refl (ms : List (Nat × Direction)) (x : Bid) : covers ms x x = true :=
  all_of_forall fun m _ => atLeast_refl m.2 _

theorem covers_trans (ms : List (Nat × Direction)) (x y z : Bid)
    (h1 : covers ms x y = true) (h2 : covers ms y z = true) : covers ms x z = true :=
  all_of_forall fun m hm =>
    atLeast_trans m.2 _ _ _ (all_of_mem h1 m hm) (all_of_mem h2 m hm)

theorem not_exceeds_self (ms : List (Nat × Direction)) (x : Bid) : exceeds ms x x = false := by
  cases h : exceeds ms x x with
  | false => rfl
  | true =>
    have ⟨m, _, hm⟩ := exists_of_any h
    rw [atLeast_refl] at hm
    exact nomatch hm

theorem dominates_irrefl (ms : List (Nat × Direction)) (x : Bid) : dominates ms x x = false := by
  show (covers ms x x && exceeds ms x x) = false
  rw [not_exceeds_self]; exact Bool.and_false _

theorem covers_of_dominates {ms : List (Nat × Direction)} {x y : Bid} (h : dominates ms x y = true) :
    covers ms x y = true := by
  cases hc : covers ms x y with
  | true => rfl
  | false =>
    have h' : (covers ms x y && exceeds ms x y) = true := h
    rw [hc] at h'; exact nomatch h'

theorem exceeds_of_dominates {ms : List (Nat × Direction)} {x y : Bid} (h : dominates ms x y = true) :
    exceeds ms x y = true := by
  cases he : exceeds ms x y with
  | true => rfl
  | false =>
    have h' : (covers ms x y && exceeds ms x y) = true := h
    rw [he, Bool.and_false] at h'; exact nomatch h'

theorem dominates_of {ms : List (Nat × Direction)} {x y : Bid}
    (hc : covers ms x y = true) (he : exceeds ms x y = true) : dominates ms x y = true := by
  show (covers ms x y && exceeds ms x y) = true
  rw [hc, he]; rfl

theorem dominates_trans (ms : List (Nat × Direction)) (x y z : Bid)
    (h1 : dominates ms x y = true) (h2 : dominates ms y z = true) : dominates ms x z = true := by
  have c1 := covers_of_dominates h1
  have c2 := covers_of_dominates h2
  refine dominates_of (covers_trans ms x y z c1 c2) ?_
  have ⟨m, hm, hy⟩ := exists_of_any (exceeds_of_dominates h1)
  refine any_of_mem hm ?_
  cases hzx : atLeast m.2 (targetOf z.targets m.1) (targetOf x.targets m.1) with
  | false => rfl
  | true =>
    have hyz := all_of_mem c2 m hm
    have : atLeast m.2 (targetOf y.targets m.1) (targetOf x.targets m.1) = true :=
      atLeast_trans m.2 _ _ _ hyz hzx
    rw [this] at hy; exact nomatch hy

/-! ## The winners -/

/-- The bids no bid of the field dominates. -/
def undominated (ms : List (Nat × Direction)) (l : List Bid) : List Bid :=
  l.filter fun x => !l.any fun y => dominates ms y x

/-- **The winners**: the earliest undominated bids. -/
def winners (ms : List (Nat × Direction)) (l : List Bid) : List Bid :=
  let u := undominated ms l
  u.filter fun x => u.all fun y => decide (x.time ≤ y.time)

/-- Climb the field: replace the current bid by any bid that dominates it. -/
def climb (ms : List (Nat × Direction)) : Bid → List Bid → Bid
  | c, [] => c
  | c, y :: ys => climb ms (if dominates ms y c then y else c) ys

/-- The bid reached by climbing is the start or dominates it, is the start or a field bid, and
no bid of the field dominates it. -/
theorem climb_spec (ms : List (Nat × Direction)) : ∀ (l : List Bid) (c : Bid),
    (climb ms c l = c ∨ dominates ms (climb ms c l) c = true)
    ∧ (climb ms c l = c ∨ climb ms c l ∈ l)
    ∧ ∀ y, y ∈ l → dominates ms y (climb ms c l) = false
  | [], c => ⟨Or.inl rfl, Or.inl rfl, fun _ h => nomatch h⟩
  | y :: ys, c => by
    have ⟨ih1, ih2, ih3⟩ := climb_spec ms ys (if dominates ms y c then y else c)
    show (climb ms (if dominates ms y c then y else c) ys = c ∨ _) ∧ _ ∧ _
    generalize hr : climb ms (if dominates ms y c then y else c) ys = r at ih1 ih2 ih3 ⊢
    cases hd : dominates ms y c with
    | true =>
      rw [if_pos rfl] at ih1 ih2 ih3
      refine ⟨Or.inr ?_, ?_, ?_⟩
      · cases ih1 with
        | inl h => rw [h]; exact hd
        | inr h => exact dominates_trans ms r y c h hd
      · cases ih2 with
        | inl h => exact Or.inr (h ▸ List.Mem.head ys)
        | inr h => exact Or.inr (List.Mem.tail y h)
      · intro z hz
        cases hz with
        | head =>
          cases hzr : dominates ms y r with
          | false => rfl
          | true =>
            cases ih1 with
            | inl h => rw [h, dominates_irrefl] at hzr; exact nomatch hzr
            | inr h =>
              have := dominates_trans ms y r y hzr h
              rw [dominates_irrefl] at this; exact nomatch this
        | tail _ hz => exact ih3 z hz
    | false =>
      rw [if_neg (fun h => nomatch h)] at ih1 ih2 ih3
      refine ⟨ih1, ?_, ?_⟩
      · cases ih2 with
        | inl h => exact Or.inl h
        | inr h => exact Or.inr (List.Mem.tail y h)
      · intro z hz
        cases hz with
        | head =>
          cases hzr : dominates ms y r with
          | false => rfl
          | true =>
            cases ih1 with
            | inl h => rw [h, hd] at hzr; exact nomatch hzr
            | inr h =>
              have := dominates_trans ms y r c hzr h
              rw [hd] at this; exact nomatch this
        | tail _ hz => exact ih3 z hz

theorem mem_undominated {ms : List (Nat × Direction)} {l : List Bid} {x : Bid} (hx : x ∈ l)
    (h : ∀ y, y ∈ l → dominates ms y x = false) : x ∈ undominated ms l := by
  refine mem_filter_of hx ?_
  cases ha : l.any (fun y => dominates ms y x) with
  | false => rfl
  | true =>
    have ⟨y, hy, hd⟩ := exists_of_any ha
    rw [h y hy] at hd; exact nomatch hd

/-- **A nonempty field has an undominated bid**, reached by climbing from any bid. -/
theorem undominated_nonempty (ms : List (Nat × Direction)) (x : Bid) (l : List Bid) :
    ∃ w, w ∈ undominated ms (x :: l) := by
  have ⟨h1, h2, h3⟩ := climb_spec ms l x
  refine ⟨climb ms x l, mem_undominated ?_ ?_⟩
  · cases h2 with
    | inl h => rw [h]; exact List.Mem.head l
    | inr h => exact List.Mem.tail x h
  · intro y hy
    cases hy with
    | head =>
      cases hd : dominates ms x (climb ms x l) with
      | false => rfl
      | true =>
        cases h1 with
        | inl h => rw [h, dominates_irrefl] at hd; exact nomatch hd
        | inr h =>
          have := dominates_trans ms x _ x hd h
          rw [dominates_irrefl] at this; exact nomatch this
    | tail _ hy => exact h3 y hy

/-- The earliest of a nonempty list of bids. -/
def earliest : Bid → List Bid → Bid
  | c, [] => c
  | c, y :: ys => earliest (if y.time < c.time then y else c) ys

theorem earliest_spec : ∀ (l : List Bid) (c : Bid),
    (earliest c l = c ∨ earliest c l ∈ l) ∧ (earliest c l).time ≤ c.time
    ∧ ∀ y, y ∈ l → (earliest c l).time ≤ y.time
  | [], c => ⟨Or.inl rfl, Nat.le_refl _, fun _ h => nomatch h⟩
  | y :: ys, c => by
    have ⟨ih1, ih2, ih3⟩ := earliest_spec ys (if y.time < c.time then y else c)
    show (earliest (if y.time < c.time then y else c) ys = c ∨ _) ∧ _ ∧ _
    generalize earliest (if y.time < c.time then y else c) ys = r at ih1 ih2 ih3 ⊢
    by_cases hlt : y.time < c.time
    · rw [if_pos hlt] at ih1 ih2 ih3
      refine ⟨?_, Nat.le_trans ih2 (Nat.le_of_lt hlt), ?_⟩
      · cases ih1 with
        | inl h => exact Or.inr (h ▸ List.Mem.head ys)
        | inr h => exact Or.inr (List.Mem.tail y h)
      · intro z hz
        cases hz with
        | head => exact ih2
        | tail _ hz => exact ih3 z hz
    · rw [if_neg hlt] at ih1 ih2 ih3
      refine ⟨?_, ih2, ?_⟩
      · cases ih1 with
        | inl h => exact Or.inl h
        | inr h => exact Or.inr (List.Mem.tail y h)
      · intro z hz
        cases hz with
        | head => exact Nat.le_trans ih2 (Nat.ge_of_not_lt hlt)
        | tail _ hz => exact ih3 z hz

/-- **A nonempty field has a winner.** -/
theorem winners_nonempty (ms : List (Nat × Direction)) (x : Bid) (l : List Bid) :
    ∃ w, w ∈ winners ms (x :: l) := by
  have ⟨u0, hu0⟩ := undominated_nonempty ms x l
  generalize hu : undominated ms (x :: l) = u at hu0
  match u, hu0 with
  | a :: as, _ =>
    have ⟨h1, h2, h3⟩ := earliest_spec as a
    refine ⟨earliest a as, ?_⟩
    show earliest a as ∈ (undominated ms (x :: l)).filter _
    rw [hu]
    refine mem_filter_of ?_ (all_of_forall fun y hy => decide_eq_true ?_)
    · cases h1 with
      | inl h => rw [h]; exact List.Mem.head as
      | inr h => exact List.Mem.tail a h
    · cases hy with
      | head => exact h2
      | tail _ hy => exact h3 y hy

/-! ## The winners depend only on the bids made -/

theorem any_eq_of_mem_iff {α : Type} {l l' : List α} (h : ∀ x, x ∈ l ↔ x ∈ l') (p : α → Bool) :
    l.any p = l'.any p := by
  cases h1 : l.any p with
  | true =>
    have ⟨x, hx, hp⟩ := exists_of_any h1
    exact (any_of_mem ((h x).mp hx) hp).symm
  | false =>
    cases h2 : l'.any p with
    | false => rfl
    | true =>
      have ⟨x, hx, hp⟩ := exists_of_any h2
      rw [any_of_mem ((h x).mpr hx) hp] at h1; exact nomatch h1

theorem all_eq_of_mem_iff {α : Type} {l l' : List α} (h : ∀ x, x ∈ l ↔ x ∈ l') (p : α → Bool) :
    l.all p = l'.all p := by
  cases h1 : l.all p with
  | true => exact (all_of_forall fun x hx => all_of_mem h1 x ((h x).mpr hx)).symm
  | false =>
    cases h2 : l'.all p with
    | false => rfl
    | true =>
      rw [all_of_forall fun x hx => all_of_mem h2 x ((h x).mp hx)] at h1; exact nomatch h1

theorem mem_filter_iff_of {α : Type} {l l' : List α} {p q : α → Bool} (h : ∀ x, x ∈ l ↔ x ∈ l')
    (hpq : ∀ x, p x = q x) (x : α) : x ∈ l.filter p ↔ x ∈ l'.filter q :=
  ⟨fun hx => have ⟨m, hp⟩ := mem_of_mem_filter hx; mem_filter_of ((h x).mp m) (hpq x ▸ hp),
   fun hx => have ⟨m, hq⟩ := mem_of_mem_filter hx; mem_filter_of ((h x).mpr m) ((hpq x).symm ▸ hq)⟩

theorem mem_undominated_iff_of {ms : List (Nat × Direction)} {l l' : List Bid}
    (h : ∀ x, x ∈ l ↔ x ∈ l') (x : Bid) : x ∈ undominated ms l ↔ x ∈ undominated ms l' :=
  mem_filter_iff_of h (fun y => by rw [any_eq_of_mem_iff h]) x

/-- **The winners depend only on the bids made.** Two fields with the same bids, in any order
and with any repetition, have the same winners. -/
theorem winners_congr (ms : List (Nat × Direction)) {l l' : List Bid}
    (h : ∀ x, x ∈ l ↔ x ∈ l') (x : Bid) : x ∈ winners ms l ↔ x ∈ winners ms l' :=
  mem_filter_iff_of (mem_undominated_iff_of h)
    (fun y => all_eq_of_mem_iff (mem_undominated_iff_of h) _) x

/-! ## The first-qualified-commitment rule, extended -/

/-- **When no bid dominates another, the winners are the earliest bids.** The comparator agrees
with taking the first qualified commitment wherever targets do not separate the bids. -/
theorem winners_of_incomparable (ms : List (Nat × Direction)) (l : List Bid)
    (h : ∀ x y, x ∈ l → y ∈ l → dominates ms y x = false) :
    winners ms l = l.filter fun x => l.all fun y => decide (x.time ≤ y.time) := by
  have hu : undominated ms l = l :=
    filter_eq_self _ l fun x hx => by
      cases ha : l.any (fun y => dominates ms y x) with
      | false => rfl
      | true =>
        have ⟨y, hy, hd⟩ := exists_of_any ha
        rw [h x y hx hy] at hd; exact nomatch hd
  show (undominated ms l).filter _ = _
  rw [hu]

/-! ## Choosing the winner is coordinated -/

/-- One measure, more is better. -/
def oneMore : List (Nat × Direction) := [(1, .more)]

/-- **The choice is not monotone.** Bidder `2` wins alone with target `5`; bidder `3`'s bid of
`7`, made later, takes the order from it. A replica that chose before the later bid arrived
chose wrongly, so qiangdan reads a sealed past. -/
theorem winners_not_monotone :
    winners oneMore [⟨2, 1, [(1, 5)]⟩] = [⟨2, 1, [(1, 5)]⟩]
    ∧ winners oneMore [⟨2, 1, [(1, 5)]⟩, ⟨3, 2, [(1, 7)]⟩] = [⟨3, 2, [(1, 7)]⟩] := by
  decide

end ObsmetrologiaComputing.Qiangdan
