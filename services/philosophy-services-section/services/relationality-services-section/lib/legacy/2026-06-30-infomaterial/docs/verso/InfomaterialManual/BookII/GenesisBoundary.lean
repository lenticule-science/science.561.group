import InfomaterialManual.DocSetup
import Infomaterial.Articulation.Articulating.FourCorner

open Verso.Genre Manual InlineLean
open Infomaterial

/-!
A teaching chapter for the admission boundary: marks, utterances, articulating,
and the first four-corner cell.
-/

#doc (Manual) "Genesis boundary" =>

# Genesis Boundary

Genesis is the part of Infomaterial where the book must be most severe about what is
free.

The claim-site carried here is:

* claim-site: primitive admission and first articulation;
* phase: genesis;
* generating sites: none before marks, then utterance, articulating, cell;
* Lean carrier: `Infomaterial.Primitive.Mark` and `Infomaterial.Articulation`;
* familiar comparison: generators, words, objects, and initial state;
* danger: reading marks as already objects or claims as already propositions.

The governing sentence is:

> A mark is admitted; an utterance is paired; articulating is the last free
> recursion; the four-corner cell is generated.

## Marks Are Thin On Purpose

The first carrier is deliberately poor.

{docstring Infomaterial.Mark}

A mark has a surface string, but the surface is not yet mathematical identity.
Identity is not imported at the floor. It is recovered downstream by role,
position, and transport.

The two kinds are positional:

{docstring Infomaterial.Kind}

There are exactly two:

{docstring Infomaterial.Kind.two_kinds}

and they do not collapse:

{docstring Infomaterial.Kind.token_ne_claim}

Checked:

```lean
example (k : Kind) : k = Kind.token \/ k = Kind.claim :=
  Kind.two_kinds k

example : Kind.token = Kind.claim -> False :=
  Kind.token_ne_claim
```

This is the first point where the book must resist imported structure. Token and
claim are not two primitive ontological domains. They are two sides of a later
utterance.

## Utterance Is Pairing, Not Truth

An utterance is the ordered pair of those two sides:

{docstring Infomaterial.Utterance}

Its positional readout is:

{docstring Infomaterial.Utterance.at_}

Checked:

```lean
example (u : Utterance) : u.at_ Kind.token = u.token :=
  Utterance.at_token u

example (u : Utterance) : u.at_ Kind.claim = u.claim :=
  Utterance.at_claim u
```

The ordering is load-bearing. Token first and claim second does not mean
"subject and proposition" yet. It only says that Genesis has generated a
two-sided carrier whose sides can be read by position.

## Articulating Is The Last Free Recursion

Articulating is the base morphism of the descent:

{docstring Infomaterial.Articulating}

Its constructors are the primitive floor and the recursive pair:

{docstring Infomaterial.Articulating.utter}

{docstring Infomaterial.Articulating.pair}

The head and floor projections record that every articulating has a current
utterance and bottoms out at an utterance:

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

The one-way character is also formal:

{docstring Infomaterial.Articulating.utter_ne_pair}

Checked:

```lean
example (u v : Utterance) (a : Articulating) :
    Articulating.utter u = Articulating.pair v a -> False :=
  Articulating.utter_ne_pair u v a
```

This is why Genesis is an admission boundary. After this point, the book should
not say "choose any structure you like" without explaining which earlier phase
generated it.

## The First Four-Corner Cell

An articulation cell is the utterance together with two generated statuses. In
Lean this object is {name Infomaterial.Articulating.Cell}`Articulating.Cell`.

The four corners are not declared as four truth values. The Lean object is
{name Infomaterial.Articulating.Corner}`Articulating.Corner`: the four points of two
Boolean articulation statuses.

The corner list has cardinality four:

{docstring Infomaterial.Articulating.Corner.card_eq_four}

Checked:

```lean
example : Articulating.Corner.all.length = 4 :=
  Articulating.Corner.card_eq_four
```

The initial cell is the potential corner:

{docstring Infomaterial.Articulating.Cell.initial}

The theorem {name Infomaterial.Articulating.Cell.corner_initial}`corner_initial`
records that the initial cell sits at the potential corner.

Checked:

```lean
example (u : Utterance) :
    (Articulating.Cell.initial u).corner
      = Articulating.Corner.potential :=
  Articulating.Cell.corner_initial u
```

## The First Conflation Theorem

The recurring four is already visible at Genesis, but it must be read with care.
The canonical four-corner object is:

{docstring Infomaterial.Articulating.FourCorner}

The articulation phase of a cell is:

{docstring Infomaterial.Articulating.Cell.fourCorner}

and the first transport theorem says that the articulation phase, read as a
four-corner, is the charge corner:

{docstring Infomaterial.articulation_phase_is_charge}

The potential cell is the knowledge-bottom charge:

{docstring Infomaterial.potential_is_kBot}

Checked:

```lean
example (u : Utterance) :
    Articulating.FourCorner.toCorner
        (Articulating.Cell.initial u).fourCorner
      = Charge.kBot :=
  potential_is_kBot u
```

This does not mean that Genesis already has the whole bilattice. It means the
first four-corner object has been generated, and later phases can transport it
into value, modality, nuclear closure, and regime.

## Repair Path

If this chapter fails for a reader, use this route:

1. Read `Infomaterial.Primitive.Mark` and accept how little is admitted.
2. Read `Infomaterial.Articulation.Articulating.Utterance` for the two-sided carrier.
3. Read `Infomaterial.Articulation.Articulating` for the last free recursion.
4. Read `Infomaterial.Articulation.Articulating.Cell` for the four generated statuses.
5. Read `Infomaterial.Articulation.Articulating.FourCorner` for the first transport to
   the recurring FOUR.

Only after that should the reader enter predication or charge.
