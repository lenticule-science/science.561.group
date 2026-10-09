import ObsmetrologiaEconomics.BarrierSeries

/-!
# FloatDesk — the order in which the float desk refuses a draw, and what it prices

Specification: the Tidepool protocol, revision 3, section A3 (the draw, overdue and void, pricing) and
Appendix A.7 (`FloatDeskV1.draw`, `markOverdue`, `voidUnreleased`, `priceOf`); Appendix B row `FloatDeskV1`.

`FloatDeskV1.draw` answers a request by running a fixed sequence of checks and refusing at the first one
that fails, by a named error. This module states that sequence as a function over `Nat` (`drawAdmitted`),
proves that the order is the order (each refusal is reached only when every earlier check passed), that
admission is exactly the conjunction of the checks (`drawAdmitted_eq_admitted_iff`), that an admitted draw
keeps the member inside the line (`exposure_le_line`), the pool inside its cap (`pool_cap_respected`) and
the float above the barrier over the whole horizon (`draw_never_crosses_barrier_over_horizon`, which
composes `BarrierSeries.draw_safe`), and what the desk charges (`pricePerson`, `priceBusiness`).

* **The order.** `feeUnknown`, `termOutOfRange`, `exceedsLine`, `agentCap`, `poolCap`, `writeoff`,
  `crossesBarrier`, then `admitted`. The contract's uptime check (`SequencerDown`) precedes all of them and
  reads no argument of this function; the repayment-authorization check, the pricing and `lendFloat` come
  after admission and are not refusals in this sense. The function is total: a refusal is a value of the
  type `Refusal`, the revert's error selector in the realizer.
* **The checks.** `feeAvoided = 0` is `FeeAvoidedUnknown`. `minTerm ≤ term ≤ maxTerm` is the term window;
  `termOf now dueDate` is `dueDate − now` guarded (`0` when the due date is not in the future, so with a
  charter `minTerm ≥ 1` a past or present due date is `termOutOfRange`: `past_due_refused`). `exceedsLine`
  is `limit < amount + openExp`, the exposure rule. `agentCap` is `cap < amount`, `poolCap` is
  `poolCap < lent + amount`, `writeoff` is `budget < writeoff` (the budget is exhausted when the trailing
  loss *exceeds* it). `crossesBarrier` is `drawSafe = false`. Caps that do not bind a member kind are passed
  as a value no draw reaches (the realizer passes `type(uint256).max` for `cap` of a person or cell, and a
  `writeoff` of `0` for a kind the budget does not pause); the function does not know the kind.
* **The horizon.** `horizonSafe` is `BarrierSeries.drawSafe` on `[now / 86400, (dueDate + settlementWindow)
  / 86400]`: the draw is treated as unpaid throughout, as the specification says. `amount ≤ float` is the
  hypothesis `drawSafe` already carries; the vectors treat `drawSafe` as an input boolean.
* **Overdue and void** are stated over a small record (`Desk`: one draw with its member's exposure and stale
  flag, and the cell list), where `markOverdue` changes exactly three things (status, the stale flag, one
  cell appended) and `voidUnreleased` releases the draw's exposure and changes status and one cell.
  Subtractions carry their hypothesis (`amount ≤ openExposure`).
* **`uint256`.** `amount + openExp`, `lent + amount` and the products in the prices are `Nat` here. The
  contract's sums are checked (an overflow reverts with a panic, never an `admitted`), and the prices use
  full-precision `mulDiv`. The `drawAdmitted` vectors do carry sums at or above `2^256` (the rows of `drawBoundaryRows`): in `Nat` they are refused as `exceedsLine` or `poolCap`, and the realizer must reach the same answer without a panic.
-/

namespace Obsmetrologia
namespace Economics
namespace FloatDesk

open BarrierSeries

/-! ## The refusal order -/

/-- Why a draw was refused, in the order the desk checks; `admitted` is the absence of a refusal. -/
inductive Refusal where
  | feeUnknown
  | termOutOfRange
  | exceedsLine
  | agentCap
  | poolCap
  | writeoff
  | crossesBarrier
  | admitted
  deriving Repr, DecidableEq

/-- The term of a draw: `dueDate − now`, `0` when the due date is not in the future (no truncated
subtraction stands in for a revert: the guard says which side is taken). -/
def termOf (now dueDate : Nat) : Nat := if now ≤ dueDate then dueDate - now else 0

theorem termOf_of_le {now dueDate : Nat} (h : now ≤ dueDate) : termOf now dueDate = dueDate - now := by
  simp [termOf, h]

theorem termOf_of_lt {now dueDate : Nat} (h : dueDate < now) : termOf now dueDate = 0 := by
  have : ¬ now ≤ dueDate := Nat.not_le.2 h
  simp [termOf, this]

/-- The ordered refusal function of `FloatDeskV1.draw`.
Arguments: `feeAvoided`, `term`, `minTerm`, `maxTerm`, `amount`, `openExp` (the member's open exposure),
`limit` (the member's limit), `cap` (the per-agent cap), `lent` (the pool's lent float), `poolCap`,
`writeoff` (the trailing writeoff), `budget` (the writeoff budget), `drawSafe` (the barrier horizon check). -/
def drawAdmitted (feeAvoided term minTerm maxTerm amount openExp limit cap lent poolCap writeoff budget : Nat)
    (drawSafe : Bool) : Refusal :=
  if feeAvoided = 0 then .feeUnknown
  else if term < minTerm ∨ maxTerm < term then .termOutOfRange
  else if limit < amount + openExp then .exceedsLine
  else if cap < amount then .agentCap
  else if poolCap < lent + amount then .poolCap
  else if budget < writeoff then .writeoff
  else if drawSafe = false then .crossesBarrier
  else .admitted

section Order

variable {feeAvoided term minTerm maxTerm amount openExp limit cap lent poolCap writeoff budget : Nat}
  {safe : Bool}

theorem feeUnknown_first (h : feeAvoided = 0) :
    drawAdmitted feeAvoided term minTerm maxTerm amount openExp limit cap lent poolCap writeoff budget safe
      = .feeUnknown := by
  simp [drawAdmitted, h]

theorem termOutOfRange_second (h0 : feeAvoided ≠ 0) (h : term < minTerm ∨ maxTerm < term) :
    drawAdmitted feeAvoided term minTerm maxTerm amount openExp limit cap lent poolCap writeoff budget safe
      = .termOutOfRange := by
  simp [drawAdmitted, h0, h]

theorem exceedsLine_third (h0 : feeAvoided ≠ 0) (ht : ¬ (term < minTerm ∨ maxTerm < term))
    (h : limit < amount + openExp) :
    drawAdmitted feeAvoided term minTerm maxTerm amount openExp limit cap lent poolCap writeoff budget safe
      = .exceedsLine := by
  simp [drawAdmitted, h0, ht, h]

theorem agentCap_fourth (h0 : feeAvoided ≠ 0) (ht : ¬ (term < minTerm ∨ maxTerm < term))
    (hl : ¬ limit < amount + openExp) (h : cap < amount) :
    drawAdmitted feeAvoided term minTerm maxTerm amount openExp limit cap lent poolCap writeoff budget safe
      = .agentCap := by
  simp [drawAdmitted, h0, ht, hl, h]

theorem poolCap_fifth (h0 : feeAvoided ≠ 0) (ht : ¬ (term < minTerm ∨ maxTerm < term))
    (hl : ¬ limit < amount + openExp) (ha : ¬ cap < amount) (h : poolCap < lent + amount) :
    drawAdmitted feeAvoided term minTerm maxTerm amount openExp limit cap lent poolCap writeoff budget safe
      = .poolCap := by
  simp [drawAdmitted, h0, ht, hl, ha, h]

theorem writeoff_sixth (h0 : feeAvoided ≠ 0) (ht : ¬ (term < minTerm ∨ maxTerm < term))
    (hl : ¬ limit < amount + openExp) (ha : ¬ cap < amount) (hp : ¬ poolCap < lent + amount)
    (h : budget < writeoff) :
    drawAdmitted feeAvoided term minTerm maxTerm amount openExp limit cap lent poolCap writeoff budget safe
      = .writeoff := by
  simp [drawAdmitted, h0, ht, hl, ha, hp, h]

theorem crossesBarrier_last (h0 : feeAvoided ≠ 0) (ht : ¬ (term < minTerm ∨ maxTerm < term))
    (hl : ¬ limit < amount + openExp) (ha : ¬ cap < amount) (hp : ¬ poolCap < lent + amount)
    (hw : ¬ budget < writeoff) (h : safe = false) :
    drawAdmitted feeAvoided term minTerm maxTerm amount openExp limit cap lent poolCap writeoff budget safe
      = .crossesBarrier := by
  simp [drawAdmitted, h0, ht, hl, ha, hp, hw, h]

/-- **Admission is the conjunction of the checks.** -/
theorem drawAdmitted_eq_admitted_iff :
    drawAdmitted feeAvoided term minTerm maxTerm amount openExp limit cap lent poolCap writeoff budget safe
        = .admitted ↔
      (feeAvoided ≠ 0 ∧ minTerm ≤ term ∧ term ≤ maxTerm ∧ amount + openExp ≤ limit ∧ amount ≤ cap ∧
        lent + amount ≤ poolCap ∧ writeoff ≤ budget ∧ safe = true) := by
  unfold drawAdmitted
  constructor
  · intro h
    split at h
    · cases h
    split at h
    · cases h
    split at h
    · cases h
    split at h
    · cases h
    split at h
    · cases h
    split at h
    · cases h
    split at h
    · cases h
    rename_i a b c d e f g
    refine ⟨a, ?_, ?_, ?_, ?_, ?_, ?_, ?_⟩
    · exact Nat.le_of_not_lt (fun h' => b (Or.inl h'))
    · exact Nat.le_of_not_lt (fun h' => b (Or.inr h'))
    · exact Nat.le_of_not_lt c
    · exact Nat.le_of_not_lt d
    · exact Nat.le_of_not_lt e
    · exact Nat.le_of_not_lt f
    · cases safe
      · exact absurd rfl g
      · rfl
  · rintro ⟨a, b, c, d, e, f, g, h⟩
    rw [if_neg a, if_neg (fun hh => hh.elim (Nat.not_lt.2 b) (Nat.not_lt.2 c)), if_neg (Nat.not_lt.2 d),
      if_neg (Nat.not_lt.2 e), if_neg (Nat.not_lt.2 f), if_neg (Nat.not_lt.2 g), if_neg (by simp [h])]

/-- Every request gets exactly one of the eight answers, and `admitted` is the only answer that moves money. -/
theorem drawAdmitted_cases :
    drawAdmitted feeAvoided term minTerm maxTerm amount openExp limit cap lent poolCap writeoff budget safe
        = .admitted ∨
      drawAdmitted feeAvoided term minTerm maxTerm amount openExp limit cap lent poolCap writeoff budget safe
        ≠ .admitted := by
  by_cases h : drawAdmitted feeAvoided term minTerm maxTerm amount openExp limit cap lent poolCap writeoff
      budget safe = .admitted
  · exact Or.inl h
  · exact Or.inr h

/-- **The exposure rule.** An admitted draw keeps the member's exposure within the limit, and the limit is
`min line cap` of the member's line: so within the line, and within the exposure cap. -/
theorem exposure_le_limit
    (h : drawAdmitted feeAvoided term minTerm maxTerm amount openExp limit cap lent poolCap writeoff budget
      safe = .admitted) : amount + openExp ≤ limit :=
  ((drawAdmitted_eq_admitted_iff).1 h).2.2.2.1

/-- **`exposure_le_line`.** With `limit ≤ line` (the limit is `min line capShare`), an admitted draw leaves
`amount + openExposure ≤ line`. -/
theorem exposure_le_line {line : Nat} (hl : limit ≤ line)
    (h : drawAdmitted feeAvoided term minTerm maxTerm amount openExp limit cap lent poolCap writeoff budget
      safe = .admitted) : amount + openExp ≤ line :=
  Nat.le_trans (exposure_le_limit h) hl

/-- The limit as the specification forms it: `min line capShare`. -/
def limitOf (line capShare : Nat) : Nat := min line capShare

theorem exposure_le_line_of_min {line capShare : Nat}
    (h : drawAdmitted feeAvoided term minTerm maxTerm amount openExp (limitOf line capShare) cap lent poolCap
      writeoff budget safe = .admitted) : amount + openExp ≤ line :=
  exposure_le_line (Nat.min_le_left _ _) h

theorem exposure_le_capShare {line capShare : Nat}
    (h : drawAdmitted feeAvoided term minTerm maxTerm amount openExp (limitOf line capShare) cap lent poolCap
      writeoff budget safe = .admitted) : amount + openExp ≤ capShare :=
  Nat.le_trans (exposure_le_limit h) (Nat.min_le_right _ _)

/-- An admitted draw keeps the pool's lent float within its utilization cap. -/
theorem pool_cap_respected
    (h : drawAdmitted feeAvoided term minTerm maxTerm amount openExp limit cap lent poolCap writeoff budget
      safe = .admitted) : lent + amount ≤ poolCap :=
  ((drawAdmitted_eq_admitted_iff).1 h).2.2.2.2.2.1

/-- An admitted draw is within the term window. -/
theorem term_in_range
    (h : drawAdmitted feeAvoided term minTerm maxTerm amount openExp limit cap lent poolCap writeoff budget
      safe = .admitted) : minTerm ≤ term ∧ term ≤ maxTerm :=
  let h' := (drawAdmitted_eq_admitted_iff).1 h
  ⟨h'.2.1, h'.2.2.1⟩

/-- An unknown fee is refused whatever else is true: the first check cannot be bypassed. -/
theorem fee_zero_never_admitted (h : feeAvoided = 0) :
    drawAdmitted feeAvoided term minTerm maxTerm amount openExp limit cap lent poolCap writeoff budget safe
      ≠ .admitted := by
  rw [feeUnknown_first h]; intro e; cases e

/-- With a charter `minTerm ≥ 1`, a due date that is not in the future is refused `termOutOfRange` (when the
fee is known). -/
theorem past_due_refused {now dueDate : Nat} (hm : 0 < minTerm) (hle : dueDate ≤ now) (h0 : feeAvoided ≠ 0) :
    drawAdmitted feeAvoided (termOf now dueDate) minTerm maxTerm amount openExp limit cap lent poolCap
      writeoff budget safe = .termOutOfRange := by
  apply termOutOfRange_second h0
  refine Or.inl ?_
  by_cases hlt : dueDate < now
  · rw [termOf_of_lt hlt]; exact hm
  · have : dueDate = now := Nat.le_antisymm hle (Nat.not_lt.1 hlt)
    subst this
    rw [termOf_of_le (Nat.le_refl _), Nat.sub_self]; exact hm

end Order

/-! ## The barrier horizon -/

/-- The horizon check of `draw`: the float after the draw covers the barrier on every UTC day from `now`
through `dueDate + settlementWindow`, the draw treated as unpaid throughout. -/
def horizonSafe (float amount : Nat) (h : amount ≤ float) (leadSeconds floor ceiling : Nat)
    (obs : List Obligation) (now dueDate settlementWindow : Nat) : Bool :=
  drawSafe float amount h leadSeconds floor ceiling obs (now / 86400) ((dueDate + settlementWindow) / 86400)

section Horizon

variable {feeAvoided term minTerm maxTerm amount openExp limit cap lent poolCap writeoff budget : Nat}

/-- **`draw_never_crosses_barrier_over_horizon`.** If the desk admits a draw whose barrier check is
`horizonSafe`, then on every UTC day from `now / 86400` through `(dueDate + settlementWindow) / 86400` the
float left after the draw is at least the barrier. Composes `BarrierSeries.draw_safe`. The draw is within
the float (`h : amount ≤ float`), the hypothesis `drawSafe` carries. -/
theorem draw_never_crosses_barrier_over_horizon (float : Nat) (h : amount ≤ float)
    (leadSeconds floor ceiling : Nat) (obs : List Obligation) (now dueDate settlementWindow : Nat)
    (hadm : drawAdmitted feeAvoided term minTerm maxTerm amount openExp limit cap lent poolCap writeoff budget
      (horizonSafe float amount h leadSeconds floor ceiling obs now dueDate settlementWindow) = .admitted) :
    ∀ d, now / 86400 ≤ d → d ≤ (dueDate + settlementWindow) / 86400 →
      float - amount ≥ barrierAt leadSeconds floor ceiling obs d :=
  draw_safe float amount h leadSeconds floor ceiling obs _ _
    (((drawAdmitted_eq_admitted_iff).1 hadm).2.2.2.2.2.2.2)

/-- The converse: a draw refused at the barrier (every earlier check having passed) leaves less than the
barrier on some day of the horizon, so `CrossesBarrier` names a real crossing. -/
theorem crosses_barrier_is_real (float : Nat) (h : amount ≤ float) (leadSeconds floor ceiling : Nat)
    (obs : List Obligation) (now dueDate settlementWindow : Nat)
    (h0 : feeAvoided ≠ 0) (ht : ¬ (term < minTerm ∨ maxTerm < term))
    (hl : ¬ limit < amount + openExp) (ha : ¬ cap < amount) (hp : ¬ poolCap < lent + amount)
    (hw : ¬ budget < writeoff)
    (hr : drawAdmitted feeAvoided term minTerm maxTerm amount openExp limit cap lent poolCap writeoff budget
      (horizonSafe float amount h leadSeconds floor ceiling obs now dueDate settlementWindow) = .crossesBarrier) :
    ∃ d, now / 86400 ≤ d ∧ d ≤ (dueDate + settlementWindow) / 86400 ∧
      float - amount < barrierAt leadSeconds floor ceiling obs d := by
  have hf : horizonSafe float amount h leadSeconds floor ceiling obs now dueDate settlementWindow = false := by
    cases hs : horizonSafe float amount h leadSeconds floor ceiling obs now dueDate settlementWindow
    · rfl
    · exfalso
      have : drawAdmitted feeAvoided term minTerm maxTerm amount openExp limit cap lent poolCap writeoff
          budget true = .crossesBarrier := by rw [← hs]; exact hr
      simp [drawAdmitted, h0, ht, hl, ha, hp, hw] at this
  exact draw_unsafe float amount h leadSeconds floor ceiling obs _ _ hf

end Horizon

/-! ## Pricing -/

/-- One year in seconds times ten thousand basis points: the denominator of a per-year basis-point price. -/
def yearBps : Nat := 365 * 86400 * 10000

/-- The optional person price (charter `personPriceCapBpsPerYear`): `amount × capBps × termSeconds /
(365 days × 1e4)`, rounded down. In v0.1 the cap is `0` and the price is `0`. -/
def pricePerson (capBpsPerYear amount termSeconds : Nat) : Nat :=
  amount * capBpsPerYear * termSeconds / (365 * 86400 * 10000)

theorem price_person_zero {capBpsPerYear : Nat} (h : capBpsPerYear = 0) (amount termSeconds : Nat) :
    pricePerson capBpsPerYear amount termSeconds = 0 := by
  simp [pricePerson, h]

/-- **`price_cap_respected`.** Rounding down: the price never exceeds the capped price,
`price × 365 days × 1e4 ≤ amount × capBps × termSeconds`, i.e. the annualized price is at most the cap. -/
theorem price_cap_respected (capBpsPerYear amount termSeconds : Nat) :
    pricePerson capBpsPerYear amount termSeconds * 365 * 86400 * 10000 ≤ amount * capBpsPerYear * termSeconds := by
  have e : pricePerson capBpsPerYear amount termSeconds * 365 * 86400 * 10000
      = pricePerson capBpsPerYear amount termSeconds * (365 * 86400 * 10000) := by
    rw [Nat.mul_assoc, Nat.mul_assoc]
  rw [e]
  exact Nat.div_mul_le_self _ _

/-- Rounding is down by less than one unit: one more unit of price would exceed the capped price. -/
theorem price_person_tight (capBpsPerYear amount termSeconds : Nat) :
    amount * capBpsPerYear * termSeconds < (pricePerson capBpsPerYear amount termSeconds + 1) * (365 * 86400 * 10000) := by
  have := Nat.lt_mul_div_succ (amount * capBpsPerYear * termSeconds) (b := 365 * 86400 * 10000) (by decide)
  unfold pricePerson
  calc _ < _ := this
    _ = _ := Nat.mul_comm _ _

/-- With a cap of at most `100%` a year and a term of at most a year, the price is at most the amount. -/
theorem price_person_le_amount {capBpsPerYear : Nat} (hc : capBpsPerYear ≤ 10000) (amount : Nat)
    {termSeconds : Nat} (ht : termSeconds ≤ 365 * 86400) :
    pricePerson capBpsPerYear amount termSeconds ≤ amount := by
  unfold pricePerson
  apply (Nat.div_le_iff_le_mul_add_pred (by decide : 0 < 365 * 86400 * 10000)).2
  have h1 : amount * capBpsPerYear * termSeconds ≤ amount * 10000 * (365 * 86400) :=
    Nat.mul_le_mul (Nat.mul_le_mul_left _ hc) ht
  have h2 : amount * 10000 * (365 * 86400) = amount * (365 * 86400 * 10000) := by
    rw [Nat.mul_assoc, Nat.mul_assoc, Nat.mul_comm 10000]
  have h3 : amount * (365 * 86400 * 10000) ≤ (365 * 86400 * 10000) * amount := by
    rw [Nat.mul_comm]; exact Nat.le_refl _
  omega

/-- The price is monotone in the amount and in the term. -/
theorem price_person_mono {capBpsPerYear a a' t t' : Nat} (ha : a ≤ a') (ht : t ≤ t') :
    pricePerson capBpsPerYear a t ≤ pricePerson capBpsPerYear a' t' := by
  unfold pricePerson
  exact Nat.div_le_div_right (Nat.mul_le_mul (Nat.mul_le_mul_right _ ha) ht)

/-- The business price (cells and agents): `max floor (feeAvoided × fractionBps / 1e4)`. -/
def priceBusiness (floor feeAvoided fractionBps : Nat) : Nat :=
  max floor (feeAvoided * fractionBps / 10000)

theorem price_business_ge_floor (floor feeAvoided fractionBps : Nat) :
    floor ≤ priceBusiness floor feeAvoided fractionBps := Nat.le_max_left _ _

theorem price_business_ge_fraction (floor feeAvoided fractionBps : Nat) :
    feeAvoided * fractionBps / 10000 ≤ priceBusiness floor feeAvoided fractionBps := Nat.le_max_right _ _

theorem price_business_cases (floor feeAvoided fractionBps : Nat) :
    priceBusiness floor feeAvoided fractionBps = floor ∨
      priceBusiness floor feeAvoided fractionBps = feeAvoided * fractionBps / 10000 := by
  unfold priceBusiness
  rcases Nat.le_total floor (feeAvoided * fractionBps / 10000) with h | h
  · exact Or.inr (Nat.max_eq_right h)
  · exact Or.inl (Nat.max_eq_left h)

theorem price_business_mono_fee {floor f f' fractionBps : Nat} (h : f ≤ f') :
    priceBusiness floor f fractionBps ≤ priceBusiness floor f' fractionBps := by
  unfold priceBusiness
  exact Nat.max_le.2 ⟨Nat.le_max_left _ _,
    Nat.le_trans (Nat.div_le_div_right (Nat.mul_le_mul_right _ h)) (Nat.le_max_right _ _)⟩

/-- A zero fee fraction leaves exactly the floor. -/
theorem price_business_zero_fraction (floor feeAvoided : Nat) :
    priceBusiness floor feeAvoided 0 = floor := by
  simp [priceBusiness]

/-- Who is borrowing; natural persons are admitted as `person`. -/
inductive Kind where
  | person
  | cell
  | agent
  deriving Repr, DecidableEq

/-- `priceOf`: persons the optional capped price (zero in v0.1), cells and agents the business price. -/
def priceOf (k : Kind) (capBpsPerYear floor fractionBps feeAvoided amount termSeconds : Nat) : Nat :=
  match k with
  | .person => pricePerson capBpsPerYear amount termSeconds
  | .cell => priceBusiness floor feeAvoided fractionBps
  | .agent => priceBusiness floor feeAvoided fractionBps

/-- In v0.1 (`personPriceCapBpsPerYear = 0`) a person is never charged, whatever the floor or the fee. -/
theorem person_free_in_v01 (floor fractionBps feeAvoided amount termSeconds : Nat) :
    priceOf .person 0 floor fractionBps feeAvoided amount termSeconds = 0 :=
  price_person_zero rfl _ _

/-! ## Overdue and void -/

/-- The status of a draw. -/
inductive Status where
  | absent
  | opened
  | matched
  | overdue
  | lateMatched
  | voided
  deriving Repr, DecidableEq

/-- The cells the desk tells about a draw. -/
inductive Told where
  | releasedTo
  | drawSettledBy
  | overdueAt
  | voidedAt
  | lateSettledAt
  deriving Repr, DecidableEq

/-- One draw and its member's bookkeeping, as far as `markOverdue` and `voidUnreleased` can touch it:
the draw's fields, the member's `openExposure` and `staleOpen`, and the cells told. -/
structure Desk where
  amount : Nat
  dueDate : Nat
  releasedAt : Nat
  status : Status
  provisional : Bool
  openExposure : Nat
  staleOpen : Bool
  cells : List Told
  deriving Repr, DecidableEq

/-- `markOverdue`: an open draw past `dueDate + relayGrace` becomes overdue, marks its member stale, and
tells `overdueAt`. Exactly those three effects; the exposure stays (a default held is still exposure). -/
def markOverdue (relayGrace now : Nat) (s : Desk) : Option Desk :=
  if s.status = .opened ∧ s.dueDate + relayGrace < now then
    some { s with status := .overdue, staleOpen := true, cells := s.cells ++ [.overdueAt] }
  else none

/-- **`overdue_changes_three_things`.** When `markOverdue` acts, the status becomes `overdue`, the stale flag
is set, and the cell list grows by exactly one cell (`overdueAt`, appended); every other field is unchanged. -/
theorem overdue_changes_three_things {relayGrace now : Nat} {s s' : Desk}
    (h : markOverdue relayGrace now s = some s') :
    s'.status = .overdue ∧ s'.staleOpen = true ∧ s'.cells = s.cells ++ [.overdueAt] ∧
      s'.cells.length = s.cells.length + 1 ∧
      s'.amount = s.amount ∧ s'.dueDate = s.dueDate ∧ s'.releasedAt = s.releasedAt ∧
      s'.provisional = s.provisional ∧ s'.openExposure = s.openExposure := by
  unfold markOverdue at h
  split at h
  · cases h
    simp
  · cases h

/-- It acts only on an open draw past grace. -/
theorem markOverdue_requires {relayGrace now : Nat} {s s' : Desk}
    (h : markOverdue relayGrace now s = some s') :
    s.status = .opened ∧ s.dueDate + relayGrace < now := by
  unfold markOverdue at h
  split at h
  · assumption
  · cases h

/-- Overdue marks once: a second call on the result does nothing. -/
theorem markOverdue_idempotent {relayGrace now : Nat} {s s' : Desk}
    (h : markOverdue relayGrace now s = some s') : markOverdue relayGrace now s' = none := by
  have h1 := (overdue_changes_three_things h).1
  unfold markOverdue
  simp [h1]

/-- `voidUnreleased`: a draw whose foreign release was not witnessed within `releaseWindow` is voided, its
exposure released, and `voidedAt` told. `h` carries the subtraction's hypothesis (`amount ≤ openExposure`:
the member's exposure includes this draw). -/
def voidUnreleased (releaseWindow now : Nat) (s : Desk) (_h : s.amount ≤ s.openExposure) : Option Desk :=
  if s.status = .opened ∧ s.provisional = true ∧ s.releasedAt + releaseWindow < now then
    some { s with status := .voided, openExposure := s.openExposure - s.amount,
                  cells := s.cells ++ [.voidedAt] }
  else none

/-- **`void_releases_exposure`.** A voided draw's amount leaves the member's exposure exactly
(`openExposure' + amount = openExposure`), the status is `voided`, one cell is told, the stale flag and the
draw's own fields are unchanged. -/
theorem void_releases_exposure {releaseWindow now : Nat} {s s' : Desk} {h : s.amount ≤ s.openExposure}
    (hv : voidUnreleased releaseWindow now s h = some s') :
    s'.openExposure + s.amount = s.openExposure ∧ s'.status = .voided ∧
      s'.cells = s.cells ++ [.voidedAt] ∧ s'.staleOpen = s.staleOpen ∧ s'.amount = s.amount := by
  unfold voidUnreleased at hv
  split at hv
  · cases hv
    refine ⟨?_, rfl, rfl, rfl, rfl⟩
    exact Nat.sub_add_cancel h
  · cases hv

/-- A voided draw does not go overdue afterwards. -/
theorem void_then_no_overdue {releaseWindow relayGrace now now' : Nat} {s s' : Desk} {h : s.amount ≤ s.openExposure}
    (hv : voidUnreleased releaseWindow now s h = some s') : markOverdue relayGrace now' s' = none := by
  have h1 := (void_releases_exposure hv).2.1
  unfold markOverdue
  simp [h1]

/-! ## The house cases -/

-- A person draw of 30 against a line of 100 with nothing open, a one-week term in a 3-30 day window.
example : drawAdmitted 50 (7 * 86400) (3 * 86400) (30 * 86400) 30 0 100 1000000 0 1000 0 10 true
    = .admitted := by decide
-- unknown fee first, even though the term is also out of range
example : drawAdmitted 0 5 (3 * 86400) (30 * 86400) 30 0 100 1000000 0 1000 0 10 true = .feeUnknown := by decide
-- term out of range (a minute) before the line
example : drawAdmitted 50 60 (3 * 86400) (30 * 86400) 300 0 100 1000000 0 1000 0 10 true
    = .termOutOfRange := by decide
-- the line: 80 + 30 > 100
example : drawAdmitted 50 (7 * 86400) (3 * 86400) (30 * 86400) 30 80 100 1000000 0 1000 0 10 true
    = .exceedsLine := by decide
-- exactly at the line is admitted
example : drawAdmitted 50 (7 * 86400) (3 * 86400) (30 * 86400) 20 80 100 1000000 0 1000 0 10 true
    = .admitted := by decide
example : drawAdmitted 50 (7 * 86400) (3 * 86400) (30 * 86400) 30 0 100 20 0 1000 0 10 true = .agentCap := by decide
example : drawAdmitted 50 (7 * 86400) (3 * 86400) (30 * 86400) 30 0 100 1000000 980 1000 0 10 true
    = .poolCap := by decide
example : drawAdmitted 50 (7 * 86400) (3 * 86400) (30 * 86400) 30 0 100 1000000 0 1000 11 10 true
    = .writeoff := by decide
example : drawAdmitted 50 (7 * 86400) (3 * 86400) (30 * 86400) 30 0 100 1000000 0 1000 10 10 false
    = .crossesBarrier := by decide
-- the line is checked before the barrier: both fail, the line is named
example : drawAdmitted 50 (7 * 86400) (3 * 86400) (30 * 86400) 300 0 100 1000000 0 1000 0 10 false
    = .exceedsLine := by decide

-- the barrier horizon on the `BarrierSeries` house obligations (three of 30 due unix day 20721, ten days'
-- lead, floor 20; the barrier is 110 on days 20711 to 20721): float 200 less 90 clears it, less 100 does not
example : horizonSafe 200 90 (by decide) (10 * 86400) 20 1000000 houseObs (20700 * 86400) (20721 * 86400) 0
    = true := by decide
example : horizonSafe 200 91 (by decide) (10 * 86400) 20 1000000 houseObs (20700 * 86400) (20721 * 86400) 0
    = false := by decide

example : pricePerson 0 1000000 (30 * 86400) = 0 := by decide
example : pricePerson 1200 1000000 (30 * 86400) = 9863 := by decide
example : pricePerson 1200 1000000 (365 * 86400) = 120000 := by decide
example : priceBusiness 50 1000 500 = 50 := by decide
example : priceBusiness 50 10000 500 = 500 := by decide

end FloatDesk
end Economics
end Obsmetrologia
