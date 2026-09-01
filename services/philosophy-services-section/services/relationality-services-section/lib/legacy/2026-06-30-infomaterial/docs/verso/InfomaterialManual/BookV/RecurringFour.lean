import InfomaterialManual.DocSetup
import Infomaterial.Language.Positing.Quartet

open Verso.Genre Manual InlineLean
open Infomaterial

/-!
A teaching chapter for the recurring FOUR as a transported object rather than a
visual motif.
-/

#doc (Manual) "Recurring FOUR" =>

# Recurring FOUR

The recurring FOUR is the first place where the book can easily lie by being
too pretty. Fourness is not a style. It is a transported coherence cell, and the
transport has to be named.

The claim-site carried here is:

* claim-site: recurring four-corner coherence cell;
* phase: fourfold relational matter;
* generating sites: articulation corner, charge, modal reading, nuclear quartet,
  commuting pair;
* Lean carrier: `Infomaterial.Language.Positing.Quartet`;
* familiar comparison: Klein-four symmetry, modal diamond/box, commuting nuclei;
* danger: treating every four-item list as the same theorem.

The governing sentence is:

> The same four-corner object is met at successive depths, while the laws living
> on that object may change with depth.

## The Modal Reading

The modal four is:

{docstring Infomaterial.Modal}

It is not a new four. It is a reading of the articulation corner:

{docstring Infomaterial.Modal.toCorner}

{docstring Infomaterial.Modal.ofCorner}

The round trips are identities:

{name Infomaterial.Modal.ofCorner_toCorner}`ofCorner_toCorner`

{name Infomaterial.Modal.toCorner_ofCorner}`toCorner_ofCorner`

Checked:

```lean
example (m : Modal) :
    Modal.ofCorner (Modal.toCorner m) = m :=
  Modal.ofCorner_toCorner m

example (c : Articulating.Corner) :
    Modal.toCorner (Modal.ofCorner c) = c :=
  Modal.toCorner_ofCorner c
```

This says the modal vocabulary `{neither, diamond, box, both}` is a transported
reading of the same four-corner object first generated at articulation.

## The Keystone Bundle

The bundle of recurrence witnesses is:

{docstring Infomaterial.QuartetRecurrence}

and the theorem inhabiting it is:

{docstring Infomaterial.quartet_recurrence}

Checked:

```lean
example : QuartetRecurrence :=
  quartet_recurrence

example : Articulating.Corner.all.length = 4 :=
  quartet_recurrence.card_four
```

The theorem is not merely cardinality. It says the four-corner reading through
`Bool x Bool`, through modal vocabulary, and through the articulation phase all
round-trip coherently.

The articulation-to-charge field is especially important:

```lean
example (c : Articulating.Cell) :
    Articulating.FourCorner.toCorner c.fourCorner
      = c.corner :=
  quartet_recurrence.articulation_is_charge c
```

That example is a small proof of the book's discipline. The charge reading is
not pasted onto articulation. It is reached by an explicit theorem.

## The Shared Coherence Cell

The recurrence is not only a recurrence of a four-point object. It also carries
a recurring commuting square.

The abstract carrier is:

{docstring Infomaterial.CommutingPair}

Its corner operators are:

{docstring Infomaterial.CommutingPair.cornerOp}

and the generic square is:

{docstring Infomaterial.CommutingPair.square}

Checked:

```lean
example (P : CommutingPair Charge) (a : Charge) :
    P.cornerOp Articulating.Corner.absurd a
      = (fun a => P.g (P.f a)) a :=
  P.square a
```

This is the actual common cell: apply neither, apply the first map, apply the
second map, or apply both. The shared theorem is the square saying the two paths
to the doubly-acted corner agree.

## Twistoring And Commutating

At the charge depth, the commuting pair is twistoring:

{docstring Infomaterial.twistoringPair}

At the nuclear depth, the commuting pair is commutating:

{docstring Infomaterial.commutatingPair}

The headline comparison is:

{docstring Infomaterial.twistoring_eq_commutating}

Checked:

```lean
example : TwistoringEqCommutating :=
  twistoring_eq_commutating

example (a : Charge) :
    twistoringPair.cornerOp Articulating.Corner.absurd a
      = (fun a =>
          twistoringPair.g
            (twistoringPair.f a)) a :=
  twistoringPair.square a

example (H : Order.HeytingAlgebra)
    (Q : Order.CommutingNuclei H)
    (a : H.carrier) :
    (commutatingPair Q).cornerOp
        Articulating.Corner.absurd a
      = (fun a =>
          (commutatingPair Q).g
            ((commutatingPair Q).f a)) a :=
  (commutatingPair Q).square a
```

This is the strongest form of restraint. At charge depth the two maps are
involutions. At nuclear depth the two maps are idempotent nuclei. The shared
object is not those extra laws. The shared object is the commuting-square
coherence cell indexed by the four corners.

## The Nuclear Quartet

The abstract nuclear quartet lives in the order hierarchy:

{docstring Infomaterial.Order.NuclearQuartet.cornerOp}

Its joint corner is the intersection of the two singly fixed corners:

{docstring Infomaterial.Order.NuclearQuartet.absurd_iff_active_and_stable}

Checked:

```lean
example (H : Order.HeytingAlgebra)
    (Q : Order.NuclearQuartet H)
    (a : H.carrier) :
    Q.cornerOp Articulating.Corner.absurd a = a
      <->
    (Q.cornerOp Articulating.Corner.active a = a
      /\ Q.cornerOp Articulating.Corner.stable a = a) :=
  Order.NuclearQuartet.absurd_iff_active_and_stable Q a
```

This is why nuclear quartet belongs in Book V before the valuation-fiber chapter.
The reader should first learn the four-corner discipline, then meet the concrete
valuation fiber as a particular phase-local place where such nuclei can live.

## Repair Path

If this chapter fails for a reader, use this route:

1. Read `Infomaterial.Articulation.Articulating.Cell` for the first four generated
   corners.
2. Read `Infomaterial.Articulation.Articulating.FourCorner` for the first transport
   from status pair to charge corner.
3. Read `Infomaterial.Language.Positing.Four` for charge operations and Klein-four
   symmetry.
4. Read `Infomaterial.Language.Positing.NucleusAndCommutingNuclei` for the nuclear
   quartet.
5. Read `Infomaterial.Language.Positing.Quartet` for `quartet_recurrence` and
   `twistoring_eq_commutating`.

The next phase-local use of this discipline is the valuation fiber: the quartet
becomes concrete as commuting nuclei on valuations.
