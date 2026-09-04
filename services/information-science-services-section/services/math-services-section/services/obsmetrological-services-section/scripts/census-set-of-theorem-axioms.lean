import Lean
import Obsmetrologia
open Lean Elab Command in
#eval show CommandElabM Unit from do
  let env ← getEnv
  let names := env.constants.toList.filterMap fun (n, ci) =>
    match ci with
    | .thmInfo _ => if n.toString.startsWith "Obsmetrologia." && !n.isInternal then some n else none
    | _ => none
  let mut rows : Array String := #[]
  for n in names do
    let axs ← liftCoreM (collectAxioms n)
    rows := rows.push s!"{n}\t{String.intercalate "," (axs.map toString).toList}"
  for r in rows.qsort (· < ·) do IO.println r
