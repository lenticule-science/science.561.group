import ObsmetrologiaManual.DocSetup
import Obsmetrologia.Site.Basic
import Obsmetrologia.AperiodicOrder.MaterialSectors.Contact.ShroudIndexedKeratin
import Obsmetrologia.CausalSets.BlackHoles.Hole

open Verso.Genre Manual InlineLean
open Obsmetrologia
open Obsmetrologia.Site
open Obsmetrologia.AperiodicOrder.MaterialSectors.Contact
open Obsmetrologia.CausalSets.Causal.Net
open Obsmetrologia.CausalSets.Causal.Order
open Obsmetrologia.CausalSets.Causal.Cone
open Obsmetrologia.CausalSets.BlackHoles

private abbrev FiniteHoleRegion := CausalSets.BlackHoles.Region

/-!
A frontier-lab chapter for promotion as effective descent.
-/

#doc (Manual) "Frontier descent" =>

# Frontier Descent

Frontier promotion is not the addition of confidence. It is the moment a
non-effective descent datum becomes effective.

The claim-site carried here is:

* claim-site: frontier promotion as effective descent;
* phase: frontier over the generated phase site;
* generating sites: covers, section agreement, missing carrier analysis,
  causal hole/shroud laws, and irreversible material lock laws;
* downstream uses: all composite frontier pages, especially physical and
  spacetime/material hybrids;
* Lean carriers: `Obsmetrologia.Site.Basic`,
  `Obsmetrologia.CausalSets.BlackHoles.Hole`, and
  `Obsmetrologia.AperiodicOrder.MaterialSectors.Contact.Keratin`;
* Blueprint/proof-tree nodes: red Blueprint nodes are non-effective descent
  data until their missing carrier is built and checked;
* provenance: the manual Page Law and the frontier lab discipline;
* familiar comparison: conjecture promotion, descent obstruction, moduli problem,
  and gluing condition;
* reader closure: ask what object would represent the glued family;
* frontier status: the library does not yet package this as a `FrontierDescent`
  Lean record. This page states the discipline and checks the input laws used
  by current examples.

The governing sentence is:

> A frontier claim is a descent datum whose representing object is missing.

## The Promotion Test

A frontier page should be read as a diagram:

* local carriers are the objects in the cover;
* overlap laws are the checked examples;
* the intended phrase is the would-be glued object;
* the frontier statement names the missing representing carrier.

The cover discipline itself is checked:

{docstring Obsmetrologia.Site.covers_singleton_iff}

Checked:

```lean
example (U U' : Clopen) :
    Covers U [U'] <-> U' = U :=
  covers_singleton_iff U U'
```

If the "cover" is only one renamed object, nothing has been glued. It is just a
name change.

## Example: Shroud Plus Keratin

The shroud input contributes no-readout future closure:

{docstring Obsmetrologia.CausalSets.BlackHoles.hole_future_closed}

Checked:

```lean
example {E : Type} (C : CausalSet E)
    [CausalLeDecision C] (readout : FiniteHoleRegion E)
    {x y : E}
    (hx : HoleRegion C readout x = true)
    (hxy : CausalLe C x y) :
    HoleRegion C readout y = true :=
  hole_future_closed C readout hx hxy
```

The keratin input contributes irreversible lock growth:

{docstring Obsmetrologia.AperiodicOrder.MaterialSectors.Contact.runHistory_infl}

Checked:

```lean
example {S : Order.CompleteLattice}
    (hist : History S) (a : S.carrier) :
    S.le a (runHistory hist a) :=
  runHistory_infl hist a
```

These two laws are now welded by
`Obsmetrologia.AperiodicOrder.MaterialSectors.Contact.ShroudIndexedKeratin`. The remaining descent
problem is not "shroud plus keratin"; it is the next composite: an indexed
material carrier plus disc morphology.

## Honest Non-Descent

Non-descent must be written in the page, not hidden in the reader's suspicion.
For a composite physical phrase, the honest frontier sentence has this shape:

* local law A is settled by theorem `A`;
* local law B is settled by theorem `B`;
* their overlap is only a prose compatibility unless Lean states it;
* the representing carrier `G` is absent;
* promotion requires constructing `G` and proving the gluing theorem.

That is the difference between imaginative mathematics and loose exposition.
The former names the descent obstruction.

## Promotion Target

For the keratinous hole disc, the promotion target is not "more text." It
is a carrier with this shape:

* shroud-indexed material: a `ShroudIndexedKeratin` carrier;
* disc topology: a finite cell complex or excursion topology over the same
  index;
* compatibility: causal adjacency and contact adjacency commute enough to
  restrict and glue;
* theorem: settled locked sections are least compatible and shroud-supported.

Until that exists, the phrase is a non-effective descent datum. That is a strong
frontier position, not a weak page.
