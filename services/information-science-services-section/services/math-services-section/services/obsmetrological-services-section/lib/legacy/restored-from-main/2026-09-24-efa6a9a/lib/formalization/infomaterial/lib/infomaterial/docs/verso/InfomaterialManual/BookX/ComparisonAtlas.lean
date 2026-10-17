import InfomaterialManual.DocSetup
import Infomaterial.Language.Predicating.Equality
import Infomaterial.Language.Predicating.YonedaArrowsFirst
import Infomaterial.Language.Positing.FiberAlgebra
import Infomaterial.Site.DFrame
import Infomaterial.Site.Sheaf
import Infomaterial.Dynamics.Flow.CurvatureRegime
import Infomaterial.Relational.Spacetime.Causal.Order
import Infomaterial.Persistence.Aperiodic.Witness.JeandelRaoSubstitutionTower
import Infomaterial.Relational.Plasma.ReconnectionCurvature
import Infomaterial.Relational.Quantum.HardyModel
import Infomaterial.Relational.Reaction.SupportProjection

open Verso.Genre Manual InlineLean
open Infomaterial
open Infomaterial.Flow.CurvatureRegime
open Infomaterial.Persistence.Aperiodic
open Infomaterial.Persistence.Aperiodic.Witness
open Infomaterial.Positing.FiberAlgebra
open Infomaterial.Relational.Plasma
open Infomaterial.Relational.Quantum
open Infomaterial.Relational.Reaction
open Infomaterial.Relational.Spacetime.Causal.Order
open Infomaterial.Yoneda

/-!
A lookup chapter for familiar mathematical comparisons and their Infomaterial phase homes.
-/

#doc (Manual) "Comparison atlas" =>

# Comparison Atlas

The atlas is a lookup surface, not the organizing law of the book. It exists for
the reader who arrives with an old subject name and asks where that name becomes
lawful inside Infomaterial.

The claim-site carried here is:

* claim-site: familiar mathematics as phase-local comparison;
* phase: atlas over the phase volumes;
* generating sites: predication, positing, settling, gluing, persistence,
  spacetime settling, physical phase witnesses;
* Lean carriers: the declarations named in each entry below;
* familiar comparisons: category theory, equality, quantification, order, closure,
  fiber algebra, sheaf cohomology, aperiodic topology, spacetime geometry, and
  physical theories;
* danger: letting ordinary subject classification become the hidden table of
  contents.

The governing sentence is:

> A projection is searchable here only after the phase that generates it has been
> named.

The atlas should be read backwards from a familiar word to a generated phase.
It should not be used forwards to make the familiar word sovereign.

## Category Theory

Lookup phrase: category, presheaf, Yoneda, object, morphism.

Infomaterial phase: language, after predication has produced oriented claim-sites.

Filing rule: category theory is not the ambient foundation. It is the
arrows-first projection of generated predication and valuation structure.

The generic carrier is a small category:

{docstring Infomaterial.Yoneda.SmallCat}

Presheaves and natural transformations are:

{docstring Infomaterial.Yoneda.Presheaf}

{docstring Infomaterial.Yoneda.Nat}

The representable presheaf and Yoneda lemma are:

{docstring Infomaterial.Yoneda.repr}

{docstring Infomaterial.Yoneda.yoneda_lemma}

The arrows-first theorem is:

{docstring Infomaterial.Yoneda.object_is_its_morphisms}

The concrete knowledge-presheaf category is:

{docstring Infomaterial.Yoneda.KnowledgePresheafCat}

{docstring Infomaterial.Yoneda.kp_object_is_its_arrows}

Checked:

```lean
example (C : SmallCat) (X : C.Obj) (P : Presheaf C) :
    Bijection (Infomaterial.Yoneda.Nat (repr C X) P)
      (P.obj X) :=
  yoneda_lemma C X P

example {a b : Charge}
    (e : KnowledgePresheafCat.Iso a b) :
    a = b :=
  kp_iso_is_eq e
```

Repair path: if a page says "category" before it can name its generated base
and arrows, send the reader back to Book III.

## Equality And Quantification

Lookup phrase: equality, diagonal, existential, universal, hyperdoctrine.

Infomaterial phase: language, after predication and valuation have produced fibers
over cells.

Filing rule: equality is derived from adjoint image along a diagonal. It is not
primitive.

The finite-fibration carrier for quantification is named
`Infomaterial.Valuation.FiniteFibration`: a base map plus finite preimage lists. The
atlas records the carrier by name here because the structure fields are not yet
documented enough for a stable rendered docstring.

The knowledge-order adjunctions are:

{docstring Infomaterial.Valuation.existsF_adjunction}

{docstring Infomaterial.Valuation.forallF_adjunction}

Truth-order adjunctions exist in parallel:

{docstring Infomaterial.Valuation.existsT_adjunction}

{docstring Infomaterial.Valuation.forallT_adjunction}

The diagonal and the two equality readings are:

{docstring Infomaterial.diagFiber}

{docstring Infomaterial.classicalEq}

{docstring Infomaterial.paraconsistentEq}

{docstring Infomaterial.classicalEq_eq}

{docstring Infomaterial.paraconsistentEq_eq}

Checked:

```lean
example (s : Entity) :
    classicalEq s s = Charge.tTop :=
  classicalEq_refl s

example (s : Entity) :
    paraconsistentEq s s = Charge.kTop :=
  paraconsistentEq_refl s
```

Repair path: if equality is being used as the floor, the page is too early. Ask
which adjoint system generated it.

## Order And Closure

Lookup phrase: order theory, lattice, closure operator, fixed point,
Knaster-Tarski.

Infomaterial phase: closure, after posited charges can settle.

Filing rule: order is generated by settling. A closure operator is not an
imported topic; it is the law of stabilization in the knowledge order.

The generated knowledge order is:

{docstring Infomaterial.Charge.KLE}

and its structural laws include:

{docstring Infomaterial.Charge.kle_refl}

{docstring Infomaterial.Charge.kle_trans}

{docstring Infomaterial.Charge.kle_antisymm}

The closure carrier is named `Infomaterial.Charge.Closure`: an operator on charges
with inflationary, monotone, and idempotent laws. The field-level documentation
is not yet atlas-stable, so this entry points to theorems over the carrier.

with fixedness and leastness:

{docstring Infomaterial.Charge.Closure.op_fixed}

{docstring Infomaterial.Charge.Closure.op_least}

Settling is:

{docstring Infomaterial.Charge.settle}

{docstring Infomaterial.Charge.settle_fixed}

{docstring Infomaterial.Charge.settle_kBot}

Checked:

```lean
example (c : Charge.Closure) (a : Charge) :
    c.op (c.op a) = c.op a :=
  Charge.Closure.op_fixed c a

example (k : Charge) :
    Charge.settle (Charge.joinClosure k)
      Charge.kBot = k :=
  Charge.settle_kBot k
```

Repair path: if order appears as an external ordering of an already-made
universe, ask where settling generated it.

## Closure Regimes And Curvature

Lookup phrase: Scott-continuity, strict regime, transfinite-bounded regime,
aperiodic regime, curvature.

Infomaterial phase: closure regimes.

Filing rule: Scott-continuity is a regime condition. Curvature is the failure of
closure to commute with the limit it was expected to preserve.

The regime classifier has four named regimes: strict, Scott,
transfinite-bounded, and aperiodic.

{docstring Infomaterial.ClosureRegimeData}

{docstring Infomaterial.classify}

The four-regime dichotomy is:

{docstring Infomaterial.four_regime_dichotomy}

The flat/curved split is:

{docstring Infomaterial.Flow.CurvatureRegime.IsFlat}

{docstring Infomaterial.Flow.CurvatureRegime.IsCurved}

{docstring Infomaterial.Flow.CurvatureRegime.flat_iff_not_curved}

{docstring Infomaterial.Flow.CurvatureRegime.nonvanishes_iff_curved}

Checked:

```lean
example (r : ClosureRegime) :
    IsFlat r <-> Not (IsCurved r) :=
  flat_iff_not_curved r

example (r : ClosureRegime) :
    cohomologyVanishes r = false <-> IsCurved r :=
  nonvanishes_iff_curved r
```

Repair path: if a page says "Scott-continuity" as generic domain theory, move it
to the closure-regime chapter and ask which regime data classify it.

## Fiber Algebra

Lookup phrase: fiber algebra, Heyting algebra, nucleus, nuclear quartet.

Infomaterial phase: language-to-closure interface, over valuation fibers.

Filing rule: algebra is phase-local. The valuation fiber exists only after
predication supplies cells and positing supplies charges.

The fiber order and Heyting carrier are:

{docstring Infomaterial.Positing.FiberAlgebra.fLeT}

{docstring Infomaterial.Positing.FiberAlgebra.FiberHeyting}

{docstring Infomaterial.Positing.FiberAlgebra.fiberHeyting}

The two nuclei and their commuting law are:

{docstring Infomaterial.Positing.FiberAlgebra.sigma}

{docstring Infomaterial.Positing.FiberAlgebra.delta}

{docstring Infomaterial.Positing.FiberAlgebra.sigma_delta_comm}

The quartet carrier is:

{docstring Infomaterial.Positing.FiberAlgebra.fiber_truth_nuclear_quartet}

and the cross-order warning is:

{docstring Infomaterial.Positing.FiberAlgebra.cross_order_not_knowledge_nucleus}

Checked:

```lean
example :
    FiberHeyting Valuation :=
  fiberHeyting

example (v : Valuation) :
    sigma (delta v) = delta (sigma v) :=
  sigma_delta_comm v
```

Repair path: if a fiber algebra page cannot answer "fiber over which base?" it
belongs before Book VI only as a note, not as a stable book page.

## Sheaf Cohomology

Lookup phrase: sheaf, section, gluing, cover, H1, obstruction.

Infomaterial phase: fibered and cohomological matter.

Filing rule: sheaf language measures whether local settled sections glue. It is
not generic topology pasted over the system.

The settling sheaf is named `Infomaterial.Sheaf`: a global section assigning a charge
to each predication cell. The structure field itself is intentionally not used
as an atlas docstring until field-level docs are stable.

with designation:

{docstring Infomaterial.Sheaf.designated}

Gluing by knowledge-join is:

{docstring Infomaterial.Valuation.section_lub}

Order-independent merge is the finite-regime H1-zero criterion:

{docstring Infomaterial.Charge.joinList_congr}

The cover carrier is named `Infomaterial.Sheaf.Cover`: a finite list of patches whose
union covers every predication cell.

{docstring Infomaterial.Sheaf.separated}

Checked:

```lean
example (v w u : Valuation)
    (hv : Infomaterial.Valuation.leK v u)
    (hw : Infomaterial.Valuation.leK w u) :
    Infomaterial.Valuation.leK
      (Infomaterial.Valuation.joinK v w) u :=
  Infomaterial.Valuation.section_lub v w u hv hw
```

Repair path: if "cohomology" is used only as a prestige word, ask what local data
fail to glue and which declaration states the obstruction.

## D-Frame Shadow

Lookup phrase: d-frame, bitopology, shadow, consistency, totality.

Infomaterial phase: d-frame-valued settling, after the positive and negative
frames have been equipped with consistency and totality relations.

Filing rule: the word "shadow" is reserved for the formal forgetful image of a
d-frame. It keeps the two frame components and forgets exactly `con` and `tot`.
A reduced model, analogy, projection, support, comparison, or specialization is
not a shadow unless it is packaged by this carrier.

The carrier is:

{docstring Infomaterial.DFrame.Shadow}

The object-level operation is:

{docstring Infomaterial.DFrame.shadow}

The section-level comparison for the d-frame-valued settling sheaf is:

{docstring Infomaterial.DFrame.dframe_valued_sheaf_shadow_comparison}

Checked:

```lean
example (L : Infomaterial.DFrame.DFrame) :
    (Infomaterial.DFrame.shadow L).Lplus = L.Lplus :=
  Infomaterial.DFrame.shadow_Lplus L
```

Repair path: if a page says "shadow", ask which d-frame is being shadowed and
where the proof that the retained pair is exactly `(L₊, L₋)` lives.

## Aperiodic Topology

Lookup phrase: aperiodic tiling, Anderson-Putnam, hull, substitution,
direct-limit class.

Infomaterial phase: aperiodic and persistent matter.

Filing rule: local finite cohomology is not the same as persistence. Persistence
requires survival through the tower or colimit.

The finite witness carrier is:

{docstring Infomaterial.Persistence.Aperiodic.Witness.OneVertexComplex}

with nonzero finite classes:

{docstring Infomaterial.Persistence.Aperiodic.Witness.jeandelRaoMarker01_nonzero_h1_class}

{docstring Infomaterial.Persistence.Aperiodic.Witness.markerRing_b3_nonzero_h1_class}

The substitution tower witness is:

{docstring Infomaterial.Persistence.Aperiodic.Witness.jr_substitution_tower}

Checked:

```lean
example :
    markerRingComplex.NonzeroH1Class b3 :=
  markerRing_b3_nonzero_h1_class

example :
    NonzeroInDirectLimit b3 :=
  b3_nonzero_in_direct_limit
```

Repair path: if a page turns a finite witness into a full aperiodicity theorem,
mark the missing persistence bridge explicitly.

## Spacetime Geometry

Lookup phrase: causal set, Lorentzian geometry, light cone, causal order,
spacetime.

Infomaterial phase: relational spacetime.

Filing rule: spacetime geometry is recovered from causal settling and incidence.
The continuum is a frontier, not the floor.

The causal carrier is:

{docstring Infomaterial.Relational.Spacetime.Causal.Order.CausalSet}

The closure step is:

{docstring Infomaterial.Relational.Spacetime.Causal.Order.CausalSet.causalStep}

The central settling theorem is:

{docstring Infomaterial.Relational.Spacetime.Causal.Order.CausalSet.causal_settling_is_transitive_closure}

Checked:

```lean
example {E : Type} (C : CausalSet E) :
    (forall a b, C.prec0 a b = true ->
      CausalSet.reaches C a b)
      /\
    (forall a b c,
      CausalSet.reaches C a b ->
      CausalSet.reaches C b c ->
      CausalSet.reaches C a c) :=
  ⟨(CausalSet.causal_settling_is_transitive_closure C).1,
   (CausalSet.causal_settling_is_transitive_closure C).2.1⟩
```

Repair path: if a spacetime page starts from a manifold, ask which finite causal
settling and which reconstruction theorem justify that continuum reading.

## Physical Theories

Lookup phrase: plasma, reaction network, quantum contextuality, physical model.

Infomaterial phase: relational physical phases.

Filing rule: a physical theory is admitted when it witnesses a generated
relational behavior. It is not a primitive ontology.

Plasma reconnection is a non-Scott event:

{docstring Infomaterial.Relational.Plasma.ReconnectionEvent}

{docstring Infomaterial.Relational.Plasma.canonicalReconnection_is_event}

Reaction networks have a Datalog support projection:

{docstring Infomaterial.Relational.Reaction.support_fire_le_datalog}

{docstring Infomaterial.Relational.Reaction.consumption_is_the_gap}

Quantum contextuality is gluing failure:

{docstring Infomaterial.Relational.Quantum.StronglyContextual}

{docstring Infomaterial.Relational.Quantum.hardyBox_logical_not_strong}

Checked:

```lean
example :
    ReconnectionEvent canonicalReconnection :=
  canonicalReconnection_is_event

example :
    Noncontextual hardyBox /\ LogicallyContextual hardyBox
      /\ Not (StronglyContextual hardyBox) :=
  hardyBox_logical_not_strong
```

Repair path: if a physical page explains the old subject but cannot say which
Infomaterial phase behavior it witnesses, it is a provenance note, not a book page.

## Atlas Discipline

The atlas has one rule: it points downward to the generated phase before it
points outward to the familiar subject. It is useful only because the phase
volumes carry the proofs.

Use this page to answer lookup questions quickly:

* category and Yoneda live in the language phase;
* equality and quantification live in the predication fibration;
* order and closure live in settling;
* Scott-continuity and curvature live in closure regimes;
* fiber algebra lives over valuations;
* sheaf cohomology lives at the gluing boundary;
* aperiodic topology lives in persistence;
* spacetime lives in causal settling and reconstruction;
* physical theories live as phase witnesses.

Then leave the atlas and read the phase chapter. Lookup is not understanding;
it is only the door into the generated object.
