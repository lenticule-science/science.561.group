import Obsmetrologia.AperiodicOrder.Tiling.MatterTopology

/-!
# Boundary link graphs factor through the matter topology receipt

Emitted boundary graphs arrive from several surfaces: taxonomy incidence and
JSON-LD `@id`/`@graph` incidence. Once an emitter supplies the same three
cover-nerve counts, with the union-find invariant required by
`CoverNerve`, each surface has the same matter reading: take its cover nerve and
then read the matter-topology receipt.

## Main definitions

* `BoundaryLinkGraph` carries an emitted graph surface by its entities, links,
  connected components, and cover-nerve invariant.
* `BoundaryLinkGraph.coverNerve` is the uniform passage to `CoverNerve`.
* `matterTopology.receipt` reads a cover nerve into the proved matter ledger.
* `BoundaryLinkGraph.mass` is the single emitted-graph matter map.

## Main results

* `h1Rank_coverNerve_eq_firstBetti` identifies the cover-nerve `H1rank` with the
  emitted graph's first Betti count.
* `loadBearing_coverNerve_iff_crossReferenceCycle` says the graph bears load
  exactly when its cross-reference cycle predicate holds.
* `mass_factors_through_coverNerve` records the uniform factorization
  `mass = matterTopology.receipt o coverNerve`.
-/

namespace Obsmetrologia
namespace AperiodicOrder.Tiling

open Obsmetrologia.Cohomology

/-- The emitted surface from which a boundary link graph was read. -/
inductive BoundaryLinkSurface where
  /-- Taxonomy incidence: item-to-class or item-to-term incidence. -/
  | taxonomyIncidence
  /-- JSON-LD `@id`/`@graph` incidence. -/
  | jsonLdGraph
  deriving DecidableEq, Repr

/-- A boundary link graph carried by the cover-nerve counts its emitter has
already computed: entities, links, connected components, and the spanning-forest
invariant required by `CoverNerve`. -/
structure BoundaryLinkGraph where
  /-- The surface that emitted the graph. -/
  surface : BoundaryLinkSurface
  /-- `|V|`: the emitted graph's entity vertices. -/
  entities : Nat
  /-- `|E|`: the emitted graph's cross-reference links. -/
  links : Nat
  /-- `|C|`: connected components in the emitted graph. -/
  components : Nat
  /-- Every component contains an emitted entity. -/
  components_le_entities : components ≤ entities
  /-- The spanning-forest bound inherited from the component computation. -/
  entities_le_links_add_components : entities ≤ links + components

namespace BoundaryLinkGraph

/-- The cover nerve of an emitted boundary link graph. -/
def coverNerve (G : BoundaryLinkGraph) : CoverNerve where
  entities := G.entities
  cells := G.links
  components := G.components
  components_le_entities := G.components_le_entities
  entities_le_cells_add_components := G.entities_le_links_add_components

/-- The emitted graph's first Betti count, read as surplus links over a spanning
forest. -/
def firstBetti (G : BoundaryLinkGraph) : Nat := G.links + G.components - G.entities

/-- A cross-reference cycle is present exactly when the emitted graph is not at
the spanning-forest boundary. -/
def crossReferenceCycle (G : BoundaryLinkGraph) : Prop :=
  G.entities ≠ G.links + G.components

/-- The cover-nerve `H1rank` of an emitted boundary graph is its first Betti
count. -/
theorem h1Rank_coverNerve_eq_firstBetti (G : BoundaryLinkGraph) :
    G.coverNerve.H1rank = G.firstBetti := by
  rfl

/-- The emitted boundary graph bears load exactly when a cross-reference cycle
exists. -/
theorem loadBearing_coverNerve_iff_crossReferenceCycle (G : BoundaryLinkGraph) :
    loadBearing G.coverNerve ↔ G.crossReferenceCycle := by
  rw [loadBearing_iff_not_forest]
  rfl

/-- Short form of `loadBearing_coverNerve_iff_crossReferenceCycle`. -/
theorem loadBearing_iff_crossReferenceCycle (G : BoundaryLinkGraph) :
    loadBearing G.coverNerve ↔ G.crossReferenceCycle :=
  loadBearing_coverNerve_iff_crossReferenceCycle G

/-- A taxonomy-incidence graph as matter-topology data. -/
def taxonomyIncidenceGraphMatter (entities links components : Nat)
    (hcomponents : components ≤ entities)
    (hforest : entities ≤ links + components) : BoundaryLinkGraph where
  surface := BoundaryLinkSurface.taxonomyIncidence
  entities := entities
  links := links
  components := components
  components_le_entities := hcomponents
  entities_le_links_add_components := hforest

/-- A JSON-LD `@id`/`@graph` entity graph as matter-topology data. -/
def entityGraphMatter (entities links components : Nat)
    (hcomponents : components ≤ entities)
    (hforest : entities ≤ links + components) : BoundaryLinkGraph where
  surface := BoundaryLinkSurface.jsonLdGraph
  entities := entities
  links := links
  components := components
  components_le_entities := hcomponents
  entities_le_links_add_components := hforest

end BoundaryLinkGraph

/-- The proved matter ledger read from a cover nerve. -/
structure MatterLedger where
  /-- The first Betti / cycle-rank receipt. -/
  cycleRank : Nat
  /-- The load-bearing proposition carried by the same receipt. -/
  bearsLoad : Prop

/-- The matter-topology receipt: one ledger value for one cover nerve. -/
def matterTopology.receipt (N : CoverNerve) : MatterLedger where
  cycleRank := N.H1rank
  bearsLoad := loadBearing N

namespace BoundaryLinkGraph

/-- The single matter map from any emitted boundary graph to the proved matter
ledger. -/
def mass (G : BoundaryLinkGraph) : MatterLedger :=
  matterTopology.receipt G.coverNerve

/-- The emitted graph's mass factors through `coverNerve` and the
matter-topology receipt. -/
theorem mass_factors_through_coverNerve (G : BoundaryLinkGraph) :
    G.mass = matterTopology.receipt G.coverNerve := by
  rfl

/-- The mass receipt records the same first Betti count as the emitted boundary
graph. -/
theorem mass_cycleRank_eq_firstBetti (G : BoundaryLinkGraph) :
    G.mass.cycleRank = G.firstBetti := by
  exact h1Rank_coverNerve_eq_firstBetti G

/-- The mass receipt is load-bearing exactly when the emitted graph has a
cross-reference cycle. -/
theorem mass_bearsLoad_iff_crossReferenceCycle (G : BoundaryLinkGraph) :
    G.mass.bearsLoad ↔ G.crossReferenceCycle :=
  loadBearing_coverNerve_iff_crossReferenceCycle G

end BoundaryLinkGraph

end AperiodicOrder.Tiling
end Obsmetrologia
