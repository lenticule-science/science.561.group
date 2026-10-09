import Obsmetrologia.AperiodicOrder.Tiling.SoficShift
import Obsmetrologia.Language.Positing.FourCorner
import Obsmetrologia.Language.Positing.BigradedCohomology

/-!
# Port graphs: the lenticular condensate carrier

Beadwork is not "textiles with small parts": its skeleton is rigid bodies with holes, and the
thread is routed *through* them as a **walk**, not laid down as a strand. The beadwork-mathematics
survey pins the data: a bead `(K, H, P, ρ, μ)` (body, holes, ports, type, material); a thread pass
`(bead, in-port, out-port)`; a thread `Γ` a *word* of passes in which the same bead recurs.

This module names that rigid vertex a **lenticule** and gives it its role. A lenticule is the
**Bose condensate of the relational hull**: the site where many thread-relations pile into one
mode. In the bilattice that macroscopic coherent over-occupation is exactly `⊤` — "told both,"
held without explosion — so a jammed, over-threaded lenticule (beadwork "superjamming") *is* a
condensed `⊤`, not a crash. And the lenticule is not the mirror (`Reading.negate`, the over/under
gauge) but **what settles out of it**: the mirror fixes the poles `{⊥, ⊤}`, and the condensate
precipitates exactly at that fixed locus — the rigid residue the over/under oscillation leaves.
*Lenticular*: a lens that focuses the thread-rays through its ports and carries the recto/verso
faces of the mirror.

The green content here is the carrier's local law and its condensate reading:

* **A lenticule's hole is a weave crossing.** A single-hole bead routes the thread exactly when
  in- and out-ports differ — the *same* `warpAlt` SFT as a weave crossing (`holeTransition_eq_warpAlt`).
  Beadwork and weaving share one local rule; a bead is a crossing mounted on a rigid body.
* **The condensate reading** of a lenticule occupied `n` times: `⊥ₖ` empty, a definite truth value
  once, `⊤ₖ` for a Bose-condensed over-occupation (`over_occupation_inconsistency`).
* **The condensate settles out of the mirror**: negation fixes the empty `⊥` and the condensed `⊤`
  (`mirror_fixes_empty`, `mirror_fixes_condensate_pole`), so the lenticule sits at the mirror's
  fixed locus — what precipitates from it, not it.

The red frontier this opens (not built): the full port-typed transition system for
multi-hole beads, the four un-collapsible adjacencies (thread/contact/cell/vis), rigid-body
embedding, and the Demaine graph-threading realization (closed walk + minimum-weight matching).

## References
Corpus aperiodic-settling line; `dev/.../2026-06-26-survey-of-beadwork-mathematics.md` §V
(bead/port/thread-path/port-graph formalism), §IVD (beaded metamaterials, superjamming).
-/

namespace Obsmetrologia
namespace AperiodicOrder.Tiling

open Obsmetrologia.Discrete (Graph)

/-! ## The lenticule and its thread -/

/-- A **port** of a lenticule: an oriented hole-mouth over a lenticule type `B`, the two ends
`false = p⁻`, `true = p⁺`. -/
abbrev Port (B : Type) := B × Bool

/-- A **thread pass** through a lenticule: the oriented triple `(lenticule, in-side, out-side)`
— the predication-cell shape `(s, p, o)` realized in beadwork. -/
abbrev ThreadPass (B : Type) := B × Bool × Bool

/-- A **thread**: the walk, a word of passes in which the same lenticule may recur. The thread
topology is a walk, not an edge set. -/
abbrev Thread (B : Type) := List (ThreadPass B)

/-- The **hole transition** of a single-hole lenticule: a legal pass enters one side and exits
the other — the within-bead edge `p⁻—p⁺`. It is literally the plain-weave warp rule
(`holeTransition_eq_warpAlt`, in the fibercraft package's `LenticleCrossing`). -/
def holeTransition : Graph Bool := fun a b => a != b

/-- A pass is **legal** when its in/out sides satisfy the hole transition (the thread goes in one
side and out the other). -/
def Legal {B : Type} (p : ThreadPass B) : Prop := holeTransition p.2.1 p.2.2 = true

/-- **A pass is legal iff it threads through** — enters one port and exits the *other*. A
fold-back (same side in and out) is illegal, exactly as a weave forbids a same-state repeat. -/
theorem legal_iff_distinct {B : Type} (b : B) (i j : Bool) :
    Legal (b, i, j) ↔ i ≠ j := by
  cases i <;> cases j <;> simp [Legal, holeTransition]

/-- A **thread is legal** when every pass threads through its lenticule. -/
def ThreadLegal {B : Type} (Γ : Thread B) : Prop := ∀ p ∈ Γ, Legal p

@[simp] theorem threadLegal_nil {B : Type} : ThreadLegal ([] : Thread B) := by
  intro p hp; cases hp

/-! ## The condensate reading -/

/-- The **condensate reading** of a lenticule the thread occupies `n` times: `⊥ₖ` empty, a definite
truth value once, `⊤ₖ` for a Bose-condensed over-occupation (`n ≥ 2`) — the macroscopic coherent
held-`⊤` where many thread-relations pile into one mode (superjamming). -/
def condensate : Nat → Reading
  | 0 => Reading.kBot
  | 1 => Reading.tTop
  | _ => Reading.kTop

@[simp] theorem condensate_zero : condensate 0 = Reading.kBot := rfl
@[simp] theorem condensate_one : condensate 1 = Reading.tTop := rfl
@[simp] theorem condensate_over (n : Nat) : condensate (n + 2) = Reading.kTop := rfl

/-- **The empty lenticule is the told-nothing `⊥`** — vacuum, consistent. -/
theorem empty_consistent : (condensate 0).isInconsistency = false := rfl

/-- **A singly-threaded lenticule is a definite truth value** — consistent, not a defect. -/
theorem single_consistent : (condensate 1).isInconsistency = false := rfl

/-- **Over-occupation is the held `⊤` (the Bose condensate).** A lenticule the thread passes two
or more times is inconsistent — the condensate is the coherent contradiction, jammed not
exploded. The macroscopic occupation of one mode realized as a held `⊤`. -/
theorem over_occupation_inconsistency (n : Nat) :
    (condensate (n + 2)).isInconsistency = true := rfl

/-! ## The condensate settles out of the mirror -/

/-- **The empty pole is mirror-fixed.** The over/under gauge `~` leaves `⊥` where it is. -/
theorem mirror_fixes_empty : Reading.negate (condensate 0) = condensate 0 := rfl

/-- **The condensate pole is mirror-fixed.** Negation leaves the over-occupied `⊤` where it is:
the condensate sits at the mirror's fixed locus — what *settles out of* the mirror, not it. -/
theorem mirror_fixes_condensate_pole (n : Nat) :
    Reading.negate (condensate (n + 2)) = condensate (n + 2) := rfl

/-- **The mirror never creates or erases a condensate.** The contradiction content of a
lenticule's reading is gauge-invariant (`Reading.isInconsistency_negate`): the over/under flip
swaps the definite single-thread readings `t ↔ f` but fixes the `⊥`/`⊤` poles. The textile
`overUnder_swap_fixes_defect`, now for the lenticular carrier. -/
theorem mirror_fixes_condensate (n : Nat) :
    (Reading.negate (condensate n)).isInconsistency = (condensate n).isInconsistency :=
  Reading.isInconsistency_negate _

end AperiodicOrder.Tiling
end Obsmetrologia
