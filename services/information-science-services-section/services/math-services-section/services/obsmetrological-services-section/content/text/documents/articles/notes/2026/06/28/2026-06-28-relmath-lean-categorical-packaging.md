---
title: "Two Orthogonal Orders for a Lean Library: Categorical Packaging and Namespace Law for RelMath"
author:
  - Morgan Sennhauser
  - The 561 Group
date: 2026-06-28
abstract: "A Lean library has at least two mathematically real organizational structures: a module/import structure, determined by source files and build dependencies, and a declaration/name structure, determined by the public constants, namespaces, notation, and theorem handles introduced into Lean environments. In small developments these structures are often allowed to coincide. In a large dependency-free mathematical corpus such as RelMath, forcing them to coincide is a category error: the proof tree asks \"where does this result become derivable?\", while the public namespace asks \"which mathematical object owns this operation or theorem?\" We give a categorical account of this separation using the standard semantics of dependent type theory by contextual categories, comprehension categories, and categories with families, together with Lean's concrete module and namespace system. The central conclusion is a two-axis law. File paths must encode the derivation stratum: the ordered proof tree from primitive marks through articulation, language, calculus, site, closure, cohomology, dynamics, persistence, and relational subject theories. Declaration namespaces must encode mathematical object ownership: the carrier, structure, fibration, site, cohomology theory, dynamical object, persistence invariant, or relational domain that owns the API. We apply this law to the live RelMath library, whose current top-level directory graph mixes proof strata, received-math calculi, public objects, and relational subject theories as peers. The result is a normative refactor plan: no shims, no compatibility aliases, no legacy modules; a complete move toward stratum-indexed file paths, object-owned namespaces, theorem names aligned with Lean/mathlib practice, and blueprint handles updated to the resulting public API."link-citations: true
reference-section-title: "References"
references:
  - id: lean-reference-modules
    type: webpage
    title: "The Lean Language Reference: Source Files and Modules"
    URL: "https://lean-lang.org/doc/reference/latest/Source-Files-and-Modules/"
    issued:
      date-parts:
        - [2026]

  - id: lean-reference-namespaces
    type: webpage
    title: "The Lean Language Reference: Namespaces and Sections"
    URL: "https://lean-lang.org/doc/reference/latest/Namespaces-and-Sections/"
    issued:
      date-parts:
        - [2026]

  - id: tpil4-dependent-type-theory
    type: webpage
    title: "Theorem Proving in Lean 4: Dependent Type Theory"
    author:
      - family: Avigad
        given: Jeremy
      - family: de Moura
        given: Leonardo
      - family: Kong
        given: Soonho
      - family: Ullrich
        given: Sebastian
    URL: "https://lean-lang.org/theorem_proving_in_lean4/Dependent-Type-Theory/"
    issued:
      date-parts:
        - [2024]

  - id: moura-ullrich-2021-lean4
    type: paper-conference
    title: "The Lean 4 Theorem Prover and Programming Language"
    author:
      - family: de Moura
        given: Leonardo
      - family: Ullrich
        given: Sebastian
    container-title: "Automated Deduction -- CADE 28"
    publisher: "Springer"
    page: "625-635"
    issued:
      date-parts:
        - [2021]
    DOI: "10.1007/978-3-030-79876-5_37"

  - id: mathlib-community-2020
    type: article-journal
    title: "The Lean Mathematical Library"
    author:
      - literal: "The mathlib Community"
    container-title: "CPP 2020: Proceedings of the 9th ACM SIGPLAN International Conference on Certified Programs and Proofs"
    page: "367-381"
    issued:
      date-parts:
        - [2020]
    DOI: "10.1145/3372885.3373824"
    URL: "https://arxiv.org/abs/1910.09336"

  - id: mathlib-naming
    type: webpage
    title: "Mathlib Naming Conventions"
    author:
      - literal: "Lean community"
    URL: "https://leanprover-community.github.io/contribute/naming.html"
    issued:
      date-parts:
        - [2026]

  - id: cartmell-1986
    type: article-journal
    title: "Generalised Algebraic Theories and Contextual Categories"
    author:
      - family: Cartmell
        given: John
    container-title: "Annals of Pure and Applied Logic"
    volume: 32
    page: "209-243"
    issued:
      date-parts:
        - [1986]

  - id: dybjer-1996
    type: paper-conference
    title: "Internal Type Theory"
    author:
      - family: Dybjer
        given: Peter
    container-title: "Types for Proofs and Programs"
    publisher: "Springer"
    page: "120-134"
    issued:
      date-parts:
        - [1996]
    DOI: "10.1007/3-540-61780-9_66"

  - id: jacobs-1999
    type: book
    title: "Categorical Logic and Type Theory"
    author:
      - family: Jacobs
        given: Bart
    publisher: "Elsevier"
    collection-title: "Studies in Logic and the Foundations of Mathematics"
    volume: 141
    issued:
      date-parts:
        - [1999]

  - id: relmath-readme
    type: document
    title: "RelMath README"
    URL: "sites/relationality.dev.emsenn.net/lean/README.md"
    issued:
      date-parts:
        - [2026, 6, 28]

  - id: relmath-makefile
    type: document
    title: "RelMath Makefile"
    URL: "sites/relationality.dev.emsenn.net/lean/Makefile"
    issued:
      date-parts:
        - [2026, 6, 28]
date-created: 2026-06-28
description: The question is not whether RelMath needs better names.
---

# 1. Problem

The question is not whether RelMath needs better names.
It does.
The question is what kind of names can be lawful.

A Lean formalization has two different forms of order.

First, it has a **module order**.
Source files are elaborated into Lean environments.
Imports determine which already-elaborated environments are available.
The build system therefore sees a graph of files and imports.

Second, it has a **declaration order**.
The public mathematical surface consists of names of constants: structures, inductive types, definitions, theorems, instances, notation, attributes, and namespace-qualified handles.
This is what a reader sees in theorem statements, `#check`, API documentation, blueprint handles, and downstream imports.

In a tiny project one can pretend these are the same.
In RelMath that identification has failed.
The current library has a top-level directory tree in which `Closure`, `Cohomology`, `Order`, `Real`, `Material`, `Spacetime`, `Quantum`, `Plasma`, `Reaction`, and `Gaming` are peers.
But these are not the same kind of thing.
Some are proof strata, some are derived calculi, some are public mathematical objects, and some are relational subject theories.
The tree therefore does not say what kind of mathematical relation a file has to the rest of the library.

The purpose of this paper is to determine what the Lean package layout must be.
The determination has two hands:

- **Mathematical lawfulness:** RelMath is the inductive derivation tree of the 561 corpus.
  Filepaths must say where a result becomes derivable.
- **Lean conformance:** Lean modules, namespaces, and declaration names have established meanings and practices.
  The library must use those mechanisms according to their nature.

The conclusion is that RelMath must use exactly two canonical packaging axes:

1. **File paths encode derivation stratum.**
2. **Declaration namespaces encode mathematical object ownership.**

All other taxonomies are real but secondary.

# 2. Lean Libraries as Categorical Objects

## 2.1 Modules as an import category

Let `M` be the finite directed graph whose vertices are Lean source files and whose edges point from a module to the modules it imports.
Since Lean elaborates imports before importers, a well-formed build has no import cycles.
Equivalently we may work with the generated preorder:

```text
A <= B  iff  B depends on A by a path of imports.
```

Call this preorder the **module category** of the library.
Its objects are modules.
There is at most one morphism `A -> B`, witnessing that `A` is a prerequisite of `B`.

Lean's reference describes modules as elaborated source files whose environments are serialized and imported by later files [@lean-reference-modules].
The key categorical point is that an import is not a mathematical ownership statement.
It is a morphism of availability.
It says that the importing environment may use the imported environment.

Thus, if `B` imports `A`, then `A` is earlier in the proof context of `B`.
It does not follow that every declaration in `B` belongs under namespace `A`, nor that every declaration using an object from `A` should be named as if it were owned by `A`.

## 2.2 Environments as contexts

Lean is based on dependent type theory, powerful enough to express mathematical objects, specifications, and proofs in one language [@tpil4-dependent-type-theory].
Categorically, dependent type theory is studied through contextual categories [@cartmell-1986], comprehension categories [@jacobs-1999], and categories with families [@dybjer-1996].

For our purposes, the useful abstraction is:

- a context is an environment of assumptions and prior declarations;
- a type over a context is a family of possible terms depending on that context;
- a term is a section of such a family;
- substitution/reindexing is the action of a context morphism.

A Lean module elaborates commands into an environment.
Each new declaration extends the environment.
Imports provide previously constructed environments.
This is exactly the behavior one expects from a syntactic contextual category or category with families: later judgments are formed in contexts extended by earlier judgments.

This matters for packaging.
A file path should respect context extension.
A file that proves a theorem needing closure operators, site sections, and H1 should not live at the same derivation level as the file that introduces the primitive mark.
The path should express dependency of judgment formation.

## 2.3 Namespaces as a comprehension of public names

Lean namespaces are hierarchical prefixes for names [@lean-reference-namespaces].
They organize the constant namespace and guide lookup.
They are not the same as the module graph.

Given a module category `M`, each module elaborates into an environment.
Taking the public names of those environments gives a family over `M`:

```text
Names : M -> Set
```

where `Names(B)` contains the constants introduced or exposed by module `B`.
Namespace qualification is then a classifier on public names:

```text
owner : Names(B) -> Owner
```

where `Owner` is the mathematical object, carrier, structure, or theory to which the declaration belongs.

This is the crucial separation.
The module path is the base context.
The namespace is the classifier of the introduced public name.
There is no categorical reason these should be identical, and strong reasons they should not be when the proof context and public object ontology differ.

# 3. The Separation Theorem

## Definition 3.1: Derivation home

The **derivation home** of a declaration is the earliest stratum of the proof tree at which its statement is well-formed and its proof can be constructed without importing later strata.

This is a file-path notion.

## Definition 3.2: Ownership home

The **ownership home** of a declaration is the mathematical object, structure, or domain whose API the declaration extends.

This is a namespace notion.

## Theorem 3.3: Separation of derivation and ownership

In any Lean library whose mathematics has both a nontrivial proof dependency order and a nontrivial public object ontology, derivation home and ownership home cannot be forced to coincide without losing information.

### Proof sketch

Assume a single tree is used for both file paths and namespaces.

If the tree follows derivation, then a theorem about an object may be forced to live under the stratum where the proof becomes possible, even when the theorem is part of that object's public API.
Users looking for the theorem under the object will not find it.

If the tree follows ownership, then a theorem whose proof requires later machinery may be placed under an earlier object.
The file path will then either import later theory into an earlier stratum, producing conceptual back-edges, or hide the actual derivation order.

Therefore a single tree cannot preserve both relations.
A lawful Lean library must choose which relation controls file paths and which relation controls namespaces.

For RelMath, the choice is forced by its own README: the library is the inductive derivation tree of the corpus [@relmath-readme].
Therefore file paths must encode derivation.
Namespaces remain available for public object ownership.

# 4. Lean Practice As Right-Hand Constraint

Lean's concrete practice supports this separation.

The Lean module system gives build and elaboration structure.
The language reference treats source files and modules as elaborated environments that are imported by other modules [@lean-reference-modules].
Lake packages organize libraries and targets; RelMath has a single dependency-free `lean_lib` named `RelMath`.

Namespaces are independent hierarchical prefixes [@lean-reference-namespaces].
A declaration in one file may introduce names in a namespace whose prefix does not syntactically match the file path.
This is powerful but dangerous.
Used deliberately, it lets a library place a theorem in its derivation home while exposing it under its object owner.
Used casually, it hides ownership and produces the current RelMath problem.

Mathlib adds naming discipline.
Its naming guide recommends `UpperCamelCase` for types, structures, and classes; `snake_case` for proofs and theorem names; `lowerCamelCase` for ordinary term-level data and functions; and object-scoped names where the theorem is naturally a method of that object [@mathlib-naming].
RelMath should not imitate mathlib's dependency choices, since RelMath is dependency-free by mandate, but it should imitate these naming forms unless the 561 corpus has a stronger established name.

The mathlib paper also matters structurally.
It describes a unified library of formalized mathematics with hierarchy, automation, and distributed organization [@mathlib-community-2020].
RelMath is intentionally different--constructive, dependency-free, and corpus-derived--but it faces the same library-design fact: large formal mathematics requires coherent public names, not just compiling files.

# 5. RelMath Evidence

The live RelMath tree currently has:

- 253 Lean files under `RelMath/`.
- 253 direct imports in `RelMath.lean`.
- 27 top-level directory names plus root modules.
- A large cyclic component in the top-level directory dependency graph.

Strong cross-directory import edges include:

```text
Flow -> Closure: 20
Cohomology -> Site: 10
Persistence -> Positing: 10
Persistence -> Closure: 6
Predicating -> Positing: 5
Spacetime -> Order: 5
```

High fan-in modules include:

```text
RelMath.Order.OrderInfra
RelMath.Order.SetNumberGraphTheory
RelMath.Cohomology.SettlingCohomologyH1
RelMath.Closure.Regime
RelMath.Settling
RelMath.Closure.Operator
RelMath.Positing.Valuation
RelMath.Real.Internal
```

This is not merely messy.
It proves that top-level directories are currently not all expressing the same relation.

The current tree mixes:

- proof strata: `Closure`, `Cohomology`, `Flow`, `Persistence`;
- public objects or calculi: `Order`, `Real`, `Algebra`, `Probability`;
- relational subject theories: `Material`, `Spacetime`, `Quantum`, `Plasma`, `Fluid`, `Liquid`, `DenseMatter`, `Kinetic`, `Reaction`, `Thermo`, `Gaming`;
- small application or bridge areas: `Computing`, `Gaming`;
- historical public namespaces accidentally preserved as root names.

The tree therefore does not answer "where does this result become derivable?" or "which object owns this declaration?" reliably.
It answers both sometimes, and that is precisely the failure mode.

# 6. The Taxonomies That Are True

RelMath has more than two meaningful taxonomies.
They are all real:

## 6.1 Derivation stratum

The proof tree begins with primitive marks, articulation, and predication; moves through positing, valuation, and settling; then grows site, closure, cohomology, dynamics, persistence, and relational domain theories.

This is the filepath taxonomy.

## 6.2 Mathematical object ownership

Declarations belong to objects such as `Mark`, `Utterance`, `Articulating`, `Charge`, `Valuation`, `Closure`, `Site`, `Cohomology`, `Real`, `CausalSet`, `SoficShift`, and so on.

This is the namespace taxonomy.

## 6.3 Categorical role

Some declarations are objects, morphisms, fibrations, adjunctions, monads, coalgebras, sheaves, cohomology classes, invariants, or moduli witnesses.
This role matters for theorem names and docstrings, but it should not be the primary file tree.

## 6.4 Carrier layer

Many RelMath objects are carriers: value carriers, order carriers, site carriers, closure carriers, persistence carriers, relational domain carriers.
Carrier status often determines namespace ownership, but not every carrier deserves a top-level directory.

## 6.5 Relational subject domain

Material, spacetime, quantum, plasma, fluid, liquid, dense matter, kinetic, reaction, thermo, and gaming are genuine relational subject theories.
They are not decorative physical metaphors.
But they are subject-domain interpretations over the earlier relational machinery, so they should not be top-level peers of the machinery.

## 6.6 Maturity and frontier status

RelMath distinguishes green theorems, worked cases, research-grade bridges, blueprint frontier nodes, and roadmap obligations.
This taxonomy belongs in the blueprint, Verso manual, papers, and migration manifests, not in primary Lean module paths.

## 6.7 Exposition surface

The Lean library, blueprint graph, Verso manual, API docs, and cockpit site are separate surfaces.
Their organization should reflect but not dictate the Lean source tree.

# 7. The Two Canonical Axes

The two axes selected for the Lean library are:

```text
File path  = derivation stratum.
Namespace  = mathematical object ownership.
```

This is the only choice that satisfies both hands.

It satisfies mathematical lawfulness because the file tree remains the proof tree.
A reader can walk files in stratum order and see how later results are generated from earlier ones.

It satisfies Lean conformance because namespaces remain public API prefixes, module paths remain import/build units, and theorem names can follow Lean practice without pretending that every public object is a derivation stratum.

# 8. Target File Tree

The final RelMath filepath strata should be:

```text
RelMath/
  Primitive/
  Articulation/
  Language/
    Predicating/
    Positing/
  Calculus/
    Algebra/
    Order/
    Combinatorics/
    Real/
    LinearAlgebra/
    Probability/
    Optimization/
  Site/
  Closure/
  Cohomology/
  Dynamics/
    Flow/
    Firing/
    Blowup/
    Laplacian/
    Harmonic/
    Hodge/
    Curvature/
    Lyapunov/
    Spectrum/
  Persistence/
    Aperiodic/
      Witness/
      StepN/
  Relational/
    Material/
    Spacetime/
    Quantum/
    Plasma/
    Fluid/
    Liquid/
    DenseMatter/
    Kinetic/
    Reaction/
    Thermo/
    Gaming/
  Computing/
```

Root `RelMath.lean` must stop being a 253-line import scroll.
Each stratum gets a barrel module.
`RelMath.lean` imports the barrels in proof order.

```lean
import RelMath.Primitive
import RelMath.Articulation
import RelMath.Language
import RelMath.Calculus
import RelMath.Site
import RelMath.Closure
import RelMath.Cohomology
import RelMath.Dynamics
import RelMath.Persistence
import RelMath.Relational
import RelMath.Computing
```

The exact order may be adjusted by the import DAG, but the organizing principle must remain derivation order.

# 9. Target Namespace Law

The namespace tree is not identical to the filepath tree.
It is the public API.

Short public namespaces are reserved for central RelMath objects:

```text
RelMath.Mark
RelMath.Utterance
RelMath.Articulating
RelMath.Predicating
RelMath.Positing
RelMath.Charge
RelMath.Valuation
RelMath.Settling
RelMath.Closure
RelMath.Site
RelMath.Cohomology
RelMath.Dynamics
RelMath.Persistence
RelMath.Real
```

Relational subject theories must be namespaced as relational theories:

```text
RelMath.Relational.Material
RelMath.Relational.Spacetime
RelMath.Relational.Quantum
RelMath.Relational.Plasma
RelMath.Relational.Fluid
RelMath.Relational.Liquid
RelMath.Relational.DenseMatter
RelMath.Relational.Kinetic
RelMath.Relational.Reaction
RelMath.Relational.Thermo
RelMath.Relational.Gaming
```

Therefore:

- `RelMath.
  Glass` becomes `RelMath.
  Relational.
  Material.
  Glass` or `RelMath.
  Relational.
  Material.
  Constraint`, depending on whether "Glass" is a public object or an internal constraint regime.
- `RelMath.
  Topology` in material files becomes `RelMath.
  Relational.
  Material.
  Topology`.
- `RelMath.
  Spacetime.*` becomes `RelMath.
  Relational.
  Spacetime.*`.
- `RelMath.
  Quantum.*` becomes `RelMath.
  Relational.
  Quantum.*`.
- `RelMath.
  Reaction.*` becomes `RelMath.
  Relational.
  Reaction.*`.
- `RelMath.
  Blowup` becomes `RelMath.
  Dynamics.
  Blowup`.
- `RelMath.
  LawvereLaplacian` becomes either `RelMath.
  Dynamics.
  Laplacian` or `RelMath.
  Cohomology.
  LawvereLaplacian`, according to the theorem statement.
- `RelMath.
  Sheaf`, `RelMath.
  DFrame`, `RelMath.
  QEnriched`, and `RelMath.
  AssocSheaf` become `RelMath.
  Site.*` unless promoted by an explicit object-ownership argument.
- `RelMath.
  Alexandrov`, `RelMath.
  CRDT`, `RelMath.
  NegSheaf`, `RelMath.
  InconSheaf`, `RelMath.
  KZSheaf`, and `RelMath.
  LocalConstancy` become `RelMath.
  Cohomology.*` or `RelMath.
  Site.*`.
- `RelMath.
  Real.
  Internal` must not be extended by Flow or Persistence files.
  Real theorems live under `RelMath.
  Real`; applications of real theorems live under the applying owner.

# 10. Theorem Naming Law

RelMath theorem names should converge toward Lean/mathlib practice:

- theorem and proof names use `snake_case`;
- type, structure, class, and Prop-valued predicate names use `UpperCamelCase`;
- ordinary functions and data use `lowerCamelCase`;
- theorem names are conclusion-first and relation-explicit;
- object-owned theorem names live under the object's namespace when useful.

Examples:

```text
Charge.joinK_assoc
Charge.negate_involutive
Valuation.reindex_comp
Valuation.existsF_adjunction
Closure.Operator.idempotent_of_scottContinuous
Cohomology.h1_zero_iff_confluent
Dynamics.Blowup.firing_unbounded_of_nonquiescent
Relational.Spacetime.Causal.Order.transitive_closure_eq_settling
```

Avoid broad title names when a proposition name is available:

```text
bad:  causal_laplacian_theory
good: causalLaplacian_apply_eq_neighbor_sum
good: CausalLaplacian.propagation_closure
```

Blueprint labels may remain expository.
Lean declaration names should be precise mathematical handles.

# 11. Migration Plan

No shims.
No compatibility aliases.
No deprecated modules that re-export old paths.
Every old handle must either be moved to its lawful owner or deleted after downstream consumers are updated.

## Phase 0: Paper and audit tooling

- Land this paper.
- Keep a generated list of current modules, namespaces, declaration names, and blueprint handles.
- Define the allowed mismatch manifest: file path may differ from namespace only where a declaration is intentionally exposed under public object ownership.

Gates:

- Paper exists under `dev/content/researching/papers/`.
- Audit command can report nonlocal namespaces and stale blueprint handles.

## Phase 1: Relational subject stratum

- Move `Material`, `Spacetime`, `Quantum`, `Plasma`, `Fluid`, `Liquid`, `DenseMatter`, `Kinetic`, `Reaction`, `Thermo`, and `Gaming` under `RelMath/Relational/`.
- Rewrite imports to `RelMath.
  Relational.<Domain>`.
- Rewrite namespaces to `RelMath.
  Relational.<Domain>`.
- Update blueprint handles and prose.

Gates:

- Targeted builds for moved modules.
- `make build`.
- `make check`.

## Phase 2: Derivation spine

- Move primitive and language material into `Primitive`, `Articulation`, and `Language`.
- Keep short public namespaces only for canonical core objects: `Mark`, `Utterance`, `Articulating`, `Charge`, `Valuation`, and `Settling`.
- Remove accidental root namespaces.

Gates:

- Targeted builds for `Primitive`, `Articulation`, `Language`, and `Closure`.
- Namespace audit shows only approved core mismatches.

## Phase 3: Calculus and machinery

- Move algebra, order, combinatorics, real, linear algebra, probability, and optimization into `Calculus/`.
- Move flow/frontier dynamics into `Dynamics/`.
- Normalize site, closure, cohomology, and persistence barrels.

Gates:

- `make build`.
- `make check`.
- `make imports`.
- Stratum-level import graph no longer has the old top-level cyclic confusion.

## Phase 4: Theorem names

- Sweep public namespaces one at a time.
- Rename title-like theorems to proposition-like theorem names.
- Update blueprint `\lean{}` handles immediately.
- Remove stale handles by search, not by aliases.

Gates:

- `make build`.
- `make check`.
- stale-name search is empty for every renamed theorem family.

## Phase 5: Root barrels and documentation

- Add stratum barrel files.
- Replace the import scroll in `RelMath.lean` with barrel imports.
- Update `README.md`, `Makefile`, and blueprint chapter orientation.
- Rebuild blueprint.

Gates:

- `make build`.
- `make check`.
- `make blueprint`.
- namespace audit passes.

# 12. Acceptance Criteria

The RelMath normalization is complete only when all of the following are true:

- every Lean file path is justified by derivation stratum;
- every public declaration namespace is justified by mathematical object ownership;
- relational subject theories live under `RelMath.
  Relational`;
- `RelMath.lean` imports stratum barrels instead of every leaf module;
- accidental root namespaces are gone or explicitly justified in a manifest;
- theorem names follow the naming law;
- blueprint handles point to current declarations;
- no compatibility modules, aliases, or shims remain;
- `make build` passes;
- `make check` passes;
- the namespace audit reports only approved mismatches.

# 13. Conclusion

The lawful RelMath tree is not the tree of topics, and it is not the tree of public object names.
It is the tree of derivability.
Lean gives us namespaces for the other necessary relation: public mathematical ownership.
Once these two relations are separated, the incoherence disappears.

The target is therefore not "prettier folders."
The target is a categorical normal form for a formal mathematics library:

```text
filepath : proof-tree stratum
namespace : mathematical object owner
theorem name : proposition handle
blueprint label : expository graph node
```

Each component has one job.
RelMath should be refactored until the current tree obeys that law.
