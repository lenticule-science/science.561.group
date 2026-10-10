/-
# `auditfrontier` — the axiom-hygiene gate

A mechanical guard on the corpus's own repeated claim — stated in `Obsmetrologia.lean`
("no free data" past `Mark`/`Articulating`) and echoed in dozens of individual docstrings
("Axiom-clean (propext, Quot.sound)", "choice-free", "no `Classical.choice` is incurred") —
that the library proves what it proves from Lean's kernel alone, not from smuggled-in
non-constructive or incomplete infrastructure.

The rule: for every declaration under the `Obsmetrologia` namespace, `Lean.collectAxioms`
must report nothing beyond `propext` and `Quot.sound`. `Classical.choice` is deliberately
**not** whitelisted — a "Lean core only, no free data" corpus that reached for choice would
be reaching past its own stated discipline, so this checker treats it as a violation like
any other. `sorryAx` is likewise never whitelisted in general: it is the kernel's own name
for an incomplete proof, so a bare violation on `sorryAx` is exactly how this catches a
sorry.

## What this run found (2026-08-05, gate reinstatement)

Two categories of axiom leak are already present on the tree and are recorded below as an
explicit, per-declaration, per-axiom whitelist — mirroring `scripts/CheckNames.lean`'s own
`inheritedDebt` precedent: named plainly, not silenced generically, so a *new* leak (a
different axiom, or the same axiom on a declaration not already listed) still fails the
gate.

1. **The known Collatz frontier `sorry`** — `Obsmetrologia/Closure/Collatz/SemigroupGap.lean`
   documents `parentBarrierGap_holds` as its one deliberate open `sorry` (the residue-gap
   frontier). `sorryAx` propagates from there into every declaration whose proof actually
   *invokes* it (as opposed to merely mentioning it in prose) — currently ten declarations
   across `Closure.Collatz`, `AperiodicOrder.Tiling`, and `AperiodicOrder.MaterialSectors`
   (the kappa-sector physics built on the same barrier gap). Listed in `knownFrontierSorry`.

2. **A newly surfaced `Classical.choice` leak — not previously documented.** Eighteen
   declarations across `Algebra.RingTactic`, `Language.Positing.ChargeTactic`,
   `AperiodicOrder.AffineHolonomy`, `AperiodicOrder.Tiling`, and
   `Calculus.LinearAlgebra.Vec` depend on `Classical.choice` despite none of them
   mentioning `Classical` anywhere in their own source. Traced (concretely, for
   `Obsmetrologia.LinearAlgebra.Vec.lcomb_add_coeff`, via `#print axioms` on each
   constant the elaborated proof term names) to a **Lean 4 core lemma**,
   `Nat.right_eq_add`, which itself depends on `Classical.choice` — a fact of the
   `Init` library this corpus imports, not a choice the corpus's own authors made. The
   dependency enters silently through ordinary `simp`/arithmetic normalization once a
   proof happens to rewrite through that lemma; it was not independently re-traced for
   all eighteen declarations, only confirmed present via `#print axioms` and consistent
   with the same `Nat`-arithmetic-normalization shape in each. This directly contradicts
   several of those files' own docstring claims (e.g. `RankNullity.lean`'s and
   `LinearAlgebra/Basic.lean`'s "choice-free" / "no `Classical.choice` is incurred"
   language) — a real, previously undocumented discrepancy between claim and kernel
   fact, recorded here rather than quietly absorbed. Listed in `inheritedChoiceDebt`.

Do not add to either list to silence a *fresh* mistake. Removing an entry (by proving the
declaration without the sorry, or routing its proof off the choice-dependent core lemma) is
always welcome; growing a list requires the same honesty this comment is trying to model —
say what leaked in, and why.

Run: `lake exe auditfrontier`. Exit 0 = clean (nothing beyond the allowed/whitelisted
axioms), 1 = a genuinely new leak.
-/
import Lean
import Obsmetrologia

open Lean

namespace AuditFrontier

/-- The only axioms this corpus admits as unconditionally fine: `propext` (propositional
extensionality) and `Quot.sound` (quotient soundness — what `funext` reduces to in Lean 4
core). Everything else, `Classical.choice` and `sorryAx` very much included, must be
justified per-declaration below or it is a violation. -/
def allowed : List Name := [``propext, ``Quot.sound]

/-- **Known Collatz frontier.** Declarations whose proof genuinely invokes
`Obsmetrologia.Closure.Collatz.parentBarrierGap_holds` (the one documented `sorry` in
`Closure/Collatz/SemigroupGap.lean`) and so carry `sorryAx` honestly, not accidentally. -/
def knownFrontierSorry : List Name :=
  [ ``Obsmetrologia.Closure.Collatz.parentBarrierGap_holds
  , ``Obsmetrologia.Closure.Collatz.parentBarrierResidueGap_holds
  , ``Obsmetrologia.Closure.Collatz.parentBarrierResidueCarryGap_holds
  , ``Obsmetrologia.AperiodicOrder.Tiling.parentBarrierTwoAdicCarryGap_holds
  , ``Obsmetrologia.AperiodicOrder.MaterialSectors.KappaSectorCharges.twoAdic_cylinderLiftGap
  , ``Obsmetrologia.AperiodicOrder.MaterialSectors.KappaSectorCharges.oneLock_iff_noPositiveInfiniteBarrierStream
  , ``Obsmetrologia.AperiodicOrder.MaterialSectors.KappaSectorCharges.full_shared_kappa_carrier_iff_frontierInputs
  , ``Obsmetrologia.AperiodicOrder.MaterialSectors.KappaSectorCharges.full_shared_kappa_carrier_iff_noPositiveInfiniteBarrierStream
  , ``Obsmetrologia.AperiodicOrder.MaterialSectors.KappaSectorCharges.full_shared_kappa_carrier_iff_oneLock
  , ``Obsmetrologia.AperiodicOrder.MaterialSectors.KappaSectorCharges.full_shared_kappa_carrier_iff_antimatter_barrier_boundary
  ]

/-- **Inherited `Classical.choice` debt**, discovered when this gate was reinstated
(2026-08-05). See the module docstring for the traced root cause (`Nat.right_eq_add` in
Lean 4 core). Not fixed here; recorded honestly instead of silently exempted. -/
def inheritedChoiceDebt : List Name :=
  [ ``Obsmetrologia.ChargeTactic.closeGroundGoals
  , ``Obsmetrologia.ChargeTactic.findFiniteLocal?
  , ``Obsmetrologia.ChargeTactic.splitFiniteLocals
  , ``Obsmetrologia.ChargeTactic.isFiniteChargeType
  , ``Obsmetrologia.AperiodicOrder.AffineHolonomy.act_compose
  , ``Obsmetrologia.AperiodicOrder.AffineHolonomy.compose_assoc
  , ``Obsmetrologia.AperiodicOrder.AffineHolonomy.rotate_preserves_add
  , ``Obsmetrologia.AperiodicOrder.AffineHolonomy.four_way_classification
  , ``Obsmetrologia.AperiodicOrder.Tiling.floppy_of_all_le_one
  , ``Obsmetrologia.Algebra.RingTactic.inferCommRingForTarget
  , ``Obsmetrologia.Algebra.RingTactic.findAtom?
  , ``Obsmetrologia.Algebra.RingTactic.quoteAtom
  , ``Obsmetrologia.Algebra.RingTactic.quoteExpr
  , ``Obsmetrologia.Algebra.RingTactic.isDefEqTo
  , ``Obsmetrologia.Algebra.RingTactic.evalCringInferred
  , ``Obsmetrologia.Algebra.RingTactic.evalCringWithExpr
  , ``Obsmetrologia.Algebra.RingTactic.evalCringWith
  , ``Obsmetrologia.LinearAlgebra.Vec.lcomb_add_coeff
  ]

/-- The one extra axiom a `knownFrontierSorry` entry is permitted, and no other. -/
def frontierExtra : List Name := [``sorryAx]

/-- The one extra axiom an `inheritedChoiceDebt` entry is permitted, and no other. -/
def choiceDebtExtra : List Name := [``Classical.choice]

/-- What `n` is permitted to carry beyond `allowed`, precisely — empty for every
declaration not on one of the two named lists above. A whitelisted declaration that picks
up some *other* axiom (not just the one it is documented for) is still a violation: this
is a per-axiom exemption, not a blanket bypass of the declaration. -/
def permittedExtra (n : Name) : List Name :=
  if knownFrontierSorry.contains n then frontierExtra
  else if inheritedChoiceDebt.contains n then choiceDebtExtra
  else []

/-- Only user-facing `Obsmetrologia` declarations that can themselves carry axiom
dependencies: theorems, defs, axioms, and opaques. Internal/auto-generated names
(`Name.isInternalDetail`) are skipped, matching `CheckNames.lean`'s own filter. -/
def shouldCheck (n : Name) (ci : ConstantInfo) : Bool :=
  (`Obsmetrologia).isPrefixOf n
    && !n.isInternalDetail
    && (match ci with
        | .thmInfo _ => true
        | .defnInfo _ => true
        | .axiomInfo _ => true
        | .opaqueInfo _ => true
        | _ => false)

/-- One declaration's genuine violation: the axioms it depends on beyond `allowed` and
beyond whatever `permittedExtra` names for it. -/
def violatingExtra (n : Name) (axs : Array Name) : Array Name :=
  let permitted := permittedExtra n
  axs.filter (fun a => !(allowed.contains a) && !(permitted.contains a))

unsafe def run : IO UInt32 := do
  initSearchPath (← findSysroot)
  let env ← importModules #[{ module := `Obsmetrologia }] {} (trustLevel := 1024)
  let coreCtx : Core.Context := { fileName := "auditfrontier", fileMap := Lean.FileMap.ofString "" }
  let coreState : Core.State := { env := env }
  let names : Array Name :=
    env.constants.fold (fun acc n ci => if shouldCheck n ci then acc.push n else acc) #[]
  let mut violations : Array (Name × Array Name) := #[]
  let mut checked : Nat := 0
  for n in names do
    match ← ((Lean.collectAxioms n : CoreM (Array Name)).run' coreCtx coreState).toIO' with
    | .ok axs =>
      checked := checked + 1
      let extra := violatingExtra n axs
      unless extra.isEmpty do violations := violations.push (n, extra)
    | .error e =>
      let msg ← e.toMessageData.toString
      IO.eprintln s!"auditfrontier: could not collect axioms for {n}: {msg}"
      violations := violations.push (n, #[`«collectAxioms failed»])
  if violations.isEmpty then
    IO.println s!"auditfrontier: OK — checked {checked} declaration(s), every one depends only \
      on propext/Quot.sound beyond its documented whitelist entry \
      ({knownFrontierSorry.length} known-frontier sorry site(s), \
      {inheritedChoiceDebt.length} inherited Classical.choice site(s))."
    return 0
  else
    IO.eprintln s!"auditfrontier: {violations.size} declaration(s) with an axiom dependency \
      beyond propext/Quot.sound and beyond their documented whitelist entry (if any):\n"
    for (n, axs) in violations do
      IO.eprintln s!"  {n} :: {axs.toList}"
    IO.eprintln "\nEither this is a new sorry/axiom to eliminate, or (if genuinely \
      unavoidable and understood) it needs its own honest, commented entry in \
      knownFrontierSorry/inheritedChoiceDebt — never a silent blanket exemption."
    return 1

end AuditFrontier

unsafe def main : IO UInt32 := AuditFrontier.run
