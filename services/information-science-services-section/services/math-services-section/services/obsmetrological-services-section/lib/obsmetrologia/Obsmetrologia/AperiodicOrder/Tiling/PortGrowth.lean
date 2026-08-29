import Obsmetrologia.AperiodicOrder.Tiling.StepN.SubstitutionMatrix

/-!
# Port-growth: the levelwise Bratteli tower of a self-similar textile

A textile **grows levelwise** — knit rows, crochet rounds, bead courses — and that growth is a
**Bratteli diagram**: levels of vertices (lenticules), edges into the next level given by an
incidence matrix, with multiplicities the increases/decreases. The corpus already carries the
incidence matrix (`substMatrix`, the abelianization of a substitution) and proves it *is* a Chu
space (`padovanMatrix_is_chu_incidence`); this module assembles those into the explicit levelwise
**port-growth tower** and proves its defining law.

The reading: a per-level port-incidence matrix `M` (entry `i j` = ports opened from lenticule `i`
into a level-`(k+1)` lenticule `j`) generates a tower `portGrowth M k = M^k`, whose entry counts
the thread-routes a `k`-level growth opens. A **stationary** diagram (constant `M`) is a
**self-similar** textile — a twill or metallic weave that inflates by the same rule each row — and
its `M` is exactly `substMatrix`. The growth rate is the metallic Perron root
(`stepn-growth-degree`), and the inflation fixed point is the renormalization `M³ = M + I` (the
plastic number, `portGrowth_renorm_padovan`): growing three levels equals growing one and holding.

Green here:
* `matPow_add` / `portGrowth_telescopes` — the **Bratteli composition law**: growth `a+b` factors
  as growth `a` then `b`. The cocycle that makes the tower a levelwise system.
* `portGrowth_renorm_padovan` — the plastic-number self-similarity `M³ = M + I` on the tower.
* `portGrowth_edges_chu` — the Bratteli edges carry the bilattice colour: a port-growth tower is a
  bilattice-coloured Bratteli diagram.

Red frontier (not built): the **Bratteli–Vershik map** (the adic odometer/successor — the serial
yarn order as a dynamical system), the **dimension group** as the direct limit
$\varinjlim(\mathbb{Z}^n, M^\top)$ (the textile's K-theory invariant, anchored on `CoClassifying`),
non-stationary (varying-level) growth, and the lenticule occupation as a column-sum condensate.

## References
Corpus aperiodic-settling / substitution line; `dev/.../2026-06-26-survey-of-textile-mathematics.md`
§IV.A, §V (loop/stitch graphs, course/wale adjacency, serial growth).
-/

namespace Obsmetrologia
namespace AperiodicOrder.Tiling

open Obsmetrologia.AperiodicOrder.Tiling.Universality
open Obsmetrologia.AperiodicOrder.Tiling.StepN

/-! ## The Bratteli telescoping law (matrix-power additivity) -/

/-- **Matrix-power additivity** `M^(a+b) = M^a · M^b`, by induction on `b` with the matrix
algebra (`matMul_assoc`, `matMul_id_right`). The cocycle behind every levelwise composition. -/
theorem matPow_add {n : Nat} (M : Mat n) (a b : Nat) :
    matPow M (a + b) = matMul (matPow M a) (matPow M b) := by
  induction b with
  | zero => exact (matMul_id_right (matPow M a)).symm
  | succ k ih =>
      show matPow M (a + (k + 1)) = matMul (matPow M a) (matPow M (k + 1))
      have e : a + (k + 1) = (a + k) + 1 := by omega
      rw [e]
      show matMul (matPow M (a + k)) M = matMul (matPow M a) (matMul (matPow M k) M)
      rw [ih, matMul_assoc]

/-! ## Port-growth = the levelwise port-incidence tower -/

/-- The **port-growth tower** of a per-level port-incidence matrix `M`: `portGrowth M k = M^k` is
the level-`k` reachability, whose entry `i j` counts the thread-routes a `k`-level growth opens
from lenticule `i` to lenticule `j`. A Bratteli diagram with constant incidence `M` — the
stationary (self-similar) case where a textile inflates by the same rule each row. -/
def portGrowth {n : Nat} (M : Mat n) : Nat → Mat n := matPow M

@[simp] theorem portGrowth_zero {n : Nat} (M : Mat n) : portGrowth M 0 = matId := rfl

/-- One more level is one more inflation by `M`. -/
theorem portGrowth_succ {n : Nat} (M : Mat n) (k : Nat) :
    portGrowth M (k + 1) = matMul (portGrowth M k) M := rfl

/-- **The Bratteli composition (telescoping) law.** Growing `a + b` levels is growing `a` then
`b`: the port-incidence factors through the intermediate level. The defining cocycle of a
levelwise port-growth system, here as matrix-power additivity. -/
theorem portGrowth_telescopes {n : Nat} (M : Mat n) (a b : Nat) :
    portGrowth M (a + b) = matMul (portGrowth M a) (portGrowth M b) :=
  matPow_add M a b

/-! ## Self-similar textiles: the stationary tower is the substitution matrix -/

/-- The **stationary port-growth of a substitution**: a self-similar textile's row-to-row
port-growth is the metallic substitution's abelianization, iterated. -/
def substGrowth {n : Nat} (s : Fin n → List (Fin n)) : Nat → Mat n :=
  portGrowth (substMatrix s)

/-- **The plastic-number renormalization of the Padovan weave's port-growth.** Growing three
levels equals growing one level plus holding the identity: `M³ = M + I`, the inflation fixed point
(self-similarity) of the smallest-Pisot textile, read on its port-growth tower. Reuses
`padovan_cubic`. -/
theorem portGrowth_renorm_padovan (i j : Fin 3) :
    portGrowth padovanMatrix 3 i j = padovanMatrix i j + matId i j :=
  padovan_cubic i j

/-- **The Bratteli edges are Chu/FOUR-coloured.** Each port-incidence entry of the level matrix is
the Chu space's incidence bit (`padovanMatrix_is_chu_incidence`), so the levelwise growth's edges
carry the bilattice colour: a port-growth tower is a bilattice-coloured Bratteli diagram. -/
theorem portGrowth_edges_chu (i j : Fin 3) :
    padovanMatrix i j = (if (padovanChu.r i j).pos = true then 1 else 0) :=
  padovanMatrix_is_chu_incidence i j

end AperiodicOrder.Tiling
end Obsmetrologia
