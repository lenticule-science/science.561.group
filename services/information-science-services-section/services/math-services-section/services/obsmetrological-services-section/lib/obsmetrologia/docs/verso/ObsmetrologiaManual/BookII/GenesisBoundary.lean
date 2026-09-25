import ObsmetrologiaManual.DocSetup
import Obsmetrologia.Articulation.Articulating.FourCorner

open Verso.Genre Manual InlineLean
open Obsmetrologia

/-!
A teaching chapter for the admission boundary: marks, typed hands, utterances,
articulating, and the first four-corner cell.
-/

#doc (Manual) "Genesis boundary" =>

# Genesis Boundary

Genesis is the part of Obsmetrologia where the book must be most severe about what is
free.

The claim-site carried here is:

* claim-site: primitive admission and first articulation;
* phase: genesis;
* generating sites: none before marks, then token/claim, utterance, articulating, cell;
* Lean carrier: `Obsmetrologia.Primitive.Mark` and `Obsmetrologia.Articulation`;
* familiar comparison: generators, words, objects, and initial state;
* danger: reading marks as already objects or claims as already propositions.

The governing sentence is:

> A mark is admitted; a mark carried on a hand is a token or a claim; an
> utterance pairs the two hands; articulating is the last free recursion; the
> four-corner cell is generated, as two witness slots, not two bare bits.

## Marks Are Thin On Purpose

The first carrier is deliberately poor.

{docstring Obsmetrologia.Mark}

A mark has a surface string, but the surface is not yet mathematical identity.
Identity is not imported at the floor. It is recovered downstream by role,
position, and transport.

The two kinds are positional:

{docstring Obsmetrologia.Kind}

There are exactly two:

{docstring Obsmetrologia.Kind.two_kinds}

and they do not collapse:

{docstring Obsmetrologia.Kind.token_ne_claim}

Checked:

```lean
example (k : Kind) : k = Kind.token \/ k = Kind.claim :=
  Kind.two_kinds k

example : Kind.token = Kind.claim -> False :=
  Kind.token_ne_claim
```

`Kind` names the two positions in the abstract. It is not yet the carrier a mark
is let in on; that carrier is the next section's typed hand.

## Hands Are Types: Token And Claim

**Owner ruling 2026-09-21, "the admission boundary, restored."** A mark is let
into the theory only on a hand, and the hand is a type, not a position read off
a bare pair of marks afterward:

{docstring Obsmetrologia.Token}

{docstring Obsmetrologia.Claim}

Each is a one-field carrier of exactly one mark and nothing else, so a token's
identity does not collapse to its claim-side twin even when both happen to
carry the same mark. Mark equality gives carrier equality, and nothing more:

{docstring Obsmetrologia.Token.ext}

{docstring Obsmetrologia.Claim.ext}

Checked:

```lean
example (t1 t2 : Token) (h : t1.mark = t2.mark) : t1 = t2 :=
  Token.ext h

example (c1 c2 : Claim) (h : c1.mark = c2.mark) : c1 = c2 :=
  Claim.ext h
```

Token and claim are still not two primitive ontological domains: no polarity,
value, or truth attaches to either. They are the two typed sides of a later
utterance, distinguished now by their own type rather than merely by position.

## Utterance Is Pairing, Not Truth

An utterance is the ordered pair of those two typed hands:

{docstring Obsmetrologia.Utterance}

Its positional readout reaches back down to the bare mark on either hand:

{docstring Obsmetrologia.Utterance.at_}

Checked:

```lean
example (u : Utterance) : u.at_ Kind.token = u.token.mark :=
  Utterance.at_token u

example (u : Utterance) : u.at_ Kind.claim = u.claim.mark :=
  Utterance.at_claim u
```

The ordering is load-bearing. Token first and claim second does not mean
"subject and proposition" yet. It only says that Genesis has generated a
two-sided, typed carrier whose sides can be read by position, and it is the
theory's **sole admission boundary**: the one place a mark is let in.

## Articulating Is The Last Free Recursion

Articulating is the base morphism of the descent:

{docstring Obsmetrologia.Articulating}

Its constructors are the primitive floor and the recursive pair:

{docstring Obsmetrologia.Articulating.utter}

{docstring Obsmetrologia.Articulating.pair}

The head and floor projections record that every articulating has a current
utterance and bottoms out at an utterance:

{docstring Obsmetrologia.Articulating.head}

{docstring Obsmetrologia.Articulating.floor}

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

{docstring Obsmetrologia.Articulating.utter_ne_pair}

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

An articulation cell is the utterance together with two generated **witness
slots**, one per hand, not two bare bits. In Lean this object is
{name Obsmetrologia.Articulating.Cell}`Articulating.Cell`:

{docstring Obsmetrologia.Articulating.Cell +allowMissing}

The four corners are not declared as four truth values. The Lean object is
{name Obsmetrologia.Articulating.Corner}`Articulating.Corner`: the four points
read off the presence status of the two witness slots.

The corner list has cardinality four:

{docstring Obsmetrologia.Articulating.Corner.card_eq_four}

Checked:

```lean
example : Articulating.Corner.all.length = 4 :=
  Articulating.Corner.card_eq_four
```

The un-articulated position, both slots empty, is where a cell would sit
before any articulation reaches it — it is not articulating's own output:

{docstring Obsmetrologia.Articulating.Cell.unarticulated}

The theorem {name Obsmetrologia.Articulating.Cell.unarticulated_corner}`unarticulated_corner`
records that the un-articulated cell sits at the absurd corner.

Checked:

```lean
example (u : Utterance) :
    (Articulating.Cell.unarticulated u).corner
      = Articulating.Corner.absurd :=
  Articulating.Cell.unarticulated_corner u
```

## The Admission Boundary, Restored

**Owner ruling 2026-09-21.** Articulating measures, it does not seed: to
articulate an utterance is to place its own token as a witness on the token
slot and leave the claim slot free, landing at **potential**, never at the
un-articulated position above:

{docstring Obsmetrologia.Articulating.Cell.articulate}

{docstring Obsmetrologia.Articulating.Cell.articulate_corner}

Checked:

```lean
example (u : Utterance) :
    (Articulating.Cell.articulate u).corner = Articulating.Corner.potential :=
  Articulating.Cell.articulate_corner u
```

The token witness articulating supplies is always among the cell's own
witnesses — nothing is merely asserted, everything is carried:

{docstring Obsmetrologia.Articulating.head_token_mem_tokenSlot}

Checked:

```lean
example (a : Articulating) :
    a.head.token ∈ (Articulating.cell a).tokenSlot :=
  Articulating.head_token_mem_tokenSlot a
```

The generated cell never sits at the un-articulated position: absurd (like
active) is reached only downstream, by the value algebra's knowledge meet or
negation, never by articulating itself. In Lean this is
{name Obsmetrologia.Articulating.cell_corner_ne_absurd}`cell_corner_ne_absurd`.

Checked:

```lean
example (a : Articulating) :
    (Articulating.cell a).corner ≠ Articulating.Corner.absurd :=
  Articulating.cell_corner_ne_absurd a
```

So articulating's codomain, read plainly, is smaller than the four-corner
partition it inhabits: every cell articulating produces is potential or
stable, and the un-articulated position and the active corner are read *about*
the partition, never read *off* an articulating.

## The First Conflation Theorem

The recurring four is already visible at Genesis, but it must be read with care.
The canonical four-corner object is:

{docstring Obsmetrologia.Articulating.FourCorner}

The articulation phase of a cell is:

{docstring Obsmetrologia.Articulating.Cell.fourCorner}

and the first transport theorem says that the articulation phase, read as a
four-corner, is the charge corner:

{docstring Obsmetrologia.articulation_phase_is_charge}

The un-articulated cell is the knowledge-bottom charge:

{docstring Obsmetrologia.absurd_is_kBot}

Checked:

```lean
example (u : Utterance) :
    Articulating.FourCorner.toCorner
        (Articulating.Cell.unarticulated u).fourCorner
      = Charge.kBot :=
  absurd_is_kBot u
```

This does not mean that Genesis already has the whole bilattice. It means the
first four-corner object has been generated, and later phases can transport it
into value, modality, nuclear closure, and regime.

## Repair Path

If this chapter fails for a reader, use this route:

1. Read `Obsmetrologia.Primitive.Mark` and accept how little is admitted.
2. Read `Obsmetrologia.Articulation.Articulating.Utterance` for the typed,
   two-sided carrier — the sole admission boundary.
3. Read `Obsmetrologia.Articulation.Articulating` for the last free recursion.
4. Read `Obsmetrologia.Articulation.Articulating.Cell` for the two witness
   slots and the four generated statuses read off them.
5. Read `Obsmetrologia.Articulation.Articulating.FourCorner` for the first transport to
   the recurring FOUR.

Only after that should the reader enter predication or charge.
