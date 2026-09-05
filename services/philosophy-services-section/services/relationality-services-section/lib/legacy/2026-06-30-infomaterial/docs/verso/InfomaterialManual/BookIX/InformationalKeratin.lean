import InfomaterialManual.DocSetup
import Infomaterial.Relational.Material.Contact.Keratin

open Verso.Genre Manual InlineLean
open Infomaterial
open Infomaterial.Relational.Material

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
  honest infohole material invariants;
* Lean carrier: `Infomaterial.Relational.Material.Contact.Keratin`;
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

{docstring Infomaterial.Relational.Material.Contact}

{docstring Infomaterial.Relational.Material.KeratinComplex}

A contact is directed. Direction is not decoration: a contact restriction from
source to target need not be the same restriction in reverse. This is where the
physical reading becomes lawful, because frictional and hysteretic contact has a
generated carrier.

## Lock Transitions

An irreversible material transition is the carrier
{name Infomaterial.Relational.Material.Lock}`Lock`: a monotone, inflationary
step on a stalk lattice.

Its public inflation law is:

{docstring Infomaterial.Relational.Material.lock_infl}

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

{docstring Infomaterial.Relational.Material.History}

Running the history preserves irreversibility:

{docstring Infomaterial.Relational.Material.runHistory_infl}

and monotonicity:

{docstring Infomaterial.Relational.Material.runHistory_mono}

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

## Locked Seeds And Settling

Locking a seed is vertexwise history:

{docstring Infomaterial.Relational.Material.lockSeed}

and the locked seed dominates the original:

{docstring Infomaterial.Relational.Material.seed_le_lockSeed}

The key theorem says settling a locked seed reaches the least compatible state
above it:

{docstring Infomaterial.Relational.Material.settle_lock_is_least_compatible}

Checked:

```lean
example {S : Order.CompleteLattice}
    (K : KeratinComplex S)
    (hist : K.Vertex -> History S)
    (seed : Infomaterial.Tarski.Assign K) :
    forall v, S.le (seed v) (lockSeed K hist seed v) :=
  seed_le_lockSeed K hist seed
```

This is why the page belongs after closure and gluing. Keratin is not a label on
a substance. It is a directed contact complex plus a least compatible locked
section.

## Event Lattice

The constructive event tier is
{name Infomaterial.Relational.Material.LockEvent}`LockEvent`: felt lock,
pilling, damage, and fracture are the named irreversible events.

and firing an event is an inflationary lock on the powerset lattice:

{docstring Infomaterial.Relational.Material.addEvent}

Checked:

```lean
example {E : Type} (ev : E) (s : E -> Prop) :
    (addEvent ev).step s ev :=
  addEvent_fires ev s

example {E : Type} (ev : E) (s : E -> Prop) :
    (Infomaterial.Tarski.Powerset E).le
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
