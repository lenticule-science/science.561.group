import Lean
import Obsmetrologia
open Lean Elab Command Meta

/-! Watched concept-names: a theorem is a candidate iff its type or value uses any
constant matching (by name or by house-namespace prefix) one of these seven. -/
def watchNames : List Name := [
  ``Obsmetrologia.ClosureRegime,
  ``Obsmetrologia.ClosureRegimeData,
  ``Obsmetrologia.classify,
  ``Obsmetrologia.cohomologyVanishes,
  ``Obsmetrologia.Flow.CurvatureRegime.IsFlat,
  ``Obsmetrologia.Flow.CurvatureRegime.IsCurved,
  ``Obsmetrologia.Ord.regimeOfOrdHonest
]

/-- Classifiers that compute a `ClosureRegime` from an ordinal rather than from
`ClosureRegimeData` flags — `regimeOfOrdHonest` plus its two-flag sibling
`regimeOfOrd` found beside it in `Closure/Ordinal.lean`. -/
def derivedClassifierNames : List Name := [
  ``Obsmetrologia.Ord.regimeOfOrd,
  ``Obsmetrologia.Ord.regimeOfOrdHonest
]

def isHouse (n : Name) : Bool := n.toString.startsWith "Obsmetrologia."

/-- `n` is `target` itself, or sits under `target`'s namespace (a constructor,
projection, or method — e.g. `ClosureRegime.strict` under `ClosureRegime`). -/
def nameUnder (target n : Name) : Bool :=
  n == target || n.toString.startsWith (target.toString ++ ".")

/-- Whether `n` matches any watched concept-name. -/
def isWatched (n : Name) : Bool := watchNames.any (nameUnder · n)

/-- Dedupe and sort a name list for stable, replayable output. -/
def dedupSortNames (l : List Name) : List Name := Id.run do
  let mut acc : Array Name := #[]
  for x in l do
    if !acc.contains x then acc := acc.push x
  return (acc.qsort (fun a b => a.toString < b.toString)).toList

/-- Tab-joined `toString` of a name list, already deduped/sorted by the caller. -/
def namesTsv (l : List Name) : String := String.intercalate "," (l.map toString)

/-- A def is a **concrete regime datum**: its declared type, with no leading `∀`/`→`,
is exactly `ClosureRegimeData` — a fully-applied zero-argument literal
(`spineData`, `Flow.NSCFiring.nscRegimeData`, `Cohomology.ScottFace.regimeData`), as
opposed to a parameterized constructor (`inflationRegimeData`,
`RegimeCofinality.regimeDataOfCountableFiring`, `Scott.regimeData`) that still needs
arguments to become one. -/
def isConcreteRegimeDatum (env : Environment) (n : Name) : Bool :=
  match env.find? n with
  | some (.defnInfo info) =>
      if info.type.isForall then false
      else
        match info.type.getAppFn with
        | .const nm _ => nm == ``Obsmetrologia.ClosureRegimeData
        | _ => false
  | _ => false

/-- The `countableCofinality` field (structure position 2, after `scottContinuous` and
`finiteBase`) of a concrete regime datum's value, read off its `ClosureRegimeData.mk`
application — `none` if the value is not literally a `.mk` application or the field is
not a literal `Bool`. -/
def countableCofinalityFlag (env : Environment) (n : Name) : Option Bool := do
  let ci ← env.find? n
  let v ← ci.value?
  if !v.getAppFn.isConstOf ``Obsmetrologia.ClosureRegimeData.mk then none
  else
    let args := v.getAppArgs
    let arg ← args[2]?
    if arg.isConstOf ``Bool.false then some false
    else if arg.isConstOf ``Bool.true then some true
    else none

/-- Transitive closure of house (`Obsmetrologia.*`) constants reachable from `n`,
following `ConstantInfo.getUsedConstantsAsSet` (type ∪ value) — the same
cycle-guarded shape as `sitesOf` in `census-set-of-identification-sites.lean`,
generalized from "sites" to the whole reachable set. -/
partial def closureOf (env : Environment) (cache : IO.Ref (Std.HashMap Name (Array Name)))
    (n : Name) : IO (Array Name) := do
  if let some s := (← cache.get).get? n then return s
  cache.modify (·.insert n #[])
  let some ci := env.find? n | return #[]
  let used := ci.getUsedConstantsAsSet
  let mut acc : Array Name := #[]
  for u in used.toList do
    if isHouse u then
      if !acc.contains u then acc := acc.push u
      for s in (← closureOf env cache u) do
        if !acc.contains s then acc := acc.push s
  cache.modify (·.insert n acc)
  return acc

/-- Names of the theorem's outermost bound variables whose type is `ClosureRegime` or
`ClosureRegimeData` — "the regime is a parameter" (`Meta.forallTelescope` peels the
leading `∀`-binders; a failure to telescope a pathological type reports no binders
rather than crashing the whole census). -/
def regimeBinderNames (type : Expr) : MetaM (Array Name) :=
  try
    forallTelescope type fun xs _ => do
      let mut names := #[]
      for x in xs do
        let decl ← x.fvarId!.getDecl
        match decl.type.getAppFn with
        | .const nm _ =>
            if nm == ``Obsmetrologia.ClosureRegime || nm == ``Obsmetrologia.ClosureRegimeData then
              names := names.push nm
        | _ => pure ()
      return names
  catch _ => pure #[]

#eval show CommandElabM Unit from do
  let env ← getEnv
  let cache ← IO.mkRef ({} : Std.HashMap Name (Array Name))
  -- #datum lines: every concrete ClosureRegimeData literal in the whole library.
  let datumNames := env.constants.toList.filterMap fun (n, _) =>
    if isHouse n && !n.isInternal && isConcreteRegimeDatum env n then some n else none
  for n in (dedupSortNames datumNames) do
    let cofStr := match countableCofinalityFlag env n with
      | some false => "false"
      | some true => "true"
      | none => "unknown"
    IO.println s!"#datum\t{n}\t{cofStr}"
  -- Theorem rows: every Obsmetrologia theorem whose type or value uses a watched name.
  let mut rows : Array String := #[]
  for (n, ci) in env.constants.toList do
    if isHouse n && !n.isInternal then
      if let .thmInfo info := ci then
        let used := ci.getUsedConstantsAsSet
        let directWatched := dedupSortNames (used.toList.filter isWatched)
        if !directWatched.isEmpty then
          let binders ← liftCoreM <| MetaM.run' <| regimeBinderNames info.type
          let hyp := !binders.isEmpty
          let closure ← closureOf env cache n
          let handBuilt := dedupSortNames (closure.toList.filter (isConcreteRegimeDatum env))
          let derived := dedupSortNames (closure.toList.filter (fun c => derivedClassifierNames.contains c))
          let typeUsed := info.type.getUsedConstantsAsSet
          let aperiodic := typeUsed.toList.any (· == ``Obsmetrologia.ClosureRegime.aperiodic)
          let hypBinders := dedupSortNames binders.toList
          let row := s!"{n}\t{if hyp then 1 else 0}\t{namesTsv hypBinders}\t{namesTsv handBuilt}\t{namesTsv derived}\t{namesTsv directWatched}\t{if aperiodic then 1 else 0}"
          rows := rows.push row
  for r in rows.qsort (· < ·) do IO.println r
