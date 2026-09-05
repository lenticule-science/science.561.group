---
title: "Nine RelMath Light-Cone Red Nodes: Detailed Build Sketches"
date: 2026-06-26
repo: "emsenn/relational-math"
status: "planning memo / implementation sketches"
author: "ChatGPT, for emsenn"
---


This memo turns the nine proposed RelMath/light-cone growth fronts into build-oriented sketches.
The point is not to give polished Lean code.
The point is to give enough module shape, dependency ordering, definitions, theorem targets, proof strategy, and scope discipline that a coding agent can begin implementing without drifting into vague physics metaphor.

The guiding thesis is:

\[ \textbf{light cone} = \textbf{local closure cone} = \textbf{reachable future} = \textbf{Alexandrov specialization} = \textbf{sheaf propagation constraint}. \]

RelMath is already unusually close to this thesis.
The current repo already has:

- `RelMath.
  Lorentzian.
  Causal`: finite causal sets as event DAGs, Boolean transitive closure, directed reachability, apex/void as timelike/spacelike relation.
- `RelMath.
  Lorentzian.
  MyrheimMeyer`: rational ordering fraction, diamond/chain/antichain witnesses, settling Gauss--Bonnet, geometry/topology independence.
- `RelMath.
  Cohomology.
  AlexandrovHusainov`: Alexandrov topology from a poset; specialization recovers order; continuous maps are monotone.
- `RelMath.
  Flow.
  TransfiniteClosureFlow`: real internal ordinal indexing, settling-continuity at limits, NSC firing as failure of limit continuity.
- `RelMath.
  Flow.
  ClosureFlowCurvatureRegime`: flat/curved regime correspondence; `H¹` as curvature module; NSC firing as curvature event.
- `RelMath.
  Flow.
  LawvereLaplacianSpectralGap` and `RelMath.
  Cohomology.
  LawvereHarmonicCohomology`: Lawvere/Tarski Laplacian as closure, harmonic kernel, and its cohomological triviality in vanishing regimes.
- `RelMath.
  Real.
  InternalReals`: constructive Cauchy reals as the κ = ω Scott-continuous settling completion of rationals.
- `RelMath.
  Closure.
  LaxSlackDiagnosis`: genuine lax-idempotence slack requires antisymmetry failure, hence a non-thin carrier.
- `RelMath.
  Cohomology.
  QuantaleEnrichedSheaf`: quantales, Q-categories, Q-functors, q-fuzzy equivalence.

The nine nodes below are ordered by dependency and conceptual payoff.
The first three make causal cones primitive.
The next three connect cones to singularity, Laplacian/spectral structure, and examples.
The final three push toward real-valued, paraconsistent, and AQFT-style causal nets.

## Global implementation rules

1. **No free data.** Reuse existing structures whenever possible.
  If a new structure is required, make it a thin packaging of existing data, not an unconstrained oracle.
2. **Boolean first; real later.** The causal spine already works over finite Boolean relations.
  Keep the first batch decidable and computation-friendly.
3. **Strict/reflexive discipline.** `C.reaches x y` is strict causal reachability.
  For topology, use the reflexive closure `x = y ∨ C.reaches x y`.
4. **Do not import Mathlib.** Everything here assumes the current RelMath rule: Lean core only.
5. **Treat physical words as bridge labels.** Unless the bridge theorem is proved, words like “microlocal,” “spectral,” “AQFT,” and “light cone” are analogical/provisional labels.
6. **Prefer theorem bundles.** RelMath style favors bundled headline theorems that collect the formal content of a conceptual node.

---

# 1. `RelMath.Lorentzian.ConeField`

## Purpose

Promote causal reachability into a named **cone-field geometry**.
Right now `Lorentzian.
Causal` already knows that `C.reaches e₁ e₂` means `e₂` lies in the causal future of `e₁`.
This module should make the future cone, past cone, spacelike relation, and causal diamond first-class objects.

This is the lowest-risk/highest-payoff node.
It lets later modules talk in geometric language without re-deriving it each time.

## Proposed file

```text
RelMath/Lorentzian/ConeField.lean
```

## Proposed imports

```lean
import RelMath.Lorentzian.Causal
import RelMath.Lorentzian.MyrheimMeyer
```

`MyrheimMeyer` is optional at first.
If this node only defines cones as predicates over `C.reaches`, it needs only `Lorentzian.
Causal`.
If it also proves apex-count identities, it should import `MyrheimMeyer`.

## Core definitions

Inside:

```lean
namespace RelMath
namespace Lorentzian
namespace ConeField

open RelMath.Lorentzian.Causal
```

Define strict future and strict past:

```lean
/-- Strict causal future of an event: the events reachable by a nonempty causal path. -/
def Future {E : Type} (C : CausalSet E) (e : E) : E → Prop :=
  fun x => C.reaches e x

/-- Strict causal past of an event. -/
def Past {E : Type} (C : CausalSet E) (e : E) : E → Prop :=
  fun x => C.reaches x e
```

Define reflexive closure for topological use later:

```lean
/-- Reflexive causal precedence: equality or strict reachability. -/
def CausalLe {E : Type} (C : CausalSet E) (x y : E) : Prop :=
  x = y ∨ C.reaches x y

/-- Reflexive future cone. -/
def ClosedFuture {E : Type} (C : CausalSet E) (e : E) : E → Prop :=
  fun x => CausalLe C e x

/-- Reflexive past cone. -/
def ClosedPast {E : Type} (C : CausalSet E) (e : E) : E → Prop :=
  fun x => CausalLe C x e
```

Define spacelike separation:

```lean
/-- Spacelike separation: neither event causally precedes the other. -/
def Spacelike {E : Type} (C : CausalSet E) (x y : E) : Prop :=
  ¬ C.reaches x y ∧ ¬ C.reaches y x
```

Define causal diamond:

```lean
/-- The strict causal diamond `I⁺(a) ∩ I⁻(b)`. -/
def Diamond {E : Type} (C : CausalSet E) (a b : E) : E → Prop :=
  fun x => C.reaches a x ∧ C.reaches x b

/-- The reflexive causal diamond `J⁺(a) ∩ J⁻(b)`. -/
def ClosedDiamond {E : Type} (C : CausalSet E) (a b : E) : E → Prop :=
  fun x => CausalLe C a x ∧ CausalLe C x b
```

Optional boundary/edge definitions:

```lean
/-- Direct causal edge, the seed relation before transitive closure. -/
def DirectFuture {E : Type} (C : CausalSet E) (e : E) : E → Prop :=
  fun x => C.prec0 e x = true
```

This gives a discrete analogue of “null generators” or direct cone edges, but the module should not call them null geodesics unless a later theorem justifies that terminology.

## Theorem targets

### Basic cone laws

```lean
theorem causalLe_refl {E} (C : CausalSet E) (x : E) : CausalLe C x x := ...

theorem causalLe_trans {E} (C : CausalSet E) {x y z : E} :
    CausalLe C x y → CausalLe C y z → CausalLe C x z := ...

theorem causalLe_antisymm {E} (C : CausalSet E) {x y : E} :
    CausalLe C x y → CausalLe C y x → x = y := ...
```

Proof strategy:

- Reflexivity: `Or.inl rfl`.
- Transitivity: split cases.
  If either side is equality, rewrite.
  If both are `reaches`, use `C.reaches_trans`.
- Antisymmetry: split equality cases.
  If both strict, use `C.reaches_asymm` to derive contradiction.

### Future/past closure laws

```lean
theorem future_trans {E} (C : CausalSet E) {a b c : E} :
    Future C a b → Future C b c → Future C a c :=
  C.reaches_trans

theorem future_is_upward_closed {E} (C : CausalSet E) {a x y : E} :
    Future C a x → CausalLe C x y → Future C a y := ...

theorem past_is_downward_closed {E} (C : CausalSet E) {a x y : E} :
    Past C a x → CausalLe C y x → Past C a y := ...
```

### Spacelike symmetry

```lean
theorem spacelike_symm {E} (C : CausalSet E) {x y : E} :
    Spacelike C x y → Spacelike C y x :=
  fun h => ⟨h.2, h.1⟩
```

Also useful:

```lean
theorem spacelike_irreaches_left ... : Spacelike C x y → ¬ C.reaches x y := fun h => h.1

theorem spacelike_irreaches_right ... : Spacelike C x y → ¬ C.reaches y x := fun h => h.2
```

### Diamond laws

```lean
theorem diamond_subset_future {E} (C : CausalSet E) {a b x : E} :
    Diamond C a b x → Future C a x := fun h => h.1

theorem diamond_subset_past {E} (C : CausalSet E) {a b x : E} :
    Diamond C a b x → Past C b x := fun h => h.2

theorem diamond_nonempty_of_reaches {E} (C : CausalSet E) {a b : E} :
    C.reaches a b → ClosedDiamond C a b a ∧ ClosedDiamond C a b b := ...
```

The strict diamond does not necessarily contain endpoints.
The closed diamond does.

### Boolean/computational bridge

Existing `MyrheimMeyer.apexCount` counts true pairs of a Boolean relation.
The cone-field module can add boolean versions:

```lean
def FutureBool {E : Type} (prec : E → E → Bool) (e : E) : E → Bool :=
  fun x => prec e x

def PastBool {E : Type} (prec : E → E → Bool) (e : E) : E → Bool :=
  fun x => prec x e
```

Then theorem for any listed events:

```lean
theorem apexCount_eq_sum_futureBool_lengths
    {E : Type} [DecidableEq E] (es : List E) (prec : E → E → Bool) :
    MyrheimMeyer.apexCount es prec =
      es.foldl (fun acc e => acc + (es.filter (fun x => (e ≠ x) && prec e x)).length) 0 :=
  rfl
```

This theorem may be definitionally true because `apexCount` already has this shape.
Still, naming it makes later geometric prose cleaner: apex count is sum of strict future-cone sizes.

## Main bundled theorem

```lean
/-- The causal reachability relation induces a strict cone geometry: future/past cones,
spacelike separation, and causal diamonds obey the expected order laws. -/
theorem causal_reachability_is_cone_geometry {E : Type} (C : CausalSet E) :
    (∀ x, CausalLe C x x)
    ∧ (∀ x y z, CausalLe C x y → CausalLe C y z → CausalLe C x z)
    ∧ (∀ x y, CausalLe C x y → CausalLe C y x → x = y)
    ∧ (∀ x y, Spacelike C x y → Spacelike C y x)
    ∧ (∀ a b c, Future C a b → Future C b c → Future C a c) := ...
```

## What this node buys

- Converts `reaches` into reusable geometry.
- Gives the later topology node a reflexive order.
- Gives the later observation node principal cones.
- Gives the later microlocal node a propagation relation.
- Gives the later causal net node regions and spacelike separation.

## Risk / scope discipline

- Do not call `DirectFuture` “null” yet.
  It is merely a direct edge in the seed graph.
- Do not claim manifold light cones.
  This is finite causal-cone geometry.
- Keep strict `Future` and reflexive `ClosedFuture` separate.

---

# 2. `RelMath.Lorentzian.CausalAlexandrovTopology`

## Purpose

Build the topology generated by causal cones.
This is the synthetic Lorentzian/topological bridge: from causal order to Alexandrov topology, with specialization recovering causal precedence.

`AlexandrovHusainov` already proves the generic fact: for a poset, opens are up-sets, arbitrary intersections of opens are open, specialization recovers the poset order, and continuous maps are monotone.
This node instantiates that at the causal preorder/partial order induced by a finite causal set.

## Proposed file

```text
RelMath/Lorentzian/CausalAlexandrovTopology.lean
```

## Proposed imports

```lean
import RelMath.Lorentzian.ConeField
import RelMath.Cohomology.AlexandrovHusainov
```

## Core definitions

The first step is to turn a causal set into the `Order.
PartialOrder` expected by `AlexandrovHusainov`.

```lean
namespace RelMath
namespace Lorentzian
namespace CausalAlexandrov

open RelMath.Lorentzian.Causal
open RelMath.Lorentzian.ConeField
open RelMath.Alexandrov
```

Define the causal partial order using `ConeField.
CausalLe`:

```lean
/-- The reflexive causal order as an `Order.PartialOrder`. -/
def causalPartialOrder {E : Type} (C : CausalSet E) : Order.PartialOrder where
  carrier := E
  le := ConeField.CausalLe C
  le_refl := ConeField.causalLe_refl C
  le_trans := fun {x y z} => ConeField.causalLe_trans C
  le_antisymm := fun {x y} => ConeField.causalLe_antisymm C
```

Then define the topology:

```lean
/-- The Alexandrov topology generated by the causal order. -/
def causalTopology {E : Type} (C : CausalSet E) : AlexandrovTopology where
  poset := causalPartialOrder C
```

Define causal opens directly as future-closed predicates:

```lean
/-- A causal open is an up-set for reflexive causal precedence. -/
def IsCausalOpen {E : Type} (C : CausalSet E) (U : E → Prop) : Prop :=
  ∀ {x y : E}, U x → ConeField.CausalLe C x y → U y
```

## Theorem targets

### Causal opens are Alexandrov opens

```lean
theorem isCausalOpen_iff_isOpen {E : Type} (C : CausalSet E) (U : E → Prop) :
    IsCausalOpen C U ↔ (causalTopology C).IsOpen U :=
  Iff.rfl
```

This may be definitional if the definitions line up.

### Future cones are open

Closed future cones are principal up-sets, hence open:

```lean
theorem closedFuture_isOpen {E : Type} (C : CausalSet E) (x : E) :
    (causalTopology C).IsOpen (ConeField.ClosedFuture C x) :=
  (causalTopology C).isOpen_upperSet x
```

Strict future is also upward closed:

```lean
theorem future_isOpen {E : Type} (C : CausalSet E) (x : E) :
    (causalTopology C).IsOpen (ConeField.Future C x) := by
  intro y z hy hyz
  exact ConeField.future_is_upward_closed C hy hyz
```

Need to ensure the `IsOpen` expected type is over the same `poset.carrier`.
If the carrier is definitionally `E`, this should be direct.

### Specialization recovers causal precedence

```lean
theorem specializes_iff_causalLe {E : Type} (C : CausalSet E) (x y : E) :
    (causalTopology C).specializes x y ↔ ConeField.CausalLe C x y :=
  (causalTopology C).specializes_iff_le x y
```

Then a strict version:

```lean
theorem reaches_iff_specializes_ne {E : Type} (C : CausalSet E) {x y : E} :
    C.reaches x y ↔ ((causalTopology C).specializes x y ∧ x ≠ y) := ...
```

Proof:

- Forward: specialization by `Or.inr h`; non-equality from `C.reaches_irrefl`.
- Backward: from specialization get `x = y ∨ reaches`; equality contradicts `x ≠ y`.

### Spacelike separation as topological incomparability

```lean
theorem spacelike_iff_no_specialization {E : Type} (C : CausalSet E) {x y : E} :
    ConeField.Spacelike C x y ↔
      ¬ (CausalAlexandrov.causalTopology C).specializes x y
      ∧ ¬ (CausalAlexandrov.causalTopology C).specializes y x
      ∧ x ≠ y := ...
```

Careful: specialization is reflexive, so if `x = y`, both specializations hold.
For distinct points, no specialization in either direction matches strict spacelike separation.

A cleaner theorem is:

```lean
theorem spacelike_of_distinct_no_specialization ...
```

and a converse theorem with `x ≠ y` as hypothesis.

### Continuous maps are causal monotone

Define:

```lean
def CausalMonotone {E F : Type} (C : CausalSet E) (D : CausalSet F) (f : E → F) : Prop :=
  ∀ {x y}, ConeField.CausalLe C x y → ConeField.CausalLe D (f x) (f y)
```

Then:

```lean
theorem causalContinuous_iff_monotone {E F : Type}
    (C : CausalSet E) (D : CausalSet F) (f : E → F) :
    Alexandrov.Continuous (causalTopology C) (causalTopology D) f ↔
      CausalMonotone C D f :=
  Alexandrov.continuous_iff_monotone (causalTopology C) (causalTopology D) f
```

## Main bundled theorem

```lean
/-- The Alexandrov topology generated by a finite causal set recovers exactly the
reflexive causal order; strict reachability is specialization plus inequality. -/
theorem causal_alexandrov_recovers_cones {E : Type} (C : CausalSet E) :
    (∀ x y, (causalTopology C).specializes x y ↔ ConeField.CausalLe C x y)
    ∧ (∀ x y, C.reaches x y ↔ ((causalTopology C).specializes x y ∧ x ≠ y))
    ∧ (∀ x, (causalTopology C).IsOpen (ConeField.ClosedFuture C x)) := ...
```

## What this node buys

- A formal bridge from causal order to topology.
- A RelMath-native version of “causal structure determines topology.”
- The base for light observation/reconstruction, because observations can be understood as finite readings of principal opens.
- The base for sheaves over causal sites.

## Risk / scope discipline

- Alexandrov topology is not necessarily manifold topology.
  It is the order topology of a finite/preorder-like causal model.
- Specialization is reflexive; strict causality requires `x ≠ y`.
- Avoid claiming continuum Lorentzian topology until real/limit refinement exists.

---

# 3. `RelMath.Lorentzian.LightObservation`

## Purpose

Formalize finite inverse-problem structure: reconstruct causal order or event identity from light-cone observations.

The modern Lorentzian inverse-problem frontier asks: given light observations, arrival data, or boundary observations, what can be reconstructed?
RelMath’s finite/order-theoretic version should say:

> An event is determined by its observed past/future cone signatures when the observer family is separating.

This is a direct bridge to the existing inverse-limit/hull pattern in `Aperiodic.
InverseHull`, where finite-stage projections separate threads.

## Proposed file

```text
RelMath/Lorentzian/LightObservation.lean
```

## Proposed imports

```lean
import RelMath.Lorentzian.CausalAlexandrovTopology
import RelMath.Aperiodic.InverseHull
```

The `InverseHull` import may wait until stage two.
The initial module can be built with only the causal topology imports.

## Important build issue: decidable reachability

`C.reaches x y` is an inductive `Prop`; it may not be automatically decidable.
The computational observation signatures should therefore be staged carefully.

Three possible approaches:

### Approach A: Prop-level signatures

Use predicates, no filtering:

```lean
def PastObserved (C : CausalSet E) (O : E → Prop) (x : E) : E → Prop :=
  fun o => O o ∧ ConeField.CausalLe C o x
```

This is easiest to prove with, but less computational.

### Approach B: Boolean settled relation parameter

Pass a settled Boolean causal relation `rel : E → E → Bool` plus laws relating it to `CausalLe` or `reaches`:

```lean
structure SettledCausalBool (C : CausalSet E) where
  rel : E → E → Bool
  rel_iff : ∀ x y, rel x y = true ↔ ConeField.CausalLe C x y
```

This gives computable `List.filter` observation signatures without proving decidability of reachability from scratch.

### Approach C: implement decidable reachability for finite causal sets

This is the deepest and most useful long-term, but may be overkill for this node.

Recommendation: **use Approach A first**, then add Boolean signatures once `ConeField` and `CausalAlexandrovTopology` are green.

## Core definitions

```lean
namespace RelMath
namespace Lorentzian
namespace LightObservation

open RelMath.Lorentzian.Causal
open RelMath.Lorentzian.ConeField
open RelMath.Lorentzian.CausalAlexandrov
```

Observer family as a predicate:

```lean
/-- An observer family: events where light-cone observations are available. -/
abbrev ObserverFamily (E : Type) := E → Prop
```

Past/future observation signatures:

```lean
/-- Which observers lie in the causal past of `x`. -/
def pastSignature {E : Type} (C : CausalSet E) (O : ObserverFamily E) (x : E) : E → Prop :=
  fun o => O o ∧ CausalLe C o x

/-- Which observers lie in the causal future of `x`. -/
def futureSignature {E : Type} (C : CausalSet E) (O : ObserverFamily E) (x : E) : E → Prop :=
  fun o => O o ∧ CausalLe C x o

/-- Two events have the same observation signature relative to `O`. -/
def SameSignature {E : Type} (C : CausalSet E) (O : ObserverFamily E) (x y : E) : Prop :=
  pastSignature C O x = pastSignature C O y ∧
  futureSignature C O x = futureSignature C O y
```

Separating observer family:

```lean
/-- Observers separate events when equal observed signatures force equality. -/
def Separating {E : Type} (C : CausalSet E) (O : ObserverFamily E) : Prop :=
  ∀ x y, SameSignature C O x y → x = y
```

Full observation family:

```lean
/-- The full event set as observers. -/
def allObservers {E : Type} : ObserverFamily E := fun _ => True
```

## Theorem targets

### Full observers recover causal order

With all observers, the past signature of `y` contains `x` iff `x ≤ y`:

```lean
theorem allObservers_pastSignature_iff {E : Type} (C : CausalSet E) (x y : E) :
    pastSignature C allObservers y x ↔ CausalLe C x y := by
  constructor
  · intro h; exact h.2
  · intro h; exact ⟨trivial, h⟩
```

Similarly:

```lean
theorem allObservers_futureSignature_iff {E : Type} (C : CausalSet E) (x y : E) :
    futureSignature C allObservers x y ↔ CausalLe C x y := ...
```

### Full observers separate events

Using reflexive future signatures:

```lean
theorem allObservers_separating {E : Type} (C : CausalSet E) :
    Separating C allObservers := by
  intro x y hsig
  have hx_y : CausalLe C x y := by
    -- x is in futureSignature all x, equality gives x in futureSignature all y or use past side
  have hy_x : CausalLe C y x := by
    -- symmetrical
  exact ConeField.causalLe_antisymm C hx_y hy_x
```

A clean proof:

- `futureSignature C allObservers x x` holds by reflexivity.
- If `futureSignature x = futureSignature y`, then `futureSignature C allObservers y x` holds, hence `CausalLe C y x`.
- Similarly using `futureSignature y y`, obtain `CausalLe C x y`.
- Antisymmetry gives equality.

Need to be careful about direction.
If `futureSignature C O x o := O o ∧ CausalLe C x o`, then self-membership of `x` in future of `x`; equality of `futureSignature x = futureSignature y` gives `x` in future of `y`, so `y ≤ x`.
Similarly self-membership of `y` gives `x ≤ y`.

### Same signature recovers same principal cones

```lean
theorem sameSignature_all_iff_same_principal_cones {E : Type} (C : CausalSet E) (x y : E) :
    SameSignature C allObservers x y ↔
      ConeField.ClosedPast C x = ConeField.ClosedPast C y ∧
      ConeField.ClosedFuture C x = ConeField.ClosedFuture C y := ...
```

This is mostly unfolding definitions.

### Observation monotonicity

If `x ≤ y`, then the past signature of `x` is contained in the past signature of `y`:

```lean
theorem pastSignature_mono {E : Type} (C : CausalSet E) (O : ObserverFamily E) {x y : E} :
    CausalLe C x y →
      (∀ o, pastSignature C O x o → pastSignature C O y o) := ...
```

Proof uses `causalLe_trans`.

Similarly, future signatures are contravariant:

```lean
theorem futureSignature_antimono ... :
    CausalLe C x y →
      (∀ o, futureSignature C O y o → futureSignature C O x o) := ...
```

If `x ≤ y`, then anything in the future of `y` is in the future of `x`.

## Optional Boolean stage

Once the Prop version is green, define:

```lean
structure BoolObservation {E : Type} (C : CausalSet E) where
  rel : E → E → Bool
  rel_iff : ∀ x y, rel x y = true ↔ CausalLe C x y
```

Then with `[DecidableEq E]` and `O : List E`:

```lean
def pastSignatureList (B : BoolObservation C) (O : List E) (x : E) : List E :=
  O.filter (fun o => B.rel o x)

def futureSignatureList (B : BoolObservation C) (O : List E) (x : E) : List E :=
  O.filter (fun o => B.rel x o)
```

This connects to actual finite computation.

## Inverse-hull bridge

Stage two can define an observation inverse system:

```lean
structure ObservationStage (E : Type) where
  observers : ObserverFamily E
```

With restriction maps from larger observer families to smaller ones.
Threads are coherent observation signatures across increasing observer families.
A theorem analogous to `hull_separated_by_stages` would say:

> If two hidden events have the same reading at every finite observer stage, then they are the same event, provided the observer stages jointly cover all events.

This is the finite-order version of inverse light observation.

## Main bundled theorem

```lean
/-- Full light-cone observation reconstructs the finite causal event: all observers separate
events, and observed past/future signatures recover the causal order. -/
theorem full_light_observation_reconstructs_causal_order {E : Type} (C : CausalSet E) :
    Separating C allObservers
    ∧ (∀ x y, pastSignature C allObservers y x ↔ CausalLe C x y)
    ∧ (∀ x y, futureSignature C allObservers x y ↔ CausalLe C x y) := ...
```

## What this node buys

- A finite RelMath inverse Lorentzian problem.
- A bridge from causal topology to reconstruction.
- A conceptual route to “light observation sets” without smooth geometry.
- Reusable machinery for agentic observation, provenance, and causal trace reconstruction.

## Risk / scope discipline

- Do not claim metric reconstruction.
  This reconstructs finite causal order/topology.
- Do not claim all observer families separate; define and prove separation conditions.
- Avoid computational `List.filter` over `reaches` until decidability is supplied or a Boolean settled relation is explicitly given.

---

# 4. `RelMath.Lorentzian.MicrolocalSupport`

## Purpose

Build the RelMath analogue of microlocal singular support: not cotangent wavefront sets, but **NSC firing support** of a closure flow, then causal propagation closure of that support along light cones.

The classical frontier says singularities of wave equations propagate along null cones.
RelMath’s internal analogue should say:

> closure singularities are NSC firings; their support propagates along the causal reachability cone; vanishing `H¹` means empty singular support.

This is a bridge, not an identity with smooth microlocal analysis.
The formal content should be NSC/closure-flow theorems.

## Proposed file

```text
RelMath/Lorentzian/MicrolocalSupport.lean
```

## Proposed imports

```lean
import RelMath.Lorentzian.ConeField
import RelMath.Dynamics.Flow.TransfiniteClosureFlow
import RelMath.Dynamics.Flow.ClosureFlowCurvatureRegime
```

Potentially:

```lean
import RelMath.Dynamics.Flow.NonScottContinuousFiring
```

if theorem names from the NSC layer are needed directly.

## Two-layer design

This module should not try to immediately assign singularities to events and ordinals at once.
It should be staged.

### Layer A: generic closure-flow singular support

Use existing `Valuation.
ModalFrame.
OrdFlow` and `NSCFiringAt` from `TransfiniteClosureFlow`.

```lean
/-- A closure-flow singularity at a limit fundamental sequence. -/
def SingularAt (w : ModalFrame.OrdFlow) (f : Nat → Ord) : Prop :=
  ModalFrame.NSCFiringAt w f

/-- A flow is microlocally smooth when it has no NSC firing at any limit. -/
def SmoothFlow (w : ModalFrame.OrdFlow) : Prop :=
  ∀ f, ¬ SingularAt w f
```

Theorem:

```lean
theorem continuous_empty_singular_support (w : ModalFrame.OrdFlow) :
    ModalFrame.Continuous w → SmoothFlow w :=
  ModalFrame.continuous_no_nsc_firing w
```

This is nearly definitional, but naming it creates the microlocal bridge.

### Layer B: event support and causal propagation closure

Define support as a predicate on events:

```lean
/-- An event support in a causal set. -/
abbrev EventSupport (E : Type) := E → Prop

/-- Forward causal closure of an event support. -/
def forwardClosure {E : Type} (C : CausalSet E) (S : EventSupport E) : EventSupport E :=
  fun y => ∃ x, S x ∧ ConeField.CausalLe C x y
```

Then prove:

```lean
theorem forwardClosure_extensive {E} (C : CausalSet E) (S : EventSupport E) :
    ∀ x, S x → forwardClosure C S x :=
  fun x hx => ⟨x, hx, ConeField.causalLe_refl C x⟩

theorem forwardClosure_future_closed {E} (C : CausalSet E) (S : EventSupport E) :
    ∀ {x y}, forwardClosure C S x → ConeField.CausalLe C x y → forwardClosure C S y := ...

theorem forwardClosure_idem {E} (C : CausalSet E) (S : EventSupport E) :
    forwardClosure C (forwardClosure C S) = forwardClosure C S := ...
```

Proof of idempotence:

- Extensionality over `y`.
- Forward: if `y` is reached from some `x` which is itself reached from `z ∈ S`, transitivity gives `z ≤ y`.
- Backward: extensivity.

This gives a causal propagation closure independent of any particular valuation model.

### Layer C: curvature support

Use `ClosureFlowCurvatureRegime` as the bridge:

```lean
/-- A regime has empty singular support when its cohomology vanishes. -/
theorem flat_regime_empty_singular_support (r : ClosureRegime) :
    CurvatureRegime.IsFlat r ↔ cohomologyVanishes r = true := ...
```

The actual theorem already exists in the opposite direction as `vanishes_iff_flat`; this module can re-export or rename.

For curved regimes:

```lean
theorem curved_regime_has_singularity_projection (r : ClosureRegime) :
    CurvatureRegime.IsCurved r ↔ cohomologyVanishes r = false := ...
```

Again, a repackage of existing correspondence.

## Optional event-indexed flow stage

A later refinement can define:

```lean
structure EventFlow (E : Type) where
  val : Ord → E → Charge
```

Then:

```lean
def EventSingularAt (w : EventFlow E) (f : Nat → Ord) (e : E) : Prop :=
  -- value at limit not recovered from predecessor LUB at event e
```

But this requires a pointwise LUB theory for `Charge`, and should not block the first version.

## Theorem targets

### Propagation closure is a closure operator

```lean
theorem forwardClosure_is_closure {E : Type} (C : CausalSet E) :
    (∀ S x, S x → forwardClosure C S x)
    ∧ (∀ S T, (∀ x, S x → T x) → ∀ x, forwardClosure C S x → forwardClosure C T x)
    ∧ (∀ S, forwardClosure C (forwardClosure C S) = forwardClosure C S) := ...
```

This is the exact analogue of a propagation closure generated by a light cone.

### Smooth flow has no singular support

```lean
theorem settling_continuity_empty_microlocal_support
    (w : ModalFrame.OrdFlow) :
    ModalFrame.Continuous w → ∀ f, ¬ SingularAt w f :=
  ModalFrame.continuous_no_nsc_firing w
```

### Curvature/H¹ bridge

```lean
theorem h1_classifies_singularity_regime (r : ClosureRegime) :
    (cohomologyVanishes r = true ↔ CurvatureRegime.IsFlat r)
    ∧ (cohomologyVanishes r = false ↔ CurvatureRegime.IsCurved r) :=
  ⟨CurvatureRegime.vanishes_iff_flat r, CurvatureRegime.nonvanishes_iff_curved r⟩
```

## Main bundled theorem

```lean
/-- RelMath microlocal projection: causal forward-closure is a propagation closure, and
settling-continuous flows have empty NSC singular support; nonvanishing `H¹` is exactly
the curved/singular regime. -/
theorem microlocal_support_projection {E : Type} (C : CausalSet E) (r : ClosureRegime) :
    (∀ S, forwardClosure C (forwardClosure C S) = forwardClosure C S)
    ∧ (cohomologyVanishes r = true ↔ CurvatureRegime.IsFlat r)
    ∧ (cohomologyVanishes r = false ↔ CurvatureRegime.IsCurved r) := ...
```

## What this node buys

- A formal, honest “microlocal” bridge inside RelMath.
- A propagation-closure operator generated by causal cones.
- A clean place to say “wavefront set analogue” without importing smooth manifolds.
- A future bridge to sheaf-theoretic singular support.

## Risk / scope discipline

- Do not claim cotangent bundles, bicharacteristics, or PDE wavefront sets.
- Say “microlocal projection” or “NSC singular support analogue.”
- Keep event support separate from ordinal/flow singularity until an event-indexed flow is built.

---

# 5. `RelMath.Lorentzian.CausalLaplacian`

## Purpose

Build a causal-site Laplacian as a closure operator over event-supported sections.
The existing Lawvere Laplacian is `□∘◇` over valuation/modal frames.
This node builds the finite causal analogue:

> Given a causal order, the causal Laplacian/closure sends a seed support to its causal future closure.
> Harmonic sections are exactly future-closed sections.

This creates a concrete bridge between light cones, propagation, harmonic/global sections, and closure operators.

## Proposed file

```text
RelMath/Lorentzian/CausalLaplacian.lean
```

## Proposed imports

```lean
import RelMath.Lorentzian.ConeField
import RelMath.Dynamics.Flow.LawvereLaplacianSpectralGap
import RelMath.Cohomology.LawvereHarmonicCohomology
```

The Lawvere imports are for conceptual bridge theorems and naming.
The first implementation can use only `ConeField`.

## Core design choice

Do not try to force `CausalSet` into the existing `Valuation.
ModalFrame` immediately.
That would require a mapping from event-indexed predicates into predication-cell valuations.

Instead, define a separate event-support closure.
Later add comparison theorems to Lawvere/Tarski closure.

## Core definitions

```lean
namespace RelMath
namespace Lorentzian
namespace CausalLaplacian

open RelMath.Lorentzian.Causal
open RelMath.Lorentzian.ConeField
```

Event sections:

```lean
/-- A Boolean event section/support. -/
abbrev Section (E : Type) := E → Prop
```

Causal closure:

```lean
/-- Causal closure of an event section: add everything in the causal future of the seed. -/
def causalClosure {E : Type} (C : CausalSet E) (S : Section E) : Section E :=
  fun y => ∃ x, S x ∧ CausalLe C x y
```

Causal Laplacian as same closure:

```lean
/-- The finite causal Lawvere/Tarski Laplacian projection: a round-trip closure along causal cones. -/
def causalLaplacian {E : Type} (C : CausalSet E) : Section E → Section E :=
  causalClosure C
```

Harmonic sections:

```lean
/-- A section is harmonic when causal closure fixes it. -/
def IsHarmonic {E : Type} (C : CausalSet E) (S : Section E) : Prop :=
  causalLaplacian C S = S

/-- A section is future-closed under causal precedence. -/
def FutureClosed {E : Type} (C : CausalSet E) (S : Section E) : Prop :=
  ∀ {x y}, S x → CausalLe C x y → S y
```

## Theorem targets

### Closure laws

```lean
theorem causalClosure_infl {E : Type} (C : CausalSet E) (S : Section E) :
    ∀ x, S x → causalClosure C S x :=
  fun x hx => ⟨x, hx, causalLe_refl C x⟩
```

```lean
theorem causalClosure_mono {E : Type} (C : CausalSet E) {S T : Section E} :
    (∀ x, S x → T x) → ∀ x, causalClosure C S x → causalClosure C T x := by
  intro hsub y hy
  rcases hy with ⟨x, hxS, hxy⟩
  exact ⟨x, hsub x hxS, hxy⟩
```

```lean
theorem causalClosure_idem {E : Type} (C : CausalSet E) (S : Section E) :
    causalClosure C (causalClosure C S) = causalClosure C S := by
  funext y
  apply propext
  constructor
  · intro hy
    rcases hy with ⟨x, hxClosed, hxy⟩
    rcases hxClosed with ⟨z, hzS, hzx⟩
    exact ⟨z, hzS, causalLe_trans C hzx hxy⟩
  · intro hy
    exact causalClosure_infl C (causalClosure C S) y hy
```

This theorem may use `propext`, consistent with existing RelMath practice.

### Harmonic iff future-closed

```lean
theorem harmonic_iff_futureClosed {E : Type} (C : CausalSet E) (S : Section E) :
    IsHarmonic C S ↔ FutureClosed C S := by
  constructor
  · intro h x y hx hxy
    have hyClosed : causalClosure C S y := ⟨x, hx, hxy⟩
    -- rewrite h : causalClosure C S = S
    exact ...
  · intro hclosed
    funext y
    apply propext
    constructor
    · intro hy
      rcases hy with ⟨x, hx, hxy⟩
      exact hclosed hx hxy
    · intro hy
      exact ⟨y, hy, causalLe_refl C y⟩
```

### Least harmonic section above seed

```lean
theorem causalClosure_least_harmonic {E : Type} (C : CausalSet E) (S T : Section E) :
    (∀ x, S x → T x) →
    IsHarmonic C T →
    ∀ x, causalClosure C S x → T x := by
  intro hST hT x hx
  rcases hx with ⟨s, hs, hsx⟩
  have hTs : T s := hST s hs
  have hFuture : FutureClosed C T := (harmonic_iff_futureClosed C T).mp hT
  exact hFuture hTs hsx
```

### Diffusion/spectral-gap projection

Since `causalClosure` is idempotent, iterating it reaches a fixed point in one step:

```lean
def iterate {α : Type} (f : α → α) : Nat → α → α
  | 0, x => x
  | n+1, x => f (iterate f n x)
```

Maybe reuse existing orbit machinery if available.
Otherwise define a local simple iterator.

Theorem:

```lean
theorem causal_diffusion_gap_one {E : Type} (C : CausalSet E) (S : Section E) :
    causalLaplacian C (causalLaplacian C S) = causalLaplacian C S :=
  causalClosure_idem C S
```

This is a finite causal-site spectral-gap projection: the closure reaches harmonic equilibrium after one closure application because the relation is already transitively closed via `CausalLe`.

## Main bundled theorem

```lean
/-- The causal Laplacian is a closure operator whose harmonic sections are exactly
future-closed sections; its diffusion reaches the harmonic kernel after one step. -/
theorem causal_laplacian_theory {E : Type} (C : CausalSet E) :
    (∀ S x, S x → causalLaplacian C S x)
    ∧ (∀ S T, (∀ x, S x → T x) → ∀ x, causalLaplacian C S x → causalLaplacian C T x)
    ∧ (∀ S, causalLaplacian C (causalLaplacian C S) = causalLaplacian C S)
    ∧ (∀ S, IsHarmonic C S ↔ FutureClosed C S) := ...
```

## Optional bridge to `ValueSettling.VClosure`

Later, instantiate this as a `VClosure` over a suitable function-space value category.
That requires a partial order on `Section E` by inclusion and a bottom section `fun _ => False`.

Potential module-local structure:

```lean
def sectionValueCategory (E : Type) : ValueSettling.ValueCategory where
  carrier := Section E
  le := fun S T => ∀ x, S x → T x
  ...
  bot := fun _ => False
```

Then:

```lean
def causalVClosure (C : CausalSet E) : ValueSettling.VClosure (sectionValueCategory E) where
  op := causalClosure C
  infl := ...
  mono := ...
  idem := causalClosure_idem C
```

This would connect causal Laplacian directly to the universal settling-over-values hub.

## What this node buys

- Concrete harmonic/global-section theory over causal sites.
- A direct “light cone propagation closure.”
- A simple spectral-gap theorem: transitive causal closure reaches fixed point in one step.
- A bridge to Lawvere Laplacian without pretending to have inner products.

## Risk / scope discipline

- This is an order/Tarski/Lawvere Laplacian projection, not a metric graph Laplacian.
- Harmonic means closure-fixed/future-closed, not kernel of a real symmetric matrix.
- “Spectral gap one” is a closure-iteration gap, not an eigenvalue gap.

---

# 6. `RelMath.Lorentzian.DiamondSpectralPortrait`

## Purpose

Build the canonical worked example: the `Fin 4` causal diamond should not only have Myrheim--Meyer ordering fraction and Gauss--Bonnet data; it should also have cone data, topology data, causal Laplacian data, and a spectral/harmonic closure portrait.

This gives the project a concrete demonstration object:

\[ \text{diamond} = (r=5/6 \mid \chi=5 \mid cl\text{-}inv=0 \mid H^1=0 \mid L\text{-harmonic closure}). \]

## Proposed file

```text
RelMath/Lorentzian/DiamondSpectralPortrait.lean
```

## Proposed imports

```lean
import RelMath.Lorentzian.MyrheimMeyer
import RelMath.Lorentzian.ConeField
import RelMath.Lorentzian.CausalAlexandrovTopology
import RelMath.Lorentzian.CausalLaplacian
```

Potentially import `LawvereHarmonicCohomology` if bundling with the global Lawvere theorem, but the first version can stay causal-site local.

## Design issue: `diamondPrec` versus `CausalSet`

`MyrheimMeyer` defines `diamondPrec : Fin 4 → Fin 4 → Bool`, but the causal cone modules use `CausalSet E`, which requires:

```lean
structure CausalSet (E : Type) where
  events : List E
  prec0 : Graph E
  acyclic : Graph.StrictOrderClosure prec0
```

Need a concrete `CausalSet (Fin 4)` witness for the diamond.
It may already exist elsewhere; if not, build it.

The direct seed could be either:

1. the Hasse edges: `0→1`, `0→2`, `1→3`, `2→3`; transitive closure yields `0→3`, or
2. the already-transitive relation `diamondPrec` including `0→3`.

For a causal set, using Hasse edges is cleaner: `prec0` should be direct links.
But `MyrheimMeyer.apexCount` expects the settled/full causal order.
Therefore this module should be explicit:

```lean
/-- Direct Hasse-edge diamond seed. -/
def diamondSeedPrec : Fin 4 → Fin 4 → Bool := ...

/-- Full transitive diamond order, reused from MyrheimMeyer. -/
abbrev diamondOrderPrec := MyrheimMeyer.diamondPrec
```

Then show the reachability closure of `diamondSeedPrec` matches `diamondOrderPrec`, if buildable.

If proving that bridge is too much initially, define a `CausalSet` with `prec0 := diamondPrec`, since it is already acyclic and transitive.
This is less semantically pure but still a valid DAG seed.

## Core definitions

```lean
namespace RelMath
namespace Lorentzian
namespace DiamondSpectralPortrait

open RelMath.Lorentzian.Causal
open RelMath.Lorentzian.MyrheimMeyer
open RelMath.Lorentzian.ConeField
open RelMath.Lorentzian.CausalLaplacian
```

Define event names:

```lean
def a : Fin 4 := 0
def b : Fin 4 := 1
def c : Fin 4 := 2
def d : Fin 4 := 3
```

Define event sections:

```lean
/-- Singleton section at an event. -/
def singleton (x : Fin 4) : CausalLaplacian.Section (Fin 4) :=
  fun y => y = x
```

If a concrete `CausalSet` exists:

```lean
def diamondCausalSet : CausalSet (Fin 4) := ...
```

## Theorem targets

### Existing Myrheim--Meyer facts re-bundled

Reuse existing theorems:

```lean
theorem diamond_rational_geometry :
    orderingFraction fourEvents diamondPrec = fiveSixths :=
  diamond_ordering_fraction

theorem diamond_euler_topology :
    eulerChar fourEvents diamondPrec = 5 :=
  (gauss_bonnet_diamond).1

theorem diamond_classifying_zero :
    strictClassifying.clInv = 0 :=
  (diamond_spacetime_portrait).2.2
```

### Cone computations

For the full diamond order, compute future cones as Boolean predicates.

If using `diamondPrec` directly:

```lean
theorem diamond_future_a_bool :
    (fourEvents.filter (fun x => diamondPrec a x)).length = 3 := by decide

theorem diamond_future_b_bool :
    (fourEvents.filter (fun x => diamondPrec b x)).length = 1 := by decide

theorem diamond_future_c_bool :
    (fourEvents.filter (fun x => diamondPrec c x)).length = 1 := by decide

theorem diamond_future_d_bool :
    (fourEvents.filter (fun x => diamondPrec d x)).length = 0 := by decide
```

Past cone counts:

```lean
theorem diamond_past_d_bool :
    (fourEvents.filter (fun x => diamondPrec x d)).length = 3 := by decide
```

These produce a visible cone portrait:

- `a`: future `{b,c,d}`, past `{}`
- `b`: future `{d}`, past `{a}`
- `c`: future `{d}`, past `{a}`
- `d`: future `{}`, past `{a,b,c}`

### Spacelike relation

```lean
theorem diamond_b_spacelike_c_bool :
    diamondPrec b c = false ∧ diamondPrec c b = false := by decide
```

If using `CausalSet` and `Spacelike`, prove:

```lean
theorem diamond_b_spacelike_c :
    ConeField.Spacelike diamondCausalSet b c := ...
```

This requires proving no reachability between `b` and `c`, probably possible by decidable small case or by using `diamondPrec` reflection.

### Causal Laplacian closures

If `diamondCausalSet` exists, prove singleton closures:

```lean
theorem diamond_closure_singleton_a :
    causalClosure diamondCausalSet (singleton a) = fun x => x = a ∨ x = b ∨ x = c ∨ x = d := ...

 theorem diamond_closure_singleton_b :
    causalClosure diamondCausalSet (singleton b) = fun x => x = b ∨ x = d := ...

 theorem diamond_closure_singleton_c :
    causalClosure diamondCausalSet (singleton c) = fun x => x = c ∨ x = d := ...

 theorem diamond_closure_singleton_d :
    causalClosure diamondCausalSet (singleton d) = fun x => x = d := ...
```

These may be proof-heavy with `Prop` functions.
If hard, start with Boolean list versions:

```lean
def diamondFutureList (x : Fin 4) : List (Fin 4) :=
  fourEvents.filter (fun y => (x == y) || diamondPrec x y)
```

Then prove by `decide`.

### Harmonic/future-closed portrait

For each closed future cone:

```lean
theorem diamond_closedFuture_harmonic (x : Fin 4) :
    IsHarmonic diamondCausalSet (ClosedFuture diamondCausalSet x) :=
  (harmonic_iff_futureClosed diamondCausalSet _).mpr ...
```

The proof is just transitivity of `CausalLe`.

### Spectral gap one

```lean
theorem diamond_causal_laplacian_gap_one (S : Section (Fin 4)) :
    causalLaplacian diamondCausalSet (causalLaplacian diamondCausalSet S)
      = causalLaplacian diamondCausalSet S :=
  causalClosure_idem diamondCausalSet S
```

## Main bundled theorem

```lean
/-- The diamond's full causal-spectral portrait: rational geometry, topology,
classifying data, spacelike middle pair, harmonic causal closure, and gap-one causal
Laplacian diffusion. -/
theorem diamond_spectral_spacetime_portrait :
    orderingFraction fourEvents diamondPrec = fiveSixths
    ∧ eulerChar fourEvents diamondPrec = 5
    ∧ strictClassifying.clInv = 0
    ∧ diamondPrec b c = false ∧ diamondPrec c b = false
    ∧ (∀ S : Section (Fin 4),
        causalLaplacian diamondCausalSet (causalLaplacian diamondCausalSet S)
          = causalLaplacian diamondCausalSet S) := ...
```

This theorem may need to be split if the `diamondCausalSet` construction is not immediately easy.

## What this node buys

- A canonical demonstration object for docs, papers, and agent prompts.
- A regression-test cluster for all causal modules.
- A place to compare topology, geometry, and spectral closure without overclaiming continuum physics.

## Risk / scope discipline

- Do not hide the distinction between direct seed relation and full transitive causal order.
- If using `diamondPrec` as `prec0`, document that it is a transitive seed, not the Hasse diagram.
- Keep real-valued `d_MM` out of this node; this is rational/spectral/topological portrait.

---

# 7. `RelMath.Lorentzian.MyrheimMeyerRealProjection`

## Purpose

Lift the rational Myrheim--Meyer ordering fraction into the internally derived real layer, without pretending to have the full Gamma-function inversion.

Existing `MyrheimMeyer` honestly scoped out real-valued `d_MM = f⁻¹(r)` because it needed reals, Gamma, and inverse functions.
Since `InternalReals` now exists, the rational-to-real part is no longer blocked.
The Gamma/inversion part is still blocked.

This node should prove:

> The rational ordering fraction has a faithful internal-real projection.
> Geometry/topology independence survives this embedding.

## Proposed file

```text
RelMath/Lorentzian/MyrheimMeyerRealProjection.lean
```

## Proposed imports

```lean
import RelMath.Lorentzian.MyrheimMeyer
import RelMath.Calculus.Real.InternalReals
```

Potential later imports:

```lean
import RelMath.Calculus.Real.Logarithm
import RelMath.Calculus.Real.IVT
```

But the first version probably needs only `InternalReals`.

## Important type issue: two rational layers

`MyrheimMeyer.orderingFraction` currently uses Lean core `Rat`.
`InternalReals` defines its own constructive rational type inside `RelMath.
InternalReals`.

So the module must choose one of two approaches.

### Approach A: bridge core `Rat` to internal `Rat`

Define a conversion for the restricted rational values produced by `mkFrac`.

This is hard because Lean core `Rat` internals and RelMath internal rationals differ.

### Approach B: re-define ordering fraction directly in internal rationals

This is cleaner and more RelMath-native.

```lean
/-- Internal rational fraction `n/d`, with zero for `d = 0`, as an InternalReals.Rat. -/
def mkIRatFrac (n d : Nat) : InternalReals.Rat := ...
```

Use `InternalReals.
Rat.mk` with numerator `(n : Int)` and denominator `(d : Int)` when `d > 0`.
It may not reduce, but reduction is not needed for embedding into reals.
If denominator positivity is required, provide `by omega`.

Then:

```lean
def orderingFractionIRat {E : Type} [DecidableEq E]
    (es : List E) (prec : E → E → Bool) : InternalReals.Rat :=
  mkIRatFrac (2 * MyrheimMeyer.apexCount es prec)
             (MyrheimMeyer.orderedPairCount es.length)
```

Then embed:

```lean
def orderingFractionReal {E : Type} [DecidableEq E]
    (es : List E) (prec : E → E → Bool) : InternalReals.RReal :=
  InternalReals.RReal.ofRat (orderingFractionIRat es prec)
```

This avoids needing a full core-Rat conversion.

## Core theorem targets

### Diamond real projection

Define internal `5/6`:

```lean
def iFiveSixths : InternalReals.Rat :=
  InternalReals.Rat.mk ⟨5, 6, by decide⟩

 theorem diamond_orderingFractionIRat :
    orderingFractionIRat fourEvents diamondPrec = iFiveSixths := ...
```

The proof may not be `by decide` if internal rational quotient equality is not decidable or not reducible.
It should be provable by `Quotient.sound` and cross multiplication:

\[ 10/12 = 5/6 \]

If using unreduced `mkIRatFrac`, `diamond` gives `10/12`, so theorem can either say:

```lean
def iTenTwelfths : InternalReals.Rat := ...

theorem diamond_orderingFractionIRat_raw :
    orderingFractionIRat fourEvents diamondPrec = iTenTwelfths := rfl_or_by_decide
```

and then separately:

```lean
theorem iTenTwelfths_eq_iFiveSixths : iTenTwelfths = iFiveSixths := ...
```

### Real embedding

```lean
def rFiveSixths : InternalReals.RReal :=
  InternalReals.RReal.ofRat iFiveSixths

 theorem diamond_orderingFractionReal :
    orderingFractionReal fourEvents diamondPrec = rFiveSixths := ...
```

This follows from the rational theorem by congruence.

### Bounds

For any strict causal relation over a duplicate-free finite list, ordering fraction lies in `[0,1]`.
This may require a no-duplicate hypothesis and a theorem that apex count ≤ ordered pair count / 2.

First-stage weaker theorem:

```lean
theorem diamond_orderingFractionReal_nonnegative :
    InternalReals.RReal.zero ≤ orderingFractionReal fourEvents diamondPrec := ...
```

Maybe too proof-heavy.
A more local theorem with rationals:

```lean
theorem mkIRatFrac_nonneg (n d : Nat) :
    InternalReals.Rat.zero ≤ mkIRatFrac n d := ...
```

If the internal rational order API has the needed lemmas.

Second-stage theorem:

```lean
theorem orderingFractionReal_bounds
    {E : Type} [DecidableEq E] (es : List E) (prec : E → E → Bool)
    (hstrict : ∀ e, prec e e = false)
    (hantisymm : ∀ x y, prec x y = true → prec y x = true → False)
    (hnodup : es.Nodup) :
    0 ≤ orderingFractionReal es prec ∧ orderingFractionReal es prec ≤ 1 := ...
```

This is useful but not necessary for the first version.

### Independence lifts to real projection

The existing theorem proves different rational ordering fractions for diamond, chain, and antichain.
The real-projection theorem should say their real projections are also distinct, but this requires injectivity of `RReal.ofRat`, which exists for internal rationals (`ofRat_injective`) but not for core `Rat`.
If using internal rationals, it is possible.

```lean
theorem geometry_independent_of_topology_real_projection :
    strictClassifying = ⟨ClosureRegime.strict, true, nscCount, 0⟩
    ∧ orderingFractionReal fourEvents diamondPrec ≠ orderingFractionReal fourEvents chainPrec
    ∧ orderingFractionReal fourEvents chainPrec ≠ orderingFractionReal fourEvents antichainPrec
    ∧ orderingFractionReal fourEvents diamondPrec ≠ orderingFractionReal fourEvents antichainPrec := ...
```

This may be too much if the internal rational equality proofs are nontrivial.
A staged theorem can state the raw internal rational inequality first.

## Honest scope declaration

Include a long module doc section:

- Built: internal rational and internal real projection of ordering fraction.
- Not built: Gamma function, calibration function `f(d)`, inverse `f⁻¹`, actual `d_MM`.
- Future path: `GammaApprox`, `MyrheimMeyerCalibration`, `dMM_interval_estimator`.

## Main bundled theorem

```lean
/-- The Myrheim--Meyer rational input has an internally-derived real projection; the
diamond's projection is `5/6`, while the full Gamma/inversion dimension remains out of scope. -/
theorem myrheim_meyer_real_projection_diamond :
    orderingFractionReal fourEvents diamondPrec = rFiveSixths := ...
```

Potentially bundle with a scope theorem:

```lean
/-- What this module proves and what it does not prove. -/
theorem myrheim_meyer_real_projection_scope :
    orderingFractionReal fourEvents diamondPrec = rFiveSixths
    ∧ True := ...
```

Do not encode “not proving Gamma” as a theorem; document it.

## What this node buys

- Partial unblocking of real-valued Lorentzian dimension theory.
- A clean way to say RelMath has moved beyond rational-only causal geometry.
- A basis for interval estimators and continuous calibration later.

## Risk / scope discipline

- Do not claim `d_MM` is formalized.
- Do not fake Gamma.
- Avoid bridging core `Rat` to internal `Rat` unless necessary; direct internal fraction is cleaner.

---

# 8. `RelMath.Lorentzian.ParaconsistentConeField`

## Purpose

Develop paraconsistent causal cones for contradictory, incomplete, or multi-agent causal observations.
This is not a claim that physical spacetime is paraconsistent.
It is a claim that **causal knowledge** can be paraconsistent: reports may say both “x can affect y” and “x cannot affect y,” or neither.

This node is important because `LaxSlackDiagnosis` proves that genuine lax-idempotence slack cannot exist on antisymmetric carriers.
If RelMath wants stable contradiction dynamics and nontrivial lax closure, it needs a non-thin/preorder-like value carrier.

## Proposed file(s)

This may need two files:

```text
RelMath/Value/PreValueCategory.lean
RelMath/Lorentzian/ParaconsistentConeField.lean
```

If avoiding a new value module for now, put a local `PreValueCategory` in the Lorentzian file, but the reusable value-layer module is cleaner.

## Proposed imports

```lean
import RelMath.Closure.LaxSlackDiagnosis
import RelMath.Lorentzian.ConeField
import RelMath.Language.Positing
import RelMath.Value.SettlingOverValueCategory
```

`SettlingOverValueCategory` currently requires antisymmetry.
This node exists partly because that is too thin for lax contradiction dynamics.

## Stage 1: `PreValueCategory`

Define a non-antisymmetric value carrier abstraction:

```lean
namespace RelMath
namespace ValueSettling

/-- A pre-value category: a preorder with seed, not necessarily antisymmetric. -/
structure PreValueCategory where
  carrier : Type
  le : carrier → carrier → Prop
  le_refl : ∀ a, le a a
  le_trans : ∀ {a b c}, le a b → le b c → le a c
  bot : carrier
```

Closure without strict idempotence:

```lean
/-- A lax closure over a preorder-valued carrier. -/
structure LaxVClosure (V : PreValueCategory) where
  op : V.carrier → V.carrier
  infl : ∀ v, V.le v (op v)
  mono : ∀ {v w}, V.le v w → V.le (op v) (op w)
  kz : ∀ v, V.le (op (op v)) (op v)
```

Note: if the old strict `VClosure` has `idem`, this lax version has the KZ inequality instead.
On antisymmetric carriers, `kz + infl` collapses to idempotence by `LaxSlackDiagnosis.kz_strict_of_antisymm`.

Define genuine slack:

```lean
def HasLaxSlack {V : PreValueCategory} (T : LaxVClosure V) (v : V.carrier) : Prop :=
  V.le (T.op (T.op v)) (T.op v) ∧ T.op (T.op v) ≠ T.op v
```

Theorem:

```lean
theorem laxSlack_witnesses_nonantisymmetry
    {V : PreValueCategory} (T : LaxVClosure V) (v : V.carrier)
    (h : HasLaxSlack T v) :
    V.le (T.op (T.op v)) (T.op v)
    ∧ V.le (T.op v) (T.op (T.op v))
    ∧ T.op (T.op v) ≠ T.op v :=
  ⟨h.1, T.infl (T.op v), h.2⟩
```

This is the preorder version of the existing `lax_slack_witnesses_antisymmetry_failure` theorem.

Also prove collapse under antisymmetry:

```lean
theorem laxClosure_idem_of_antisymm
    {V : PreValueCategory}
    (hanti : ∀ x y, V.le x y → V.le y x → x = y)
    (T : LaxVClosure V) (v : V.carrier) :
    T.op (T.op v) = T.op v :=
  hanti _ _ (T.kz v) (T.infl (T.op v))
```

This is the reusable generalization.

## Stage 2: paraconsistent causal reports

Use `Charge` values to mark causal relation reports:

Suggested reading:

- `Charge.tTop`: affirmative causal reachability report.
- `Charge.fTop` if available / truth-false charge: anti-causal/no-reachability report.
- `Charge.kTop`: both affirmative and negative report, inconsistent causal report.
- `Charge.kBot`: neither / unknown.

Check actual constructors/names in `Positing`.
Existing docs refer to `Charge.tTop`, `Charge.kTop`, `Charge.kBot`.
The false-designated charge name must be verified.

Define:

```lean
/-- A paraconsistent causal relation reports a charge for each ordered event pair. -/
abbrev ConeReport (E : Type) := E → E → Charge
```

Predicates:

```lean
def ReportsReachable (R : ConeReport E) (x y : E) : Prop :=
  -- charge has truth component

def ReportsInconsistent (R : ConeReport E) (x y : E) : Prop :=
  R x y = Charge.kTop

def ReportsUnknown (R : ConeReport E) (x y : E) : Prop :=
  R x y = Charge.kBot
```

Use existing `Charge.isTruthFiring` if appropriate.

Define charged future cone:

```lean
def ChargedFuture (R : ConeReport E) (x : E) : E → Charge :=
  fun y => R x y
```

Define report merge under knowledge join:

```lean
def mergeReports (R S : ConeReport E) : ConeReport E :=
  fun x y => Charge.joinK (R x y) (S x y)
```

Then theorem:

```lean
theorem mergeReports_comm ... := by funext x y; exact Charge.joinK_comm ...
```

depending on available charge join theorems.

## Stage 3: consistency collapse to Boolean causal cones

Define when a charged report agrees with a Boolean causal relation:

```lean
def ExtendsBooleanCausality (C : CausalSet E) (R : ConeReport E) : Prop :=
  ∀ x y, C.reaches x y → ReportsReachable R x y
```

Define consistency:

```lean
def ConsistentConeReport (R : ConeReport E) : Prop :=
  ∀ x y, ¬ ReportsInconsistent R x y
```

The collapse theorem should say that a consistent, complete charged relation determines a Boolean relation.
But this requires a careful API for truth/false components of `Charge`.

## Main theorem targets

### Laxness requires non-thin carrier

This is the key theorem of the node:

```lean
theorem genuine_lax_cone_needs_non_thin_carrier
    {V : PreValueCategory} (T : LaxVClosure V) (v : V.carrier)
    (h : HasLaxSlack T v) :
    ∃ x y, V.le x y ∧ V.le y x ∧ x ≠ y :=
  ⟨T.op (T.op v), T.op v, h.1, T.infl (T.op v), h.2⟩
```

This is the structural justification for paraconsistent/lax cone carriers.

### Boolean cones embed as consistent reports

Once charge predicates are stable:

```lean
def booleanConeReport (prec : E → E → Bool) : ConeReport E := ...

theorem booleanConeReport_consistent ... : ConsistentConeReport (booleanConeReport prec) := ...
```

### Report merge accumulates knowledge

```lean
theorem mergeReports_infl_left (R S : ConeReport E) :
    ∀ x y, Charge.leK (R x y) (mergeReports R S x y) = true := ...
```

This connects paraconsistent reports to settling: merging reports climbs in knowledge order.

## What this node buys

- The value-carrier generalization needed for genuine lax closure.
- A formal distinction between physical causality and causal knowledge/reporting.
- A substrate for contradictory light observations, agent traces, provenance conflicts, and inconsistent causal reconstructions.
- A principled reason to move beyond antisymmetric `ValueCategory`.

## Risk / scope discipline

- Do not claim physical causality is inconsistent.
- Make clear that paraconsistency lives in the report/observation layer.
- Do not break existing `ValueCategory`; add `PreValueCategory` alongside it.
- Avoid proving fake non-thin examples unless the carrier really has distinct equivalent points.

---

# 9. `RelMath.Lorentzian.CausalNet`

## Purpose

Build an AQFT-style causal net projection: assign structured data to causal regions, functorially over inclusions, with spacelike separation giving an independence/commutation projection.

This should not try to formalize operator algebras.
RelMath already has quantales, Q-categories, sheaves, and value categories.
The honest version is:

> causal regions form an inclusion category; a causal net is a monotone/functorial assignment of values/algebras/sections to regions; spacelike-separated regions carry a symmetric independence relation.

## Proposed file

```text
RelMath/Lorentzian/CausalNet.lean
```

## Proposed imports

```lean
import RelMath.Lorentzian.ConeField
import RelMath.Lorentzian.CausalAlexandrovTopology
import RelMath.Cohomology.QuantaleEnrichedSheaf
import RelMath.Language.Predicating.TemporalTwoCategory
```

The first version can avoid `TemporalTwoCategory`; include it later if building a genuine category of regions with 2-cells.

## Core definitions

```lean
namespace RelMath
namespace Lorentzian
namespace CausalNet

open RelMath.Lorentzian.Causal
open RelMath.Lorentzian.ConeField
open RelMath.QEnriched
```

Regions as predicates:

```lean
/-- A causal region is a predicate on events. -/
abbrev Region (E : Type) := E → Prop
```

Inclusion:

```lean
def RegionLe {E : Type} (U V : Region E) : Prop :=
  ∀ x, U x → V x
```

Future-closed regions:

```lean
def FutureClosedRegion {E : Type} (C : CausalSet E) (U : Region E) : Prop :=
  ∀ {x y}, U x → CausalLe C x y → U y
```

Diamond regions:

```lean
def DiamondRegion {E : Type} (C : CausalSet E) (a b : E) : Region E :=
  ConeField.ClosedDiamond C a b
```

Spacelike-separated regions:

```lean
def SpacelikeRegions {E : Type} (C : CausalSet E) (U V : Region E) : Prop :=
  ∀ x y, U x → V y → x ≠ y → ConeField.Spacelike C x y
```

Maybe do not require `x ≠ y`; if regions overlap, spacelike separation should fail unless overlap is empty.
Alternative:

```lean
def SpacelikeRegions C U V : Prop :=
  ∀ x y, U x → V y → ¬ CausalLe C x y ∧ ¬ CausalLe C y x
```

But because `CausalLe` is reflexive, this implies disjointness.
That is cleaner:

```lean
def SpacelikeRegions {E : Type} (C : CausalSet E) (U V : Region E) : Prop :=
  ∀ x y, U x → V y → ¬ CausalLe C x y ∧ ¬ CausalLe C y x
```

This makes disjointness automatic.

## Region category

A minimal category of regions:

```lean
structure RegionCat (E : Type) where
  obj : Type := Region E
```

Maybe no need.
Simpler definitions:

```lean
theorem regionLe_refl {E} (U : Region E) : RegionLe U U := fun _ h => h

theorem regionLe_trans {E} {U V W : Region E} :
    RegionLe U V → RegionLe V W → RegionLe U W :=
  fun hUV hVW x hx => hVW x (hUV x hx)
```

If a category is desired, use `Temporal.
Category` minimal category structure from `TemporalTwoCategory`:

```lean
def regionCategory (E : Type) : Temporal.Category where
  Obj := Region E
  Hom U V := RegionLe U V
  id := ...
  comp := ...
  id_comp := propext/proof-irrelevance issue
```

Since `Hom` is `Prop`, equality of morphisms may require proof irrelevance.
RelMath has used `Prop` proof irrelevance in temporal category; reuse that style.

## Causal net structure

A first-order net over a value category:

```lean
/-- A causal net valued in a type of local data. -/
structure CausalNet {E : Type} (C : CausalSet E) where
  Local : Region E → Type
  restrict : ∀ {U V : Region E}, RegionLe U V → Local V → Local U
  restrict_id : ∀ {U : Region E} (x : Local U), restrict (regionLe_refl U) x = x
  restrict_comp : ∀ {U V W : Region E}
    (hUV : RegionLe U V) (hVW : RegionLe V W) (x : Local W),
      restrict hUV (restrict hVW x) = restrict (regionLe_trans hUV hVW) x
```

This is a presheaf on the region inclusion category.
AQFT nets are often covariant by inclusion of algebras; sheaves/presheaves are contravariant by restriction.
RelMath should probably support both:

```lean
structure IsotoneCausalNet {E : Type} (C : CausalSet E) where
  Local : Region E → Type
  include : ∀ {U V}, RegionLe U V → Local U → Local V
  include_id : ...
  include_comp : ...
```

The AQFT-style algebra net is isotone.
The sheaf-style observation net is contravariant.
Build both only if useful; otherwise pick one and document direction.

## Q-valued net

Using `QuantaleEnrichedSheaf`, define a Q-valued region relation:

```lean
structure QCausalNet {E : Type} (C : CausalSet E) (Q : Quantale) where
  weight : Region E → Q.carrier
  mono : ∀ {U V}, RegionLe U V → Q.le (weight U) (weight V)
```

This is a low-cost Q-enriched projection: larger regions carry at least as much value/observable content.

A richer version:

```lean
structure QRegionCat {E : Type} (C : CausalSet E) (Q : Quantale) where
  hom : Region E → Region E → Q.carrier
  refl : ∀ U, Q.le Q.one (hom U U)
  comp : ∀ U V W, Q.le (Q.mul (hom U V) (hom V W)) (hom U W)
```

But this is just `QCat Q` with objects `Region E`.
Prefer reusing `QCat` directly:

```lean
def regionQCat (C : CausalSet E) (Q : Quantale) : QCat Q := ...
```

This needs a concrete `hom` value.
For the `Charge` quantale:

- `hom U V = kTop` if `RegionLe U V`.
- `hom U V = kBot` otherwise.

But deciding `RegionLe U V` over arbitrary predicates is not constructive.
For finite/decidable regions represented by lists, it is possible.
Therefore initial `CausalNet` should avoid a full QCat over arbitrary Prop regions unless decidability is supplied.

## Spacelike commutation/independence projection

Since no operator algebras are present, define an abstract independence relation:

```lean
structure IndependentNet {E : Type} (C : CausalSet E) where
  Local : Region E → Type
  Indep : ∀ U V, Local U → Local V → Prop
  indep_symm : ∀ U V a b, Indep U V a b → Indep V U b a
  spacelike_indep : ∀ U V, SpacelikeRegions C U V → ∀ a b, Indep U V a b
```

This is an honest AQFT projection:

- not “operators commute,” but “spacelike separated local data are independent under the net’s independence relation.”
- a later algebraic instance can make `Indep` mean commutation.

## Theorem targets

### Region inclusion is preorder

```lean
theorem regionLe_preorder {E : Type} :
    (∀ U : Region E, RegionLe U U)
    ∧ (∀ U V W : Region E, RegionLe U V → RegionLe V W → RegionLe U W) := ...
```

### Spacelike symmetry

```lean
theorem spacelikeRegions_symm {E : Type} (C : CausalSet E) {U V : Region E} :
    SpacelikeRegions C U V → SpacelikeRegions C V U := by
  intro h y x hy hx
  have hxy := h x y hx hy
  exact ⟨hxy.2, hxy.1⟩
```

### Spacelike regions are disjoint

Using reflexivity:

```lean
theorem spacelikeRegions_disjoint {E : Type} (C : CausalSet E) {U V : Region E} :
    SpacelikeRegions C U V → ∀ x, ¬ (U x ∧ V x) := by
  intro h x hx
  have hxx := h x x hx.1 hx.2
  exact hxx.1 (causalLe_refl C x)
```

### Isotony of diamond regions

If endpoints are nested, diamonds include:

```lean
theorem closedDiamond_mono {E : Type} (C : CausalSet E) {a a' b b' : E} :
    CausalLe C a' a → CausalLe C b b' →
      RegionLe (ConeField.ClosedDiamond C a b) (ConeField.ClosedDiamond C a' b') := ...
```

Proof:

If `x` satisfies `a ≤ x ≤ b`, and `a' ≤ a`, `b ≤ b'`, then by transitivity `a' ≤ x ≤ b'`.

This is a very useful causal-region theorem.

### Independent net theorem

```lean
theorem spacelike_independence_symmetric
    {E : Type} (C : CausalSet E) (N : IndependentNet C) {U V : Region E}
    (h : SpacelikeRegions C U V) :
    (∀ a b, N.Indep U V a b) ∧ (∀ b a, N.Indep V U b a) :=
  ⟨N.spacelike_indep U V h,
   fun b a => N.indep_symm U V a b (N.spacelike_indep U V h a b)⟩
```

## Main bundled theorem

```lean
/-- Causal regions form an inclusion preorder; closed diamonds are monotone in their
endpoints; spacelike separated regions are symmetric, disjoint, and independent in any
independent causal net. -/
theorem causal_net_region_theory {E : Type} (C : CausalSet E) :
    (∀ U : Region E, RegionLe U U)
    ∧ (∀ U V W : Region E, RegionLe U V → RegionLe V W → RegionLe U W)
    ∧ (∀ U V : Region E, SpacelikeRegions C U V → SpacelikeRegions C V U)
    ∧ (∀ U V : Region E, SpacelikeRegions C U V → ∀ x, ¬ (U x ∧ V x)) := ...
```

## What this node buys

- A finite AQFT-style causal net substrate.
- A bridge from causal regions to sheaves/presheaves/Q-valued data.
- A clean place to formalize isotony and spacelike independence without operator algebra overclaim.
- Future compatibility with quantale-enriched sheaves.

## Risk / scope discipline

- Do not claim full AQFT.
- Do not claim operator commutation unless an algebra of operators is actually built.
- Avoid QCat over arbitrary Prop-valued regions unless decidability of inclusion is available.

---

# Suggested dependency order

The nine nodes should be built in this order:

```text
1. Lorentzian.ConeField
2. Lorentzian.CausalAlexandrovTopology
3. Lorentzian.LightObservation
5. Lorentzian.CausalLaplacian
6. Lorentzian.DiamondSpectralPortrait
4. Lorentzian.MicrolocalSupport
7. Lorentzian.MyrheimMeyerRealProjection
8. Value.PreValueCategory + Lorentzian.ParaconsistentConeField
9. Lorentzian.CausalNet
```

Why this order differs slightly from the conceptual order:

- `CausalLaplacian` is easier once `ConeField` exists and should be built before `DiamondSpectralPortrait`.
- `MicrolocalSupport` can be built earlier, but its event-propagation story benefits from `CausalLaplacian` and `ConeField` being stable.
- `ParaconsistentConeField` is deeper because it forces a value-layer generalization.
- `CausalNet` is conceptually broad and should reuse stable region/cone/topology definitions.

# Compact agent prompt

Use this if handing the batch to a coding agent:

```text
Study RelMath/Lorentzian/Causal.lean, RelMath/Lorentzian/MyrheimMeyer.lean, RelMath/Cohomology/AlexandrovHusainov.lean, RelMath/Dynamics/Flow/TransfiniteClosureFlow.lean, RelMath/Dynamics/Flow/ClosureFlowCurvatureRegime.lean, RelMath/Dynamics/Flow/LawvereLaplacianSpectralGap.lean, RelMath/Calculus/Real/InternalReals.lean, and RelMath/Closure/LaxSlackDiagnosis.lean.

Implement the light-cone red-node batch in dependency order. Preserve the no-free-data invariant: no axioms, no sorry/admit/opaque/constant/Classical/native_decide. Prefer small theorem bundles and honest scope docs. First build ConeField: Future/Past/CausalLe/Spacelike/Diamond and order laws. Then instantiate Alexandrov topology at CausalLe. Then build observation signatures and full-observer reconstruction. Then build causal event-section closure/Laplacian with harmonic iff future-closed. Then bundle the Fin 4 diamond portrait. Only after those are green, add NSC singular-support projection, internal-real Myrheim-Meyer projection, prevalue/non-thin paraconsistent cones, and causal nets.
```

# Expected final shape

If all nine nodes are built, RelMath will have a new layer that can be described accurately as:

> a dependency-free formal bridge from finite causal-set light cones to Alexandrov causal topology, finite light-observation reconstruction, causal propagation closure, Lawvere/Tarski harmonic sections, NSC singular-support projections, internal-real dimension inputs, paraconsistent causal report cones, and AQFT-style causal nets.

That is not “general relativity in Lean.” It is something more RelMath-native and arguably stranger:

> **cone/order/propagation geometry generated by settling.**
