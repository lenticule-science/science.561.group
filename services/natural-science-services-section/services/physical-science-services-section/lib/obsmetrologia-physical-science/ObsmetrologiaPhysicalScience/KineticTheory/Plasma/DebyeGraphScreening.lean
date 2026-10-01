import Obsmetrologia.Calculus.Order.TarskiSheafClosure
import Obsmetrologia.Calculus.Real.Internal

/-!
# DebyeGraphScreening — plasma: Debye screening as a Lawvere-Laplacian graph closure (DERIVED)

The plasma frontier (`…/obsmetrologia_gases_liquids_plasmas_proof_frontier.md`, §3.3.2 / Batch D) asks for
Debye screening as a **graph/Lawvere closure**: a finite graph of plasma cells carries a monotone
rational attenuation kernel `screeningKernel : Cell → Cell → ℚ`, the screened potential is the fixed
point of a monotone screened-potential step, and the harmonic modes are Lawvere-Laplacian fixed points.

A `DebyeGraph` is a finite directed graph of plasma cells with a rational attenuation kernel and a list
of **admissible relay couplings** (each carrying a non-negative screening cost). Each coupling `c ↦ c'`
is a Tarski directed restriction edge that **relays a source charge's influence** to its neighbour, so
the screened potential built by settling the relay is supported exactly on the cells the source can
reach through admissible couplings — the **Debye-reachable cloud**, beyond which the potential is fully
screened. The screened-potential step is `Tarski.driveFn`; settling it is the least relay-closed
configuration above the source — the discrete linearized Debye–Hückel closure.

The three frontier theorems land on the proven `Tarski.*` engine: the step is monotone
(`screening_step_mono`), the screened potential is a Lawvere-Laplacian fixed point iff it is a global
section (`screening_laplacian_fixed_points`, the lattice `ker L = H⁰`), and settling is the least
screened-consistent configuration above the source (`screened_potential_is_lfp`).

This is the **order/closure skeleton** of screening — which cells the charge's influence reaches, and
that the reachable cloud is a least fixed point. The least-fixed-point content lives in the complete
lattice of presence-configurations (`ℚ` is not a complete lattice, so the lfp is taken over `Powerset`,
not over ℚ-magnitudes); the kernel enters as the admissibility datum on relays. A quantitative
ℚ-*magnitude* screened step is a reachable follow-on — `Obsmetrologia.Real.Internal.Rat` already has the
multiplicative order (`Rat.mul_le_mul_of_nonneg_left/right`, `Real/Multiplication.lean`) needed to make
attenuation monotone. What is absent is the **continuum**: the Euclidean ℝᵈ Green's function
geometry and the exponential `e^{-r/λ_D}/r` asymptotics (the metric→`exp` Poisson limit) — not reals as
such (`Obsmetrologia.Real.ExpSeries` has `exp`), but the spatial-geometry/PDE layer above them.

## Main definitions
* `DebyeGraph`, `screenComplex` — a plasma graph with a rational attenuation kernel, as a Tarski complex.
* `screenedPotentialStep`, `screenedPotential` — one relay round and its settled (closed) screened cloud.

## Main results
* `screening_step_mono` — the screened-potential step is monotone.
* `screening_laplacian_fixed_points` — the screened potential is a Lawvere-Laplacian fixed point iff it
  is a global section (the lattice `ker L = H⁰`).
* `screened_potential_is_lfp` — settling is the least screened-consistent configuration above the
  source charge (the least-fixed-point closure).
* `relay_cost_nonneg`, `screened_cloud_mono` — relays carry non-negative screening cost; a larger source
  charge screens at least as far.

## References
`content/.../obsmetrologia_gases_liquids_plasmas_proof_frontier.md` §3.3.2, Batch D. Builds on the shared
`Obsmetrologia.Order.TarskiSheafClosure`; the single-cell charge companion is `KineticTheory.Plasma.Quasineutrality`.

## Tags
Debye screening, Lawvere Laplacian, graph closure, attenuation kernel, least fixed point, degree-0 cohomology
-/

namespace Obsmetrologia
namespace KineticTheory.Plasma

open Tarski

/-- A **Debye screening graph**: a type of plasma cells, a rational attenuation kernel
`screeningKernel c c'` (the screening cost / log-decay coefficient of the relay `c ↦ c'`), and a list of
directed **relay couplings**, each an *admissible* relay carrying non-negative screening cost. -/
structure DebyeGraph where
  /-- The plasma cells. -/
  Cell : Type
  /-- The rational attenuation kernel: the screening cost of the directed relay `c ↦ c'`. -/
  screeningKernel : Cell → Cell → Real.Internal.Rat
  /-- The directed relay couplings along which a charge's influence is screened-relayed. -/
  couplings : List (Cell × Cell)
  /-- Every relay coupling is **admissible**: its screening cost is non-negative (an attenuation,
  not an amplification). -/
  kernel_admissible : ∀ p ∈ couplings, (0 : Real.Internal.Rat) ≤ screeningKernel p.1 p.2

/-- The **screening stalk**: presence (`Unit → Prop`) of the source charge's screened influence at a
cell. A screened configuration records, at each cell, whether the relayed potential is present. -/
abbrev ScreenStalk : Order.CompleteLattice := Powerset Unit

/-- A single relay coupling `c ↦ c'` as a **Tarski directed restriction edge**: presence of the
screened potential at the source cell is relayed (identically) to the target cell. -/
def relayEdge (G : DebyeGraph) (p : G.Cell × G.Cell) : Edge ScreenStalk G.Cell where
  src := p.1
  tgt := p.2
  restrict := fun a => a
  restrict_mono := fun h => h

/-- The **screening complex**: the plasma cells with one directed relay edge per coupling. -/
def screenComplex (G : DebyeGraph) : Complex ScreenStalk where
  Vertex := G.Cell
  edges := G.couplings.map (relayEdge G)

/-- A **screened configuration**: presence of the screened potential at each cell. -/
abbrev Screened (G : DebyeGraph) : Type := Assign (screenComplex G)

/-- The **screened-potential step**: one round of Debye relay — raise each cell to the join of the
source charge there and every incident relay's contribution (the Tarski `□∘◇` drive). -/
def screenedPotentialStep (G : DebyeGraph) (source : Screened G) : Screened G → Screened G :=
  driveFn (screenComplex G) source

/-- The **screened potential**: the settled (relay-closed) screened cloud generated by a source charge —
the least fixed point of the screened-potential step. -/
def screenedPotential (G : DebyeGraph) (source : Screened G) : Screened G :=
  settle (screenComplex G) source

/-- **The screened-potential step is monotone**: a larger screened configuration relays to a larger
one. Monotonicity is the sole Lawvere-Laplacian / Knaster–Tarski hypothesis. -/
theorem screening_step_mono (G : DebyeGraph) (source : Screened G) {x y : Screened G}
    (h : (AssignCL ScreenStalk G.Cell).le x y) :
    (AssignCL ScreenStalk G.Cell).le (screenedPotentialStep G source x)
      (screenedPotentialStep G source y) :=
  driveFn_mono (screenComplex G) (fun v => ScreenStalk.le_refl (source v)) h

/-- **The screened potential is a Lawvere-Laplacian fixed point iff it is a global section.** A
configuration arises as a screened potential exactly when it is harmonic — fixed by the screening relay —
which is the lattice Hodge identity `ker L = H⁰` for the Debye graph. -/
theorem screening_laplacian_fixed_points (G : DebyeGraph) (x : Screened G) :
    (∃ source, screenedPotential G source = x) ↔ IsHarmonic (screenComplex G) x :=
  mem_h0_iff_harmonic (screenComplex G) x

/-- **A Lawvere-Laplacian-fixed screened potential is screened-consistent**: being relay-fixed forces
every coupling's relay constraint `(presence at c) ≤ (presence at c')`. -/
theorem screened_fixed_imp_consistent (G : DebyeGraph) (x : Screened G)
    (h : IsHarmonic (screenComplex G) x) : IsCompatible (screenComplex G) x :=
  harmonic_imp_compatible (screenComplex G) x h

/-- **Settling is the least screened-consistent configuration above the source** — the least-fixed-point
closure. Any relay-closed configuration that already contains the source charge contains the whole
screened cloud. -/
theorem screened_potential_is_lfp (G : DebyeGraph) (source x : Screened G)
    (hsx : ∀ v, ScreenStalk.le (source v) (x v)) (hcomp : IsCompatible (screenComplex G) x) :
    (AssignCL ScreenStalk G.Cell).le (screenedPotential G source) x :=
  settle_le_of_compatible (screenComplex G) source x hsx hcomp

/-- **The source charge sits inside its own screened cloud** (settling is inflationary). -/
theorem source_le_screened (G : DebyeGraph) (source : Screened G) :
    ∀ v, ScreenStalk.le (source v) (screenedPotential G source v) :=
  settle_infl (screenComplex G) source

/-- **A larger source charge screens at least as far** (settling is monotone in the source). -/
theorem screened_cloud_mono (G : DebyeGraph) {source source' : Screened G}
    (h : ∀ v, ScreenStalk.le (source v) (source' v)) :
    (AssignCL ScreenStalk G.Cell).le (screenedPotential G source) (screenedPotential G source') :=
  settle_mono (screenComplex G) h

/-- **The screened cloud is idempotent**: re-screening a screened potential changes nothing — screening
is a closure operator. -/
theorem screened_potential_idem (G : DebyeGraph) (source : Screened G) :
    screenedPotential G (screenedPotential G source) = screenedPotential G source :=
  settle_idem (screenComplex G) source

/-- **Every relay coupling carries non-negative screening cost.** The rational attenuation kernel is
admissible on the relay graph — the structural role of the kernel in the closure. -/
theorem relay_cost_nonneg (G : DebyeGraph) (p : G.Cell × G.Cell) (hp : p ∈ G.couplings) :
    (0 : Real.Internal.Rat) ≤ G.screeningKernel p.1 p.2 :=
  G.kernel_admissible p hp

/-- A **single-relay Debye graph** on two cells: the source cell screens its one neighbour with unit
screening cost. Witnesses that `DebyeGraph` is non-vacuous. -/
def pairGraph : DebyeGraph where
  Cell := Bool
  screeningKernel := fun _ _ => 1
  couplings := [(true, false)]
  kernel_admissible := fun _ _ => by
    show (0 : Real.Internal.Rat) ≤ 1
    exact (Real.Internal.Rat.zero_le_mk _).mpr (by show (0 : Int) ≤ 1; omega)

end KineticTheory.Plasma
end Obsmetrologia
