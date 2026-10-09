import Obsmetrologia.Cohomology.AntiLandauerEntropy
import ObsmetrologiaPhysicalScience.CondensedMatter.MatterTopology

/-!
# Vitrimer exchange: the reversible material tier on the index ledger

`Contact.Keratin` is the irreversible tier: felting, pilling and fracture are inflationary locks.
This module is its reversible complement, the **vitrimer**. A vitrimer (Montarnal–Capelot–
Tournilhac–Leibler 2011) is a covalent network whose bonds exchange **associatively**: a new bond
forms before the old one breaks, so every exchange conserves the number of bonds. The network
rearranges its topology above a topology-freezing temperature yet never dissolves.

On a `CoverNerve` that conservation is a fixed pair `(|V|, |E|)`. Everything else follows from
the index balance `H⁰ − H¹ = χ` of `AntiLandauer`:

* an associative exchange is a `ClosureIndexStep` (`AssociativeExchange.toClosureIndexStep`);
  rigidity class is fixed with it, since mean coordination `2|E|/|V|` is a function of the pair;
* an exchange that closes `d` new rings must shed exactly `d` new components
  (`backbiting_sheds_cyclics`). This is ring–chain equilibrium: a siloxane chain that bites back
  on itself closes a ring and releases it as a free cyclic (D4, D5, D6);
* re-inserting `d` free cyclics opens exactly `d` rings (`ring_opening_absorbs_cycles`);
* an exchange that keeps the component count keeps the Landauer charge
  (`h1_eq_of_components_eq`).

The two exchange mechanisms differ in which side of the ledger the transition state borrows from.
The associative intermediate carries one extra bond (pentacoordinate silicon); when it merges no
component it is exactly `Tiling.jamming_click`, one extra held cycle. The dissociative
intermediate carries one bond fewer (`dissociative_intermediate_raises_euler`): cutting a ring
bond discharges a Landauer bit (`dissociative_ring_cut_discharges`); cutting a bridge discharges
nothing and fragments the network (`dissociative_bridge_cut_fragments`), the thermoplastic's
loss of integrity.

## Main definitions
* `AssociativeExchange` — a before/after nerve pair with equal entity and cell counts.

## Main results
* `AssociativeExchange.preserves_euler`, `AssociativeExchange.toClosureIndexStep`.
* `AssociativeExchange.backbiting_sheds_cyclics`, `AssociativeExchange.ring_opening_absorbs_cycles`.
* `AssociativeExchange.h1_eq_of_components_eq`.
* `dissociative_intermediate_raises_euler`, `dissociative_ring_cut_discharges`,
  `dissociative_bridge_cut_fragments`.

## References
Montarnal, Capelot, Tournilhac, Leibler, *Science* 334 (2011) 965; Jacobson–Stockmayer,
*J. Chem. Phys.* 18 (1950) 1600 (ring–chain equilibrium). Corpus: the semiotic-smart-material
note `2026-10-01-note-on-associative-exchange-and-the-ring-chain-ledger.md`.

## Tags
vitrimer, associative exchange, ring–chain equilibrium, Euler characteristic, Landauer
-/

namespace Obsmetrologia
namespace AperiodicOrder.MaterialSectors

open Obsmetrologia.Cohomology
open Obsmetrologia.AntiLandauer

/-- An **associative exchange**: the nerve rewires, but its entity and cell counts are both
conserved — every bond broken is paid for by a bond formed. -/
structure AssociativeExchange where
  /-- The nerve before the exchange. -/
  before : CoverNerve
  /-- The nerve after the exchange. -/
  after : CoverNerve
  /-- No entity is created or destroyed. -/
  entities_eq : after.entities = before.entities
  /-- No bond is created or destroyed. -/
  cells_eq : after.cells = before.cells

namespace AssociativeExchange

/-- Associative exchange conserves the Euler index. -/
theorem preserves_euler (x : AssociativeExchange) : PreservesEuler x.before x.after := by
  unfold PreservesEuler eulerChar
  rw [x.entities_eq, x.cells_eq]

/-- Every associative exchange is an index-preserving closure step. -/
def toClosureIndexStep (x : AssociativeExchange) : ClosureIndexStep :=
  ⟨x.before, x.after, x.preserves_euler⟩

/-- **Backbiting sheds cyclics.** An associative exchange that closes `d` new rings must release
exactly `d` new components: the rings leave the network as free cyclics. -/
theorem backbiting_sheds_cyclics (x : AssociativeExchange) (d : Nat)
    (h : x.after.H1rank = x.before.H1rank + d) :
    x.after.components = x.before.components + d := by
  have hb := x.before.entities_le_cells_add_components
  have ha := x.after.entities_le_cells_add_components
  have he := x.entities_eq
  have hc := x.cells_eq
  unfold CoverNerve.H1rank at h
  omega

/-- **Ring opening absorbs cycles.** An associative exchange that re-absorbs `d` free components
opens exactly `d` rings into the network. -/
theorem ring_opening_absorbs_cycles (x : AssociativeExchange) (d : Nat)
    (h : x.before.components = x.after.components + d) :
    x.before.H1rank = x.after.H1rank + d := by
  have hb := x.before.entities_le_cells_add_components
  have ha := x.after.entities_le_cells_add_components
  have he := x.entities_eq
  have hc := x.cells_eq
  unfold CoverNerve.H1rank
  omega

/-- An associative exchange that keeps the component count keeps the Landauer charge. -/
theorem h1_eq_of_components_eq (x : AssociativeExchange)
    (hk : x.after.components = x.before.components) :
    x.after.H1rank = x.before.H1rank := by
  have hb := x.before.entities_le_cells_add_components
  have ha := x.after.entities_le_cells_add_components
  have he := x.entities_eq
  have hc := x.cells_eq
  unfold CoverNerve.H1rank
  omega

end AssociativeExchange

/-! ## The dissociative intermediate -/

/-- Breaking one bond before forming its replacement raises the Euler index by one: the
dissociative intermediate leaves the ledger on the harmonic side. -/
theorem dissociative_intermediate_raises_euler (N N' : CoverNerve)
    (hc : N'.cells + 1 = N.cells) (he : N'.entities = N.entities) :
    eulerChar N' = eulerChar N + 1 := by
  unfold eulerChar
  omega

/-- Cutting a ring bond (no component split) discharges exactly one Landauer bit. -/
theorem dissociative_ring_cut_discharges (N N' : CoverNerve)
    (hc : N'.cells + 1 = N.cells) (he : N'.entities = N.entities)
    (hk : N'.components = N.components) :
    N.H1rank = N'.H1rank + 1 := by
  have h := N'.entities_le_cells_add_components
  unfold CoverNerve.H1rank
  omega

/-- Cutting a bridge discharges no cycle and splits the network: the dissociative pathway's
loss of integrity. -/
theorem dissociative_bridge_cut_fragments (N N' : CoverNerve)
    (hc : N'.cells + 1 = N.cells) (he : N'.entities = N.entities)
    (hk : N'.components = N.components + 1) :
    N'.H1rank = N.H1rank := by
  unfold CoverNerve.H1rank
  omega

end AperiodicOrder.MaterialSectors
end Obsmetrologia
