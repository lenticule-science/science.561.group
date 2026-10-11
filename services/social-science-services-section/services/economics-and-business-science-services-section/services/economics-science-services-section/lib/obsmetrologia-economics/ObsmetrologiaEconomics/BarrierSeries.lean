/-!
# BarrierSeries — the pool barrier as a day-bucketed step function over declared obligations

`BarrierSeriesV1` keeps the pool's members' declared obligations (rent, tax, payroll: the
correlated outflows ahead of which the pool must hold float) and answers one question: *how much
float must stay in the pool on day `d`?* This module states that answer over `Nat`, with every
subtraction carrying its hypothesis, and proves the facts a contract and its callers rely on.

* **Days are UTC day buckets.** Times are unix seconds; a day is `t / 86400`. An obligation
  with due time `due` is *pending* on the days from `startDay leadSeconds due`
  (`(due − leadSeconds) / 86400`) through `due / 86400`, both inclusive, unless it is settled
  (`pending`). The window therefore covers the whole due day and ends at the start of the next
  one, as the `pool-service` series does (`end = due + 1 day`, exclusive). `leadSeconds` is a
  charter constant, not a per-obligation field. The subtraction is guarded: `startDay` is
  `(due − leadSeconds) / 86400` when `leadSeconds ≤ due` (`startDay_of_le`) and `0` otherwise,
  so a lead longer than the time since the epoch cannot wrap. The golden vectors carry only
  `leadSeconds ≤ due` rows, the domain of the `uint64` realization.
* **A member's counted contribution** is `min declared (min sleeve cap)` (`contribution`): never
  more than they declared, than their sleeve is worth, or than the per-member cap
  (`capOf bps float = bps * float / 10000`, at most `float` for `bps ≤ 10000`). The `amount` of
  an `Obligation` in `barrierAt` is that counted figure: `BarrierSeriesV1` stores the counted
  contribution beside the declared amount, and the series sums counted figures only.
* **The barrier** on day `d` is `min ceiling (floor + Σ pending counted amounts)` (`barrierAt`):
  never above the ceiling, so no barrier can forbid every draw (`barrier_le_ceiling`). A
  *contested* obligation counts while it is open, which is the conservative reading, so
  `contested` does not enter `pending`; only settlement removes an obligation from the sum.
* **A draw is safe** over a horizon `[fromDay, toDay]` when, on every day of it, the float
  left after the draw still covers the barrier (`drawSafe`, `draw_safe`). The horizon (to
  `due + settlementWindow`) is the caller's choice of `toDay`. A draw larger than the float is
  not in the domain: `drawSafe` takes `amount ≤ float` as a hypothesis, so `float − amount` is
  exact, and the golden vectors carry only rows satisfying it.

`breakpoints` are the days on which the series can change: each obligation contributes its
start day and the day after its due day. `barrierAt_step` proves the series is constant between
breakpoints, and `breakpoints_bounded` that at most 64 distinct days are active when at most 32
obligations are, so day buckets, not per-obligation slots, hold the series in 64 storage cells.

Everything is over `Nat` (unbounded). A `uint256` realization agrees on every input where
`floor + Σ pending` does not overflow; since each counted amount is at most the member cap, which is at
most the float, and a sum may be saturated at `ceiling` without changing `min ceiling _`, a
saturating add agrees on all inputs. `dueDate` is a `uint64`, so every day is below `2^64 / 86400`.
-/

namespace Obsmetrologia
namespace Economics
namespace BarrierSeries

/-- One declared obligation as the barrier reads it. `amount` is the member's counted
contribution; `due` is a unix time in seconds. -/
structure Obligation where
  due : Nat
  amount : Nat
  settled : Bool
  contested : Bool
  deriving Repr, DecidableEq

/-! ## Pending -/

/-- The first day an obligation is pending: `(due − leadSeconds) / 86400`, with the subtraction
guarded by `leadSeconds ≤ due` (the day is `0` otherwise). -/
def startDay (leadSeconds due : Nat) : Nat :=
  if leadSeconds ≤ due then (due - leadSeconds) / 86400 else 0

theorem startDay_of_le {leadSeconds due : Nat} (h : leadSeconds ≤ due) :
    startDay leadSeconds due = (due - leadSeconds) / 86400 := by
  simp [startDay, h]

/-- The last day an obligation is pending: its due day. -/
def endDay (due : Nat) : Nat := due / 86400

/-- The obligation is pending on `day`: unsettled, and `day` lies in `[startDay, endDay]`. -/
def pending (leadSeconds day : Nat) (o : Obligation) : Bool :=
  !o.settled && decide (startDay leadSeconds o.due ≤ day) && decide (day ≤ endDay o.due)

theorem pending_iff (leadSeconds d : Nat) (o : Obligation) :
    pending leadSeconds d o = true ↔
      o.settled = false ∧ startDay leadSeconds o.due ≤ d ∧ d ≤ endDay o.due := by
  simp [pending, Bool.and_eq_true, and_assoc]

/-- A settled obligation is never pending. -/
theorem pending_settled (leadSeconds d : Nat) (o : Obligation) (h : o.settled = true) :
    pending leadSeconds d o = false := by
  simp [pending, h]

/-- The obligation is pending on its due day (unsettled, with `leadSeconds ≤ due` not even needed:
the start day never passes the due day). -/
theorem pending_on_due_day (leadSeconds : Nat) (o : Obligation) (h : o.settled = false) :
    pending leadSeconds (endDay o.due) o = true := by
  rw [pending_iff]
  refine ⟨h, ?_, Nat.le_refl _⟩
  unfold startDay endDay
  split
  · exact Nat.div_le_div_right (Nat.sub_le _ _)
  · exact Nat.zero_le _

/-! ## Contribution -/

/-- A member's counted contribution: what they declared, bounded by their sleeve's value and the
per-member cap. -/
def contribution (declared sleeve cap : Nat) : Nat := min declared (min sleeve cap)

/-- The per-member cap: `bps` basis points of the available float. -/
def capOf (bps float : Nat) : Nat := bps * float / 10000

theorem member_contribution_le_sleeve (declared sleeve cap : Nat) :
    contribution declared sleeve cap ≤ sleeve := by
  unfold contribution; omega

theorem contribution_le_declared (declared sleeve cap : Nat) :
    contribution declared sleeve cap ≤ declared := by
  unfold contribution; omega

theorem contribution_le_cap (declared sleeve cap : Nat) :
    contribution declared sleeve cap ≤ cap := by
  unfold contribution; omega

/-- A contribution below all three bounds is the declared amount itself. -/
theorem contribution_eq_declared {declared sleeve cap : Nat}
    (h1 : declared ≤ sleeve) (h2 : declared ≤ cap) :
    contribution declared sleeve cap = declared := by
  unfold contribution; omega

theorem capOf_le_float {bps : Nat} (h : bps ≤ 10000) (float : Nat) : capOf bps float ≤ float := by
  unfold capOf
  have h1 : bps * float ≤ 10000 * float := Nat.mul_le_mul_right float h
  have h2 : bps * float / 10000 ≤ 10000 * float / 10000 := Nat.div_le_div_right h1
  have h3 : 10000 * float / 10000 = float := Nat.mul_div_cancel_left float (by decide)
  omega

/-- A contribution is at most the float when the cap is `capOf bps float` with `bps ≤ 10000`. -/
theorem contribution_le_float {bps : Nat} (h : bps ≤ 10000) (declared sleeve float : Nat) :
    contribution declared sleeve (capOf bps float) ≤ float :=
  Nat.le_trans (contribution_le_cap _ _ _) (capOf_le_float h float)

/-! ## The barrier -/

/-- The sum of the counted amounts of the obligations pending on `d`. -/
def pendingSum (leadSeconds d : Nat) : List Obligation → Nat
  | [] => 0
  | o :: os => (if pending leadSeconds d o then o.amount else 0) + pendingSum leadSeconds d os

@[simp] theorem pendingSum_nil (leadSeconds d : Nat) : pendingSum leadSeconds d [] = 0 := rfl
@[simp] theorem pendingSum_cons (leadSeconds d : Nat) (o : Obligation) (os : List Obligation) :
    pendingSum leadSeconds d (o :: os) =
      (if pending leadSeconds d o then o.amount else 0) + pendingSum leadSeconds d os := rfl

/-- **The barrier on day `d`**: the base floor plus the pending counted amounts, capped at the ceiling. -/
def barrierAt (leadSeconds floor ceiling : Nat) (obs : List Obligation) (d : Nat) : Nat :=
  min ceiling (floor + pendingSum leadSeconds d obs)

theorem barrier_le_ceiling (leadSeconds floor ceiling : Nat) (obs : List Obligation) (d : Nat) :
    barrierAt leadSeconds floor ceiling obs d ≤ ceiling := by
  unfold barrierAt; omega

/-- With nothing pending the barrier is the floor, capped at the ceiling. -/
theorem barrierAt_nil (leadSeconds floor ceiling d : Nat) :
    barrierAt leadSeconds floor ceiling [] d = min ceiling floor := by
  simp [barrierAt]

theorem barrierAt_ge_floor (leadSeconds floor ceiling : Nat) (obs : List Obligation) (d : Nat) :
    min ceiling floor ≤ barrierAt leadSeconds floor ceiling obs d := by
  unfold barrierAt; omega

/-- The pending sum only grows when obligations are added: a sublist's sum is at most the list's. -/
theorem pendingSum_sublist {leadSeconds d : Nat} {a b : List Obligation} (h : a.Sublist b) :
    pendingSum leadSeconds d a ≤ pendingSum leadSeconds d b := by
  induction h with
  | slnil => exact Nat.le_refl _
  | cons o _ ih => simp only [pendingSum_cons]; omega
  | cons_cons o _ ih => simp only [pendingSum_cons]; omega

/-- **The barrier is monotone in the pending set**: more obligations never lower it (declaring
raises, never lowers, the barrier on any day). -/
theorem barrierAt_monotone_pending {leadSeconds floor ceiling : Nat} {a b : List Obligation}
    (h : a.Sublist b) (d : Nat) :
    barrierAt leadSeconds floor ceiling a d ≤ barrierAt leadSeconds floor ceiling b d := by
  have := pendingSum_sublist (leadSeconds := leadSeconds) (d := d) h
  unfold barrierAt; omega

/-- Declaring one more obligation never lowers the barrier. -/
theorem barrierAt_declare_ge (leadSeconds floor ceiling : Nat) (o : Obligation)
    (obs : List Obligation) (d : Nat) :
    barrierAt leadSeconds floor ceiling obs d ≤ barrierAt leadSeconds floor ceiling (o :: obs) d :=
  barrierAt_monotone_pending (List.sublist_cons_self o obs) d

/-- Settling an obligation never raises the barrier on any day. -/
theorem barrierAt_settle_le (leadSeconds floor ceiling : Nat) (due amount : Nat) (c : Bool)
    (obs : List Obligation) (d : Nat) :
    barrierAt leadSeconds floor ceiling (⟨due, amount, true, c⟩ :: obs) d ≤
      barrierAt leadSeconds floor ceiling (⟨due, amount, false, c⟩ :: obs) d := by
  unfold barrierAt
  simp only [pendingSum_cons, pending_settled leadSeconds d ⟨due, amount, true, c⟩ rfl]
  by_cases hp : pending leadSeconds d ⟨due, amount, false, c⟩ = true <;> simp [hp] <;> omega

/-- A pending obligation of counted amount `a`, when the ceiling does not bind, raises the barrier by exactly `a`. -/
theorem barrierAt_declare_exact (leadSeconds floor ceiling : Nat) (o : Obligation)
    (obs : List Obligation) (d : Nat) (hp : pending leadSeconds d o = true)
    (hc : floor + pendingSum leadSeconds d obs + o.amount ≤ ceiling) :
    barrierAt leadSeconds floor ceiling (o :: obs) d =
      barrierAt leadSeconds floor ceiling obs d + o.amount := by
  unfold barrierAt
  simp only [pendingSum_cons, hp, if_true]
  omega

/-! ## Breakpoints -/

/-- The days on which the series can change: each obligation's start day and the day after its due day. -/
def breakpoints (leadSeconds : Nat) : List Obligation → List Nat
  | [] => []
  | o :: os => startDay leadSeconds o.due :: (endDay o.due + 1) :: breakpoints leadSeconds os

theorem breakpoints_length (leadSeconds : Nat) (obs : List Obligation) :
    (breakpoints leadSeconds obs).length = 2 * obs.length := by
  induction obs with
  | nil => rfl
  | cons o os ih => simp [breakpoints, ih]; omega

/-- Insert a day into a set of days kept without repeats. -/
def insertDay (d : Nat) (l : List Nat) : List Nat := if d ∈ l then l else d :: l

/-- The distinct days among `ds`. -/
def dayset (ds : List Nat) : List Nat := ds.foldr insertDay []

theorem insertDay_length_le (d : Nat) (l : List Nat) : (insertDay d l).length ≤ l.length + 1 := by
  unfold insertDay; split <;> simp

theorem mem_insertDay {x d : Nat} {l : List Nat} : x ∈ insertDay d l ↔ x = d ∨ x ∈ l := by
  unfold insertDay
  split
  · rename_i h; constructor
    · intro hx; exact Or.inr hx
    · rintro (rfl | hx); exact h; exact hx
  · simp

theorem dayset_length_le (ds : List Nat) : (dayset ds).length ≤ ds.length := by
  induction ds with
  | nil => simp [dayset]
  | cons d ds ih =>
    have := insertDay_length_le d (dayset ds)
    have e : dayset (d :: ds) = insertDay d (dayset ds) := rfl
    rw [e]
    simp only [List.length_cons]
    omega

theorem mem_dayset {x : Nat} {ds : List Nat} : x ∈ dayset ds ↔ x ∈ ds := by
  induction ds with
  | nil => simp [dayset]
  | cons d ds ih =>
    simp only [dayset, List.foldr_cons] at ih ⊢
    rw [mem_insertDay, ih]; simp

/-- **At most 64 distinct days are active** when at most 32 obligations are: the series lives in
day buckets, 64 of them, not in per-obligation slots. -/
theorem breakpoints_bounded (leadSeconds : Nat) (obs : List Obligation) (h : obs.length ≤ 32) :
    (dayset (breakpoints leadSeconds obs)).length ≤ 64 := by
  have h1 := dayset_length_le (breakpoints leadSeconds obs)
  have h2 := breakpoints_length leadSeconds obs
  omega

/-- A single obligation's pending status cannot change on a day in `(d, d']` unless a breakpoint lies there. -/
theorem pending_step {leadSeconds d d' : Nat} (o : Obligation) (hle : d ≤ d')
    (hs : ¬ (d < startDay leadSeconds o.due ∧ startDay leadSeconds o.due ≤ d'))
    (he : ¬ (d < endDay o.due + 1 ∧ endDay o.due + 1 ≤ d')) :
    pending leadSeconds d' o = pending leadSeconds d o := by
  have key : pending leadSeconds d' o = true ↔ pending leadSeconds d o = true := by
    rw [pending_iff, pending_iff]
    have hs1 : d < startDay leadSeconds o.due → d' < startDay leadSeconds o.due :=
      fun h1 => Nat.lt_of_not_ge (fun h2 => hs ⟨h1, h2⟩)
    have he1 : d < endDay o.due + 1 → d' < endDay o.due + 1 :=
      fun h1 => Nat.lt_of_not_ge (fun h2 => he ⟨h1, h2⟩)
    constructor
    · rintro ⟨a, b, c⟩
      exact ⟨a, Nat.ge_of_not_lt (fun h1 => Nat.lt_irrefl _ (Nat.lt_of_le_of_lt b (hs1 h1))),
        Nat.le_trans hle c⟩
    · rintro ⟨a, b, c⟩
      exact ⟨a, Nat.le_trans b hle, Nat.le_of_lt_succ (he1 (Nat.lt_succ_of_le c))⟩
  exact Bool.eq_iff_iff.2 key

theorem pendingSum_step {leadSeconds d d' : Nat} (hle : d ≤ d') :
    ∀ obs : List Obligation, (∀ b ∈ breakpoints leadSeconds obs, ¬ (d < b ∧ b ≤ d')) →
      pendingSum leadSeconds d' obs = pendingSum leadSeconds d obs
  | [], _ => rfl
  | o :: os, hb => by
    have hs := hb (startDay leadSeconds o.due) (by simp [breakpoints])
    have he := hb (endDay o.due + 1) (by simp [breakpoints])
    have hrest := pendingSum_step (leadSeconds := leadSeconds) hle os
      (fun b hb' => hb b (by simp only [breakpoints, List.mem_cons]; exact Or.inr (Or.inr hb')))
    simp only [pendingSum_cons]
    rw [pending_step o hle hs he, hrest]

/-- **The series is a step function**: between breakpoints the barrier does not move. -/
theorem barrierAt_step {leadSeconds floor ceiling d d' : Nat} (obs : List Obligation) (hle : d ≤ d')
    (hb : ∀ b ∈ breakpoints leadSeconds obs, ¬ (d < b ∧ b ≤ d')) :
    barrierAt leadSeconds floor ceiling obs d' = barrierAt leadSeconds floor ceiling obs d := by
  unfold barrierAt
  rw [pendingSum_step hle obs hb]

/-! ## Draw safety over a horizon -/

/-- The days `fromDay, …, toDay` (empty when `toDay < fromDay`). -/
def daysFrom (fromDay toDay : Nat) : List Nat := List.range' fromDay (toDay + 1 - fromDay)

theorem mem_daysFrom {fromDay toDay d : Nat} : d ∈ daysFrom fromDay toDay ↔ fromDay ≤ d ∧ d ≤ toDay := by
  unfold daysFrom
  rw [List.mem_range'_1]
  constructor
  · intro ⟨h1, h2⟩; exact ⟨h1, by omega⟩
  · intro ⟨h1, h2⟩; exact ⟨h1, by omega⟩

/-- The barrier stays within a projected float on every day of the horizon `[fromDay, toDay]`. -/
def projectedSafe (leadSeconds floor ceiling : Nat) (obs : List Obligation)
    (projected fromDay toDay : Nat) : Bool :=
  (daysFrom fromDay toDay).all fun d => decide (barrierAt leadSeconds floor ceiling obs d ≤ projected)

theorem projectedSafe_iff (leadSeconds floor ceiling : Nat) (obs : List Obligation)
    (projected fromDay toDay : Nat) :
    projectedSafe leadSeconds floor ceiling obs projected fromDay toDay = true ↔
      ∀ d, fromDay ≤ d → d ≤ toDay → barrierAt leadSeconds floor ceiling obs d ≤ projected := by
  unfold projectedSafe
  rw [List.all_eq_true]
  constructor
  · intro h d h1 h2
    have := h d (mem_daysFrom.2 ⟨h1, h2⟩)
    simpa using this
  · intro h d hd
    have := mem_daysFrom.1 hd
    simpa using h d this.1 this.2

/-- **Draw safety.** `drawSafe` asks the projected float, the float after the draw, to cover the
barrier on every day of the horizon. The draw is within the float (`h : amount ≤ float`), so the
projected float `float − amount` is exact. -/
def drawSafe (float amount : Nat) (_h : amount ≤ float) (leadSeconds floor ceiling : Nat)
    (obs : List Obligation) (fromDay toDay : Nat) : Bool :=
  projectedSafe leadSeconds floor ceiling obs (float - amount) fromDay toDay

/-- `drawSafe` is the safety of the projected float (the `wouldCross` view of the same question). -/
theorem drawSafe_eq_projected (float amount : Nat) (h : amount ≤ float) (leadSeconds floor ceiling : Nat)
    (obs : List Obligation) (fromDay toDay : Nat) :
    drawSafe float amount h leadSeconds floor ceiling obs fromDay toDay =
      projectedSafe leadSeconds floor ceiling obs (float - amount) fromDay toDay := rfl

/-- **`draw_safe`.** A safe draw leaves, on every day of the horizon, at least the barrier. -/
theorem draw_safe (float amount : Nat) (h : amount ≤ float) (leadSeconds floor ceiling : Nat)
    (obs : List Obligation) (fromDay toDay : Nat)
    (hs : drawSafe float amount h leadSeconds floor ceiling obs fromDay toDay = true) :
    ∀ d, fromDay ≤ d → d ≤ toDay → float - amount ≥ barrierAt leadSeconds floor ceiling obs d :=
  (projectedSafe_iff _ _ _ _ _ _ _).1 hs

/-- The first day of the horizon on which the projected float falls below the barrier. -/
def firstCrossing (leadSeconds floor ceiling : Nat) (obs : List Obligation)
    (projected fromDay toDay : Nat) : Option Nat :=
  (daysFrom fromDay toDay).find? fun d => decide (projected < barrierAt leadSeconds floor ceiling obs d)

theorem firstCrossing_none_iff (leadSeconds floor ceiling : Nat) (obs : List Obligation)
    (projected fromDay toDay : Nat) :
    firstCrossing leadSeconds floor ceiling obs projected fromDay toDay = none ↔
      projectedSafe leadSeconds floor ceiling obs projected fromDay toDay = true := by
  unfold firstCrossing projectedSafe
  rw [List.find?_eq_none, List.all_eq_true]
  simp

/-- The converse: a draw that is not safe leaves less than the barrier on some day of the horizon. -/
theorem draw_unsafe (float amount : Nat) (h : amount ≤ float) (leadSeconds floor ceiling : Nat)
    (obs : List Obligation) (fromDay toDay : Nat)
    (hs : drawSafe float amount h leadSeconds floor ceiling obs fromDay toDay = false) :
    ∃ d, fromDay ≤ d ∧ d ≤ toDay ∧ float - amount < barrierAt leadSeconds floor ceiling obs d := by
  have hf : firstCrossing leadSeconds floor ceiling obs (float - amount) fromDay toDay ≠ none := by
    intro hn
    have := (firstCrossing_none_iff _ _ _ _ _ _ _).1 hn
    rw [drawSafe_eq_projected] at hs
    rw [hs] at this
    cases this
  cases hc : firstCrossing leadSeconds floor ceiling obs (float - amount) fromDay toDay with
  | none => exact absurd hc hf
  | some d =>
    have hd := List.find?_some hc
    have hm := List.mem_of_find?_eq_some hc
    have hr := mem_daysFrom.1 hm
    exact ⟨d, hr.1, hr.2, by simpa using hd⟩

/-- A draw of nothing is safe exactly when the float already covers the barrier over the horizon. -/
theorem drawSafe_zero (float : Nat) (leadSeconds floor ceiling : Nat) (obs : List Obligation)
    (fromDay toDay : Nat) :
    drawSafe float 0 (Nat.zero_le _) leadSeconds floor ceiling obs fromDay toDay =
      projectedSafe leadSeconds floor ceiling obs float fromDay toDay := by
  simp [drawSafe]

/-- With a float at least the ceiling, a draw of nothing is safe on any horizon (no barrier can forbid every draw). -/
theorem drawSafe_zero_of_ceiling (float leadSeconds floor ceiling : Nat) (obs : List Obligation)
    (fromDay toDay : Nat) (h : ceiling ≤ float) :
    drawSafe float 0 (Nat.zero_le _) leadSeconds floor ceiling obs fromDay toDay = true := by
  rw [drawSafe_zero]
  exact (projectedSafe_iff _ _ _ _ _ _ _).2
    (fun d _ _ => Nat.le_trans (barrier_le_ceiling _ _ _ _ _) h)

/-- A larger projected float is never less safe. -/
theorem projectedSafe_mono {leadSeconds floor ceiling : Nat} {obs : List Obligation}
    {p q fromDay toDay : Nat} (hpq : p ≤ q)
    (h : projectedSafe leadSeconds floor ceiling obs p fromDay toDay = true) :
    projectedSafe leadSeconds floor ceiling obs q fromDay toDay = true := by
  rw [projectedSafe_iff] at h ⊢
  exact fun d h1 h2 => Nat.le_trans (h d h1 h2) hpq

/-- A smaller draw is never less safe. -/
theorem drawSafe_antitone (float a a' : Nat) (ha : a ≤ float) (ha' : a' ≤ a) (leadSeconds floor ceiling : Nat)
    (obs : List Obligation) (fromDay toDay : Nat)
    (h : drawSafe float a ha leadSeconds floor ceiling obs fromDay toDay = true) :
    drawSafe float a' (Nat.le_trans ha' ha) leadSeconds floor ceiling obs fromDay toDay = true :=
  projectedSafe_mono (by omega) h

/-! ## The house cases -/

/-- Three members each declaring 30, due 25 September 2026 (unix day 20721), lead ten days, floor 20:
the `pool-service` fixture at unix days. -/
def houseObs : List Obligation :=
  [⟨20721 * 86400, 30, false, false⟩, ⟨20721 * 86400, 30, false, false⟩, ⟨20721 * 86400, 30, false, false⟩]

example : barrierAt (10 * 86400) 20 1000000 houseObs (20721 - 25) = 20 := by decide
example : barrierAt (10 * 86400) 20 1000000 houseObs (20721 - 5) = 110 := by decide
example : barrierAt (10 * 86400) 20 1000000 houseObs (20721 - 10) = 110 := by decide
example : barrierAt (10 * 86400) 20 1000000 houseObs 20721 = 110 := by decide
example : barrierAt (10 * 86400) 20 1000000 houseObs (20721 + 1) = 20 := by decide
/-- The ceiling binds. -/
example : barrierAt (10 * 86400) 20 100 houseObs 20721 = 100 := by decide
/-- A draw of 10 against 55 of float crosses a barrier of 50; against 100 it does not. -/
example : projectedSafe (0) 50 1000 [] 45 20700 20710 = false := by decide
example : projectedSafe (0) 50 1000 [] 50 20700 20710 = true := by decide
/-- Settled obligations do not count. -/
example : barrierAt (10 * 86400) 20 1000000 [⟨20721 * 86400, 30, true, false⟩] 20721 = 20 := by decide
/-- Contested obligations count while open. -/
example : barrierAt (10 * 86400) 20 1000000 [⟨20721 * 86400, 30, false, true⟩] 20721 = 50 := by decide

end BarrierSeries
end Economics
end Obsmetrologia
