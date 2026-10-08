import Mathlib.Order.Heyting.Basic
import Mathlib.Order.Lattice
import RelationalHyperverse.Histories
import RelationalHyperverse.FiberAlgebras
import RelationalHyperverse.Reindexing
import RelationalHyperverse.RelationalHyperverse
import RelationalHyperverse.Initiality

/-!
# Examples: concrete instances of the RelationalUniverse

Concrete examples mirror the per-unit files in math/:
- `OnePoint.lean`        — the unit/terminal RelationalUniverse
- `TwoStage.lean`        — a two-step history system T = {ε, a}
- `CommutingSquare.lean` — a diamond-shaped history system
- `GridDiamond.lean`     — a grid with one independence relation
- `Infinite.lean`        — an infinite history system

## Terminal example (proved here)

`terminalRelUniv` is a concrete minimal RelationalUniverse witnessing satisfiability of
all axioms. It is the **syntactic relational universe** `synRelUniv Empty` from
`Initiality.lean`: T = Unit, every fiber is `H_syn Empty` (the Lindenbaum-Tarski
algebra of FiberNuclearLanguage over no free variables), every restriction map is the identity.

This witnesses: the `RelationalUniverse` structure is non-vacuously satisfiable.
-/

-- ── Terminal example: T = Unit, fibers = H_syn Empty ──────────────────────────

/-- The terminal RelationalUniverse: T = Unit, fibers = H_syn ∅.

    The history type has a single element (the empty history). Every fiber is the
    Lindenbaum-Tarski algebra of FiberNuclearLanguage with no free variables: the initial
    HeytingAlgebra with BiNucleus. Every restriction map is the identity.

    This is a concrete witness that the RelationalUniverse axioms are satisfiable. -/
noncomputable def terminalRelUniv : RelationalUniverse :=
  synRelUniv Empty

-- ── Properties of the terminal universe ──────────────────────────────────────

/-- The history type of the terminal universe is Unit. -/
example : terminalRelUniv.T = Unit := rfl

/-- The fiber at the unique history carries the syntactic BiNucleus. -/
example : terminalRelUniv.fiberAlg () = H_syn.instBiNucleus := rfl

/-- All restriction maps in the terminal universe are the identity. -/
theorem terminalRelUniv_restrict_id (a : H_syn Empty) :
    terminalRelUniv.restrict (le_refl ()) a = a := rfl

/-- The fixed fiber at the unique history is H_syn.instBiNucleus's fixed fiber.
    Restriction preserves fixed fibers (from RelationalUniverse). -/
theorem terminalRelUniv_restrict_fixedFiber
    {a : terminalRelUniv.FiberCarrier ()}
    (ha : a ∈ (terminalRelUniv.fiberAlg ()).fixedFiber) :
    terminalRelUniv.restrict (le_refl ()) a ∈ (terminalRelUniv.fiberAlg ()).fixedFiber := by
  rwa [terminalRelUniv_restrict_id]

-- ── Satisfaction of the FiberAlgebras axioms ──────────────────────────────────

/-- The terminal universe's BiNucleus commutes: σ ∘ Δ = Δ ∘ σ.
    Inherited from `H_syn.instBiNucleus` (proved via R7 in Soundness). -/
theorem terminalRelUniv_biNucleus_commute (a : terminalRelUniv.FiberCarrier ()) :
    (terminalRelUniv.fiberAlg ()).σ.toFun ((terminalRelUniv.fiberAlg ()).Δ.toFun a) =
    (terminalRelUniv.fiberAlg ()).Δ.toFun ((terminalRelUniv.fiberAlg ()).σ.toFun a) :=
  H_syn.instBiNucleus.commute a
