import InfomaterialManual.DocSetup
import Infomaterial.Relational.Material.Contact.ShroudIndexedKeratin
import Infomaterial.Relational.Spacetime.Boundary.Infohole
import Infomaterial.Relational.DenseMatter.EOS
import Infomaterial.Relational.DenseMatter.PastaTopology

open Verso.Genre Manual InlineLean
open Infomaterial
open Infomaterial.Relational.Material
open Infomaterial.Relational.DenseMatter
open Infomaterial.Relational.Spacetime.Causal.Net
open Infomaterial.Relational.Spacetime.Causal.Order
open Infomaterial.Relational.Spacetime.Boundary.Infohole

/-!
A frontier teaching chapter for keratinous discs of infoholes.
-/

#doc (Manual) "Keratinous infohole disc" =>

# Keratinous Disc Of Infoholes

This page gives the phrase a lawful home by treating it as non-effective
descent. A keratinous disc of infoholes is not a new primitive
object, not an astrophysical accretion-disc theorem, and not a biological
keratin theorem. It is a frontier claim-site whose local pieces are generated
but whose global representing object is still absent:

* no-readout shroud in finite causal spacetime;
* irreversible directed contact closure in informational keratin;
* finite dense-matter admissibility and excursion topology.

The claim-site carried here is:

* claim-site: keratinous disc of infoholes as a frontier
  boundary-material composite;
* phase: relational physical phases downstream of causal spacetime and
  informational keratin;
* generating sites: `Infohole`, `InfoholeRegion`, `Shroud`,
  `ShroudIndexedKeratin`, `KeratinComplex`, `Lock`, `lockSeed`,
  `FiniteEOS`, and `CellComplex`;
* downstream uses: infohole/dense-matter diagnostics, boundary-jamming
  models, shroud-local material persistence, and comparison-atlas entries that
  distinguish metaphor from theorem;
* Lean carriers: `Infomaterial.Relational.Spacetime.Boundary.Infohole`,
  `Infomaterial.Relational.Material.Contact.ShroudIndexedKeratin`,
  `Infomaterial.Relational.DenseMatter.EOS`, and
  `Infomaterial.Relational.DenseMatter.PastaTopology`;
* Blueprint/proof-tree nodes: `thm:infohole-region`,
  `thm:infohole-future-closed`, `thm:finite-eos`, `thm:eos-speed-bound`,
  `thm:pasta-cell-complex`, and `thm:pasta-euler-witnesses`; no node yet
  asserts the composite disc;
* provenance: infohole, neutron-matter, dense-matter, and keratin frontier
  notes;
* familiar comparison: accretion disc, event horizon, nuclear pasta, surface hair,
  hardened contact layer, and black-hole information boundary as a later
  physical reading;
* reader closure: read the page as descent data; keep the three local carriers
  separate until a product, fibration, or indexed complex welds them;
* frontier status: the shroud-indexed keratin carrier is settled, but the disc
  composite is missing. A promotion would need a disc adjacency topology and a
  theorem linking that topology to the shroud-indexed material carrier.

The governing sentence is:

> The keratinous disc is frontier until shroud-indexed keratin and dense
> excursion topology are welded by a single Lean carrier.

In descent language: the local sections exist, but the descent is not yet
effective.

## Settled Inputs

The infohole side is settled only as finite causal no-readout:

{docstring Infomaterial.Relational.Spacetime.Boundary.Infohole.InfoholeRegion}

{docstring Infomaterial.Relational.Spacetime.Boundary.Infohole.Shroud}

The keratin side is settled as shroud-indexed directed contact and irreversible
lock:

{docstring Infomaterial.Relational.Material.ShroudIndexedKeratin}

{docstring Infomaterial.Relational.Material.KeratinComplex}

{docstring Infomaterial.Relational.Material.lockSeed}

The dense side is settled only as finite sampled admissibility and the finite
cell-complex carrier
{name Infomaterial.Relational.DenseMatter.CellComplex}`CellComplex`:

{docstring Infomaterial.Relational.DenseMatter.Admissible}

These inputs are real Lean carriers. The shroud/material weld is now an actual
carrier. The composite disc is the missing representing object.

## The Boundary Law

The shroud side contributes a closure law:

{docstring Infomaterial.Relational.Spacetime.Boundary.Infohole.infohole_future_closed}

Checked:

```lean
example {E : Type} (C : CausalSet E) (readout : Region E) :
    FutureClosedRegion C (InfoholeRegion C readout) :=
  infohole_future_closed C readout
```

The law says no-readout is future-closed. It does not say there is a physical
surface with material structure.

## The Keratin Law

The material side contributes irreversible growth:

{docstring Infomaterial.Relational.Material.runHistory_infl}

Checked:

```lean
example {S : Order.CompleteLattice}
    (hist : History S) (a : S.carrier) :
    S.le a (runHistory hist a) :=
  runHistory_infl hist a
```

The law says lock history only grows the stalk state, and
`ShroudIndexedKeratin` says which shroud events carry those stalks. It does not
say the shroud has entropy, quantum information, biological keratin, or disc
morphology.

## The Dense-Matter Law

The dense-matter side contributes a sampled causal bound:

{docstring Infomaterial.Relational.DenseMatter.admissible_speed_bound}

and a finite morphology witness:

{docstring Infomaterial.Relational.DenseMatter.filledTriangle_euler}

{docstring Infomaterial.Relational.DenseMatter.hollowTriangle_euler}

Checked:

```lean
example :
    Admissible stiffEOS 1 :=
  stiffEOS_admissible

example :
    eulerChar filledTriangle = 1 :=
  filledTriangle_euler
```

The law says sampled dense matter can be constrained and finite topology can
distinguish a filled disc from a loop. It does not prove neutron-star structure,
nuclear pasta in continuum matter, or a black-hole accretion disc.

## Non-Effective Descent

The page is not trying to make the phrase true by accumulation. It is recording
a descent problem:

* the shroud law restricts the support to no-readout boundary behavior;
* the shroud-indexed keratin carrier welds boundary support to irreversible
  lock history;
* the dense-matter law restricts the morphology to finite admissible and
  topological witnesses;
* the overlap maps between shroud-indexed contact adjacency and disc adjacency
  are not yet Lean declarations;
* therefore the descent datum is not effective.

That is the point. The phrase is mathematically usable only because the missing
gluing object is named.

## What A Promotion Would Require

The missing carrier should not be hidden. A real
`KeratinousShroudDisc` would at least package:

* a `ShroudIndexedKeratin` carrier;
* a finite disc complex or excursion complex recording the annular/disk
  morphology;
* compatibility between shroud-indexed contact adjacency and disc adjacency;
* a theorem that locked boundary settling is least compatible while remaining
  supported on the shroud-local disc.

That carrier is absent today. The page therefore teaches the frontier honestly:
the phrase is lawful only as non-effective descent awaiting construction. The
settled claims are the three input laws above.

## Frontier Diagnostics

Do not promote any of the following without new Lean:

* "infoholes have keratin" is settled only at the shroud-indexed carrier level;
  a disc needs a further topology carrier;
* "the disc is an accretion disc" needs orbital, energy, and continuum-fluid
  carriers;
* "the disc computes black-hole entropy" needs an entropy functional and an area
  or generalized-entropy theorem;
* "the disc resolves information loss" needs quantum-information carriers,
  Hilbert/operator or categorical equivalents, and a Page-curve or channel
  theorem.

What the present library does have is already useful: no-readout future closure,
shroud-indexed irreversible lock history, least compatible locked settling,
sampled EOS admissibility, and finite disc/loop topology. The next proof task is
to weld the indexed material carrier to disc morphology.
