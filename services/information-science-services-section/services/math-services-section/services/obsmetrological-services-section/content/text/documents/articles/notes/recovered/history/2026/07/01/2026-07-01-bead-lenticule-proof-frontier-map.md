---
title: "Bead and lenticule proof frontier map"
date: "2026-07-01"
status: "live-corpus audit note"
scope: "chromatic, tiling, beadwork, crystal, quasicrystal, and aperiodic-order material"
---

This note records what the current Infomaterial corpus actually proves about
the bead/lenticule phase between tiles and crystals, and what remains only a
frontier projection.  It reads the named formal files, the Blueprint
infotiles/infobeads/infohair chain, and the June 2026 survey/memo trail as
mathematics and physics.  It does not treat beadwork as a metaphor for a
different domain.

## Central result

The current green spine is finite:

```text
Tiles -> Beads -> Crystals -> Quasicrystals
```

`Infomaterial.Relational.Material.Glass` now makes the bead phase a real
intermediate carrier.  A bead layer carries:

- a tile layer;
- a lenticule carrier;
- a legal ported thread walk;
- a condensate charge read from thread pass count;
- four named adjacency readings, namely thread, contact, cell, and visible;
- a finite site-level lenticle as the overlap of two clopen material patches;
- a finite placement graph whose condensed contacts test load-bearing.

The crystal theorem
`Infomaterial.Relational.Material.Glass.Crystals.bead_phase_spine` proves that,
under over-occupation and threshold crossing, a crystal retains the legal
thread, contradiction-bearing condensate, mirror-stable contradiction, four
adjacency readings, clopen overlap cover, and load-bearing placement.

The quasicrystal theorem
`Infomaterial.Relational.Material.Glass.Quasicrystals.bead_phase_spine` proves
the same bead spine one layer higher, plus the finite universal diffraction
mass of the underlying crystal occupation pattern.

The extra thing earned by passing from crystal to quasicrystal is therefore not
an analytic diffraction measure.  It is the finite diffraction readout already
carried by `Infomaterial.Persistence.Aperiodic.Diffraction`.

## What is proved

### Coloring and chromatic carriers

The coloring layer proves finite graph-coloring facts.
`GraphColoring.lean` defines proper coloring, colorability, complete graphs,
graph homomorphisms, and proves that proper colorings are graph homomorphisms
into a complete graph.  It also proves the Boolean/bipartite equivalence, the
odd-closed-walk obstruction to bipartiteness, and the FOUR-coloring reading.

`ChromaticNumber.lean` proves exact finite lower-bound witnesses for complete
graphs: an edge needs two colors, a triangle is not Boolean-colorable, and the
FOUR complete graph forces an injective four-charge coloring.

`ColoringEntropy.lean` proves finite counting statements: the two proper
edge-colorings give one bit in the local logarithmic carrier, and the triangle
has six proper three-colorings.

`TileAdjacencyChromatic.lean` proves finite tile-adjacency chromatic witnesses:
orthogonal, triangular, and king adjacency conventions have explicit palette
carriers, exact lower-bound witnesses, and FOUR-colorability for every realized
corpus tile-adjacency convention.

What this earns: color is a finite observable and obstruction carrier.  A
proper coloring is not only decoration; it is a lawful finite factor of an
adjacency graph.  A chromatic obstruction can be named precisely when the graph
carrier is present.

What it does not yet earn: the Blueprint node
`thm:chromatic-obstruction-structural-defect` remains frontier.  The current
formal layer proves graph-coloring obstructions, but the stronger physical
claim that such an obstruction is an irremovable textile or beadwork defect
still needs a carrier linking graph obstruction, stitch geometry, repair moves,
and material persistence.

### Spectral and geometric quantities

`ChromaticTileRayleigh.lean` proves a finite Rayleigh/Dirichlet story: squared
norms and Dirichlet energies are nonnegative, zero Dirichlet energy is
equivalent to flatness, flatness is equivalent to constancy, and the finite
chain nerve has the expected anti-Landauer/Landauer index balance.  The
two-site and three-site gap identities are exact finite algebraic witnesses.

`ChromaticTileGap.lean` and `ChromaticTileCubicGap.lean` prove algebraic gap
identities: quadratic surd root equations for small tile gaps, and the cubic
reduction/bracketing tied to the seventh-turn trace polynomial.

What this earns: chromatic number and tile order are already being read as
finite spectral/geometric quantities through energy, gap, flatness, and
algebraic root witnesses.

What it does not yet earn: no theorem here gives a continuum spectral measure,
a full thermodynamic limit, or a universal analytic gap law for arbitrary
aperiodic tilings.

### Defects, curvature, and settling

`WeaveDraft.lean` proves the base textile charge facts: plain weave is a finite
local rule, forbidden floats are actual path obstructions, the crossing datum
lands in `Charge`, a mis-crossing is the held contradiction pole, a defect-free
crossing is consistent, mirroring preserves contradiction content, and the
charge-coloured draft is sofic.

`ChromaticLorentzian.lean` proves the finite settling frame: orbit, bisimulation,
settle-kernel classification, self-absorption into the settled value, and a
non-idempotent finite step whose settled quotient is classified.

The Blueprint infohair node "curvature defects are the Einstein-Hilbert action"
is a physics reading of finite causal settling and curvature/action projection.
It is strongest where it remains tied to the formal causal-chain and action
carriers.  It should not be read as a finished continuum gravitational theorem.

What this earns: a defect is a held contradiction in the charge carrier, and
settling supplies a finite order-theoretic route for reading propagation and
absorption.

What it does not yet earn: the full "defects as curvature" reading remains a
frontier projection unless the relevant continuum action, material embedding,
and curvature carrier are explicitly present in the theorem being cited.

### Beads and lenticules

The bead layer now has a finite material realization:
`BeadMaterialRealization.lenticle` is the overlap of two clopen patches, lies
under each side patch, and pulls the two-patch cover back to the duplicated
overlap cover.  `Beads.geometricLenticle_eq_overlap`,
`Crystals.beadGeometricLenticle_eq_overlap`, and
`Quasicrystals.beadGeometricLenticle_eq_overlap` carry this upward.

The best existing candidate for "lenticle physics" is therefore not a new
analytic lens object.  It is the finite two-cover overlap object carried by
`BeadMaterialRealization`, together with its propagation through crystals and
quasicrystals.  The July 1 transcript-recovery note correctly treats the older
"lenticle physics" phrase as unstable and frontier-marked.  The current corpus
has now stabilized one nearby formal object: the bead lenticle as clopen
overlap and pulled-back cover.

What this earns: a bead can be a phase between tile and crystal precisely
because it adds legal ported thread, condensate charge, finite overlap
geometry, multi-adjacency, and placement topology before crystal occupation is
read.

What it does not yet earn: it does not prove pairwise distinction of the four
adjacency graphs, visible-surface soficity as a factor of the thread walk,
graph-threading as a settled closed walk, an analytic lens/optics law, or a
continuum mechanics theorem.

### Percolation and load-bearing topology

`Percolation.lean` and the infobeads Blueprint chain prove the deterministic
finite topology: excess contacts are the order parameter, the spanning forest
plus one contact is the load-bearing threshold, percolation onset is monotone,
density is necessary but not sufficient, and placement is the missing bridge
from count to load-bearing topology.

`Glass.Beads.loadBearing_of_condensed_crosses_threshold`,
`Crystals.bead_loadBearing_of_condensed_crosses_threshold`, and
`Quasicrystals.bead_loadBearing_of_condensed_crosses_threshold` insert that
placement threshold into the bead/crystal/quasicrystal spine.

What this earns: condensate density becomes material only when it is placed
into a contact topology.  Beads are the finite phase where charge count becomes
load-bearing graph topology.

What it does not yet earn: the probabilistic critical fraction is still red.
The gauge-canonical top-rate exists, and the deterministic threshold exists,
but their full probabilistic network law remains a frontier node.

### Diffraction, metallic means, and quasicrystals

`Diffraction.lean` proves finite diffraction mass on finite events, monotonicity
of that mass, homometric invariance, finite component decompositions, finite
Pisot/Salem classifier agreement, finite Fourier readout mass, and finite
pure-point quasicrystal predicates under Pisot-side hypotheses.

`MetallizationDichotomy.lean` proves the metallic recurrence, a chromatic
residue that is not metalized, and a summability inequality for the
transcendental residue.  `ColorPredictor.lean` packages trace sign-change and
level-colour evidence.

The infohair node "weaving is metallic: the Pisot-Salem diffraction dichotomy"
is green only at the finite classifier/readout level.  The finite corpus can
name the Pisot side as pure point and the Salem side as singular continuous in
its finite diffraction classifier.

What this earns: a quasicrystal phase receives a finite diffraction readout
over the crystal occupation pattern, and the Pisot/Salem split is reflected in
finite component tags.

What it does not yet earn: it does not prove an infinite-volume diffraction
measure, full cut-and-project diffraction, or analytic pure-point/singular
continuous spectral decomposition.

### Survey and ethnomathematical boundary

The June 26 beadwork, textile, and ethnomathematics surveys are useful because
they name the outside mathematical pressure without turning it into a theorem.
They identify beadwork as ported rigid units plus thread paths, local stitch
grammar, visible colour, material law, and cultural obligation.  They also warn
that beadwork and textile practices are living knowledge systems, not raw
examples to be mined for symmetry or graph theory.

What this earns: the bead phase belongs mathematically between tile and crystal
because the corpus has now formalized several of those ingredients: port
legality, thread occupation, charge, finite adjacency readings, placement
topology, and clopen overlap.  It also belongs ethically in a proof/frontier
ledger: formalization is allowed only where the carrier is named, and broader
cultural or material claims remain contextual, not absorbed.

## Frontier ledger

| Topic | Green carrier | Frontier residue |
|---|---|---|
| coloring as obstruction | `ProperColoring`, `GraphHom`, odd closed walks, `K4_requires_FOUR` | structural defect that cannot be repaired in a material stitch system |
| chromatic number as spectral/geometric | finite Dirichlet, flatness, gap identities | analytic spectral law or thermodynamic limit |
| bead ports | legal ported thread pass | full multi-hole stitch transition system |
| bead condensate | pass-count charge, over-occupation contradiction | mechanics of tension, slack, friction, and repair |
| multi-adjacency | four named graphs on one lenticule carrier | pairwise separation and visible sofic factor theorem |
| lenticle | clopen overlap and pulled-back cover | analytic lens, optics, or continuum geometry |
| percolation | deterministic threshold and placement bridge | probabilistic critical fraction |
| crystals | finite bead spine retained by crystal occupation | lattice crystallography or continuum crystal elasticity |
| quasicrystals | crystal bead spine plus finite diffraction mass | infinite diffraction measure and full cut-and-project spectrum |
| metallic weaving | finite Pisot/Salem classifier and readout | analytic Pisot/Salem diffraction theorem |
| ethnomathematics | boundary note and cautionary survey | any extraction of living bead/textile traditions into a universal formal grammar |

## Verification certificate

This note's main green anchors were checked against the live formal corpus on
2026-07-01.  The scan is not a whole-library audit; it is a representative
certificate for the finite theorem spine used above.

| Carrier | Declaration | Axioms reported | Source notes |
|---|---|---|---|
| crystal bead spine | `Infomaterial.Relational.Material.Glass.Crystals.bead_phase_spine` | none | none |
| quasicrystal bead spine | `Infomaterial.Relational.Material.Glass.Quasicrystals.bead_phase_spine` | none | none |
| coloring as graph homomorphism | `Infomaterial.Combinatorics.properColoring_iff_hom` | none | none |
| FOUR lower-bound witness | `Infomaterial.Combinatorics.K4_requires_FOUR` | none | none |
| corpus tile FOUR-colourability | `Infomaterial.Combinatorics.corpus_planar_tile_patches_four_colorable` | `propext` | none |
| finite Rayleigh carrier | `Infomaterial.Flow.ChromaticTileRayleigh.chromatic_tile_rayleigh` | `propext`, `Quot.sound` | local notation in the formal file |
| mis-crossing inconsistency | `Infomaterial.Persistence.Aperiodic.miscrossing_isInconsistency` | none | none |
| chromatic settling classification | `Infomaterial.Persistence.Aperiodic.ChromaticLorentzian.chromatic_lorentzian_classification` | `Quot.sound` | none |
| deterministic percolation threshold | `Infomaterial.Persistence.Aperiodic.loadBearing_iff_critical` | `propext`, `Quot.sound` | none |
| density gap | `Infomaterial.Persistence.Aperiodic.density_not_sufficient` | `propext`, `Quot.sound` | none |
| finite diffraction mass | `Infomaterial.Persistence.Aperiodic.finiteDiffractionMass_univ` | `propext` | none |
| finite Fourier colour readout | `Infomaterial.Persistence.Aperiodic.finiteFourierDual_color_readout` | `propext` | none |
| bead lenticle overlap | `Infomaterial.Relational.Material.Glass.BeadMaterialRealization.lenticle_eq_overlap` | none | none |

The recurring `propext`/`Quot.sound` entries are the same foundational equality
debt already present elsewhere in the site and real/quotient carriers.  They do
not turn any frontier projection green; they only describe the proof footprint
of the finite carriers listed here.

## Working conclusion

The bead/lenticule phase is now more than prose.  It is the finite phase that
turns tile-local rules into crystal-supporting material order by inserting:

1. legal ported thread movement;
2. condensate charge;
3. a finite clopen overlap/lenticle;
4. four adjacency readings;
5. placement topology;
6. a threshold for load-bearing;
7. a retained crystal spine;
8. a retained quasicrystal spine with finite diffraction mass.

That is the honest mathematical earning.  The remaining physics is real but
frontier-marked: analytic diffraction, continuum curvature, continuum material
mechanics, probabilistic criticality, graph-threading settlement, and
ethnomathematical generalization all require new carriers before they can be
claimed as theorems.
