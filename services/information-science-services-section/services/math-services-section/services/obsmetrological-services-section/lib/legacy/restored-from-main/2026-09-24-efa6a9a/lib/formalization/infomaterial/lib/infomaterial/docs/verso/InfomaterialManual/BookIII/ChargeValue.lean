import InfomaterialManual.DocSetup
import Infomaterial.Language.Positing.Four

open Verso.Genre Manual InlineLean
open Infomaterial

/-!
A teaching chapter for charge as the first value object.
-/

#doc (Manual) "Charge as value" =>

# Charge As Value

Charge is the first lawful value object in Infomaterial.

The claim-site carried here is:

* claim-site: bilattice charge;
* phase: language;
* generating sites: articulation corner, predication cell, positing;
* Lean carrier: `Infomaterial.Language.Positing.Charge`;
* familiar comparison: four-valued bilattice, truth and knowledge orders;
* danger: reading charge as Boolean truth.

The governing sentence is:

> Positing gives a predication site standing, and standing is four-valued before
> it is ever Boolean.

## The Same Four-Corner Object, Re-Met As Value

Lean makes the strongest possible statement:

{docstring Infomaterial.Charge}

`Charge` is definitionally the articulation corner:

```lean
example (c : Articulating.Corner) : (c : Charge) = c :=
  rfl
```

This is not analogy. The four-corner object first met as articulation status is
met again as value.

The four distinguished charges are:

{docstring Infomaterial.Charge.kBot}

{docstring Infomaterial.Charge.tTop}

{docstring Infomaterial.Charge.tBot}

{docstring Infomaterial.Charge.kTop}

The readings are:

* `kBot`: no evidence either way;
* `tTop`: evidence for;
* `tBot`: evidence against;
* `kTop`: evidence both ways, a held contradiction.

## Two Orders

Charge has two orders.

The knowledge order measures how much evidence is present:

{docstring Infomaterial.Charge.leK}

The truth order measures truth-like orientation:

{docstring Infomaterial.Charge.leT}

The knowledge bottom is below every charge:

{docstring Infomaterial.Charge.kBot_leK}

Checked:

```lean
example (c : Charge) : Charge.leK Charge.kBot c = true :=
  Charge.kBot_leK c
```

The truth bottom is below every charge in the truth order:

{docstring Infomaterial.Charge.tBot_le}

Checked:

```lean
example (c : Charge) : Charge.TLE Charge.tBot c :=
  Charge.tBot_le c
```

The repair lesson is simple: when a later page says "order," it must say which
order. Knowledge and truth are not two notations for the same comparison.

## Six Operations

The two orders have their own joins and meets:

{docstring Infomaterial.Charge.joinK}

{docstring Infomaterial.Charge.meetK}

{docstring Infomaterial.Charge.joinT}

{docstring Infomaterial.Charge.meetT}

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

{docstring Infomaterial.Charge.negate}

It preserves knowledge order and reverses truth order:

{docstring Infomaterial.Charge.negate_leK}

{docstring Infomaterial.Charge.negate_leT}

At the four-pole level:

```lean
example : Charge.negate Charge.tTop = Charge.tBot := rfl

example : Charge.negate Charge.kTop = Charge.kTop := rfl
```

The capstone `Four` module adds conflation and the Klein-four symmetry:

{docstring Infomaterial.Charge.klein_four}

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

1. Read `Infomaterial.Articulation.Articulating.FourCorner` for the four-corner
   status object.
2. Read `Infomaterial.Language.Positing.Charge` for charge as value.
3. Read `Infomaterial.Language.Positing.TruthOrder` for the second order.
4. Read `Infomaterial.Language.Positing.Four` for the recurring four and Klein-four
   symmetry.
5. Then read valuation and fiber algebra.

Do not explain charge as "truth value." Explain it as independent evidence for
and against, with Boolean truth recovered only by collapse.
