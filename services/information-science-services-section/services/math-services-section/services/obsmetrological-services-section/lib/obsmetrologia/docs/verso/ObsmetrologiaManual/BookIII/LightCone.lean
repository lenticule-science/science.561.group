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
* generating sites: charge, the two orders, negation and conflation, the Klein
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

A charge is the pair of evidence bits `(pos, neg)`. Read them as the null
coordinates `(u, v)` of a two-dimensional Minkowski diamond. Then
{name Obsmetrologia.Charge.time}`time` is `u + v`, the knowledge content, and
{name Obsmetrologia.Charge.space}`space` is `u − v`:

```lean
example : Charge.time Charge.kBot = 0 := Charge.time_kBot
example : Charge.time Charge.kTop = 2 := Charge.time_kTop
example : Charge.space Charge.tTop = 1 := Charge.space_tTop
example : Charge.space Charge.tBot = -1 := Charge.space_tBot
```

`⊥` is the past tip and `⊤` the future tip; `t` and `f` are the two side
vertices. Nothing is added to FOUR here: the coordinates are read off the two
bits it already has.

## The Knowledge Order Is The Causal Order

The knowledge order is the product order on the null coordinates, which is the
causal-future relation of 1+1 Minkowski space in null coordinates. Equivalently,
it is the light-cone condition `|Δspace| ≤ Δtime`:

```lean
example (a b : Charge) :
    Charge.KLE a b ↔
      ((a.pos = true → b.pos = true) ∧ (a.neg = true → b.neg = true)) :=
  Charge.kle_iff_null a b

example (a b : Charge) :
    Charge.KLE a b ↔
      (Charge.space b - Charge.space a ≤ (Charge.time b : Int) - (Charge.time a : Int)
        ∧ Charge.space a - Charge.space b ≤ (Charge.time b : Int) - (Charge.time a : Int)) :=
  Charge.kle_iff_lightcone a b
```

The truth order raises the for-ray and lowers the against-ray: it is motion in
the spacelike direction:

```lean
example (a b : Charge) :
    Charge.TLE a b ↔
      ((a.pos = true → b.pos = true) ∧ (b.neg = true → a.neg = true)) :=
  Charge.tle_iff_null a b
```

## Spacelike Separation

`t` and `f` sit at equal time, are incomparable in the knowledge order in both
directions, and are comparable in the truth order. That is what spacelike
separation is:

```lean
example :
    Charge.time Charge.tTop = Charge.time Charge.tBot
      ∧ ¬ Charge.KLE Charge.tTop Charge.tBot
      ∧ ¬ Charge.KLE Charge.tBot Charge.tTop
      ∧ Charge.TLE Charge.tBot Charge.tTop :=
  Charge.tTop_tBot_spacelike
```

## Parity And Time Reversal

Negation swaps the two bits: it fixes time and reverses space. Conflation
complements and swaps: it reflects time through the middle of the diamond and
fixes space.

```lean
example (a : Charge) : Charge.time (Charge.negate a) = Charge.time a :=
  Charge.time_negate a
example (a : Charge) : Charge.space (Charge.negate a) = - Charge.space a :=
  Charge.space_negate a
example (a : Charge) : Charge.time (Charge.conflate a) = 2 - Charge.time a :=
  Charge.time_conflate a
example (a : Charge) : Charge.space (Charge.conflate a) = Charge.space a :=
  Charge.space_conflate a
```

## The Gauge Is The Sign-Change Group

On the centred coordinates `(time − 1, space)` the Klein four group acts as
`{1, P, T, PT}`: the identity fixes both, negation reverses space only,
conflation reverses time only, and their composite reverses both. The action is
faithful and multiplicative.

```lean
open Obsmetrologia.Positing.Gauge in
example :
    Charge.signs K4.id = (1, 1)
      ∧ Charge.signs K4.neg = (1, -1)
      ∧ Charge.signs K4.conf = (-1, 1)
      ∧ Charge.signs K4.negConf = (-1, -1) :=
  Charge.k4_is_PT

open Obsmetrologia.Positing.Gauge in
example (g h : K4) :
    Charge.timeSign (K4.mul g h)
      = Charge.timeSign g * Charge.timeSign h :=
  Charge.timeSign_mul g h
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
    Charge.time ((ChuSpace.dual C).r x a)
      = Charge.time (C.r a x) :=
  Charge.chu_dual_time C x a
example (C : ChuSpace) (x : C.sts) (a : C.pts) :
    Charge.space ((ChuSpace.dual C).r x a)
      = - Charge.space (C.r a x) :=
  Charge.chu_dual_space C x a
```

## What This Page Does Not Say

This diamond has one time direction and one space direction. The three of
space lives elsewhere: in the three slots of a predication cell, and in the
void of a settling. Whether those two threes are one object is the frontier
node `thm:void-dimension`.
