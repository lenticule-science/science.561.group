/-
# `checknames` — the naming honesty gate

A mechanical guard, sibling to `checkdecls`, against the recurring faithfulness failure where a
declaration's *name* claims a logical connective its *statement* never delivers — e.g.
`h1_zero_iff_confluent` named `_iff_` while the Lean is a plain conjunction with no `↔` in it, or
`clinv_zero_iff_settles` whose `↔` is genuinely false (the converse fails).

The rule: if a declaration name claims `iff` (resp. `eq`) as its outermost conclusion connective,
then the statement's conclusion must genuinely *contain* an `Iff` (resp. an equality) — as the
head, or inside a conjunction `∧` (and, for `eq`, inside an `∃` body or as the left side of a
characterization `lhs = rhs ↔ P`). Infomaterial has several meaningful equalities (`classicalEq` t/f,
`paraconsistentEq` ⊤/⊥, Lean `Eq`, `CohEquiv`, the orders `≤ₖ`/`≤ₜ`), so a name promising `=`/`↔`
must actually prove one. The "outermost connective" is the rightmost `iff`/`eq` underscore-token
before any `of` token (tokens after `_of_` describe hypotheses).

This catches the name-overclaims-statement class precisely; it does NOT (and cannot) catch a
trivial proof under a correctly-shaped grand name — that remains the human honesty judgment.

Run: `lake exe checknames` (wired into `make check`). Exit 0 = clean, 1 = violations.
-/
import Lean
import Infomaterial

open Lean

namespace CheckNames

/-- The ultimate conclusion: peel `∀`/`→` binders. (Loose bvars are fine — we read heads only.) -/
partial def conclusion : Expr → Expr
  | .forallE _ _ b _ => conclusion b
  | e => e

/-- A short description of a conclusion head, for the error message. -/
def headDesc (e : Expr) : String :=
  match (conclusion e).getAppFn with
  | .const c _ => s!"`{c}`"
  | .sort _ => "a sort"
  | .forallE .. => "a Pi"
  | _ => "a non-constant head"

/-- Does the conclusion genuinely contain an `Iff` — as head, or inside a top-level `∧`/`∃`? -/
partial def hasIff (e : Expr) : Bool :=
  let c := conclusion e
  let h := c.getAppFn
  if h.isConstOf ``Iff then true
  else if h.isConstOf ``And then
    (c.getAppArgs[0]?.any hasIff) || (c.getAppArgs[1]?.any hasIff)
  else if h.isConstOf ``Exists then
    match c.getAppArgs[1]? with
    | some (Expr.lam _ _ b _) => hasIff b
    | _ => false
  else false

/-- Is `e`'s head an equality (`Eq`/`HEq`)? -/
def isEqHead (e : Expr) : Bool := e.getAppFn.isConstOf ``Eq || e.getAppFn.isConstOf ``HEq

/-- Does the conclusion genuinely contain an equality — as head, inside `∧`/`∃`, or as the left
side of a characterization `lhs = rhs ↔ P` (Mathlib's `mk_eq`/`Quotient.eq` idiom)? -/
partial def hasEq (e : Expr) : Bool :=
  let c := conclusion e
  let h := c.getAppFn
  if isEqHead c then true
  else if h.isConstOf ``And then
    (c.getAppArgs[0]?.any hasEq) || (c.getAppArgs[1]?.any hasEq)
  else if h.isConstOf ``Exists then
    match c.getAppArgs[1]? with
    | some (Expr.lam _ _ b _) => hasEq b
    | _ => false
  else if h.isConstOf ``Iff then
    c.getAppArgs[0]?.any isEqHead
  else false

/-- The last (string) component of a name. -/
def lastComp : Name → String
  | .str _ s => s
  | _ => ""

/-- The connective the name claims as its conclusion's shape, if any: the rightmost of the
`iff`/`eq` underscore-tokens occurring before any `of` token. -/
def claimedConnective (n : Name) : Option String := Id.run do
  let parts := (lastComp n).splitOn "_"
  let descParts :=
    match parts.findIdx? (· == "of") with
    | some i => parts.take i
    | none => parts
  let mut conn : Option String := none
  for p in descParts do
    if p == "iff" || p == "eq" then conn := some p
  return conn

/-- Conclusions whose name's `eq`/`iff` token is genuinely conceptual rather than a shape claim
(a keystone packaged as a named `…Eq…` Prop-structure). Kept tiny and documented. -/
def exempt : List Name :=
  [``Infomaterial.twistoring_eq_commutating]   -- `: TwistoringEqCommutating`, the bundled keystone

/-- Check only user-facing theorems/defs in the `Infomaterial` namespace, minus exemptions. -/
def shouldCheck (n : Name) (ci : ConstantInfo) : Bool :=
  (`Infomaterial).isPrefixOf n
    && !n.isInternalDetail
    && !(exempt.contains n)
    && (match ci with | .thmInfo _ => true | .defnInfo _ => true | _ => false)

/-- Words that assert a *proved proposition*. A `def` carrying one is making a theorem-claim in
its name while being a definition — it should be a `theorem`, or be renamed for the object it
constructs. (A `Prop`-valued predicate definition like `Confluent`/`CClosed` is fine — those
*name the property*, they don't assert it holds.) -/
def claimWords : List String := ["complete", "classifies", "recovers", "holds", "sound", "is"]

/-- Is `n` a `def` whose name asserts a proved proposition (a `claimWords` token as an
underscore-part)? -/
def defClaimsTheorem (n : Name) (ci : ConstantInfo) : Bool :=
  match ci with
  | .defnInfo _ => ((lastComp n).splitOn "_").any claimWords.contains
  | _ => false

unsafe def run : IO UInt32 := do
  initSearchPath (← findSysroot)
  let env ← importModules #[{ module := `Infomaterial }] {} (trustLevel := 1024)
  let violations : Array String := env.constants.fold (fun acc n ci =>
    if shouldCheck n ci then
      match claimedConnective n with
      | some conn =>
        let ok := if conn == "iff" then hasIff ci.type else hasEq ci.type
        if ok then acc
        else
          let want := if conn == "iff" then "`↔`" else "`=`"
          acc.push s!"  {n}\n      name claims `{conn}` but the statement contains no {want} \
            (conclusion head is {headDesc ci.type})"
      | none => acc
    else acc) #[]
  let defClaims : Array Name := env.constants.fold (fun acc n ci =>
    if (`Infomaterial).isPrefixOf n && !n.isInternalDetail && !(exempt.contains n)
        && defClaimsTheorem n ci then acc.push n else acc) #[]
  unless defClaims.isEmpty do
    IO.eprintln s!"checknames: {defClaims.size} def(s) named like a theorem-claim (advisory — \
      should each be a `theorem`, or renamed for the object it constructs?):"
    for n in defClaims do IO.eprintln s!"  {n}"
    IO.eprintln ""
  if violations.isEmpty then
    IO.println "checknames: OK — every iff/eq-named Infomaterial declaration delivers its claimed connective."
    return 0
  else
    IO.eprintln s!"checknames: {violations.size} naming violation(s) — \
      a name claims a connective the statement never delivers:\n"
    for v in violations do IO.eprintln v
    IO.eprintln "\nEither restate to deliver the connective, or rename to claim only what is proved."
    return 1

end CheckNames

unsafe def main : IO UInt32 := CheckNames.run
