import ObsmetrologiaManual.DocSetup
import Obsmetrologia.Calculus.Algebra

open Verso.Genre Manual InlineLean
open Obsmetrologia
open Obsmetrologia.Algebra

/-!
A teaching chapter for generated algebraic interfaces.
-/

#doc (Manual) "Generated algebraic interfaces" =>

# Generated Algebraic Interfaces

The calculus page says that algebra is a projection of generated order, residuation,
and gauge. This page teaches the carrier chain that makes that sentence lawful.
Algebra does not enter the manual as an ambient language for everything else. It
enters when a generated operation has enough laws to be named and transported.

The claim-site carried here is:

* claim-site: generated algebraic interfaces from magma through field and
  homomorphism interfaces;
* phase: closure/calculus, after order, fixed points, value, and constructive
  completion have generated lawful carriers;
* generating sites: binary operation, associativity, identity, left inverse,
  distributivity, additive inverse, commutativity, homomorphic preservation,
  bounded lattice operations, residuated fusion, Klein-four gauge action, and
  internal number carriers;
* downstream uses: finite gauge bridges, linear algebra, spectral witnesses,
  probability/stochastic carriers, internal reals, aperiodic algebraic
  persistence, and physical finite-field examples;
* Lean carriers: `Obsmetrologia.Calculus.Algebra.Magma`,
  `Obsmetrologia.Calculus.Algebra.Group`,
  `Obsmetrologia.Calculus.Algebra.Ring`,
  `Obsmetrologia.Calculus.Algebra.Hom`,
  `Obsmetrologia.Calculus.Algebra.Instances`,
  `Obsmetrologia.Calculus.Algebra.RingTactic`, and
  `Obsmetrologia.Calculus.Algebra.Interfaces`;
* Blueprint/proof-tree nodes: no single Blueprint node owns this page; it
  supplies the algebra carrier layer used by nodes such as `thm:k4-isgroup`,
  `thm:finite-gauge-group`, and the internal-real/calculus carriers;
* provenance: the large `Obsmetrologia.Calculus.Algebra` neighborhood was too
  compressed in the earlier calculus phase map;
* familiar comparison: magma, monoid, group, ring, field, homomorphism, and
  polynomial normalization;
* reader closure: ask which generated operation supplies the laws before using
  the familiar algebraic noun;
* frontier status: quotient algebra, ideals, modules over arbitrary rings,
  category of algebraic structures, Gröbner bases, and a full verified ring
  tactic are not supplied here.

The governing sentence is:

> Algebra is admitted as a law-carrying interface over generated operations,
> not as the pre-existing language of the library.

## From Operation To Identity

The first carrier is {name Obsmetrologia.Algebra.Magma}`Magma`: a carrier
with a binary operation.

Associativity promotes it to a semigroup:

{name Obsmetrologia.Algebra.Semigroup}`Semigroup`

An identity promotes it to a monoid:

{name Obsmetrologia.Algebra.Monoid}`Monoid`

The identity is unique:

{docstring Obsmetrologia.Algebra.Monoid.one_unique}

Checked:

```lean
example (M : Monoid) (e : M.carrier)
    (hl : forall a, M.op e a = a)
    (hr : forall a, M.op a e = a) :
    e = M.one :=
  M.one_unique e hl hr
```

This is the first repair point for algebraic language. A monoid word is lawful
only after an operation and its identity laws have been generated on a carrier.

## Inverses Are Derived

A group is a monoid with a left inverse operation:

{name Obsmetrologia.Algebra.Group}`Group`

The right inverse is not assumed; it is derived:

{docstring Obsmetrologia.Algebra.Group.mul_right_inv}

Checked:

```lean
example (G : Group) (a : G.carrier) :
    G.op a (G.inv a) = G.one :=
  G.mul_right_inv a
```

The two-sided inverse theorem packages the result:

{docstring Obsmetrologia.Algebra.Group.inv_two_sided}

Checked:

```lean
example (G : Group) (a : G.carrier) :
    G.op (G.inv a) a = G.one ∧
      G.op a (G.inv a) = G.one :=
  G.inv_two_sided a
```

The page may therefore say "inverse" as a proved consequence of the group
record, not as an additional primitive.

## Rings Carry Additive Group Structure

A semiring is a pair of operations with zero, one, and distributivity:

{name Obsmetrologia.Algebra.Semiring}`Semiring`

A ring adds negation:

{name Obsmetrologia.Algebra.Ring}`Ring`

Its additive part is an abelian group:

{docstring Obsmetrologia.Algebra.Ring.addAbelianGroup}

The right additive inverse is derived:

{docstring Obsmetrologia.Algebra.Ring.add_right_neg}

Checked:

```lean
example (R : Ring) (a : R.carrier) :
    R.add a (R.neg a) = R.zero :=
  R.add_right_neg a
```

Negatives multiply coherently:

{docstring Obsmetrologia.Algebra.Ring.neg_mul_neg}

Checked:

```lean
example (R : Ring) (a b : R.carrier) :
    R.mul (R.neg a) (R.neg b) = R.mul a b :=
  R.neg_mul_neg a b
```

Subtraction is generated from addition and negation:

{docstring Obsmetrologia.Algebra.Ring.sub}

{docstring Obsmetrologia.Algebra.Ring.sub_self}

Checked:

```lean
example (R : Ring) (a : R.carrier) :
    R.sub a a = R.zero :=
  R.sub_self a
```

The familiar ring rules are therefore lawful only through the bundled record.
No external algebraic simplifier is being assumed.

## Commutative Ring Arithmetic

A commutative ring adds multiplicative commutativity:

{name Obsmetrologia.Algebra.CommRing}`CommRing`

The binomial square identity is carried inside that record:

{docstring Obsmetrologia.Algebra.CommRing.sq_one_add}

Checked:

```lean
example (R : CommRing) (a : R.carrier) :
    R.mul (R.add R.one a) (R.add R.one a)
      = R.add (R.add (R.mul a a) (R.add a a)) R.one :=
  R.sq_one_add a
```

The scalar interface used by the small reflective normalizer begins here:

{docstring Obsmetrologia.Algebra.CommRing.ofNat}

{docstring Obsmetrologia.Algebra.CommRing.ofNat_add}

Checked:

```lean
example (R : CommRing) (m n : Nat) :
    R.ofNat (m + n) =
      R.add (R.ofNat m) (R.ofNat n) :=
  CommRing.ofNat_add R m n
```

This is the lawful extent of the current symbolic algebra layer. The
`RingTactic` module has a reflective polynomial normalizer, but the manual must
not treat it as a full computer-algebra system.

## Homomorphisms Preserve The Interface

A monoid homomorphism is:

{name Obsmetrologia.Algebra.Homomorphism}`Homomorphism`

Identity and composition are generated:

{docstring Obsmetrologia.Algebra.Homomorphism.id}

{docstring Obsmetrologia.Algebra.Homomorphism.comp}

The identity law is checked on maps:

{docstring Obsmetrologia.Algebra.Homomorphism.id_comp}

Checked:

```lean
example {M N : Monoid} (f : Homomorphism M N) :
    (Homomorphism.comp (Homomorphism.id N) f).map
      = f.map :=
  Homomorphism.id_comp f
```

This is not yet a category of algebraic structures. It is the preservation
interface needed by later pages that move generated operations across carriers.

## Generated Instances

The built-in integers are bundled as a commutative ring:

{docstring Obsmetrologia.Algebra.intCommRing}

Internal rationals form a field:

{docstring Obsmetrologia.Algebra.ratField}

Internal Bishop reals form a commutative ring:

{docstring Obsmetrologia.Algebra.rrealCommRing}

Checked:

```lean
example (a : Int) :
    intCommRing.sub a a = (0 : Int) :=
  Ring.sub_self intCommRing.toRing a
```

These are not new foundations. They are bundled interfaces for number carriers
that already appear in generated calculus and internal-real pages.

## Algebraic Projections From Order And Gauge

A bounded lattice gives meet and join monoids:

{docstring Obsmetrologia.Algebra.meetMonoid}

{docstring Obsmetrologia.Algebra.joinMonoid}

A residuated lattice gives a fusion monoid:

{docstring Obsmetrologia.Algebra.fuseMonoid}

The Klein-four gauge action gives an abelian group:

{docstring Obsmetrologia.Algebra.kleinFourGroup}

The right-inverse law specializes to the Klein-four:

{docstring Obsmetrologia.Algebra.kleinFour_right_inv}

Checked:

```lean
example (g : Positing.Gauge.K4) :
    Positing.Gauge.K4.mul g g =
      Positing.Gauge.K4.id :=
  kleinFour_right_inv g
```

The Boolean field is also generated as a finite projection:

{docstring Obsmetrologia.Algebra.boolField}

{docstring Obsmetrologia.Algebra.boolField_zero_unique}

Checked:

```lean
example (e : Bool)
    (hl : forall a, xor e a = a)
    (hr : forall a, xor a e = a) :
    e = false :=
  boolField_zero_unique e hl hr
```

The projection discipline is strict. The page may say that lattices, residuation,
gauge, integers, rationals, and internal reals instantiate algebraic interfaces.
It may not say that algebra is the substrate from which those phases were
generated.

## Repair Path

If a later page invokes an algebraic word, trace it through this chain:

1. name the generated carrier and operation;
2. name the law that promotes it to monoid, group, ring, field, or homomorphism;
3. say whether the carrier is an order, gauge, finite field, integer, rational,
   or internal-real interpretation;
4. keep quotient, module, ideal, and category claims frontier unless Lean has
   added the corresponding carrier.

This is how algebra stays a generated interface instead of becoming an
unexamined foundation.
