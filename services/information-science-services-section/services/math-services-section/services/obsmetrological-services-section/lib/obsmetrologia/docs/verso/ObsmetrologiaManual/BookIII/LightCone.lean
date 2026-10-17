import ObsmetrologiaManual.DocSetup
import Obsmetrologia.Language.Positing.LightCone

open Verso.Genre Manual InlineLean
open Obsmetrologia

/-!
The teaching carrier for the light-cone reading of the value object FOUR.
-/

#doc (Manual) "The light cone" =>

# The Light Cone: FOUR As The 1+1 Causal Diamond

The claim-site carried here is:

* claim-site: the light-cone reading of the value object;
* phase: value, read as the local geometry of spacetime;
* generating sites: reading, the two orders, negation and conflation, the Klein
  four gauge, the Chu dual;
* Lean carrier: `Obsmetrologia.Language.Positing.LightCone`;
* Blueprint nodes: `thm:light-cone`, `thm:light-cone-k4`,
  `thm:light-cone-chu-dual`;
* provenance: the monograph's "one diamond turned a quarter turn", made exact;
* familiar comparison: 1+1 Minkowski space in null coordinates; the four
  connected components of the Lorentz group;
* danger: reading the three of space off this diamond, which has one space
  direction.

The governing sentence is:

> The two evidence bits are the two null rays of a diamond. Knowledge is time,
> truth is space, negation is parity, conflation is time reversal.

## Null Coordinates

A reading is the pair of evidence bits `(pos, neg)`. Read them as the null
coordinates `(u, v)` of a two-dimensional Minkowski diamond. Then
{name Obsmetrologia.Reading.time}`time` is `u + v`, the knowledge content, and
{name Obsmetrologia.Reading.space}`space` is `u − v`:

```lean
example : Reading.time Reading.kBot = 0 := Reading.time_kBot
example : Reading.time Reading.kTop = 2 := Reading.time_kTop
example : Reading.space Reading.tTop = 1 := Reading.space_tTop
example : Reading.space Reading.tBot = -1 := Reading.space_tBot
```

`⊥` is the past tip and `⊤` the future tip; `t` and `f` are the two side
vertices. Nothing is added to FOUR here: the coordinates are read off the two
bits it already has.

## The Knowledge Order Is The Causal Order

The knowledge order is the product order on the null coordinates, which is the
causal-future relation of 1+1 Minkowski space in null coordinates. Equivalently,
it is the light-cone condition `|Δspace| ≤ Δtime`:

```lean
example (a b : Reading) :
    Reading.KLE a b ↔
      ((a.pos = true → b.pos = true) ∧ (a.neg = true → b.neg = true)) :=
  Reading.kle_iff_null a b

example (a b : Reading) :
    Reading.KLE a b ↔
      (Reading.space b - Reading.space a ≤ (Reading.time b : Int) - (Reading.time a : Int)
        ∧ Reading.space a - Reading.space b ≤ (Reading.time b : Int) - (Reading.time a : Int)) :=
  Reading.kle_iff_lightcone a b
```

The truth order raises the for-ray and lowers the against-ray: it is motion in
the spacelike direction:

```lean
example (a b : Reading) :
    Reading.TLE a b ↔
      ((a.pos = true → b.pos = true) ∧ (b.neg = true → a.neg = true)) :=
  Reading.tle_iff_null a b
```

## Spacelike Separation

`t` and `f` sit at equal time, are incomparable in the knowledge order in both
directions, and are comparable in the truth order. That is what spacelike
separation is:

```lean
example :
    Reading.time Reading.tTop = Reading.time Reading.tBot
      ∧ ¬ Reading.KLE Reading.tTop Reading.tBot
      ∧ ¬ Reading.KLE Reading.tBot Reading.tTop
      ∧ Reading.TLE Reading.tBot Reading.tTop :=
  Reading.tTop_tBot_spacelike
```

## Parity And Time Reversal

Negation swaps the two bits: it fixes time and reverses space. Conflation
complements and swaps: it reflects time through the middle of the diamond and
fixes space.

```lean
example (a : Reading) : Reading.time (Reading.negate a) = Reading.time a :=
  Reading.time_negate a
example (a : Reading) : Reading.space (Reading.negate a) = - Reading.space a :=
  Reading.space_negate a
example (a : Reading) : Reading.time (Reading.conflate a) = 2 - Reading.time a :=
  Reading.time_conflate a
example (a : Reading) : Reading.space (Reading.conflate a) = Reading.space a :=
  Reading.space_conflate a
```

## The Gauge Is The Sign-Change Group

On the centred coordinates `(time − 1, space)` the Klein four group acts as
`{1, P, T, PT}`: the identity fixes both, negation reverses space only,
conflation reverses time only, and their composite reverses both. The action is
faithful and multiplicative.

```lean
open Obsmetrologia.Positing.Gauge in
example :
    Reading.signs K4.id = (1, 1)
      ∧ Reading.signs K4.neg = (1, -1)
      ∧ Reading.signs K4.conf = (-1, 1)
      ∧ Reading.signs K4.negConf = (-1, -1) :=
  Reading.signs_table

open Obsmetrologia.Positing.Gauge in
example (g h : K4) :
    Reading.timeSign (K4.mul g h)
      = Reading.timeSign g * Reading.timeSign h :=
  Reading.timeSign_mul g h
```

The external identification, stated here and not formalized: `{1, P, T, PT}` is
the component group of the Lorentz group `O(1,1)`, and equally of `O(3,1)`. The
gauge of FOUR is the discrete part of any Lorentzian symmetry group. It is
compatible with `3+1` and does not select the `3`.

## Chu Duality Is The Transpose Composed With Parity

The dual of a FOUR-valued Chu space transposes the matrix and negates each
entry. In light-cone coordinates it fixes every entry's time and reverses its
space:

```lean
example (C : ChuSpace) (x : C.sts) (a : C.pts) :
    Reading.time ((ChuSpace.dual C).r x a)
      = Reading.time (C.r a x) :=
  Reading.chu_dual_time C x a
example (C : ChuSpace) (x : C.sts) (a : C.pts) :
    Reading.space ((ChuSpace.dual C).r x a)
      = - Reading.space (C.r a x) :=
  Reading.chu_dual_space C x a
```

## What This Page Does Not Say

This diamond has one time direction and one space direction. The three of
space lives elsewhere: in the three slots of a predication cell, and in the
void of a settling. Whether those two threes are one object is the frontier
node `thm:void-dimension`.
