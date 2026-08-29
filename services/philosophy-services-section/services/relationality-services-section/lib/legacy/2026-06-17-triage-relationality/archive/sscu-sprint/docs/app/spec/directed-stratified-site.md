---
title: Directed Stratified Site Simulation
tags:
  - simulation
  - site
  - directed
layer: spec
status: plan
depends-on:
  - theorem/external/relational-directed-stratified-infinity-sites
  - theorem/internal/stratified-infinity-site-structure
  - math/structure/admissible-morphism
  - theorem/internal/admissible-normal-form-structure
  - math/operator/flow-normalization-compatibility
enacts: idea
part-of: relational-computer
in-domain: science/relationality
description: "Instantiates the directed stratified infinity-site as finite carriers and views over existing recognitions and flows."# Directed Stratified Site Simulation

This specification instantiates the directed stratified ∞‑site earned by the
profile/discipline/filter/tower acts and the Infinity‑Site theorem as *finite
carriers and views over existing recognitions and flows*. It fixes concrete
carriers and interfaces for:

- the stratified ∞-site structure `(C, (tau), σ)`,
- the admissible morphism structure `(Adm, Gen, Obs)`,
- the normalization map `N∞` on admissible morphisms, and
- flows compatible with that normalization.

## 1. State representation (views over the kernel)

- **Objects.**  
  A carrier `Obj` representing site objects with at least:
  - `id`: stable identifier for an underlying recognition or profile object
    already present in the global state,
  - `stratum`: integer stratification level `σ(id)`,
  - `meta`: metadata for discipline/filter configuration at that object.

- **Morphisms.**  
  A carrier `Mor` representing directed morphisms with at least:
  - `id`: stable identifier,
  - `src, dst`: objects in `Obj` (so ultimately recognitions in the kernel),
  - `shape`: decomposition data exposing generative/observational/(tau) components,
  - `meta`: additional metadata (e.g., declared variance).

- **Covers.**  
  A carrier `Cover` with:
  - `apex`: object being covered,
  - `legs`: list of morphisms in `Mor` realising a (tau)-cover in the sense of the
    stratified ∞-site structure.

- **Diagrams and higher cells.**  
  A carrier `Diag` collecting finite pasting diagrams built from `Obj`, `Mor`,
  and `Cover`, together with higher-cell witnesses of gluing and factorisation.

These carriers instantiate *finite slices* of the structures asserted in the
stratified ∞‑site and admissible‑morphism theorems; implementations may refine
them but must preserve the earned structure and treat `Obj`/`Mor`/`Cover`/`Diag`
as views over recognitions, not as an independent site database.

## 2. Interfaces

### 2.1 Stratification and variance

- `stratum : Obj → ℕ`  
  Returns the stratification level `σ` for a given object.

- `variance : Mor → {-1,0,+1}`  
  Returns the declared variance for a morphism (e.g., covariant, contravariant,
  or neutral), used in the stratified polarity condition.

### 2.2 Admissibility and factorisation

- `is_admissible : Mor → bool`  
  Checks the admissibility conditions from **Theorem (Admissible Morphism
  Structure)**:
  - stratified polarity (A1),
  - sheaf-sound locality against (tau)-covers (A2),
  - existence of the generative/observational factorisation (A3).

- `factorize : Mor → (Gen, Obs)`  
  Computes the functorial factorisation `f = m ∘ e` with `e ∈ Gen`, `m ∈ Obs`
  for admissible morphisms. On non-admissible morphisms it must either fail or
  return a value explicitly marked as non-admissible.

### 2.3 Rewrite kernel and normal forms

- `step_beta : Mor → Mor?`  
  Implements (beta)-like reductions between `Gen` and `Obs` components when
  applicable.

- `step_eta : Mor → Mor?`  
  Implements (eta)-like collapses of redundant expansion/observation pairs.

- `step_tau : Mor → Mor?`  
  Implements (tau)-like coherence/glue steps induced by coverage.

- `normal_form : Mor → Mor`  
  Computes the canonical normal form `N∞(f)` as in **Theorem (Normal Forms on
  Admissible Morphisms)**. For admissible morphisms, the result must satisfy:
  - termination of the (beta)/(eta)/(tau) rewrite sequence,
  - uniqueness up to the earned equivalences,
  - greedy factorisation `f_nf = m* ∘ e*` with maximal `Gen` and minimal `Obs`.

## 3. Flows and contracts

- `flow_eval : (t, Mor) → Mor`  
  Evaluation flow implementing admissible dynamics over morphisms and respecting
  the stratified ∞-site structure (stratum safety, coverage continuity, and
  admissibility preservation).

- `flow_norm : (t, Mor) → Mor`  
  Normalisation flow contracting morphisms toward `normal_form`. At `t = ∞`,
  `flow_norm(∞, f)` must coincide with `normal_form(f)` on admissible
  morphisms.

The following contract must hold, as required by **Theorem (Flow–Normalization
Compatibility)**:

- For all admissible `f` and all admissible times `t`,
  `normal_form(flow_eval(t, f))` and
  `normal_form(flow_eval(t, normal_form(f)))` belong to the same nucleus class
  in the sense of the flow–nucleus geometry.

Implementations should treat violations of this contract as invariant failures.

## 4. Invariants and tests

Implementations of this spec must enforce at least the following invariants:

- **Safety.**  
  Reject any `f : X → Y` whose stratification difference violates the admissible
  variance:
  `|σ(Y) − σ(X)|` must match the declared `variance(f)` or be zero.

- **Locality.**  
  For each cover `{U_i → X}` and admissible `f : X → Y`, admissibility of
  pullbacks `U_i ×_X Y` and their gluing implies admissibility of `f`.

- **Critical pairs.**  
  For the core rewrite combinators ((beta), (eta), (tau)), overlapping redexes must admit
  joins up to equivalence; property-based tests should generate such overlaps
  and check joinability after rewriting.

- **Termination monitor.**  
  A multigraded measure (e.g., generative size, observational size, (tau)-defect)
  must decrease strictly on each rewrite step, ensuring that `normal_form`
  terminates for admissible morphisms.

## 5. Outputs

- A concrete encoding of objects, morphisms, covers, and diagrams implementing
  the stratified ∞-site structure.
- A rewrite kernel and normal-form operation implementing the admissible
  morphism and normalization structure.
- Evaluation and normalisation flows that satisfy the flow–normalisation
  compatibility contract.
- Diagnostics and test artefacts for coverage stability, tower coherence, and
  rewrite invariants.
