/-!
# Sleeve — principal high-water mark, routable yield, redeemable principal

Specification: the Tidepool protocol, revision 3, section 3 A1 (the member sleeve) and Appendix A.3
(`MemberSleeveV1.{routableYield, redeemablePrincipal}`), with Appendix B.

A sleeve holds one member's assets in an ERC-4626 vault under the member's name. Its state here is two
numbers: `value` (the sleeve's `totalValue()`, the vault assets its shares are worth) and `hwm` (the
principal high-water mark). What the sleeve may route to the treasury is the surplus above the mark,
never principal; what the owner may take out is bounded by the mark, the value and the vault's
`maxWithdraw`, and never by any pool state.

What this module fixes:

* **Routable yield** (`routableYield`, `routeYield`): with `hwm ≤ value` (the hypothesis `h` is carried
  by every definition that subtracts), `routableYield = value - hwm` and `routeYield = min maxA (value -
  hwm)`. `routeYield_preserves_principal`: what is left, `value - routeYield`, is at least `hwm`.
  `routeYield_le_surplus`, `routeYield_le_value`, `routeYield_zero_iff`.
* **Loss-aware mark** (`hwmAfterLoss`): `min hwm value`. `hwm_after_loss_le_value`, `hwm_after_loss_le_hwm`,
  `hwm_after_loss_idem`, `hwm_after_loss_of_le` (no loss: unchanged), `hwm_after_loss_of_lt` (a loss:
  the mark becomes the value), `hwm_after_loss_greatest`. After the lowering, `hwm ≤ value` holds, so the
  hypothesis of the routing definitions is discharged for any state: `hwm_after_loss_routable`.
  A post-loss recovery is therefore not mistaken for yield.
* **Redeemable principal** (`redeemable`): `min hwm (min value maxWithdraw)`. `redeem_le_redeemable`
  (an amount is within the bound exactly when it is within each of the three limits), and the other
  direction `redeemable_le_*`. `redeem_lowers_hwm`: `hwmAfterRedeem hwm out = hwm - min hwm out`, and
  for `out ≤ redeemable` it is `hwm - out`. `redeem_keeps_solvent`: a redemption within the bound keeps
  `hwm' ≤ value'`; `redeem_keeps_surplus`: and the surplus `value' - hwm'` is exactly what it was, so
  an owner exit never changes what is routable. `deposit_keeps_solvent` is the same for deposits.
* **Rounding** (`rounding_allowance`): the specification's invariant is `totalValue + roundingAllowance
  ≥ HWM` after routing, where the allowance is one share's worth of assets. In this exact model the
  allowance is not needed; the theorem says any allowance suffices, and the EVM realizer tolerates one
  share of rounding where the vault's conversion rounds down.

**Open: `ShareValueMonotone`.** Nothing here says a vault's share price does not fall. That is the
vault-side assumption (the vault's `totalValue` is the sleeve's value, and a vault loss lowers it); the
module takes `value` as given at each step and proves what follows, and the loss-aware mark is the
reply to a fall, not a proof that none occurs. The assumption stays open.

Everything is over `Nat`, every subtraction carries its hypothesis, and no truncated subtraction stands
in for a revert. On `uint256` the realizer's `value - hwm` cannot underflow once `hwm ≤ value` is
established (the mark is lowered on every owner action first), and `min` never exceeds its arguments;
`deposit` adds, and `hwm + assets ≤ 2^256 - 1` is guaranteed by the vault's own supply bound.
-/

namespace Obsmetrologia
namespace Economics
namespace Sleeve

/-! ## Routable yield -/

/-- **The surplus above the mark**, with the hypothesis the subtraction carries. -/
def routableYield (value hwm : Nat) (_h : hwm ≤ value) : Nat := value - hwm

/-- **What `routeYield(maxA)` moves to the treasury**: at most `maxA`, at most the surplus. -/
def routeYield (value hwm maxA : Nat) (h : hwm ≤ value) : Nat :=
  min maxA (routableYield value hwm h)

theorem routeYield_le_surplus (value hwm maxA : Nat) (h : hwm ≤ value) :
    routeYield value hwm maxA h ≤ value - hwm := by
  unfold routeYield routableYield; omega

theorem routeYield_le_max (value hwm maxA : Nat) (h : hwm ≤ value) :
    routeYield value hwm maxA h ≤ maxA := by
  unfold routeYield routableYield; omega

theorem routeYield_le_value (value hwm maxA : Nat) (h : hwm ≤ value) :
    routeYield value hwm maxA h ≤ value := by
  have := routeYield_le_surplus value hwm maxA h; omega

/-- **Routing never touches principal.** What remains after the route is at least the mark. -/
theorem routeYield_preserves_principal (value hwm maxA : Nat) (h : hwm ≤ value) :
    value - routeYield value hwm maxA h ≥ hwm := by
  have := routeYield_le_surplus value hwm maxA h; omega

/-- Routing the whole surplus (any `maxA` at least the surplus) leaves exactly the mark. -/
theorem routeYield_all (value hwm maxA : Nat) (h : hwm ≤ value) (hm : value - hwm ≤ maxA) :
    value - routeYield value hwm maxA h = hwm := by
  unfold routeYield routableYield; omega

/-- Nothing routes exactly when there is no surplus or nothing was asked. -/
theorem routeYield_zero_iff (value hwm maxA : Nat) (h : hwm ≤ value) :
    routeYield value hwm maxA h = 0 ↔ maxA = 0 ∨ value = hwm := by
  unfold routeYield routableYield
  constructor <;> intro k <;> omega

/-- The routed amount is the surplus when asked for at least that much. -/
theorem routeYield_of_ge (value hwm maxA : Nat) (h : hwm ≤ value) (hm : value - hwm ≤ maxA) :
    routeYield value hwm maxA h = value - hwm := by
  unfold routeYield routableYield; omega

/-- **Rounding allowance.** The specification states the post-route invariant with one share of
rounding allowance; in this exact model any allowance suffices. -/
theorem rounding_allowance (value hwm maxA allowance : Nat) (h : hwm ≤ value) :
    (value - routeYield value hwm maxA h) + allowance ≥ hwm := by
  have := routeYield_preserves_principal value hwm maxA h; omega

/-! ## The loss-aware mark -/

/-- **The mark after an owner action sees the value**: lowered to the value when the value is below it. -/
def hwmAfterLoss (value hwm : Nat) : Nat := min hwm value

theorem hwm_after_loss_le_value (value hwm : Nat) : hwmAfterLoss value hwm ≤ value := by
  unfold hwmAfterLoss; omega

theorem hwm_after_loss_le_hwm (value hwm : Nat) : hwmAfterLoss value hwm ≤ hwm := by
  unfold hwmAfterLoss; omega

/-- The lowering is idempotent: a second look at the same value changes nothing. -/
theorem hwm_after_loss_idem (value hwm : Nat) :
    hwmAfterLoss value (hwmAfterLoss value hwm) = hwmAfterLoss value hwm := by
  unfold hwmAfterLoss; omega

/-- No loss, no change. -/
theorem hwm_after_loss_of_le (value hwm : Nat) (h : hwm ≤ value) : hwmAfterLoss value hwm = hwm := by
  unfold hwmAfterLoss; omega

/-- A loss: the mark becomes the value, so a recovery is not read as yield. -/
theorem hwm_after_loss_of_lt (value hwm : Nat) (h : value < hwm) : hwmAfterLoss value hwm = value := by
  unfold hwmAfterLoss; omega

/-- The greatest mark that is below both the old mark and the value. -/
theorem hwm_after_loss_greatest (value hwm x : Nat) (h1 : x ≤ hwm) (h2 : x ≤ value) :
    x ≤ hwmAfterLoss value hwm := by
  unfold hwmAfterLoss; omega

/-- **After the lowering the routing hypothesis holds**, in any state. -/
theorem hwm_after_loss_routable (value hwm : Nat) : hwmAfterLoss value hwm ≤ value :=
  hwm_after_loss_le_value value hwm

/-- Routing from the lowered mark is routing from a state with no hypothesis left to assume. -/
def routeAfterLoss (value hwm maxA : Nat) : Nat :=
  routeYield value (hwmAfterLoss value hwm) maxA (hwm_after_loss_le_value value hwm)

/-- **Routing after a loss never exceeds the old surplus** (a state under water routes nothing past
what the value supports). -/
theorem route_after_loss_le_value (value hwm maxA : Nat) : routeAfterLoss value hwm maxA ≤ value :=
  routeYield_le_value _ _ _ _

/-- With the mark under water the route after the lowering is zero. -/
theorem route_after_loss_zero (value hwm maxA : Nat) (h : value < hwm) :
    routeAfterLoss value hwm maxA = 0 := by
  unfold routeAfterLoss routeYield routableYield
  rw [hwm_after_loss_of_lt value hwm h]; omega

/-- The floored surplus the contract's `surplus()` view returns: zero when the sleeve is under water. -/
def surplus (value hwm : Nat) : Nat := if h : hwm ≤ value then routableYield value hwm h else 0

theorem surplus_of_le (value hwm : Nat) (h : hwm ≤ value) : surplus value hwm = value - hwm := by
  unfold surplus routableYield; simp [h]

theorem surplus_of_lt (value hwm : Nat) (h : value < hwm) : surplus value hwm = 0 := by
  unfold surplus; have : ¬ hwm ≤ value := by omega
  simp [this]

/-! ## Redeemable principal -/

/-- **What the owner may take out as principal**: within the mark, the value and the vault's limit. -/
def redeemable (hwm value maxWithdraw : Nat) : Nat := min hwm (min value maxWithdraw)

theorem redeemable_le_hwm (hwm value m : Nat) : redeemable hwm value m ≤ hwm := by
  unfold redeemable; omega
theorem redeemable_le_value (hwm value m : Nat) : redeemable hwm value m ≤ value := by
  unfold redeemable; omega
theorem redeemable_le_max (hwm value m : Nat) : redeemable hwm value m ≤ m := by
  unfold redeemable; omega

/-- **An amount is redeemable exactly when it is within the mark, the value and the vault's limit.**
Never gated by any other state: the pool is not a parameter. -/
theorem redeem_le_redeemable (hwm value m out : Nat) :
    out ≤ redeemable hwm value m ↔ out ≤ hwm ∧ out ≤ value ∧ out ≤ m := by
  unfold redeemable
  constructor
  · intro k; refine ⟨?_, ?_, ?_⟩ <;> omega
  · intro k; obtain ⟨a, b, c⟩ := k; omega

/-- **The mark after a redemption of `out`**: lowered by what was actually withdrawn, floored by `min`
so the subtraction is guarded. -/
def hwmAfterRedeem (hwm out : Nat) : Nat := hwm - min hwm out

theorem min_le_self' (hwm out : Nat) : min hwm out ≤ hwm := by omega

/-- **Redemption lowers the mark** by `min hwm out`. -/
theorem redeem_lowers_hwm (hwm out : Nat) : hwmAfterRedeem hwm out = hwm - min hwm out := rfl

theorem hwm_after_redeem_le (hwm out : Nat) : hwmAfterRedeem hwm out ≤ hwm := by
  unfold hwmAfterRedeem; omega

/-- Within the bound, the mark falls by exactly the amount. -/
theorem redeem_lowers_hwm_exact (hwm value m out : Nat) (h : out ≤ redeemable hwm value m) :
    hwmAfterRedeem hwm out = hwm - out := by
  have := (redeem_le_redeemable hwm value m out).mp h
  unfold hwmAfterRedeem; omega

/-- **An exit within the bound keeps the sleeve solvent**: the new mark is at most the new value. The
value subtraction carries `out ≤ value` from the bound. -/
theorem redeem_keeps_solvent (hwm value m out : Nat) (hs : hwm ≤ value)
    (h : out ≤ redeemable hwm value m) :
    hwmAfterRedeem hwm out ≤ value - out := by
  have := (redeem_le_redeemable hwm value m out).mp h
  unfold hwmAfterRedeem; omega

/-- **An exit within the bound does not change the surplus**: owner exits and routing do not interact. -/
theorem redeem_keeps_surplus (hwm value m out : Nat) (hs : hwm ≤ value)
    (h : out ≤ redeemable hwm value m) :
    (value - out) - hwmAfterRedeem hwm out = value - hwm := by
  have := (redeem_le_redeemable hwm value m out).mp h
  unfold hwmAfterRedeem; omega

/-- A deposit raises the value and the mark by the assets deposited, so solvency is kept. -/
theorem deposit_keeps_solvent (value hwm assets : Nat) (hs : hwm ≤ value) :
    hwm + assets ≤ value + assets := by omega

/-- **Redeeming everything redeemable when the vault is not the limit** takes the mark to zero. -/
theorem redeem_all_zeroes_hwm (hwm value m : Nat) (hv : hwm ≤ value) (hm : hwm ≤ m) :
    hwmAfterRedeem hwm (redeemable hwm value m) = 0 := by
  unfold hwmAfterRedeem redeemable; omega

/-! ## House cases -/

example : routableYield 120 100 (by decide) = 20 := by decide
example : routeYield 120 100 5 (by decide) = 5 := by decide
example : routeYield 120 100 50 (by decide) = 20 := by decide
example : routeYield 100 100 50 (by decide) = 0 := by decide
example : 120 - routeYield 120 100 50 (by decide) ≥ 100 := by decide
example : hwmAfterLoss 80 100 = 80 := by decide
example : hwmAfterLoss 120 100 = 100 := by decide
example : routeAfterLoss 80 100 7 = 0 := by decide
example : surplus 80 100 = 0 := by decide
example : surplus 120 100 = 20 := by decide
example : redeemable 100 120 30 = 30 := by decide
example : redeemable 100 80 90 = 80 := by decide
example : redeemable 100 120 200 = 100 := by decide
example : hwmAfterRedeem 100 30 = 70 := by decide
example : hwmAfterRedeem 100 130 = 0 := by decide

end Sleeve
end Economics
end Obsmetrologia
