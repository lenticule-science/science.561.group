import InfomaterialManual.DocSetup
import Infomaterial.Articulation.Articulating.Cell
import Infomaterial.Language.Predicating.Cell
import Infomaterial.Language.Positing.Valuation

open Verso.Genre Manual InlineLean
open Infomaterial

/-!
A front-door chapter for reading the Infomaterial manual as a phase-organized book.
-/

#doc (Manual) "Reading Infomaterial" =>

# Reading Infomaterial

This book is a proof-oriented knowledge system. It is not a list of topics, not
a declaration browser, and not a popular exposition floating above the Lean
library.

The claim-site carried here is:

* claim-site: reading discipline for Infomaterial;
* phase: prolegomena;
* generating sites: mark, utterance, articulating, articulation cell,
  predication cell, valuation;
* Lean carriers: `Infomaterial.Primitive.Mark`,
  `Infomaterial.Articulation.Articulating`,
  `Infomaterial.Language.Predicating.Cell`,
  `Infomaterial.Language.Positing.Valuation`;
* familiar comparisons: glossary, table of contents, API reference, mathematical
  subject index;
* danger: reading the book by resemblance instead of by generation.

The governing sentence is:

> A Infomaterial page is stable only when it tells the reader what generated the
> claim-site and which carrier settles it.

This chapter teaches the reading move. Later chapters teach the mathematics.

## Claim-Site Before Subject

The ordinary question is:

> What subject is this?

The Infomaterial question is:

> What claim-site is being carried, and what phase makes it lawful?

A claim-site is not identical to its Lean declaration, its Verso page, its graph
node, or its provenance note. Those are carriers. The claim-site is the
mathematical address that those carriers must glue around.

The first example is deliberately small. A mark is the admitted floor:

{docstring Infomaterial.Mark}

But a mark is not yet an object, a proposition, an event, or a truth value. It is
only an admitted primitive surface:

```lean
example (m : Mark) : String := m.surface
```

The two kinds are positional, not two primitive domains:

{docstring Infomaterial.Kind}

Checked:

```lean
example (k : Kind) : k = Kind.token \/ k = Kind.claim :=
  Kind.two_kinds k

example : Kind.token = Kind.claim -> False :=
  Kind.token_ne_claim
```

The first reading rule is therefore negative: do not promote a mark into a later
mathematical object before a phase has generated that object.

## Carrier Before Interpretation

An utterance is already more structured than a mark, but it is still not a
truth-bearing proposition. It is a two-sided carrier:

{docstring Infomaterial.Utterance}

The sides are read by position:

{docstring Infomaterial.Utterance.at_}

Checked:

```lean
example (u : Utterance) :
    u.at_ Kind.token = u.token :=
  Utterance.at_token u

example (u : Utterance) :
    u.at_ Kind.claim = u.claim :=
  Utterance.at_claim u
```

This is how the book handles familiar words. "Token" and "claim" are lawful
because the carrier has generated two positions. "Subject," "predicate,"
"object," "truth," and "equality" are not lawful yet.

## Generation Before Lookup

Articulating is the last free recursion. It is the first act that brings a
relation into being:

{docstring Infomaterial.Articulating}

Every articulating has a head utterance and a floor utterance:

{docstring Infomaterial.Articulating.head}

{docstring Infomaterial.Articulating.floor}

Checked:

```lean
example (u : Utterance) :
    (Articulating.utter u).head = u :=
  rfl

example (u : Utterance) :
    (Articulating.utter u).floor = u :=
  Articulating.floor_utter u
```

The one-way shape is formal:

{docstring Infomaterial.Articulating.utter_ne_pair}

Checked:

```lean
example (u v : Utterance) (a : Articulating) :
    Articulating.utter u = Articulating.pair v a -> False :=
  Articulating.utter_ne_pair u v a
```

The reading rule is: do not use lookup to skip generation. If an entry in the
atlas says "category theory" or "spacetime," the page still has to explain which
generated carrier made that old name lawful.

## phase before comparison

The first generated four-corner object is
`Infomaterial.Articulating.Cell`: an utterance together with token-side and
claim-side articulation statuses. The atlas does not render the structure
docstring here because its fields are not yet documented as stable public
reference entries.

and its corner is read from two Boolean statuses:

{docstring Infomaterial.Articulating.Cell.corner}

There are exactly four corners:

{docstring Infomaterial.Articulating.Corner.card_eq_four}

Checked:

```lean
example : Articulating.Corner.all.length = 4 :=
  Articulating.Corner.card_eq_four

example (u : Utterance) :
    (Articulating.Cell.initial u).corner
      = Articulating.Corner.potential :=
  Articulating.Cell.corner_initial u
```

The familiar comparison is "four-valued logic," but that phrase is not yet the
phase. At this point the four corners are articulation statuses. The later
charge object is a transported and deepened reading, not something that was
secretly present from the beginning.

## Position Before Value

Predication creates an oriented site where value can later live. The carrier is
`Infomaterial.PredicationCell`: subject, predicate, and object coordinates generated
as positions. Its field-level docs are intentionally not pulled into the front
door until they are stable reference entries.

The seed predication is:

{docstring Infomaterial.PredicationCell.seed}

and orientation is real:

{docstring Infomaterial.PredicationCell.converse_ne}

Checked:

```lean
example (u : Utterance) :
    PredicationCell.seed u
      = ⟨u.token, u.claim, u.token⟩ :=
  rfl

example (phi : PredicationCell)
    (h : phi.subject ≠ phi.object) :
    PredicationCell.converse phi ≠ phi :=
  PredicationCell.converse_ne phi h
```

Only after predication can the book speak about valuations:

{docstring Infomaterial.Valuation}

The valuation fiber is over predication cells:

```lean
example : Valuation = (PredicationCell -> Charge) := rfl
```

The knowledge-least valuation is the seed for later settling:

{docstring Infomaterial.Valuation.knowledgeLeast}

{docstring Infomaterial.Valuation.knowledgeLeast_le}

Checked:

```lean
example (v : Valuation) :
    Valuation.leK Valuation.knowledgeLeast v :=
  Valuation.knowledgeLeast_le v
```

The reading rule is: value is not attached to marks directly. It is attached to
predication cells. If a page cannot name the base over which its value lives,
the page is not yet stable.

## Repair Before Confidence

Every stable chapter should give a repair path. A repair path is not remedial
fluff. It is part of the proof-oriented documentation structure: it tells a
reader what earlier carrier they must revisit when a later claim fails.

The standard repair sequence is:

* if a word seems primitive, ask for its generating phase;
* if a theorem seems like a subject import, ask for its claim-site;
* if a comparison seems sovereign, ask which carrier produces it;
* if an explanation has no Lean declaration, treat it as a note or frontier;
* if a declaration has no exposition, treat it as isolated settlement;
* if a page cannot say what remains unsettled, do not promote it to a stable
  book page.

For the first spine, the concrete repair route is:

1. `Mark`: what was admitted?
2. `Utterance`: what two-sided carrier was generated?
3. `Articulating`: what one-way recursion acted?
4. `Articulating.Cell`: what four statuses appeared?
5. `PredicationCell`: what oriented claim-site was generated?
6. `Valuation`: where can charge live?

That route is the template for the whole book. Later phases are larger, but the
discipline is the same.

## The Book Contract

A Infomaterial page is allowed to be beautiful, but it is not allowed to drift. The
minimum contract is:

* phase named;
* claim-site named;
* carrier named;
* Lean declarations shown;
* checked examples included when useful;
* familiar comparison demoted to comparison;
* repair path stated;
* frontier distinguished from settlement.

This is the standard the rest of the manual is trying to meet. It is also how a
human or agent should use the book: not by memorizing declarations, but by
following the generated object from carrier to carrier until the projection becomes
lawful.
