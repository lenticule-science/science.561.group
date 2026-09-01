import ObsmetrologiaManual.DocSetup
import Obsmetrologia

open Verso.Genre Manual InlineLean
open Obsmetrologia

/-!
The core-spine overview, written to the welded form: every cited declaration is a
build-failing `{name …}` reference, and the load-bearing conflations are elaborated
`lean` witnesses rather than restated prose. This is the generative path of Obsmetrologia —
the part a reader must hold before any later recovered mathematics makes sense.

`{docstring …}` is used only for the two light signatures (`Articulating.Corner`, `FourCorner`)
that render within the native stack on Windows; everything heavier is welded with
`{name …}`. Heavy `{docstring …}` rendering belongs on WSL/CI, as elsewhere in the
manual.
-/

#doc (Manual) "Core spine overview" =>

# Core Spine

This is the generative path of Obsmetrologia: the chain Mark → Utterance → Articulating →
Articulating.Cell → Predicating → Positing → Settling, with the recurring four
({name Obsmetrologia.four_fold}`four_fold`) read off it. A reader should understand this
chain before interpreting any later recovered mathematics. The point of this page is
that the chain is not a vocabulary — every step is a declaration, and the conflations
that make it _one_ structure are checked here.

## 1. The admitted data: marks and kinds

Free data enters in exactly two places in the whole library. The first is the atom.
A {name Obsmetrologia.Mark}`Mark` is a finite surface presentation; identity is role, not
surface, and role is supplied downstream.

A mark stands on one of two sides, {name Obsmetrologia.Kind}`Kind` — `token` (the
identity-carrying side) and `claim` (the content-carrying side). That there are
_exactly_ two, and that they are distinct, are theorems, not stipulations:

```lean
example (k : Kind) :
    k = Kind.token ∨ k = Kind.claim :=
  Kind.two_kinds k

example : Kind.token = Kind.claim → False :=
  Kind.token_ne_claim
```

## 2. Utterance: the two-sided carrier

{name Obsmetrologia.Utterance}`Utterance` pairs a token-side mark with a claim-side mark.
It is the _domain_ that articulating acts on — the structured carrier, not yet a
predication. Its accessor {name Obsmetrologia.Utterance.at_}`at_` reads off the mark on a
named side, definitionally agreeing with the two projections:

```lean
example (u : Utterance) :
    u.at_ Kind.token = u.token := rfl
```

## 3. Articulating: the second admitted recursion

{name Obsmetrologia.Articulating}`Articulating` is the only other free data — the
`[utterance, articulating]` recursion, everything below it derived. It carries a
{name Obsmetrologia.Articulating.depth}`depth`, and its two constructors are genuinely
distinct: a bare utterance is never an articulated pair
({name Obsmetrologia.Articulating.utter_ne_pair}`utter_ne_pair`).

## 4. The first fourfold: articulation cells and corners

When articulating acts on an utterance, each of the two sides is independently either
articulated or not. {name Obsmetrologia.Articulating.Cell}`Articulating.Cell` records that
state, and the two independent binary statuses partition it into four corners,
{name Obsmetrologia.Articulating.Corner}`Articulating.Corner`.

{docstring Obsmetrologia.Articulating.Corner}

The cardinality is _derived_, not chosen — one side would give two cells, three would
give eight; two-sidedness gives exactly four. This is
{name Obsmetrologia.Articulating.Corner.card_eq_four}`card_eq_four`:

```lean
example : Articulating.Corner.all.length = 4 :=
  Articulating.Corner.card_eq_four
```

The corner of a cell is read by {name Obsmetrologia.Articulating.Cell.corner}`corner`, and
the initial (neither-side-articulated) cell
{name Obsmetrologia.Articulating.Cell.initial}`initial` sits at the `absurd` corner — the
knowledge-least start of the descent.  The separately typed
{name Obsmetrologia.Articulating.PotentialCell}`PotentialCell` sits at `potential`
and is the source from which predicating proceeds:

```lean
example (u : Utterance) :
    (Articulating.Cell.initial u).corner
      = Articulating.Corner.absurd := rfl

example (u : Utterance) :
    (Articulating.PotentialCell.initial u).toCell.corner
      = Articulating.Corner.potential := rfl
```

Every corner is reached by some cell over a fixed utterance
({name Obsmetrologia.Articulating.Cell.corner_surjective}`corner_surjective`), so the
fourfold is genuinely populated, not a formal four-element type.

## 5. Predicating: categorical shape from the potential cell

Only the `potential` cell carries forward into predication.
{name Obsmetrologia.PredicationCell}`PredicationCell` is the subject–predicate–object
triple over {name Obsmetrologia.Entity}`Entity` and {name Obsmetrologia.Predicate}`Predicate`
(both abbreviations of {name Obsmetrologia.Mark}`Mark`).
{name Obsmetrologia.PredicationCell.predicating}`predicating` builds it from a potential
cell; {name Obsmetrologia.PredicationCell.converse}`converse` swaps subject and object, and
is a genuine involution that moves any non-symmetric cell
({name Obsmetrologia.PredicationCell.converse_ne}`converse_ne`). This is where category-like
structure first appears — _downstream_ of predication, never assumed before it.

## 6. Positing: value as the FOUR charge

{name Obsmetrologia.Charge}`Charge` is the four-point value structure positing admits — and
it is _definitionally_ the same four-corner object, `Charge := Articulating.Corner`. The two
lattice orders live on it as {name Obsmetrologia.Charge.joinK}`joinK` /
{name Obsmetrologia.Charge.meetK}`meetK` (knowledge) with bounds
{name Obsmetrologia.Charge.kBot}`kBot` and {name Obsmetrologia.Charge.kTop}`kTop`, and
{name Obsmetrologia.Charge.negate}`negate` linking the two orders.

That a bilattice charge _is_ an articulation phase is definitional at the carrier
level, because `Charge := Articulating.Corner`:

```lean
example (c : Articulating.Corner) : (c : Charge) = c :=
  rfl
```

## 7. Predication forces FOUR and presents Chu

The oriented claim has no intrinsic value coordinate.  A
{name Obsmetrologia.Valuation}`Valuation` supplies standing while preserving
evidence for and evidence against independently.  The two coordinates round-trip
losslessly through FOUR by
{name Obsmetrologia.independentEvidenceCharge_slots}`independentEvidenceCharge_slots`
and
{name Obsmetrologia.independentEvidenceCharge_exhaustive}`independentEvidenceCharge_exhaustive`.

The canonical evaluation matrix
{name Obsmetrologia.predicationChu}`predicationChu` has claims as points,
valuations as states, and `r claim valuation = valuation claim`.  Thus the same
FOUR-valued standing of the same predication is already a Chu matrix.  The
compact theorem restoring this once-diffused claim is
{name Obsmetrologia.fregean_predication_forces_four_and_chu}`fregean_predication_forces_four_and_chu`:

```lean
example : FregeanPredicationForcesFourAndChu :=
  fregean_predication_forces_four_and_chu
```

## 8. Settling: closure to a fixed regime

Settling turns evidence and closure into a fixed regime. The knowledge order becomes a
partial order {name Obsmetrologia.Charge.KLE}`KLE` — reflexive, transitive, and antisymmetric
({name Obsmetrologia.Charge.kle_antisymm}`kle_antisymm`). A
{name Obsmetrologia.Charge.Closure}`Closure` is an extensive, monotone, idempotent operator;
{name Obsmetrologia.Charge.settle}`settle` applies it to a seed, and the result is the
_least_ fixed point above the seed ({name Obsmetrologia.Charge.settle_least}`settle_least`) —
the regime the seed settles into.

## 9. The recurring four, identified as one object

{name Obsmetrologia.Articulating.FourCorner}`FourCorner` is the canonical status pair `Bool × Bool` that
every later quartet is an instance of.

{docstring Obsmetrologia.Articulating.FourCorner}

The four-fold identity {name Obsmetrologia.four_fold}`four_fold` records that the
articulation phases and the predicate generators
({name Obsmetrologia.Generator}`Generator`) both have exactly four elements; the bijection
{name Obsmetrologia.cornerStatus}`cornerStatus` is the canonical identification. The
load-bearing conflation — that the `(token, claim)` partition articulating produces
and the four-point value positing admits are _one object_ — is
{name Obsmetrologia.articulation_phase_is_charge}`articulation_phase_is_charge`:

```lean
example (c : Articulating.Cell) :
    Articulating.FourCorner.toCorner c.fourCorner
      = c.corner :=
  articulation_phase_is_charge c
```

and the descent's start is a single point in both readings at once:

```lean
example (u : Utterance) :
    Articulating.FourCorner.toCorner
        (Articulating.Cell.initial u).fourCorner
      = Charge.kBot := rfl
```

## Reader warning

The spine must not be read as "ordinary category theory plus some vocabulary."
Category-like structure appears — but it appears _downstream_ of predication
(§5), and the four-point value is _the same object_ as the articulation phase (§6,
§9), not a separate semantic gadget bolted on. Every later recovered theory in the
library is a re-meeting of this one cell at a greater depth; that is the claim the
keystone (Part III) makes precise.
