import InfomaterialManual.DocSetup
import Infomaterial.Site.DFrame
import Infomaterial.Site.Enriched

open Verso.Genre Manual InlineLean
open Infomaterial

/-!
A teaching chapter for the d-frame and quantale-enriched site carriers.
-/

#doc (Manual) "D-frame and enriched sites" =>

# D-Frame And Enriched Sites

Book VI first makes ordinary covers, restrictions, and sheaf gluing lawful. This
page records two later promotions inside the same phase: d-frame-valued settling
sheaves and quantale-enriched descent. They are not new primitives. They are
stronger carriers for the same generated problem: how local settled data glues
when truth, falsehood, consistency, totality, and graded sameness must all remain
visible.

The claim-site carried here is:

* claim-site: d-frame and quantale-enriched sites as promoted gluing carriers;
* phase: fibered and cohomological matter, after ordinary site restriction and
  associated sheaf sections are lawful;
* generating sites: clopen covers, valuation masks, Belnap charge, section
  restriction, consistency/totality, and degree-zero cohomology;
* downstream uses: inconsistency sheaves, quantale-valued cohomology,
  contextuality witnesses, plasma wave sheaf criterions, and frontier descent
  diagnostics;
* Lean declarations: `Infomaterial.DFrame.DFrame`,
  `Infomaterial.DFrame.dframe_valued_sheaf`,
  `Infomaterial.QEnriched.chargeQuantale`,
  `Infomaterial.QEnriched.QCat`,
  `Infomaterial.QEnriched.q_fuzzy_equivalence_composes`;
* Blueprint/proof-tree nodes: no primitive proof-tree node generates these
  carriers; they descend from the site/sheaf/cohomology phase and support later
  Blueprint physics and obstruction entries;
* provenance: bitopological-settling-site, d-frame-valued sheaf, and
  quantale-enriched-sheaf notes;
* familiar mathematical comparison: bitopological d-frames, quantale-enriched
  categories, fuzzy equivalence, and degree-zero enriched cohomology;
* reader closure: keep ordinary sheaf gluing upstream and read enrichment as a
  promoted law on an already generated site;
* frontier status: general toposes, derived enriched cohomology, analytic
  sheaves, spectra, and Hilbert-space enrichment remain missing carriers.

The governing sentence is:

> Enrichment is lawful only after the ordinary site has something to enrich.

## D-Frame Is Two-Sided Gluing

A d-frame remembers both sides of a bitopological reading: positive and negative
frames, plus consistency and totality relations.

The carrier is {name Infomaterial.DFrame.DFrame}`DFrame`. The canonical spatial
example is:

{docstring Infomaterial.DFrame.dframe_of_bitopological_relations}

Checked:

```lean
example (X : Type) :
    (DFrame.dframe_of_bitopological X).Lplus
      = DFrame.powersetFrame X :=
  rfl
```

The familiar comparison is a bitopological space. The lawful claim-site is more
precise: two generated frames and two relations whose closure laws are carried
by Lean.

## D-Frame-Valued Sheaf

The promoted settling sheaf assigns a d-frame at a valuation and clopen mask:

{docstring Infomaterial.DFrame.dframe_valued_sheaf_at}

The sheaf theorem bundles the honest claims: consistency is downward-closed,
totality is upward-closed, truth and falsehood masks are both present, and
restriction preserves the d-frame structure.

{docstring Infomaterial.DFrame.dframe_valued_sheaf}

Restriction preserves finite meet:

{docstring Infomaterial.DFrame.restrictSub_meet}

Checked:

```lean
example (m : PredicationCell -> Bool)
    (A B : DFrame.Subset PredicationCell) :
    DFrame.restrictSub m
        (DFrame.Subset.meet A B)
      = DFrame.Subset.meet
          (DFrame.restrictSub m A)
          (DFrame.restrictSub m B) :=
  DFrame.restrictSub_meet m A B
```

The reader closure is to stop treating inconsistency as a side annotation.
At this claim-site it is one side of the gluing carrier.

## Charge Is The Quantale

Quantale enrichment begins from the generated FOUR/Charge value. It does not
import an arbitrary metric or topology.

The concrete quantale is:

{docstring Infomaterial.QEnriched.chargeQuantale}

Checked:

```lean
example :
    QEnriched.chargeQuantale.one
      = Charge.kTop :=
  rfl
```

The familiar comparison is a commutative unital quantale. The generated carrier is
more specific: multiplication is knowledge meet over the existing charge object.

## Q-Categories And Fuzzy Equivalence

The enriched category carrier is {name Infomaterial.QEnriched.QCat}`QCat`.
Its functors are {name Infomaterial.QEnriched.QFunctor}`QFunctor`s.
The structural theorem says the Charge quantale, one-object category, discrete
category, identity functor, and functor composition cohere:

{docstring Infomaterial.QEnriched.qcat_is_quantale_category}

Checked:

```lean
example (Q : QEnriched.Quantale) :
    QEnriched.QFunctor.id
      (QEnriched.oneObjQCat Q)
      = QEnriched.QFunctor.id
          (QEnriched.oneObjQCat Q) :=
  rfl
```

Fuzzy equivalence is not resemblance. It is a graded pair of round-trip functors,
and composition multiplies grades:

{docstring Infomaterial.QEnriched.q_fuzzy_equivalence_composes}

This licenses a controlled use of "equivalent up to grade". It does not license
untyped analogy between physical systems.

## Degree-Zero Enriched Cohomology

The present enriched cohomology carrier is intentionally small. It proves the
degree-zero fixed-point core over the charge quantale:

{docstring Infomaterial.QEnriched.h0_laplacian_fixed_points}

Checked:

```lean
example (s : Charge) :
    (forall x : Charge,
        QEnriched.laplacian s
          (QEnriched.laplacian s x)
          = QEnriched.laplacian s x) :=
  (QEnriched.h0_laplacian_fixed_points s).1
```

The frontier boundary is explicit. Full enriched cohomology over arbitrary
degrees and arbitrary sites is not claimed here. The carrier present today is
degree-zero Laplacian fixedness over the generated charge quantale.

## Reader Closure

When a later page invokes a d-frame, enriched sheaf, fuzzy equivalence, or
quantale cohomology, first ask whether it is using this carrier or asking for a
new one. A new carrier is a promotion requirement, not a theorem already earned.
