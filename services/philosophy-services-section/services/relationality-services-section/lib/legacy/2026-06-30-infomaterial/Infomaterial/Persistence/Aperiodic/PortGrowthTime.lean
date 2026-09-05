import Infomaterial.Persistence.Aperiodic.PortGrowth
import Infomaterial.Relational.Spacetime.Causal.RegimeSection

/-!
# Time is the Bratteli level: the port-growth tower as a stably causal time-ordered system

`PortGrowth` builds the levelwise Bratteli tower of a self-similar textile; `RegimeTimeSection`
builds the discrete Hawking global time function `t(x) = pastCount(x)` and proves it strictly
increases along the causal order. This module joins them: **time is the Bratteli level**.

The bridge is the path space. An event of a port-growth tower is a finite **path** in the Bratteli
diagram, identified by its length (the level it has reached); a path extends only forward, so its
prefix order is the strict order on levels (`levelPrec`). On that order the causal past of a
level-`k` event is exactly its `k` prefixes — one per lower level — so the time section *is* the
level. Then the dropped `timeSection_strict_mono` reads, in our words, as **weaving advances
time**: a stitch's time is strictly greater than its parents'. The diamond's section `(0,1,1,3)`
is the two-spacelike-middle case; untie the middles into successive rows and you get the pure
chain `(0,1,2,3)` — the past count equal to the row number.

Green here:
* `levelPrec` (+ `levelPrec_trans`, `levelPrec_irrefl`) — the level/prefix order is a transitive
  irreflexive causal order, so Hawking's discrete theorem applies.
* `portGrowth_time_strict_mono` — along the level order, the time section strictly increases:
  `timeSection_strict_mono` instantiated at the port-growth level grading.
* `chain_timeSection_eq_level` — on a four-level path the section is `(0,1,2,3)`: time = level.

Red frontier (not built): the full branching path space over `substMatrix` (events = vertex
sequences, `prec` = strict prefix) with `timeSection = path length`, and the **Bratteli–Vershik
successor** (the adic order = the serial yarn order) — the last piece of the Bratteli–Vershik
system once levels (here) and edges (`PortGrowth`) are in hand.

## References
`RegimeTimeSection` (the discrete time function); `PortGrowth` (the levelwise tower);
`dev/.../2026-06-26-survey-of-textile-mathematics.md` §IV.A (course/wale adjacency, serial growth).
-/

namespace Infomaterial
namespace Persistence.Aperiodic

open Infomaterial.Relational.Spacetime.Causal.RegimeSection

/-- **Level-precedence** on a Bratteli path's prefixes (indexed by length): the level-`a` prefix
precedes the level-`b` prefix iff `a < b`. A path extends only forward, so its prefix order is the
strict order on levels — the causal order of the growth tower. -/
def levelPrec (a b : Nat) : Bool := decide (a < b)

/-- The level order is transitive. -/
theorem levelPrec_trans (a b c : Nat) :
    levelPrec a b = true → levelPrec b c = true → levelPrec a c = true := by
  simp only [levelPrec, decide_eq_true_eq]
  exact fun h1 h2 => Nat.lt_trans h1 h2

/-- The level order is irreflexive (no path is its own proper prefix). -/
theorem levelPrec_irrefl (a : Nat) : levelPrec a a = false := by
  simp only [levelPrec, decide_eq_false_iff_not]
  exact Nat.lt_irrefl a

/-- **Weaving advances time.** Along the level (prefix) order of a port-growth tower, the discrete
time section strictly increases — `timeSection_strict_mono` instantiated at the level grading. The
Bratteli level *is* a Hawking global time function: a stitch's time is strictly greater than its
parents'. -/
theorem portGrowth_time_strict_mono (es : List Nat) (x y : Nat)
    (hx : x ∈ es) (hxy : levelPrec x y = true) :
    timeSection es levelPrec x < timeSection es levelPrec y :=
  timeSection_strict_mono es levelPrec levelPrec_trans levelPrec_irrefl x y hx hxy

/-- **Time is the level (concrete).** On a four-level Bratteli path `[0,1,2,3]` the time section is
`(0,1,2,3)` — the level itself. The chain reading of the diamond's `(0,1,1,3)`: untie the two
spacelike middles into successive rows and the past-count is exactly the row number. -/
theorem chain_timeSection_eq_level :
    timeSection [0, 1, 2, 3] levelPrec 0 = 0
    ∧ timeSection [0, 1, 2, 3] levelPrec 1 = 1
    ∧ timeSection [0, 1, 2, 3] levelPrec 2 = 2
    ∧ timeSection [0, 1, 2, 3] levelPrec 3 = 3 := by
  refine ⟨by decide, by decide, by decide, by decide⟩

end Persistence.Aperiodic
end Infomaterial
