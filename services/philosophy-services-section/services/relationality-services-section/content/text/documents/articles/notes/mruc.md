---
title: Multicellular Relational Universal Computer (MRUC)
description: "This document specifies the abstract architecture of a Multicellular Relational Universal Computer (MRUC): a deterministic computing system whose state is a finite, certified fragment of a fixed Generative Fibered Relational Trace…"
---
# Multicellular Relational Universal Computer (MRUC)
*(Architecture Specification)*

## 0. Status, Scope, and Terminology

### 0.1 Status and Change Control

This document specifies the abstract architecture of a **Multicellular Relational Universal Computer (MRUC)**: a deterministic computing system whose state is a finite, certified fragment of a fixed **Generative Fibered Relational Trace Universe (GFRTU)** and which hosts one or more **cells** (local universes) with language endpoints.

This document is intended to be **normative** for:

- the **logical state model** of a MRUC;
- the **allowed transitions** on that state;
- the **roles of cells, languages, observations, and laws**;
- the **conformance requirements** for MRUC implementations and MRUC profiles.

The following are **normative references**:

- The *GFRTU mathematical specification* (which defines GFRTU, trace sites, recognitions, cells, and generative closure);
- This *MRUC architecture specification* (this document).

In any case where there is tension between:

- the GFRTU mathematical definitions, and
- the MRUC operational behavior described here,

the GFRTU document is normative for **mathematical meaning**, and this document is normative for **permitted machine behavior**. If an implementation can satisfy both only by deviating from this document, this document **MUST** be revised.

Change control and versioning of this specification are out of scope for the core architecture, but any adopted process **SHOULD** provide:

- a unique version identifier for each published revision;
- a change log describing normative changes;
- a clear deprecation and migration story for MRUC profiles that depend on earlier versions.

### 0.2 Conformance and Requirements Language

This document uses RFC 2119–style keywords:

- **MUST / MUST NOT** — absolute requirements of the specification;
- **SHOULD / SHOULD NOT** — strong recommendations;
- **MAY** — permitted but not required.

Unless otherwise stated, all uses of these keywords are normative.

We distinguish several kinds of conformance:

#### 1. MRUC implementation conformance

A **MRUC implementation** is a concrete system (runtime, service, or formal model) that:

- is parameterized by a specific GFRTU instance and a family of cells, and
- purports to behave as a MRUC as defined in this document.

A MRUC implementation **conforms to this specification** if and only if:

- its **observable behavior** is equivalent to some model that satisfies all requirements in this document; and
- it does not introduce additional behaviors that contradict the invariants and transitions defined here.

Implementation conformance concerns **abstract behavior** (what states and transitions are allowed), not performance, storage layout, or transport protocols.

#### 2. MRUC profile conformance

A **profile** is a named package that fixes additional structure on top of this architecture, such as:

- a particular GFRTU instance and cell family;
- a chosen internal language fragment for each cell;
- concrete carrier encodings (e.g. canonical JSON, term grammars);
- specific observation schemas and law suites.

A profile **conforms to this specification** if and only if:

- every machine model allowed by the profile is, in particular, a conforming MRUC implementation; and
- the profile’s additional requirements do not contradict any requirement in this document.

#### 3. MRUC replica conformance

A **replica** is a MRUC implementation that shares:

- the same GFRTU descriptor,
- the same cell family,
- and the same profile,

but may have a different current live state. Replica conformance concerns **merge** and **convergence** properties and is defined in the replication section of this specification.

When this specification states that an implementation or profile **MUST** satisfy some property, a system that fails to do so **MUST NOT** be described as conforming to this specification.

### 0.3 Terminology

This section summarizes key terms as used in this specification. Formal mathematical definitions are given in the GFRTU document; here we fix their **architectural roles**.

Where terms are capitalized (e.g. “Cell”, “Law”) they refer to the meanings below unless explicitly redefined in context.

#### 0.3.1 Mathematical substrate

- **Generative Fibered Relational Trace Universe (GFRTU)**
  A mathematical structure consisting of:
  - a **trace site** $(T,J)$,
  - a **recognition object** $H$ over that site with **stabilization** $\sigma$ and **drift** $\Delta$,
  - and a **generative closure operator** $UG$ on objects of the sheaf topos $R = \mathbf{Sh}(T,J)$.
  The GFRTU determines the *universe of semantic objects* a MRUC may host.

- **Trace site $(T,J)$**
  A small category $T$ of traces and normalization morphisms, equipped with a Grothendieck topology $J$ describing which families of morphisms “cover” a trace.
  This specification treats $(T,J)$ as given by a machine-readable descriptor; MRUC implementations **MUST NOT** assume additional structure beyond that descriptor.

- **Sheaf topos $R$**
  The category $R = \mathbf{Sh}(T,J)$ of sheaves on the trace site. All semantic objects hosted by a MRUC live as objects of $R$ (or of its local subtopoi).

- **Recognition object $H$**
  A sheaf $H \in \mathrm{Ob}(R)$ whose fibers $H_t$ are Heyting algebras of recognitions over each trace $t \in T$.
  The operators $\sigma$ and $\Delta$ act on $H$ and determine a fixed layer $H^\ast$.

- **Generative closure $UG$**
  A closure operator on subsets of $\mathrm{Ob}(R)$ that, when iterated from the empty set, yields a least nontrivial closed universe of objects.
  In this specification, **UG** determines which objects are permitted to exist in MRUC state.

- **Cell**
  A **cell** is a local universe:
  $$
    R_U := \mathbf{Sh}(U, J|_U)
  $$
  for a chosen full subcategory $U \subseteq T$ (a **cell site**).
  Each cell inherits a restricted recognition object $H_U$ and fixed layer $H^\ast_U$, and is related to $R$ by a geometric morphism.
  Architecturally, a cell is a **first-class hosted universe** with its own internal language and boundary.

#### 0.3.2 Machine-level concepts

- **Multicellular Relational Universal Computer (MRUC)**
  A computing system parameterized by a fixed GFRTU and a finite family of cells $\{R_{U_i}\}$.
  Its state at any moment consists of one or more **live fragments** $S_i \subseteq \mathrm{Ob}(R_{U_i})$, each equipped with derivation witnesses showing that all live objects lie in the GFRTU’s generative closure.
  The MRUC exposes endpoints that allow clients to:
  - issue internal-language judgments within a cell,
  - construct new objects in a cell,
  - submit observations into a cell,
  - inspect the state of a cell.

- **Cell instance**
  A **cell instance** is the pairing of:
  - a particular cell $R_U$ from the GFRTU, and
  - a current finite live fragment $S \subseteq \mathrm{Ob}(R_U)$ plus derivations,
  under a running MRUC.
  Intuitively: “this concrete cell as currently hosted by this MRUC.”

- **Universe fragment**
  A **universe fragment** is a finite set of objects $S \subseteq \mathrm{Ob}(R_U)$ in a cell, together with:
  - derivation witnesses via the constructor set from the GFRTU descriptor, and
  - any additional structure required by this specification (e.g. identification of recognitions, laws, traces).
  A MRUC’s logical state is the union of its universe fragments across all hosted cells.

- **Cluster**
  A **cluster** is a network of MRUC replicas that share:
  - the same GFRTU descriptor,
  - the same cell family,
  - and (typically) the same profile,
  and that exchange state via merge operations.
  Cluster behavior and convergence properties are defined in the replication section of this specification.

- **Boundary**
  A **boundary** is the abstract interface between a cell instance and the outside world. This specification distinguishes four boundary modes per cell:
  - **judgmental queries** (internal-language typechecking and reasoning),
  - **constructive terms** (constructing new objects in the cell),
  - **observations** (ingesting external data into the cell’s universe),
  - **introspection** (querying the current universe fragment).
  Concrete encodings of boundaries are defined by profiles.

- **Law**
  A **law** is a machine-checkable invariant or constraint on MRUC state and transitions, expressed in the internal language of one or more cells.
  Laws may assert:
  - GFRTU-consistency conditions (e.g. sheaf and modal axioms),
  - domain-specific constraints,
  - operational policies.
  Collections of laws are grouped into **law suites**.

- **Profile**
  A **profile** is a named configuration layer over this architecture that fixes:
  - a specific GFRTU instance and cell family,
  - a specific internal language fragment for each cell,
  - concrete carrier encodings for terms, judgments, observations, and laws,
  - one or more law suites to be enforced.
  Profiles define concrete “machines” that can be deployed; they are the unit in which many implementation details are specified.

#### 0.3.3 Replication and merge

- **Replica**
  A **replica** is a MRUC implementation that:
  - conforms to this specification,
  - uses the same GFRTU descriptor and cell family as other replicas in its cluster,
  - but may have a different current universe fragment in each cell (e.g. due to asynchronous observations).

- **Merge**
  A **merge** is an operation that combines the state of two replicas into a new state, subject to:
  - preservation of derivation witnesses and UG-closure,
  - preservation of sheaf and gluing invariants across cells,
  - convergence properties inspired by convergent/commutative replicated data types.
  The precise requirements for merge are normative and specified in the replication section of this document.

Where this specification introduces additional terms, they will be defined locally. In case of ambiguity, the definitions in this section take precedence for architectural concepts, and the GFRTU document takes precedence for mathematical ones.

## 1. Architectural Overview

This section gives a high-level view of a **Multicellular Relational Universal Computer (MRUC)** as a computing system grounded in a fixed **Generative Fibered Relational Trace Universe (GFRTU)**.

At a high level:

- A MRUC is parameterized by a single GFRTU instance and a finite family of **cells** (local universes).
- The MRUC’s **state** is a finite collection of **universe fragments** inside those cells, each certified to lie in the GFRTU’s generative closure.
- All MRUC behavior is expressed as **transitions** on these universe fragments, using operations justified by the GFRTU structure.
- External interaction happens at **cell boundaries**, through language-based queries, constructions, observations, and introspection.

### 1.1 GFRTU Binding and Architectural Assumptions

A MRUC **MUST** be bound to a specific GFRTU instance:

- a trace site $(T,J)$,
- a recognition object $H$ with stabilization $\sigma$ and drift $\Delta$,
- and a generative closure $UG$ on the objects of the sheaf topos $R = \mathbf{Sh}(T,J)$.

This binding is not implicit. A conforming MRUC implementation:

- **MUST** expose or internally maintain a **GFRTU descriptor** that provides a machine-readable presentation of:
  - the category $T$ and topology $J$,
  - the fibers $H_t$ and restriction maps,
  - the modalities $\sigma,\Delta$,
  - the constructor set $\mathsf{Cons}$ that defines $UG$;
- **MUST NOT** assume any additional structure beyond what is present in this descriptor, except where explicitly allowed by a profile.

All semantic objects manipulated by a MRUC:

- **MUST** be interpretable as objects and morphisms in the sheaf topos $R$ or in one of its local subtopoi $R_U$ (cells), and
- **MUST** be reachable from GFRTU primitive data by finitely iterating the constructors in $\mathsf{Cons}$ (i.e. must lie in the closure determined by $UG$).

The GFRTU therefore plays a dual role:

- It is the **semantic substrate**, supplying the topos and operators that give meaning to machine states and transitions.
- It is the **admissibility filter**, through $UG$, determining which objects are allowed to exist in MRUC state at all.

### 1.2 Multicellular Machine Model

A MRUC hosts one or more **cells** as first-class local universes.

#### 1.2.1 Cells as hosted universes

Given a GFRTU’s trace site $(T,J)$, a **cell** is a local universe:

$$
  R_U := \mathbf{Sh}(U, J|_U)
$$

for a chosen full subcategory $U \subseteq T$ (the **cell site**). Each cell:

- inherits the restricted recognition object $H_U$ and its fixed layer $H^\ast_U$,
- carries all the induced categorical structure (limits, exponentials, subobjects, etc.),
- is connected to the global universe $R$ by a geometric morphism.

Architecturally, a MRUC:

- **MUST** host at least one cell,
- **MAY** host multiple cells, in which case it is **multicellular**.

Each hosted cell is associated with:

- a **cell identifier**, used at the boundary and in state,
- a **cell instance**, consisting of the cell $R_U$ and a finite **universe fragment** $S \subseteq \mathrm{Ob}(R_U)$ with derivation witnesses.

#### 1.2.2 Universe fragments and live state

For each hosted cell $R_U$, the MRUC maintains a **universe fragment**:

- A finite set $S \subseteq \mathrm{Ob}(R_U)$ of **live objects**.
- For every object $X \in S$, a **derivation witness**: a finite tree of constructor applications from $\mathsf{Cons}$, rooted in primitive data from the GFRTU descriptor.

A conforming MRUC implementation:

- **MUST** be able to justify every live object in its state with such a derivation witness.
- **MUST NOT** introduce live objects that cannot be obtained by finitely applying constructors from $\mathsf{Cons}$.

Intuitively, at any moment in time, the MRUC is “storing and managing” a finite patch of the GFRTU’s universe inside each cell. The total logical state of the MRUC is the union of these fragments across all cells.

#### 1.2.3 Multicellularity and overlaps

In the multicellular case, a MRUC hosts a finite family of cells $\{R_{U_i}\}$ with:

- a designated **overlap structure**, where each pair of cell sites $U_i, U_j$ has an overlap $U_{ij} = U_i \cap U_j$ (which may be empty),
- induced restriction functors and geometric morphisms between $R_{U_i}$, $R_{U_j}$, and $R_{U_{ij}}$.

A conforming MRUC:

- **MUST** treat each cell instance as a logically isolated universe fragment, except where overlaps are explicitly declared;
- **MUST** enforce **gluing invariants** across overlaps, ensuring that when objects are restricted along the overlap functors, the corresponding objects in the neighboring cell agree up to isomorphism.

From an architectural perspective:

- a **single-cell MRUC** is sufficient to describe small, self-contained systems;
- a **multicellular MRUC** models complex systems where different local universes (cells) interact through structured overlaps and gluing conditions.

### 1.3 Layered Architecture

The MRUC architecture is structured into conceptual layers. These layers are logical separations of responsibility; they do not prescribe process boundaries or module layouts in an implementation.

A conforming MRUC implementation **MUST** provide behavior that can be understood as arising from these layers, even if the implementation interleaves them internally.

#### 1.3.1 Universe Description Layer (UDL)

The **Universe Description Layer (UDL)** is responsible for:

- representing a specific GFRTU instance in machine-readable form;
- representing the family of hosted cells (cell sites and their overlaps);
- specifying the constructor set $\mathsf{Cons}$ that drives generative closure.

The UDL:

- **MUST** expose the information necessary for the MRUC to interpret terms and operations as objects and morphisms in the corresponding sheaf topoi;
- **MUST** be stable across replicas that wish to merge, as replication assumes agreement on GFRTU and cell family.

Through UDL, all higher layers know “what universe exists” and “where each cell sits in it.”

#### 1.3.2 Live Universe Kernel (LUK)

The **Live Universe Kernel (LUK)** is responsible for:

- maintaining the current universe fragment $S_i$ for each hosted cell $R_{U_i}$;
- maintaining derivation witnesses that certify each object’s membership in the generative closure;
- maintaining gluing invariants across overlapping cells.

Conceptually, the LUK is the **state model** of the MRUC:

- it holds no opaque “heap” that is not interpretable as part of some $R_{U_i}$;
- any change to state is a change in these universe fragments and their derivations.

Higher-level operations (language evaluation, observation processing, merge) are defined as orchestrated changes to the LUK that respect GFRTU constraints.

#### 1.3.3 Dynamics Engine (DE)

The **Dynamics Engine (DE)** implements the **primitive moves** allowed on the universe fragments, corresponding to GFRTU structure. Specifically, DE provides:

- **Constructor operations** derived from $\mathsf{Cons}$, for building new objects from existing ones.
- **Modal operations** for applying $\sigma$ and $\Delta$ to recognitions and maintaining fixed layers $H^\ast_U$.
- **Sheaf operations** for gluing compatible families of local data into global sections, according to the topology $J$ and restricted topologies $J|_U$.

All higher-level operations:

- **MUST** be expressible as compositions of these primitive moves, possibly conditional on laws and boundary inputs.

The DE ensures that every change to the LUK is explainable as “doing something that the GFRTU already knows how to do.”

#### 1.3.4 Boundary & Program Layer (BPL)

The **Boundary & Program Layer (BPL)** is responsible for:

- exposing per-cell **boundaries** that allow external clients to:
  - submit **judgmental queries** in the cell’s internal language,
  - submit **constructive terms** that propose new objects,
  - submit **observations** (external data to be internalized),
  - perform **introspection** on the current universe fragment;
- defining how these boundary interactions are translated into:
  - calls to internal language evaluation,
  - sequences of DE operations on the LUK,
  - and error or success reports.

Profiles:

- **MUST** define concrete carrier encodings and protocols for BPL (e.g. term grammars, JSON schemas, HTTP endpoints),
- but **MUST NOT** change the underlying semantics: each boundary request must be reducible to well-defined GFRTU-based moves through DE into LUK.

#### 1.3.5 Replication & Merge Layer (RML)

The **Replication & Merge Layer (RML)** governs:

- how multiple MRUC replicas with the same UDL (GFRTU, cells, constructors) and compatible profiles:
  - exchange information about their universe fragments, and
  - converge to compatible states via **merge** operations;
- how **CRDT-like** algebraic structure on parts of the universe fragments (e.g. monotone growth of recognitions, laws, observation logs) is used to guarantee:
  - convergence,
  - associativity,
  - commutativity,
  - and idempotence of merges where required.

The RML:

- **MUST** be defined in a way that preserves:
  - UG-closure and derivation witnesses,
  - sheaf and gluing invariants across cells,
  - and the semantic meaning of objects in the GFRTU.

Profiles:

- **MAY** specialize RML with additional policies (e.g. conflict resolution strategies, law-based vetoes) as long as they satisfy the convergence constraints defined in this specification.

---

Together, these layers define a MRUC as:

> A multicellular, GFRTU-grounded computing system whose entire observable behavior consists of deterministic, law-constrained transformations of finite certified universe fragments, mediated by language-centric cell boundaries, and designed to replicate and merge in a convergent, mathematically controlled way.


## 2. Universe Description Layer (UDL)

The **Universe Description Layer (UDL)** specifies, in machine-readable form:

- the **GFRTU** to which a MRUC is bound,
- the **family of cells** (local universes) that the MRUC hosts,
- the **constructor set** that realizes generative closure $UG$ operationally.

UDL is conceptually read-only at runtime. A conforming MRUC implementation **MUST** behave as if:

- the GFRTU descriptor,
- the cell family descriptor,
- and the constructor set descriptor

are fixed for the lifetime of a MRUC instance (or of a cluster of replicas), even if an implementation internally supports migration between different UDLs as a separate, higher-level operation.

### 2.1 GFRTU Descriptor

#### 2.1.1 Role and immutability

A **GFRTU descriptor** is a distinguished object that presents, in a machine-readable way, the mathematical structure of the GFRTU to which the MRUC is bound.

A conforming MRUC implementation:

- **MUST** be parameterized by exactly one GFRTU descriptor at initialization;
- **MUST** treat the GFRTU descriptor as immutable for the purposes of state evolution and replication;
- **MUST NOT** change or reinterpret its GFRTU descriptor as part of normal operation, boundary interactions, or merge.

Profiles **MAY** define mechanisms for upgrading or migrating GFRTU descriptors, but such mechanisms are outside the scope of this architecture and **MUST** be modeled as transitions between distinct MRUC instances, not as mutations of a single instance’s UDL.

The GFRTU descriptor itself:

- **MUST** be representable as an object (or family of objects) in the global sheaf topos $R$,
- **MAY** be included in the MRUC’s live universe fragments for introspection, but is conceptually “frozen” and not subject to UG-based construction.

#### 2.1.2 Required contents

A GFRTU descriptor **MUST** contain, at minimum, the following information:

1. **Trace site presentation**
   A finite or finitely-presented description of the trace site $(T,J)$, including:
   - a set of **object generators** for the category $T$;
   - a set of **morphism generators**, with specified source and target objects;
   - a set of **relations** between morphisms (equations or commutative diagrams);
   - a description of the **Grothendieck topology** $J$, given as a set of generating covering families.

   The presentation **MUST** be sufficient to reconstruct $T$ and $J$ up to equivalence, and **MUST** be the only source of truth for the trace site used by the MRUC.

2. **Recognition presentation**
   A description of the recognition object $H$, including:
   - for each object $t \in T$, a specification of the fiber $H_t$ as a Heyting algebra;
   - for each morphism $f : t \to t'$, a specification of the restriction map $H(f) : H_{t'} \to H_t$;
   - the global modalities $\sigma$ and $\Delta$ as natural transformations on the functor $H$, including their effect on each fiber $H_t$.

   The descriptor **MUST** fix the algebraic laws that these fibers and maps satisfy (e.g. Heyting algebra axioms, naturality of $\sigma,\Delta$), either by explicit listing or by reference to a normative schema.

3. **Primitive objects and generators**
   A set of **primitive generators** for the sheaf topos $R$, including at least:
   - generators for the recognition object $H$;
   - any additional primitive objects or structures required by the GFRTU (e.g. trace object representations, base types).

   These primitives serve as the starting point for the generative closure $UG$.

4. **Constructor set specification**
   A preliminary listing of the constructors $\mathsf{Cons}$ used to define the closure operator $UG$, including:
   - the **names** of constructors;
   - their **input sorts** (objects or families in $R$);
   - their **output sorts**;
   - any associated **laws** (e.g. functoriality, adjunctions, naturality) that must hold.

   The constructor set is further detailed in §2.3.

A GFRTU descriptor **MAY** include additional metadata (annotations, documentation, provenance), but these are not semantically relevant to MRUC behavior unless a profile explicitly elevates them to that status via law suites.

#### 2.1.3 Well-formedness

A GFRTU descriptor is **well-formed** if and only if:

- the trace site presentation defines a small category $T$ and a Grothendieck topology $J$;
- the recognition presentation defines a functor $H : T^{op} \to \mathbf{Heyt}$ with natural transformations $\sigma,\Delta$ satisfying the required algebraic laws;
- the primitive generators and constructors can be interpreted in the resulting sheaf topos $R = \mathbf{Sh}(T,J)$ without inconsistency.

A conforming MRUC implementation:

- **MUST** either operate with a GFRTU descriptor that is known (by construction or proof) to be well-formed, or
- **MUST** reject initialization with an ill-formed descriptor and surface an error.

This specification does not mandate that a MRUC be able to *check* well-formedness in full generality at runtime; it only requires that implementations not knowingly operate with descriptors that violate the GFRTU assumptions.

### 2.2 Cell Family Descriptor

#### 2.2.1 Cell sites and identifiers

A **cell family descriptor** specifies which cells $R_{U_i}$ a MRUC hosts.

For each cell, the descriptor **MUST** include:

- a **cell identifier** (a stable name or ID string);
- a **cell site specification**, describing a full subcategory $U_i \subseteq T$ by:
  - a set of object generators in $T$ that lie in $U_i$,
  - closure under identities and composition,
  - any additional relations needed to present $U_i$.

The cell site specification **MUST** define a subcategory $U_i$ that is:

- **full** on its declared objects (all morphisms in $T$ between those objects are included),
- **replete** under identities and composition.

From the GFRTU perspective, each $U_i$ induces a local universe $R_{U_i} = \mathbf{Sh}(U_i, J|_{U_i})$. A MRUC implementation **MUST** interpret each cell identifier as denoting such a local universe.

#### 2.2.2 Overlaps and gluing structure

For each pair of cells $R_{U_i}, R_{U_j}$, the descriptor **MAY** specify an **overlap site** $U_{ij} \subseteq U_i \cap U_j$.

If an overlap is declared, the descriptor **MUST** provide enough information to derive:

- the inclusion functors $U_{ij} \hookrightarrow U_i$ and $U_{ij} \hookrightarrow U_j$;
- the induced restriction functors and geometric morphisms between $R_{U_i}$, $R_{U_j}$, and $R_{U_{ij}}$.

The set of cells and overlaps constitutes the **cell family**. A conforming MRUC:

- **MUST** respect these inclusions and overlaps when enforcing gluing invariants (see §3 and §8);
- **MUST NOT** assume additional overlaps or identifications between cells beyond those implied by the descriptor.

Cells may have no overlaps (disjoint cell family), pairwise overlaps, or more complex diagrams. The architecture does not constrain the shape of the diagram, only that it be finite and presented through the descriptor.

#### 2.2.3 Cell metadata and roles

The cell family descriptor **MAY** attach additional metadata to each cell, such as:

- **roles** (e.g. “core”, “peripheral”, “boundary-facing”),
- **intended uses** (e.g. “identity cell”, “log cell”, “policy cell”),
- **associated language fragments** or observation schemas (by reference).

These metadata are not semantically relevant to the core architecture, but profiles **MAY** use them to:

- choose different language fragments for different cells,
- apply different law suites or policies per cell,
- define operational routing (e.g. certain observation kinds only go to certain cells).

### 2.3 Constructor Set Descriptor (UG Realization)

#### 2.3.1 Constructors and signatures

The **constructor set descriptor** provides an operational presentation of the generative closure $UG$. It enumerates a finite or finitely-presented set of **constructors** $\mathsf{Cons}$, each of which is a primitive way of forming new objects from existing ones.

Each constructor **MUST** have:

- a **name** (unique within the descriptor);
- an **arity** and **signature**, describing:
  - the number and kinds of inputs (objects/morphisms in $R$ or in a cell $R_U$);
  - the number and kinds of outputs;
- a **semantic clause**, stating:
  - how the constructor corresponds to a standard categorical operation (e.g. product, exponent, subobject, local universe formation, stability locale formation), or
  - a specific, GFRTU-sanctioned operation not reducible to standard structure.

Examples of constructors (for illustration; profiles will define specifics):

- `make_product(A, B) -> A × B`,
- `make_exponential(A, B) -> B^A`,
- `make_subobject(A, predicate) -> Sub(A)`,
- `make_cell(U) -> R_U`,
- `make_stability_locale(H_U^*) -> V_U`.

The architecture does not prescribe a fixed set of constructors, but requires that whatever constructors are declared:

- be interpretable in the GFRTU’s sheaf topos $R$,
- collectively generate the same closure as the mathematical $UG$ when applied from the declared primitives.

#### 2.3.2 UG-closure and derivations

Given a set of primitive objects $P \subseteq \mathrm{Ob}(R)$ and the constructor set $\mathsf{Cons}$, the **operational generative closure** $UG_{\mathrm{op}}$ is defined as:

- the least set $U$ containing $P$ that is:
  - closed under all constructors in $\mathsf{Cons}$, and
  - closed under isomorphism in $R$.

This $UG_{\mathrm{op}}$ is intended to coincide, up to equivalence, with the mathematical closure determined by $UG$. Profiles **MUST** ensure that their chosen constructor sets satisfy this property.

A conforming MRUC implementation:

- **MUST** ensure that every live object in any universe fragment can be obtained by finitely many applications of constructors from $\mathsf{Cons}$, starting from the primitives;
- **MUST** maintain, for each live object, a **derivation witness** that records which constructors were applied and in which order;
- **MUST NOT** create or retain live objects for which no derivation witness exists.

The constructor set descriptor thus:

- defines the **legal moves** by which the MRUC may extend its universe fragments;
- provides the basis for checking UG-closure as an invariant over state.

#### 2.3.3 Laws over constructors

The constructor set descriptor **MAY** include **laws** over constructors, such as:

- equations between different construction paths (e.g. associativity, commutativity);
- functoriality conditions (constructors compatible with morphisms);
- adjunction-like properties (units and counits of standard categorical constructions).

These laws:

- are mathematical equalities or inequalities that should hold in $R$;
- are not themselves executable operations, but constraints.

Profiles:

- **MAY** elevate constructor laws into **law suites** that MRUC implementations are required to check (e.g. via internal proofs or tests);
- **MUST NOT** declare laws that contradict the underlying GFRTU structure.

From the architecture’s point of view, constructor laws define **equivalence classes of derivations**. While the MRUC is not required to canonicalize derivations, it **MUST** behave in a way that is invariant under derivations that are identified by these laws.

---

Together, the GFRTU descriptor, cell family descriptor, and constructor set descriptor form the **Universe Description Layer**. This layer fixes:

- **what universe exists** (GFRTU),
- **where the machine’s cells sit** in that universe (cells and overlaps),
- **and what moves are allowed** to generate new objects (constructors).

All subsequent layers (LUK, DE, BPL, RML) operate strictly within the constraints imposed by this layer.

## 3. Live Universe Kernel (LUK) — State Model

The **Live Universe Kernel (LUK)** is the logical core of a MRUC’s state.

For a given GFRTU and cell family (as fixed by the Universe Description Layer, §2), the LUK:

- maintains, for each hosted cell, a finite **universe fragment** inside that cell’s local universe;
- maintains **derivation witnesses** showing that every live object lies in the GFRTU’s generative closure $UG$;
- enforces **gluing invariants** across overlapping cells.

All observable behaviors of a conforming MRUC (language evaluation, observation integration, merge) **MUST** be expressible as transitions on the LUK that preserve the invariants defined in this section.

### 3.1 Responsibilities and Separation of Concerns

A MRUC implementation **MUST** conceptually separate:

- the **Universe Description Layer (UDL)** (§2), which fixes:
  - the GFRTU descriptor (trace site, recognition, constructors),
  - the cell family (cell sites and overlaps),
- from the **Live Universe Kernel (LUK)**, which holds:
  - the current live objects for each cell,
  - their derivation witnesses,
  - and any explicit gluing witnesses between cells.

Concretely:

- The LUK **MUST NOT** modify the GFRTU descriptor, cell family descriptor, or constructor set descriptor during normal operation.
- The LUK **MUST** treat these descriptors as read-only inputs that determine:
  - which objects and morphisms are meaningful,
  - which constructions are allowed,
  - and how cells overlap.

An implementation **MAY** maintain additional internal caches, indexes, or performance-related data structures, but:

- such auxiliary state **MUST** be observationally irrelevant:
  - if it were discarded and recomputed from the UDL plus the LUK’s logical contents, the MRUC’s observable behavior would not change;
- auxiliary state **MUST NOT** introduce new semantic objects that are not present as live objects in some cell universe fragment.

Intuitively:

> The LUK is the *only* place where the MRUC’s semantic state lives. Everything else is either static description (UDL) or derived from the LUK.

### 3.2 Universe Fragments per Cell

For each hosted cell $R_{U}$ (with cell identifier `cell_id`), the LUK maintains a **universe fragment**:

$$
  \mathsf{Frag}(U) = (S_U, D_U, G_U)
$$

where:

- $S_U \subseteq \mathrm{Ob}(R_{U})$ is a finite set of **live objects**;
- $D_U$ is a set of **derivation witnesses** certifying that every live object lies in the operational generative closure;
- $G_U$ is a set of **internal gluing witnesses** (within the cell), if required by the GFRTU or profile.

The precise internal representation of $\mathsf{Frag}(U)$ is implementation-specific, but it **MUST** satisfy the constraints below.

#### 3.2.1 Live objects and finiteness

For each cell $R_U$:

- $S_U$ **MUST** be finite at all times.
- Each element $X \in S_U$ **MUST** be an object of $R_U$ (or equivalence class of isomorphic objects) as determined by the GFRTU descriptor.
- The implementation **MUST** be able to determine, for any `cell_id` and any representation of a live object in that cell, whether it is in the current $S_U$.

Finiteness is a logical requirement: even if an implementation streams or persists data, the *in-memory* semantic universe that is considered live at a given instant **MUST** be representable as a finite set.

A MRUC MAY support streaming or archival of objects beyond $S_U$, but such archived objects:

- are not considered part of the current LUK state until they are explicitly re-introduced into a universe fragment via constructors or other allowed transitions.

#### 3.2.2 Derivation witnesses

For each live object $X \in S_U$, the LUK **MUST** maintain at least one **derivation witness** in $D_U$, which conceptually is a finite, well-founded tree (or DAG) of constructor applications:

- Leaves correspond to:
  - primitive objects or generators declared in the GFRTU descriptor, or
  - previously constructed objects with their own derivations (allowing sharing and DAG structure).
- Interior nodes correspond to applications of constructors from the set $\mathsf{Cons}$ (§2.3), recording:
  - which constructor was used,
  - which input objects (by reference to other nodes) were supplied,
  - which output object(s) were produced.

Formally, for each $X \in S_U$, there exists a finite derivation tree $\tau_X$ such that:

- the root of $\tau_X$ is labeled with:
  - a constructor application whose output includes $X$, or
  - a primitive generator that denotes $X$ directly;
- all intermediate nodes correspond to valid constructor applications (as per the constructor set descriptor);
- all leaves correspond to primitive objects or previously justified objects.

A conforming MRUC implementation:

- **MUST** ensure that each $X \in S_U$ has at least one such derivation witness;
- **MUST NOT** treat an object as live if no valid derivation witness can be established for it;
- **MAY** discard or compress derivation witnesses for garbage-collected or archived objects, as long as every remaining live object retains at least one full witness.

Derivation witnesses are logical, not necessarily verbatim. An implementation **MAY** record them in a normalized or compressed form, provided that:

- they can be expanded into a full finite derivation tree that corresponds to legal constructor applications.

#### 3.2.3 Internal references and identity

Within a universe fragment $\mathsf{Frag}(U)$:

- Live objects **MAY** refer to other live objects (e.g. as components of products, domains/codomains of morphisms, elements of exponentials).
- Such references **MUST** be consistent with the underlying sheaf topos $R_U$ and GFRTU descriptor:
  - if an object $X$ refers to `Y` as its domain, then $Y$ must indeed be a valid object of $R_U$ and (if referred to as live) be in $S_U$.

The architecture does not constrain *how* references are implemented (by pointer, by ID, by path), but it requires that:

- there be a well-defined equivalence between referred objects and the objects they denote in $R_U$;
- identities of live objects be stable for as long as the object remains in $S_U$ (except under operations that explicitly quotient by isomorphism, as allowed by the GFRTU and profile).

The carrier-level mechanisms for object identity (e.g. hash-based IDs) are specified in §4; the LUK’s obligation is to ensure that identity and reference are semantically coherent.

### 3.3 Object Kinds and Roles

The LUK does not dictate a fixed ontology of object *types*, as this depends on the GFRTU, but it **MUST** support distinguishing at least the following broad **roles** for objects in each universe fragment $S_U$:

1. **Structural objects**

   Objects that arise from the categorical structure of $R_U$, such as:

   - terminal objects, products, sums,
   - exponentials, subobjects,
   - internal homs and function spaces,
   - reindexed recognitions and their fixed layers.

   These are used to interpret the internal language and to support higher-level constructions.

2. **Trace-related objects**

   Objects encoding traces and morphisms in the trace site, such as:

   - representations of specific traces $t \in U$,
   - sheaves corresponding to “events” or “histories” in the site.

3. **Recognition objects**

   Objects and elements corresponding to recognitions in $H_U$ and fixed recognitions in $H^\ast_U$, including:

   - fiber-level recognitions $H_t$,
   - global or local sections of $H_U$,
   - recognitions that have been stabilized ($\sigma$-fixed).

4. **Language objects**

   Objects corresponding to the syntactic artifacts of the internal language (see §5), such as:

   - contexts, types, terms, judgments,
   - encodings of programs or scripts, where the profile chooses to represent them as internal objects.

5. **Law and policy objects**

   Objects expressing laws, invariants, and policies, for example:

   - predicates over other objects,
   - proof objects or certificates,
   - policy descriptors that constrain operations.

6. **Auxiliary objects**

   Any additional objects required by the GFRTU or a profile that are not covered by the categories above.

A MRUC implementation:

- **MAY** use tags or separate collections to distinguish these roles;
- **MUST** treat role distinctions as semantically meaningful when laws or boundary contracts depend on them (e.g. a law suite may apply only to recognition objects).

This specification does not prescribe a complete classification scheme, but profiles **SHOULD** document how object roles are represented and used.

### 3.4 Multi-Cell Gluing Invariants

When a MRUC hosts multiple cells $\{R_{U_i}\}$ with overlaps $U_{ij}$ (§2.2.2), the LUK **MUST** enforce **gluing invariants** to ensure that universe fragments are mutually consistent across overlapping cells.

For each pair of cells $R_{U_i}, R_{U_j}$ with overlap $U_{ij}$:

- there exist canonical inclusion functors $U_{ij} \hookrightarrow U_i$ and $U_{ij} \hookrightarrow U_j$,
- which induce restriction functors (and geometric morphisms) between the corresponding sheaf topoi.

Let:

- $\mathsf{Frag}(U_i) = (S_i, D_i, G_i)$,
- $\mathsf{Frag}(U_j) = (S_j, D_j, G_j)$.

Then a conforming LUK **MUST** ensure that:

1. **Restriction compatibility**

   For any live object $X \in S_i$ whose semantics restricts along $U_{ij} \hookrightarrow U_i$ to an object $X|_{U_{ij}}$, one of the following holds:

   - there exists a live object $Y \in S_j$ such that its restriction along $U_{ij} \hookrightarrow U_j$ is isomorphic to $X|_{U_{ij}}$; or
   - the profile explicitly permits $X$’s restriction to be *unrealized* in $S_j$ (e.g. when $S_j$ is intentionally partial), in which case no conflicting realization may exist.

   Symmetrically, the same condition applies starting from $S_j$.

2. **Isomorphism coherence**

   When both $X|_{U_{ij}}$ and $Y|_{U_{ij}}$ exist as live objects, the LUK **MUST** treat them as isomorphic in a way that is stable under subsequent transitions:

   - either by canonical identification (treating them as representatives of the same isomorphism class), or
   - by maintaining explicit isomorphism witnesses (e.g. invertible morphisms in $R_{U_{ij}}$).

3. **Derivation compatibility**

   Derivation witnesses $D_i$ and $D_j$ **MUST** be compatible with restrictions:

   - if $X \in S_i$ has derivation $\tau_X$, then the restriction $X|_{U_{ij}}$ must have a derivation that is the image of $\tau_X$ under the appropriate restriction functors and constructors, up to constructor laws.

   The LUK is not required to store restricted derivations explicitly, but its behavior **MUST** be equivalent to one that does.

The set of explicit gluing witnesses:

- $G_i$ and $G_j$ **MAY** contain additional objects or proofs used to certify these invariants;
- profiles **MAY** require that certain gluing relationships be explicitly materialized (rather than implicit).

In the absence of an overlap $U_{ij}$, no gluing requirement is imposed between $S_i$ and $S_j$.

### 3.5 State Invariants and Initialization

#### 3.5.1 Global invariants

For a conforming MRUC, at every observable state, the LUK **MUST** satisfy:

1. **GFRTU alignment**

   All live objects in all universe fragments are objects of the corresponding cell universes $R_{U_i}$, as determined by the GFRTU descriptor.

2. **UG-closure**

   Every live object has at least one derivation witness using constructors from $\mathsf{Cons}$, starting from primitives, and is therefore contained in the operational generative closure $UG_{\mathrm{op}}$ (§2.3.2).

3. **Finite support**

   For each cell $R_{U_i}$, the live object set $S_i$ is finite.

4. **Gluing invariants**

   For each overlapping pair of cells, the gluing invariants of §3.4 hold.

5. **Law compliance**

   For each active law suite (as specified by the profile), the state satisfies all the laws that are declared to hold *at all times*.

The Dynamics Engine (§7) and higher layers **MUST** be defined so that all transitions preserve these invariants, or fail atomically (with no state change).

#### 3.5.2 Initialization

At initialization of a MRUC instance:

- The GFRTU descriptor, cell family descriptor, and constructor set descriptor are fixed (UDL).
- The LUK must be initialized to a state that satisfies all global invariants.

Typical initializations include:

- **Empty fragments**
  For each cell $R_{U_i}$, $S_i$ is empty or contains only a minimal set of primitive objects required by the GFRTU descriptor. All derivation witnesses are trivial (identity or generator witnesses).

- **Preloaded fragments**
  The LUK is loaded from an existing store of live objects and derivations. In this case:
  - the implementation **MUST** verify (or rely on prior verification) that the loaded state satisfies the invariants above;
  - if verification fails or is incomplete, the implementation **MUST NOT** treat the MRUC as conforming and **SHOULD** signal an error.

This specification does not require a specific initialization strategy, only that the invariants hold before any boundary interactions are processed.

### 3.6 Introspection over LUK

The **introspection** mode of the boundary (§5) allows external clients to query the current universe fragments. At the architectural level:

- Introspection operations **MUST** be read-only with respect to the LUK:
  - they **MUST NOT** create, delete, or modify live objects;
  - they **MUST NOT** alter derivation witnesses or gluing witnesses.
- Introspection **MAY** expose:
  - lists or summaries of live objects per cell;
  - role-specific views (e.g. “all recognitions in this cell”);
  - law-status indicators (e.g. which laws are currently satisfied or violated);
  - structural information about overlaps and gluing.

Profiles:

- **MUST** specify which aspects of the LUK are exposed via introspection, and in what form (carriers, protocols);
- **MUST** ensure that introspection’s view of the LUK is consistent with the actual state (e.g. no stale or fabricated objects).

The LUK itself is indifferent to whether introspection is enabled; its only obligation is to maintain a well-defined, invariant-respecting state that introspection can inspect.

---

The Live Universe Kernel thus provides the **semantic backbone** of a MRUC: a finite, derivation-certified, multi-cell universe on which all dynamics operate and whose invariants give meaning to “computations” performed by the machine.
