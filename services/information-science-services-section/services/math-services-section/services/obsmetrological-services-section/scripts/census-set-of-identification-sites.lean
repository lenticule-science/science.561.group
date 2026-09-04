import Lean
import Obsmetrologia
open Lean Elab Command

/-- Names whose direct use marks a stipulated identification (a quotient construction or its axiom). -/
def quotNames : List Name := [``Quot.sound, ``Quot.mk, ``Quot.lift, ``Quot.ind, ``Quot.rec, ``Quot.recOn, ``Quot.hrecOn, ``Quotient.mk, ``Quotient.mk', ``Quotient.sound, ``Quotient.lift, ``Quotient.ind, ``Quotient.rec, ``Quotient.recOn, ``Quotient.exact, ``Quotient.lift₂]

def isHouse (n : Name) : Bool := n.toString.startsWith "Obsmetrologia."

partial def sitesOf (env : Environment) (cache : IO.Ref (Std.HashMap Name (Array Name))) (n : Name) : IO (Array Name) := do
  if let some s := (← cache.get).get? n then return s
  cache.modify (·.insert n #[])  -- cycle guard
  let some ci := env.find? n | return #[]
  let used := ci.getUsedConstantsAsSet
  let mut acc : Array Name := #[]
  if used.toList.any (fun u => quotNames.contains u) then acc := acc.push n
  for u in used.toList do
    if isHouse u then
      for s in (← sitesOf env cache u) do
        if !acc.contains s then acc := acc.push s
  cache.modify (·.insert n acc)
  return acc

#eval show CommandElabM Unit from do
  let env ← getEnv
  let cache ← IO.mkRef ({} : Std.HashMap Name (Array Name))
  let mut sites : Std.HashSet Name := {}
  let mut rows : Array String := #[]
  for (n, ci) in env.constants.toList do
    if isHouse n && !n.isInternal then
      let s ← sitesOf env cache n
      for x in s do sites := sites.insert x
      if let .thmInfo _ := ci then
        rows := rows.push s!"{n}\t{s.size}\t{String.intercalate "," (s.map toString).toList}"
  IO.println s!"#sites\t{sites.size}"
  for x in (sites.toArray.qsort (fun a b => a.toString < b.toString)) do IO.println s!"#site\t{x}"
  for r in rows.qsort (· < ·) do IO.println r
