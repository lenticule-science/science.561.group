import ObsmetrologiaManual.DocSetup
import Obsmetrologia.Language.Predicating.Fibration
import Obsmetrologia.Language.Predicating.HyperdoctrineDual

open Verso.Genre Manual InlineLean
open Obsmetrologia

/-!
A teaching chapter for predication fibration, finite adjoints, and equality as
generated language-phase structure.
-/

#doc (Manual) "Predication adjoints and equality" =>

# Predication Adjoints And Equality

Predication generates oriented predication cells. Positing gives those generated
positions values.
Only then can the manual speak lawfully about reindexing, finite quantifiers,
hyperdoctrine adjoints, and equality. These are not ambient foundations imported
from outside the library. They are generated language-phase structure.

The claim-site carried here is:

* claim-site: predication fibration, finite quantifier adjoints, and derived
  equality;
* phase: language, after predication cells and charge-valued valuations;
* generating sites: `PredicationCell`, cellwise reindexing, `Valuation`,
  knowledge and truth orders, finite fibers, and order-swap transport;
* downstream uses: equality pages, valuation fibers, sheaf restriction,
  bigraded cohomology, comparison-atlas entries for category theory and logic, and
  any later claim using "for all", "there exists", or equality;
* Lean carriers: `Obsmetrologia.Language.Predicating.Fibration`,
  `Obsmetrologia.Language.Predicating.Quantifying`,
  `Obsmetrologia.Language.Predicating.Hyperdoctrine`,
  `Obsmetrologia.Language.Predicating.HyperdoctrineDual`, and
  `Obsmetrologia.Language.Predicating.Equality`;
* Blueprint/proof-tree nodes: no dedicated Blueprint node yet for the whole
  adjoint/equality surface; primitive provenance remains the mark and
  articulation proof tree, while the Lean declarations below settle the local
  laws;
* provenance: predication-hyperdoctrine, dual-predication-hyperdoctrine, and
  equality-as-diagonal notes;
* familiar comparison: Grothendieck fibration, Lawvere hyperdoctrine, Galois
  adjunction, Beck-Chevalley, Frobenius reciprocity, and diagonal equality;
* reader closure: read quantifiers as finite fiber joins/meets over generated
  predication sites, not as primitive logical binders;
* frontier status: the page proves the finite and cellwise carriers. Infinite
  fibers, dependent type theory, general categorical semantics, and full
  higher-categorical pseudo-fibration structure remain frontier unless their
  carriers are built.

The governing sentence is:

> Equality is a diagonal image after finite predication fibers exist.

## Reindexing Is The Fibration

The predication fibration has one uniform value fiber: valuations over
predication cells. Its cleavage is reindexing by precomposition. The four
predicating generators act on the base, and valuations follow them.

{docstring Obsmetrologia.Fibration.generator_converse}

{docstring Obsmetrologia.Fibration.reindex_is_bilattice_homomorphism}

Checked:

```lean
example (v : Valuation) :
    Valuation.reindex PredicationCell.converse v
      = fun phi => v (PredicationCell.converse phi) :=
  Fibration.generator_converse v

example (r : PredicationCell -> PredicationCell) :
    Fibration.IsBilatticeHom r :=
  Fibration.reindex_is_bilattice_homomorphism r
```

This is the first lawful categorical projection in the language phase. A base map
does not change the kind of value. It changes which predication cell a valuation
is read at.

## Finite Quantifier Adjoints

Finite quantification is generated from finite fibers:

{name Obsmetrologia.Valuation.FiniteFibration}`FiniteFibration`

The existential is the knowledge-join over a finite preimage; the universal is
the knowledge-meet over that same finite preimage:

{docstring Obsmetrologia.Valuation.existsF}

{docstring Obsmetrologia.Valuation.forallF}

The adjunctions are the claim-site:

{docstring Obsmetrologia.Valuation.existsF_adjunction}

{docstring Obsmetrologia.Valuation.forallF_adjunction}

Checked:

```lean
example (F : Valuation.FiniteFibration)
    (v w : Valuation) :
    Valuation.leK (Valuation.existsF F v) w
      <->
    Valuation.leK v (Valuation.reindex F.base w) :=
  Valuation.existsF_adjunction F v w

example (F : Valuation.FiniteFibration)
    (v w : Valuation) :
    Valuation.leK (Valuation.reindex F.base v) w
      <->
    Valuation.leK v (Valuation.forallF F w) :=
  Valuation.forallF_adjunction F v w
```

This is why ordinary logical notation is not a primitive. In this library,
quantifiers are finite fiber operations over generated predication cells.

## Truth-Order Transport

The dual hyperdoctrine is not a second postulate. It is the sigma-transport of
the knowledge-order system into the truth order:

{docstring Obsmetrologia.Valuation.dual_adjoint_system}

Checked:

```lean
example (F : Valuation.FiniteFibration) :
    (Valuation.GaloisT (Valuation.existsT F)
      (Valuation.reindex F.base)
      ∧ Valuation.GaloisT (Valuation.reindex F.base)
        (Valuation.forallT F))
    ∧ (Valuation.existsT F
        = Valuation.conj (Valuation.existsF F)
      ∧ Valuation.forallT F
        = Valuation.conj (Valuation.forallF F)
      ∧ Valuation.reindex F.base
        = Valuation.conj (Valuation.reindex F.base)) :=
  Valuation.dual_adjoint_system F
```

The reader should see the discipline: the second order does not license a second
unrelated logic. It is transported through the order-swap already generated by
charge.

## Equality Is Derived

Equality enters only after the diagonal has a finite fiber image in the two
orders:

{docstring Obsmetrologia.classicalEq}

{docstring Obsmetrologia.paraconsistentEq}

Reflexivity is checked at the respective tops:

```lean
example (s : Entity) :
    classicalEq s s = Charge.tTop :=
  classicalEq_refl s

example (s : Entity) :
    paraconsistentEq s s = Charge.kTop :=
  paraconsistentEq_refl s
```

The two equality predicates are not two primitives. They are one diagonal read
through the two adjoint systems:

{docstring Obsmetrologia.classicalEq_eq_swap_paraconsistentEq}

{docstring Obsmetrologia.two_equalities_one_diagonal}

Checked:

```lean
example (s o : Entity) :
    classicalEq s o
      = Charge.swap (paraconsistentEq s o) :=
  classicalEq_eq_swap_paraconsistentEq s o

example (s o : Entity) :
    (classicalEq s o
      = Charge.swap (paraconsistentEq s o))
    ∧ (classicalEq s s = Charge.tTop
      ∧ paraconsistentEq s s = Charge.kTop)
    ∧ (classicalEq s o =
      if s = o then Charge.tTop else Charge.tBot)
    ∧ (paraconsistentEq s o =
      if s = o then Charge.kTop else Charge.kBot) :=
  two_equalities_one_diagonal s o
```

The familiar comparison is Lawvere equality. The generated claim is sharper: one
diagonal, two orders, two equality readings, neither admitted as free data.

## Reader Closure

When later pages use category, quantifier, equality, logic, or hyperdoctrine
language, check the route:

1. a predication cell gives the base;
2. a valuation gives the fiber;
3. reindexing gives the fibration;
4. finite fibers give existential and universal adjoints;
5. sigma transports the knowledge system to the truth system;
6. equality is the diagonal pushed through those adjoints.

If a later theorem skips this route, it is using familiar logic as a projection
before its generating phase.
