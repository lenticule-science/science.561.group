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
   `Calculus.LinearAlgebra.Vec` depended on `Classical.choice` despite none of them
   mentioning `Classical` anywhere in their own source. At the time this was only traced
   concretely for one declaration (`lcomb_add_coeff`, to `Nat.right_eq_add`) and merely
   asserted "consistent with the same shape" for the rest, un-re-traced. Listed in
   `inheritedChoiceDebt`.

## 2026-08-25 update — all eighteen individually re-traced, six fixed

Re-tracing every one of the original eighteen (via `#print axioms` on each declaration and,
recursively, on every constant its elaborated proof term or compiled body names) found **two
genuinely distinct mechanisms**, not one — the "all via `Nat.right_eq_add`" hypothesis above
was only half right, and wrong about which core lemma in most of the cases it did cover:

- **Twelve are meta-programs, not theorems, and are unavoidably tainted by Lean 4 core
  itself.** The four `ChargeTactic` declarations and eight `RingTactic` declarations are
  `MetaM`/`TacticM` procedures (`isDefEqTo`, `findAtom?`, `splitFiniteLocals`, …) that call
  ordinary Lean elaborator entry points — `whnf`, `isDefEq`, `MonadLCtx.getLCtx`,
  `evalTactic`, and friends. Confirmed directly: a bare one-line `MetaM` definition that
  does nothing but call `Lean.Meta.whnf` (or `isDefEq`, or `getLCtx`) already carries
  `Classical.choice`, before this corpus's own code contributes anything. That dependency
  lives somewhere inside Lean 4's own `Meta`/`Elab` implementation — outside this corpus's
  source, outside its control, and irrelevant to the "no free data" discipline's actual
  target (the *mathematics* this library proves, not the tactics that help write it). No
  rewrite in `Obsmetrologia` can route around this; these twelve remain in
  `inheritedChoiceDebt`, now documented as class (c) — genuinely unavoidable — rather than
  merely "not fixed here."

- **Six were ordinary math theorems, and the taint was real but avoidable.** The mechanism:
  Lean 4 core's `omega` tactic, whenever asked to close a *non-atomic* goal (an `Iff`, an
  `∧`, a `¬`, or an arbitrary-`Prop` goal reached by deriving `False` from contradictory
  hypotheses) rather than a single arithmetic (in)equality, discharges it via
  `Decidable.byContradiction` instantiated with `Classical.propDecidable` — unconditionally,
  even when the proposition is already decidable constructively (confirmed: a plain
  `omega`-proved `Iff`/`∧` goal is `Classical.choice`-tainted; the same goal split into its
  atomic parts first and closed by one `omega` call per part is not). The same fallback is
  what a bare `simp` on a `≠`/`Not` goal reaches for. This taints a proof two ways: directly
  (calling `omega`/`simp` on a compound goal in this corpus's own tactic script), or
  indirectly (citing — often via `simp`'s rewrite set — a Lean-core `Iff`-shaped lemma whose
  *own* library proof took the same compound-goal path, e.g. `Nat.right_eq_add` for
  `lcomb_add_coeff`, or `List.countP_eq_zero` for `floppy_of_all_le_one`). Also confirmed
  separately: `by_cases` on a proposition wrapped in a semireducible `def` (e.g.
  `rotationalFlat h` rather than `h.quarterTurns = 0`) fails to find a constructive
  `Decidable` instance through the `def` and falls back to `Classical.byCases`/
  `propDecidable` the same way (`four_way_classification`).

  Fixed, by routing each around its specific compound-goal/def-wrapped call rather than
  changing what any of them state:
  - `AperiodicOrder.AffineHolonomy.rotate_preserves_add` — `simp [rotate, add] <;> omega`
    (closing a `Prod` equality, i.e. an implicit conjunction, in one `omega` call) →
    `apply Prod.ext <;> simp only [rotate, add] <;> omega` (split first, `omega` per
    component).
  - `AperiodicOrder.AffineHolonomy.act_compose`,
    `AperiodicOrder.AffineHolonomy.compose_assoc` — cited `rotate_preserves_add`; fixed
    automatically once it was.
  - `AperiodicOrder.AffineHolonomy.four_way_classification` — `by_cases` on
    `rotationalFlat h` / `translationalFlat h` → `by_cases` on the underlying
    `h.quarterTurns = 0` / `h.translation = zero` directly (definitionally equal, so the
    rest of the proof is untouched).
  - `AperiodicOrder.Tiling.floppy_of_all_le_one` — `rw [rigidity, List.countP_eq_zero]`
    (citing the tainted core lemma) → cons-induction using the already-clean
    `mass_quantum_floppy` (moved earlier in the file so it can be cited).
  - `Calculus.LinearAlgebra.Vec.lcomb_add_coeff` — the two `exact absurd h_ (by simp)`
    contradiction branches (a bare `simp` proving a `≠` goal) →
    `exact absurd h_ (by simp only [List.length_nil, List.length_cons]; omega)` (unfold by
    name, then close the now-atomic arithmetic contradiction with `omega`).

  All six rebuilt and re-checked with `#print axioms`: `[propext, Quot.sound]` only.
  Removed from `inheritedChoiceDebt`.

This also corrects the previous entry's claim about `RankNullity.lean`'s and
`LinearAlgebra/Basic.lean`'s docstrings: `lcomb_add_coeff` genuinely was `Classical.choice`-
tainted and genuinely is fixed now — the "choice-free" language in those files is accurate
again for this declaration.

Do not add to either list to silence a *fresh* mistake. Removing an entry (by proving the
declaration without the sorry, or routing its proof off the choice-dependent path) is always
welcome; growing a list requires the same honesty this comment is trying to model — say what
leaked in, and why.

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
(2026-08-05). Twelve entries as of 2026-08-25 (down from the original eighteen — see the
module docstring's 2026-08-25 update). All twelve are `MetaM`/`TacticM` meta-programs
(`Language.Positing.ChargeTactic`, `Algebra.RingTactic`) whose `Classical.choice` dependency
comes from calling Lean 4 core's own `Meta`/`Elab` API (confirmed: even a bare call to
`Lean.Meta.whnf`/`isDefEq`/`getLCtx` alone is already so tainted) — a fact about Lean's own
elaborator, not something this corpus's own source can route around. This is genuinely
unavoidable (classification (c) in the audit's own terms), not merely undone; the six
ordinary-math-theorem entries that *were* fixable were fixed and removed on 2026-08-25. -/
def inheritedChoiceDebt : List Name :=
  [ ``Obsmetrologia.ChargeTactic.closeGroundGoals
  , ``Obsmetrologia.ChargeTactic.findFiniteLocal?
  , ``Obsmetrologia.ChargeTactic.splitFiniteLocals
  , ``Obsmetrologia.ChargeTactic.isFiniteChargeType
  , ``Obsmetrologia.Algebra.RingTactic.inferCommRingForTarget
  , ``Obsmetrologia.Algebra.RingTactic.findAtom?
  , ``Obsmetrologia.Algebra.RingTactic.quoteAtom
  , ``Obsmetrologia.Algebra.RingTactic.quoteExpr
  , ``Obsmetrologia.Algebra.RingTactic.isDefEqTo
  , ``Obsmetrologia.Algebra.RingTactic.evalCringInferred
  , ``Obsmetrologia.Algebra.RingTactic.evalCringWithExpr
  , ``Obsmetrologia.Algebra.RingTactic.evalCringWith
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
