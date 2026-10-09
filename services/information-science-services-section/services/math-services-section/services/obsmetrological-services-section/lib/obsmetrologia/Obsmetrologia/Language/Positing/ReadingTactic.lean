import Lean.Elab.Tactic
import Obsmetrologia.Language.Positing.Reading

/-!
# Positing.ReadingTactic

A small finite-table tactic for the Obsmetrologia `Reading`/FOUR/gauge stratum.

`reading` is intentionally humble: it repeatedly case-splits local variables whose
types are the finite carriers used by the reading tables, then closes the resulting
ground goals by definitional reduction, `decide`, or a curated simplification set
for reading and gauge operations.
-/

namespace Obsmetrologia

namespace ReadingTactic

open Lean Elab Tactic Meta

/-- The inductive finite types this tactic is allowed to split directly. -/
def finiteTypeNames : List Name :=
  [``Bool,
   ``Articulating.Corner,
   Name.str (Name.str Name.anonymous "Obsmetrologia") "Generator",
   Name.str (Name.str Name.anonymous "Obsmetrologia") "Regime",
   Name.str (Name.str (Name.str (Name.str Name.anonymous "Obsmetrologia") "Positing") "Gauge") "K4",
   Name.str (Name.str (Name.str Name.anonymous "Obsmetrologia") "D4") "D8"]

/-- True when a type is one of the reading-adjacent finite carriers. -/
def isFiniteReadingType (type : Expr) : MetaM Bool := do
  let type <- whnf type
  if <- isDefEq type (mkConst ``Reading) then
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
        else if <- isFiniteReadingType decl.type then
          return some decl.userName
        else
          return none) (none : Option Name)

/-- Repeatedly split finite reading-adjacent locals in every open goal. -/
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
      Reading.pos, Reading.neg, Reading.ofSlots,
      Reading.kBot, Reading.kTop, Reading.tTop, Reading.tBot,
      Reading.joinK, Reading.meetK, Reading.joinT, Reading.meetT,
      Reading.negate, Reading.leK, Reading.leT,
      Articulating.Corner.toStatus, Articulating.Corner.ofStatus]))
  evalTactic (← `(tactic| all_goals first | rfl | decide | assumption))

end ReadingTactic

syntax "reading" : tactic

elab_rules : tactic
  | `(tactic| reading) => do
      ReadingTactic.splitFiniteLocals
      ReadingTactic.closeGroundGoals

section Examples

example (a b : Reading) : Reading.joinK a b = Reading.joinK b a := by
  reading

example (a b c : Reading) :
    Reading.meetK a (Reading.joinK b c) = Reading.joinK (Reading.meetK a b) (Reading.meetK a c) := by
  reading

end Examples

end Obsmetrologia
