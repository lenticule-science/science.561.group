---
title: "Relational Computer Architecture Specification"
date-created: 2026-03-04T00:00:00
---

## 0. Purpose and Scope

This document defines the Relational Computer as a complete computational architecture derived from an underlying mathematical derivation. It contains everything required for an implementation to realize the architecture without reference to any other materials.

**Goals:**

* Specify the machine's primitive runtime structures.
* Define the Instruction Set Architecture (ISA) of the machine.
* Describe profiles as emergent semantic spaces with internal syntax, typing, and judgment systems.
* Define the observation pipeline that governs how external information is interpreted and stabilized.
* Provide explicit mapping tables between primitive architectural components and their roles needed for implementation.

**Non-goals:**

* This document does *not* recapitulate or explain the underlying mathematics as full proofs.
* This document does *not* extend, reinterpret, or supplement the underlying derivation.
* This document does *not* assume any prior computer architecture conventions.

**Audience:**

* Automated implementers that need a precise, mechanically implementable specification.
* Humans who need a clear model of how the relational computer operates as a runtime architecture.

**Authority:**
Every specification in this document is extracted from, or forced by, an underlying mathematical derivation. Where that derivation defines multiple constructions corresponding to a single concept, this document consolidates their runtime meaning into unified, implementable components.

### 0.1 Normative Priority

Within the scope of this architecture, the normative priority is:

1. This document: architectural specification and implementation contracts.
2. Any implementation notes, code, or tests.

An implementation MUST NOT treat code or tests as overriding any requirement stated here. Any apparent degrees of freedom in this document apply only where behavior is intentionally left unspecified; in all such cases, the chosen behavior MUST still satisfy all stated laws and invariants.

### 0.2 Requirements Language and Terminology

This document uses normative language in the following way:

* `MUST` and `MUST NOT` express requirements that implementations are obliged to satisfy.
* Unqualified descriptive statements explain structures and their roles but do not add further obligations beyond the explicit `MUST` / `MUST NOT` clauses.

All top-level sections from §1 onward are normative unless explicitly marked as “Notes”. Any “Notes” subheading, when present, is non-normative and provides only explanatory context.

For reference:

* **Cell** – a finite recognition algebra with lattice, Heyting, and modal structure (§1.1).
* **Trace** – a finite sequence of steps in the free partially commutative monoid of §1.2 and §6.3.
* **Profile** – a derived structure over Cells with syntax, typing, judgments, and semantics (§3).
* **Observation** – a pair `(trace, term)` processed by the pipeline in §4.
* **Program** – a finite linear composite of operators over `MachineState` (§5.0).
* **Operator implementation** – a pure function implementing an operator’s semantics (§5.0).
* **MachineState** – the entire mutable state of the machine (`cells`, `profiles`, `edges`) (§1.4).
* **PhaseSpace(P)** – the profile-invariant recognitions and their induced modalities (§10.1).
* **SpectralData(P)** – modes and associated spectral values derived from the deviation and wave operators (§10.3).

### 0.3 Section Classification and Conformance Profiles

Sections are classified as follows:

* **Core normative**: §§1–9, §12, §15, §16.
* **Optional extensions**: §10 (internal geometry and physics), §11 (reserved for future interaction structures).
* **Informative examples and indices**: §13 (reference examples), §14 (primitive component index).

A conformant implementation MUST satisfy all requirements in the core normative sections. Optional extensions are required only for implementations that claim the corresponding conformance profile below.

Conformance profiles:

* **Core Conformance**: satisfies all requirements in §§1–9, §12, §15, §16.
* **Geometry Conformance**: Core Conformance + all requirements in §10.1–§10.2.
* **Spectral Conformance**: Geometry Conformance + all requirements in §10.3.

Unless otherwise stated, any reference in this document to “a conformant implementation” means Core Conformance.

### 0.4 Mathematical Foundations (Informative)

This architecture is not an arbitrary stack of mechanisms; it implements, in finite and operational form, the laws of a coherent mathematical space.

At a high level:

* **Local algebra and logic.** Each Cell is a finite bounded Heyting algebra equipped with two modal operators, `nucleus` and `flow`, that commute and satisfy the closure and dynamic laws of §2.1–§2.2. These algebras provide the local intuitionistic logic and modal structure of the machine.
* **Temporal structure.** Traces form a free partially commutative monoid (§1.2, §2.3, §6.3). Normalization (`NF_trace`) and shuffle-equivalence ensure that temporal behavior is expressed up to the commutations prescribed by this monoid, not by arbitrary execution order.
* **Profile toposes.** For each Profile `P`, the fixed recognitions and their induced structure realize a small topos (§3.8): there is a subobject classifier `Ω_P`, finite limits, and exponentials, and the internal logic of this topos matches the Profile’s typing and judgment system. Terms in the Profile’s language denote morphisms in this internal topos, and semantic interpretation respects its equations.
* **Quasicrystalline hypertensor topos intuition.** Globally, the collection of Cells, Traces, and Profiles behaves like a quasicrystalline hypertensor topos: a sheaf-like arrangement of finite modal Heyting algebras (Cells) indexed by traces, with Profile toposes sitting over invariant regions. The “hypertensor” aspect comes from combining recognition structure, temporal structure, and profile geometry into a single ambient object; the “quasicrystalline” aspect comes from the aperiodic but locally finite pattern of invariants and flows.
* **Internal geometry and spectral layer.** When §10 is materialized, each Profile’s phase space `PhaseSpace(P)` (§10.1), observation kernels, invariant measures, and spectral data (§10.3) enrich this topos with an internal geometry and a spectral calculus. The dynamics specified by `PhysicsProfile` and related operators is then a dynamical system on `PhaseSpace(P)` compatible with the topos structure and normalization laws.

The rest of this specification is the operational reflection of these mathematical structures: every `MUST` / `MUST NOT` requirement is chosen so that the behavior of a conformant implementation is indistinguishable from computation inside this finite, quasicrystalline hypertensor topos.

Throughout, we use the term **witness trace** for the underlying mathematical object that justifies recognitions and judgments: a finite path in the internal geometry and logic of this hypertensor topos. The runtime `Trace` carrier represents canonical witness traces. Each recognition element and each judgment has at least one such witness trace; Cells and Profiles present finite quotients of the resulting equivalence classes, and all ISA operators act on these equivalence classes in a way that respects the laws of the ambient quasicrystalline hypertensor topos.

### 0.5 Core Machine vs Standard Program Layer

This specification distinguishes between:

* **Core machine semantics** – the behavior determined by Cells, Traces, `MachineState`, the ISA (§2), normalization and equivalence (§6), Profiles and Observations (§3–§4), and the program execution semantics (§5.0). These structures define what it means for a Relational Computer to exist and evolve.
* **Standard programs** – specific Programs built from primitive operators that realize pipelines such as profile construction, bootstrap, and observation handling. These Programs are specified using the `ProgramSpec` schema in §5.0 and introduce no new runtime structure: they are compositions of the primitive operators and carriers already defined by the core machine.

For every standard program described in this document, the preconditions and postconditions given in its `ProgramSpec` are normative: any conformant implementation MUST behave as if it executed that program, even if it internally uses a different but observationally equivalent sequence of primitive `ProgramStep`s. Observational equivalence is understood at the level of `MachineState` transitions and returned carrier payloads as defined in §5.0.

## Part I — Core Model (Normative)

## 1. Primitive Runtime Entities

At runtime, the Relational Computer has only two primitive ontological categories:

1. **Cells** – finite recognition algebras containing the computational data.
2. **Traces** – finite temporal structures describing event sequences.

Profiles, terms, contexts, judgments, and observations are *derived* structures defined later.

---

### 1.1 Cell (Recognition Algebra Unit)

A **Cell** is the smallest unit of memory and semantic content. Each Cell represents a finite recognition algebra equipped with modal operators and equivalence structures.

There may be many Cells in a single `MachineState`; the architecture does not assume a single global recognition algebra.

Each Cell MUST contain at least:

* A finite carrier set of recognition elements.
* A bounded lattice structure (`meet`, `join`, `top`, `bottom`).
* Heyting-like structure (`imply`, `negate`).
* Modal operators (`nucleus`, `flow`).
* Equivalence and normalization data.
* Optional trace-related metadata.

Concretely, an implementation MUST realize Cells as records of the following shape:

```text
Cell:
  id:            CellID
  elements:      set[ElementID]
  leq:           relation[ElementID × ElementID]          # partial order
  meet_table:    map[(ElementID, ElementID) → ElementID]
  join_table:    map[(ElementID, ElementID) → ElementID]
  imply_table:   map[(ElementID, ElementID) → ElementID]
  negate_map:    map[ElementID → ElementID]
  nucleus_map:   map[ElementID → ElementID]
  flow_map:      map[ElementID → ElementID]
  equiv_class_id:map[ElementID → EquivClassID]
  nf_cache:      map[ElementID → ElementID]               # normalization cache
  trace_meta:    optional TraceMeta
```

The fields MUST satisfy:

* `elements` is finite, and all table domains/ranges are subsets of `elements`.
* `leq`, `meet_table`, `join_table`, `imply_table`, `negate_map` realize a bounded Heyting lattice satisfying §2.1 and §9.2.
* `nucleus_map` and `flow_map` realize closure/flow operators satisfying §2.2 and §9.2, including commutation.
* `equiv_class_id` and `nf_cache` are consistent with the recognition normalization procedures in §6.4–§6.5.
* `trace_meta` (if present) stores only information derived from traces (e.g. visit counts, spectral summaries) and MUST NOT introduce new semantics beyond what traces and Cells already encode.

A Cell MUST satisfy the invariants listed in §2.4.

Cells do **not** contain executable code, pointers, or references outside their own algebraic domain.

---

### 1.2 Trace (Witness Trace / Temporal Structure)

A **Trace** is the runtime carrier for a **witness trace**: a finite sequence of abstract steps that jointly witness how recognitions and judgments arise and evolve inside the ambient quasicrystalline hypertensor topos. Traces carry both justification structure (how a recognition or judgment is obtained) and temporal structure (how it is visited and updated).

There may be many distinct witness traces in flight at once; the architecture does not assume a single global trace or timeline.

Operationally, a Trace is a finite sequence of abstract steps, equipped with:

* concatenation,
* normalization (modulo shuffle-equivalence),
* a head/tail decomposition,
* and flow-lifting.

Traces provide the witness structure for recognitions and judgments and the temporal structure for observations and term evaluations, but they are NOT memory—they are ephemeral runtime objects whose canonical representatives underpin Cell and Profile content.

An implementation MUST realize Traces and their steps as:

```text
Trace:
  steps: list[TraceStep]

TraceStep:
  kind:    TraceStepKind
  payload: TracePayload
```

where:

* `TraceStepKind` is a finite set of tags (e.g. operand-selection, operator-application, flow, normalization, observation) chosen so that all required primitives for building and comparing witness traces can be represented as sequences of steps.
* `TracePayload` references operand witnesses (for example, `(CellID, ElementID)` pairs or Judgment IDs), operator names, profile IDs, or observation metadata, and MUST be serializable in a deterministic way (§6.5, §6.6).

For every primitive algebraic or modal operator on recognitions introduced in §2.1–§2.2 and §5.1 (including at least `MeetRecognition`, `JoinRecognition`, `ImplyRecognition`, `Negate`, `Nucleate`, `Flow`, `FixNucleus`, `FixFlow`, `FixFlowNucleus`), there MUST exist at least one corresponding operator-application step kind in `TraceStepKind` such that, for any witness traces of the operands, appending a single operator-application step via `extend_trace` and then applying `normalize_trace` yields a witness trace for the operator’s result as required in §2.1–§2.2 and §1.2.1.

The concatenation and shuffle structure (§2.3, §6.3) MUST treat `Trace.steps` as elements of a free partially commutative monoid on `TraceStepKind` with the admissible commutations prescribed by this specification.

#### 1.2.1 Witness Trace Semantics

Each witness trace has an internal semantic interpretation in the quasicrystalline hypertensor topos. This interpretation is captured by two partial semantic projections:

```text
witness_recognition(trace) → (CellID, ElementID) or undefined
witness_judgment(trace)    → Judgment or undefined
```

These projections are not required to be exposed as runnable APIs, but the observable behavior of any conformant implementation MUST be equivalent to one in which such partial functions exist and satisfy:

* **Totality on stored recognitions and judgments.** For every recognition element `(CellID, ElementID)` stored in any Cell, there exists at least one witness trace `t` with `witness_recognition(t) = (CellID, ElementID)`. For every stored Judgment carrier, there exists at least one witness trace `t` with `witness_judgment(t)` equal to that Judgment.
* **Stability under trace normalization.** Whenever `witness_recognition(t)` is defined and equal to `(c, e)`, then `witness_recognition(NF_trace(t))` is also defined and equal to `(c, e)`. Whenever `witness_judgment(t)` is defined and equal to `J`, then `witness_judgment(NF_trace(t))` is also defined and equal to `J`.
* **Compatibility with Cell and Profile structure.** For every recognition `(c,e)` and judgment `J` that arises from term evaluation or observation processing (§3–§4), there exists at least one witness trace `t` such that:
  * `witness_recognition(t) = (c,e)` or `witness_judgment(t) = J`, and
  * all algebraic, modal, and normalization operations applied to `(c,e)` or `J` are consistent with applying the corresponding witness-trace constructions to `t` and then projecting back via `witness_recognition` or `witness_judgment`.

#### 1.2.2 Witness Trace Construction Patterns (Informative)

This subsection is informative. It sketches one minimal, concrete way to realize witness traces that satisfies the laws above. Implementations MAY use a different internal encoding, provided all normative requirements on witness traces and normalization are met.

A simple scheme is to treat each `TraceStep` as either:

```text
OperandStep:
  kind   = "operand"
  payload = (CellID, ElementID) or JudgmentID

OperatorStep:
  kind   = "operator"
  payload = {
    operator: OperatorName,       # e.g. "MeetRecognition", "Flow"
    inputs:   list[OperandIndex]  # positions of operand witnesses in the trace
  }
```

Given witness traces `t_a`, `t_b` for recognitions `a`, `b` in Cell `c`, a witness trace for `meet(c, a, b)` can be obtained by:

```text
t_meet = normalize_trace(
            concat_trace(
              concat_trace(t_a, t_b),
              step_meet))
```

where `step_meet` is an `OperatorStep` with `payload.operator = "MeetRecognition"` and `payload.inputs` selecting the operand segments corresponding to `t_a` and `t_b`. Similar patterns apply for `JoinRecognition`, `ImplyRecognition`, `Negate`, `Nucleate`, `Flow`, and the fixed-point operators: one new operator-application step is appended, and then the trace is normalized.

For term evaluation in a Profile (§3.5), a minimal implementation can treat λ‑calculus constructs (`Lam`, `App`, `FixLeast`, `FixGreatest`) as manipulating environments and terms “off to the side,” while the witness traces record only the recognition-level operator applications. In this scheme:

* witnesses for `Recog`, `MeetTerm`, `JoinTerm`, `ImplyTerm`, `NegateTerm`, `FlowTerm`, and `NucleusTerm` are built exactly as above from operand witnesses and the corresponding `OperatorStep`s;
* witnesses for λ‑abstractions and applications reuse the witnesses of their subterms, without requiring additional λ‑specific `TraceStepKind`s, as long as the resulting witness traces still satisfy the requirements of §1.2.1 and §3.5.

Other schemes (for example, adding explicit λ‑related `TraceStepKind`s such as “lambda-intro” or “apply-closure”) are permitted so long as witness traces for every evaluation judgment can be constructed using `extend_trace`, `concat_trace`, `normalize_trace`, and `flow_trace` in a way that is compatible with `witness_recognition`, `witness_judgment`, and the normalization laws of §6.

---

### 1.3 Element Identifiers & Classes

Cells expose recognition elements only by stable identifiers. These identifiers MUST be treated as opaque.

Additionally, each element belongs to an equivalence class that supports:

* normalization into a canonical representative,
* observation-equivalence,
* judgment-equivalence,
* trace-observation equivalence.

Mathematically, each equivalence class of elements corresponds to at least one witness trace and accompanying judgments in the ambient quasicrystalline hypertensor topos. Implementations are not required to store these witnesses explicitly, but the algebraic and modal structure of each Cell MUST be realizable as the structure induced on these equivalence classes of witness traces by the laws stated in §2 and §6.

Element identifiers MUST NOT leak assumptions about ordering or structure aside from what the Cell explicitly encodes. Identifiers MUST be derived from canonical encodings as specified in §6.6 and MUST satisfy:

* equality is the only observable operation on IDs;
* ordering or structural properties of IDs MUST NOT influence semantics; all semantics MUST be determined solely by the structures explicitly encoded in Cells and Profiles;
* IDs MUST remain stable for the lifetime of the `MachineState` in which they appear.

### 1.4 Machine State

At any instant, the Relational Computer’s mutable runtime state is exactly:

```text
MachineState:
  cells:    map[CellID   → Cell]
  profiles: map[ProfileID → Profile]
  edges:    map[EdgeID   → Edge]
```

No other persistent mutable state exists. All evolution of `MachineState` occurs through:

* ISA operations on Cell contents (§2),
* Profile construction and updates (§3),
* Observation processing (§4),
* Execution of programs and operator implementations over the ambient operator graph (§5.0).

Any caches or indices that an implementation maintains MUST be derivable from `MachineState` alone and MUST NOT change observable semantics.

## 2. Instruction Set Architecture (ISA)

The Instruction Set Architecture defines the **complete set of primitive operations** that the Relational Computer must support over its memory units (Cells) and temporal structures (Traces). These operations are the *only* computational mechanisms available at runtime.

Every higher-level behavior—terms, profile semantics, observation processing, normalization, fixed-point behavior—**must be derivable from compositions of these primitive instructions**, so that all observable behavior is grounded in the ISA.

The ISA is divided into three layers:

1. **Algebraic Layer** – logical and lattice operations within a Cell.
2. **Modal Layer** – closure and dynamic operators (`nucleus`, `flow`) and their fixed points.
3. **Temporal Layer** – operations on Traces, including normalization and flow lifting.

Each instruction MUST:

* be total (defined for all valid inputs),
* preserve Cell invariants,
* return results that either remain inside the Cell or produce new derived values consistent with the Cell's algebraic structure.

---

### 2.1 Algebraic Operators

These operators manipulate recognition elements *within a single Cell*. They form the logical / order-theoretic core of the machine.

**meet(cell, a, b) → element**

* Returns the greatest lower bound of `a` and `b` with respect to the Cell’s order.
* MUST satisfy:
  * `meet(a,b)` ≤ `a` and `meet(a,b)` ≤ `b`, and
  * for every `c`, if `c` ≤ `a` and `c` ≤ `b` then `c` ≤ `meet(a,b)`.
* MUST be commutative, associative, and idempotent:

  ```text
  meet(a,b)        = meet(b,a)
  meet(meet(a,b),c)= meet(a,meet(b,c))
  meet(a,a)        = a
  ```

**join(cell, a, b) → element**

* Returns the least upper bound of `a` and `b`.
* MUST satisfy:
  * `a` ≤ `join(a,b)` and `b` ≤ `join(a,b)`, and
  * for every `c`, if `a` ≤ `c` and `b` ≤ `c` then `join(a,b)` ≤ `c`.
* MUST be commutative, associative, and idempotent:

  ```text
  join(a,b)        = join(b,a)
  join(join(a,b),c)= join(a,join(b,c))
  join(a,a)        = a
  ```

**imply(cell, a, b) → element**

* Heyting implication.
* MUST satisfy the Heyting adjunction law:

  ```text
  leq(cell, c, imply(a,b))  is true
    iff
  leq(cell, meet(c,a), b)   is true
  ```

  for every element `c` in the Cell. In particular,

  ```text
  meet(a, imply(a,b)) ≤ b
  ```
  and `imply` is monotone in its second argument and antitone in its first argument with respect to `leq`.

**negate(cell, a) → element**

* Pseudocomplement.
* MUST be definitionally equal to implication into `bottom`:

  ```text
  negate(cell, a) = imply(cell, a, bottom(cell))
  ```

  and MUST satisfy:

  ```text
  meet(a, negate(a)) = bottom(cell)
  ```
  together with the adjunction law above.

**leq(cell, a, b) → Bool**

* True iff `a` ≤ `b` under the Cell's order.
* MUST be a partial order (reflexive, antisymmetric, transitive).
* MUST be compatible with `meet` and `join` in both directions:

  ```text
  leq(cell, a, b)          is true   iff  meet(a,b) = a
  leq(cell, a, b)          is true   iff  join(a,b) = b
  ```

**top(cell) → element**

* Returns the Cell's maximum element.

**bottom(cell) → element**

* Returns the Cell's minimum element.

These algebraic operations correspond exactly to the recognition-structure constructors and normalizers that generate the Cell’s finite algebra. Together they make each Cell into a finite bounded Heyting algebra whose order, lattice operations, implication, and pseudocomplement are all mutually determined by the laws listed above.

In addition, the algebraic operators MUST be realizable as induced operations on equivalence classes of witness traces. Concretely, for any Cell `c` and elements `a`, `b` in that Cell, whenever there exist witness traces `t_a`, `t_b` with:

```text
witness_recognition(t_a) = (c, a)
witness_recognition(t_b) = (c, b)
```

there MUST exist witness traces `t_meet`, `t_join`, `t_imply`, and `t_negate` such that:

```text
witness_recognition(t_meet)   = (c, meet(c, a, b))
witness_recognition(t_join)   = (c, join(c, a, b))
witness_recognition(t_imply)  = (c, imply(c, a, b))
witness_recognition(t_negate) = (c, negate(c, a))
```

and these traces are obtained from `t_a`, `t_b` by a finite sequence of `extend_trace`, `concat_trace`, and `normalize_trace` operations that append a single operator-application step of the appropriate kind and then normalize. Any two witnesses for the same algebraic result MUST normalize to witness traces that project to the same recognition via `witness_recognition` after applying `NF_trace` and `NF_recognition`.

---

### 2.2 Modal Operators

Modal operators provide closure and dynamics. They are the only ways recognition elements evolve over “time” or under internal constraints.

**nucleus(cell, a) → element**

* Closure operator.
* MUST satisfy: `a` ≤ `nucleus(a)` (extensive).
* MUST be monotone: if `a` ≤ `b` then `nucleus(a)` ≤ `nucleus(b)`.
* MUST be idempotent in the KZ-lax sense.
* MUST interact with `meet` and `join` via the following closure-distribution equalities, for all elements `x`, `y`:

  ```text
  nucleus(meet(x, nucleus(y))) = nucleus(meet(x, y))
  nucleus(join(nucleus(x), y)) = nucleus(join(x, y))
  ```

**flow(cell, a) → element**

* Dynamic operator.
* MUST satisfy monotonicity and inflationarity: `a` ≤ `flow(a)`.
* MUST satisfy the flow-over-meet inequality, for all `x`, `y`:

  ```text
  flow(meet(x, y)) ≤ meet(flow(x), flow(y))
  ```

**fix_nucleus(cell, a) → element**

* Computes the least nucleus-fixed element ≥ `a`.
* MUST compute via iterated `nucleus` on the finite carrier.

**fix_flow(cell, a) → element**

* Computes the least flow-fixed element ≥ `a`.
* MUST compute via iterated `flow` on the finite carrier.

**fix_both(cell, a) → element**

* Computes the least element ≥ `a` that is fixed by both nucleus and flow.

**Commutation Requirement:**

```
flow(nucleus(a)) = nucleus(flow(a))
```

This requirement captures the flow–closure compatibility conditions required by the machine’s modal laws.

As with the algebraic operators, the modal operators MUST be realizable as induced operations on equivalence classes of witness traces. For any Cell `c` and element `a` with a witness trace `t_a` such that `witness_recognition(t_a) = (c, a)`, there MUST exist witness traces `t_nucleus`, `t_flow`, and traces witnessing the least fixed points `fix_nucleus(c,a)`, `fix_flow(c,a)`, `fix_both(c,a)` such that:

```text
witness_recognition(t_nucleus) = (c, nucleus(c, a))
witness_recognition(t_flow)    = (c, flow(c, a))
```

and these traces are obtained from `t_a` by a finite sequence of `extend_trace`, `concat_trace`, `normalize_trace`, and, where needed, `flow_trace` operations that append a single operator-application step of the appropriate kind and then normalize. The commutation and distribution laws for `nucleus` and `flow` in this section correspond to equalities between the normalized witness traces obtained by applying the corresponding construction rules at the witness-trace level and then projecting back via `witness_recognition`.

---

### 2.3 Temporal / Witness Trace Operators

Witness-trace instructions operate on `Trace` carriers and therefore on canonical representatives of witness traces in the ambient quasicrystalline hypertensor topos. They form a minimal temporal calculus for sequencing, normalizing, and evolving these traces in a way that respects the internal geometry and modal structure of the topos.

**empty_trace() → Trace**

* Creates a canonical empty trace.

**extend_trace(trace, step) → Trace**

* Appends a step to the trace. The appended `step` MUST be a well-formed `TraceStep` whose `kind` and `payload` are compatible with the current `MachineState` and any dependency constraints implied by the hypertensor structure (for example, it must not refer to non-existent Cells or Profiles).

**concat_trace(t1, t2) → Trace**

* Concatenates trace `t1` with trace `t2`.

**normalize_trace(trace) → Trace**

* Computes a canonical representative modulo shuffle-equivalence for witness traces.
* MUST be idempotent.
* MUST be observationally equivalent to applying `NF_trace` as defined in §6.3: for every trace `t`, `normalize_trace(t)` and `NF_trace(t)` represent the same canonical witness trace, and any use of trace equality inside the ISA is equivalent to comparing `NF_trace` results.
* MUST respect the independence relation on steps induced by the internal quasicrystalline hypertensor topos: steps that act on tensor-separated or otherwise independent components of the internal structure are treated as commuting and can be reordered, while dependent steps are not.

**trace_equiv(t1, t2) → Bool**

* True iff `normalize_trace(t1) == normalize_trace(t2)`.

**head_of_trace(trace) → (CellID, ElementID)**

* Extracts the recognition element associated with the trace’s head.

**tail_of_trace(trace) → Trace**

* Returns a trace representing the remainder.

**flow_trace(trace) → Trace**

* Applies `flow` to each recognition referenced by the trace, then normalizes.
* MUST be compatible with witness-trace semantics: whenever `witness_recognition(t) = (c, e)` is defined, `witness_recognition(NF_trace(flow_trace(t)))` MUST be defined and equal to `(c, flow(c, e))`.

This operator is the temporal counterpart of modal evolution.

**Step support and independence (normative)**

Each `TraceStep` has a finite **read support** and **write support** describing which recognitions and judgments it inspects or updates:

```text
read_support(step)  ⊆  {("recognition", CellID, ElementID)} ∪ {("judgment", JudgmentID)}
write_support(step) ⊆  {("recognition", CellID, ElementID)} ∪ {("judgment", JudgmentID)}
```

For each `TraceStepKind`, an implementation MUST define `read_support` and `write_support` in a way that is consistent with the semantics of the corresponding operator or observation action.

Two steps `s1`, `s2` are **independent** iff:

```text
write_support(s1) ∩ (read_support(s2) ∪ write_support(s2)) = ∅
write_support(s2) ∩ (read_support(s1) ∪ write_support(s1)) = ∅
```

and at least one of `write_support(s1)` or `write_support(s2)` is empty. Intuitively, independent steps either:

* operate only on disjoint recognitions/judgments, or
* are read‑only with respect to those recognitions/judgments.

The **independence relation on steps** used to define shuffle-commutation in §6.3 MUST, at a minimum, treat all such pairs `(s1, s2)` as commuting. An implementation MAY further restrict which pairs of steps are considered independent (for example, to reflect additional geometric or tensor structure), but it MUST NOT declare dependent steps independent.

---

### 2.4 Operator Invariant Contracts

Each instruction in the ISA MUST satisfy a set of invariant contracts.

**For algebraic operators:**

* MUST preserve the Cell's lattice and Heyting axioms, including the greatest-lower-bound / least-upper-bound properties, the adjunction law for implication, and the definition of `negate` as implication into `bottom`.
* MUST NOT produce any element not in the Cell’s carrier.

**For modal operators:**

* MUST preserve monotonicity.
* MUST preserve fixed points.
* MUST satisfy flow–nucleus commutation.
* `nucleus` MUST satisfy the closure-distribution equalities over `meet` and `join` given in §2.2.
* `flow` MUST satisfy the flow-over-meet inequality given in §2.2.

**For trace operators:**

* MUST preserve normalization rules.
* MUST ensure concatenation and shuffle-equivalence behave consistently.

Operators MUST NOT introduce new invariants or violate those encoded in the Cell.

If an ISA operator is invoked on inputs that violate its preconditions (for example, an `ElementID` not present in the Cell’s carrier, or a Trace referencing a non-existent step), the operation MUST fail without mutating any Cell, Profile, or Trace, and the failure MUST be representable as an `Error` carrier as defined in §8.4. Implementations MUST enforce these preconditions, either statically or dynamically; behaviour on invalid inputs is always “reject without mutation.”

This section defines the minimal runtime semantics the machine must support before any higher-level profile or observation behavior can be implemented.

## 3. Profile Layer

Profiles are **derived semantic structures** built over a subset of Cells. A Profile provides:

1. A *local view* into recognition elements across selected Cells.
2. An *emergent term language* (syntax) derived from recognition structure.
3. A *typing and judgment system* that regulates which terms are meaningful.
4. A *semantic interpretation* mapping well-typed terms to recognition elements.
5. A *profile‑local dynamic environment* (flow-restricted, nucleus-restricted).

Profiles are not primitive: they are **constructed objects** whose behavior is fully determined by Cell contents and ISA operations.
All Profile behavior, including syntax, typing, judgments, and term evaluation, is **profile-local**: there is no global term language or cross-profile typing context, and no Profile may depend on the internal syntax, typing, or term evaluation rules of any other Profile.

---

### 3.1 Profile Definition

A Profile is defined by:

```
Profile:
  id: ProfileID
  visible_cells: set[CellID]
  recognitions: set[(CellID, ElementID)]       # derived
  fixed_recognitions: set[(CellID, ElementID)] # derived via closure and flow

  syntax: SyntaxSpec              # derived term constructors
  typing_rules: TypingSpec        # profile-specific type system
  judgment_rules: JudgmentSpec    # contextual judgment system

  interpret_term(term, context) → RecognitionElement
```

An implementation MUST realize Profiles as concrete records with at least these fields. Additional derived fields (e.g. cached invariants, spectral summaries, phase space descriptions) are permitted as long as they are deterministic functions of the listed fields and the underlying Cells.

**3.1.1 Visible Cells**
The Profile begins as a view over a designated set of Cells. The Profile has access to all recognition elements inside these Cells and restricts or filters them using invariants.

**3.1.2 ProfileRecognitions**
Derived as:

```
recognitions = { (c, e) | c ∈ visible_cells AND satisfies_profile_invariants(c, e) }
```

Invariants include:

* closure compatibility,
* flow compatibility,
* lattice consistency.

**3.1.3 FixedProfileRecognitions**
Derived by applying fixed-point operators:

```
fixed_recognitions = { (c,e) | nucleus(c,e) = e AND flow(c,e) = e }
```

These serve as the stable semantic base on which the profile's logic is built.

---

### 3.2 Syntax Layer (Emergent Term Language)

The profile exposes a term language **forced by the recognition structure**. This term language is internal to a single Profile: term constructors, types, typing contexts, and evaluation rules are defined per Profile and MUST NOT be shared or implicitly identified across Profiles. The term constructors listed here are the complete core term language for this specification.

**Supported term constructors:**

```
Term ::=
    Var(name)
  | Lam(name, Type, Term)
  | App(Term, Term)
  | FixLeast(name, Type, Term)
  | FixGreatest(name, Type, Term)

  # Embeddings of recognition-level operations:
  | Recog(CellID, ElementID)
  | NucleusTerm(Term)
  | FlowTerm(Term)
  | MeetTerm(Term, Term)
  | JoinTerm(Term, Term)
  | ImplyTerm(Term, Term)
  | NegateTerm(Term)
```

Profiles MUST implement each term constructor listed above. No additional term constructors are assumed beyond those listed here.

---

### 3.3 Typing Layer

A Profile maintains typing rules that regulate which terms are meaningful.

**Types supported:**

```text
Type ::=
    Rec
  | Arrow(Type, Type)
  | FixTypeLeast(Type → Type)
  | FixTypeGreatest(Type → Type)
```

A typing context `Γ` is:

```text
Context:
  variables: map[name → Type]      # finite map
  profile_index: optional structure for contextual indexing
```

Profiles MUST support typing judgments of the form:

```text
Γ ⊢ term : Type
```

At minimum, the following typing rules MUST hold (writing `Γ, x:A` for context extension and assuming all free variables are declared in `Γ`):

Variable:

```text
(x:A ∈ Γ)
───────────────  VAR
Γ ⊢ Var(x) : A
```

Lambda abstraction:

```text
Γ, x:A ⊢ t : B
────────────────────────────  LAM
Γ ⊢ Lam(x:A, t) : Arrow(A,B)
```

Application:

```text
Γ ⊢ f : Arrow(A,B)    Γ ⊢ u : A
────────────────────────────────  APP
Γ ⊢ App(f,u) : B
```

Recognition embedding:

```text
(c,e) ∈ recognitions
───────────────────────────────  RECOG
Γ ⊢ Recog(c,e) : Rec
```

Algebraic and modal constructors (for all terms `a`, `b` with type `Rec`):

```text
Γ ⊢ a : Rec    Γ ⊢ b : Rec
───────────────────────────  MEET
Γ ⊢ MeetTerm(a,b) : Rec

Γ ⊢ a : Rec    Γ ⊢ b : Rec
───────────────────────────  JOIN
Γ ⊢ JoinTerm(a,b) : Rec

Γ ⊢ a : Rec    Γ ⊢ b : Rec
───────────────────────────  IMPLY
Γ ⊢ ImplyTerm(a,b) : Rec

Γ ⊢ a : Rec
────────────────────  NEG
Γ ⊢ NegateTerm(a) : Rec

Γ ⊢ a : Rec
────────────────────────  FLOW
Γ ⊢ FlowTerm(a) : Rec

Γ ⊢ a : Rec
────────────────────────────  NUCLEUS
Γ ⊢ NucleusTerm(a) : Rec
```

Fixed points (schematic form, constrained by the least/greatest fixed-point laws of this specification):

```text
Γ, x:FixTypeLeast(F) ⊢ t : F(FixTypeLeast(F))
──────────────────────────────────────────────  FIX-LEAST
Γ ⊢ FixLeast(x:FixTypeLeast(F), t) : FixTypeLeast(F)

Γ, x:FixTypeGreatest(F) ⊢ t : F(FixTypeGreatest(F))
────────────────────────────────────────────────────  FIX-GREATEST
Γ ⊢ FixGreatest(x:FixTypeGreatest(F), t) : FixTypeGreatest(F)
```

Any refinement or restriction of these typing rules (for example, limiting which function spaces are admissible) MUST be justified by additional fixed-point or typing structure and MUST remain conservative with respect to the rules stated here.

Typing contexts and judgments are strictly profile-local: the symbol `Γ ⊢ term : Type` is always interpreted as a judgment in exactly one Profile `P`, and there is no notion of a globally shared context or a term that is well-typed in multiple Profiles unless this is witnessed by separate, profile-specific typing derivations.

---

### 3.4 Judgment Layer

Judgments generalize typing: they express profile-level truths and constraints.

Judgments are written:

```text
Γ ⊢ J
```

where `Γ` is a typing context as in §3.3 and `J` is one of:

* an equality or equivalence of terms at type `Rec` (written informally as `a ≡ b`);
* an order judgment on terms at type `Rec` (written `a ≤ b`);
* an observation-equivalence judgment between Observations (written `obs1 ≈ obs2`).

Judgments MUST be compositional, profile-local, and monotone with respect to profile expansions (if `Γ ⊢ J` and `Γ ⊆ Γ'`, then `Γ' ⊢ J`).

**Core judgmental rules**

Let `Γ ⊢ a : Rec`, `Γ ⊢ b : Rec`, and let their evaluations satisfy:

```text
Γ ⊢_P a ⇓ (c, e_a)
Γ ⊢_P b ⇓ (c, e_b)
```

Equality at type `Rec` is induced by recognition normalization:

```text
NF_recognition(c, e_a) = NF_recognition(c, e_b)
───────────────────────────────────────────────  J-EQ-REC
Γ ⊢ a ≡ b
```

Order judgments at type `Rec` are induced by the Cell’s order:

```text
leq(c, e_a, e_b) = true
────────────────────────  J-ORDER
Γ ⊢ a ≤ b
```

Observation-equivalence judgments are induced by the observation normalization procedures of §6.1–§6.3. For Observations `obs1`, `obs2`:

```text
NF_observation(obs1) = NF_observation(obs2)
────────────────────────────────────────────  J-OBS-EQ
Γ ⊢ obs1 ≈ obs2
```

Here `NF_observation` applies `NF_trace`, term normalization (if any), and `NF_recognition` as defined in §6.1.

These core judgments MUST satisfy:

* **compatibility with typing and evaluation**: if `Γ ⊢ a ≡ b` and `Γ ⊢ a : Rec`, `Γ ⊢ b : Rec`, then any evaluations `Γ ⊢_P a ⇓ (c, e_a)` and `Γ ⊢_P b ⇓ (c, e_b)` satisfy `NF_recognition(c, e_a) = NF_recognition(c, e_b)`;
* **stability under context extension**: if `Γ ⊢ J` and `Γ ⊆ Γ'`, then `Γ' ⊢ J` for all judgments `J`;
* **congruence with the Observation Pipeline**: replacing an Observation with an equivalent one (judged by `obs1 ≈ obs2`) at any stage of the Observation Pipeline (§4) yields the same effect on `MachineState` up to normalization of traces and recognitions.

---

### 3.5 Semantic Interpretation Layer

A Profile defines a semantics function:

```text
interpret_term_P(term, Γ) → (CellID, ElementID)
```

that reduces a well-typed term to a recognition element that lives inside one of the Profile’s visible Cells.

Semantics is expressed via an evaluation judgment:

```text
Γ ⊢_P term ⇓ (c, e)
```

meaning “in Profile `P` and context `Γ`, `term` evaluates to recognition `(c,e)`”.

**Core semantic equations**

For recognition-level constructs:

```text
Γ ⊢ Recog(c,e) : Rec
────────────────────────────────  SEM-RECOG
Γ ⊢_P Recog(c,e) ⇓ (c, e)

Γ ⊢_P a ⇓ (c, e_a)    Γ ⊢_P b ⇓ (c, e_b)
─────────────────────────────────────────  SEM-MEET
Γ ⊢_P MeetTerm(a,b) ⇓ (c, meet(c, e_a, e_b))

Γ ⊢_P a ⇓ (c, e_a)    Γ ⊢_P b ⇓ (c, e_b)
─────────────────────────────────────────  SEM-JOIN
Γ ⊢_P JoinTerm(a,b) ⇓ (c, join(c, e_a, e_b))

Γ ⊢_P a ⇓ (c, e_a)    Γ ⊢_P b ⇓ (c, e_b)
─────────────────────────────────────────  SEM-IMPLY
Γ ⊢_P ImplyTerm(a,b) ⇓ (c, imply(c, e_a, e_b))

Γ ⊢_P a ⇓ (c, e_a)
────────────────────────────────  SEM-NEG
Γ ⊢_P NegateTerm(a) ⇓ (c, negate(c, e_a))

Γ ⊢_P a ⇓ (c, e_a)
───────────────────────────────────────  SEM-FLOW
Γ ⊢_P FlowTerm(a) ⇓ (c, flow(c, e_a))

Γ ⊢_P a ⇓ (c, e_a)
───────────────────────────────────────────  SEM-NUCLEUS
Γ ⊢_P NucleusTerm(a) ⇓ (c, nucleus(c, e_a))
```

For fixed points, `FixLeast` and `FixGreatest` MUST denote least and greatest fixed points of the underlying monotone operators encoded in the type `F`, computed using ISA operators on finite carriers. The exact evaluation strategy is implementation-specific as long as the resulting recognitions satisfy the fixed-point equations imposed by §2.2 and §9.2.

**Typing soundness and totality**

The semantics MUST:

* only use ISA operators (`meet`, `join`, `imply`, `negate`, `nucleus`, `flow`, fixed-point operators, and trace operators),
* never mutate Cells or Profiles directly,
* produce recognition elements consistent with profile invariants,
* respect typing: if `Γ ⊢ term : Rec`, then `Γ ⊢_P term ⇓ (c, e)` is defined and yields `(c, e)` with `(c,e) ∈ recognitions`.

Term evaluation in a Profile is algebra over witness traces and therefore induces the Profile’s normalization behavior. For every evaluation

```text
Γ ⊢_P term ⇓ (c, e)
```

there exists at least one witness trace `t` with `witness_recognition(t) = (c, e)` such that:

* each semantic constructor in the evaluation (for example, `SEM-MEET`, `SEM-JOIN`, `SEM-IMPLY`, `SEM-NEG`, `SEM-FLOW`, `SEM-NUCLEUS`) is realized by appending a single operator-application step of the appropriate kind to operand witness traces using `extend_trace` / `concat_trace` and then applying `normalize_trace` (and, where needed, `flow_trace`), and
* replacing any witness trace `t` by `NF_trace(t)` and projecting via `witness_recognition` yields the same canonical recognition `NF_recognition(c, e)` as required by §6.3–§6.4.

Thus, Profile term reduction is implemented as algebra on witness traces, and the normalization procedures of §6 are the induced canonical forms of this trace-indexed algebra.

**λ-calculus fragment and β-compatibility**

For the λ-calculus fragment, semantics MUST be β-compatible. Whenever:

```text
Γ, x:A ⊢ t : B     Γ ⊢ u : A
```

and both sides are well-defined, the following equality MUST hold up to recognition normalization:

```text
Γ ⊢_P App(Lam(x:A, t), u) ⇓ (c, e)
iff
Γ ⊢_P t[x := u] ⇓ (c, e')
```

with:

```text
NF_recognition(c, e) = NF_recognition(c, e')
```

where `t[x := u]` is the capture-avoiding substitution of `u` for `x` in `t` expressed in the core term language.

**Stability under flow and nucleus**

Semantics MUST also be stable under `flow` and `nucleus` for terms of type `Rec`. If:

```text
Γ ⊢ term : Rec    Γ ⊢_P term ⇓ (c, e)
```

then:

```text
Γ ⊢_P FlowTerm(term)    ⇓ (c, flow(c, e))
Γ ⊢_P NucleusTerm(term) ⇓ (c, nucleus(c, e))
```

and the resulting recognitions MUST satisfy the same typing and normalization properties as in the original judgment.

The evaluation relation `Γ ⊢_P term ⇓ (c, e)` and the function `interpret_term_P(term, Γ)` MUST agree: for all well-typed terms,

```text
interpret_term_P(term, Γ) = (c, e)
iff
Γ ⊢_P term ⇓ (c, e).
```

Semantics is strictly profile-local: the function `interpret_term_P` and the evaluation judgment `Γ ⊢_P term ⇓ (c, e)` are defined independently for each Profile `P`. There is no global evaluation relation that mixes terms or contexts from different Profiles, and no Profile may rely on or mutate the internal term language or evaluation behavior of any other Profile.

---

### 3.6 Profile Construction Pipeline

Profiles MUST be constructed in the following order, because each stage depends on data and invariants produced by the earlier stages:

1. **ProfileRecognitions**: extract visible recognitions.
2. **FixedProfileRecognitions**: restrict to fixed points under flow + nucleus.
3. **ProfileInvariantLattice / ProfileInvariantOrder**: compute invariant structures.
4. **ConstructContexts**: initialize typing contexts.
5. **CalculateProfileSyntax**: derive term constructors and grammar.
6. **JudgeProfile**: establish typing and general judgment rules.
7. **StructureSemantics**: define term→recognition interpretation.
8. **ProfileSemantics**: restrict semantics to profile-local invariants.
9. **FlowProfile**: restrict dynamic behavior to profile’s recognitions.
10. **FixedFlowProfile**: compute stable dynamic behavior inside profile.
11. **BuildProfileTower** (optional): build enriched fiber/category structures.

Every step in this pipeline MUST be executed in this order to ensure a valid profile. The standard program `ConstructProfile` (§5.3.1) realizes this pipeline for a single Profile.

### 3.7 Judgment Carriers and State–Judgment Separation

Judgments are first-class carriers that represent profile-level statements about recognitions, traces, or observations, rather than recognitions themselves.

```text
Judgment:
  id:       JudgmentID
  context:  Context              # as in §3.3
  formula:  JudgmentFormula      # normalized representation
```

`JudgmentFormula` encodes one of:

* equality or equivalence of terms at type `Rec`;
* order statements `a ≤ b` at type `Rec`;
* observation-equivalence statements between Observations;
* other profile-local judgments introduced by the profile’s judgment system.

JudgmentIDs MUST be derived from the canonical encoding of `(context, formula)` as in §6.6. `NF_judgment` (§6.2) operates on these canonical encodings, and `judgment_equiv` corresponds to ID equality after normalization. Implementations MUST treat recognitions (elements of Cells and Profiles) and judgments (Judgment carriers) as distinct carrier kinds: recognitions describe state, judgments describe assertions about that state.

### 3.8 Profile Topos Structure

Each Profile `P` MUST realize the structure of a small topos over its fixed recognitions.

Concretely, for each Profile `P`:

* there exists a distinguished subobject classifier carrier `Ω_P` (a Cell or Profile-local carrier) whose elements represent internal truth values for profile-invariant subobjects of the recognition lattice on `P.fixed_recognitions`;
* there exist carriers and operator composites that compute finite limits and pullbacks of profile-invariant recognitions;
* there exist carriers and operator composites that compute exponentials between profile-invariant recognitions;
* the triple (finite limits, exponentials, subobject classifier) is packaged as a `ProfileTopos(P)` carrier witnessing that `P` satisfies the internal topos laws.

Operationally, `ProfileTopos(P)` MUST expose at least:

```text
ProfileTopos(P):
  objects: set[ProfileObjectID]
  arrows:  set[ProfileArrowID]
  src:     map[ProfileArrowID → ProfileObjectID]
  tgt:     map[ProfileArrowID → ProfileObjectID]
  compose: partial map[(ProfileArrowID, ProfileArrowID) → ProfileArrowID]
  id:      map[ProfileObjectID → ProfileArrowID]
  is_mono: predicate on ProfileArrowID

  subobject_classifier: ProfileObjectID   # Ω_P
  truth:              ProfileArrowID      # true_P: 1 → Ω_P
```

where:

* each `ProfileObjectID` denotes a Profile-local object that is realized as a carrier constructed from `P.fixed_recognitions` (for example, a designated family of recognitions together with their induced structure);
* each `ProfileArrowID` denotes a morphism between such objects, realized by a Profile-local program or operator composite whose semantics is a map between the underlying recognition families;
* `compose` and `id` satisfy the usual category axioms when interpreted via these semantics;
* `is_mono` identifies those arrows whose semantics is injective up to `recognition_equiv` (§6.4) on the underlying recognition families.

Implementations MUST ensure that:

* subobjects of any profile-invariant recognition (viewed as an object in the internal category whose objects are built from `P.fixed_recognitions`) are in bijection with morphisms into `Ω_P`, in the usual sense of a subobject classifier: for every mono `m: U ↪ X` there exists a unique `χ_m: X → Ω_P` such that `U` is (up to isomorphism) the pullback of a distinguished truth arrow `true_P: 1 → Ω_P` along `χ_m`;
* exponential objects and finite limits satisfy the usual topos equations and are stable under the Profile’s normalization and equivalence procedures.

## 4. Observation Pipeline

The Observation Pipeline specifies how **external information** enters a Profile, is interpreted, evolved, and either integrated into the Profile’s stable structure or discarded.

Observations do **not** interact with Cells directly. All interaction is mediated by:

* the Profile’s internal term/typing/judgment machinery (§3), and
* the machine core ISA (§2).

---

### 4.1 Observation Object

An Observation carrier is an internal pair:

```
Observation:
  trace: Trace
  term:  Term
```

* `trace` encodes temporal/event information.
* `term` encodes the content, expressed in the Profile’s internal term language.

Opaque, non-semantic metadata carried alongside Observations MUST NOT affect typing, semantics, normalization, or nucleation decisions. All semantically relevant information MUST flow through `trace` and `term` only.

The Observation is always associated with a particular Profile.

---

### 4.2 Intake & Typing

**Step 1: Profile selection**

* An incoming Observation is routed to a specific Profile `P` (by ProfileID or routing logic outside this spec).

**Step 2: Typechecking**

* The Profile applies its typing rules (§3.3):

```
Γ_P ⊢ term : T
```

* If typing fails, the Observation is **rejected** and MUST cause no mutation to any Cell, Profile, or Trace.

At this point, the Observation’s `term` is a well-formed, well-typed internal expression in `P`.

---

### 4.3 Semantic Interpretation

**Step 3: Interpret term into recognitions**

The Profile evaluates:

```
(rec_cell, rec_elem) = interpret_term(term, Γ_P)
```

using the rules in §3.5.

Properties:

* The resulting element MUST live in one of `P.visible_cells`.
* The element MUST be consistent with `P.recognitions` (after applying profile invariants).

This stage is governed by the profile’s semantics as defined in §3.5.

---

### 4.4 Temporal Evolution (Flow/Trace)

**Step 4: Evolve observation along trace**

The machine evolves the Observation’s trace and associated recognitions:

1. **Evolve trace:**
   ```
   evolved_trace = flow_trace(observation.trace)
   ```
Here `flow` is restricted to the Profile’s dynamic structure.

Implementations MUST ensure that:

* `flow_trace` is compatible with `flow` on recognitions: evolving the trace and then interpreting yields the same result (up to normalization) as interpreting and then applying `flow` at the recognition level;
* repeated application of `flow_trace` converges (on finite traces) to a fixed trace representative under `NF_trace`, as required by the temporal closure laws of this specification.

---

### 4.5 Kernel & Deviation Analysis

**Step 5: Build and apply observation kernel**

Any Profile that materializes the observation-kernel machinery (including kernel construction and deviation measurement) MUST compute an Observation Kernel to compare expected vs. actual evolution:

Conceptually:

```
K = build_observation_kernel(P, evolved_trace, rec_cell, rec_elem)
Δ = measure_deviation(K, P)
```

The deviation `Δ` characterizes whether the observation is compatible with the Profile’s dynamics and invariants.

The exact representation of `K` and `Δ` is Profile-dependent but MUST be expressible solely in terms of:

* recognition elements,
* ISA operations,
* and Profile-local invariants.

Implementations MUST treat `K` as a kernel over `PhaseSpace(P)` (§10.1): for any fixed state `s`, `K(s)` is a (possibly weighted) set of successor recognitions. Deviation `Δ` MUST quantify the difference between:

* the successor behavior predicted by `K`, and
* the successor behavior actually induced by the observation’s evolved trace and recognitions.

Deviation measures MUST be:

* non-negative,
* zero exactly when the observation is fully compatible with the kernel,
* monotone with respect to refinement of observations (more precise observations cannot reduce deviation below zero).

---

### 4.6 Nucleation Decision

**Step 6: Decide whether to integrate the observation**

The Profile uses its closure operator (`nucleus`) and dynamic behavior (`flow`) to decide whether the observed recognition becomes part of its stable structure:

1. Compute closure:

   ```
   stable_elem = nucleus(rec_cell, rec_elem)
   ```
2. Check joint stability under flow and nucleus:

   ```
   is_nucleus_fixed = (stable_elem == rec_elem)
   is_flow_fixed    = (flow(rec_cell, stable_elem) == stable_elem)
   ```
3. Integrate deviation information `Δ` into the decision using a Profile-specific but deterministic policy as constrained in §4.7.

If the recognition is sufficiently stable and deviation acceptable under the Profile’s nucleation policy, the Profile **nucleates** the observation:

* It updates `fixed_recognitions` to include `(rec_cell, stable_elem)`.

If the recognition is not stable or deviation exceeds the Profile’s nucleation threshold, the Profile MUST treat the observation as transient and MUST NOT integrate it.

---

### 4.7 Profile State Update

**Step 7: Commit changes back to the Profile and Cells**

When nucleation occurs:

* The Profile updates its internal sets:

  * `recognitions`
  * `fixed_recognitions`
  * any ProfileInvariant* values that depend on them.

* When the underlying Cells are updated to reflect new fixed elements or re-labeled equivalence classes, this MUST occur only via ISA operations that preserve invariants.

No other side effects are allowed.

Nucleation thresholds or policies (for example, based on deviation magnitude or spectral mode content) MUST be functions of:

* the canonical observation (`NF_observation`),
* the kernel and deviation data (`K`, `Δ`),
* and existing Profile invariants and phase space.

Ad-hoc, extrinsic state or randomness MUST NOT influence nucleation decisions; nucleation decisions MUST be pure functions of the inputs listed above.

## Part II — Execution and State Evolution (Normative)

Part II comprises §§5–7. It specifies how the core model from Part I is executed as Programs over the ambient operator graph (§5), how normalization and canonicalization govern equality and identity (§6), and how a Relational Computer bootstraps and evolves its `MachineState` over time (§7).

## 5. Execution Layer and Primitive Component Tables

This section describes how the algebraic machinery of §§1–4 is realized as an actual executing machine: the ambient operator graph, programs, and operator implementations. It also catalogs the primitive components (operators, constructors, and stages) that make up the runtime architecture (Cells, ISA, Profiles, Observations).

### 5.0 Ambient Category and Execution Layer

The Relational Computer executes inside an **ambient operator graph** whose nodes are canonical carriers (Cells and Profiles) and whose edges are typed operator instances.

**Edges and Edge Objects**

Each edge represents a single application of an operator (typically a primitive ISA operator or profile-level morphism). Implementations MUST realize edges as:

```text
Edge:
  id:          EdgeID
  operator:    OperatorName          # e.g. "Flow", "Nucleate", "Observe"
  src:         NodeID                # source node (CellID or ProfileID)
  tgt:         NodeID                # target node
  program_id:  optional ProgramID    # if produced by a program
  step_index:  optional int          # index within the program
  evidence_ids:optional set[EdgeID]  # supporting edges/observations
```

`MachineState.edges` is the set of currently materialized edges. Persisting or discarding edges MUST NOT introduce any additional semantics beyond recording that a particular operator instance has been executed and its result committed.

**Programs**

A *program* is a finite, linear composite of operator applications. Implementations MUST realize programs as:

```text
Program:
  id:    ProgramID
  steps: list[ProgramStep]

ProgramStep:
  index:        int
  operator:     OperatorName         # primitive or composite operator name
  input_nodes:  list[NodeID]         # Cells/Profiles consumed
  output_kinds: list[NodeKind]       # expected kinds of outputs
```

Programs are **morphisms**, not workflows: there is no branching, looping, retry, or scheduling semantics. A program describes a closed-world, typed composition of operators that MUST either succeed as a whole (committing its outputs to `MachineState`) or fail without mutating `MachineState`.

Programs do not introduce new semantics; they are purely syntactic composites of primitive operators defined elsewhere in this specification.

**Program specification schema**

This document describes standard programs using an abstract `ProgramSpec` schema:

```text
ProgramSpec:
  name:          ProgramName
  inputs:        list of logical inputs
  outputs:       list of logical outputs
  preconditions: predicates over MachineState and inputs
  postconditions:predicates over MachineState and outputs
  step_schema:   ordered list of abstract stages
```

The fields have the following roles:

* `name` identifies the program.
* `inputs` lists the logical inputs (for example, `MachineState`, `ProfileID`, external payloads) required to invoke the program.
* `outputs` lists the logical outputs (for example, updated `MachineState`, created IDs, diagnostic carriers) that are observable at the program boundary.
* `preconditions` are predicates over the initial `MachineState` and inputs that MUST hold for the program to be applicable. If a precondition does not hold, the program invocation MUST fail without mutating `MachineState` and MUST yield an appropriate `Error` carrier as described in §8.4 and §9.8.
* `postconditions` are predicates over the final `MachineState` and outputs that MUST hold whenever the program invocation succeeds.
* `step_schema` is an ordered list of abstract stages, each of which is realized by one or more `ProgramStep`s that invoke primitive operators. The step schema constrains the structure of the computation but does not require a unique low-level sequence of `ProgramStep`s.

For each named standard program in this specification, a conformant implementation MUST realize some `Program` whose observable effect under `exec_program` (§5.0) satisfies all stated preconditions and postconditions and whose structure respects the given `step_schema` up to the equivalence induced by primitive operator composition.

**Operator implementations**

Each primitive operator introduced in §2 and the tables below MUST have an associated *operator implementation*: a pure function that implements its semantics.

Conceptually, an operator implementation is a total function:

```text
impl_operator(input_payloads, MachineState) → (outputs, edge_descriptions)
```

subject to the constraints:

* it reads only from `MachineState` and its input payloads;
* it computes outputs and proposed edges deterministically;
* it does not perform I/O or rely on global mutable state;
* it does not mutate `MachineState` directly.

All mutation of `MachineState` (adding/updating Cells, Profiles, or Edges) occurs by *committing* the outputs and edge descriptions of implementations that have successfully passed all validation and invariants.

**Program Execution Semantics**

Executing a program with id `P` proceeds as:

1. Initialize a working copy of `MachineState` (`MS_work`) and an empty list of proposed edges.
2. For each `ProgramStep` in order:
   * resolve the operator name to its implementation;
   * gather the required inputs (Cells and Profiles and any Terms or Traces);
   * invoke the implementation;
   * validate the outputs (schema, invariants, normalization, hashing if used);
   * add the proposed nodes/edges to `MS_work` (keeping them separate from the live state).
3. If all steps succeed, atomically replace the relevant parts of the live `MachineState` with the committed contents of `MS_work` and add the edges to `MachineState.edges`.
4. If any step fails, discard `MS_work` and perform no mutation of the live `MachineState`; when such a failure is externally observable (for example, via an API that triggers the program), it MUST be representable as an `Error` carrier as defined in §8.4.

Program execution MUST be deterministic: for a given initial `MachineState` and program payloads, the resulting committed `MachineState` and edges MUST be identical across runs.

**Operational Semantics (Normative)**

Formally, a program defines a state-transition function on `MachineState`.

Let:

* `MS` range over machine states,
* `P` range over Programs,
* `P.steps[i]` denote the `i`‑th `ProgramStep`,
* `apply_step(MS, step)` denote a single-step transition induced by one operator implementation and its validation/commit logic.

The single-step transition is:

```text
apply_step(MS, step):
  1. Resolve step.operator to its operator implementation impl_operator.
  2. Read all required inputs from MS using step.input_nodes (and any Terms/Traces referenced by them).
  3. Compute (outputs, edge_descriptions) = impl_operator(inputs, MS).
  4. Validate outputs and edge_descriptions:
     - schemas satisfied,
     - all invariants in §2, §3, §6, §9.1–§9.3 satisfied,
     - IDs and hashes consistent with §6.6.
     If validation fails, return FAILURE with no changes to MS.
  5. Produce a new state MS' by:
     - adding or updating Cells/Profiles referenced in outputs,
     - adding edges described in edge_descriptions,
     - leaving all other parts of MS unchanged.
  6. Return SUCCESS and MS'.
```

Program execution is the fold of `apply_step` over the step list:

```text
exec_program(MS, P):
  MS_work = MS
  for step in P.steps in ascending index order:
    status, MS_next = apply_step(MS_work, step)
    if status == FAILURE:
      return FAILURE, MS     # no mutation
    MS_work = MS_next
  return SUCCESS, MS_work
```

The observable effect of executing `P` on `MS` is:

* if `exec_program(MS, P) = (SUCCESS, MS_final)`, then the new live state is `MS_final`;
* if `exec_program(MS, P) = (FAILURE, _)`, then the live state remains `MS` and the failure MUST be representable as an `Error` carrier (§8.4, §9.8).

### 5.1 Primitive Operator and Constructor Tables

This section catalogues the primitive architectural components of the machine. Each name in the tables below denotes either:

* a primitive ISA operator,
* a primitive profile-level constructor, or
* a primitive observation-step operator.

For the layers listed in this section, the tables are **normative and complete**: any valid implementation MUST provide the operators and behaviors named here. Names not listed in these tables do not introduce new primitive runtime structure; they are realized as composites of the listed primitives and MUST NOT change the semantics of the primitives listed here.

Implementations MUST NOT introduce new primitive operators or carrier kinds that are not listed in this section and in the Primitive Component Index (§14) unless this specification is revised to include them.

Mappings are grouped by architectural layer.

---

### 5.1 ISA Operator Catalogue

These entries define the **primitive operators** that must exist in the ISA.

| Operator Name                 | ISA Component / Operator                   |
| ----------------------------- | ------------------------------------------ |
| `MeetRecognition`             | `meet(cell, a, b)`                         |
| `JoinRecognition`             | `join(cell, a, b)`                         |
| `ImplyRecognition`            | `imply(cell, a, b)`                        |
| `Negate`                      | `negate(cell, a)`                          |
| `OrderRecognition`            | `leq(cell, a, b)`                          |
| `GroundRecognition`           | equivalent to `bottom(cell)` and context   |
| `Nucleate`                    | `nucleus(cell, a)`                         |
| `FixNucleus`                  | `fix_nucleus(cell, a)`                     |
| `FixFlow`                     | `fix_flow(cell, a)`                        |
| `FixFlowNucleus`              | `fix_both(cell, a)`                        |
| `Flow`                        | `flow(cell, a)`                            |
| `StartTrace`                  | `empty_trace()`                            |
| `StepTrace` / `AdvanceTrace`  | `extend_trace(t, step)`                    |
| `ShuffleTrace`                | `normalize_trace(t)` (shuffle normalized)  |
| `CompleteTrace`               | canonical normalization                    |
| `TraceObservationEquivalence` | `trace_equiv(t1, t2)`                      |
| `HeadTrace` / `TailTrace`     | `head_of_trace`, `tail_of_trace`           |
| `ShuffleFlow`                 | `flow_trace(trace)`                        |

These operators provide the algebraic/temporal substrate the ISA must implement in full.

---

### 5.2 Profile Primitives (Summary)

Profiles use the following primitive structures, all of which are defined in detail in §3 and §4:

* **Syntax primitives** – the core term constructors listed in §3.2 (`Var`, `Lam`, `App`, `FixLeast`, `FixGreatest`, `Recog`, and the algebraic/modal term constructors).
* **Typing primitives** – the typing rules and contexts of §3.3 that assign types to terms, including the λ-calculus fragment, recognition type `Rec`, and fixed-point types.
* **Semantic primitives** – the evaluation relation and interpretation function of §3.5 (`Γ ⊢_P term ⇓ (c,e)` and `interpret_term_P`), which map well-typed terms to recognitions.
* **Profile construction stages** – the pipeline of §3.6, which constructs Profiles from visible Cells, fixed recognitions, invariants, contexts, syntax, typing, semantics, and flow structure.
* **Observation pipeline stages** – the stages of §4, which describe how Observations are typed, interpreted, evolved, analyzed via kernels/deviations, and potentially nucleated into Profile state.

For all profile-related behavior, §3 and §4 are normative. Implementations MUST NOT introduce additional primitives that bypass the typing, semantics, or pipelines defined there.

### 5.3 Standard Programs

This section specifies standard programs that realize the core pipelines defined elsewhere in this document. They are described using the `ProgramSpec` schema of §5.0. For each such program:

* the `preconditions` and `postconditions` are normative and MUST be satisfied by any conformant implementation; and
* the `step_schema` constrains the structure of the computation by reference to the corresponding pipeline sections.

For each named standard program, this specification fixes a canonical `Program` carrier whose normalized form `NF_program` (§6.7) has exactly the step structure described in the corresponding `ProgramSpec.step_schema`, with `ProgramStep.index` values forming a contiguous ascending sequence. The ProgramID of each canonical standard program is derived from its canonical encoding as required by §6.6 and §6.7. When this document refers to executing `ConstructProfile`, `BootstrapMachine`, or `HandleObservation`, it means executing `exec_program` (§5.0) on the corresponding canonical `Program` carrier.

#### 5.3.1 ConstructProfile

`ConstructProfile` realizes the Profile Construction Pipeline of §3.6 for a single Profile.

```text
ProgramSpec ConstructProfile:
  name:          "ConstructProfile"
  inputs:        MachineState MS, ProfileID P
  outputs:       MachineState MS', ProfileID P
  preconditions:
    - P ∈ MS.profiles.
    - MS.profiles[P].visible_cells is defined and all referenced CellID values exist in MS.cells.
  postconditions (on success):
    - P ∈ MS'.profiles.
    - MS' and MS differ only in:
        • the record MS'.profiles[P] and any Profile-local carriers derived from it
          (for example, Profile invariants and ProfileTopos carriers), and
        • any edges in MS'.edges that record applications of primitive operators used
          to construct or update P.
    - MS'.profiles[P] satisfies all structural requirements of §3.1–§3.8:
        • recognitions and fixed_recognitions are derived as in §3.1.2–§3.1.3,
        • syntax, typing_rules, judgment_rules, and semantics are installed as in
          §3.2–§3.5,
        • the Profile Construction Pipeline of §3.6 has been executed exactly once
          in order, and
        • any ProfileTopos structure required by §3.8 exists and satisfies its laws.
  step_schema:
    - Realize the stages listed in §3.6 in order:
        1. ProfileRecognitions
        2. FixedProfileRecognitions
        3. ProfileInvariantLattice / ProfileInvariantOrder
        4. ConstructContexts
        5. CalculateProfileSyntax
        6. JudgeProfile
        7. StructureSemantics
        8. ProfileSemantics
        9. FlowProfile
       10. FixedFlowProfile
       11. BuildProfileTower (optional)
```

Any conformant implementation that exposes Profiles MUST behave as if it constructs or refreshes each Profile by executing `ConstructProfile` whenever the Profile Construction Pipeline is required.

#### 5.3.2 BootstrapMachine

`BootstrapMachine` realizes the bootstrap sequence of §7.1–§7.4, starting from an empty `MachineState` and yielding the initial Ground Cell and Profile.

```text
ProgramSpec BootstrapMachine:
  name:          "BootstrapMachine"
  inputs:        MachineState MS
  outputs:       MachineState MS'
  preconditions:
    - MS.cells, MS.profiles, and MS.edges are all empty.
  postconditions (on success):
    - MS' contains exactly one Cell, the Ground Cell of §7.1, with payload matching
      the two-element bounded Heyting algebra and with ID equal to GroundCellID as
      specified in §13.1.
    - MS' contains exactly one Profile, the initial Profile of §7.2, whose fields
      satisfy the results of running the Profile Construction Pipeline (§3.6) on
      the Ground Cell:
        • visible_cells   = { GroundCellID }
        • recognitions    = { (GroundCellID, e_bottom), (GroundCellID, e_top) }
        • fixed_recognitions = recognitions
        • syntax, typing, judgments, semantics, and flow/nucleus structure as in
          §7.2–§7.3.
    - MS' is ready to accept Observations into the initial Profile as described in
      §7.4 and §8.1.
  step_schema:
    - Construct the Ground Cell as in §7.1.
    - Insert the Ground Cell into MS.cells.
    - Insert a new Profile record with visible_cells = { GroundCellID } into MS.profiles.
    - Invoke ConstructProfile on that Profile as in §5.3.1.
```

Any conformant implementation MUST implement its bootstrap procedure so that its observable effect on `MachineState` is identical to executing `BootstrapMachine` starting from an empty state.

#### 5.3.3 HandleObservation

`HandleObservation` realizes the Observation Pipeline of §4 and the operational semantics of the external `submit_observation` interface of §8.1 for a single Profile and observation payload.

```text
ProgramSpec HandleObservation:
  name:          "HandleObservation"
  inputs:        MachineState MS, ProfileID P, observation_blob
  outputs:       MachineState MS', ObservationResult or Error
  preconditions:
    - P ∈ MS.profiles.
    - MS.profiles[P] is a fully constructed Profile as in §3.1–§3.8
      (for example, created by ConstructProfile).
  postconditions:
    - If P does not exist in the initial state, the invocation fails with
      Error(kind="precondition_failed") and MS' = MS.
    - If term synthesis or typing (§4.2) fails, the invocation fails with
      Error(kind="type_error") and MS' = MS.
    - If any ISA or normalization precondition is violated during processing,
      the invocation fails with an appropriate Error as in §8.4 and MS' = MS.
    - On success:
        • MS' is obtained from MS by applying the Observation Pipeline steps of §4
          to Profile P and the decoded Observation, using only ISA operations and
          Profile-local rules.
        • Any updates to recognitions, fixed_recognitions, Profile invariants, and
          underlying Cells satisfy §4.3–§4.7 and §9.3–§9.4.
        • ObservationResult reports whether the observation was rejected, accepted
          as transient, or nucleated, and lists identifiers of any new or updated
          carriers and any Error or LawDiagnostic carriers produced.
  step_schema:
    - Realize the Observation Pipeline of §4 in order:
        1. Profile selection (§4.2)
        2. Term synthesis and typing (§4.2)
        3. Semantic interpretation to a recognition (§4.3)
        4. Trace evolution (§4.4)
        5. Kernel and deviation analysis where applicable (§4.5)
        6. Nucleation decision (§4.6)
        7. Profile and Cell state update (§4.7)
```

Any conformant implementation MUST ensure that the observable effect of its external `submit_observation` interface (§8.1) is identical to invoking `HandleObservation` with the same `MachineState`, `ProfileID`, and `observation_blob`.

## 6. Normalization and Equivalence

Normalization and equivalence are central to the Relational Computer. The specification requires that many different syntactic or constructive paths collapse to the same **canonical** recognition structure, judgment, or trace.

Normalization in this section is a **mathematical and representational discipline**, not an additional layer of runtime operators inside the relational computer. Canonical forms (`NF_*`) are used to:

* define semantic equivalence classes,
* specify how equality and ordering are decided, and
* specify how persistent encodings and IDs are derived,

but they do not introduce new instructions in the Instruction Set Architecture (§2). A conformant implementation MAY compute these canonical forms whenever it needs to compare, serialize, or index objects, but at the level of the relational computer’s own semantics all laws are stated *up to* these canonicalizations.

Each `NF_*` symbol in this section names the unique canonical form induced by the already-specified Cell, Trace, Profile, and program semantics. Implementations MUST NOT invent additional, ad-hoc notions of normal form; instead, they MUST behave as if equality, ordering, and identity were decided by these canonical forms and by no other mechanism. Implementations are not required to expose `NF_*` as APIs or ISA operators—it is sufficient that all observable behavior (including equality checks, deduplication, and hash-derived IDs) is consistent with the canonical forms described here.

An implementation MUST behave as if it had a consistent normalization/equivalence layer so that:

* Cells do not accumulate redundant elements.
* Profiles reason about recognitions and judgments up to equivalence.
* Traces are compared modulo admissible shuffles.

Every normalization procedure MUST be:

* **Deterministic:** same input → same output.
* **Idempotent:** `NF(NF(x)) = NF(x)`.
* **Compatible:** `x ≡ y` iff `NF(x) = NF(y)`.

We group normalization/equivalence by domain.

---

### 6.1 Observation Equivalence

Observation equivalence accounts for different observational paths yielding the same effective recognition.

**Observation Equivalence Relation**
Two observations `obs1`, `obs2` are equivalent if:

* their traces are trace-equivalent (after normalization), and
* their interpreted recognitions (via `interpret_term`) normalize to the same canonical recognition element.

There exists a canonical observation normal form:

```text
NF_observation(obs) → canonical_obs
obs_equiv(obs1, obs2) := (NF_observation(obs1) == NF_observation(obs2))
```

Where `NF_observation` applies:

1. `normalize_trace` to the trace.
2. Term normalization (if applicable) inside the Profile.
3. Recognition normalization (see §6.4).

Observation equivalence MUST be a congruence with respect to the Observation Pipeline (§4): replacing an Observation with an equivalent one at any stage yields the same effect on `MachineState` (up to isomorphism of traces and recognitions).

`NF_observation` MUST be compatible with witness-trace semantics: whenever an Observation `obs` has trace `t` and `witness_recognition(t)` is defined and equal to `(c, e)`, the recognition component of `NF_observation(obs)` MUST equal `NF_recognition(c, e)` and the trace component MUST equal `NF_trace(t)`.

---

### 6.2 Judgment Equivalence

Judgment equivalence indicates when two judgments express the same internal content, possibly under different contexts or syntactic forms.

Judgments have the form:

```text
Γ ⊢ J
```

There exists a canonical judgment normal form:

```text
NF_judgment(Γ ⊢ J) → canonical_judgment
judgment_equiv(J1, J2) := (NF_judgment(J1) == NF_judgment(J2))
```

**Judgment normal form**

Judgments in this specification have the forms defined in §3.4:

* `Γ ⊢ a ≡ b` for equality at type `Rec`,
* `Γ ⊢ a ≤ b` for order at type `Rec`,
* `Γ ⊢ obs1 ≈ obs2` for observation equivalence.

`NF_judgment` MUST produce a canonical representation with two components:

```text
canonical_judgment = (Γ_NF, J_core_NF)
```

where:

* `Γ_NF` is the context `Γ` with:
  * variables sorted by name in a fixed total order,
  * duplicate bindings removed in favor of a single binding per variable,
  * any context-specific indexing structure rewritten into a canonical form;
* `J_core_NF` is one of:
  * `EqRecNF((c, e_a_canon), (c, e_b_canon))` for `a ≡ b`,
  * `LeqRecNF((c, e_a_canon), (c, e_b_canon))` for `a ≤ b`,
  * `ObsEqNF(obs1_canon, obs2_canon)` for `obs1 ≈ obs2`.

For `EqRecNF` and `LeqRecNF`, canonical recognition pairs are computed as:

```text
Γ ⊢ a : Rec    Γ ⊢ b : Rec
Γ ⊢_P a ⇓ (c, e_a)    Γ ⊢_P b ⇓ (c, e_b)
e_a_canon = NF_recognition(c, e_a)
e_b_canon = NF_recognition(c, e_b)
```

For `ObsEqNF`, canonical observations are computed as:

```text
obs1_canon = NF_observation(obs1)
obs2_canon = NF_observation(obs2)
```

Normalization MUST include:

* reordering and deduplication of context bindings into `Γ_NF`,
* replacement of recognitions and observations by their canonical forms (`NF_recognition`, `NF_observation`),
* folding of logically equivalent forms that map to the same `J_core_NF`.

Judgment equivalence MUST be compatible with recognition equivalence: whenever `Γ ⊢ a : Rec` and `Γ ⊢ b : Rec` and `recognition_equiv(cell, a, b)` holds, then `Γ ⊢ a ≡ b` MUST be derivable and stable under context extension, and `NF_judgment(Γ ⊢ a ≡ b) = NF_judgment(Γ ⊢ b ≡ a)` MUST hold.

`NF_judgment` MUST also be compatible with witness-trace semantics: whenever a witness trace `t` satisfies `witness_judgment(t) = (Γ ⊢ J)`, the canonical judgment obtained by normalizing the trace first and then projecting,

```text
J' = witness_judgment(NF_trace(t))
```

MUST satisfy

```text
NF_judgment(Γ ⊢ J) = NF_judgment(Γ ⊢ J').
```

---

### 6.3 Trace Equivalence

Trace equivalence treats traces as elements of a **free partially commutative monoid**, where some steps can commute. The commutation relation is induced by the internal geometry and tensor structure of the quasicrystalline hypertensor topos: two steps commute exactly when they act on independent components of the internal structure (for example, different tensor factors or disjoint regions of a Profile’s phase space) and do not change each other’s support.

An implementation MUST define:

```text
NF_trace(trace) → canonical_trace
trace_equiv(t1, t2) := (NF_trace(t1) == NF_trace(t2))
```

`NF_trace` MUST:

* reorder steps according to the allowed shuffles determined by this independence relation,
* drop redundant no-op segments (when the specification identifies them as semantic no-ops),
* maintain head/tail decomposition consistency.

The independence relation here MUST include, at a minimum, all pairs of steps that satisfy the support-disjointness requirements of §2.3; an implementation MAY further restrict which pairs of steps are considered independent to reflect additional geometric or tensor structure, but it MUST NOT treat any pair of dependent steps as commuting.

All trace comparison MUST go through `NF_trace`. The ISA-level operator `normalize_trace` (§2.3) is the operational realization of this canonicalization on runtime traces: for all traces `t`, the result of `normalize_trace(t)` MUST encode the same canonical witness trace as `NF_trace(t)` when both are represented using the canonical JSON encoding of §6.6.

---

### 6.4 Recognition Normalization

Recognition elements in Cells can be constructed via many paths (multiple meets, joins, implications, etc.). The specification requires that they collapse to canonical representatives.

An implementation MUST implement:

```text
NF_recognition(cell, e) → e_canonical
recognition_equiv(cell, e1, e2) := (NF_recognition(cell,e1) == NF_recognition(cell,e2))
```

`NF_recognition` MUST:

* respect associativity, commutativity, and idempotency of `meet` and `join`,
* apply simplifications implied by `imply` and `negate` laws,
* collapse chain-equivalent elements (same position in the partial order and same modal behavior).
* be compatible with witness-trace semantics: whenever `witness_recognition(t) = (cell, e)` is defined, there exists a witness trace `t_canon` such that `NF_trace(t) = t_canon` and `witness_recognition(t_canon) = (cell, NF_recognition(cell, e))`.

Additionally, `NF_recognition` MUST respect modal behavior: if two elements have the same position in the order and the same images under `nucleus` and `flow` (including all iterates needed for fixed points), they MUST normalize to the same canonical representative.

In particular, for every element `e` in a Cell:

```text
NF_recognition(cell, e)
  = NF_recognition(cell, nucleus(cell, e))
  = NF_recognition(cell, flow(cell, e))
```

and the same equalities MUST hold when `e` is replaced by any finite iterate of `nucleus` and `flow` applied to `e`. Thus, normalization collapses recognitions along the modal closure and flow directions determined by `nucleus` and `flow`.

For all operators `op` on recognitions that are part of the ISA (including `meet`, `join`, `imply`, `negate`, `nucleus`, and `flow`), normalization MUST commute with `op` in the sense that:

```text
NF_recognition(cell, op(e1, …, ek)) =
NF_recognition(cell, op(NF_recognition(cell, e1), …, NF_recognition(cell, ek)))
```

for every admissible tuple of operands `(e1,…,ek)`.

Every Cell MUST store and maintain consistency of `equiv_class_id` and `nf_cache` with this normalization procedure.

Equivalently, `recognition_equiv` is the **greatest congruence** on the recognition lattice of each Cell that respects both the lattice structure and the modal structure: it is the largest equivalence relation `≈` such that, whenever `e1 ≈ e2`,

```text
meet(e1, x)   ≈ meet(e2, x)    for all x
join(e1, x)   ≈ join(e2, x)    for all x
imply(e1, x)  ≈ imply(e2, x)   for all x
imply(x, e1)  ≈ imply(x, e2)   for all x
negate(e1)    ≈ negate(e2)
nucleus(e1)   ≈ nucleus(e2)
flow(e1)      ≈ flow(e2)
```

and any other equivalence relation with these closure properties is contained in `recognition_equiv`. This coinductive description ensures that recognition equivalence classes capture exactly the observational behavior of recognitions under all algebraic and modal operations.

---

### 6.5 Canonical Form Rules

Canonical forms are the bridge between equivalence relations and actual runtime data.

For each domain (observation, judgment, trace, recognition), an implementation MUST:

* define a deterministic normalization procedure `NF_*`,
* ensure all equality checks use normalized forms,
* ensure that constructing new Profile elements respects canonicalization (no duplicates).

In particular:

* During Profile construction, new recognitions are only added if they represent **new canonical recognition elements**.
* During observation processing, two observations that normalize to the same canonical form MUST be treated identically by the Profile.

This guarantees that the Relational Computer remains compact, consistent, and faithful to the equivalence relations mandated by the normalization contracts of §6.

### 6.6 Canonical Representation and Hash-Derived IDs

To make normalization and equality effective, implementations MUST choose a canonical representation for all persistent objects (Cells, Profiles, Edges, and Programs) and derive their IDs from this representation.

**Canonical Encoding**

Implementations MUST use canonical JSON encoding that is:

* deterministic: the same mathematical object always encodes to the same byte sequence;
* complete: the encoding captures all semantically relevant fields of the object;
* minimal: no semantically irrelevant variation (for example, key ordering or whitespace) is allowed.

Canonical JSON has:

* object keys sorted lexicographically;
* arrays in a deterministic order prescribed by this specification (for example, `Trace.steps` order, sorted `visible_cells`);
* numeric values using a fixed, documented precision;
* strings encoded using a fixed character encoding (for example, UTF‑8).

**Hash-derived IDs**

For all persisted objects, IDs MUST be defined as cryptographic hashes of the canonical encoding of their payloads. The fixed choice is:

```text
id = sha256(canonical_encoding(payload_without_id_field))
```

Implementations MUST enforce:

* `CellID`, `ProfileID`, `EdgeID`, and `ProgramID` that are hash-derived match the canonical encoding of the corresponding payload;
* any mismatch between an object’s stored ID and its recomputed hash is treated as a hard error that MUST be representable as an `Error` carrier of kind `"implementation_error"`;
* when persisted to a filesystem, filenames (if any) MUST match the hash-derived ID to guarantee referential integrity;
* IDs are encoded as 64-character lowercase hexadecimal strings representing the 32-byte SHA‑256 digest.

These rules ensure that identity and referential integrity of objects can be implemented efficiently in ordinary computers. They do not define mathematical equivalence; all semantic equivalence is governed by the normalization and equivalence procedures in §6.1–§6.5.

### 6.7 Program Normalization and Equivalence

Programs are first-class carriers that describe finite linear composites of primitive operators (§5.0). To make equality of Programs and canonical external representations well-defined, an implementation MUST provide a normalization procedure for Programs:

```text
NF_program(P: Program) → Program_canonical
program_equiv(P1, P2) := (NF_program(P1) == NF_program(P2))
```

`NF_program` MUST be:

* deterministic: the same input Program always yields the same canonical Program;
* idempotent: `NF_program(NF_program(P)) = NF_program(P)`;
* structural: canonicalization depends only on the Program’s own fields (`id`, `steps`, and step fields), not on ambient `MachineState`.

At minimum, `NF_program` MUST:

* sort `Program.steps` into ascending order by `index`;
* ensure that `index` values are unique within a Program and contiguous when viewed in the canonical form;
* canonicalize any list-valued fields inside each `ProgramStep` (for example, `input_nodes`, `output_kinds`) using a fixed deterministic order prescribed by the implementation;
* remove or rewrite any syntactically redundant or unreachable steps into a canonical equivalent representation when such redundancy does not change the observable behavior of `exec_program` (§5.0) on any `MachineState`.

ProgramIDs MUST be derived from the canonical encoding of `NF_program(P)` as in §6.6. If a Program’s stored `id` does not match the hash of the canonical encoding of `NF_program(P)` with the `id` field removed, this MUST be treated as an `implementation_error` as described in §6.6 and §9.8.

For all external interchange and canonical persistence, Programs MUST be encoded using `NF_program(P)` and canonical JSON (§6.6). Internally, an implementation is permitted to use any representation that is observationally equivalent to `NF_program(P)` with respect to `exec_program` as defined in §5.0.

## 7. Bootstrap Process

The bootstrap process defines how a Relational Computer initializes itself **from an empty runtime state**, using only the mechanisms and structures defined in prior sections. This is required so that an implementation can:

* construct an initial valid machine state,
* generate the first Profile,
* begin accepting Observations,
* guarantee that all structures emerge exactly as the architecture mandates.

The bootstrap sequence MUST:

1. Start from minimal algebraic content.
2. Build a minimal Cell.
3. Use that Cell to construct the initial Profile.
4. Install syntax + typing.
5. Install semantics.
6. Install flow/nucleus structure.
7. Yield a ready-to-use Profile.

---

### 7.1 Initial Cells

The machine begins with **exactly one Cell**, the *Ground Cell*, built from the minimal possible recognition algebra.

```
Initial Ground Cell:
  elements: { e_bottom, e_top }
  leq:      e_bottom ≤ e_top
  meet:     meet(e_top, e_top) = e_top; meet(e_bottom, e_top) = e_bottom; ...
  join:     join(e_bottom, e_top) = e_top; etc.
  imply:    classical minimal Heyting implication for a two-element algebra
  negate:   negate(e_top) = e_bottom; negate(e_bottom) = e_top
  nucleus:  nucleus(e) = e     # identity closure
  flow:     flow(e) = e        # identity flow
  trace_meta: empty
```

**Rationale:**
The architecture presupposes the existence of a minimal recognition algebra. A 2-element bounded Heyting algebra is the mathematically minimal valid structure.

The machine MUST assign this Cell the first available CellID.

---

### 7.2 Initial Profile Construction

Once the initial Ground Cell exists, the machine constructs a Profile via the full Profile Construction Pipeline (§3.6).

```
Initial Profile:
  id: ProfileID_0
  visible_cells: { GroundCellID }
```

Then the machine performs:

1. **ProfileRecognitions**: yields `{ (GroundCellID, e_bottom), (GroundCellID, e_top) }`.
2. **FixedProfileRecognitions**: identical, since nucleus and flow are identity.
3. **ProfileInvariantLattice** + **ProfileInvariantOrder**: mirror the Ground Cell.
4. **ConstructContexts**: create an empty typing context.
5. **CalculateProfileSyntax**: install term constructors.
6. **JudgeProfile**: install typing/judgment rules.
7. **StructureSemantics**: global term → recognition mapping.
8. **ProfileSemantics**: restrict semantics to Profile.
9. **FlowProfile**: identity.
10. **FixedFlowProfile**: identity.
11. **BuildProfileTower** (optional): trivial.

At the end of this pipeline, the Profile is fully operational.

---

### 7.3 Minimal Syntax

After Profile construction, the Profile MUST support the minimal syntactic forms:

```
Var(name)
Lam(name, Type, Term)
App(f, x)
Recog(GroundCellID, e_bottom)
Recog(GroundCellID, e_top)
MeetTerm(a, b)
JoinTerm(a, b)
```

These forms are sufficient to:

* accept Observations,
* construct internal terms,
* map terms to recognition elements,
* evolve those recognitions via ISA ops.

The fixed-point constructors (`FixLeast`, `FixGreatest`) are also part of the core term language, though they reduce trivially in a 2-element algebra.

---

### 7.4 Startup Sequence

An implementation MUST implement the following startup sequence exactly, by executing the standard program `BootstrapMachine` (§5.3.2) or any program that is observationally equivalent to it under the execution semantics of §5.0:

```
1. Initialize empty MachineState.
2. Construct Ground Cell using the 2-element algebra above.
3. Insert Ground Cell into MachineState.cells.
4. Construct ProfileID_0 using §3.6 pipeline.
5. Insert ProfileID_0 into MachineState.profiles.
6. Begin accepting Observations into ProfileID_0.
7. As Observations accumulate, construct additional Cells (if needed).
8. As Cells proliferate, construct additional Profiles (if needed).
```

This is a fully deterministic initialization. There is no nondeterminism in bootstrap.

After bootstrap completes, the Relational Computer is ready to:

* interpret incoming Observations via Profile semantics,
* evolve recognitions using ISA instructions,
* extend or refine its Cell set as new recognitions emerge naturally from computations.

### 7.5 Multi-Profile and Multi-Cell Evolution

Beyond the initial Ground Cell and Profile, additional Cells and Profiles are constructed only through compositions of the primitive operators already present in the machine:

* new Cells are introduced when closure, flow, or observation-kernel constructions force new finite recognition algebras (for example, via fixed-point or fiber constructions);
* new Profiles are introduced when new filters, nuclei, or invariant subsets are recognized that satisfy the Profile construction pipeline in §3.6.

All such constructions MUST be realized via programs and operator implementations (§5.0) that:

* start from existing Cells and Profiles in `MachineState`;
* apply only ISA operations and Profile-level profile operators;
* commit new Cells/Profiles and edges atomically.

No other form of Cell or Profile creation is permitted.

### 7.6 Compaction and Garbage Collection

Any compaction or garbage collection of Cells, Profiles, and Edges is subject to the following constraints:

* a compaction strategy MUST NOT remove any canonical recognition element, trace, or judgment that participates in any existing edge;
* Profiles MUST be deleted only when no external references depend on them;
* an implementation is permitted to prune or summarize Edges (e.g. for logging or storage efficiency) provided the semantic effect on `MachineState` (Cells and Profiles) remains unchanged.

Any compaction strategy MUST preserve:

* normalization/equivalence classes (§6),
* all fixed invariants and phase spaces (§10),
* and the ability to re-derive any deleted edge’s semantic effect from the remaining Nodes and operators.

### 7.7 Versioning and Evolution of the Machine

If an implementation changes the definition of ISA operators, Profile construction rules, or normalization procedures, this MUST be treated as a new *machine instance*:

* The new instance has its own `MachineState` (and, if persisted, its own identifier).
* Data from an old instance is imported into a new instance only via observations or programs that treat old data as external input.
* In-place upgrades that silently change the meaning of existing Cells, Profiles, or Edges are forbidden.

This ensures that the behavior of any given instance of the Relational Computer remains stable over time and that changes to the mathematics or implementation are explicit.

## Part III — External Interface and Conformance (Normative)

Part III comprises §§8–§12. It specifies the observable external behavior of a Relational Computer through its minimal APIs (§8), the formal contracts that a conformant implementation MUST satisfy (§9), and the requirements for backend-independent conformance across different implementation technologies (§12).

## 8. External Interface

The Relational Computer exposes a **minimal external interface**. External agents interact with the machine *only* by submitting Observations and reading Profile state.

There are **no external operations** for:

* directly mutating Cells,
* directly constructing or modifying internal Terms,
* directly altering typing rules, judgments, or semantics.

All such changes must arise internally from Observation processing.

---

### 8.1 Observation Submission API

This is the primary—and conceptually only—write operation.

```text
submit_observation(profile_id, observation_blob) → ObservationResult
```

Operationally, this external interface is the surface invocation of the standard program `HandleObservation` (§5.3.3); the semantics given below are equivalent to executing that program with the current `MachineState`, the chosen `profile_id`, and the supplied `observation_blob`.

**Inputs:**

* `profile_id`: identifier of the target Profile.
* `observation_blob`: externally provided data that the Profile will interpret.

The `observation_blob` MUST contain at least:

* sufficient information to construct a Trace (temporal component),
* sufficient information for the Profile to synthesize a Term in its internal language.

An implementation MUST treat `observation_blob` as an opaque payload and delegate all interpretation to the Profile.

**Operational Semantics (Normative)**

Given a `profile_id` and `observation_blob`, the observable effect of `submit_observation` on `MachineState` is defined as follows.

Let:

* `MS` be the current machine state,
* `P` be the Profile with id `profile_id` in `MS.profiles` (if present),
* `decode_observation` be a pure function that maps `(P, observation_blob)` to `(T, S)` where:
  * `T` is a `Trace`,
  * `S` is a raw syntactic structure from which a `Term` is built.

The submission procedure is:

```text
submit_observation(MS, profile_id, observation_blob):
  1. Look up Profile P = MS.profiles[profile_id].
     If P does not exist, return FAILURE with an Error(kind="precondition_failed").
  2. Decode observation:
       T, S = decode_observation(P, observation_blob)
     where decode_observation is deterministic and profile-specific.
  3. Build internal Term from S using the syntax machinery of §§3.2, 3.6, 5.2.
  4. Typecheck:
       if P’s typing rules (§3.3) do not yield Γ_P ⊢ term : T_type,
         return FAILURE with Error(kind="type_error") and no change to MS.
  5. Interpret term to a recognition element using P’s semantics (§3.5), yielding (rec_cell, rec_elem).
  6. Evolve the trace:
       evolved_trace = flow_trace(T)
  7. Perform kernel/deviation analysis (if implemented for P) as in §4.5,
       yielding (K, Δ) or defaulting to a trivial kernel/deviation when not present.
  8. Decide nucleation using §4.6–§4.7:
       - compute stability under nucleus and flow,
       - use Δ and P’s nucleation policy to decide whether to integrate.
  9. Apply any resulting updates to P and underlying Cells,
       using only ISA operators and the profile construction rules, to obtain MS'.
  10. Return SUCCESS with:
       - the updated MachineState MS',
       - an ObservationResult payload that includes:
           * a success/failure flag,
           * identifiers of any new or updated Cells or Profile invariants,
           * any associated Error or LawDiagnostic carriers when failures or law checks occurred.
```

The mapping `observation_blob → S → Term` is Profile-local: each Profile MUST use its own `syntax` and Profile Construction Pipeline (§3.1–§3.6) to perform this translation. No global or cross-profile parser exists; changing Profiles (for example, adding or removing Profiles, or updating their syntax) MUST NOT change the meaning of `decode_observation` for other Profiles.

**Outputs (ObservationResult):**

* success/failure flag (for example, `typed`, `rejected`, `nucleated`, `transient`),
* identifiers of any new or updated Cells or Profile invariants,
* diagnostic information (for example, typing errors, kernel deviation summaries) that, when the operation fails, MUST be representable using `Error` and `LawDiagnostic` carriers (§8.4, §9.7).

The shape of `ObservationResult` MUST NOT expose any mutation capabilities beyond subsequent `submit_observation` calls.

---

### 8.2 Profile Introspection API

This is the read-only interface for external inspection.

```text
read_profile_state(profile_id) → ProfileSnapshot
```

`ProfileSnapshot` MUST include at least:

* list of `visible_cells` (by CellID),
* summary of `recognitions` and `fixed_recognitions` (for example, counts, hashes, or IDs),
* key invariants (ProfileInvariantLattice, ProfileInvariantOrder, ProfileEntropy, and related invariants),
* optionally, canonicalized judgments or terms when the implementation exposes them for debugging.

`ProfileSnapshot` MUST NOT allow direct mutation of Profile or Cell state.

---

### 8.3 No Other External Operations

An implementation MUST NOT expose:

* Cell-level write APIs,
* term-construction APIs,
* direct typing-rule modification,
* direct semantics modification.

All external influence on the Relational Computer flows exclusively through `submit_observation`, and all internal state evolution occurs via the ISA, Profile machinery, and Observation Pipeline defined in this document.

This guarantees that the runtime behavior remains faithful to the architectural specification and that all emergent structures (syntax, types, semantics, invariants) are internally generated rather than externally imposed.

### 8.4 Canonical Error Objects

Error carriers represent canonical error objects within the machine. An Error carrier has the form:

```text
Error:
  id:      ErrorID
  kind:    "type_error" | "precondition_failed" | "normalization_violation" | "implementation_error"
  message: string
  context: ErrorContext

ErrorContext:
  operator:   string               # operator or pipeline stage name
  profile_id: ProfileID or null
  details:    object               # structured fields specific to the operator
```

ErrorIDs MUST be derived from the canonical encoding of the Error payload as in §6.6. Whenever an external operation fails due to typing failure, ISA precondition violation, normalization inconsistency, or implementation error, the implementation MUST materialize a corresponding Error carrier and report its canonical JSON encoding as the error object.

The `kind` field MUST be one of the listed tags. The `operator` field in `context` MUST identify the operator, implementation, or pipeline stage at which the error arose. The `details` object MUST NOT confer any additional mutation capability.

Errors produced internally (for example, during program execution or ISA operator evaluation) and errors produced at external interfaces (for example, `submit_observation`) MUST follow this same carrier format so that error handling is uniform across the machine.

## 9. Formal Contract Summary

This section collects the **non-negotiable contracts** that any implementation MUST satisfy in order to qualify as a valid Relational Computer as described by this specification.

Each subsection summarizes obligations that were defined in detail earlier. This is the checklist an implementer uses to verify conformance.

---

### 9.1 Data Structures

**Cells**

* MUST implement a finite recognition algebra:

  * bounded lattice (`elements`, `leq`, `meet_table`, `join_table`, `top`, `bottom`),
  * Heyting-like structure (`imply_table`, `negate_map`),
  * modalities (`nucleus_map`, `flow_map`),
  * equivalence and normalization (`equiv_class_id`, `nf_cache`).
* MUST maintain all lattice and Heyting axioms.
* MUST ensure `nucleus_map` is extensive, monotone, and lax-idempotent.
* MUST ensure `flow_map` is monotone and inflationary.
* MUST ensure `flow_map` and `nucleus_map` commute.

**Traces**

* MUST form a free partially commutative monoid under concatenation and shuffle-equivalence.
* MUST have a deterministic `normalize_trace` function.
* MUST support `head_of_trace` and `tail_of_trace` consistent with normalization.

**Profiles**

* MUST reference a set of visible Cells.
* MUST derive `recognitions` and `fixed_recognitions` from those Cells.
* MUST contain internal specifications for syntax, typing, judgment, and semantics.

**Observations**

* MUST be representable internally as `(trace, term)` as defined in §4.1, where `trace` is a `Trace` and `term` is a Profile-internal `Term`. External observation payloads (`observation_blob`) MUST be convertible deterministically into such internal Observation carriers.

---

### 9.2 Instruction Semantics (ISA)

All ISA operations (§2) MUST be:

* total on their domain,
* deterministic,
* invariant-preserving.

**Algebraic Layer**

* `meet`, `join`, `imply`, `negate`, `leq`, `top`, `bottom` MUST satisfy all lattice/Heyting laws specified in §2.1.

**Modal Layer**

* `nucleus` MUST be extensive, monotone, lax-idempotent, and satisfy the closure-distribution equalities over `meet` and `join` in §2.2.
* `flow` MUST be monotone, inflationary, and satisfy the flow-over-meet inequality in §2.2.
* `fix_nucleus`, `fix_flow`, `fix_both` MUST compute least fixed points on the finite carrier.
* `flow(nucleus(a))` MUST equal `nucleus(flow(a))` for all elements.

**Temporal Layer**

* `normalize_trace` MUST be idempotent and compatible with `trace_equiv`.
* `flow_trace` MUST equal “apply flow to all referenced recognitions then normalize”.

ISA operations MUST NOT introduce elements, traces, or states that violate these properties.

---

### 9.3 Profile Behavior

Profiles MUST:

* be constructed via the Profile Construction Pipeline (§3.6) in the specified order;
* use only ISA operations and internal rules when computing recognitions, fixed_recognitions, invariants, or semantic interpretations;
* maintain soundness of typing:

  * well-typed terms MUST interpret to recognition elements in visible Cells;
  * ill-typed terms MUST be rejected;
* ensure semantics is:

  * compositional,
  * invariant-preserving,
  * confined to the Profile’s visible Cells,
  * confined to the Profile’s own syntax, typing, judgments, and semantics (no cross-profile term language or evaluation).

Profiles MUST NOT:

* mutate Cells except via ISA operations,
* depend on external code or side channels for core semantics,
* accept external Terms directly (all external content must arrive as observations and be converted internally),
* read or mutate the internal syntax, typing, judgment, or semantic structures of any other Profile, except via Observation results and invariant summaries computed by that Profile itself.

---

### 9.4 Observation Guarantees

For every call to `submit_observation(profile_id, observation_blob)`:

* An implementation MUST:

  1. route the observation to the correct Profile;
  2. synthesize an internal Term from `observation_blob` using the syntactic constructors of §3.2 and §5.2;
  3. typecheck the Term with Profile typing rules;
  4. if typing fails, reject the observation with no state mutation;
  5. if typing succeeds, interpret the Term into a recognition element in a visible Cell;
  6. evolve the observation’s trace using `flow_trace`;
  7. perform kernel/deviation analysis if implemented;
  8. decide nucleation using `nucleus`, `flow`, and fixed-point criteria;
  9. update Profile state (and underlying Cells when necessary) only via ISA operations.

* Observations that normalize to the same canonical form (under §6) MUST be treated equivalently by the Profile.

Observation processing steps MUST NOT:

* bypass normalization procedures,
* break invariants on Cells, Profiles, or Traces,
* introduce ad-hoc behavior not expressible as compositions of ISA operations and Profile rules.

---

### 9.5 Minimal External Interface

Implementations MUST:

* expose **only**:

  * `submit_observation(profile_id, observation_blob)` for writes,
  * `read_profile_state(profile_id)` for read-only inspection;
* forbid all other external mutation paths.

Any implementation that satisfies all contracts in §9.1–§9.5, and that realizes the primitive components of §5 as specified here, qualifies as a valid Relational Computer under this specification.

### 9.6 Implementation Checklist

To realize this specification, an engine MUST provide at least:

* a concrete finite implementation of Cells (lattice + Heyting + modalities) satisfying §1–§2 and §6;
* a Trace implementation with normalization and shuffle-equivalence satisfying §1.2 and §6.3;
* implementations of all ISA operators in §2 that satisfy the contracts in §9.2;
* a Profile implementation that follows the construction pipeline in §3.6 and the behavior in §9.3;
* an Observation engine that implements the pipeline in §4 and the guarantees in §9.4;
* a bootstrap procedure matching §7;
* only the external interface in §8 for observable mutation and inspection.

### 9.7 Law-Diagnostic Carriers

Implementations MUST represent law checks and diagnostics as first-class carriers. A LawDiagnostic carrier has the form:

```text
LawDiagnostic:
  id:          DiagnosticID
  law_name:    string               # e.g. "flow_nucleus_commutation"
  inputs:      list[NodeID]         # relevant Cells and Profiles
  outcome:     "holds" | "fails"
  error_id:    optional ErrorID     # reference to a canonical error object, if any
```

Whenever an internal law check is performed (for example, validating flow–nucleus commutation or fixed-point convergence), the implementation MUST be able to materialize a corresponding `LawDiagnostic` object that records the law name, the inputs, and whether the law held in that context. These diagnostics MUST themselves obey the canonical encoding and hashing rules of §6.6 and can be inspected via the same object-loading mechanisms as other carriers.

### 9.8 Error and Diagnostic Semantics

Error and diagnostic behavior across the machine MUST satisfy the following:

* Failures of ISA operators due to invalid inputs (for example, unknown `ElementID`, malformed Trace) MUST:
  * leave `MachineState` unchanged, and
  * be representable as `Error` carriers of kind `"precondition_failed"`.
* Typing failures in the Observation Pipeline or profile term typing MUST:
  * leave `MachineState` unchanged, and
  * be representable as `Error` carriers of kind `"type_error"`.
* Normalization inconsistencies or violations of NF\_* contracts MUST:
  * prevent any mutation to `MachineState`, and
  * be representable as `Error` carriers of kind `"normalization_violation"`.
* Implementation-level problems (for example, hash mismatches on persisted objects, unexpected exceptions inside operator implementations) MUST:
  * be representable as `Error` carriers of kind `"implementation_error"`, and
  * when associated with law checks, be linked from `LawDiagnostic.error_id`.
* Law checks (flow–nucleus commutation, fixed-point properties, profile invariants, and similar) MUST:
  * be representable as `LawDiagnostic` carriers with `outcome` set to `"holds"` or `"fails"`,
  * use `error_id` to reference a canonical `Error` when `outcome = "fails"`, and
  * never change `MachineState` directly.

External interfaces such as `submit_observation` and `read_profile_state` MUST surface failure conditions only via these canonical `Error` and `LawDiagnostic` carriers; they MUST NOT rely on out-of-band error signaling.

## Part IV — Extensions, Examples, and Meta

Part IV collects optional extensions to the core machine (§10–§11), reference examples and indices that serve as conformance witnesses (§13–§14), and meta-specification material on versioning and extension discipline (§15–§16).

## 10. Internal Geometry and Physics (Optional Extension)

This section specifies internal geometry and physics structures that are required only for implementations that materialize operators such as `ProfilePhaseSpace`, `PhysicsProfile`, and `SpectralGeometry`. The core machine defined in §§1–9 and §§12–16 does not depend on these structures.

### 10.1 Profile Phase Space

For any Profile `P`, its **phase space** is the set of profile-invariant recognitions equipped with the induced order and modalities:

```text
PhaseSpace(P) :=
  states: { (c,e) ∈ P.recognitions | (c,e) satisfies ProfileInvariant }
  order:  restriction of Cell orders to states
  flow:   restriction of FlowProfile on states
  nucleus:restriction of Profile-level nucleus on states
```

Here, `ProfileInvariant` denotes the invariants computed in the Profile construction pipeline (§3.6) such as `ProfileInvariantLattice` and `ProfileInvariantOrder`. `PhaseSpace(P)` is the domain on which the dynamics of §10.2 are defined.

### 10.2 Physics Profile and Dynamics

`PhysicsProfile` and related operators (`FlowProfile`, `FixedFlowProfile`, `FlowObservation`) specify the dynamics of a Profile:

* `FlowProfile` restricts the global `flow` operator to `P.recognitions`;
* `FixedFlowProfile` identifies flow-fixed recognitions within the Profile;
* `FlowObservation` lifts flow to Observations over the Profile;
* `PhysicsProfile` couples flow and nucleus over `PhaseSpace(P)`.

Implementations that materialize `PhysicsProfile` MUST:

* interpret `PhysicsProfile` as defining a profile-level dynamics on `PhaseSpace(P)` where each step is driven by `flow` (and possibly nucleus-induced corrections);
* ensure that flow steps respect normalization and equivalence (no new canonical states are created except those required by this specification);
* treat fixed points of this dynamics (`FixedFlowProfile` ∩ nucleus-fixed) as physically stable states.

When mixing or ergodicity operators (such as `Mixing`, `Ergodicity`, `IterativePersistence`) are materialized for a given Profile, implementations MUST additionally:

* characterize whether the induced dynamics on `PhaseSpace(P)` is mixing or ergodic according to those operators;
* expose these properties as derived invariants accessible through Profile diagnostics, without altering the underlying dynamics.

### 10.3 Spectral Geometry Layer

`SpectralGeometry` packages deviation and wave operators on observation kernels into a spectral calculus over a Profile:

* `ObservationKernel` associates to each fixed state an observable distribution over successor recognitions;
* `MeasureDeviationObservationKernel` defines a deviation operator on this kernel;
* `WaveOperator` (and its harmonic operators) induce harmonic modes and spectral weights.

Implementations MUST provide, for each Profile where these operators are materialized, two additional carrier kinds:

```text
ObservationKernel(P):
  id:          KernelID
  domain:      PhaseSpace(P)
  transition:  map[state → multiset of successor states with weights]

InvariantMeasure(P):
  id:          MeasureID
  support:     subset of PhaseSpace(P)
  weights:     map[state → non-negative real]
```

The `ObservationKernel(P)` carrier encodes, for each fixed state, the observable distribution over successor recognitions induced by a single flow–measure step. `InvariantMeasure(P)` encodes a non-negative weight on states in `PhaseSpace(P)` that is preserved by the transition structure of `ObservationKernel(P)` according to the transition laws of this specification.

Implementations MUST also provide a spectral carrier:

```text
SpectralData(P):
  modes:       finite set of harmonic modes over PhaseSpace(P)
  eigenvalues: associated spectral values
  weights:     measure/weight of each mode
```

For each Profile with `SpectralGeometry`, modes MUST be derived from the deviation operator and `ObservationKernel(P)` as specified here; spectral data MUST be deterministic functions of `PhaseSpace(P)`, `ObservationKernel(P)`, and `InvariantMeasure(P)`. Any spectral summaries stored in `Cell.trace_meta` or Profile-level caches MUST NOT alter semantics.

When harmonic-structure operators (e.g. `HarmonicBasis`, `HarmonicMode`, `HarmonicSeed`, `HarmonicStep`) are available, implementations MUST:

* treat `modes` as elements of a harmonic basis over `PhaseSpace(P)`;
* ensure that time evolution under `PhysicsProfile` is compatible with decomposition into these modes and associated spectral data.

## 11. Reserved

Section 11 is reserved for future materialization of additional interaction structures once the corresponding operators and carriers have been fully specified within this specification.

### 11.3 Relationship to External Interface

All semantics of observation handling MUST flow through the Observation Pipeline (§4); no additional external mutation operations on Profiles or Cells are permitted.

## 12. Implementation Conformance and Backend Independence

This section specifies how different implementation technologies (for example, Python interpreters, LLVM-based compilers, or embedded controllers) conform to the same relational computer specification.

### 12.1 Internal vs External Representation

Canonical JSON (§6.6) is the normative external representation of Cells, Profiles, Edges, and Programs. Any implementation MUST:

* maintain an internal representation whose observable behavior is indistinguishable from the behavior defined in this specification when encoded/decoded through canonical JSON;
* ensure that all state reachable through `MachineState` can be losslessly encoded to and decoded from canonical JSON without changing semantics.

The choice of in-memory structures, machine instructions, or storage layout is unconstrained, provided that these conditions hold.

### 12.2 Determinism and Scheduling

The semantics of the relational computer are deterministic. Implementations:

* execute programs as sequences of operator-implementation invocations (§5.0) whose net effect on `MachineState` is equivalent to executing the steps in the order prescribed by the program;
* are permitted to interleave or parallelize evaluation of multiple programs or implementations internally, but the final committed `MachineState` MUST be equal to the result of some sequential execution order that respects:
  * the step order within each program, and
  * data dependencies implied by shared Cells and Profiles.

Any concurrency or instruction-level parallelism in the underlying platform MUST be invisible at the level of `MachineState` semantics.

### 12.3 Purity, Side Effects, and Environment

Operator implementations (§5.0) and ISA operators (§2) are defined mathematically as pure functions of their inputs and `MachineState`. Implementations:

* are permitted to allocate memory, use stacks, or perform local computation in any language or instruction set;
* MUST NOT produce externally observable side effects (such as network traffic, file I/O, or hardware control) that are not represented as changes to `MachineState` through the mechanisms described in this specification;
* MUST ensure that two executions of the same operator implementation on identical inputs and identical `MachineState` produce identical outputs and proposed edges.

External effects (for example, sensing or actuating in physical hardware) are mediated exclusively through Observations and the external APIs in §8, not through direct side effects inside implementations.

### 12.4 Conformance Across Platforms

An implementation on any platform (scripting environment, compiled code, or embedded controller) is conformant if and only if:

* it maintains a `MachineState` as defined in §1.4;
* it provides ISA operators, Profiles, and Observations that satisfy all laws and contracts in §§1–10 and §12;
* it uses canonical JSON and hash-derived IDs for all persisted objects as in §6.6;
* it exposes only the external interface of §8 (possibly wrapped by platform-specific code) for observable mutation and inspection.

Under these conditions, different backends are merely different realizations of the same relational computer and MUST agree on the results of any sequence of Observations when compared via canonical encodings and IDs.

## 13. Reference Examples and Conformance Cases (Informative)

This section defines concrete reference examples that a conformant implementation is expected to reproduce using canonical JSON and hash-derived IDs. These examples are informative but serve as conformance tests for the normative machinery defined in the core sections.

### 13.1 Ground Cell Payload and ID

The initial Ground Cell (§7.1) is the 2-element bounded Heyting algebra with carrier `{e_bottom, e_top}`, order `e_bottom ≤ e_top`, meet/join tables corresponding to this total order, `negate_map` swapping the two elements, and `nucleus_map` and `flow_map` both equal to the identity map. Its JSON payload (without the `id` field) MUST contain exactly the fields and values described in §1.1 and §9.1 for a Cell instantiating this algebra, encoded canonically as in §6.6.

Let `payload_ground_cell` denote this canonical encoding. The Ground Cell ID is:

```text
GroundCellID = baf574e5baeba903e1b9b9e6bd69bf5e2cacf69c1a458ab263b5cbab17319698
```

Any conformant implementation MUST compute the same `GroundCellID` for this payload and MUST use this as the ID of the initial Cell constructed in §7.1.

### 13.2 Initial Profile and Term Example

Given the Ground Cell above, the initial Profile (§7.2) has:

```text
visible_cells   = { GroundCellID }
recognitions    = { (GroundCellID, e_bottom), (GroundCellID, e_top) }
fixed_recognitions = recognitions
```

Consider the term:

```text
t0 = MeetTerm(Recog(GroundCellID, e_bottom),
              Recog(GroundCellID, e_top))
```

In the empty context `Γ = {}`, typing and semantics MUST satisfy:

```text
Γ ⊢ t0 : Rec
interpret_term(t0, Γ) = (GroundCellID, e_bottom)
```

Any conformant implementation MUST produce a canonical encoding of `t0` and of its interpretation that is consistent with the Cell payload and the Profile definition above.

### 13.3 Observation Example

Define an Observation `obs0` targeting the initial Profile with:

```text
obs0.trace = empty_trace()
obs0.term  = t0
```

Processing `obs0` via the Observation Pipeline (§4) on the initial Profile MUST:

* accept the term as well-typed;
* interpret it to `(GroundCellID, e_bottom)`;
* leave the trace as `empty_trace()` (up to `NF_trace`);
* nucleate the resulting recognition, which is already fixed under flow and nucleus.

The resulting `MachineState` MUST still contain exactly one Cell (the Ground Cell) and one Profile (the initial Profile), and the set of fixed recognitions MUST include `(GroundCellID, e_bottom)` and `(GroundCellID, e_top)`.

### 13.4 Trace Normalization Example

Let `k1` and `k2` be two `TraceStepKind` values that commute under the admissible shuffle relation of §6.3. Consider the traces:

```text
t1.steps = [ TraceStep(kind=k1, payload=p1),
             TraceStep(kind=k2, payload=p2) ]

t2.steps = [ TraceStep(kind=k2, payload=p2),
             TraceStep(kind=k1, payload=p1) ]
```

For any such commuting pair `(k1, k2)` and payloads `(p1, p2)`, a conformant implementation MUST satisfy:

```text
NF_trace(t1) = NF_trace(t2)
trace_equiv(t1, t2) = true
```

and MUST use `NF_trace` when comparing or storing traces so that shuffle-equivalent traces collapse to a single canonical representative.

In the support-based independence scheme of §2.3, a sufficient condition for `k1` and `k2` to commute is that their `read_support`/`write_support` sets are disjoint in the sense required there. For example, an `OperatorStep` that reads two recognitions in Cell `C1` and writes a third, and an `OperatorStep` that reads and writes recognitions only in a distinct Cell `C2`, are independent and therefore commute.

### 13.5 Algebraic and Modal Law Examples

Consider a Cell `C` with three elements `{e_bottom, e_mid, e_top}` and order:

```text
e_bottom ≤ e_mid ≤ e_top
```

with lattice operations:

```text
meet(e_mid, e_top) = e_mid
join(e_mid, e_bottom) = e_mid
```

and `top(C) = e_top`, `bottom(C) = e_bottom`. The following algebraic laws MUST hold:

```text
meet(e_mid, join(e_mid, e_top)) = e_mid           # absorption
join(e_mid, meet(e_mid, e_bottom)) = e_mid        # absorption
```

If `nucleus` and `flow` are given by:

```text
nucleus(e_bottom) = e_mid
nucleus(e_mid)    = e_mid
nucleus(e_top)    = e_top

flow(e_bottom) = e_mid
flow(e_mid)    = e_top
flow(e_top)    = e_top
```

then flow–nucleus commutation requires:

```text
flow(nucleus(e_bottom)) = flow(e_mid)    = e_top
nucleus(flow(e_bottom)) = nucleus(e_mid) = e_mid
```

which violates `flow(nucleus(a)) = nucleus(flow(a))` and therefore is not admissible for a conformant Cell. Any conformant Cell MUST choose `nucleus` and `flow` so that the commutation equation holds for all elements.

### 13.6 β-Compatibility Example

In the initial Profile (§7.2), consider the function:

```text
f = Lam(x:Rec, MeetTerm(x, Recog(GroundCellID, e_top)))
u = Recog(GroundCellID, e_bottom)
```

The application term:

```text
t_beta = App(f, u)
```

and the substitution instance:

```text
t_sub  = MeetTerm(Recog(GroundCellID, e_bottom),
                  Recog(GroundCellID, e_top))
```

are both well-typed at type `Rec` in the empty context. A conformant implementation MUST satisfy:

```text
Γ = {}
Γ ⊢ t_beta : Rec
Γ ⊢ t_sub  : Rec
Γ ⊢_P t_beta ⇓ (GroundCellID, e_bottom)
Γ ⊢_P t_sub  ⇓ (GroundCellID, e_bottom)
NF_recognition(GroundCellID, e_bottom) = NF_recognition(GroundCellID, e_bottom)
```

so that β-compatibility holds as required by §3.5.

### 13.7 Recognition and Judgment Canonicalization Examples

Let `C` be a Cell where `meet` and `join` are commutative, associative, and idempotent, and where:

```text
e_a = meet(Rec1, Rec2)
e_b = meet(Rec2, Rec1)
```

for some recognition elements `Rec1`, `Rec2`. A conformant implementation MUST ensure:

```text
NF_recognition(C, e_a) = NF_recognition(C, e_b)
recognition_equiv(C, e_a, e_b) = true
```

For judgments, let `Γ = { x:Rec }` and terms:

```text
a = MeetTerm(Var(x), Recog(CID, e_top))
b = MeetTerm(Recog(CID, e_top), Var(x))
```

Assume both `a` and `b` are well-typed at `Rec` and evaluate in Profile `P` to recognitions `(c, e_a)` and `(c, e_b)` with:

```text
NF_recognition(c, e_a) = NF_recognition(c, e_b)
```

Then the judgments:

```text
J1 = Γ ⊢ a ≡ b
J2 = Γ ⊢ b ≡ a
```

MUST satisfy:

```text
NF_judgment(J1) = NF_judgment(J2)
judgment_equiv(J1, J2) = true
```

as required by §6.2.

### 13.8 Profile Isolation and Observation Congruence Examples

Let `P1` and `P2` be two Profiles in the same `MachineState` with:

```text
P1.visible_cells = { GroundCellID }
P2.visible_cells = { GroundCellID }
```

and different syntax specifications (for example, `P1` treats an input blob as encoding a numeric literal, while `P2` treats the same blob as encoding a boolean literal), but both constructed via `ConstructProfile` (§5.3.1). For a fixed `observation_blob`, let:

```text
obs1_P1 = decode_observation(P1, observation_blob)
obs1_P2 = decode_observation(P2, observation_blob)
```

These Observations are processed independently by `HandleObservation` (§5.3.3). Profile isolation requires that:

* all typing, semantics, and normalization decisions for `obs1_P1` use only `P1`’s syntax, typing, and semantics; and
* all typing, semantics, and normalization decisions for `obs1_P2` use only `P2`’s syntax, typing, and semantics;

and that processing `obs1_P1` MUST NOT change `P2` or its visible Cells, and processing `obs1_P2` MUST NOT change `P1` or its visible Cells.

For observation congruence, let `obs1` and `obs2` be two Observations targeting the same Profile `P` with:

```text
NF_observation(obs1) = NF_observation(obs2)
```

If `HandleObservation` is applied separately to `(P, obs1)` and `(P, obs2)` starting from the same initial `MachineState`, then the resulting `MachineState` values `MS1'` and `MS2'` MUST be equal up to normalization of traces and recognitions, as required by §4 and §6.1.

### 13.9 Program Determinism Example

Let `P_boot` be the standard program `BootstrapMachine` (§5.3.2) and let `MS_empty` be the empty machine state:

```text
MS_empty.cells    = {}
MS_empty.profiles = {}
MS_empty.edges    = {}
```

Program determinism requires that:

```text
status1, MS1' = exec_program(MS_empty, P_boot)
status2, MS2' = exec_program(MS_empty, P_boot)
```

yield:

```text
status1 = SUCCESS
status2 = SUCCESS
MS1' = MS2'
```

and that the canonical encodings and IDs of all Cells, Profiles, and Edges in `MS1'` and `MS2'` match exactly, as required by §5.0, §6.6, and §12.2.

### 13.10 Law Checker Inventory (Informative)

This subsection lists a concrete inventory of law-checker procedures that an implementation can provide in order to materialize `LawDiagnostic` carriers (§9.7) and tests for the laws in this specification. Signatures are schematic and expressed in terms of the architectural entities defined elsewhere in this document.

All law-checker procedures are:

* pure: they do not mutate `MachineState`;
* deterministic: they return the same `LawDiagnostic` results for the same inputs; and
* uniform: failures are expressed only via `LawDiagnostic` and `Error` carriers as in §9.7–§9.8.

#### 13.10.1 Algebraic and Modal Law Checkers

```text
check_cell_lattice_laws(cell_id: CellID, ms: MachineState) → list[LawDiagnostic]
```

Verifies that `meet`, `join`, `top`, and `bottom` on the given Cell satisfy the lattice laws and absorption equations described in §2.1, §9.2, and illustrated in §13.5.

```text
check_cell_heyting_laws(cell_id: CellID, ms: MachineState) → list[LawDiagnostic]
```

Verifies that `imply` and `negate` satisfy the Heyting and pseudocomplement laws required by §2.1 and §9.2.

```text
check_cell_modal_laws(cell_id: CellID, ms: MachineState) → list[LawDiagnostic]
```

Verifies that `nucleus` and `flow` on the given Cell satisfy the modal requirements of §2.2 and §9.2, including:

* extensivity, monotonicity, and lax-idempotence for `nucleus`;
* the closure-distribution equalities

  ```text
  nucleus(meet(x, nucleus(y))) = nucleus(meet(x, y))
  nucleus(join(nucleus(x), y)) = nucleus(join(x, y))
  ```

  for all elements `x`, `y`;
* monotonicity and inflationarity for `flow`;
* the flow-over-meet inequality

  ```text
  flow(meet(x, y)) ≤ meet(flow(x), flow(y))
  ```

  for all elements `x`, `y`;
* correct computation of least fixed points by `fix_nucleus`, `fix_flow`, and `fix_both`;
* commutation `flow(nucleus(a)) = nucleus(flow(a))` for all elements.

#### 13.10.2 Semantic Law Checkers (β and Stability)

```text
check_profile_beta(profile_id: ProfileID, ms: MachineState) → list[LawDiagnostic]
```

Verifies β-compatibility for the λ-fragment and recognition-level constructs in Profile `profile_id` as required by §3.5, using a set of witness terms including the β-example of §13.6.

```text
check_profile_flow_nucleus_stability(profile_id: ProfileID, ms: MachineState) → list[LawDiagnostic]
```

Verifies that, for sampled terms of type `Rec`, the semantics of `FlowTerm` and `NucleusTerm` coincide with applying `flow` and `nucleus` to evaluated recognitions, as required by §3.5.

#### 13.10.3 Topos Structure Law Checkers

```text
check_profile_subobject_classifier(profile_id: ProfileID, ms: MachineState) → LawDiagnostic
```

Verifies that Profile `profile_id` has a subobject classifier `Ω_P` and that characteristic maps correspond to subobjects as required by §3.8.

```text
check_profile_exponentials(profile_id: ProfileID, ms: MachineState) → LawDiagnostic
```

Verifies the existence and basic equations of exponentials between profile-invariant recognitions as required by §3.8.

```text
check_profile_topos_axioms(profile_id: ProfileID, ms: MachineState) → list[LawDiagnostic]
```

Aggregates subobject-classifier, finite-limit, and exponential checks for Profile `profile_id` into a single family of diagnostics for the ProfileTopos structure of §3.8.

#### 13.10.4 Canonicalization Law Checkers

```text
check_nf_trace_laws(trace: Trace, ms: MachineState) → list[LawDiagnostic]
```

Verifies determinism, idempotence, and compatibility of `NF_trace` and `trace_equiv` with shuffle-equivalence as required by §2.3, §6.3, and illustrated in §13.4.

```text
check_nf_recognition_laws(cell_id: CellID, element_ids: list[ElementID], ms: MachineState) → list[LawDiagnostic]
```

Verifies determinism, idempotence, and compatibility of `NF_recognition` with `meet`, `join`, `imply`, `negate`, `nucleus`, and `flow` as required by §6.4, including commutativity examples such as §13.7.

```text
check_nf_observation_laws(observations: list[Observation], ms: MachineState) → list[LawDiagnostic]
```

Verifies determinism and idempotence of `NF_observation` as defined in §6.1 and its compatibility with trace and recognition normalization.

```text
check_nf_judgment_laws(judgments: list[Judgment], ms: MachineState) → list[LawDiagnostic]
```

Verifies determinism, idempotence, and symmetry properties of `NF_judgment` as required by §6.2, including examples where `Γ ⊢ a ≡ b` and `Γ ⊢ b ≡ a` normalize to the same canonical judgment (§13.7).

#### 13.10.5 Profile Isolation and Observation Congruence Law Checkers

```text
check_profile_isolation(ms: MachineState, p1: ProfileID, p2: ProfileID, observation_blob) → list[LawDiagnostic]
```

Verifies that processing an observation targeting Profile `p1` leaves Profile `p2` and its visible Cells unchanged, and conversely, as required by Profile-local behavior in §3 and by isolation constraints illustrated in §13.8.

```text
check_observation_congruence(ms: MachineState, profile_id: ProfileID, obs1: Observation, obs2: Observation) → LawDiagnostic
```

When `NF_observation(obs1) = NF_observation(obs2)`, verifies that applying the Observation Pipeline (§4) via `HandleObservation` (§5.3.3, §8.1) to each observation from the same initial `MachineState` yields final `MachineState` values that are equal up to normalization, as required by §4 and §6.1.

#### 13.10.6 Program Determinism and Purity Law Checkers

```text
check_program_determinism(ms: MachineState, program: Program) → LawDiagnostic
```

Verifies that executing `program` twice from the same initial `MachineState` via `exec_program` (§5.0) yields identical outcomes (both failures with the same `Error.kind` or both successes with identical final `MachineState` encodings), as required by §5.0, §9.2, and §12.2. The determinism example in §13.9 is a canonical witness.

```text
check_handle_observation_determinism(ms: MachineState, profile_id: ProfileID, observation_blob) → LawDiagnostic
```

Verifies that invoking the `HandleObservation` standard program (§5.3.3) twice with the same inputs produces identical `ObservationResult` payloads and identical final `MachineState` encodings.

```text
check_operator_purity(ms: MachineState, operator_name: OperatorName, inputs: list[NodeID]) → LawDiagnostic
```

Verifies that the operator implementation named `operator_name` is pure and deterministic in the sense of §5.0 and §12.3: running it twice on the same inputs does not change `MachineState` and yields identical outputs and edge descriptions.

#### 13.10.7 Aggregated Law Checker

```text
run_all_law_checks(ms: MachineState) → list[LawDiagnostic]
```

Aggregates the law-checkers above into a single diagnostic pass that:

* invokes algebraic and modal law-checkers for each Cell in `ms.cells`;
* invokes semantic, topos, canonicalization, isolation, and congruence law-checkers for each Profile in `ms.profiles`;
* verifies program determinism and purity for selected standard programs and operator implementations.

The exact selection and sampling strategy for inputs to `run_all_law_checks` is implementation-specific, but any reported `LawDiagnostic` objects MUST obey the shape and semantics specified in §9.7–§9.8.

### 13.11 Witness Trace and ProfileTopos Examples

This subsection sketches concrete witness-trace and `ProfileTopos` patterns that are consistent with the normative requirements in §§1–6. These examples are informative: an implementation may adopt them directly or use them as a guide.

**Witness trace for a simple meet term**

Consider the initial Profile (§7.2) and the term:

```text
t_meet = MeetTerm(Recog(GroundCellID, e_bottom),
                  Recog(GroundCellID, e_top))
```

One concrete way to realize a witness trace for the evaluation of `t_meet` is:

```text
t_a.steps = [ OperandStep((GroundCellID, e_bottom)) ]
t_b.steps = [ OperandStep((GroundCellID, e_top)) ]
step_meet  = OperatorStep(
               operator = "MeetRecognition",
               inputs   = [0, 1])   # refer to operands by position

t_raw  = concat_trace(concat_trace(t_a, t_b), step_meet)
t_wit  = normalize_trace(t_raw)
```

with:

```text
witness_recognition(t_wit) = (GroundCellID, e_bottom)
```

and `NF_trace(t_raw) = NF_trace(t_wit)`. This witness trace is compatible with the semantic equations in §3.5 (`SEM-RECOG`, `SEM-MEET`) and with the algebraic laws summarized in §13.2–§13.5.

**Support sets for simple trace steps**

Under the support discipline of §2.3, the support sets for the steps above can be chosen as:

```text
read_support(OperandStep((CellID, e)))  = {("recognition", CellID, e)}
write_support(OperandStep((CellID, e))) = ∅

read_support(step_meet)  = {("recognition", GroundCellID, e_bottom),
                             ("recognition", GroundCellID, e_top)}
write_support(step_meet) = {("recognition", GroundCellID, e_bottom)}
```

An `OperatorStep` that reads and writes only recognitions in a different Cell `C2` would have support sets disjoint from those of `step_meet` and is therefore independent; `NF_trace` may shuffle such steps past each other.

**Toy `ProfileTopos(P)` instance**

For the initial Profile `P0` (§7.2), a minimal `ProfileTopos(P0)` consistent with §3.8 can be realized as:

```text
objects = { Obj_bottom, Obj_top, Obj_Omega }
arrows  = { id_bottom, id_top, id_Omega,
            incl_bottom, incl_top,
            true_P0, chi_bottom, chi_top }
```

where:

* `Obj_bottom` denotes the object corresponding to the singleton subobject `{(GroundCellID, e_bottom)}`,
* `Obj_top` denotes the object corresponding to `{(GroundCellID, e_top)}`,
* `Obj_Omega` denotes the object `Ω_P0` of internal truth values for subobjects of `P0.fixed_recognitions`,
* `id_*` arrows are identities on these objects,
* `incl_bottom: Obj_bottom ↪ Obj_top` and `incl_top: Obj_top ↪ Obj_top` are monos representing inclusions of subobjects,
* `true_P0: 1 → Obj_Omega` is the distinguished truth arrow,
* `chi_bottom: Obj_top → Obj_Omega` and `chi_top: Obj_top → Obj_Omega` are characteristic morphisms for the subobjects represented by `incl_bottom` and `incl_top`.

The predicate `is_mono` marks `incl_bottom` and `incl_top` as monos. Pulling back `true_P0` along `chi_bottom` recovers (up to isomorphism) the subobject `Obj_bottom`, and pulling back along `chi_top` recovers `Obj_top` itself. This witnesses the subobject-classifier behavior of `Ω_P0` in a concrete, finite setting and illustrates how a `ProfileTopos(P)` instance can be represented using the skeletal structure required by §3.8.

### 13.12 End-to-End Walkthrough (Informative)

This subsection stitches together the bootstrap process, the Observation Pipeline, witness traces, and `ProfileTopos` into a single end-to-end example. It does not add new requirements; it instantiates the laws already stated in §§1–12.

**Step 1: Bootstrap from an empty machine**

Start from the empty machine state:

```text
MS_empty.cells    = {}
MS_empty.profiles = {}
MS_empty.edges    = {}
```

Executing the standard program `BootstrapMachine` (§5.3.2, §7.1–§7.4, §13.1–§13.2) yields a new state `MS0` that contains:

* a single Ground Cell `GroundCellID` instantiating the 2-element bounded Heyting algebra of §7.1, with algebraic and modal structure as in §13.1; and
* a single Profile `P0` with:
  * `visible_cells   = { GroundCellID }`,
  * `recognitions    = { (GroundCellID, e_bottom), (GroundCellID, e_top) }`,
  * `fixed_recognitions = recognitions`,
  * syntax, typing, and semantics as in §7.2–§7.3.

At this point, the machine is ready to accept Observations into `P0`.

**Step 2: A concrete term and observation**

Consider the term (already used in §13.2 and §13.11):

```text
t_meet = MeetTerm(Recog(GroundCellID, e_bottom),
                  Recog(GroundCellID, e_top))
```

In the empty context `Γ = {}`, typing and semantics satisfy:

```text
Γ ⊢ t_meet : Rec
interpret_term_P0(t_meet, Γ) = (GroundCellID, e_bottom)
```

Define an external observation blob `oblob0` that `decode_observation(P0, oblob0)` treats as encoding both:

* an empty temporal component, and
* the syntactic structure of `t_meet`.

Formally,

```text
T0, S0 = decode_observation(P0, oblob0)
```

with `T0 = empty_trace()` and `S0` decoding to `t_meet` under the Profile’s syntax rules (§3.2, §3.6).

The Observation carrier for `oblob0` is:

```text
obs0.trace = T0
obs0.term  = t_meet
```

**Step 3: Observation Pipeline over P0**

Applying the Observation Pipeline (§4, `HandleObservation` in §5.3.3, §8.1) to `(MS0, P0, oblob0)` proceeds conceptually as:

1. **Profile selection and typing (§4.2):**

   * `P0` is selected from `MS0.profiles`.
   * The typing rules of `P0` establish `Γ_P0 ⊢ t_meet : Rec`.

2. **Semantic interpretation (§4.3, §3.5):**

   * Evaluation yields `interpret_term_P0(t_meet, Γ_P0) = (GroundCellID, e_bottom)`.

3. **Trace evolution (§4.4):**

   * The trace evolves via `evolved_trace = flow_trace(T0)`.
   * In this initial Profile, `flow` is the identity (§7.1), so `flow_trace(T0) = NF_trace(T0) = empty_trace()` up to trace normalization (§2.3, §6.3).

4. **Kernel/deviation analysis (§4.5):**

   * In a minimal implementation without a nontrivial observation kernel, this step is trivial: the deviation `Δ` is zero and imposes no additional restriction beyond the modal fixed-point laws.

5. **Nucleation decision (§4.6):**

   * The closure operator and flow are both identity on the Ground Cell (§7.1), so:

     ```text
     stable_elem      = nucleus(GroundCellID, e_bottom) = e_bottom
     is_nucleus_fixed = true
     is_flow_fixed    = (flow(GroundCellID, stable_elem) == stable_elem) = true
     ```

   * The observation is judged nucleatable, and `(GroundCellID, stable_elem)` is already in `P0.fixed_recognitions`.

6. **Profile and Cell update (§4.7):**

   * Because the recognition was already fixed under flow and nucleus, `MS0` and the resulting state `MS1` are identical modulo canonicalization.

In this example, `submit_observation(P0, oblob0)` is a no-op on `MachineState`, but it exercises the full Observation Pipeline on a concrete term.

**Step 4: Witness trace for the same evaluation**

The semantic judgment `Γ_P0 ⊢_P0 t_meet ⇓ (GroundCellID, e_bottom)` can be justified by at least one witness trace (as required by §1.2.1 and §3.5). Using the pattern from §1.2.2 and §13.11, one such witness trace is:

```text
t_a.steps = [ OperandStep((GroundCellID, e_bottom)) ]
t_b.steps = [ OperandStep((GroundCellID, e_top)) ]
step_meet  = OperatorStep(
               operator = "MeetRecognition",
               inputs   = [0, 1])

t_raw  = concat_trace(concat_trace(t_a, t_b), step_meet)
t_wit  = normalize_trace(t_raw)
```

with:

```text
witness_recognition(t_wit) = (GroundCellID, e_bottom)
NF_trace(t_raw) = NF_trace(t_wit)
```

and support sets:

```text
read_support(OperandStep((CellID, e)))  = {("recognition", CellID, e)}
write_support(OperandStep((CellID, e))) = ∅

read_support(step_meet)  = {("recognition", GroundCellID, e_bottom),
                             ("recognition", GroundCellID, e_top)}
write_support(step_meet) = {("recognition", GroundCellID, e_bottom)}
```

These choices satisfy the independence and normalization laws of §2.3 and §6.3 and the witness-trace compatibility laws of §1.2.1 and §6.4.

**Step 5: Embedding into `ProfileTopos(P0)`**

Finally, the fixed recognitions `(GroundCellID, e_bottom)` and `(GroundCellID, e_top)` appear as objects and subobjects inside `ProfileTopos(P0)`:

* `Obj_bottom` represents the subobject `{(GroundCellID, e_bottom)}`.
* `Obj_top` represents the subobject `{(GroundCellID, e_top)}`.
* `Obj_Omega` is the object `Ω_P0` of internal truth values.
* `incl_bottom: Obj_bottom ↪ Obj_top` and `incl_top: Obj_top ↪ Obj_top` are monos.
* `true_P0: 1 → Obj_Omega` is the truth arrow.
* `chi_bottom: Obj_top → Obj_Omega` and `chi_top: Obj_top → Obj_Omega` are characteristic maps.

The subobject classifier property of §3.8 is witnessed by the fact that:

* the pullback of `true_P0` along `chi_bottom` is (up to isomorphism) `Obj_bottom`, and
* the pullback of `true_P0` along `chi_top` is (up to isomorphism) `Obj_top` itself.

Thus, in this end-to-end example, the same concrete recognition `(GroundCellID, e_bottom)`:

* arises from Cell algebra over the Ground Cell;
* is witnessed by a canonical trace `t_wit` built from `OperandStep` and `OperatorStep`;
* is reached by Profile term evaluation and the Observation Pipeline; and
* appears as a subobject of `Obj_top` in the internal topos `ProfileTopos(P0)` via `incl_bottom` and `chi_bottom`.

## 14. Primitive Component Index (Informative)

This section summarizes a minimal set of named primitive components that appear explicitly in this specification and their architectural roles. Names not listed here either refer to composites of these primitives or describe additional structure not yet materialized at the architectural level.

**ISA and temporal operators**

| Name                            | Role in This Spec                                |
| --------------------------------| ----------------------------------------------- |
| `MeetRecognition`               | ISA operator `meet`; §2.1, §3.2                 |
| `JoinRecognition`               | ISA operator `join`; §2.1, §3.2                 |
| `ImplyRecognition`              | ISA operator `imply`; §2.1, §3.2                |
| `Negate`                        | ISA operator `negate`; §2.1, §3.2               |
| `OrderRecognition`              | ISA operator `leq`; judgment layer; §2.1, §3.4  |
| `GroundRecognition`             | bottom element of Cell; §2.1                    |
| `Nucleate`                      | modal operator `nucleus`; observation nucleation; §2.2, §4.6 |
| `FixNucleus`                    | fixed-point for nucleus; §2.2                   |
| `FixFlow`                       | fixed-point for flow; §2.2                      |
| `FixFlowNucleus`                | joint fixed-point; §2.2, §4.6                   |
| `Flow`                          | modal operator `flow`; §2.2, §4.4               |
| `StartTrace`                    | `empty_trace`; §2.3                            |
| `StepTrace` / `AdvanceTrace`    | `extend_trace`; §2.3                           |
| `ShuffleTrace`                  | `normalize_trace`; §2.3, §6.3                  |
| `CompleteTrace`                 | trace normalization; §2.3, §6.3                |
| `TraceObservationEquivalence`   | `trace_equiv`; §2.3, §4.5, §6.1                |
| `HeadTrace` / `TailTrace`       | `head_of_trace`, `tail_of_trace`; §2.3         |
| `ShuffleFlow`                   | `flow_trace`; §2.3, §4.4                       |

**Observation and deviation operators**

| Name                                | Role in This Spec                         |
| ----------------------------------- | ----------------------------------------- |
| `RecognizeObservation`              | observation term wrapper; §3.2, §4        |
| `FlowObservation`                   | flow on observations; §4.4                |
| `FixedObservationRecognitions`      | fixed observations; §4.6                  |
| `ObservationKernel`                 | kernel over observations; §4.5, §10.3     |
| `MeasureDeviationObservationKernel` | deviation operator; §4.5, §10.3           |
| `WitnessObservation`                | witness for observation nucleation; §4.6  |

**Geometric and spectral operators (optional extensions)**

| Name                | Role in This Spec                 |
| ------------------- | --------------------------------- |
| `ProfilePhaseSpace` | phase space; §10.1               |
| `PhysicsProfile`    | physical semantics in Profile; §10.2 |
| `SpectralGeometry`  | spectral calculus; §10.3         |
| `HarmonicBasis`     | harmonic mode basis; §10.3       |
| `HarmonicMode`      | fixed oscillatory recognitions; §10.3 |
| `Mixing`            | mixing property over phase space; §10.2 |
| `Ergodicity`        | ergodicity for fixed kernels; §10.2 |

**Standard programs (composite, non-primitive)**

These named programs are composites of primitive operators and carriers; they introduce no new runtime structure but provide a canonical realization of key pipelines.

| Name               | Role in This Spec                                |
| ------------------ | ------------------------------------------------ |
| `ConstructProfile` | realizes the Profile Construction Pipeline; §3.6, §5.3.1 |
| `BootstrapMachine` | realizes the bootstrap sequence from empty state; §7.1–§7.4, §5.3.2 |
| `HandleObservation`| realizes the Observation Pipeline for one Profile and payload; §4, §5.3.3, §8.1 |

This index is intended as a quick reference for implementers. The normative definitions of each component are given in the sections referenced in the right-hand column.

## 15. Specification Versioning and Compatibility

This specification defines a single version of the relational computer architecture. Implementations and other documents that reference this specification MUST record the version they target.

Changes to this document are classified as follows:

* A **behavioral change** alters any `MUST` / `MUST NOT` requirement, any algebraic law, or any observable behavior of a conformant implementation. Behavioral changes MUST be treated as a new, incompatible version of the specification.
* A **non-behavioral change** clarifies wording, improves examples, or tightens tests without changing the observable behavior of conformant implementations. Non-behavioral changes are treated as minor revisions of the same version.

Any future extension that adds new primitive components (operators, carriers, or constructors) MUST preserve all existing laws and behaviors specified here for the structures already covered. New versions MUST state explicitly which additional primitives they materialize and how those primitives extend `MachineState`, Profiles, Observations, and the execution model.

## 16. Extending the Machine

The relational computer is defined by the primitive components and laws described in this specification. Extensions introduce additional primitives or composites while preserving this core.

When new primitives are introduced, extensions MUST proceed as follows:

1. **Classification**: Each new primitive is classified as either:
   * **primitive** – introduces a new carrier kind, ISA operator, Profile construct, or Observation step; or
   * **composite** – realizable entirely as a program built from existing primitive operators and carriers, with no new runtime structure.
2. **Mapping**: Newly introduced primitives MUST be assigned explicit architectural roles, extending the tables in §5 and the index in §14. Composites MUST be realized as named programs or composites referencing existing primitives.
3. **Invariants**: Any invariants required by new primitives (for example, new commutation laws or fixed-point properties) MUST be added to the formal contract in §9 and, where appropriate, enforced via LawDiagnostic carriers (§9.7).
4. **Non-regression**: Extensions MUST NOT weaken or violate any `MUST` / `MUST NOT` requirement, algebraic law, or observable behavior already specified for existing structures.

An implementation that incorporates additional primitives is conformant to this specification only if all obligations in §§1–15 remain satisfied for the structures covered here, and the new primitives are integrated according to the rules above.
