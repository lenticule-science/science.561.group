/-!
# Calm — when a replica may act on the moves it has received

A replicated game is read by replaying its moves. Each move carries a time. A reader that
sorts every move it holds by time and replays them reads the same board whatever order the
moves reached it in, but sorting is itself coordination: the reader acts on a move only once
it holds every move timestamped before it. This module states which moves need that seal
and which do not.

A game splits its moves in two. A **told** move only adds to a grow-only record and is never
refused for what was or was not played before. A **coordinated** move changes a state by a
rule that reads the state and the told moves strictly before it, and may refuse.

## Main definitions

* `Game` — a state, a time on moves, the told/coordinated split, and the rule of a
  coordinated move. The rule reads the told record only through an oracle `any p` ("is any
  told move before me `p`?"), so it can read the record only as a set.
* `apply`, `play` — the reader that applies moves in the order they arrive: a told move is
  recorded, a coordinated move is ruled on against the told moves before it.
* `sortBy` — insertion sort by a natural key, the sealed order.
* `SetQuery`, `Monotone`, `CoordinationFree` — a query over a set of inputs, its
  monotonicity, and the existence of a reader that answers it on arrival without ever
  retracting an answer.

## Main results

* `sealed_arrival_eq_replay` — **sealing suffices.** If every coordinated move arrives after
  every move timestamped before it, and the coordinated moves arrive in time order, the
  reader that applies moves on arrival reaches the board of the sealed replay: the same
  state, the same refusals and the same told record. Told moves may arrive anywhere: they
  never wait.
* `coordinationFree_iff_monotone` — the oblivious form of the CALM theorem (Hellerstein
  2010; Ameloot, Neven and Van den Bussche 2013): a query read as a set has a reader that
  answers on arrival and never retracts exactly when it is monotone. Its content is in the
  definition: a reader that cannot tell a finished input from a paused one must answer each
  prefix as if it were complete. So a reading that a later input can retract, such as a
  standing or a verdict, has no coordination-free reader, and whatever acts on it needs the
  seal.
* `sortBy_mem`, `sortBy_pairwise_lt` — sorting keeps the moves and, when their times are
  distinct, orders them strictly.

Every proof here is structural; nothing uses `propext` or `Classical.choice`.

## References

J. M. Hellerstein, "The declarative imperative", SIGMOD Record 39(1), 2010.
T. J. Ameloot, F. Neven and J. Van den Bussche, "Relational transducers for declarative
networking", J. ACM 60(2), 2013. P. Alvaro et al., "Dedalus: Datalog in time and space",
Datalog 2.0, 2011 (time as the stratification of negation).

## Tags

CALM, coordination-free, monotone, replicated state, sealing, distributed computing
-/

namespace ObsmetrologiaComputing.Calm

/-! ## Lists, structurally -/

section Lists

variable {α : Type}

theorem mem_append_of_left {x : α} {l : List α} (r : List α) (h : x ∈ l) : x ∈ l ++ r := by
  induction h with
  | head as => exact List.Mem.head _
  | tail b _ ih => exact List.Mem.tail b ih

theorem mem_append_of_right {x : α} (l : List α) {r : List α} (h : x ∈ r) : x ∈ l ++ r := by
  induction l with
  | nil => exact h
  | cons a as ih => exact List.Mem.tail a ih

theorem mem_append_cases {x : α} : ∀ {l r : List α}, x ∈ l ++ r → x ∈ l ∨ x ∈ r
  | [], _, h => Or.inr h
  | _ :: _, _, .head _ => Or.inl (List.Mem.head _)
  | _ :: _, _, .tail _ h =>
    match mem_append_cases h with
    | Or.inl h' => Or.inl (List.Mem.tail _ h')
    | Or.inr h' => Or.inr h'

theorem mem_cons_cases {x a : α} {l : List α} (h : x ∈ a :: l) : x = a ∨ x ∈ l :=
  match h with
  | .head _ => Or.inl rfl
  | .tail _ h' => Or.inr h'

theorem mem_singleton {x a : α} (h : x ∈ [a]) : x = a :=
  match h with
  | .head _ => rfl
  | .tail _ h' => nomatch h'

theorem mem_filter_of {p : α → Bool} {x : α} : ∀ {l : List α}, x ∈ l → p x = true → x ∈ l.filter p
  | a :: as, h, hp => by
    unfold List.filter
    match mem_cons_cases h with
    | Or.inl e =>
      subst e
      rw [hp]
      exact List.Mem.head _
    | Or.inr h' =>
      cases p a with
      | true => exact List.Mem.tail _ (mem_filter_of h' hp)
      | false => exact mem_filter_of h' hp

theorem mem_of_mem_filter {p : α → Bool} {x : α} : ∀ {l : List α}, x ∈ l.filter p → x ∈ l ∧ p x = true
  | a :: as, h => by
    unfold List.filter at h
    cases hpa : p a with
    | true =>
      rw [hpa] at h
      match mem_cons_cases h with
      | Or.inl e => subst e; exact ⟨List.Mem.head _, hpa⟩
      | Or.inr h' =>
        have r := mem_of_mem_filter h'
        exact ⟨List.Mem.tail _ r.1, r.2⟩
    | false =>
      rw [hpa] at h
      have r := mem_of_mem_filter h
      exact ⟨List.Mem.tail _ r.1, r.2⟩

theorem any_of_mem {p : α → Bool} {x : α} : ∀ {l : List α}, x ∈ l → p x = true → l.any p = true
  | a :: as, h, hp => by
    unfold List.any
    match mem_cons_cases h with
    | Or.inl e => subst e; rw [hp]; rfl
    | Or.inr h' =>
      cases p a with
      | true => rfl
      | false => exact any_of_mem h' hp

theorem exists_of_any {p : α → Bool} : ∀ {l : List α}, l.any p = true → ∃ x, x ∈ l ∧ p x = true
  | a :: as, h => by
    unfold List.any at h
    cases hpa : p a with
    | true => exact ⟨a, List.Mem.head _, hpa⟩
    | false =>
      rw [hpa] at h
      have ⟨x, hx, hpx⟩ := exists_of_any h
      exact ⟨x, List.Mem.tail _ hx, hpx⟩

/-- Two Booleans true together are equal. -/
theorem bool_eq_of_iff {a b : Bool} (h : a = true ↔ b = true) : a = b := by
  cases a <;> cases b
  · rfl
  · exact h.mpr rfl
  · exact (h.mp rfl).symm
  · rfl

/-- Lists with the same members agree on every `any`. -/
theorem any_congr {l l' : List α} (h : ∀ x, x ∈ l ↔ x ∈ l') (p : α → Bool) : l.any p = l'.any p :=
  bool_eq_of_iff ⟨fun e => let ⟨x, hx, hp⟩ := exists_of_any e; any_of_mem ((h x).mp hx) hp,
    fun e => let ⟨x, hx, hp⟩ := exists_of_any e; any_of_mem ((h x).mpr hx) hp⟩

theorem pairwise_of_append_right {R : α → α → Prop} : ∀ {p r : List α},
    (p ++ r).Pairwise R → r.Pairwise R
  | [], _, h => h
  | _ :: _, _, .cons _ h => pairwise_of_append_right h

end Lists

/-! ## Games read by replay -/

/-- A replicated game. Each move has a time; told moves are recorded; a coordinated move is
ruled on by `rule`, which reads the state and, through the oracle `any`, the told moves
before it. The rule's result is the next state, or `none` when it refuses the move. -/
structure Game where
  Move : Type
  State : Type
  init : State
  time : Move → Nat
  told : Move → Bool
  rule : State → ((Move → Bool) → Bool) → Move → Option State

/-- What a reader holds: the state, the told moves in arrival order, and the coordinated moves
it refused in arrival order. -/
structure Board (G : Game) where
  state : G.State
  told : List G.Move
  refused : List G.Move

variable (G : Game)

/-- The oracle over the told moves `t` strictly before time `n`. -/
def before (t : List G.Move) (n : Nat) : (G.Move → Bool) → Bool :=
  fun p => t.any (fun x => decide (G.time x < n) && p x)

/-- Apply one arriving move: record a told move; rule on a coordinated move against the told
moves strictly before it. -/
def apply (b : Board G) (m : G.Move) : Board G :=
  match G.told m with
  | true => { b with told := b.told ++ [m] }
  | false =>
    match G.rule b.state (before G b.told (G.time m)) m with
    | some s => { b with state := s }
    | none => { b with refused := b.refused ++ [m] }

/-- The empty board. -/
def empty : Board G := ⟨G.init, [], []⟩

/-- Apply moves in the order they arrive. -/
def play (l : List G.Move) : Board G := l.foldl (apply G) (empty G)

/-- The coordinated moves of a list, in order. -/
def coordinated (l : List G.Move) : List G.Move := l.filter (fun m => !G.told m)

/-- Rule on coordinated moves one after another, each against a fixed oracle `F m`. -/
def runCoord (F : G.Move → (G.Move → Bool) → Bool) : G.State × List G.Move → List G.Move →
    G.State × List G.Move
  | c, [] => c
  | (s, r), m :: ms =>
    match G.rule s (F m) m with
    | some s' => runCoord F (s', r) ms
    | none => runCoord F (s, r ++ [m]) ms

/-! ## The told record and the coordinated trace -/

/-- The told record holds exactly the told moves that arrived. -/
theorem mem_told_foldl : ∀ (l : List G.Move) (b : Board G) (x : G.Move),
    x ∈ (l.foldl (apply G) b).told ↔ x ∈ b.told ∨ (x ∈ l ∧ G.told x = true)
  | [], b, x => ⟨Or.inl, fun h => match h with | Or.inl h => h | Or.inr ⟨h, _⟩ => nomatch h⟩
  | m :: ms, b, x => by
    have ih := mem_told_foldl ms (apply G b m) x
    show x ∈ (ms.foldl (apply G) (apply G b m)).told ↔ _
    refine ⟨fun h => ?_, fun h => ?_⟩
    · match ih.mp h with
      | Or.inr ⟨hx, ht⟩ => exact Or.inr ⟨List.Mem.tail _ hx, ht⟩
      | Or.inl hb =>
        unfold apply at hb
        cases htm : G.told m with
        | true =>
          rw [htm] at hb
          match mem_append_cases hb with
          | Or.inl h' => exact Or.inl h'
          | Or.inr h' => have e := mem_singleton h'; subst e; exact Or.inr ⟨List.Mem.head _, htm⟩
        | false =>
          rw [htm] at hb
          cases hr : G.rule b.state (before G b.told (G.time m)) m with
          | some s => rw [hr] at hb; exact Or.inl hb
          | none => rw [hr] at hb; exact Or.inl hb
    · apply ih.mpr
      match h with
      | Or.inl hb =>
        refine Or.inl ?_
        unfold apply
        cases htm : G.told m with
        | true => exact mem_append_of_left _ hb
        | false =>
          cases hr : G.rule b.state (before G b.told (G.time m)) m with
          | some s => exact hb
          | none => exact hb
      | Or.inr ⟨hx, ht⟩ =>
        match mem_cons_cases hx with
        | Or.inl e =>
          subst e
          refine Or.inl ?_
          unfold apply
          rw [ht]
          exact mem_append_of_right _ (List.Mem.head _)
        | Or.inr hx' => exact Or.inr ⟨hx', ht⟩

/-- The state and refusals of a replay are the coordinated trace, provided each coordinated move
sees through `F` exactly what it sees of the told record at its arrival. -/
theorem foldl_eq_runCoord (F : G.Move → (G.Move → Bool) → Bool) :
    ∀ (l : List G.Move) (b : Board G),
    (∀ p m q, l = p ++ m :: q → G.told m = false →
      ∀ pr, before G (p.foldl (apply G) b).told (G.time m) pr = F m pr) →
    (l.foldl (apply G) b).state = (runCoord G F (b.state, b.refused) (coordinated G l)).1 ∧
    (l.foldl (apply G) b).refused = (runCoord G F (b.state, b.refused) (coordinated G l)).2
  | [], b, _ => ⟨rfl, rfl⟩
  | m :: ms, b, H => by
    have H' : ∀ p m' q, ms = p ++ m' :: q → G.told m' = false →
        ∀ pr, before G (p.foldl (apply G) (apply G b m)).told (G.time m') pr = F m' pr :=
      fun p m' q e ht pr => H (m :: p) m' q (by rw [e]; rfl) ht pr
    have ih := foldl_eq_runCoord F ms (apply G b m) H'
    show (ms.foldl (apply G) (apply G b m)).state = _ ∧ (ms.foldl (apply G) (apply G b m)).refused = _
    unfold coordinated
    unfold List.filter
    cases htm : G.told m with
    | true =>
      have hb : apply G b m = { b with told := b.told ++ [m] } := by unfold apply; rw [htm]
      rw [hb]
      rw [hb] at ih
      exact ih
    | false =>
      have hF : before G b.told (G.time m) = F m := funext (H [] m ms rfl htm)
      show _ = (runCoord G F (b.state, b.refused) (m :: coordinated G ms)).1 ∧
        _ = (runCoord G F (b.state, b.refused) (m :: coordinated G ms)).2
      unfold runCoord
      cases hr : G.rule b.state (F m) m with
      | some s =>
        have hb : apply G b m = { b with state := s } := by unfold apply; rw [htm, hF, hr]
        rw [hb]
        rw [hb] at ih
        exact ih
      | none =>
        have hb : apply G b m = { b with refused := b.refused ++ [m] } := by unfold apply; rw [htm, hF, hr]
        rw [hb]
        rw [hb] at ih
        exact ih

/-! ## Refusals -/

/-- Refusals only grow. -/
theorem refused_grows : ∀ (l : List G.Move) (b : Board G) (x : G.Move),
    x ∈ b.refused → x ∈ (l.foldl (apply G) b).refused
  | [], _, _, h => h
  | m :: ms, b, x, h => by
    show x ∈ (ms.foldl (apply G) (apply G b m)).refused
    apply refused_grows ms
    unfold apply
    cases G.told m with
    | true => exact h
    | false =>
      cases G.rule b.state (before G b.told (G.time m)) m with
      | some s => exact h
      | none => exact mem_append_of_left _ h

/-- Only a coordinated move the rule refused at its arrival is refused. -/
theorem mem_refused_foldl : ∀ (l : List G.Move) (b : Board G) (x : G.Move),
    x ∈ (l.foldl (apply G) b).refused →
      x ∈ b.refused ∨ (x ∈ l ∧ G.told x = false ∧ ∃ s A, G.rule s A x = none)
  | [], _, _, h => Or.inl h
  | m :: ms, b, x, h => by
    match mem_refused_foldl ms (apply G b m) x h with
    | Or.inr ⟨hx, ht, hr⟩ => exact Or.inr ⟨List.Mem.tail _ hx, ht, hr⟩
    | Or.inl hb =>
      unfold apply at hb
      cases htm : G.told m with
      | true => rw [htm] at hb; exact Or.inl hb
      | false =>
        rw [htm] at hb
        cases hr : G.rule b.state (before G b.told (G.time m)) m with
        | some s => rw [hr] at hb; exact Or.inl hb
        | none =>
          rw [hr] at hb
          match mem_append_cases hb with
          | Or.inl h' => exact Or.inl h'
          | Or.inr h' =>
            have e := mem_singleton h'
            subst e
            exact Or.inr ⟨List.Mem.head _, htm, _, _, hr⟩

/-- A coordinated move whose rule refuses it in every state is refused. -/
theorem mem_refused_of_rule_none (m : G.Move) (ht : G.told m = false)
    (hr : ∀ s A, G.rule s A m = none) : ∀ (l : List G.Move) (b : Board G),
    m ∈ l → m ∈ (l.foldl (apply G) b).refused
  | y :: ys, b, h => by
    show m ∈ (ys.foldl (apply G) (apply G b y)).refused
    match mem_cons_cases h with
    | Or.inl e =>
      subst e
      apply refused_grows
      unfold apply
      rw [ht, hr]
      exact mem_append_of_right _ (List.Mem.head _)
    | Or.inr h' => exact mem_refused_of_rule_none m ht hr ys _ h'

theorem mem_map_iff {α β : Type} (f : α → β) : ∀ (l : List α) (y : β),
    y ∈ l.map f ↔ ∃ x, x ∈ l ∧ f x = y
  | [], _ => ⟨fun h => (nomatch h), fun h => (match h with | ⟨_, h', _⟩ => nomatch h')⟩
  | a :: as, y => by
    have ih := mem_map_iff f as y
    constructor
    · intro h
      match mem_cons_cases h with
      | Or.inl e => exact ⟨a, List.Mem.head _, e.symm⟩
      | Or.inr h' => let ⟨x, hx, e⟩ := ih.mp h'; exact ⟨x, List.Mem.tail _ hx, e⟩
    · intro ⟨x, hx, e⟩
      match mem_cons_cases hx with
      | Or.inl ex => subst ex; subst e; exact List.Mem.head _
      | Or.inr hx' => exact List.Mem.tail _ (ih.mpr ⟨x, hx', e⟩)

theorem filter_eq_self {α : Type} (p : α → Bool) : ∀ (l : List α), (∀ x, x ∈ l → p x = true) → l.filter p = l
  | [], _ => rfl
  | a :: as, h => by
    unfold List.filter
    rw [h a (List.Mem.head _)]
    rw [filter_eq_self p as (fun x hx => h x (List.Mem.tail _ hx))]

/-! ## Sealing suffices -/

/-- In a list strictly ordered by time, everything earlier than a move comes before it. -/
theorem sealed_of_pairwise {l : List G.Move} (hl : l.Pairwise (fun x y => G.time x < G.time y)) :
    ∀ p m q, l = p ++ m :: q → ∀ x, x ∈ l → G.time x < G.time m → x ∈ p := by
  intro p m q e x hx hlt
  rw [e] at hx hl
  match mem_append_cases hx with
  | Or.inl h => exact h
  | Or.inr h =>
    match mem_cons_cases h with
    | Or.inl ex => subst ex; exact absurd hlt (Nat.lt_irrefl _)
    | Or.inr hq =>
      match pairwise_of_append_right hl with
      | .cons hm _ => exact absurd (hm x hq) (Nat.lt_asymm hlt)

/-- The oracle a coordinated move sees under a seal: the told moves of the whole history before it. -/
def sealedOracle (l : List G.Move) (m : G.Move) : (G.Move → Bool) → Bool :=
  fun pr => l.any (fun x => G.told x && (decide (G.time x < G.time m) && pr x))

/-- Under a seal, a coordinated move arriving after the prefix `p` sees the sealed oracle. -/
theorem before_eq_sealed (l a : List G.Move) (hmem : ∀ x, x ∈ a ↔ x ∈ l)
    (hseal : ∀ p m q, a = p ++ m :: q → G.told m = false → ∀ x, x ∈ l → G.time x < G.time m → x ∈ p) :
    ∀ p m q, a = p ++ m :: q → G.told m = false →
      ∀ pr, before G (p.foldl (apply G) (empty G)).told (G.time m) pr = sealedOracle G l m pr := by
  intro p m q e htm pr
  apply bool_eq_of_iff
  constructor
  · intro h
    have ⟨x, hx, hp⟩ := exists_of_any h
    have hx' := (mem_told_foldl G p (empty G) x).mp hx
    match hx' with
    | Or.inl h0 => exact nomatch h0
    | Or.inr ⟨hxp, htx⟩ =>
      have hxa : x ∈ a := by rw [e]; exact mem_append_of_left _ hxp
      apply any_of_mem ((hmem x).mp hxa)
      show (G.told x && (decide (G.time x < G.time m) && pr x)) = true
      rw [htx]
      exact hp
  · intro h
    have ⟨x, hx, hp⟩ := exists_of_any h
    cases htx : G.told x with
    | false => rw [htx] at hp; exact nomatch hp
    | true =>
      rw [htx] at hp
      have hlt : G.time x < G.time m := by
        cases hd : decide (G.time x < G.time m) with
        | true => exact of_decide_eq_true hd
        | false => rw [hd] at hp; exact nomatch hp
      have hxp := hseal p m q e htm x hx hlt
      exact any_of_mem ((mem_told_foldl G p (empty G) x).mpr (Or.inr ⟨hxp, htx⟩)) hp

/-- **Sealing suffices.** Let `l` be a history in strict time order, and `a` an arrival order of
the same moves in which the coordinated moves arrive in time order and each arrives after every
move timestamped before it. Then the reader that applies `a` on arrival reaches the sealed
replay's board: the same state, the same refusals, the same told record. Told moves are free to
arrive anywhere. -/
theorem sealed_arrival_eq_replay (l a : List G.Move)
    (hl : l.Pairwise (fun x y => G.time x < G.time y))
    (hmem : ∀ x, x ∈ a ↔ x ∈ l)
    (hcoord : coordinated G a = coordinated G l)
    (hseal : ∀ p m q, a = p ++ m :: q → G.told m = false →
      ∀ x, x ∈ l → G.time x < G.time m → x ∈ p) :
    (play G a).state = (play G l).state ∧ (play G a).refused = (play G l).refused ∧
      ∀ x, x ∈ (play G a).told ↔ x ∈ (play G l).told := by
  have ha := foldl_eq_runCoord G (sealedOracle G l) a (empty G) (before_eq_sealed G l a hmem hseal)
  have hl' := foldl_eq_runCoord G (sealedOracle G l) l (empty G)
    (before_eq_sealed G l l (fun _ => Iff.rfl) (fun p m q e _ => sealed_of_pairwise G hl p m q e))
  refine ⟨?_, ?_, ?_⟩
  · show (a.foldl (apply G) (empty G)).state = (l.foldl (apply G) (empty G)).state
    rw [ha.1, hl'.1, hcoord]
  · show (a.foldl (apply G) (empty G)).refused = (l.foldl (apply G) (empty G)).refused
    rw [ha.2, hl'.2, hcoord]
  · intro x
    have e1 := mem_told_foldl G a (empty G) x
    have e2 := mem_told_foldl G l (empty G) x
    constructor
    · intro h
      match e1.mp h with
      | Or.inl h0 => exact nomatch h0
      | Or.inr ⟨hx, ht⟩ => exact e2.mpr (Or.inr ⟨(hmem x).mp hx, ht⟩)
    · intro h
      match e2.mp h with
      | Or.inl h0 => exact nomatch h0
      | Or.inr ⟨hx, ht⟩ => exact e1.mpr (Or.inr ⟨(hmem x).mpr hx, ht⟩)

/-! ## The sealed order -/

section Sorting

variable {α : Type} (key : α → Nat)

/-- Insert by key, before the first element whose key is not smaller. -/
def insertBy (x : α) : List α → List α
  | [] => [x]
  | y :: ys => if key x ≤ key y then x :: y :: ys else y :: insertBy x ys

/-- Insertion sort by key: the sealed order of a history. -/
def sortBy : List α → List α
  | [] => []
  | y :: ys => insertBy key y (sortBy ys)

theorem mem_insertBy (x : α) : ∀ (l : List α) (z : α), z ∈ insertBy key x l ↔ z = x ∨ z ∈ l
  | [], z => ⟨fun h => Or.inl (mem_singleton h), fun h => match h with
      | Or.inl e => e ▸ List.Mem.head _
      | Or.inr h => nomatch h⟩
  | y :: ys, z => by
    unfold insertBy
    by_cases hk : key x ≤ key y
    · rw [if_pos hk]
      exact ⟨mem_cons_cases, fun h => match h with
        | Or.inl e => e ▸ List.Mem.head _
        | Or.inr h => List.Mem.tail _ h⟩
    · rw [if_neg hk]
      have ih := mem_insertBy x ys z
      constructor
      · intro h
        match mem_cons_cases h with
        | Or.inl e => exact Or.inr (e ▸ List.Mem.head _)
        | Or.inr h' =>
          match ih.mp h' with
          | Or.inl e => exact Or.inl e
          | Or.inr h'' => exact Or.inr (List.Mem.tail _ h'')
      · intro h
        match h with
        | Or.inl e => exact List.Mem.tail _ (ih.mpr (Or.inl e))
        | Or.inr h' =>
          match mem_cons_cases h' with
          | Or.inl e => exact e ▸ List.Mem.head _
          | Or.inr h'' => exact List.Mem.tail _ (ih.mpr (Or.inr h''))

/-- Sorting keeps exactly the elements. -/
theorem sortBy_mem : ∀ (l : List α) (z : α), z ∈ sortBy key l ↔ z ∈ l
  | [], _ => Iff.rfl
  | y :: ys, z => by
    unfold sortBy
    have hi := mem_insertBy key y (sortBy key ys) z
    have ih := sortBy_mem ys z
    constructor
    · intro h
      match hi.mp h with
      | Or.inl e => exact e ▸ List.Mem.head _
      | Or.inr h' => exact List.Mem.tail _ (ih.mp h')
    · intro h
      match mem_cons_cases h with
      | Or.inl e => exact hi.mpr (Or.inl e)
      | Or.inr h' => exact hi.mpr (Or.inr (ih.mpr h'))

theorem insertBy_pairwise_lt (x : α) : ∀ (l : List α),
    l.Pairwise (fun a b => key a < key b) → (∀ y, y ∈ l → key y ≠ key x) →
    (insertBy key x l).Pairwise (fun a b => key a < key b)
  | [], _, _ => List.Pairwise.cons (fun _ h => nomatch h) List.Pairwise.nil
  | y :: ys, hl, hne => by
    unfold insertBy
    match hl with
    | .cons hy hys =>
      by_cases hk : key x ≤ key y
      · rw [if_pos hk]
        have hxy : key x < key y := Nat.lt_of_le_of_ne hk (fun e => hne y (List.Mem.head _) e.symm)
        refine List.Pairwise.cons (fun z hz => ?_) (List.Pairwise.cons hy hys)
        match mem_cons_cases hz with
        | Or.inl e => exact e ▸ hxy
        | Or.inr hz' => exact Nat.lt_trans hxy (hy z hz')
      · rw [if_neg hk]
        have hyx : key y < key x := Nat.lt_of_not_le hk
        refine List.Pairwise.cons (fun z hz => ?_)
          (insertBy_pairwise_lt x ys hys (fun z hz => hne z (List.Mem.tail _ hz)))
        match (mem_insertBy key x ys z).mp hz with
        | Or.inl e => exact e ▸ hyx
        | Or.inr hz' => exact hy z hz'

/-- When keys are pairwise distinct, the sorted list is strictly ordered by key. -/
theorem sortBy_pairwise_lt : ∀ (l : List α), l.Pairwise (fun a b => key a ≠ key b) →
    (sortBy key l).Pairwise (fun a b => key a < key b)
  | [], _ => List.Pairwise.nil
  | y :: ys, .cons hy hys => by
    unfold sortBy
    exact insertBy_pairwise_lt key y (sortBy key ys) (sortBy_pairwise_lt ys hys)
      (fun z hz e => hy z ((sortBy_mem key ys z).mp hz) e.symm)

end Sorting

/-! ## Strictly ordered lists, sets of naturals, and arrival orders -/

section Ordered

variable {α : Type}

/-- Membership as a Boolean, through decidable equality. -/
def has [DecidableEq α] (l : List α) (x : α) : Bool := l.any (fun y => decide (y = x))

theorem has_of_mem [DecidableEq α] {l : List α} {x : α} (h : x ∈ l) : has l x = true :=
  any_of_mem h (decide_eq_true rfl)

theorem mem_of_has [DecidableEq α] {l : List α} {x : α} (h : has l x = true) : x ∈ l :=
  match exists_of_any h with
  | ⟨_, hy, e⟩ => (of_decide_eq_true e) ▸ hy

theorem pairwise_filter {R : α → α → Prop} (p : α → Bool) :
    ∀ {l : List α}, l.Pairwise R → (l.filter p).Pairwise R
  | [], _ => List.Pairwise.nil
  | a :: as, .cons ha has' => by
    unfold List.filter
    cases hpa : p a with
    | true => exact List.Pairwise.cons (fun y hy => ha y (mem_of_mem_filter hy).1) (pairwise_filter p has')
    | false => exact pairwise_filter p has'

theorem pairwise_append_mem {R : α → α → Prop} : ∀ {p r : List α} {x y : α},
    (p ++ r).Pairwise R → x ∈ p → y ∈ r → R x y
  | _ :: as, _, _, y, .cons ha has', hx, hy =>
    match mem_cons_cases hx with
    | Or.inl e => by rw [e]; exact ha y (mem_append_of_right as hy)
    | Or.inr hx' => pairwise_append_mem has' hx' hy

/-- A filtered list is ordered when every kept element precedes every later kept one. -/
theorem pairwise_filter_of_splits {R : α → α → Prop} (f : α → Bool) : ∀ (a : List α),
    (∀ p m q, a = p ++ m :: q → f m = true → ∀ y, y ∈ q → f y = true → R m y) →
    (a.filter f).Pairwise R
  | [], _ => List.Pairwise.nil
  | m :: rest, H => by
    unfold List.filter
    have H' : ∀ p m' q, rest = p ++ m' :: q → f m' = true → ∀ y, y ∈ q → f y = true → R m' y :=
      fun p m' q e => H (m :: p) m' q (by rw [e]; rfl)
    cases hm : f m with
    | true =>
      exact List.Pairwise.cons (fun y hy => let r := mem_of_mem_filter hy; H [] m rest rfl hm y r.1 r.2)
        (pairwise_filter_of_splits f rest H')
    | false => exact pairwise_filter_of_splits f rest H'

/-- Two lists strictly ordered by a key, with the same members, are equal. -/
theorem eq_of_pairwise_lt (key : α → Nat) : ∀ {l l' : List α},
    l.Pairwise (fun a b => key a < key b) → l'.Pairwise (fun a b => key a < key b) →
    (∀ x, x ∈ l ↔ x ∈ l') → l = l'
  | [], [], _, _, _ => rfl
  | [], y :: _, _, _, h => nomatch (h y).mpr (List.Mem.head _)
  | x :: _, [], _, _, h => nomatch (h x).mp (List.Mem.head _)
  | x :: xs, y :: ys, .cons hx hxs, .cons hy hys, h => by
    have exy : x = y := by
      match mem_cons_cases ((h x).mp (List.Mem.head _)) with
      | Or.inl e => exact e
      | Or.inr hxys =>
        match mem_cons_cases ((h y).mpr (List.Mem.head _)) with
        | Or.inl e => exact e.symm
        | Or.inr hyxs => exact absurd (hx y hyxs) (Nat.lt_asymm (hy x hxys))
    subst exy
    have htail : ∀ z, z ∈ xs ↔ z ∈ ys := fun z =>
      ⟨fun hz => match mem_cons_cases ((h z).mp (List.Mem.tail _ hz)) with
        | Or.inl e => absurd (hx z hz) (by rw [e]; exact Nat.lt_irrefl _)
        | Or.inr h' => h',
       fun hz => match mem_cons_cases ((h z).mpr (List.Mem.tail _ hz)) with
        | Or.inl e => absurd (hy z hz) (by rw [e]; exact Nat.lt_irrefl _)
        | Or.inr h' => h'⟩
    rw [eq_of_pairwise_lt key hxs hys htail]

end Ordered

/-- Insert a natural into a strictly increasing list, once. -/
def insertSet (x : Nat) : List Nat → List Nat
  | [] => [x]
  | y :: ys => if x < y then x :: y :: ys else if x = y then y :: ys else y :: insertSet x ys

/-- A list of naturals as a set: strictly increasing, each once. -/
def setOf : List Nat → List Nat
  | [] => []
  | x :: xs => insertSet x (setOf xs)

theorem mem_insertSet (x : Nat) : ∀ (l : List Nat) (z : Nat), z ∈ insertSet x l ↔ z = x ∨ z ∈ l
  | [], z => ⟨fun h => Or.inl (mem_singleton h), fun h => match h with
      | Or.inl e => e ▸ List.Mem.head _
      | Or.inr h => nomatch h⟩
  | y :: ys, z => by
    unfold insertSet
    by_cases h1 : x < y
    · rw [if_pos h1]
      exact ⟨mem_cons_cases, fun h => match h with
        | Or.inl e => e ▸ List.Mem.head _
        | Or.inr h => List.Mem.tail _ h⟩
    · rw [if_neg h1]
      by_cases h2 : x = y
      · rw [if_pos h2]
        exact ⟨Or.inr, fun h => match h with
          | Or.inl e => by rw [e, h2]; exact List.Mem.head _
          | Or.inr h => h⟩
      · rw [if_neg h2]
        have ih := mem_insertSet x ys z
        constructor
        · intro h
          match mem_cons_cases h with
          | Or.inl e => exact Or.inr (e ▸ List.Mem.head _)
          | Or.inr h' =>
            match ih.mp h' with
            | Or.inl e => exact Or.inl e
            | Or.inr h'' => exact Or.inr (List.Mem.tail _ h'')
        · intro h
          match h with
          | Or.inl e => exact List.Mem.tail _ (ih.mpr (Or.inl e))
          | Or.inr h' =>
            match mem_cons_cases h' with
            | Or.inl e => exact e ▸ List.Mem.head _
            | Or.inr h'' => exact List.Mem.tail _ (ih.mpr (Or.inr h''))

theorem insertSet_pairwise (x : Nat) : ∀ (l : List Nat), l.Pairwise (· < ·) →
    (insertSet x l).Pairwise (· < ·)
  | [], _ => List.Pairwise.cons (fun _ h => nomatch h) List.Pairwise.nil
  | y :: ys, .cons hy hys => by
    unfold insertSet
    by_cases h1 : x < y
    · rw [if_pos h1]
      refine List.Pairwise.cons (fun z hz => ?_) (List.Pairwise.cons hy hys)
      match mem_cons_cases hz with
      | Or.inl e => exact e ▸ h1
      | Or.inr hz' => exact Nat.lt_trans h1 (hy z hz')
    · rw [if_neg h1]
      by_cases h2 : x = y
      · rw [if_pos h2]; exact List.Pairwise.cons hy hys
      · rw [if_neg h2]
        have hyx : y < x := Nat.lt_of_le_of_ne (Nat.le_of_not_lt h1) (fun e => h2 e.symm)
        refine List.Pairwise.cons (fun z hz => ?_) (insertSet_pairwise x ys hys)
        match (mem_insertSet x ys z).mp hz with
        | Or.inl e => exact e ▸ hyx
        | Or.inr hz' => exact hy z hz'

theorem setOf_mem : ∀ (l : List Nat) (z : Nat), z ∈ setOf l ↔ z ∈ l
  | [], _ => Iff.rfl
  | y :: ys, z => by
    unfold setOf
    have hi := mem_insertSet y (setOf ys) z
    have ih := setOf_mem ys z
    constructor
    · intro h
      match hi.mp h with
      | Or.inl e => exact e ▸ List.Mem.head _
      | Or.inr h' => exact List.Mem.tail _ (ih.mp h')
    · intro h
      match mem_cons_cases h with
      | Or.inl e => exact hi.mpr (Or.inl e)
      | Or.inr h' => exact hi.mpr (Or.inr (ih.mpr h'))

theorem setOf_pairwise : ∀ (l : List Nat), (setOf l).Pairwise (· < ·)
  | [] => List.Pairwise.nil
  | y :: ys => insertSet_pairwise y (setOf ys) (setOf_pairwise ys)

/-- Lists with the same members have the same set. -/
theorem setOf_congr {l l' : List Nat} (h : ∀ x, x ∈ l ↔ x ∈ l') : setOf l = setOf l' :=
  eq_of_pairwise_lt id (setOf_pairwise l) (setOf_pairwise l')
    (fun x => ⟨fun hx => (setOf_mem l' x).mpr ((h x).mp ((setOf_mem l x).mp hx)),
               fun hx => (setOf_mem l x).mpr ((h x).mpr ((setOf_mem l' x).mp hx))⟩)

/-- **An arrival order is as good as the sealed one.** If the moves of `a` have distinct times
and every coordinated move arrives after every move timestamped before it, the reader that
applies `a` on arrival reaches the board of `a` replayed in time order. -/
theorem sealed_arrival_eq_sorted (a : List G.Move)
    (hd : a.Pairwise (fun x y => G.time x ≠ G.time y))
    (hseal : ∀ p m q, a = p ++ m :: q → G.told m = false →
      ∀ x, x ∈ a → G.time x < G.time m → x ∈ p) :
    (play G a).state = (play G (sortBy G.time a)).state ∧
      (play G a).refused = (play G (sortBy G.time a)).refused ∧
      ∀ x, x ∈ (play G a).told ↔ x ∈ (play G (sortBy G.time a)).told := by
  have hl := sortBy_pairwise_lt G.time a hd
  have hmem : ∀ x, x ∈ a ↔ x ∈ sortBy G.time a := fun x => (sortBy_mem G.time a x).symm
  refine sealed_arrival_eq_replay G (sortBy G.time a) a hl hmem ?_
    (fun p m q e hm x hx hlt => hseal p m q e hm x ((hmem x).mpr hx) hlt)
  apply eq_of_pairwise_lt G.time
  · apply pairwise_filter_of_splits
    intro p m q e hm y hy _
    have htold : G.told m = false := by
      cases h : G.told m with
      | false => rfl
      | true => rw [h] at hm; exact nomatch hm
    have hd' := hd
    rw [e] at hd'
    have hne : G.time m ≠ G.time y :=
      match pairwise_of_append_right hd' with
      | .cons hm' _ => hm' y hy
    match Nat.lt_or_gt_of_ne hne with
    | Or.inl h => exact h
    | Or.inr h =>
      have hya : y ∈ a := by rw [e]; exact mem_append_of_right p (List.Mem.tail m hy)
      have hyp := hseal p m q e htold y hya h
      exact absurd (pairwise_append_mem hd' hyp (List.Mem.tail m hy)) (fun hh => hh rfl)
  · exact pairwise_filter _ hl
  · intro x
    constructor
    · intro h
      have r := mem_of_mem_filter h
      exact mem_filter_of ((hmem x).mp r.1) r.2
    · intro h
      have r := mem_of_mem_filter h
      exact mem_filter_of ((hmem x).mpr r.1) r.2

/-! ## The oblivious CALM theorem -/

section Oblivious

variable {α β : Type}

/-- A query over finite inputs that reads them as a set. -/
def SetQuery (Q : List α → β) : Prop := ∀ l l', (∀ x, x ∈ l ↔ x ∈ l') → Q l = Q l'

/-- A query is monotone when more input never lowers its answer. -/
def Monotone (le : β → β → Prop) (Q : List α → β) : Prop :=
  ∀ l l', (∀ x, x ∈ l → x ∈ l') → le (Q l) (Q l')

/-- A query has a coordination-free reader when some reader, answering after each arrival,
answers every input as if it were complete (it cannot tell a finished input from a paused one)
and never retracts an answer as more arrives. -/
def CoordinationFree (le : β → β → Prop) (Q : List α → β) : Prop :=
  ∃ out : List α → β, (∀ l, out l = Q l) ∧ ∀ l l', le (out l) (out (l ++ l'))

/-- **The oblivious CALM theorem.** A query read as a set has a coordination-free reader
exactly when it is monotone. -/
theorem coordinationFree_iff_monotone (le : β → β → Prop) (Q : List α → β) (hQ : SetQuery Q) :
    CoordinationFree le Q ↔ Monotone le Q := by
  constructor
  · intro ⟨out, hout, hgrow⟩ l l' hsub
    have e : Q (l ++ l') = Q l' := hQ _ _ (fun x => ⟨fun h => match mem_append_cases h with
      | Or.inl h' => hsub x h'
      | Or.inr h' => h', fun h => mem_append_of_right _ h⟩)
    have g := hgrow l l'
    rw [hout l, hout (l ++ l'), e] at g
    exact g
  · intro hmono
    exact ⟨Q, fun _ => rfl, fun l l' => hmono l (l ++ l') (fun _ h => mem_append_of_left _ h)⟩

end Oblivious

end ObsmetrologiaComputing.Calm
