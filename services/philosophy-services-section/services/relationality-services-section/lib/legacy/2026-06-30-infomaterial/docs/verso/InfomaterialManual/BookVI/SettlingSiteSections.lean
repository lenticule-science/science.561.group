import InfomaterialManual.DocSetup
import Infomaterial.Site.Basic
import Infomaterial.Site.Section

open Verso.Genre Manual InlineLean
open Infomaterial
open Infomaterial.Site
open Infomaterial.AssocSheaf

/-!
A teaching chapter for the bitopological settling site and its sections.
-/

#doc (Manual) "Settling site and sections" =>

# Settling Site And Sections

The word "site" becomes lawful only after closure, valuation, and gluing have
already appeared. Here it names the phase surface on which local settled data
can be restricted, covered, and glued.

The claim-site carried here is:

* claim-site: bitopological settling site and settling-associated sections;
* phase: fibered and cohomological matter;
* generating sites: pairwise-Stone clopens, settlement strata, valuation masks,
  covers at fixed fiber, restriction, and H1-vanishing gluing;
* downstream uses: inconsistency sheaves, bigraded cohomology,
  d-frame-valued sheaves, plasma wave sheaf criterions, and cohomological
  frontier diagnostics;
* Lean carriers: `Infomaterial.Site.Basic`,
  `Infomaterial.Site.Section`, `Infomaterial.Site.Sheaf`,
  `Infomaterial.Site.DFrame`, and `Infomaterial.Site.Enriched`;
* Blueprint/proof-tree nodes: `thm:bitopological-site-grothendieck`,
  `thm:no-temporal-covers`, and `thm:strict-site-finite-fiber`;
* provenance: bitopological-settling-site and settling-associated-sheaf notes;
* familiar comparison: Grothendieck site, sheaf restriction, cover, section,
  short exact sequence, and cohomological obstruction;
* reader closure: verify that each topological word is carried by a generated
  clopen, cover, mask, or restriction declaration;
* frontier status: general toposes, arbitrary Grothendieck topologies,
  derived categories, spectra, and analytic sheaves are not present.

The governing sentence is:

> The site covers clopens at a fixed settling fiber; temporal advance is carried
> by morphism, not by cover.

## Clopen Covers

The clopen carrier is {name Infomaterial.Site.Clopen}`Clopen`, with inclusion
derived from meet:

{docstring Infomaterial.Site.sub}

The cover relation is:

{docstring Infomaterial.Site.Covers}

The identity cover is:

{docstring Infomaterial.Site.covers_self}

Checked:

```lean
example (U : Clopen) :
    Covers U [U] :=
  covers_self U
```

The site theorem bundles the Boolean algebra, clopen partial order, temporal
advance preorder, and Grothendieck basis axioms:

{docstring Infomaterial.Site.bitopological_site_grothendieck}

## No Temporal Covers

The load-bearing rule is:

{docstring Infomaterial.Site.no_temporal_covers}

Checked:

```lean
example (U U' : Clopen) :
    Covers U [U'] <-> U' = U :=
  covers_singleton_iff U U'
```

This is the phase discipline. A cover refines the clopen in a fixed fiber. A
strict movement in settling stratum is a morphism, not a covering family.

## Strict Finite Fiber

The strict regime is the first finite site where sheaf-cohomology calculations
can run without importing arbitrary topology:

{docstring Infomaterial.Site.strictRegime}

The strict clopen fiber is enumerated:

{docstring Infomaterial.Site.strictClopenFiber}

{docstring Infomaterial.Site.strictClopenFiber_length}

and the list is complete:

{docstring Infomaterial.Site.strictClopenFiber_complete}

The Blueprint node is `thm:strict-site-finite-fiber`, witnessed by:

{docstring Infomaterial.Site.strict_site_finite_fiber}

Checked:

```lean
example :
    strictRegime = ClosureRegime.strict :=
  rfl

example :
    strictClopenFiber.length = 4 :=
  strictClopenFiber_length

example (U : Clopen) :
    U ∈ strictClopenFiber :=
  strictClopenFiber_complete U

example :
    strictRegime = ClosureRegime.strict
      /\ strictClopenFiber.length = 4 :=
  strict_site_finite_fiber
```

This is the lawful meaning of "finite site" here. The finite object is the
pairwise-Stone clopen fiber generated from the FOUR, under the strict regime.
The theorem does not say that every later sheaf, derived category, or analytic
space is finite.

## Masks And Restriction

The associated sheaf page uses masks:

{docstring Infomaterial.AssocSheaf.Mask}

Truth, Belnap-designated, and inconsistency masks satisfy:

{docstring Infomaterial.AssocSheaf.dT_le_dK}

{docstring Infomaterial.AssocSheaf.dTop_le_dK}

Checked:

```lean
example (v : Valuation) (phi : PredicationCell)
    (h : dT v phi = true) :
    dK v phi = true :=
  dT_le_dK v phi h
```

Restriction is the presheaf operation:

{docstring Infomaterial.AssocSheaf.restrict}

and identity restriction is checked:

{docstring Infomaterial.AssocSheaf.restrict_id}

```lean
example (c : Cochain) :
    restrict (fun _ => true) c = c :=
  restrict_id c
```

## The Associated Sheaf

The main bundle is:

{docstring Infomaterial.AssocSheaf.settling_associated_sheaf}

and the designated short exact sequence is:

{docstring Infomaterial.AssocSheaf.designated_short_exact_sequence}

This page should be read before any later "sheaf" or "cohomology" claim. It
names the lawful surface: clopen fibers, fixed-fiber covers, masked cochains,
restriction, and the split between truth-designated and top-designated
increments. Anything beyond that is frontier until another carrier is built.
