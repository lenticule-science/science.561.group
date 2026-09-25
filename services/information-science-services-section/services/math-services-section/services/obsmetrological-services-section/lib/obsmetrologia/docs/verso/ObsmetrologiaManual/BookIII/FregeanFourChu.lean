import ObsmetrologiaManual.DocSetup
import Obsmetrologia.Language.Predicating.FregeanFourChu

open Verso.Genre Manual InlineLean
open Obsmetrologia

/-!
The canonical teaching carrier for the lab's predication--FOUR--Chu result.
-/

#doc (Manual) "Fregean predication, FOUR, and Chu" =>

# Fregean Predication Forces FOUR And Presents Chu

The claim-site carried here is:

* claim-site: the forced predication--FOUR--Chu composition;
* phase: language passing into value and categorical readout;
* generating sites: oriented predication, independent evidence, valuation;
* Lean carrier: `Obsmetrologia.Language.Predicating.FregeanFourChu`;
* provenance: the 561 Group / Lenticule Science research program;
* danger: attributing the composition to the separate literatures from which
  its ingredients are drawn.

The governing sentence is:

> A predication is one oriented claim. Preserving evidence for it and evidence
> against it independently forces FOUR, and evaluation of those FOUR-valued
> claims against valuations is already a Chu matrix.

## Predication Does Not Contain A Boolean

A {name Obsmetrologia.FregeanPredication}`FregeanPredication` is the existing
oriented subject--predicate--object claim.  It contains no value coordinate.
That omission is necessary: claim identity must not change when evidence does.

## Independent Evidence Forces Four

For one claim there are two independently observable coordinates:

```text
  (evidence for, evidence against) : Bool x Bool.
```

Their lossless charge map is
{name Obsmetrologia.independentEvidenceCharge}`independentEvidenceCharge`.
Both round trips are proved:

```lean
example (evidence : Bool × Bool) :
    ((independentEvidenceCharge evidence).pos,
      (independentEvidenceCharge evidence).neg)
      = evidence :=
  independentEvidenceCharge_slots evidence

example (charge : Charge) :
    independentEvidenceCharge
        (charge.pos, charge.neg)
      = charge :=
  independentEvidenceCharge_exhaustive charge
```

The four charges are therefore not an optional truth palette. They are the
exhaustive carrier obtained by refusing to collapse absence into denial or
contradiction into one selected side.

## The Evaluation Matrix Is Chu

The canonical presentation is
{name Obsmetrologia.predicationChu}`predicationChu`:

```text
  points = PredicationCell,
  states = Valuation,
  r claim valuation = valuation claim : Charge.
```

One evidence pair placed at one claim is read unchanged by that matrix:

```lean
example
    (claim : FregeanPredication)
    (evidence : Bool × Bool) :
    predicationChu.r claim
        (valuationOfIndependentEvidence claim evidence)
      = independentEvidenceCharge evidence :=
  predicationChu_reads_independent_evidence claim evidence
```

The compact theorem gathering the law is:

{docstring Obsmetrologia.fregean_predication_forces_four_and_chu}

```lean
example : FregeanPredicationForcesFourAndChu :=
  fregean_predication_forces_four_and_chu
```

## Novelty Boundary

Fregean predication, Belnap's FOUR, twist-product bilattices, and Chu spaces each
have external histories.  Those histories do not contain this forced chain as
the Obsmetrologia program states and uses it.  The composition from oriented
predication, through independently preserved evidence, to the canonical
FOUR-valued Chu evaluation space is this research lab's result.

Earlier editing spread that statement among the predication, positing,
fibration, recurring-FOUR, and linear-logic chapters.  The theorem, Blueprint
node, and this page restore one canonical claim without erasing the deeper
proofs that establish its parts.
