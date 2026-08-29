import InfomaterialManual.DocSetup
import Infomaterial.Language.Positing.OrderSwapDuality
import Infomaterial.Language.Positing.Gauge
import Infomaterial.Language.Positing.D4Gauge
import Infomaterial.Language.Positing.Bigraded
import Infomaterial.Language.Positing.BigradedTower

open Verso.Genre Manual InlineLean
open Infomaterial
open Infomaterial.Positing.Gauge
open Infomaterial.Positing.BigradedTower
open Infomaterial.D4

/-!
A teaching chapter for generated symmetry, nuclear quartets, and the bigraded
positing tower.
-/

#doc (Manual) "Positing symmetry tower" =>

# Positing Symmetry Tower

Charge is not the end of the language phase. Once charge exists, the manual may
speak about the two orders on the same value object, the symmetries of that
object, and the nuclear quartets that later pages use as cohomological and gauge
projections. This page is upstream of those later uses.

The claim-site carried here is:

* claim-site: generated symmetry and bigraded nuclear tower inside positing;
* phase: language, after predication and charge, before closure and gluing use
  these structures as derived comparisons;
* generating sites: `Charge`, knowledge order, truth order, negation,
  conflation, order-swap, same-order nuclei, and valuation fibers;
* downstream uses: recurring FOUR, valuation fiber algebra, bigraded
  cohomology, K4 and D4 gauge language, aperiodic moduli, and physical gauge
  projections;
* Lean carriers: `Infomaterial.Language.Positing.OrderSwapDuality`,
  `Infomaterial.Language.Positing.Gauge`,
  `Infomaterial.Language.Positing.D4Gauge`,
  `Infomaterial.Language.Positing.Bigraded`, and
  `Infomaterial.Language.Positing.BigradedTower`;
* Blueprint/proof-tree nodes: no dedicated Blueprint node yet for this tower;
  primitive provenance remains the mark and articulation proof tree, while the
  tower itself is settled by the Lean declarations named below;
* provenance: pre-bilattice notes on two-order duality, Klein-four symmetry,
  and the bigraded diamond;
* familiar comparison: bilattice automorphisms, Klein-four and dihedral symmetry,
  Heyting nuclei, fixed-point subalgebras, and graded cohomological axes;
* reader closure: do not treat the truth order as a second knowledge nucleus;
  it enters the tower as a grade after the cross-order obstruction is proved;
* frontier status: the page proves the finite charge-level tower. General
  enriched, sheafified, or 2-categorical KZ versions remain frontier unless
  their carriers are built.

The governing sentence is:

> Positing generates the two-order square; gauge and cohomology may use it only
> after its order transport and grading laws are explicit.

## Order Swap

The order-swap `sigma` is not negation and not conflation. It is the map that
transports the knowledge order to the truth order:

{docstring Infomaterial.Charge.swap}

{docstring Infomaterial.Charge.swap_kle_tle}

Checked:

```lean
example (a b : Charge) :
    Charge.KLE a b
      <-> Charge.TLE (Charge.swap a) (Charge.swap b) :=
  Charge.swap_kle_tle a b
```

This is the first lawful way to say that the two orders are related. It is still
not a collapse. The same charge object carries both orders, and `sigma` explains
how facts move between them.

## Same-Order Nuclei

The nuclear quartet is not a free metaphor for "four things." It begins with a
Heyting algebra and two commuting same-order nuclei:

{name Infomaterial.Nucleus}`Nucleus`

{name Infomaterial.NuclearSquare}`NuclearSquare`

The joint fixed point is exactly the intersection of the two fixed-point
conditions:

{docstring Infomaterial.NuclearSquare.fix_pi_iff}

Checked on the charge knowledge-Heyting algebra:

```lean
example (c1 c2 a : Charge) :
    (Charge.joinSquare c1 c2).pi a = a
      <-> ((Charge.joinSquare c1 c2).j1.j a = a
        ∧ (Charge.joinSquare c1 c2).j2.j a = a) :=
  (Charge.joinSquare c1 c2).fix_pi_iff a
```

This is why later "diamond" language is lawful only when a same-order nuclear
square has been produced. Without commuting nuclei, the four corners are only
resemblance.

## Variation Is Data

The tower is not one static square. A family of nuclear squares may vary across
fibers:

{name Infomaterial.SquareFamily}`SquareFamily`

{docstring Infomaterial.SquareFamily.Varies}

The library includes a concrete varying family on charge:

```lean
example :
    SquareFamily.Varies Charge.varyingFamily :=
  Charge.varyingFamily_varies
```

This matters for persistence. If the square never varies, later pages cannot
honestly use it to witness history separation, aperiodicity, or moduli.

## K4 Grading

The Klein-four carrier is the finite generated gauge object of the charge square:

{docstring Infomaterial.Positing.Gauge.K4}

Its two coordinates become the bigrading axes:

{docstring Infomaterial.Positing.BigradedTower.toFourCorner}

{docstring Infomaterial.Positing.BigradedTower.axes_independent}

Checked:

```lean
example (g : K4) :
    toFourCorner (ofFourCorner (toFourCorner g))
      = toFourCorner g := by
  rw [ofFourCorner_toFourCorner]
```

This is where the later phrase "bigraded" earns its grammar. It is not a label
placed on a cohomology group. It is the product of the knowledge gauge axis and
the truth/conflation axis.

## The Cross-Order Warning

The tower records the non-obvious discipline:

{docstring Infomaterial.Positing.BigradedTower.tower_bigrading_is_two_orders}

Checked:

```lean
example :
    (forall g : K4, toFourCorner g
        = (towerTwoOrdersBigrading.knowledge_axis g,
            towerTwoOrdersBigrading.truth_axis g))
    ∧ (exists v : Valuation,
        Not (Positing.FiberAlgebra.fLeK v
          (fun phi => Charge.joinT Charge.kBot (v phi)))) :=
  tower_bigrading_is_two_orders
```

The second order is not silently installed as a co-nucleus in the same square.
Lean carries a counterexample: a truth-closure need not be knowledge-above the
valuation. The lawful repair is grading, not pretending the two orders are the
same kind of nucleus.

## D4 Completion

After order-swap exists, the Klein-four gauge extends to the eight-element
dihedral symmetry of the charge square:

{docstring Infomaterial.D4.D8}

The action is a real action by composition:

{docstring Infomaterial.D4.D8.act_mul}

Checked:

```lean
example (g h : D8) (a : Charge) :
    D8.act (D8.mul g h) a
      = D8.act g (D8.act h a) :=
  D8.act_mul g h a
```

D4 is therefore not imported group theory. It is the generated automorphism
projection of the four-valued positing square with the two orders kept visible.

## Reader Closure

To read later gauge, cohomology, or physics pages:

1. Start with charge, not a group.
2. Distinguish knowledge order from truth order.
3. Use `swap` to transport between orders.
4. Use same-order commuting nuclei for the diamond.
5. Use K4 as the grading of the tower.
6. Use D4 only after order-swap has made the full symmetry legal.

If a later page says "gauge" without this chain, it is using a projection before its
generating phase.
