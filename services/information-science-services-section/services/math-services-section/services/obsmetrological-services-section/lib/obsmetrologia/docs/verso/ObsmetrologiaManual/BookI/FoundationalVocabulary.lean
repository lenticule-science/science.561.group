import ObsmetrologiaManual.DocSetup
import Obsmetrologia.Articulation.Articulating.FourCorner
import Obsmetrologia.Language.Predicating.Cell
import Obsmetrologia.Language.Predicating.Claim
import Obsmetrologia.Language.Positing.Valuation
import Obsmetrologia.Closure.Regime
import Obsmetrologia.Site.Basic
import Obsmetrologia.Site.Claim

open Verso.Genre Manual InlineLean
open Obsmetrologia
open Obsmetrologia.Site

/-!
A prolegomenon chapter for the critical vocabulary of Obsmetrologia itself.
-/

#doc (Manual) "Foundational vocabulary" =>

# Foundational Vocabulary

Obsmetrologia is not standard foundations with unusual examples. It is a new
generated foundation, so the book has to teach its own critical words before it
uses them as if they were obvious.

The claim-site carried here is:

* claim-site: critical vocabulary of generated relational mathematics;
* phase: prolegomena, before the mathematical phases are entered;
* generating sites: mark, utterance, articulating, articulation corner,
  predication cell, valuation, closure regime;
* downstream uses: every page law entry, every phase page, every frontier page,
  every comparison-atlas entry, and every composite physical phrase;
* Lean carriers: `Obsmetrologia.Mark`, `Obsmetrologia.Utterance`,
  `Obsmetrologia.Articulating`, `Obsmetrologia.Articulating.Corner`,
  `Obsmetrologia.PredicationCell`, `Obsmetrologia.Valuation`,
  `Obsmetrologia.ClosureRegime`;
* Blueprint/proof-tree nodes: the primitive proof-tree explains the floor;
  later Blueprint nodes are carriers of incidence, not substitutes for these
  words;
* provenance: the root Page Law and the repeated failure mode of reading the
  library as a subject tour;
* familiar comparison: glossary, metatheory, ontology, table of notation;
* reader closure: use these words as tests, not as decorative labels;
* frontier status: the library now internalizes the point/site split as `Claim`
  and `Claim.SitePoint`. `Phase`, `Carrier`, `Projection`, and the full glued
  documentation carrier family remain manual law and frontier structure.

The governing sentence is:

> A word is lawful only when the phase that generates its carrier has appeared.

## Phase

A phase is a permission boundary in the generated descent. It is not a subject
area, not a namespace, and not a historical period of the project. A phase says:
which vocabulary is lawful now, which vocabulary is still forbidden, and which
older mathematical words may appear only as derived comparisons.

At Genesis, only marks, positional kinds, utterances, articulating, and the first
corner are lawful:

{docstring Obsmetrologia.Mark}

{docstring Obsmetrologia.Kind.two_kinds}

Checked:

```lean
example (k : Kind) : k = Kind.token \/ k = Kind.claim :=
  Kind.two_kinds k

example : Kind.token = Kind.claim -> False :=
  Kind.token_ne_claim
```

At the closure phase, regimes become lawful. The carrier is
{name Obsmetrologia.ClosureRegime}`ClosureRegime`; the exhaustive law is:

{docstring Obsmetrologia.classify_exhaustive}

Checked:

```lean
example (d : ClosureRegimeData) :
    classify d = ClosureRegime.strict
      \/ classify d = ClosureRegime.scott
      \/ classify d = ClosureRegime.transfiniteBounded
      \/ classify d = ClosureRegime.aperiodic :=
  classify_exhaustive d
```

The warning is simple. A page may mention a later object pedagogically, but it
may not use that object as a premise before its phase has generated it.

## Carrier

A carrier is the concrete surface on which a claim is borne. Lean declarations,
Verso pages, Blueprint nodes, proof-tree nodes, generated API docs, and
provenance notes can all be carriers. They are not interchangeable. A theorem in
Lean carries a different obligation from a historical note.

The first mathematical carrier richer than a mark is an utterance:

{docstring Obsmetrologia.Utterance}

Checked:

```lean
example (u : Utterance) :
    u.at_ Kind.token = u.token :=
  Utterance.at_token u

example (u : Utterance) :
    u.at_ Kind.claim = u.claim :=
  Utterance.at_claim u
```

The most common documentation error is to confuse a carrier with the claim-site
it carries. `Valuation` is a carrier:

{docstring Obsmetrologia.Valuation}

Checked:

```lean
example : Valuation = (Claim -> Charge) :=
  Valuation.isClaimCharge
```

The claim-site is not the function type alone. It is the generated mathematical
address: charge over claim points after predication and positing are lawful.

## Claim Point And Site Point

A claim point is the address where a claim can first live. It is typed by its
generating phase. Before predication there is no point for truth-valued
predication, because there is no predication cell.

The predication site is generated from utterance:

{docstring Obsmetrologia.PredicationCell.seed}

Checked:

```lean
example (u : Utterance) :
    PredicationCell.seed u =
      ⟨u.token, u.claim, u.token⟩ :=
  rfl

example (u : Utterance) :
    (Claim.seed u).predicate = u.claim :=
  Claim.seed_predicate u
```

The site-level address is generated only when the settling site is available:

```lean
example (q : Claim) (tau : Nat) (U : Clopen) :
    (Claim.sitePoint q tau U).q = q :=
  Claim.sitePoint_claim q tau U
```

This is why the manual asks "what claim point, and then what site point, is
carried?" before it asks "what subject is this?" A subject name can float. A
claim point has generation data, and a claim site point has site data.

## Generating Site

A generating site is an earlier claim-site whose carrier supplies the material
needed by a later one. Generation is not citation. It is dependency with lawful
transport.

For example, the articulation corner is generated before charge:

{docstring Obsmetrologia.Articulating.Corner.card_eq_four}

and the initial absurd articulation cell transports to the knowledge-bottom charge:

{docstring Obsmetrologia.absurd_is_kBot}

Checked:

```lean
example : Articulating.Corner.all.length = 4 :=
  Articulating.Corner.card_eq_four

example (u : Utterance) :
    Articulating.FourCorner.toCorner
        (Articulating.Cell.initial u).fourCorner =
      Charge.kBot :=
  absurd_is_kBot u
```

The generating site is not "four-valued logic." It is the articulation corner
and its transport theorem.

## Projection

A projection is a familiar mathematical object seen at the boundary of generated
structure. A projection is useful; it is not sovereign. Category, order, sheaf,
topology, geometry, physics, and computation may all be projections in this manual.

The test is strict:

* if the familiar word explains a generated carrier, it is a projection;
* if the familiar word replaces the generated carrier, it is smuggling;
* if the familiar theorem is stronger than the carrier proves, the excess is
  frontier.

The recurring FOUR is a typical comparison trap. The articulation corner and charge
meet, but the meeting is carried by a theorem:

{docstring Obsmetrologia.articulation_phase_is_charge}

Without such a carrier, resemblance is not theorem.

## Frontier

Frontier is not failure and not permission to be vague. A frontier claim is a
claim whose generating path is visible but whose carrier is missing, too thin,
or not yet welded to the other local carriers.

The manual must say which of these is true:

* no carrier exists;
* a carrier exists but is too weak;
* local carriers exist but do not glue;
* a theorem is conditional on an explicit missing construction;
* a familiar comparison is stronger than the proved statement.

The word "frontier" therefore carries mathematical information. It names the
missing promotion.

## Descent

Descent is the manual's discipline for moving from local carriers to a stable
claim over a site point. The formal site-point layer appears after covers are
lawful. Here the reader only needs the rule:

> Local carriers do not make a global claim until their overlaps are accounted
> for and the glued carrier is named.

This rule is why a physical phrase cannot be documented by adding nouns. If a
phrase combines causal spacetime, material contact, and topology, the manual
must ask for the descent object that glues those local carriers. Until it exists,
the phrase is frontier.

## Effective Gluing

Effective gluing is descent with a named global carrier. It is the point at
which a compatible family stops being only local evidence and becomes a claim
the manual may teach as settled.

The first checked cover law is deliberately small:

{docstring Obsmetrologia.Site.covers_self}

Checked:

```lean
example (U : Clopen) :
    Covers U [U] :=
  covers_self U
```

This does not say every interesting family glues. It says the site has a
lawful identity cover. Later sheaf and cohomology pages must add the carrier
that turns local sections into a global witness.

Page-law reading:

* claim-site: a global claim over a generated cover;
* phase: gluing, after closure and valuation;
* generating sites: clopen fibers, cover law, and section restriction;
* downstream uses: sheaf witnesses, cohomology witnesses, frontier promotion;
* Lean declaration: `Obsmetrologia.Site.covers_self`;
* familiar comparison: effective descent;
* frontier status: higher gluing is not automatic from this identity case.

## Non-Effective Gluing

Non-effective gluing is not nonsense. It is a lawful failure mode: the local
pieces can be named, the intended global object can be described, but the
carrier that represents the glued object has not been built.

The site already blocks one common false promotion. A singleton family covers
only when its clopen is exactly the target clopen:

{docstring Obsmetrologia.Site.covers_singleton_iff}

Checked:

```lean
example (U U' : Clopen) :
    Covers U [U'] <-> U' = U :=
  covers_singleton_iff U U'
```

So a page may not replace missing descent by a renamed local piece. If the
carrier is merely analogous to the target, the descent datum is non-effective.

Page-law reading:

* claim-site: local witnesses that do not yet represent a global witness;
* phase: gluing frontier;
* generating sites: cover law, overlap accounting, missing global carrier;
* downstream uses: frontier lab diagnostics and composite physical phrases;
* Lean declaration: `Obsmetrologia.Site.covers_singleton_iff`;
* familiar comparison: obstruction to descent;
* frontier status: the missing object must be named, not implied.

## Promotion

Promotion is the operation that changes frontier into phase material. It is not
the addition of a prettier page, a stronger analogy, or a more familiar name.
It requires a carrier and a theorem explaining why that carrier occupies the
claim-site.

The smallest promotion pattern in this book is:

1. name the local carriers;
2. name their generating phases;
3. prove or cite their compatibility over the relevant cover;
4. construct the global carrier;
5. prove the global carrier has the claimed role;
6. move the page from frontier language to phase language.

When any step is missing, the honest sentence is "frontier". The stronger the
analogy, the more important this boundary becomes, because resemblance can make
an unbuilt carrier look as if it already exists.

Checked examples above show two opposite promotion tests. `covers_self` is a
lawful gluing carrier for the identity case. `covers_singleton_iff` refuses a
singleton promotion unless the clopen is exactly the target.

## Relation To The Lean Spine

The Lean spine is the chain of carriers that makes the vocabulary lawful. It is
not the namespace tree and not the order in which examples happen to be
interesting.

A reader can trace the first spine as follows:

```lean
example (k : Kind) : k = Kind.token \/ k = Kind.claim :=
  Kind.two_kinds k

example (u : Utterance) :
    PredicationCell.seed u =
      ⟨u.token, u.claim, u.token⟩ :=
  rfl

example : Valuation = (Claim -> Charge) :=
  Valuation.isClaimCharge

example :
    classify spineData = ClosureRegime.strict :=
  spine_is_strict
```

This is why the manual files by generated phase rather than subject name. Each
later carrier has to descend from this spine or declare itself frontier.

## Repair Checklist

When a page feels obscure, ask these questions in order:

1. What phase makes the words lawful?
2. What carrier bears the claim?
3. What claim point, site point, or descent datum is being addressed?
4. What earlier sites generate it?
5. What familiar object is only a comparison?
6. What local carriers must glue?
7. Is the gluing effective or non-effective?
8. What construction or theorem would promote it?
9. Where does the claim sit in the Lean spine?
10. What is missing if the claim is frontier?

This is not optional vocabulary. It is the minimum mathematics needed to read a
novel generated foundation without reducing it to a subject index.
