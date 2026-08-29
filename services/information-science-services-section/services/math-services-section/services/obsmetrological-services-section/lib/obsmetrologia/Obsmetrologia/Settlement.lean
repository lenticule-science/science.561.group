import Obsmetrologia.Cohomology.SettlingCohomologyH1
import Obsmetrologia.CausalSets.BlackHoles.Hole
import Obsmetrologia.AperiodicOrder.Crystal.Glass

/-!
# Settlement — the recurring site/settlement shape

This module extracts one recurring shape met independently in four places in this
library, none built with the others in mind: a bare carrier/rule/topology (a **site**)
paired with actual accreted content that satisfies the site's own admission law (a
**settlement**). The shape is abstracted once, in the style of
`Language.Positing.Quartet`'s `CommutingPair` (one coherence cell, instantiated at
articulating and settling depth): here the cell is instantiated at four domains —
material tiling, lenticular beadwork, causal boundary theory, and the bitopological
settling site itself.

* `AperiodicOrder.Crystal.Tiles` — a `localRule : Graph Carrier` (the bare rule) paired
  with a `word : List Carrier` proven `admissible` against it.
* `AperiodicOrder.Crystal.Beads` — a `Lenticule : Type` (the bare lenticule carrier)
  paired with a routed `thread : Thread Lenticule` proven `threadLegal` against the
  lenticular hole-transition rule.
* `CausalSets.BlackHoles.Hole` — a causal substrate and chosen readout region
  (which determine `Shroud` combinatorially, with no observed activity presupposed) paired
  with an `effect` relation whose every source is shroud-supported.
* `Cohomology.Cech1` — a Čech datum (a cover and local sections, the bitopological
  settling site's own cover machinery) paired with a global section that is a
  `Coboundary` of an agreeing family (`Cocycle`), reusing `glue`/`glue_coboundary` from
  `h1_vanishes` rather than re-deriving gluing.

What is **not** part of the shared cell, matching `Quartet`'s own discipline of naming
the depth-specific extras it excludes: `Tiles`, `Beads`, and `Hole` carry their content as
data inside one record, while the Čech instance's content is a witness pulled from a
separate gluing theorem (`glue`) rather than a field of `Cech1` itself — the base and the
content are related existentially there, not by a shared constructor. The abstraction
below is built at the level all four shapes actually support: a base, a content type
indexed by the base, and an admission predicate — nothing more.
-/

namespace Obsmetrologia

/-- **A settlement of a base `base`.** `Content` is the type of content a base of this
kind can carry; `Admits` is the base's own admission law. A settlement supplies actual
content together with a proof it is admitted — the site `base` inhabited. -/
structure Settlement.{u, v} {Base : Type u} (Content : Base → Type v)
    (Admits : (b : Base) → Content b → Prop) (base : Base) where
  /-- The accreted content laid over the base. -/
  content : Content base
  /-- The content is admitted by the base's own law. -/
  admits : Admits base content

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

/-! ## Instance 4 — a Čech datum's glued section as a settlement of the bitopological
settling site -/

open Cohomology in
/-- **A Čech datum's glued section is a settlement of the bitopological settling site.**
The base is a `Cech1` datum — a cover of the site together with local sections; the
content is a global section (a `Cochain`); the admission law is being a `Coboundary` of
the datum. For an agreeing family (`Cocycle`), the glued section (`glue`) is admitted —
reusing `glue_coboundary`, the constructive half of `h1_vanishes`, rather than
re-deriving gluing. -/
def ofCech1 (D : Cech1) (hcoc : Cocycle D) :
    Settlement (Base := Cech1) (fun _ => AssocSheaf.Cochain)
      (fun D' g => Coboundary D' g) D where
  content := glue D
  admits := glue_coboundary D hcoc

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
