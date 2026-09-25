import ObsmetrologiaManual.DocSetup
import Obsmetrologia.Language.Positing.Four

open Verso.Genre Manual InlineLean
open Obsmetrologia

/-!
A teaching chapter for reading as the first value object.
-/

#doc (Manual) "Reading as value" =>

# Reading As Value

Reading is the first lawful value object in Obsmetrologia.

The claim-site carried here is:

* claim-site: bilattice reading;
* phase: language;
* generating sites: articulation corner, predication cell, positing;
* Lean carrier: `Obsmetrologia.Language.Positing.Reading`;
* familiar comparison: four-valued bilattice, truth and knowledge orders;
* danger: reading reading as Boolean truth.

The governing sentence is:

> Positing gives a predication site standing, and standing is four-valued before
> it is ever Boolean.

## The Same Four-Corner Object, Re-Met As Value

Lean makes the strongest possible statement:

{docstring Obsmetrologia.Reading}

`Reading` is definitionally the articulation corner:

```lean
example (c : Articulating.Corner) : (c : Reading) = c :=
  rfl
```

This is not analogy. The four-corner object first met as articulation status is
met again as value.

The four distinguished readings are:

{docstring Obsmetrologia.Reading.kBot}

{docstring Obsmetrologia.Reading.tTop}

{docstring Obsmetrologia.Reading.tBot}

{docstring Obsmetrologia.Reading.kTop}

The readings are:

* `kBot`: no evidence either way;
* `tTop`: evidence for;
* `tBot`: evidence against;
* `kTop`: evidence both ways, a held contradiction.

## Two Orders

Reading has two orders.

The knowledge order measures how much evidence is present:

{docstring Obsmetrologia.Reading.leK}

The truth order measures truth-like orientation:

{docstring Obsmetrologia.Reading.leT}

The knowledge bottom is below every reading:

{docstring Obsmetrologia.Reading.kBot_leK}

Checked:

```lean
example (c : Reading) : Reading.leK Reading.kBot c = true :=
  Reading.kBot_leK c
```

The truth bottom is below every reading in the truth order:

{docstring Obsmetrologia.Reading.tBot_le}

Checked:

```lean
example (c : Reading) : Reading.TLE Reading.tBot c :=
  Reading.tBot_le c
```

The repair lesson is simple: when a later page says "order," it must say which
order. Knowledge and truth are not two notations for the same comparison.

## Six Operations

The two orders have their own joins and meets:

{docstring Obsmetrologia.Reading.joinK}

{docstring Obsmetrologia.Reading.meetK}

{docstring Obsmetrologia.Reading.joinT}

{docstring Obsmetrologia.Reading.meetT}

Knowledge join adds evidence:

```lean
example (c : Reading) : Reading.joinK Reading.kBot c = c :=
  Reading.joinK_kBot c
```

Truth join raises toward truth while treating negative evidence differently:

```lean
example (c : Reading) : Reading.joinT c Reading.tBot = c :=
  Reading.joinT_tBot c
```

This is why Boolean truth is a collapse. Boolean truth remembers only one axis
of a structure that has two independent evidence slots and two interlocked
orders.

## Negation And The Klein-Four Projection

Negation swaps the two evidence slots:

{docstring Obsmetrologia.Reading.negate}

It preserves knowledge order and reverses truth order:

{docstring Obsmetrologia.Reading.negate_leK}

{docstring Obsmetrologia.Reading.negate_leT}

At the four-pole level:

```lean
example : Reading.negate Reading.tTop = Reading.tBot := rfl

example : Reading.negate Reading.kTop = Reading.kTop := rfl
```

The capstone `Four` module adds conflation and the Klein-four symmetry:

{docstring Obsmetrologia.Reading.klein_four}

Checked:

```lean
example (c : Reading) :
    Reading.negate (Reading.negate c) = c
      ∧ Reading.conflate (Reading.conflate c) = c
      ∧ Reading.negConf (Reading.negConf c) = c
      ∧ Reading.negate
          (Reading.conflate c) = Reading.negConf c
      ∧ Reading.conflate
          (Reading.negate c) = Reading.negConf c :=
  Reading.klein_four c
```

This is the group projection of the four-valued phase. It belongs here because
positing has generated the four-valued reading object.

## Repair Path

If this chapter fails for a reader, use this route:

1. Read `Obsmetrologia.Articulation.Articulating.FourCorner` for the four-corner
   status object.
2. Read `Obsmetrologia.Language.Positing.Reading` for reading as value.
3. Read `Obsmetrologia.Language.Positing.TruthOrder` for the second order.
4. Read `Obsmetrologia.Language.Positing.Four` for the recurring four and Klein-four
   symmetry.
5. Then read valuation and fiber algebra.

Do not explain reading as "truth value." Explain it as independent evidence for
and against, with Boolean truth recovered only by collapse.
