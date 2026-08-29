import InfomaterialManual.DocSetup
import Infomaterial.Site.Basic
import Infomaterial.Site.Section

open Verso.Genre Manual InlineLean
open Infomaterial
open Infomaterial.Site
open Infomaterial.AssocSheaf

/-!
A teaching chapter for claim-sites as descent data.
-/

#doc (Manual) "Claim-site descent" =>

# Claim-Site Descent

This is the Grothendieckian reading of the manual. A claim is not understood by
its name, and not even by a single declaration. It is understood by the site on
which it descends.

The claim-site carried here is:

* claim-site: manual claim-sites as descent data over generated phases;
* phase: fibered and cohomological matter, after covers and sections are lawful;
* generating sites: clopen covers, fixed-fiber restriction, valuation masks,
  section separation, H1-zero gluing, and frontier obstruction;
* downstream uses: Page Law repair, frontier promotion, comparison-atlas entries,
  physical composite pages, and every phrase whose meaning depends on several
  carriers;
* Lean carriers: `Infomaterial.Site.Basic`,
  `Infomaterial.Site.Section`, and `Infomaterial.Site.Sheaf`;
* Blueprint/proof-tree nodes: Blueprint records incidence; Lean records
  settlement; Verso records descent for a reader; provenance records why the
  claim was sought;
* provenance: the Page Law in the root manual plus the bitopological-settling
  site and settling-associated-sheaf modules;
* familiar comparison: sheaf descent, effective descent, separated presheaf,
  gluing, and obstruction;
* reader closure: replace "what topic is this?" with "over which generated site
  does this claim descend?";
* frontier status: there is not yet a first-class Lean record for manual
  claim-sites and their carrier family. This page uses the existing settling
  site as the mathematical law that the manual imitates.

The governing sentence is:

> A stable page is an effective descent datum over its generated phase cover.

## Covers Are Not Names

The cover relation is not a list of topics. It is a fixed-fiber refinement:

{docstring Infomaterial.Site.Covers}

Pullback and transitivity are the beginning of the geometry:

{docstring Infomaterial.Site.covers_pullback}

{docstring Infomaterial.Site.covers_trans}

Checked:

```lean
example {U V : Clopen} {fam : List Clopen}
    (hcov : Covers U fam) (hVU : V ⊑ U) :
    Covers V (fam.map (meet V)) :=
  covers_pullback hcov hVU

example {U : Clopen} {fam : List Clopen}
    (subf : Clopen -> List Clopen)
    (hcov : Covers U fam)
    (hsub : forall Ui, Ui ∈ fam -> Covers Ui (subf Ui)) :
    Covers U (fam.flatMap subf) :=
  covers_trans subf hcov hsub
```

This is what the manual failed to do when it merely added subject pages. A
phrase like "keratinous disc" is not covered by adding three names to a paragraph.
It is covered only when the boundary, material, and topology pieces refine one
generated site and glue.

## Temporal Advance Is Not Cover

The site refuses a common documentation error: mistaking later vocabulary for a
cover of earlier vocabulary.

{docstring Infomaterial.Site.no_temporal_covers}

Checked:

```lean
example (U U' : Clopen) :
    Covers U [U'] <-> U' = U :=
  covers_singleton_iff U U'
```

This is the Page Law in mathematical form. A later word can be a morphism out of
an earlier site, but it is not automatically a cover. "Physics" does not cover
"closure"; "black hole" does not cover "causal order"; "keratin" does not cover
"lock history." The cover must be generated at the right fiber.

## Sections Are What Glue

The sheaf side says that local agreement on a cover determines a global section:

{docstring Infomaterial.AssocSheaf.cochain_separated}

and the associated sheaf bundles the restriction and gluing laws:

{docstring Infomaterial.AssocSheaf.settling_associated_sheaf}

Checked:

```lean
example (m : PredicationCell -> Bool) (c : Cochain) :
    Vanishes m (restrict m c) :=
  restrict_vanishes m c

example (c : Cochain) :
    restrict (fun _ => true) c = c :=
  restrict_id c
```

For the manual, a page is stable when its local carriers agree: Lean declarations,
Blueprint nodes, proof-tree ancestry, provenance notes, familiar comparison, and
reader closure all restrict to the same claim-site. If they do not, the page is
not a theorem surface. It is a frontier datum.

## Effective Descent And Non-Descent

Effective descent has a practical test:

* the generating phase is named;
* the cover is fixed at that phase, not borrowed from a later subject;
* restrictions to earlier carriers are visible;
* local examples agree on overlaps;
* a Lean theorem or construction carries the glued claim;
* the remaining non-glued part is named as frontier.

Non-effective descent is also useful. It says the phrase has compatible local
projections but no global carrier yet. The frontier is then not a vague TODO; it is
the missing object that would make the descent effective.

This is how the manual should treat ambitious phrases. A phrase may be
mathematically fertile long before it is a theorem. But the book must show
whether it descends.
