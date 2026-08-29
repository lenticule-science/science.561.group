import InfomaterialManual.DocSetup
import Infomaterial.Relational.Material.Contact.ShroudIndexedKeratin
import Infomaterial.Relational.Spacetime.Boundary.Infohole
import Infomaterial.Relational.DenseMatter.EOS
import Infomaterial.Relational.DenseMatter.PastaTopology

open Verso.Genre Manual InlineLean
open Infomaterial
open Infomaterial.Relational.Material
open Infomaterial.Relational.DenseMatter
open Infomaterial.Relational.Spacetime.Causal.Cone
open Infomaterial.Relational.Spacetime.Causal.Net
open Infomaterial.Relational.Spacetime.Causal.Order
open Infomaterial.Relational.Spacetime.Boundary.Infohole

/-!
A teaching chapter for the descent address between informational keratin and
the shroud-indexed keratinous-disc frontier.
-/

#doc (Manual) "Shroud-indexed keratin" =>

# Shroud-Indexed Keratin

This page is the missing hinge between informational keratin and the later
keratinous infohole disc. It constructs the shroud-indexed keratin carrier. It
does not construct the disc.

The claim-site carried here is:

* claim-site: shroud-indexed keratin as non-effective boundary-material
  descent data;
* phase: relational physical phases downstream of causal spacetime, gluing,
  irreversible material locks, and finite dense-matter topology;
* generating sites: `Infohole`, `Shroud`, `InfoholeRegion`,
  `ShroudIndexedKeratin`, `KeratinComplex`, `History`, `lockSeed`,
  `runHistory`, `Admissible`, `CellComplex`, and excursion filtration;
* downstream uses: keratinous-disc frontier pages, infohole material projection
  diagnostics, boundary jamming, and any future shroud-local material carrier;
* Lean carriers: `Infomaterial.Relational.Spacetime.Boundary.Infohole`,
  `Infomaterial.Relational.Material.Contact.ShroudIndexedKeratin`,
  `Infomaterial.Relational.DenseMatter.EOS`, and
  `Infomaterial.Relational.DenseMatter.PastaTopology`;
* Blueprint/proof-tree nodes: `thm:infohole-region`,
  `thm:infohole-future-closed`, `thm:finite-eos`,
  `thm:shroud-indexed-keratin`, `thm:eos-speed-bound`,
  `thm:pasta-cell-complex`, and `thm:pasta-euler-witnesses`;
* provenance: the infohole, dense-matter, and keratin frontier notes all ask
  for a boundary material layer, but the Lean library currently carries only the
  separated inputs;
* familiar comparison: event horizon with hair, hardened boundary layer, accretion
  skin, nuclear-pasta morphology, and surface memory;
* reader closure: the shroud-indexed material carrier now welds the index and
  stalk lock; the disc topology is still a separate frontier;
* frontier status: the shroud-indexed material carrier is settled. Promotion to
  a disc still needs a disc adjacency or cell complex on the same sites and a
  theorem linking shroud indexing to disc morphology.

The governing sentence is:

> Shroud-indexed keratin is the first welded material object over an infohole
> shroud; the disc remains frontier.

The word "indexed" matters. A keratin complex has its own vertices. A shroud
has proof-carrying events in a causal set. A dense disc has cells. The frontier
begins where one pretends those are already the same address. This page now
provides the common shroud index for keratin; it does not identify that index
with a disc complex.

## The Boundary Index

The boundary input is no-readout plus exterior adjacency:

{docstring Infomaterial.Relational.Spacetime.Boundary.Infohole.Shroud}

The checked consequences are exactly causal:

```lean
example {E : Type} (C : CausalSet E) (readout : Region E)
    {x : E} (h : Shroud C readout x) :
    InfoholeRegion C readout x :=
  shroud_in_infohole C readout h

example {E : Type} (C : CausalSet E) (readout : Region E)
    {x : E} (h : Shroud C readout x) :
    Not (ReadoutExterior C readout x) :=
  shroud_not_exterior C readout h
```

This is the only proved infohole boundary input used here. It is not a smooth
null hypersurface, not an area theorem, and not a quantum-information theorem.

## The Material Lock

The material input is irreversible growth in a stalk:

{docstring Infomaterial.Relational.Material.runHistory_infl}

and event firing as powerset growth:

{docstring Infomaterial.Relational.Material.addEvent}

Checked:

```lean
example {S : Order.CompleteLattice}
    (hist : History S) (a : S.carrier) :
    S.le a (runHistory hist a) :=
  runHistory_infl hist a

example (s : LockEvent -> Prop) :
    (addEvent LockEvent.fracture).step
      s LockEvent.fracture :=
  addEvent_fires LockEvent.fracture s
```

This proves irreversibility before indexing. The shroud-indexed carrier below
adds the address map saying which listed shroud events carry which keratin
stalks.

## The Welded Carrier

The carrier is:

{docstring Infomaterial.Relational.Material.ShroudIndexedKeratin}

It exposes the shroud address of each keratin vertex:

{docstring Infomaterial.Relational.Material.ShroudIndexedKeratin.shroudEvent_on_shroud}

and the underlying event point:

{docstring Infomaterial.Relational.Material.ShroudIndexedKeratin.shroudPoint}

and the indexed lock law:

{docstring Infomaterial.Relational.Material.ShroudIndexedKeratin.lockedSeed_infl}

The carrier also preserves the least-compatible settling theorem after locking:

{docstring Infomaterial.Relational.Material.ShroudIndexedKeratin.settle_locked_least_compatible}

This is the missing weld between shroud support and material lock. It still does
not construct a disc topology.

## The Disc Topology

The disc input is finite morphology, not continuum geometry. A cell complex and
an excursion filtration provide the finite topological side:

{name Infomaterial.Relational.DenseMatter.CellComplex}`CellComplex`

{docstring Infomaterial.Relational.DenseMatter.excVerts_anti}

Checked:

```lean
example {V : Type} (K : CellComplex V) (rho : V -> Nat)
    {theta1 theta2 : Nat} (h : theta1 <= theta2)
    {v : V} (hv : v ∈ excVerts K rho theta2) :
    v ∈ excVerts K rho theta1 :=
  excVerts_anti K rho h hv

example :
    eulerChar filledTriangle = 1 :=
  filledTriangle_euler
```

The word "disc" is therefore a finite topology witness at this phase. A smooth
annulus, accretion flow, stress-energy tensor, or continuum persistent homology
would require new carriers.

## The Admissibility Constraint

The dense-matter side can also constrain sampled matter by a finite EOS:

{docstring Infomaterial.Relational.DenseMatter.admissible_speed_bound}

Checked:

```lean
example {a b : Nat}
    (ha : a ∈ stiffEOS.samples) (hb : b ∈ stiffEOS.samples)
    (hab : a <= b) :
    stiffEOS.pressure b <=
      stiffEOS.pressure a
        + 1 * (stiffEOS.energy b - stiffEOS.energy a) :=
  admissible_speed_bound
    stiffEOS 1 stiffEOS_admissible ha hb hab
```

This is a sampled causal bound. It does not identify the sample sites with the
shroud-indexed keratin vertices.

## The Remaining Disc Weld

A future `KeratinousShroudDisc` carrier would have to package at least:

* a `ShroudIndexedKeratin` carrier;
* a finite disc or excursion complex using the same support;
* compatibility between causal adjacency, contact restriction, and disc
  adjacency;
* a theorem that locked settling remains least compatible and boundary-local.

Until those additional fields and laws are in Lean, a keratinous disc of
infoholes is not a theorem. The shroud-indexed keratin layer is now settled; the
disc is the remaining representing object.

## Reader Closure

When reading the next page, perform this closure:

1. The shroud supplies the index as a finite no-readout boundary.
2. Shroud-indexed keratin welds that index to irreversible directed contact.
3. Dense matter supplies finite admissibility and morphology only as sampled
   carriers.
4. The disc claim is frontier exactly because no declaration welds the indexed
   keratin carrier to disc morphology.

That is the lawful sense of "informational black hole" as a later projection here:
an infohole carrier over causal readout failure, not an astrophysical theorem
smuggled into the foundation.
