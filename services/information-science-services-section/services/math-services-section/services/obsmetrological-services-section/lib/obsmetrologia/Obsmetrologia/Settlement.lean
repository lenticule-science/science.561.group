import Obsmetrologia.Cohomology.SettlingCohomologyH1

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

This module holds the abstraction and its pure instance (`ofCech1`). The tiling, beadwork and
causal-boundary instances (`ofTiles`, `ofBeadsThread`, `ofHole`) and the four-fold theorem
`tiles_beads_hole_cech1_are_settlements` live in the physical-science package's `Settlements`
module.
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

end Settlement
end Obsmetrologia
