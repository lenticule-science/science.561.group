import ObsmetrologiaComputing.WorkArena

/-!
# WorkArena.Fragment — the coordination-free fragment of the work arena

CALM for agent commitments. The work arena's ninth edition says tellings need no turn. Read
precisely, the claim is about when a replica may act on a move it has just received, and this
module proves it in that form.

A replica that sorts every move it holds by time reads the same board whatever order the
moves arrived in. Sorting is the coordination, though: a replica acts on a move only once it
holds every move before it. The question is which moves need that seal.

## Main definitions

* `admitted o l m` — move `m` of history `l` stands in the sealed replay.
* `SealFree k a` — no other player's earlier move, arriving late, can refuse a move of act `a`
  on a thread of kind `k`.
* `NeedsSeal k a` — some other player's earlier move, arriving late, refuses one.
* `Retracts k a` — some move of act `a` closes a thread that was open.

## Main results

* `board_of_sealed_arrival` — **sealing suffices.** A reader applies moves as they arrive. A
  coordinated move waits until every move timestamped before it has arrived; a telling waits
  for nothing. That reader's board is the board of the sealed replay.
* `told_sealFree` — every telling is seal-free. A telling stands exactly when it is in the
  history and is well-formed alone (`told_admitted`). No other move, early or late, refuses it.
* `fragment_law` — the arena's split is a theorem. For every act that answers a kind: a
  telling is seal-free, and every other act either needs the seal (with an explicit history
  and late move) or retracts (with an explicit history it closes). That is the ninth edition's
  "every other move retracts something or reads an absence", made exact.
* The coordinated fragment of the survey's play C, each by witness:
  * `withdraw_needs_seal` — the opener's withdrawal is refused once a late acceptance arrives.
  * `release_needs_seal` — a promiser's release is refused once a late withdrawal arrives.
  * `supersede_admitted`, `supersede_retracts` — a supersession by the opener is never refused,
    and it closes what it supersedes.
  * `forfeit_needs_seal` — a late missed observation forfeits the holder's next wager.
* Tellings feed readings that are not monotone. A coordinated move reads them through the
  seal, and nothing else may act on them:
  * `verdict_not_monotone` — a late witness against an accepted delivery contests it.
  * `resolution_not_monotone` — a late corroboration reopens a resolved report.
* `deliveryReading_climbs` — **witnessing climbs knowledge.** A reader that holds more tellings
  reads every claim, and every delivery's truth-meet of its claims, higher in `≤ₖ`. It holds
  because FOUR is interlaced: the truth-meet is knowledge-monotone
  (`readingInterlaced.meetT_kmono`).

The supply (eighteenth edition) lands in the same split, and the draw is the case that carries
a quantity:

* `supply_draw_needs_seal` — **a draw consumes a shared quantity, so it needs the seal.** Two
  draws that together exceed what a supply holds cannot both stand, so whether one stands
  depends on the other, which may be the earlier and arrive late. A bounded allowance is
  coordination.
* `supply_draw_needs_seal_of_reading` — the quantity is also read through a telling: a late
  restatement by the supplier of what remains refuses a draw that stood.
* `late_return_admits_draw` — the dependence runs both ways: a late return admits a draw the
  seal-less reader had refused. So the draw has no coordination-free reader in either direction.
* `supply_return_needs_seal`, `supply_withdraw_retracts` — a return reads the thread's closure
  and a withdrawal closes it. Both are coordinated.
* `supply_left_not_monotone_down`, `supply_left_not_monotone_up` — the supply's standing is not
  monotone in the tellings: a late reading closes an open supply, and a later one reopens it. A
  draw acts on that standing's threshold, so nothing may act on it before the seal.
* `supply_telling_iff_sealFree` — on a supply, the acts that are tellings are exactly the
  acts that can never be refused for another player's earlier move, among draw, return and
  restatement.

The two classes overlap in one way, and it is stated rather than hidden. A request's
acceptance is a telling whose verdict closes the thread. The telling never needs the seal; the
verdict is not monotone (`verdict_not_monotone`). So every coordinated move reads the verdict
through the seal.

The witnesses are concrete histories that the kernel evaluates (`decide`). The general
theorems are proved for every opening and every history.
-/

namespace ObsmetrologiaComputing.WorkArena

open Obsmetrologia

/-! ## Admission -/

/-- Move `m` of history `l` stands: it is in `l` and the sealed replay does not refuse it. -/
def admitted (o : Opening) (l : List Move) (m : Move) : Bool :=
  Calm.has l m && !Calm.has (Calm.play (game o) (Calm.sortBy Move.time l)).refused m

/-- No other player's earlier move, arriving late, refuses a move of act `a` on a thread of
kind `k`. -/
def SealFree (k : Kind) (a : Act) : Prop :=
  ∀ (o : Opening) (l : List Move) (m x : Move), o.kind = k → m.act = a →
    x.player ≠ m.player → x.time < m.time → admitted o l m = true → admitted o (x :: l) m = true

/-- Some other player's earlier move, arriving late, refuses a move of act `a`. -/
def NeedsSeal (k : Kind) (a : Act) : Prop :=
  ∃ (o : Opening) (l : List Move) (m x : Move), o.kind = k ∧ m.act = a ∧
    x.player ≠ m.player ∧ x.time < m.time ∧ admitted o l m = true ∧ admitted o (x :: l) m = false

/-- Some move of act `a` closes a thread of kind `k` that was open. -/
def Retracts (k : Kind) (a : Act) : Prop :=
  ∃ (o : Opening) (l : List Move) (x : Move) (T : Time), o.kind = k ∧ x.act = a ∧ x.time ≤ T ∧
    closed (board o l T).standing = false ∧ closed (board o (x :: l) T).standing = true

theorem not_sealFree_of_needsSeal {k : Kind} {a : Act} (h : NeedsSeal k a) : ¬ SealFree k a :=
  fun hf =>
    let ⟨o, l, m, x, hk, ha, hp, ht, h1, h2⟩ := h
    Bool.false_ne_true (h2 ▸ hf o l m x hk ha hp ht h1)

/-! ## Tellings stand alone -/

/-- The law refuses a telling that reaches it: a telling is never ruled on. -/
theorem rule_told_none (o : Opening) (sk : Skeleton) (A : Told) (m : Move)
    (h : told o.kind m.act = true) : rule o sk A m = none := by
  have hs : (m.act == Act.supersede) = false := by
    cases hk : o.kind <;> cases ha : m.act <;> rw [hk, ha] at h <;> first | rfl | exact nomatch h
  have hc : (!answers o.kind m.act || told o.kind m.act) = true := by rw [h, Bool.or_true]
  unfold rule
  rw [if_neg (by rw [hs]; exact Bool.false_ne_true), if_pos hc]

/-- **A telling stands exactly when it is in the history and well-formed alone.** -/
theorem told_admitted (o : Opening) (l : List Move) (m : Move) (h : told o.kind m.act = true) :
    admitted o l m = true ↔ (m ∈ l ∧ intrinsic o m = true) := by
  constructor
  · intro hadm
    have hl : Calm.has l m = true := by
      cases h1 : Calm.has l m with
      | true => rfl
      | false => unfold admitted at hadm; rw [h1] at hadm; exact nomatch hadm
    have hm : m ∈ l := Calm.mem_of_has hl
    refine ⟨hm, ?_⟩
    cases hi : intrinsic o m with
    | true => rfl
    | false =>
      have ht : (game o).told m = false := by
        show (told o.kind m.act && intrinsic o m) = false
        rw [hi, Bool.and_false]
      have hr : m ∈ (Calm.play (game o) (Calm.sortBy Move.time l)).refused :=
        Calm.mem_refused_of_rule_none (game o) m ht (fun s A => rule_told_none o s A m h) _ _
          ((Calm.sortBy_mem Move.time l m).mpr hm)
      unfold admitted at hadm
      rw [hl, Calm.has_of_mem hr] at hadm
      exact nomatch hadm
  · intro ⟨hm, hi⟩
    have ht : (game o).told m = true := by
      show (told o.kind m.act && intrinsic o m) = true
      rw [h, hi]; rfl
    have hnr : Calm.has (Calm.play (game o) (Calm.sortBy Move.time l)).refused m = false := by
      cases hh : Calm.has (Calm.play (game o) (Calm.sortBy Move.time l)).refused m with
      | false => rfl
      | true =>
        match Calm.mem_refused_foldl (game o) _ _ m (Calm.mem_of_has hh) with
        | Or.inl h0 => exact nomatch h0
        | Or.inr ⟨_, hf, _⟩ => rw [ht] at hf; exact nomatch hf
    unfold admitted
    rw [Calm.has_of_mem hm, hnr]
    rfl

/-- **Every telling is seal-free**, and more: no move, by anyone at any time, refuses it. -/
theorem told_sealFree (k : Kind) (a : Act) (h : told k a = true) : SealFree k a := by
  intro o l m x hk ha _ _ hadm
  have ht : told o.kind m.act = true := by rw [hk, ha]; exact h
  have ⟨hm, hi⟩ := (told_admitted o l m ht).mp hadm
  exact (told_admitted o (x :: l) m ht).mpr ⟨List.Mem.tail _ hm, hi⟩

/-! ## Witnesses: the coordinated fragment -/

/-- A response of act `a` by `p` at `t`. -/
def mv (a : Act) (p : Player) (t : Time) : Move := { act := a, player := p, time := t }

/-- An aim with one measure. -/
def aimO : Opening := { kind := .aim, opener := 1, assayer := 1, measures := [1] }
/-- A request with one condition and an assayer other than its opener. -/
def reqO : Opening := { kind := .request, opener := 1, assayer := 9, conditions := [1] }
/-- A request addressed to player `2`. -/
def reqTo : Opening := { kind := .request, opener := 1, assayer := 1, addressee := some 2, conditions := [1] }
/-- A proposal. -/
def propO : Opening := { kind := .propose, opener := 1, assayer := 1 }
/-- A report. -/
def repO : Opening := { kind := .report, opener := 1, assayer := 1 }
/-- A question whose assayer is not its opener. -/
def askO : Opening := { kind := .ask, opener := 1, assayer := 9 }
/-- A declaration. -/
def declO : Opening := { kind := .declare, opener := 1, assayer := 1 }

/-- A wager by `2` on measure `1`, target `5`, from `t` to `e`. -/
def wagerMv (t e : Time) : Move := { act := .wager, player := 2, time := t, measure := 1, value := 5, ends := e }
/-- An observation by `3` of measure `1`, value `v`, held at `s`, told at `t`. -/
def observeMv (t s v : Time) : Move := { act := .observe, player := 3, time := t, measure := 1, value := v, observed := s }

/-- The opener's withdrawal, at `2`, refuses a later move: the shape most witnesses take. -/
def lateWithdraw : Move := mv .withdraw 1 2

theorem seal_aim_hold : NeedsSeal .aim .hold :=
  ⟨aimO, [mv .hold 2 3], mv .hold 2 3, lateWithdraw, rfl, rfl, by decide, by decide, by decide, by decide⟩
theorem seal_aim_wager : NeedsSeal .aim .wager :=
  ⟨aimO, [wagerMv 3 9], wagerMv 3 9, lateWithdraw, rfl, rfl, by decide, by decide, by decide, by decide⟩
theorem seal_aim_attach : NeedsSeal .aim .attach :=
  ⟨aimO, [mv .hold 2 1, mv .attach 2 3], mv .attach 2 3, lateWithdraw, rfl, rfl, by decide, by decide, by decide, by decide⟩
theorem seal_aim_leave : NeedsSeal .aim .leave :=
  ⟨aimO, [mv .hold 2 1, mv .leave 2 3], mv .leave 2 3, lateWithdraw, rfl, rfl, by decide, by decide, by decide, by decide⟩
theorem retracts_aim_withdraw : Retracts .aim .withdraw :=
  ⟨aimO, [], mv .withdraw 1 1, 2, rfl, rfl, by decide, by decide, by decide⟩

theorem seal_request_promise : NeedsSeal .request .promise :=
  ⟨reqO, [mv .promise 2 3], mv .promise 2 3, lateWithdraw, rfl, rfl, by decide, by decide, by decide, by decide⟩
theorem seal_request_attach : NeedsSeal .request .attach :=
  ⟨reqO, [mv .promise 2 1, mv .attach 2 3], mv .attach 2 3, lateWithdraw, rfl, rfl, by decide, by decide, by decide, by decide⟩
theorem seal_request_decline : NeedsSeal .request .decline :=
  ⟨reqTo, [mv .decline 2 3], mv .decline 2 3, lateWithdraw, rfl, rfl, by decide, by decide, by decide, by decide⟩
theorem seal_request_refine : NeedsSeal .request .refine :=
  ⟨reqO, [{ mv .refine 9 3 with terms := [2] }], { mv .refine 9 3 with terms := [2] }, lateWithdraw,
    rfl, rfl, by decide, by decide, by decide, by decide⟩
theorem seal_request_counter : NeedsSeal .request .counter :=
  ⟨reqO, [{ mv .counter 2 3 with terms := [2] }], { mv .counter 2 3 with terms := [2] }, lateWithdraw,
    rfl, rfl, by decide, by decide, by decide, by decide⟩
theorem seal_request_agree : NeedsSeal .request .agree :=
  ⟨reqO, [{ mv .counter 2 1 with terms := [2] }, { mv .agree 9 3 with about := 2 }], { mv .agree 9 3 with about := 2 },
    lateWithdraw, rfl, rfl, by decide, by decide, by decide, by decide⟩
theorem seal_request_deliver : NeedsSeal .request .deliver :=
  ⟨reqO, [mv .promise 2 1, mv .deliver 2 3], mv .deliver 2 3, lateWithdraw, rfl, rfl, by decide, by decide, by decide, by decide⟩

/-- **Release needs the seal**: a promiser's release is refused once the opener's earlier
withdrawal arrives. -/
theorem release_needs_seal : NeedsSeal .request .release :=
  ⟨reqO, [mv .promise 2 1, mv .release 2 3], mv .release 2 3, lateWithdraw, rfl, rfl, by decide, by decide, by decide, by decide⟩

/-- **Withdrawal needs the seal**: the opener's withdrawal is refused once the assayer's
earlier acceptance of the delivery arrives. -/
theorem withdraw_needs_seal : NeedsSeal .request .withdraw :=
  ⟨reqO, [mv .promise 2 1, mv .deliver 2 2, mv .withdraw 1 4], mv .withdraw 1 4, { mv .accept 9 3 with about := 2 },
    rfl, rfl, by decide, by decide, by decide, by decide⟩

theorem seal_propose_adopt : NeedsSeal .propose .adopt :=
  ⟨propO, [mv .adopt 2 3], mv .adopt 2 3, lateWithdraw, rfl, rfl, by decide, by decide, by decide, by decide⟩
theorem seal_propose_attach : NeedsSeal .propose .attach :=
  ⟨propO, [mv .adopt 2 1, mv .attach 2 3], mv .attach 2 3, lateWithdraw, rfl, rfl, by decide, by decide, by decide, by decide⟩
theorem retracts_propose_withdraw : Retracts .propose .withdraw :=
  ⟨propO, [], mv .withdraw 1 1, 2, rfl, rfl, by decide, by decide, by decide⟩

theorem seal_report_adopt : NeedsSeal .report .adopt :=
  ⟨repO, [mv .adopt 2 3], mv .adopt 2 3, mv .resolve 3 2, rfl, rfl, by decide, by decide, by decide, by decide⟩
theorem seal_report_attach : NeedsSeal .report .attach :=
  ⟨repO, [mv .adopt 2 1, mv .attach 2 3], mv .attach 2 3, lateWithdraw, rfl, rfl, by decide, by decide, by decide, by decide⟩
theorem seal_report_resolve : NeedsSeal .report .resolve :=
  ⟨repO, [mv .resolve 2 3], mv .resolve 2 3, mv .resolve 3 2, rfl, rfl, by decide, by decide, by decide, by decide⟩
theorem seal_report_withdraw : NeedsSeal .report .withdraw :=
  ⟨repO, [mv .withdraw 1 3], mv .withdraw 1 3, mv .resolve 2 2, rfl, rfl, by decide, by decide, by decide, by decide⟩

theorem seal_ask_accept : NeedsSeal .ask .accept :=
  ⟨askO, [mv .answer 2 1, { mv .accept 9 3 with about := 2 }], { mv .accept 9 3 with about := 2 }, lateWithdraw,
    rfl, rfl, by decide, by decide, by decide, by decide⟩
theorem seal_ask_withdraw : NeedsSeal .ask .withdraw :=
  ⟨askO, [mv .answer 2 1, mv .withdraw 1 4], mv .withdraw 1 4, { mv .accept 9 3 with about := 2 },
    rfl, rfl, by decide, by decide, by decide, by decide⟩

theorem retracts_declare_withdraw : Retracts .declare .withdraw :=
  ⟨declO, [], mv .withdraw 1 1, 2, rfl, rfl, by decide, by decide, by decide⟩

/-! ## The supply: a quantity that draws share -/

/-- A supply of `5`, held by player `1`, that admits only draws that fit and lapses at `100`. -/
def supplyO : Opening := { kind := .supply, opener := 1, assayer := 1, amount := 5, lapses := 100 }

/-- A draw by `p` at `t` of `n`. -/
def drawMv (p : Player) (t : Time) (n : Nat) : Move := { act := .draw, player := p, time := t, amount := n }
/-- A return by `p` at `t` of `n`. -/
def returnMv (p : Player) (t : Time) (n : Nat) : Move := { act := .«return», player := p, time := t, amount := n }
/-- The supplier's reading, told at `t`, that `v` remains as of `s`. -/
def remainingMv (t s v : Nat) : Move := { act := .observe, player := 1, time := t, measure := remainingMeasure, value := v, observed := s }

/-- **A draw needs the seal.** Player `2`'s draw of the whole supply stands alone, and is refused
once player `4`'s earlier draw of the same amount arrives: the two exceed what the supply holds. -/
theorem supply_draw_needs_seal : NeedsSeal .supply .draw :=
  ⟨supplyO, [drawMv 2 3 5], drawMv 2 3 5, drawMv 4 2 5, rfl, rfl, by decide, by decide, by decide, by decide⟩

/-- A draw is also refused by a telling that lowers what is left: the supplier's late reading
that nothing remains. -/
theorem supply_draw_needs_seal_of_reading :
    ∃ (l : List Move) (m x : Move), m.act = .draw ∧ x.act = .observe ∧ x.player ≠ m.player ∧
      x.time < m.time ∧ admitted supplyO l m = true ∧ admitted supplyO (x :: l) m = false :=
  ⟨[drawMv 2 3 5], drawMv 2 3 5, remainingMv 2 2 0, rfl, rfl, by decide, by decide, by decide, by decide⟩

/-- **A late return admits a draw.** Player `3`'s draw is refused while player `2`'s draw of the
whole supply stands, and stands once player `2`'s earlier return arrives. -/
theorem late_return_admits_draw :
    ∃ (l : List Move) (m x : Move), m.act = .draw ∧ x.act = .«return» ∧ x.player ≠ m.player ∧
      x.time < m.time ∧ admitted supplyO l m = false ∧ admitted supplyO (x :: l) m = true :=
  ⟨[drawMv 2 1 5, drawMv 3 4 3], drawMv 3 4 3, returnMv 2 3 3, rfl, rfl, by decide, by decide, by decide, by decide⟩

/-- **A return needs the seal**: it is refused once the supplier's earlier withdrawal arrives. -/
theorem supply_return_needs_seal : NeedsSeal .supply .return :=
  ⟨supplyO, [drawMv 2 1 3, returnMv 2 3 2], returnMv 2 3 2, lateWithdraw, rfl, rfl, by decide, by decide, by decide, by decide⟩

/-- **A withdrawal retracts**: it closes an open supply. -/
theorem supply_withdraw_retracts : Retracts .supply .withdraw :=
  ⟨supplyO, [], mv .withdraw 1 1, 2, rfl, rfl, by decide, by decide, by decide⟩

/-- **A late reading closes an open supply.** -/
theorem supply_left_not_monotone_down :
    ∃ (l : List Move) (x : Move), told .supply x.act = true ∧
      (board supplyO l 9).standing = .open ∧ (board supplyO (x :: l) 9).standing = .drawn :=
  ⟨[drawMv 2 3 2], remainingMv 4 4 0, rfl, by decide, by decide⟩

/-- **A later reading reopens a drawn supply.** -/
theorem supply_left_not_monotone_up :
    ∃ (l : List Move) (x : Move), told .supply x.act = true ∧
      (board supplyO l 9).standing = .drawn ∧ (board supplyO (x :: l) 9).standing = .open :=
  ⟨[drawMv 2 3 5], remainingMv 4 4 3, rfl, by decide, by decide⟩

/-- **On a supply, tellings are exactly the seal-free acts** among draw, return and restatement:
a restatement stands alone, and neither a draw nor a return does. -/
theorem supply_telling_iff_sealFree (a : Act) (h : a = .draw ∨ a = .«return» ∨ a = .observe) :
    told .supply a = true ↔ SealFree .supply a := by
  match a, h with
  | .observe, _ => exact ⟨fun _ => told_sealFree _ _ rfl, fun _ => rfl⟩
  | .draw, _ => exact ⟨fun ht => absurd ht (by decide), fun hf => absurd hf (not_sealFree_of_needsSeal supply_draw_needs_seal)⟩
  | .«return», _ => exact ⟨fun ht => absurd ht (by decide), fun hf => absurd hf (not_sealFree_of_needsSeal supply_return_needs_seal)⟩

/-! ## The fragment law -/

/-- **The fragment law.** For every act that answers a kind of opening: a telling is
seal-free, and every other act either needs the seal or retracts. -/
theorem fragment_law (k : Kind) (a : Act) (h : answers k a = true) :
    (told k a = true → SealFree k a) ∧ (told k a = false → NeedsSeal k a ∨ Retracts k a) := by
  cases k <;> cases a <;> first
    | exact absurd h (by decide)
    | exact ⟨told_sealFree _ _, fun ht => absurd ht (by decide)⟩
    | exact ⟨fun ht => absurd ht (by decide), fun _ => Or.inl seal_aim_hold⟩
    | exact ⟨fun ht => absurd ht (by decide), fun _ => Or.inl seal_aim_wager⟩
    | exact ⟨fun ht => absurd ht (by decide), fun _ => Or.inl seal_aim_attach⟩
    | exact ⟨fun ht => absurd ht (by decide), fun _ => Or.inl seal_aim_leave⟩
    | exact ⟨fun ht => absurd ht (by decide), fun _ => Or.inr retracts_aim_withdraw⟩
    | exact ⟨fun ht => absurd ht (by decide), fun _ => Or.inl seal_request_promise⟩
    | exact ⟨fun ht => absurd ht (by decide), fun _ => Or.inl seal_request_attach⟩
    | exact ⟨fun ht => absurd ht (by decide), fun _ => Or.inl seal_request_decline⟩
    | exact ⟨fun ht => absurd ht (by decide), fun _ => Or.inl seal_request_refine⟩
    | exact ⟨fun ht => absurd ht (by decide), fun _ => Or.inl seal_request_counter⟩
    | exact ⟨fun ht => absurd ht (by decide), fun _ => Or.inl seal_request_agree⟩
    | exact ⟨fun ht => absurd ht (by decide), fun _ => Or.inl release_needs_seal⟩
    | exact ⟨fun ht => absurd ht (by decide), fun _ => Or.inl seal_request_deliver⟩
    | exact ⟨fun ht => absurd ht (by decide), fun _ => Or.inl withdraw_needs_seal⟩
    | exact ⟨fun ht => absurd ht (by decide), fun _ => Or.inl seal_propose_adopt⟩
    | exact ⟨fun ht => absurd ht (by decide), fun _ => Or.inl seal_propose_attach⟩
    | exact ⟨fun ht => absurd ht (by decide), fun _ => Or.inr retracts_propose_withdraw⟩
    | exact ⟨fun ht => absurd ht (by decide), fun _ => Or.inl seal_report_adopt⟩
    | exact ⟨fun ht => absurd ht (by decide), fun _ => Or.inl seal_report_attach⟩
    | exact ⟨fun ht => absurd ht (by decide), fun _ => Or.inl seal_report_resolve⟩
    | exact ⟨fun ht => absurd ht (by decide), fun _ => Or.inl seal_report_withdraw⟩
    | exact ⟨fun ht => absurd ht (by decide), fun _ => Or.inl seal_ask_accept⟩
    | exact ⟨fun ht => absurd ht (by decide), fun _ => Or.inl seal_ask_withdraw⟩
    | exact ⟨fun ht => absurd ht (by decide), fun _ => Or.inr retracts_declare_withdraw⟩
    | exact ⟨fun ht => absurd ht (by decide), fun _ => Or.inl supply_draw_needs_seal⟩
    | exact ⟨fun ht => absurd ht (by decide), fun _ => Or.inl supply_return_needs_seal⟩
    | exact ⟨fun ht => absurd ht (by decide), fun _ => Or.inr supply_withdraw_retracts⟩

/-! ## Supersession and forfeit -/

/-- **A supersession by the opener is never refused**: it reads nothing, so it needs no seal. -/
theorem supersede_admitted (o : Opening) (l : List Move) (m : Move) (ha : m.act = .supersede)
    (hp : m.player = o.opener) (hm : m ∈ l) : admitted o l m = true := by
  have hs : ∀ sk A, rule o sk A m = some { sk with superseded := true } := by
    intro sk A
    unfold rule
    rw [if_pos (by rw [ha]; rfl), if_pos (by rw [hp]; exact decide_eq_true rfl)]
  have ht : (game o).told m = false := by
    show (told o.kind m.act && intrinsic o m) = false
    rw [ha]; cases o.kind <;> rfl
  have hnr : Calm.has (Calm.play (game o) (Calm.sortBy Move.time l)).refused m = false := by
    cases hh : Calm.has (Calm.play (game o) (Calm.sortBy Move.time l)).refused m with
    | false => rfl
    | true =>
      match Calm.mem_refused_foldl (game o) _ _ m (Calm.mem_of_has hh) with
      | Or.inl h0 => exact nomatch h0
      | Or.inr ⟨_, _, s, A, hr⟩ =>
        have e : rule o s A m = none := hr
        rw [hs] at e
        exact nomatch e
  unfold admitted
  rw [Calm.has_of_mem hm, hnr]
  rfl

/-- **A supersession retracts**: it closes the thread it supersedes, here a promised request. -/
theorem supersede_retracts : Retracts .request .supersede :=
  ⟨reqO, [mv .promise 2 1], mv .supersede 1 2, 3, rfl, rfl, by decide, by decide, by decide⟩

/-- **Forfeit needs the seal.** A holder's two wagers missed, then a third: the third stands
while the second miss is unobserved, and is refused once a late observation of the miss
arrives. The late move is another player's telling. -/
theorem forfeit_needs_seal :
    ∃ (l : List Move) (m x : Move), m.act = .wager ∧ x.act = .observe ∧ x.player ≠ m.player ∧
      x.time < m.time ∧ admitted aimO l m = true ∧ admitted aimO (x :: l) m = false :=
  ⟨[wagerMv 1 3, observeMv 3 2 1, wagerMv 4 6, wagerMv 7 9], wagerMv 7 9, observeMv 6 5 1,
    rfl, rfl, by decide, by decide, by decide, by decide⟩

/-! ## Readings that tellings feed and that are not monotone -/

/-- **The verdict is not monotone.** An accepted delivery is rejected once a later witness
contests a condition. -/
theorem verdict_not_monotone :
    ∃ (l : List Move) (x : Move), told .request x.act = true ∧
      (board reqO l 9).standing = .accepted ∧ (board reqO (x :: l) 9).standing = .promised :=
  ⟨[mv .promise 2 1, mv .deliver 2 2, { mv .accept 9 3 with about := 2 }],
    { mv .reject 3 4 with about := 2, unmet := [1] }, rfl, by decide, by decide⟩

/-- **A resolution is not monotone.** A resolved report reopens once a later corroboration
arrives. -/
theorem resolution_not_monotone :
    ∃ (l : List Move) (x : Move), told .report x.act = true ∧
      (board repO l 9).standing = .resolved ∧ (board repO (x :: l) 9).standing = .open :=
  ⟨[mv .resolve 2 1], mv .corroborate 3 2, rfl, by decide, by decide⟩

/-! ## Witnessing climbs knowledge -/

theorem or_eq_right_of_imp {a a' : Bool} (h : a = true → a' = true) : (a || a') = a' := by
  cases a <;> cases a'
  · rfl
  · rfl
  · exact absurd (h rfl) Bool.false_ne_true
  · rfl

theorem joinK_ofSlots (a b a' b' : Bool) :
    Reading.joinK (Reading.ofSlots a b) (Reading.ofSlots a' b') = Reading.ofSlots (a || a') (b || b') := by
  unfold Reading.joinK
  rw [Reading.pos_ofSlots, Reading.neg_ofSlots, Reading.pos_ofSlots, Reading.neg_ofSlots]

/-- The truth-meet climbs knowledge in both arguments: FOUR is interlaced. -/
theorem meetT_climbs {a a' b b' : Reading} (ha : Reading.joinK a a' = a') (hb : Reading.joinK b b' = b') :
    Reading.joinK (Reading.meetT a b) (Reading.meetT a' b') = Reading.meetT a' b' := by
  have h1 : Reading.joinK (Reading.meetT a b) (Reading.meetT a' b) = Reading.meetT a' b :=
    readingInterlaced.meetT_kmono a a' b ha
  have h2 : Reading.joinK (Reading.meetT b a') (Reading.meetT b' a') = Reading.meetT b' a' :=
    readingInterlaced.meetT_kmono b b' a' hb
  rw [Reading.meetT_comm b a', Reading.meetT_comm b' a'] at h2
  calc Reading.joinK (Reading.meetT a b) (Reading.meetT a' b')
      = Reading.joinK (Reading.meetT a b) (Reading.joinK (Reading.meetT a' b) (Reading.meetT a' b')) := by rw [h2]
    _ = Reading.joinK (Reading.joinK (Reading.meetT a b) (Reading.meetT a' b)) (Reading.meetT a' b') := by
        rw [Reading.joinK_assoc]
    _ = Reading.joinK (Reading.meetT a' b) (Reading.meetT a' b') := by rw [h1]
    _ = Reading.meetT a' b' := h2

/-- A claim reads higher in `≤ₖ` to a reader that holds more tellings. -/
theorem claimReading_climbs (A A' : Told) (h : ∀ p, A p = true → A' p = true)
    (o : Opening) (sk : Skeleton) (d : Delivery) (c : Nat) :
    Reading.joinK (claimReading A o sk d c) (claimReading A' o sk d c) = claimReading A' o sk d c := by
  unfold claimReading
  rw [joinK_ofSlots, or_eq_right_of_imp (h _), or_eq_right_of_imp (h _)]

/-- **Witnessing climbs knowledge.** A delivery reads higher in `≤ₖ` to a reader that holds
more tellings. -/
theorem deliveryReading_climbs (A A' : Told) (h : ∀ p, A p = true → A' p = true)
    (o : Opening) (sk : Skeleton) (d : Delivery) :
    Reading.joinK (deliveryReading A o sk d) (deliveryReading A' o sk d) = deliveryReading A' o sk d := by
  unfold deliveryReading
  have step : ∀ (cs : List Nat) (r r' : Reading), Reading.joinK r r' = r' →
      Reading.joinK (cs.foldl (fun r c => Reading.meetT r (claimReading A o sk d c)) r)
        (cs.foldl (fun r c => Reading.meetT r (claimReading A' o sk d c)) r') =
      cs.foldl (fun r c => Reading.meetT r (claimReading A' o sk d c)) r' := by
    intro cs
    induction cs with
    | nil => intro r r' hr; exact hr
    | cons c cs ih =>
      intro r r' hr
      exact ih _ _ (meetT_climbs hr (claimReading_climbs A A' h o sk d c))
  exact step _ _ _ (Reading.joinK_idem _)

/-! ## Sealing suffices, for the arena -/

/-- The board depends on a reader's tellings only as a set. -/
theorem readout_congr (o : Opening) (b b' : Calm.Board (game o)) (T : Time)
    (hs : b.state = b'.state) (hr : b.refused = b'.refused) (ht : ∀ x, x ∈ b.told ↔ x ∈ b'.told) :
    readout o b T = readout o b' T := by
  have hA : b.told.any = b'.told.any := funext (Calm.any_congr ht)
  have hans : Calm.setOf ((b.told.filter (fun m => m.act == .answer)).map (·.player)) =
      Calm.setOf ((b'.told.filter (fun m => m.act == .answer)).map (·.player)) := by
    apply Calm.setOf_congr
    intro y
    constructor
    · intro hy
      have ⟨x, hx, e⟩ := (Calm.mem_map_iff _ _ y).mp hy
      have r := Calm.mem_of_mem_filter hx
      exact (Calm.mem_map_iff _ _ y).mpr ⟨x, Calm.mem_filter_of ((ht x).mp r.1) r.2, e⟩
    · intro hy
      have ⟨x, hx, e⟩ := (Calm.mem_map_iff _ _ y).mp hy
      have r := Calm.mem_of_mem_filter hx
      exact (Calm.mem_map_iff _ _ y).mpr ⟨x, Calm.mem_filter_of ((ht x).mpr r.1) r.2, e⟩
  unfold readout
  rw [hs, hr, hA, hans]

/-- **Sealing suffices, for the work arena.** Let a reader apply a thread's moves as they
arrive, with distinct times, all by `T`. Suppose every coordinated move arrives after every move
timestamped before it; tellings may arrive anywhere. Then the reader's board is the board of
the sealed replay. -/
theorem board_of_sealed_arrival (o : Opening) (a : List Move) (T : Time)
    (hT : ∀ m, m ∈ a → m.time ≤ T)
    (hd : a.Pairwise (fun x y => x.time ≠ y.time))
    (hseal : ∀ p m q, a = p ++ m :: q → (game o).told m = false →
      ∀ x, x ∈ a → x.time < m.time → x ∈ p) :
    readout o (Calm.play (game o) a) T = board o a T := by
  have hf : a.filter (fun m => decide (m.time ≤ T)) = a :=
    Calm.filter_eq_self _ a (fun x hx => decide_eq_true (hT x hx))
  have ⟨hs, hr, ht⟩ := Calm.sealed_arrival_eq_sorted (game o) a hd hseal
  unfold board
  rw [hf]
  exact readout_congr o _ _ T hs hr ht

end ObsmetrologiaComputing.WorkArena
