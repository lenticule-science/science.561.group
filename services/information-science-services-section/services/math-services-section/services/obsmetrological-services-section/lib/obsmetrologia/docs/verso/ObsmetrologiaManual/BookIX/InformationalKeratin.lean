import ObsmetrologiaManual.DocSetup
import ObsmetrologiaMaterials.Contact.CollatzBarrierDecidableCore

open Verso.Genre Manual InlineLean
open Obsmetrologia
open Obsmetrologia.Closure.Collatz
open Obsmetrologia.AperiodicOrder.Tiling.Witness
open Obsmetrologia.AperiodicOrder.MaterialSectors.Contact
open Obsmetrologia.AperiodicOrder.MaterialSectors

private abbrev TwoAdicCylinderLiftGap : Prop :=
  Obsmetrologia.AperiodicOrder.Tiling.ParentBarrierTwoAdicCylinderLiftGap

private theorem barrierFormationPositive (n : Nat) :
    CollatzBarrierKeratinFormation n <->
      2 < n /\ InfiniteBarrierStream n :=
  collatzBarrierKeratinFormation_iff_positive_infiniteBarrierStream n

private theorem barrierFormationAvoiding (n : Nat) :
    CollatzBarrierKeratinFormation n <->
      CylinderAvoidingBarrierStream n :=
  collatzBarrierKeratinFormation_iff_cylinderAvoidingBarrierStream n

private theorem barrierFormationNoContractingPrefix (n : Nat) :
    CollatzBarrierKeratinFormation n <->
      2 < n /\ Not (exists k, CoeffContracting (parityWord n k)) :=
  collatzBarrierKeratinFormation_iff_positive_no_contracting_prefix n

private theorem oneLockExcludesBarrierFormation
    (hgap : ParentBarrierGap) (hlock : ParentBarrierOneLockCollapse) :
    Not (exists n, CollatzBarrierKeratinFormation n) :=
  parentBarrierGap_and_oneLock_excludes_collatzBarrierKeratinFormation
    hgap hlock

private theorem barrierFormationRefutesOneLock
    (hgap : ParentBarrierGap) {n : Nat}
    (hform : CollatzBarrierKeratinFormation n) :
    Not ParentBarrierOneLockCollapse :=
  collatzBarrierKeratinFormation_refutes_parentBarrierOneLockCollapse
    hgap hform

private theorem noBarrierFormationPointwiseNotNot
    (hno : Not (exists n, CollatzBarrierKeratinFormation n)) :
    forall n, 2 < n -> Not (Not (exists k, CoeffContracting (parityWord n k))) :=
  no_collatzBarrierKeratinFormation_iff_pointwise_not_not_contracting_prefix.mp hno

private theorem decidableCoreNoStream
    (hno : Not (exists n, CollatzBarrierKeratinFormation n))
    (hdec :
      forall n, 2 < n ->
        Decidable ((collatzContractingPrefixQuestion n).Assertion)) :
    NoPositiveInfiniteBarrierStream :=
  noPositiveInfiniteBarrierStream_of_no_collatzBarrierKeratinFormation_and_decidable_assertions
    hno hdec

private theorem boundedCoreNoStream {B : Nat -> Nat}
    (hno : Not (exists n, CollatzBarrierKeratinFormation n))
    (hbound : ContractingPrefixBound B) :
    NoPositiveInfiniteBarrierStream :=
  noPositiveInfiniteBarrierStream_of_no_collatzBarrierKeratinFormation_and_contractingPrefixBound
    hno hbound

private theorem antimatterBoundaryPrefixCore
    {G : AperiodicOrder.Crystal.Glass}
    {gamma : AperiodicOrder.Crystal.Glass.RatBasinFreeEnergyBridge G}
    {b : G.basins.Basin} {theta : Real.Internal.Rat}
    (hboundary :
      Nonempty
        (KappaSectorCharges.AntimatterBarrierBoundary
          gamma b theta))
    (hlift : TwoAdicCylinderLiftGap)
    {n : Nat} (hn : 2 < n) :
    Nonempty (CollatzContractingPrefixCore n) :=
  collatzContractingPrefixCore_of_antimatterBarrierBoundary_and_cylinderLift
    hboundary hlift hn

private theorem fullSharedCarrierPrefixCore
    {G : AperiodicOrder.Crystal.Glass}
    {gamma : AperiodicOrder.Crystal.Glass.RatBasinFreeEnergyBridge G}
    {b : G.basins.Basin} {theta : Real.Internal.Rat}
    (hcarrier :
      Nonempty
        (KappaSectorCharges.FullSharedKappaCarrier
          gamma b theta))
    {n : Nat} (hn : 2 < n) :
    Nonempty (CollatzContractingPrefixCore n) :=
  collatzContractingPrefixCore_of_fullSharedKappaCarrier
    hcarrier hn

/-!
A teaching chapter for informational keratin as irreversible contact closure.
-/

#doc (Manual) "Informational keratin" =>

# Informational Keratin

Informational keratin is the upstream material page for every later
keratinous-disc claim. It does not mean biological keratin has been imported as a
primitive. It means a generated relational material has acquired directed
contacts and irreversible lock history.

The claim-site carried here is:

* claim-site: informational keratin as directed contact plus irreversible
  locking;
* phase: relational physical material after closure and gluing are lawful;
* generating sites: complete lattices, Tarski sheaf closure, directed contacts,
  compatible assignments, least compatible settling, and monotone inflationary
  transitions;
* downstream uses: felting, pilling, damage and fracture diagnostics, material
  contact closure, jammed boundary layers, keratinous-disc frontier pages, and
  honest hole material invariants;
* Lean carrier: `Obsmetrologia.AperiodicOrder.MaterialSectors.Contact.Keratin`;
* Blueprint/proof-tree nodes: no dedicated Blueprint node yet; this page is a
  manual promotion of the Lean carrier whose primitive provenance still runs
  through the mark and closure proof trees;
* provenance: the keratin mathematical material survey asked for a combinatorial
  keratin sheaf and a lock/history tier;
* familiar comparison: hair shaft contact, friction, felting, pilling, damage,
  fracture, and cellular-sheaf compatibility;
* reader closure: identify the generated lock law before reading the material
  name;
* frontier status: continuum rods, anisotropic mechanics, biochemical keratin
  structure, fracture PDEs, and experimental inverse modeling remain missing
  carriers.

The governing sentence is:

> Keratin begins when a settled contact complex can be irreversibly locked.

## Directed Contact

The keratin names are aliases for the shared Tarski closure carrier:

{docstring Obsmetrologia.AperiodicOrder.MaterialSectors.Contact.Contact}

{docstring Obsmetrologia.AperiodicOrder.MaterialSectors.Contact.KeratinComplex}

A contact is directed. Direction is not decoration: a contact restriction from
source to target need not be the same restriction in reverse. This is where the
physical reading becomes lawful, because frictional and hysteretic contact has a
generated carrier.

## Lock Transitions

An irreversible material transition is the carrier
{name Obsmetrologia.AperiodicOrder.MaterialSectors.Contact.Lock}`Lock`: a monotone, inflationary
step on a stalk lattice.

Its public inflation law is:

{docstring Obsmetrologia.AperiodicOrder.MaterialSectors.Contact.lock_infl}

Checked:

```lean
example {S : Order.CompleteLattice}
    (L : Lock S) (a : S.carrier) :
    S.le a (L.step a) :=
  lock_infl L a
```

This is the minimal material discipline. A lock grows the state and preserves
order. It does not relax the fiber back to an earlier value.

## History

A processing history is a list of locks:

{docstring Obsmetrologia.AperiodicOrder.MaterialSectors.Contact.History}

Running the history preserves irreversibility:

{docstring Obsmetrologia.AperiodicOrder.MaterialSectors.Contact.runHistory_infl}

and monotonicity:

{docstring Obsmetrologia.AperiodicOrder.MaterialSectors.Contact.runHistory_mono}

Checked:

```lean
example {S : Order.CompleteLattice}
    (hist : History S) (a : S.carrier) :
    S.le a (runHistory hist a) :=
  runHistory_infl hist a

example {S : Order.CompleteLattice}
    (hist : History S) {a b : S.carrier}
    (h : S.le a b) :
    S.le (runHistory hist a) (runHistory hist b) :=
  runHistory_mono hist h
```

The law is exact and small: processing history cannot erase what was already
locked in, and it respects the generated order on the stalk.

## Formation Streams

The infinite formation layer is generated from finite lock prefixes:

{docstring Obsmetrologia.AperiodicOrder.MaterialSectors.Contact.LockStream}

{docstring Obsmetrologia.AperiodicOrder.MaterialSectors.Contact.runLockPrefix}

{docstring Obsmetrologia.AperiodicOrder.MaterialSectors.Contact.lockStreamLimit}

Each finite prefix lies below the formed limit:

{docstring Obsmetrologia.AperiodicOrder.MaterialSectors.Contact.runLockPrefix_le_limit}

The finite prefixes are directed:

{docstring Obsmetrologia.AperiodicOrder.MaterialSectors.Contact.runLockPrefix_le_of_le}

{docstring Obsmetrologia.AperiodicOrder.MaterialSectors.Contact.runLockPrefix_directed}

and the same law holds vertexwise over a keratin complex:

{docstring Obsmetrologia.AperiodicOrder.MaterialSectors.Contact.lockStreamLimitSeed}

{docstring Obsmetrologia.AperiodicOrder.MaterialSectors.Contact.lockStreamPrefixSeed_le_limitSeed}

Settling the formed seed has the same least-compatible reading:

{docstring Obsmetrologia.AperiodicOrder.MaterialSectors.Contact.settle_lockStreamLimit_is_least_compatible}

Checked:

```lean
example {S : Order.CompleteLattice}
    (stream : LockStream S) (k : Nat) (a : S.carrier) :
    S.le
      (runLockPrefix stream k a)
      (lockStreamLimit stream a) :=
  runLockPrefix_le_limit stream k a

example {S : Order.CompleteLattice}
    (stream : LockStream S) (a : S.carrier) (i j : Nat) :
    exists k,
      S.le (runLockPrefix stream i a)
        (runLockPrefix stream k a) /\
      S.le (runLockPrefix stream j a)
        (runLockPrefix stream k a) :=
  runLockPrefix_directed stream a i j

example {S : Order.CompleteLattice}
    (K : KeratinComplex S)
    (hist : K.Vertex -> LockStream S)
    (seed : Obsmetrologia.Tarski.Assign K)
    (k : Nat) :
    (Obsmetrologia.Tarski.AssignCL S K.Vertex).le
      (lockStreamPrefixSeed K hist seed k)
      (lockStreamLimitSeed K hist seed) :=
  lockStreamPrefixSeed_le_limitSeed K hist seed k
```

This is the precise sense in which the infinite keratin object is a result of
formation: it is the directed lattice join of finite irreversible
approximations, not an extra primitive state.

## Collatz Barrier Formation

The Collatz no-stream complement uses the same formation carrier. The lock stream
fires one finite prefix event at each stage:

{docstring Obsmetrologia.AperiodicOrder.MaterialSectors.Contact.collatzBarrierPrefixLockStream}

{docstring Obsmetrologia.AperiodicOrder.MaterialSectors.Contact.runLockPrefix_collatzBarrierPrefixSeed}

Every finite prefix event belongs to the formed limit:

{docstring Obsmetrologia.AperiodicOrder.MaterialSectors.Contact.collatzBarrierPrefix_mem_limit}

Certification on that formed limit is exactly a positive infinite Collatz
barrier stream:

{docstring Obsmetrologia.AperiodicOrder.MaterialSectors.Contact.CollatzBarrierKeratinFormation}

{docstring Obsmetrologia.AperiodicOrder.MaterialSectors.Contact.collatzBarrierKeratinFormation_iff_positive_infiniteBarrierStream}

{docstring Obsmetrologia.AperiodicOrder.MaterialSectors.Contact.collatzBarrierKeratinFormation_iff_cylinderAvoidingBarrierStream}

{docstring Obsmetrologia.AperiodicOrder.MaterialSectors.Contact.collatzBarrierKeratinFormation_excludes_noPositiveInfiniteBarrierStream}

{docstring Obsmetrologia.AperiodicOrder.MaterialSectors.Contact.collatzBarrierKeratinFormation_of_no_contracting_prefix}

{docstring Obsmetrologia.AperiodicOrder.MaterialSectors.Contact.collatzBarrierKeratinFormation_iff_positive_no_contracting_prefix}

{docstring Obsmetrologia.AperiodicOrder.MaterialSectors.Contact.noPositiveInfiniteBarrierStream_excludes_collatzBarrierKeratinFormation}

{docstring Obsmetrologia.AperiodicOrder.MaterialSectors.Contact.parentBarrierGap_and_oneLock_excludes_collatzBarrierKeratinFormation}

{docstring Obsmetrologia.AperiodicOrder.MaterialSectors.Contact.collatzBarrierKeratinFormation_refutes_parentBarrierOneLockCollapse}

{docstring Obsmetrologia.AperiodicOrder.MaterialSectors.Contact.no_collatzBarrierKeratinFormation_implies_not_not_contracting_prefix}

{docstring Obsmetrologia.AperiodicOrder.MaterialSectors.Contact.no_collatzBarrierKeratinFormation_iff_pointwise_not_not_contracting_prefix}

The next layer uses the same decidable-core machinery that the aperiodic
witness stack uses for undecidable existence questions:

{docstring Obsmetrologia.AperiodicOrder.Tiling.Witness.ExistenceQuestion}

{docstring Obsmetrologia.AperiodicOrder.Tiling.Witness.DecidableCore}

{docstring Obsmetrologia.AperiodicOrder.Tiling.Witness.DecidableCore.ofCertificate}

{docstring Obsmetrologia.AperiodicOrder.Tiling.Witness.DecidableCore.assertion}

{docstring Obsmetrologia.AperiodicOrder.MaterialSectors.Contact.collatzContractingPrefixQuestion}

{docstring Obsmetrologia.AperiodicOrder.MaterialSectors.Contact.CollatzContractingPrefixCore}

{docstring Obsmetrologia.AperiodicOrder.MaterialSectors.Contact.collatzContractingPrefixQuestion_assertion_iff}

{docstring Obsmetrologia.AperiodicOrder.MaterialSectors.Contact.collatzContractingPrefixCore_witness}

{docstring Obsmetrologia.AperiodicOrder.MaterialSectors.Contact.collatzContractingPrefixCore_of_everyNonterminalContracts}

{docstring Obsmetrologia.AperiodicOrder.MaterialSectors.Contact.collatzContractingPrefixCore_of_no_collatzBarrierKeratinFormation_and_decidable_assertion}

{docstring Obsmetrologia.AperiodicOrder.MaterialSectors.Contact.noPositiveInfiniteBarrierStream_of_no_collatzBarrierKeratinFormation_and_decidable_assertions}

{docstring Obsmetrologia.AperiodicOrder.MaterialSectors.Contact.collatzBoundedContractingPrefixQuestion}

{docstring Obsmetrologia.AperiodicOrder.MaterialSectors.Contact.CollatzBoundedContractingPrefixCore}

{docstring Obsmetrologia.AperiodicOrder.MaterialSectors.Contact.collatzBoundedContractingPrefixQuestion_decidable}

{docstring Obsmetrologia.AperiodicOrder.MaterialSectors.Contact.ContractingPrefixBound}

{docstring Obsmetrologia.AperiodicOrder.MaterialSectors.Contact.boundedCollatzContractingPrefixCore_of_no_collatzBarrierKeratinFormation_and_bound}

{docstring Obsmetrologia.AperiodicOrder.MaterialSectors.Contact.collatzBoundedContractingPrefixCore_witness}

{docstring Obsmetrologia.AperiodicOrder.MaterialSectors.Contact.noPositiveInfiniteBarrierStream_of_no_collatzBarrierKeratinFormation_and_contractingPrefixBound}

The carrier search finds the witness-producing edge under its existing material
name:

{docstring Obsmetrologia.AperiodicOrder.MaterialSectors.KappaSectorCharges.AntimatterBarrierBoundary}

{docstring Obsmetrologia.AperiodicOrder.MaterialSectors.KappaSectorCharges.antimatter_barrier_boundary_iff_cylinderLiftContracts}

{docstring Obsmetrologia.AperiodicOrder.MaterialSectors.Contact.collatzContractingPrefixCore_of_antimatterBarrierBoundary_and_cylinderLift}

{docstring Obsmetrologia.AperiodicOrder.MaterialSectors.Contact.collatzContractingPrefixCore_of_fullSharedKappaCarrier}

Checked:

```lean
example (n : Nat) :
    CollatzBarrierKeratinFormation n <->
      2 < n /\ InfiniteBarrierStream n :=
  barrierFormationPositive n

example (n : Nat) :
    CollatzBarrierKeratinFormation n <->
      CylinderAvoidingBarrierStream n :=
  barrierFormationAvoiding n

example (n : Nat) :
    CollatzBarrierKeratinFormation n <->
      2 < n /\
        Not (exists k,
          CoeffContracting (parityWord n k)) :=
  barrierFormationNoContractingPrefix n

example (hgap : ParentBarrierGap)
    (hlock : ParentBarrierOneLockCollapse) :
    Not (exists n, CollatzBarrierKeratinFormation n) :=
  oneLockExcludesBarrierFormation hgap hlock

example (hgap : ParentBarrierGap) {n : Nat}
    (hform : CollatzBarrierKeratinFormation n) :
    Not ParentBarrierOneLockCollapse :=
  barrierFormationRefutesOneLock hgap hform

example
    (hno :
      Not (exists n,
        CollatzBarrierKeratinFormation n)) :
    forall n, 2 < n ->
      Not (Not (exists k,
        CoeffContracting (parityWord n k))) :=
  noBarrierFormationPointwiseNotNot hno

example
    (hno :
      Not (exists n,
        CollatzBarrierKeratinFormation n))
    (hdec :
      forall n, 2 < n ->
        Decidable
          (ExistenceQuestion.Assertion
            (collatzContractingPrefixQuestion n))) :
    NoPositiveInfiniteBarrierStream :=
  decidableCoreNoStream hno hdec

example {B : Nat -> Nat}
    (hno :
      Not (exists n,
        CollatzBarrierKeratinFormation n))
    (hbound : ContractingPrefixBound B) :
    NoPositiveInfiniteBarrierStream :=
  boundedCoreNoStream hno hbound

example {G : AperiodicOrder.Crystal.Glass}
    {gamma : AperiodicOrder.Crystal.Glass.RatBasinFreeEnergyBridge G}
    {b : G.basins.Basin} {theta : Real.Internal.Rat}
    (hboundary :
      Nonempty
        (KappaSectorCharges.AntimatterBarrierBoundary
          gamma b theta))
    (hlift : TwoAdicCylinderLiftGap)
    {n : Nat} (hn : 2 < n) :
    Nonempty (CollatzContractingPrefixCore n) :=
  antimatterBoundaryPrefixCore hboundary hlift hn

example {G : AperiodicOrder.Crystal.Glass}
    {gamma : AperiodicOrder.Crystal.Glass.RatBasinFreeEnergyBridge G}
    {b : G.basins.Basin} {theta : Real.Internal.Rat}
    (hcarrier :
      Nonempty
        (KappaSectorCharges.FullSharedKappaCarrier
          gamma b theta))
    {n : Nat} (hn : 2 < n) :
    Nonempty (CollatzContractingPrefixCore n) :=
  fullSharedCarrierPrefixCore hcarrier hn
```

This finds the shared carrier without closing the Collatz frontier: a formed
keratin prefix-limit is the same object as a positive infinite Collatz barrier
stream, and equivalently a positive seed with no finite contracting prefix.
Absence of all such formations is therefore exactly the pointwise double-negated
finite-contraction frontier. The next adapter is now green: using the existing
decidable-core vocabulary, a decision procedure for each seed's
contracting-prefix assertion produces the witness core, and a finite search
bound produces bounded cores without assuming unbounded search decidability.
The carrier-level pass finds more: the existing anti-matter barrier boundary
already carries the cylinder-lift-to-contraction implication, so it produces
contracting-prefix cores once the cylinder-lift face is supplied. A full shared
κ-carrier produces the same cores from its carried Collatz projection. What
remains to close is the construction of that anti-matter boundary for the
geometric Collatz surface, rather than a generic witness-extraction principle.

## Locked Seeds And Settling

Locking a seed is vertexwise history:

{docstring Obsmetrologia.AperiodicOrder.MaterialSectors.Contact.lockSeed}

and the locked seed dominates the original:

{docstring Obsmetrologia.AperiodicOrder.MaterialSectors.Contact.seed_le_lockSeed}

The key theorem says settling a locked seed reaches the least compatible state
above it:

{docstring Obsmetrologia.AperiodicOrder.MaterialSectors.Contact.settle_lock_is_least_compatible}

Checked:

```lean
example {S : Order.CompleteLattice}
    (K : KeratinComplex S)
    (hist : K.Vertex -> History S)
    (seed : Obsmetrologia.Tarski.Assign K) :
    forall v, S.le (seed v) (lockSeed K hist seed v) :=
  seed_le_lockSeed K hist seed
```

This is why the page belongs after closure and gluing. Keratin is not a label on
a substance. It is a directed contact complex plus a least compatible locked
section.

## Event Lattice

The constructive event tier is
{name Obsmetrologia.AperiodicOrder.MaterialSectors.Contact.LockEvent}`LockEvent`: felt lock,
pilling, damage, and fracture are the named irreversible events.

and firing an event is an inflationary lock on the powerset lattice:

{docstring Obsmetrologia.AperiodicOrder.MaterialSectors.Contact.addEvent}

Checked:

```lean
example {E : Type} (ev : E) (s : E -> Prop) :
    (addEvent ev).step s ev :=
  addEvent_fires ev s

example {E : Type} (ev : E) (s : E -> Prop) :
    (Obsmetrologia.Tarski.Powerset E).le
      s ((addEvent ev).step s) :=
  addEvent_infl ev s
```

This is the honest upstream meaning of "informational keratin": a growing event
set whose material locks are monotone, inflationary, and then settled against
directed compatibility.

## Frontier Promotion

To promote biological keratin, the library would need carriers for continuous
fiber geometry, anisotropic friction tensors, scale morphology, fracture energy,
and experimental measurement maps. The present page proves the relational
contact/lock skeleton only. That skeleton is enough to support later
keratinous-disc frontier language, but it is not the biological theorem.
