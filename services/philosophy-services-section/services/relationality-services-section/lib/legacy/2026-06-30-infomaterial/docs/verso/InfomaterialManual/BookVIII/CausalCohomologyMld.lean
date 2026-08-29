import InfomaterialManual.DocSetup
import Infomaterial.Relational.Spacetime.Causal.Cohomology
import Infomaterial.Relational.Spacetime.Causal.Cohomology.H2
import Infomaterial.Relational.Spacetime.Causal.Cohomology.N
import Infomaterial.Relational.Spacetime.Causal.Involutivity
import Infomaterial.Relational.Spacetime.Causal.Liouville
import Infomaterial.Relational.Spacetime.Causal.Net
import Infomaterial.Relational.Spacetime.Causal.MLDClassification
import Infomaterial.Relational.Spacetime.Causal.Cohomology.MLD

open Verso.Genre Manual InlineLean
open Infomaterial
open Infomaterial.Relational.Spacetime.Causal.Cohomology
open Infomaterial.Relational.Spacetime.Causal.Cohomology.H2
open Infomaterial.Relational.Spacetime.Causal.Cohomology.MLD
open Infomaterial.Relational.Spacetime.Causal.Cohomology.N
open Infomaterial.Relational.Spacetime.Causal.Cone
open Infomaterial.Relational.Spacetime.Causal.Involutivity
open Infomaterial.Relational.Spacetime.Causal.Liouville
open Infomaterial.Relational.Spacetime.Causal.MLDClassification
open Infomaterial.Relational.Spacetime.Causal.Net
open Infomaterial.Relational.Spacetime.Causal.Order
open Infomaterial.Relational.Spacetime.Dimension.Manifoldlikeness
open Infomaterial.Combinatorics

/-!
A teaching chapter for causal cohomology and its MLD claim-sites.
-/

#doc (Manual) "Causal cohomology and MLD" =>

# Causal Cohomology And MLD

The support chapter made codirections and wavefront support lawful. This chapter
adds the cohomological carrier that can remember an obstruction through those
directions.

The claim-site carried here is:

* claim-site: causal cochain complex, degree-two cohomology, all-degree
  cohomology, involutivity, exact Liouville form, causal nets, and MLD
  coboundary classification;
* phase: relational spacetime;
* generating sites: settled causal order, causal pairs, causal triples, causal
  quadruples, integer cochains, coboundary, wavefront support, factor-map
  pullback, spacelike region separation, and polarization;
* downstream uses: manifoldlikeness, continuum fingerprinting, discrete
  symplectic structures, plasma and fluid obstruction pages, quantum support
  descent, and frontier infohole diagnostics;
* Lean carriers: `Infomaterial.Relational.Spacetime.Causal.Cohomology`,
  `Infomaterial.Relational.Spacetime.Causal.Cohomology.H2`,
  `Infomaterial.Relational.Spacetime.Causal.Cohomology.N`,
  `Infomaterial.Relational.Spacetime.Causal.Involutivity`,
  `Infomaterial.Relational.Spacetime.Causal.Liouville`,
  `Infomaterial.Relational.Spacetime.Causal.Net`,
  `Infomaterial.Relational.Spacetime.Causal.MLDClassification`, and
  `Infomaterial.Relational.Spacetime.Causal.Cohomology.MLD`;
* Blueprint/proof-tree nodes: `thm:causal-cochain-complex`,
  `thm:causal-cohomology-h2`, `thm:causal-cohomology-n`,
  `thm:causal-involutivity`, `thm:cotangent-symplectic-flow`,
  `thm:causal-net`, `thm:causal-mld-classification`, and
  `thm:cohomological-mld-groupoid`;
* provenance: the causal-spacetime Blueprint separates support/symplectic
  projections from cohomology-and-MLD, so the manual must teach the same phase
  boundary;
* familiar comparison: order-complex cohomology, Cech-style obstruction,
  coisotropic microsupport, exact cotangent symplectic form, AQFT net
  locality, and mutual local derivability;
* reader closure: distinguish a cochain-class relation from a carrier-level MLD
  completeness theorem;
* frontier status: there is no smooth de Rham complex, operator-algebraic AQFT
  net, Hamiltonian flow theorem, or proof that equal causal `H1` classes force
  a carrier-level MLD. Those need additional carriers and comparison theorems.

The governing sentence is:

> The causal order becomes cohomological when its comparable chains carry
> integer cochains and the coboundary squares to zero.

## Degree One

A causal one-simplex is a comparable pair:

{docstring Infomaterial.Relational.Spacetime.Causal.Cohomology.OneSimplex}

A causal two-simplex is a composable chain:

{docstring Infomaterial.Relational.Spacetime.Causal.Cohomology.TwoSimplex}

Degree-zero and degree-one cochains are:

{docstring Infomaterial.Relational.Spacetime.Causal.Cohomology.C0}

{docstring Infomaterial.Relational.Spacetime.Causal.Cohomology.C1}

The first coboundaries are:

{docstring Infomaterial.Relational.Spacetime.Causal.Cohomology.delta0}

{docstring Infomaterial.Relational.Spacetime.Causal.Cohomology.delta1}

The first cochain identity is:

{docstring Infomaterial.Relational.Spacetime.Causal.Cohomology.delta1_delta0}

Checked:

```lean
example {E : Type} (C : CausalSet E) (f : C0 C) :
    delta1 C (delta0 C f) = fun _ => 0 :=
  delta1_delta0 C f
```

This is the first lawful `H1` sentence. It is not imported from topology. The
causal order itself has generated the nerve on which the coboundary can act.

Closed and exact one-cochains are:

{docstring Infomaterial.Relational.Spacetime.Causal.Cohomology.Cocycle}

{docstring Infomaterial.Relational.Spacetime.Causal.Cohomology.Coboundary}

Every coboundary is a cocycle:

{docstring Infomaterial.Relational.Spacetime.Causal.Cohomology.coboundary_cocycle}

Checked:

```lean
example {E : Type} (C : CausalSet E) (phi : C1 C)
    (h : Coboundary C phi) :
    Cocycle C phi :=
  coboundary_cocycle C h
```

The wavefront is the support of a one-cochain:

{docstring Infomaterial.Relational.Spacetime.Causal.Cohomology.Wavefront}

Empty wavefront forces the trivial class:

{docstring Infomaterial.Relational.Spacetime.Causal.Cohomology.wavefront_empty_coboundary}

Checked:

```lean
example {E : Type} (C : CausalSet E) (phi : C1 C)
    (h : ∀ e, ¬ Wavefront C phi e) :
    Coboundary C phi :=
  wavefront_empty_coboundary C h
```

The bundled degree-one theorem is:

{docstring Infomaterial.Relational.Spacetime.Causal.Cohomology.causal_cochain_complex}

This is where `cl-inv` may be read as a causal obstruction: a nontrivial class
cannot be erased without changing the coboundary site.

## Degree Two

A causal three-simplex is a four-event composable chain:

{docstring Infomaterial.Relational.Spacetime.Causal.Cohomology.H2.ThreeSimplex}

The next coboundary is:

{docstring Infomaterial.Relational.Spacetime.Causal.Cohomology.H2.delta2}

and it satisfies the next cochain identity:

{docstring Infomaterial.Relational.Spacetime.Causal.Cohomology.H2.delta2_delta1}

Checked:

```lean
example {E : Type} (C : CausalSet E) (phi : C1 C) :
    delta2 C (delta1 C phi) = fun _ => 0 :=
  H2.delta2_delta1 C phi
```

Closed and exact two-cochains are:

{docstring Infomaterial.Relational.Spacetime.Causal.Cohomology.H2.Cocycle2}

{docstring Infomaterial.Relational.Spacetime.Causal.Cohomology.H2.Coboundary2}

Exact two-cochains are closed:

{docstring Infomaterial.Relational.Spacetime.Causal.Cohomology.H2.coboundary2_cocycle2}

Checked:

```lean
example {E : Type} (C : CausalSet E) (psi : C2 C)
    (h : Coboundary2 C psi) :
    Cocycle2 C psi :=
  H2.coboundary2_cocycle2 C h
```

This is the lawful home for degree-two obstruction language. The familiar
symplectic word can appear only after this carrier exists.

The bundled degree-two theorem is:

{docstring Infomaterial.Relational.Spacetime.Causal.Cohomology.H2.causal_cohomology_h2}

## All Degrees

The all-degree cochain carrier is:

{docstring Infomaterial.Relational.Spacetime.Causal.Cohomology.N.Cochain}

The all-degree coboundary is:

{docstring Infomaterial.Relational.Spacetime.Causal.Cohomology.N.delta}

The recursion law is:

{docstring Infomaterial.Relational.Spacetime.Causal.Cohomology.N.delta_cons}

and the central identity is:

{docstring Infomaterial.Relational.Spacetime.Causal.Cohomology.N.delta_delta}

Checked:

```lean
example {E : Type} (phi : Cochain E) (sigma : List E) :
    N.delta (N.delta phi) sigma = 0 :=
  N.delta_delta phi sigma
```

The bundled all-degree theorem is:

{docstring Infomaterial.Relational.Spacetime.Causal.Cohomology.N.causal_cohomology_n}

This page does not claim a smooth cohomology theory. It claims the finite causal
order supports a graded coboundary complex with `delta` squared zero.

## Involutivity

Bicharacteristic composability is defined on causal one-simplices:

{docstring Infomaterial.Relational.Spacetime.Causal.Involutivity.Bichar}

The legs of a two-simplex compose:

{docstring Infomaterial.Relational.Spacetime.Causal.Involutivity.edges_composable}

A cocycle is additive along that composition:

{docstring Infomaterial.Relational.Spacetime.Causal.Involutivity.cocycle_additive}

Checked:

```lean
example {E : Type} (C : CausalSet E) (phi : C1 C)
    (hphi : Cocycle C phi) (t : TwoSimplex C) :
    phi (edge02 C t)
      = phi (edge01 C t) + phi (edge12 C t) :=
  cocycle_additive C hphi t
```

The wavefront decomposition law is:

{docstring Infomaterial.Relational.Spacetime.Causal.Involutivity.wavefront_involutive}

The bundled theorem is:

{docstring Infomaterial.Relational.Spacetime.Causal.Involutivity.causal_involutivity}

This is the propagation content of involutivity. It is not a Hamiltonian-flow
theorem; it is the consequence of `delta1 phi = 0` on causal triangles.

## Exact Liouville Form

The Liouville form on codirections is:

{docstring Infomaterial.Relational.Spacetime.Causal.Liouville.liouvilleCodir}

On the order complex it is:

{docstring Infomaterial.Relational.Spacetime.Causal.Liouville.liouville}

The two-form is exact by definition:

{docstring Infomaterial.Relational.Spacetime.Causal.Liouville.omega}

Exactness gives closedness:

{docstring Infomaterial.Relational.Spacetime.Causal.Liouville.omega_closed}

Checked:

```lean
example {E : Type} (C : CausalSet E) (lam : C1 C) :
    H2.Cocycle2 C (omega C lam) :=
  omega_closed C lam
```

For the position Liouville form, the two-form vanishes:

{docstring Infomaterial.Relational.Spacetime.Causal.Liouville.omega_liouville_zero}

Checked:

```lean
example {E : Type} (C : CausalSet E) (c : C0 C) :
    omega C (liouville C c) = fun _ => 0 :=
  omega_liouville_zero C c
```

Nondegeneracy is the polarization/proper-coloring carrier:

{docstring Infomaterial.Relational.Spacetime.Causal.Liouville.liouville_nondegenerate_iff_proper}

The bundled theorem is:

{docstring Infomaterial.Relational.Spacetime.Causal.Liouville.causal_liouville}

This is why the Blueprint node named for cotangent symplectic flow is green only
as an exact Liouville reframe. The page does not assert a nontrivial smooth
symplectic cohomology class.

## Causal Nets

A region is a predicate on events:

{docstring Infomaterial.Relational.Spacetime.Causal.Net.Region}

Region inclusion is:

{docstring Infomaterial.Relational.Spacetime.Causal.Net.RegionLe}

Spacelike separation of regions is pairwise causal incomparability:

{docstring Infomaterial.Relational.Spacetime.Causal.Net.SpacelikeRegions}

It is symmetric:

{docstring Infomaterial.Relational.Spacetime.Causal.Net.spacelikeRegions_symm}

Checked:

```lean
example {E : Type} (C : CausalSet E)
    (U V : Region E)
    (h : SpacelikeRegions C U V) :
    SpacelikeRegions C V U :=
  spacelikeRegions_symm C h
```

An independent net is the carrier that can later receive algebraic local data:

{docstring Infomaterial.Relational.Spacetime.Causal.Net.IndependentNet}

The bundled theorem is:

{docstring Infomaterial.Relational.Spacetime.Causal.Net.causal_net_region_theory}

The AQFT criterion is honest only here: spacelike separation generates an
independence relation once a net carrier is supplied. Operator commutation is
not present.

## MLD Classification

The causal class relation is:

{docstring Infomaterial.Relational.Spacetime.Causal.MLDClassification.SameClass}

It is an equivalence relation:

{docstring Infomaterial.Relational.Spacetime.Causal.MLDClassification.sameClass_refl}

{docstring Infomaterial.Relational.Spacetime.Causal.MLDClassification.sameClass_symm}

{docstring Infomaterial.Relational.Spacetime.Causal.MLDClassification.sameClass_trans}

Factor-map pullback preserves the class:

{docstring Infomaterial.Relational.Spacetime.Causal.MLDClassification.pullback_sameClass}

Checked:

```lean
example {E E' : Type} (f : E' -> E)
    (phi psi : Cochain E)
    (h : SameClass phi psi) :
    SameClass (pullback f phi) (pullback f psi) :=
  pullback_sameClass f h
```

The flat collapse is the proper-coloring obstruction:

{docstring Infomaterial.Relational.Spacetime.Causal.MLDClassification.flat_clinv_collapse}

The bundled theorem is:

{docstring Infomaterial.Relational.Spacetime.Causal.MLDClassification.causal_mld_classification}

This is the invariant side of MLD. The converse, equal class forcing a
carrier-level MLD, is not proved by this page.

## Cohomological MLD Groupoid

All-degree geometric MLD is the coboundary-difference relation:

{docstring Infomaterial.Relational.Spacetime.Causal.Cohomology.MLD.Mld}

It is reflexive, symmetric, and transitive:

{docstring Infomaterial.Relational.Spacetime.Causal.Cohomology.MLD.mld_refl}

{docstring Infomaterial.Relational.Spacetime.Causal.Cohomology.MLD.mld_symm}

{docstring Infomaterial.Relational.Spacetime.Causal.Cohomology.MLD.mld_trans}

Checked:

```lean
example {E : Type} (phi psi : Cochain E)
    (h : MLD.Mld phi psi) :
    MLD.Mld psi phi :=
  MLD.mld_symm h
```

The bundled theorem is:

{docstring Infomaterial.Relational.Spacetime.Causal.Cohomology.MLD.cohomological_mld_groupoid}

The reader closure is to keep the quotient relation and the structural
derivability theorem distinct. This page supplies the cohomological groupoid of
representatives. It does not collapse that groupoid into a theorem about all
spacetime carriers.

## Repair Path

If a later page says "topology," ask whether it cites `causal_cohomology_n` or
the manifoldlikeness page. If it says "symplectic," ask whether it passes
through `causal_liouville` and polarization. If it says "AQFT," ask where the
local algebra carrier is. If it says "MLD," ask whether it means the coboundary
groupoid on cochains or the stronger carrier-level completeness theorem.

Only the former claims are settled here. The latter claims remain frontier until
their missing carriers are built and connected by comparison theorems.
