import ObsmetrologiaManual.DocSetup
import Obsmetrologia.Language.Positing.Four

open Verso.Genre Manual InlineLean
open Obsmetrologia

/-!
A teaching chapter for charge as the first value object.
-/

#doc (Manual) "Charge as value" =>

# Charge As Value

Charge is the first lawful value object in Obsmetrologia.

The claim-site carried here is:

* claim-site: bilattice charge;
* phase: language;
* generating sites: articulation corner, predication cell, positing;
* Lean carrier: `Obsmetrologia.Language.Positing.Charge`;
* familiar comparison: four-valued bilattice, truth and knowledge orders;
* danger: reading charge as Boolean truth.

The governing sentence is:

> Positing gives a predication site standing, and standing is four-valued before
> it is ever Boolean.

## The Same Four-Corner Object, Re-Met As Value

Lean makes the strongest possible statement:

{docstring Obsmetrologia.Charge}

`Charge` is definitionally the articulation corner:

```lean
example (c : Articulating.Corner) : (c : Charge) = c :=
  rfl
```

This is not analogy. The four-corner object first met as articulation status is
met again as value.

The four distinguished charges are:

{docstring Obsmetrologia.Charge.kBot}

{docstring Obsmetrologia.Charge.tTop}

{docstring Obsmetrologia.Charge.tBot}

{docstring Obsmetrologia.Charge.kTop}

The readings are:

* `kBot`: no evidence either way;
* `tTop`: evidence for;
* `tBot`: evidence against;
* `kTop`: evidence both ways, a held contradiction.

## Two Orders

Charge has two orders.

The knowledge order measures how much evidence is present:

{docstring Obsmetrologia.Charge.leK}

The truth order measures truth-like orientation:

{docstring Obsmetrologia.Charge.leT}

The knowledge bottom is below every charge:

{docstring Obsmetrologia.Charge.kBot_leK}

Checked:

```lean
example (c : Charge) : Charge.leK Charge.kBot c = true :=
  Charge.kBot_leK c
```

The truth bottom is below every charge in the truth order:

{docstring Obsmetrologia.Charge.tBot_le}

Checked:

```lean
example (c : Charge) : Charge.TLE Charge.tBot c :=
  Charge.tBot_le c
```

The repair lesson is simple: when a later page says "order," it must say which
order. Knowledge and truth are not two notations for the same comparison.

## Six Operations

The two orders have their own joins and meets:

{docstring Obsmetrologia.Charge.joinK}

{docstring Obsmetrologia.Charge.meetK}

{docstring Obsmetrologia.Charge.joinT}

{docstring Obsmetrologia.Charge.meetT}

Knowledge join adds evidence:

```lean
example (c : Charge) : Charge.joinK Charge.kBot c = c :=
  Charge.joinK_kBot c
```

Truth join raises toward truth while treating negative evidence differently:

```lean
example (c : Charge) : Charge.joinT c Charge.tBot = c :=
  Charge.joinT_tBot c
```

This is why Boolean truth is a collapse. Boolean truth remembers only one axis
of a structure that has two independent evidence slots and two interlocked
orders.

## Negation And The Klein-Four Projection

Negation swaps the two evidence slots:

{docstring Obsmetrologia.Charge.negate}

It preserves knowledge order and reverses truth order:

{docstring Obsmetrologia.Charge.negate_leK}

{docstring Obsmetrologia.Charge.negate_leT}

At the four-pole level:

```lean
example : Charge.negate Charge.tTop = Charge.tBot := rfl

example : Charge.negate Charge.kTop = Charge.kTop := rfl
```

The capstone `Four` module adds conflation and the Klein-four symmetry:

{docstring Obsmetrologia.Charge.klein_four}

Checked:

```lean
example (c : Charge) :
    Charge.negate (Charge.negate c) = c
      ∧ Charge.conflate (Charge.conflate c) = c
      ∧ Charge.negConf (Charge.negConf c) = c
      ∧ Charge.negate
          (Charge.conflate c) = Charge.negConf c
      ∧ Charge.conflate
          (Charge.negate c) = Charge.negConf c :=
  Charge.klein_four c
```

This is the group projection of the four-valued phase. It belongs here because
positing has generated the four-valued charge object.

## Repair Path

If this chapter fails for a reader, use this route:

1. Read `Obsmetrologia.Articulation.Articulating.FourCorner` for the four-corner
   status object.
2. Read `Obsmetrologia.Language.Positing.Charge` for charge as value.
3. Read `Obsmetrologia.Language.Positing.TruthOrder` for the second order.
4. Read `Obsmetrologia.Language.Positing.Four` for the recurring four and Klein-four
   symmetry.
5. Then read valuation and fiber algebra.

Do not explain charge as "truth value." Explain it as independent evidence for
and against, with Boolean truth recovered only by collapse.
