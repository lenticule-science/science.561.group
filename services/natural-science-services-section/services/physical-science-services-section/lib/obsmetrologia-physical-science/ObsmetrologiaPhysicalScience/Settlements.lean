import Obsmetrologia.Settlement
import ObsmetrologiaPhysicalScience.CausalSets.BlackHoles.Hole
import ObsmetrologiaPhysicalScience.CondensedMatter.Crystal.Glass

/-!
# Settlements in material tiling, beadwork, and causal boundary theory

The three physical instances of `Obsmetrologia.Settlement`: `Tiles` over a finite local rule,
a `Beads` thread over the lenticular hole-transition rule, and a `Hole`'s effect relation over
its causal boundary substrate. Together with the pure Čech instance `Settlement.ofCech1` they
make the four-fold recurrence `tiles_beads_hole_cech1_are_settlements`.
-/

namespace Obsmetrologia
namespace Settlement

/-! ## Instance 1 — Tiles as settlements of a finite local rule -/

/-- **`Tiles` are settlements of a finite local rule.** The base is a carrier with a
finite local rule (a `Graph`); the content is a listed pattern; the admission law is the
SFT `Path` predicate. `Tiles` unfolds to exactly this shape — no data is added or
dropped. -/
def ofTiles (T : AperiodicOrder.Crystal.Tiles) :
    Settlement (Base := Σ C : Type, Discrete.Graph C)
      (fun b => List b.1)
      (fun b w => AperiodicOrder.Tiling.Path b.2 w)
      (⟨T.Carrier, T.localRule⟩ : Σ C : Type, Discrete.Graph C) where
  content := T.word
  admits := T.admissible

/-! ## Instance 2 — Beads as settlements of the lenticular hole-transition rule -/

/-- **A `Beads` thread is a settlement of the lenticular hole-transition rule.** The base
is the lenticule carrier; the content is the routed thread (a list of oriented passes);
the admission law is `ThreadLegal` — every pass threads through its lenticule via the
hole-transition rule (`holeTransition`, the same `warpAlt` SFT the weave crossing uses).
`Beads.threadLegal` unfolds to exactly this shape — no data is added or dropped. -/
def ofBeadsThread (B : AperiodicOrder.Crystal.Beads) :
    Settlement (Base := Type) (fun L => AperiodicOrder.Tiling.Thread L)
      (fun _ Γ => AperiodicOrder.Tiling.ThreadLegal Γ)
      B.Lenticule where
  content := B.thread
  admits := B.threadLegal

/-! ## Instance 3 — Hole as a settlement of a causal boundary substrate -/

open CausalSets.BlackHoles in
/-- **A `Hole`'s effect relation is a settlement of its causal boundary substrate.** The
base is a causal substrate with a chosen readout (a causal set, its decidable causal
order, and the readout region) — these alone already determine `Shroud` combinatorially,
with no observed activity presupposed. The content is an effect relation; the admission
law is that every effect's source lies on the shroud (`effect_source_shrouded`). -/
def ofHole {E : Type} (H : Hole E) :
    Settlement
      (Base := Σ C : CausalSets.Causal.Order.CausalSet E, CausalLeDecision C × Region E)
      (fun _ => E → E → Prop)
      (fun b eff => letI := b.2.1; ∀ {x y}, eff x y → Shroud b.1 b.2.2 x = true)
      ⟨H.C, H.decision, H.readout⟩ where
  content := H.effect
  admits := H.effect_source_shrouded

/-! ## The recurring cell, instantiated four times -/

open CausalSets.BlackHoles in
open Cohomology in
/-- **The recurring settlement cell, met four times.** A `Tiles` value, a `Beads`
thread, a `Hole`'s effect relation, and a Čech datum's glued section over an agreeing
family are each a `Settlement` of their own base — the same two-field shape (content,
admission proof), independently instantiated in material tiling, lenticular beadwork,
causal boundary theory, and the bitopological settling site's own Čech gluing. This is
the extraction the module header promises, made a single citable fact rather than left
implicit across four separate definitions. -/
theorem tiles_beads_hole_cech1_are_settlements :
    (∀ T : AperiodicOrder.Crystal.Tiles, Nonempty
      (Settlement (Base := Σ C : Type, Discrete.Graph C) (fun b => List b.1)
        (fun b w => AperiodicOrder.Tiling.Path b.2 w)
        (⟨T.Carrier, T.localRule⟩ : Σ C : Type, Discrete.Graph C)))
    ∧ (∀ B : AperiodicOrder.Crystal.Beads, Nonempty
      (Settlement (Base := Type) (fun L => AperiodicOrder.Tiling.Thread L)
        (fun _ Γ => AperiodicOrder.Tiling.ThreadLegal Γ)
        B.Lenticule))
    ∧ (∀ {E : Type} (H : Hole E), Nonempty
      (Settlement
        (Base := Σ C : CausalSets.Causal.Order.CausalSet E,
          CausalLeDecision C × Region E)
        (fun _ => E → E → Prop)
        (fun b eff => letI := b.2.1; ∀ {x y}, eff x y → Shroud b.1 b.2.2 x = true)
        ⟨H.C, H.decision, H.readout⟩))
    ∧ (∀ (D : Cech1), Cocycle D → Nonempty
      (Settlement (Base := Cech1) (fun _ => AssocSheaf.Cochain)
        (fun D' g => Coboundary D' g) D)) :=
  ⟨fun T => ⟨ofTiles T⟩, fun B => ⟨ofBeadsThread B⟩, fun H => ⟨ofHole H⟩,
    fun D hcoc => ⟨ofCech1 D hcoc⟩⟩

end Settlement
end Obsmetrologia
