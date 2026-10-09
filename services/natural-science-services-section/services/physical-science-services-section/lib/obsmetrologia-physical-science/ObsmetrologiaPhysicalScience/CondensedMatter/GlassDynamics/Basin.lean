import Obsmetrologia.Calculus.Order.SetNumberGraphTheory
import Obsmetrologia.Calculus.Real.Internal
import Obsmetrologia.Calculus.Real.Multiplication

/-!
# Metastable basin graphs and the no-descending-cycle theorem

Landscape theory pictures a glass's dynamics as motion on a graph of **basins** (inherent structures /
metastable states) with transitions between them, each basin carrying an energy. A **descending**
transition strictly lowers the energy. The basic finite Lyapunov fact — the combinatorial H-theorem —
is that **strictly descending dynamics cannot cycle**: a descending chain strictly lowers a `Nat`-valued
energy, so it can never return to its start.

This is the basin-graph reading of the closure-flow Lyapunov descent. The *firing*-count form of the
bound — "the number of strict descents is at most the initial free-energy deficit" — is already proven
on the settling side in `Flow.FreeEnergyLyapunov` (`free_energy_is_lyapunov`, finite convergence
`≤ Φ₀ + 1`, and `kappa_bounded_by_initial_free_energy`); this module contributes the graph-level
no-cycle theorem, the same descent argument over an arbitrary `Nat`-energy transition graph.

## Main definitions
* `BasinGraph`, `Descends`, `DescendChain` — basins with energy, strict descents, and descent chains.

## Main results
* `descendChain_energy_lt` — a descent chain strictly lowers energy end-to-end.
* `no_descending_cycle` — no basin descends back to itself (the finite H-theorem).
* `descend_asymm` — strict descent is one-directional.

## References
Corpus glass line; the glass frontier memo (energy landscapes, inherent structures, metastable
basins). Energy form of `Flow.FreeEnergyLyapunov`'s descent.

## Tags
glass, energy landscape, basin, inherent structure, Lyapunov, H-theorem
-/

namespace Obsmetrologia
namespace AperiodicOrder.GlassDynamics

open Obsmetrologia.Discrete

/-- A **basin graph**: a type of metastable basins, a transition `Discrete.Graph`, and a `Nat`-valued
energy on basins (the inherent-structure energy). -/
structure BasinGraph where
  /-- The metastable basins / inherent structures. -/
  Basin : Type
  /-- The transition relation between basins. -/
  transition : Graph Basin
  /-- The energy of each basin (a `Nat` — the discrete landscape height). -/
  energy : Basin → Nat

namespace BasinGraph
variable (B : BasinGraph)

/-- A **descending transition** `a ↘ b`: a transition that strictly lowers the energy. -/
def Descends (a b : B.Basin) : Prop := B.transition a b = true ∧ B.energy b < B.energy a

/-- A **descent chain** `a ↘⁺ b`: a nonempty sequence of strictly descending transitions. -/
inductive DescendChain (B : BasinGraph) : B.Basin → B.Basin → Prop
  | last {a b : B.Basin} : B.Descends a b → DescendChain B a b
  | cons {a b c : B.Basin} : B.Descends a b → DescendChain B b c → DescendChain B a c

/-- **A descent chain strictly lowers energy end-to-end** — the chained Lyapunov descent. -/
theorem descendChain_energy_lt {a b : B.Basin} (h : DescendChain B a b) :
    B.energy b < B.energy a := by
  induction h with
  | last hd => exact hd.2
  | cons hd _ ih => exact Nat.lt_trans ih hd.2

/-- **No descending cycle.** No basin descends back to itself: a closed descent chain would strictly
lower its own energy (`energy a < energy a`), impossible. The finite H-theorem — strictly descending
landscape dynamics terminate, never returning to a visited basin. -/
theorem no_descending_cycle (a : B.Basin) : ¬ DescendChain B a a :=
  fun h => Nat.lt_irrefl (B.energy a) (descendChain_energy_lt B h)

/-- **Strict descent is one-directional**: `a ↘⁺ b` and `b ↘⁺ a` cannot both hold — the
`Nat.lt_asymm` this chain-level fact specializes. -/
theorem descend_asymm {a b : B.Basin}
    (h1 : DescendChain B a b) (h2 : DescendChain B b a) : False :=
  Nat.lt_asymm (descendChain_energy_lt B h1) (descendChain_energy_lt B h2)

/-- The rational free-energy lift of the Nat-valued basin energy. -/
def rationalEnergy (B : BasinGraph) (b : B.Basin) : Real.Internal.Rat :=
  Real.Internal.Rat.ofNat (B.energy b)

/-- Nat-valued basin descent also lowers the internal rational free energy. -/
theorem rationalEnergy_le_of_descendChain (B : BasinGraph) {a b : B.Basin}
    (h : B.DescendChain a b) :
    B.rationalEnergy b ≤ B.rationalEnergy a :=
  Real.Internal.Rat.ofNat_le_ofNat (Nat.le_of_lt (B.descendChain_energy_lt h))

end BasinGraph
end AperiodicOrder.GlassDynamics
end Obsmetrologia
