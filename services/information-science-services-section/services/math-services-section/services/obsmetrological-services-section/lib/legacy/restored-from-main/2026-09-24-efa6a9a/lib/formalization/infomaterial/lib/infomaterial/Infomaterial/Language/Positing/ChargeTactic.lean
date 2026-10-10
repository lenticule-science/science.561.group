import Lean.Elab.Tactic
import Infomaterial.Language.Positing.Charge

/-!
# Positing.ChargeTactic

A small finite-table tactic for the Infomaterial `Charge`/FOUR/gauge stratum.

`charge` is intentionally humble: it repeatedly case-splits local variables whose
types are the finite carriers used by the charge tables, then closes the resulting
ground goals by definitional reduction, `decide`, or a curated simplification set
for charge and gauge operations.
-/

namespace Infomaterial

namespace ChargeTactic

open Lean Elab Tactic Meta

/-- The inductive finite types this tactic is allowed to split directly. -/
def finiteTypeNames : List Name :=
  [``Bool,
   ``Articulating.Corner,
   Name.str (Name.str Name.anonymous "Infomaterial") "Generator",
   Name.str (Name.str Name.anonymous "Infomaterial") "Regime",
   Name.str (Name.str (Name.str (Name.str Name.anonymous "Infomaterial") "Positing") "Gauge") "K4",
   Name.str (Name.str (Name.str Name.anonymous "Infomaterial") "D4") "D8"]

/-- True when a type is one of the charge-adjacent finite carriers. -/
def isFiniteChargeType (type : Expr) : MetaM Bool := do
  let type <- whnf type
  if <- isDefEq type (mkConst ``Charge) then
    return true
  if <- isDefEq type (mkConst ``Bool) then
    return true
  match type.getAppFn with
  | Expr.const ``Prod _ =>
      match type.getAppArgs with
      | #[a, b] =>
          return (← isDefEq a (mkConst ``Bool)) && (← isDefEq b (mkConst ``Bool))
      | _ => return false
  | Expr.const n _ =>
      return finiteTypeNames.contains n
  | _ => return false

/-- Find the next local variable that should be split. -/
def findFiniteLocal? : TacticM (Option Name) := withMainContext do
  let lctx <- Lean.MonadLCtx.getLCtx
  lctx.foldlM (fun acc decl => do
    match acc with
    | some _ => return acc
    | none =>
        if decl.isImplementationDetail then
          return none
        else if <- isFiniteChargeType decl.type then
          return some decl.userName
        else
          return none) (none : Option Name)

/-- Repeatedly split finite charge-adjacent locals in every open goal. -/
partial def splitFiniteLocals : TacticM Unit := withMainContext do
  match <- findFiniteLocal? with
  | none => pure ()
  | some n =>
      let ident := mkIdent n
      evalTactic (← `(tactic| cases $ident:ident))
      let goals <- getGoals
      let mut out : List MVarId := []
      for goal in goals do
        setGoals [goal]
        splitFiniteLocals
        out := out ++ (← getGoals)
      setGoals out

/-- Close all current goals after finite splitting. -/
def closeGroundGoals : TacticM Unit := do
  evalTactic (← `(tactic|
    all_goals try simp_all [
      Charge.pos, Charge.neg, Charge.ofSlots,
      Charge.kBot, Charge.kTop, Charge.tTop, Charge.tBot,
      Charge.joinK, Charge.meetK, Charge.joinT, Charge.meetT,
      Charge.negate, Charge.leK, Charge.leT,
      Articulating.Corner.toStatus, Articulating.Corner.ofStatus]))
  evalTactic (← `(tactic| all_goals first | rfl | decide | assumption))

end ChargeTactic

syntax "charge" : tactic

elab_rules : tactic
  | `(tactic| charge) => do
      ChargeTactic.splitFiniteLocals
      ChargeTactic.closeGroundGoals

section Examples

example (a b : Charge) : Charge.joinK a b = Charge.joinK b a := by
  charge

example (a b c : Charge) :
    Charge.meetK a (Charge.joinK b c) = Charge.joinK (Charge.meetK a b) (Charge.meetK a c) := by
  charge

end Examples

end Infomaterial
