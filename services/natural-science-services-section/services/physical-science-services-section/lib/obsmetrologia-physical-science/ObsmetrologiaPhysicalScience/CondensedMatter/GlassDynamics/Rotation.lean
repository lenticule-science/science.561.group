import ObsmetrologiaPhysicalScience.CondensedMatter.GlassDynamics.Overlap
import Obsmetrologia.Language.Positing.D4Gauge

/-!
# Rotating configurations — the multi-body gauge orbit

`Overlap` compares two `Configuration`s (a genuine two-body carrier: a count over
distinct `x, y`). `D4Gauge` rotates a single `Reading` (a genuine one-body carrier:
`D8.act g` moves one value). Neither module, alone, states a claim that is both
multi-body and rotational. This module wires the two: `rotate g` lifts one gauge
element `g : D8` across every site of a configuration at once, so two
configurations are `IsRotationOf` each other when a single shared `g` carries every
site of one to the corresponding site of the other simultaneously — the many-site,
two-copy generalization of `Percolation.spin`'s one-reading self-orbit
(`fundamentalCycle`).

## Main definitions
* `rotate` — apply one gauge element to every site of a configuration.
* `IsRotationOf` — two configurations related by a single shared gauge element.

## Main results
* `isRotationOf_refl`, `isRotationOf_symm`, `isRotationOf_trans` — `IsRotationOf` is
  an equivalence relation, carried by `D8`'s group laws (`act_id`, `act_mul`,
  `mul_assoc`, `inv_mul`/`mul_inv`).
* `overlapCount_self_rotate` — the overlap of a configuration with its own
  `g`-rotation counts exactly the sites whose reading `g` fixes.

## References
`AperiodicOrder.Tiling.Percolation.spin` (single-reading rotation);
`AperiodicOrder.GlassDynamics.Overlap` (two-configuration comparison);
`Language.Positing.D4Gauge` (the proven `D8 = Aut(FOUR)` group).

## Tags
rotation, gauge, configuration, multi-body, orbit
-/

namespace Obsmetrologia
namespace AperiodicOrder.GlassDynamics

open Obsmetrologia.D4 (D8)

/-- **Rotate** a configuration by one shared gauge element: every site's reading is
moved by the same `g`. -/
def rotate {Site : Type} (g : D8) (x : Configuration Site Reading) : Configuration Site Reading :=
  fun s => D8.act g (x s)

@[simp] theorem rotate_id {Site : Type} (x : Configuration Site Reading) :
    rotate D8.id x = x := by
  funext s; exact D8.act_id (x s)

theorem rotate_mul {Site : Type} (g h : D8) (x : Configuration Site Reading) :
    rotate g (rotate h x) = rotate (D8.mul g h) x := by
  funext s; exact (D8.act_mul g h (x s)).symm

/-- **`y` is a rotation of `x`**: some single gauge element carries every site of
`x` to the corresponding site of `y` at once. The multi-body (many-site,
two-configuration) generalization of a single charge's `D8` orbit. -/
def IsRotationOf {Site : Type} (x y : Configuration Site Reading) : Prop :=
  ∃ g : D8, rotate g x = y

/-- Reflexive: `x` is its own rotation by `id`. -/
theorem isRotationOf_refl {Site : Type} (x : Configuration Site Reading) :
    IsRotationOf x x :=
  ⟨D8.id, rotate_id x⟩

/-- Symmetric: the inverse gauge element undoes a rotation. -/
theorem isRotationOf_symm {Site : Type} {x y : Configuration Site Reading}
    (h : IsRotationOf x y) : IsRotationOf y x := by
  obtain ⟨g, hg⟩ := h
  refine ⟨D8.inv g, ?_⟩
  rw [← hg, rotate_mul, D8.inv_mul, rotate_id]

/-- Transitive: rotations compose via `D8.mul`. -/
theorem isRotationOf_trans {Site : Type} {x y z : Configuration Site Reading}
    (hxy : IsRotationOf x y) (hyz : IsRotationOf y z) : IsRotationOf x z := by
  obtain ⟨g, hg⟩ := hxy
  obtain ⟨h, hh⟩ := hyz
  exact ⟨D8.mul h g, by rw [← rotate_mul, hg, hh]⟩

/-- **The rotation-overlap bridge.** The overlap between a configuration and its
own `g`-rotation counts exactly the sites whose reading `g` fixes — turning the
two-body `Overlap` count into a fixed-point census of the one-body gauge action. -/
theorem overlapCount_self_rotate
    {Site : Type} (sites : List Site) (g : D8) (x : Configuration Site Reading) :
    overlapCount sites x (rotate g x) =
      sites.countP (fun s => decide (x s = D8.act g (x s))) := rfl

end AperiodicOrder.GlassDynamics
end Obsmetrologia
