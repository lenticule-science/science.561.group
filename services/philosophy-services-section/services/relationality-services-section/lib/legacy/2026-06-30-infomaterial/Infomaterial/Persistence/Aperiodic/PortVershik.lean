import Infomaterial.Persistence.Aperiodic.PortGrowthTime

/-!
# The Vershik adic successor: the serial yarn order completing Bratteli–Vershik

`PortGrowth` gives the Bratteli tower's **edges** (the incidence) and `PortGrowthTime` gives its
**levels** (time = past-count). The third and last piece of a Bratteli–Vershik system is the
**adic successor** — the map that takes one path to the next in the serial order. This module
builds it on the dyadic (radix-2) stationary tower, the canonical minimal Cantor system, where the
successor is a little-endian "+1 with carry" **odometer**.

The textile reading is exact: the Vershik successor is the **serial yarn order**. A level whose
edge is not yet maximal (`false`) advances (`true`) and the traversal stops there; a maximal edge
(`true`) resets (`false`) and carries the increment up a level — *finish the stitch, carry to the
next row*. The all-maximal path wraps to the all-minimal one (`vershik_replicate_true`): the serial
order closes into a cycle, and on two levels it is the 4-cycle `vershik_two_cycle` — minimal, every
path reached.

With this, the Bratteli–Vershik system of a self-similar (metallic) textile is complete in-tree:
levels = time (`RegimeTimeSection` ∘ `PortGrowthTime`), edges = incidence (`PortGrowth`), and the
serial successor = the adic odometer (here).

## Main results
* `vershik_succ` — the adic successor is the integer `+1` on the serial index, until a row maxes out.
* `vershik_replicate_true` — the maximal path wraps to the minimal path (the adic discontinuity).
* `vershik_two_cycle` — on two levels the successor is a 4-cycle (the minimal dyadic odometer).

## References
`PortGrowth` / `PortGrowthTime` (the tower's edges and levels); the dyadic odometer as the
canonical Bratteli–Vershik / Cantor minimal system.
-/

namespace Infomaterial
namespace Persistence.Aperiodic

/-- The **Vershik adic successor** on the dyadic stationary Bratteli tower: the next path in the
serial order, the little-endian "+1 with carry" odometer. A not-yet-maximal edge (`false`) advances
to `true` and stops; a maximal edge (`true`) resets to `false` and carries up a level. The serial
yarn order — finish the stitch, carry to the next row. -/
def vershik : List Bool → List Bool
  | [] => []
  | false :: rest => true :: rest
  | true :: rest => false :: vershik rest

/-- The little-endian binary value of a path (lowest level first): its index in the serial order. -/
def toNat : List Bool → Nat
  | [] => 0
  | false :: rest => 2 * toNat rest
  | true :: rest => 1 + 2 * toNat rest

/-- The successor preserves the level count: an `L`-level path stays `L`-level (the top carry drops). -/
theorem vershik_length : ∀ p : List Bool, (vershik p).length = p.length
  | [] => rfl
  | false :: _ => rfl
  | true :: rest => by simp [vershik, vershik_length rest]

/-- **The Vershik successor is `+1`.** On any path not yet maximal (some level still carries a
`false` edge), the adic successor increments the serial index: `toNat (vershik p) = toNat p + 1`.
The serial yarn order is the integer successor until a row maxes out. -/
theorem vershik_succ : ∀ p : List Bool, false ∈ p → toNat (vershik p) = toNat p + 1
  | [], h => by cases h
  | false :: _, _ => by simp only [vershik, toNat]; omega
  | true :: rest, h => by
      have hrest : false ∈ rest := by
        rcases List.mem_cons.mp h with heq | hmem
        · exact absurd heq (by decide)
        · exact hmem
      have ih := vershik_succ rest hrest
      simp only [vershik, toNat]; omega

/-- **The maximal path wraps to the minimal path.** The all-`true` (maximal) path of any height
carries past the top and returns to the all-`false` (minimal) path — the adic map's one
discontinuity, where the serial order closes into a cycle. -/
theorem vershik_replicate_true : ∀ n : Nat,
    vershik (List.replicate n true) = List.replicate n false
  | 0 => rfl
  | n + 1 => by
      simp only [List.replicate_succ, vershik, vershik_replicate_true n]

/-- **On two levels the successor is a 4-cycle.** Iterating `vershik` four times returns any
two-level path to itself: the minimal dyadic odometer, every path reached — the Bratteli–Vershik
minimality of the two-row self-similar tower. -/
theorem vershik_two_cycle (a b : Bool) :
    vershik (vershik (vershik (vershik [a, b]))) = [a, b] := by
  cases a <;> cases b <;> rfl

end Persistence.Aperiodic
end Infomaterial
