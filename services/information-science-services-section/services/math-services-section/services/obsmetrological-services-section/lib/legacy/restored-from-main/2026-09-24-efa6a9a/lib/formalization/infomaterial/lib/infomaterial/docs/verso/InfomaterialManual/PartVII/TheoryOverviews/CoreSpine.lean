import InfomaterialManual.DocSetup
import Infomaterial

open Verso.Genre Manual InlineLean
open Infomaterial

/-!
The core-spine overview, written to the welded form: every cited declaration is a
build-failing `{name …}` reference, and the load-bearing conflations are elaborated
`lean` witnesses rather than restated prose. This is the generative path of Infomaterial —
the part a reader must hold before any later recovered mathematics makes sense.

`{docstring …}` is used only for the two light signatures (`Articulating.Corner`, `FourCorner`)
that render within the native stack on Windows; everything heavier is welded with
`{name …}`. Heavy `{docstring …}` rendering belongs on WSL/CI, as elsewhere in the
manual.
-/

#doc (Manual) "Core spine overview" =>

# Core Spine

This is the generative path of Infomaterial: the chain Mark → Utterance → Articulating →
Articulating.Cell → Predicating → Positing → Settling, with the recurring four
({name Infomaterial.four_fold}`four_fold`) read off it. A reader should understand this
chain before interpreting any later recovered mathematics. The point of this page is
that the chain is not a vocabulary — every step is a declaration, and the conflations
that make it _one_ structure are checked here.

## 1. The admitted data: marks and kinds

Free data enters in exactly two places in the whole library. The first is the atom.
A {name Infomaterial.Mark}`Mark` is a finite surface presentation; identity is role, not
surface, and role is supplied downstream.

A mark stands on one of two sides, {name Infomaterial.Kind}`Kind` — `token` (the
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

{name Infomaterial.Utterance}`Utterance` pairs a token-side mark with a claim-side mark.
It is the _domain_ that articulating acts on — the structured carrier, not yet a
predication. Its accessor {name Infomaterial.Utterance.at_}`at_` reads off the mark on a
named side, definitionally agreeing with the two projections:

```lean
example (u : Utterance) :
    u.at_ Kind.token = u.token := rfl
```

## 3. Articulating: the second admitted recursion

{name Infomaterial.Articulating}`Articulating` is the only other free data — the
`[utterance, articulating]` recursion, everything below it derived. It carries a
{name Infomaterial.Articulating.depth}`depth`, and its two constructors are genuinely
distinct: a bare utterance is never an articulated pair
({name Infomaterial.Articulating.utter_ne_pair}`utter_ne_pair`).

## 4. The first fourfold: articulation cells and corners

When articulating acts on an utterance, each of the two sides is independently either
articulated or not. {name Infomaterial.Articulating.Cell}`Articulating.Cell` records that
state, and the two independent binary statuses partition it into four corners,
{name Infomaterial.Articulating.Corner}`Articulating.Corner`.

{docstring Infomaterial.Articulating.Corner}

The cardinality is _derived_, not chosen — one side would give two cells, three would
give eight; two-sidedness gives exactly four. This is
{name Infomaterial.Articulating.Corner.card_eq_four}`card_eq_four`:

```lean
example : Articulating.Corner.all.length = 4 :=
  Articulating.Corner.card_eq_four
```

The corner of a cell is read by {name Infomaterial.Articulating.Cell.corner}`corner`, and
the initial (neither-side-articulated) cell
{name Infomaterial.Articulating.Cell.initial}`initial` sits at the `potential` corner — the
start of the descent:

```lean
example (u : Utterance) :
    (Articulating.Cell.initial u).corner
      = Articulating.Corner.potential := rfl
```

Every corner is reached by some cell over a fixed utterance
({name Infomaterial.Articulating.Cell.corner_surjective}`corner_surjective`), so the
fourfold is genuinely populated, not a formal four-element type.

## 5. Predicating: categorical shape from the potential cell

Only the `potential` cell carries forward into predication.
{name Infomaterial.PredicationCell}`PredicationCell` is the subject–predicate–object
triple over {name Infomaterial.Entity}`Entity` and {name Infomaterial.Predicate}`Predicate`
(both abbreviations of {name Infomaterial.Mark}`Mark`).
{name Infomaterial.PredicationCell.predicating}`predicating` builds it from a potential
cell; {name Infomaterial.PredicationCell.converse}`converse` swaps subject and object, and
is a genuine involution that moves any non-symmetric cell
({name Infomaterial.PredicationCell.converse_ne}`converse_ne`). This is where category-like
structure first appears — _downstream_ of predication, never assumed before it.

## 6. Positing: value as the FOUR charge

{name Infomaterial.Charge}`Charge` is the four-point value structure positing admits — and
it is _definitionally_ the same four-corner object, `Charge := Articulating.Corner`. The two
lattice orders live on it as {name Infomaterial.Charge.joinK}`joinK` /
{name Infomaterial.Charge.meetK}`meetK` (knowledge) with bounds
{name Infomaterial.Charge.kBot}`kBot` and {name Infomaterial.Charge.kTop}`kTop`, and
{name Infomaterial.Charge.negate}`negate` linking the two orders.

That a bilattice charge _is_ an articulation phase is definitional at the carrier
level, because `Charge := Articulating.Corner`:

```lean
example (c : Articulating.Corner) : (c : Charge) = c :=
  rfl
```

## 7. Settling: closure to a fixed regime

Settling turns evidence and closure into a fixed regime. The knowledge order becomes a
partial order {name Infomaterial.Charge.KLE}`KLE` — reflexive, transitive, and antisymmetric
({name Infomaterial.Charge.kle_antisymm}`kle_antisymm`). A
{name Infomaterial.Charge.Closure}`Closure` is an extensive, monotone, idempotent operator;
{name Infomaterial.Charge.settle}`settle` applies it to a seed, and the result is the
_least_ fixed point above the seed ({name Infomaterial.Charge.settle_least}`settle_least`) —
the regime the seed settles into.

## 8. The recurring four, identified as one object

{name Infomaterial.Articulating.FourCorner}`FourCorner` is the canonical status pair `Bool × Bool` that
every later quartet is an instance of.

{docstring Infomaterial.Articulating.FourCorner}

The four-fold identity {name Infomaterial.four_fold}`four_fold` records that the
articulation phases and the predicate generators
({name Infomaterial.Generator}`Generator`) both have exactly four elements; the bijection
{name Infomaterial.cornerStatus}`cornerStatus` is the canonical identification. The
load-bearing conflation — that the `(token, claim)` partition articulating produces
and the four-point value positing admits are _one object_ — is
{name Infomaterial.articulation_phase_is_charge}`articulation_phase_is_charge`:

```lean
example (c : Articulating.Cell) :
    Articulating.FourCorner.toCorner c.fourCorner = c.corner :=
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
§8), not a separate semantic gadget bolted on. Every later recovered theory in the
library is a re-meeting of this one cell at a greater depth; that is the claim the
keystone (Part III) makes precise.
