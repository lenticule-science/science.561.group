import Obsmetrologia.AperiodicOrder.Tiling.AndersonPutnam
import Obsmetrologia.Closure.InverseLimit

/-!
# The inverse-limit hull `lim← stage` — the geometric dual of the Anderson–Putnam colimit

`AndersonPutnam` builds the **direct** limit `DirectedSystem.Colimit = lim→ stage` — the aperiodic
cohomology `H¹(Ω) ≅ lim→ (Ȟ(Γ) →^{ω*} ⋯)`. The **space** it is the cohomology *of* — the tiling
**hull** `Ω = lim← (Γ ←^{ω*} ⋯)` — is the dual *inverse* limit. The limit machinery
(`InverseSystem`, `Thread`, `Hull`, the stage separation) is `Closure.InverseLimit`; this module
instantiates it at the constant `H1Class` system and pairs the hull to `cl-inv`.

## Main definitions

* `apHullSystem`, `constThread`, `seamMap` — the dual of `apSystem`: the constant `H1Class` inverse
  system, its (constant) threads, and the seam reading a thread to its `H¹`-class.

## Main results

* `hull_pairs_clinv` — the seam `Hull → H1Class` is surjective and the aperiodic witness's **nonzero**
  class `[1] ≠ 0` is realized by a thread: the geometric hull carries the cohomological obstruction
  `cl-inv` that `AndersonPutnam` classifies. So the hull and the colimit are the two halves of one
  Anderson–Putnam node.

## Scope and frontier

This builds the inverse-limit hull and pairs it to `cl-inv`; the `apHullSystem` instance is the
*constant* (cohomology-valued, countable) hull whose threads are constant `H¹`-classes. The
**uncountable Cantor** hull (the odometer `stage n = Fin n → Bool` with prefix restriction, whose
inverse limit is `2^ℕ`) and the conjectural **`hullLeaf ≅ Real`** accretion (the dense-ordered
metric continuum the residuation accretes on the leaf) are the red frontier — blueprint
`thm:bilattice-stable-top-conflict` / the `hullLeaf ≅ Real` node; they need the non-thin carrier and
the reals and are not asserted here.

## References

* `…/aperiodic-settling/commutating/content/aperiodic-nuclear-quartet-category/content/anderson-putnam-direct-limit/anderson-putnam-direct-limit.md`
-/

namespace Obsmetrologia
namespace AperiodicOrder.Tiling

/-! ## The constant `H1Class` hull — the dual of `apSystem`, pairing the hull to `cl-inv` -/

/-- **The constant Anderson–Putnam inverse system** (dual of `apSystem`): every stage carries the
same `H1Class` and the bonding map is the identity (the `ω*` self-map on the single classifying
generator). Its hull is the constant threads. -/
def apHullSystem : InverseSystem where
  stage _ := H1Class
  proj _ x := x
  proj_id _ _ := rfl
  proj_comp _ _ _ _ := rfl

/-- The **constant thread** at an `H¹`-class `c`: the value `c` at every stage (coherent since the
bonding map is the identity). -/
def constThread (c : H1Class) : apHullSystem.Thread where
  at_ _ := c
  coh _ := rfl

/-- **The seam** `Hull → H1Class`: read a thread of the constant system to its `H¹`-class (its value
at stage `0`). This is the map carrying a hull point to the cohomological class it represents. -/
def seamMap (t : apHullSystem.Thread) : H1Class := t.at_ 0

/-- The seam reads off the class of a constant thread. -/
@[simp] theorem seamMap_constThread (c : H1Class) : seamMap (constThread c) = c := rfl

/-- **The seam is surjective onto `H1Class`.** Every cohomology class is the seam of a (constant)
hull thread — the hull carries every value of `cl-inv`. -/
theorem seamMap_surjective : ∀ c : H1Class, ∃ t : apHullSystem.Thread, seamMap t = c :=
  fun c => ⟨constThread c, rfl⟩

/-- **The hull carries the aperiodic obstruction.** There is a hull thread whose seam is the
aperiodic witness's classifying invariant, and that class is **nonzero** (`[1] ≠ 0`). So the
inverse-limit hull realizes the nonzero `cl-inv` that `AndersonPutnam`'s colimit classifies — the
geometric and cohomological halves of the Anderson–Putnam node meet on the aperiodic witness. -/
theorem hull_pairs_clinv :
    ∃ t : apHullSystem.Thread, seamMap t = aperiodicWitness.clInv ∧ seamMap t ≠ H1Class.zero :=
  ⟨constThread aperiodicWitness.clInv, rfl, aperiodicWitness_clinv_nonzero⟩

/-- **The hull is non-trivial.** It has distinct threads (the constant threads at distinct classes),
separated by the stage-`0` projection (`seamMap`) — the hull is not a point. -/
theorem apHull_has_distinct_threads : ∃ t t' : apHullSystem.Thread, t ≠ t' :=
  ⟨constThread ⟨0⟩, constThread ⟨1⟩, fun h => by
    have hc : (⟨0⟩ : H1Class) = ⟨1⟩ := congrArg seamMap h
    exact absurd hc (by decide)⟩

end AperiodicOrder.Tiling
end Obsmetrologia
