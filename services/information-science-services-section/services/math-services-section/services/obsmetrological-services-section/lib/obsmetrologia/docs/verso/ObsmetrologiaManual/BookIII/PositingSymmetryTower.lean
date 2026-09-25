import ObsmetrologiaManual.DocSetup
import Obsmetrologia.Language.Positing.OrderSwapDuality
import Obsmetrologia.Language.Positing.Gauge
import Obsmetrologia.Language.Positing.D4Gauge
import Obsmetrologia.Language.Positing.Bigraded
import Obsmetrologia.Language.Positing.BigradedTower
import Obsmetrologia.Language.Positing.NuclearFormula

open Verso.Genre Manual InlineLean
open Obsmetrologia
open Obsmetrologia.Positing.Gauge
open Obsmetrologia.Positing.BigradedTower
open Obsmetrologia.Positing
open Obsmetrologia.D4

/-!
A teaching chapter for generated symmetry, nuclear quartets, and the bigraded
positing tower.
-/

#doc (Manual) "Positing symmetry tower" =>

# Positing Symmetry Tower

Reading is not the end of the language phase. Once reading exists, the manual may
speak about the two orders on the same value object, the symmetries of that
object, and the nuclear quartets that later pages use as cohomological and gauge
projections. This page is upstream of those later uses.

The claim-site carried here is:

* claim-site: generated symmetry and bigraded nuclear tower inside positing;
* phase: language, after predication and reading, before closure and gluing use
  these structures as derived comparisons;
* generating sites: `Reading`, knowledge order, truth order, negation,
  conflation, order-swap, same-order nuclei, and valuation fibers;
* downstream uses: recurring FOUR, valuation fiber algebra, bigraded
  cohomology, K4 and D4 gauge language, aperiodic moduli, and physical gauge
  projections;
* Lean carriers: `Obsmetrologia.Language.Positing.OrderSwapDuality`,
  `Obsmetrologia.Language.Positing.Gauge`,
  `Obsmetrologia.Language.Positing.D4Gauge`,
  `Obsmetrologia.Language.Positing.Bigraded`, and
  `Obsmetrologia.Language.Positing.BigradedTower`;
* Blueprint/proof-tree nodes: no dedicated Blueprint node yet for this tower;
  primitive provenance remains the mark and articulation proof tree, while the
  tower itself is settled by the Lean declarations named below;
* provenance: pre-bilattice notes on two-order duality, Klein-four symmetry,
  and the bigraded diamond;
* familiar comparison: bilattice automorphisms, Klein-four and dihedral symmetry,
  Heyting nuclei, fixed-point subalgebras, and graded cohomological axes;
* reader closure: do not treat the truth order as a second knowledge nucleus;
  it enters the tower as a grade after the cross-order obstruction is proved;
* frontier status: the page proves the finite reading-level tower. General
  enriched, sheafified, or 2-categorical KZ versions remain frontier unless
  their carriers are built.

The governing sentence is:

> Positing generates the two-order square; gauge and cohomology may use it only
> after its order transport and grading laws are explicit.

## Order Swap

The order-swap `sigma` is not negation and not conflation. It is the map that
transports the knowledge order to the truth order:

{docstring Obsmetrologia.Reading.swap}

{docstring Obsmetrologia.Reading.swap_kle_tle}

Checked:

```lean
example (a b : Reading) :
    Reading.KLE a b
      <-> Reading.TLE (Reading.swap a) (Reading.swap b) :=
  Reading.swap_kle_tle a b
```

This is the first lawful way to say that the two orders are related. It is still
not a collapse. The same reading object carries both orders, and `sigma` explains
how facts move between them.

## Same-Order Nuclei

The nuclear quartet is not a free metaphor for "four things." It begins with a
Heyting algebra and two commuting same-order nuclei:

{name Obsmetrologia.Nucleus}`Nucleus`

{name Obsmetrologia.NuclearSquare}`NuclearSquare`

The joint fixed point is exactly the intersection of the two fixed-point
conditions:

{docstring Obsmetrologia.NuclearSquare.fix_pi_iff}

The reflector also absorbs an input that has already been reflected:

{docstring Obsmetrologia.Order.Nucleus.absorb_join}

Its meet-critical-pair form is also proved in the abstract hierarchy:

{docstring Obsmetrologia.Order.Nucleus.absorb_join_meet}

The same algebra carries the dynamic residuation law:

{docstring Obsmetrologia.Order.Nucleus.galois_connection_meet}

{docstring Obsmetrologia.Order.Nucleus.galois_connection_stability}

Bottom-preserving nuclei also support a stable-envelope candidate. Lean proves
that this candidate lands in the joint fixed corner; it does not claim the
stronger greatest-stable-lower-bound property without extra structure:

{docstring Obsmetrologia.Order.Nucleus.jInterior}

{docstring Obsmetrologia.Order.CommutingNuclei.stableEnvelope_fix_pi}

Checked abstractly:

```lean
example (H : Order.HeytingAlgebra) (N : Order.Nucleus H) (a b : H.carrier) :
    N.j (H.join (N.j a) b) = N.j (H.join a b) :=
  N.absorb_join a b

example (H : Order.HeytingAlgebra) (N : Order.Nucleus H) (a b c : H.carrier) :
    N.j (H.join (H.meet (N.j a) (N.j b)) c)
      = N.j (H.join (H.meet a b) c) :=
  N.absorb_join_meet a b c

example (H : Order.HeytingAlgebra) (N : Order.Nucleus H) (a b c : H.carrier) :
    H.le (N.j (H.meet a b)) (N.j c)
      <-> H.le (N.j b) (H.himp (N.j a) (N.j c)) :=
  N.galois_connection_meet a b c

example (H : Order.HeytingAlgebra) (Q : Order.CommutingNuclei H)
    (h1bot : Q.j1.Fix H.bot) (h2bot : Q.j2.Fix H.bot) (a : H.carrier) :
    (Q.compNucleus).Fix (Q.stableEnvelope a) :=
  Q.stableEnvelope_fix_pi h1bot h2bot
```

## Nuclear Formula Syntax

The archive's fiber nuclear language had one dependency-free core worth
keeping: a propositional syntax with Heyting connectives and the two nuclear
modalities.

{docstring Obsmetrologia.Positing.NuclearFormula}

{docstring Obsmetrologia.Positing.NuclearFormula.interp}

{docstring Obsmetrologia.Positing.NuclearFormula.Step}

The numeric normalization measures are active, but canonical forms are still a
frontier until the critical-pair proof is completed:

{docstring Obsmetrologia.Positing.NuclearFormula.entanglement_R7}

{docstring Obsmetrologia.Positing.NuclearFormula.nuclearW_R3_decreases}

Checked:

```lean
example (V : Type) (M : NuclearFormula V) :
    NuclearFormula.entanglement (NuclearFormula.Transfer (NuclearFormula.Saturate M))
      < NuclearFormula.entanglement
          (NuclearFormula.Saturate (NuclearFormula.Transfer M)) :=
  NuclearFormula.entanglement_R7 M

example (V : Type) (M N : NuclearFormula V) :
    NuclearFormula.nuclearW
        (NuclearFormula.conj (NuclearFormula.Saturate M) (NuclearFormula.Saturate N))
      < NuclearFormula.nuclearW (NuclearFormula.Saturate (NuclearFormula.conj M N)) :=
  NuclearFormula.nuclearW_R3_decreases M N
```

Checked on the reading knowledge-Heyting algebra:

```lean
example (c1 c2 a : Reading) :
    (Reading.joinSquare c1 c2).pi a = a
      <-> ((Reading.joinSquare c1 c2).j1.j a = a
        ∧ (Reading.joinSquare c1 c2).j2.j a = a) :=
  (Reading.joinSquare c1 c2).fix_pi_iff a
```

This is why later "diamond" language is lawful only when a same-order nuclear
square has been produced. Without commuting nuclei, the four corners are only
resemblance.

## Variation Is Data

The tower is not one static square. A family of nuclear squares may vary across
fibers:

{name Obsmetrologia.SquareFamily}`SquareFamily`

{docstring Obsmetrologia.SquareFamily.Varies}

The library includes a concrete varying family on reading:

```lean
example :
    SquareFamily.Varies Reading.varyingFamily :=
  Reading.varyingFamily_varies
```

This matters for persistence. If the square never varies, later pages cannot
honestly use it to witness history separation, aperiodicity, or moduli.

## K4 Grading

The Klein-four carrier is the finite generated gauge object of the reading square:

{docstring Obsmetrologia.Positing.Gauge.K4}

Its two coordinates become the bigrading axes:

{docstring Obsmetrologia.Positing.BigradedTower.toFourCorner}

{docstring Obsmetrologia.Positing.BigradedTower.axes_independent}

Checked:

```lean
example (g : K4) :
    toFourCorner (ofFourCorner (toFourCorner g))
      = toFourCorner g := by
  rw [ofFourCorner_toFourCorner]
```

This is where the later phrase "bigraded" gets its grammar. It is not a label
placed on a cohomology group. It is the product of the knowledge gauge axis and
the truth/conflation axis.

## The Cross-Order Warning

The tower records the non-obvious discipline:

{docstring Obsmetrologia.Positing.BigradedTower.tower_bigrading_is_two_orders}

Checked:

```lean
example :
    (forall g : K4,
        toFourCorner g = (knowledgeBit g, truthBit g))
    ∧ (exists v : Valuation,
        Not (Positing.FiberAlgebra.fLeK v
          (fun phi => Reading.joinT Reading.kBot (v phi)))) :=
  tower_bigrading_is_two_orders
```

The second order is not silently installed as a co-nucleus in the same square.
Lean carries a counterexample: a truth-closure need not be knowledge-above the
valuation. The lawful repair is grading, not pretending the two orders are the
same kind of nucleus.

## D4 Completion

After order-swap exists, the Klein-four gauge extends to the eight-element
dihedral symmetry of the reading square:

{docstring Obsmetrologia.D4.D8}

The action is a real action by composition:

{docstring Obsmetrologia.D4.D8.act_mul}

Checked:

```lean
example (g h : D8) (a : Reading) :
    D8.act (D8.mul g h) a
      = D8.act g (D8.act h a) :=
  D8.act_mul g h a
```

D4 is therefore not imported group theory. It is the generated automorphism
projection of the four-valued positing square with the two orders kept visible.

## Reader Closure

To read later gauge, cohomology, or physics pages:

1. Start with reading, not a group.
2. Distinguish knowledge order from truth order.
3. Use `swap` to transport between orders.
4. Use same-order commuting nuclei for the diamond.
5. Use K4 as the grading of the tower.
6. Use D4 only after order-swap has made the full symmetry legal.

If a later page says "gauge" without this chain, it is using a projection before its
generating phase.
