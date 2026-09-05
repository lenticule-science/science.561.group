# Relational Computer — Architectural Specification (Foundational README)

This document is the **authoritative map** of the relational computer as a whole.  
It aligns **every subsystem** with the underlying **acts** in the derivation trace so that an engineer—even with no prior exposure to the repository—can reconstruct the entire machine solely from:

1. the **acts narrative**, and  
2. this **README**.

This README is written to **stand on its own** as a technical specification.  
It does not describe implementation *choices*; it describes the **actual structure of the machine we intend to build**.

---
# 0. Executive Summary
The relational computer is a **spectral fixpoint machine** whose runtime state is a **typed, aperiodic operator graph** derived from the acts of relationality. Its persistent form is a collection of JSON/YAML/Python files; its living form is an in-memory operator algebra acting on recognitional carriers.

**Recognitions** become **objects** (finite JSON fragments).  
**Morphs** (act-level structure-preserving transformations) become **runbooks** (YAML morphisms).  
**Moves** (act-level operations) become **realizers** (Python functions).  
Operators such as **Flow**, **Nucleus**, **Kernel**, **Laplacian**, and **Shuffle** drive the dynamics of the runtime.

All operator cycles are **aperiodic**: they converge into fixed invariants, harmonic modes, and eigen-geometries.  
This ensures the computer is **intrinsically convergent, safe, and spectral**.

---
# 1. Mathematical Ground — Acts as the Source Code of the Machine
The relational computer does not arise from design patterns, ad‑hoc data structures, or programming conventions.  
It arises **directly** from the acts.  
The acts are the *source code* of the machine — the formal generative grammar from which every computational component is derived.

This section explains **exactly** how the acts generate the machine’s ontology and operational semantics.

---
## 1.1 Acts as Generators of Computational Primitives
Each act in the derivation trace introduces one of the machine’s **five irreducible primitives**:

| Act-Level Construct | Generated Machine Primitive |
|---------------------|-----------------------------|
| **Recognition** (lattice, logic, inclusion/exclusion) | **Object** — finite recognition-carrier (JSON) |
| **Morph** (structure-preserving transformation) | **Runbook** — morphic operator pipeline (YAML) |
| **Move** (operational content of an act) | **Realizer** — operator kernel (Python) |
| **Operator** (Flow, Nucleus, Kernel, Laplacian, Shuffle…) | **Typed edge** in AOG (runtime operator) |
| **Fixed point / eigen‑mode** | **Stabilized node or subgraph** of the AOG |

This mapping is not metaphorical — it is the **literal computational interpretation** of the acts.  
The acts are the machine; the machine is the acts given runtime form.

---
## 1.2 Recognitions → Objects (JSON)
Recognition acts (OrderRecognition, Meet, Join, Imply, Negate, Include/Exclude, ShapeRecognition…) define a **logic‑geometric algebra**.  
Objects are finite, serializable fragments of this algebra.

An Object is therefore:
- a bounded region of the recognition lattice,
- optionally enriched with structure (trace, profile, phase space),
- validated against `object.schema.json`.

Objects are **atomic carriers of recognitional information**.

---
## 1.3 Morphs → Runbooks (YAML)
Morphs are the **structure-preserving maps** between recognitions: homomorphisms preserving meet/join/imply, contextual structure, semantics, or dynamics.

A runbook is the serialized form of a morph:
- each step corresponds to an act-level move,
- the whole runbook corresponds to a morph between object kinds,
- the type of morph (Flow, Nucleate, Measure, Fix…) is determined entirely by its acts.

Runbooks are **operator pipelines**, not procedural scripts.
They define *what* transformations exist, not *how* to run them.

---
## 1.4 Moves → Realizers (Python)
A move is the operational content of an act:  
**Flow acts move recognitions in time**,  
**Nucleus acts collapse recognitions to closure**,  
**Measure acts pull recognitions through an observational kernel**, etc.

Realizers embody these moves as executable kernels:
- pure Python functions,
- each implementing exactly one act’s operational semantics,
- validated by `realizer.schema.json`.

Realizers are the **dynamic instructions** of the machine.

---
## 1.5 Operators → Typed Edges in the AOG
Operator acts (FlowProfile, NucleateProfile, FlowMeasureStep, ObservationKernel, Laplacian, HeatKernel, ShuffleFlow…) define the **higher-order dynamics** of recognitions.

In the AOG, every operator becomes a **typed edge** connecting object-nodes:
- Flow edges update PhaseSpace,
- Nucleus edges enforce closure,
- Trace edges connect temporal stages,
- Kernel edges define transition laws,
- Laplacian / Heat edges define spectral diffusion,
- Shuffle edges create equivalence structures.

The AOG is therefore the **operator graph** whose edges are the runtime activation of acts.

---
## 1.6 Fixed Points & Eigen‑Modes → Stabilized Nodes/Subgraphs
Fixed-point acts (FixFlow, FixNucleus, FixFlowNucleus) and spectral acts (SpectrumMap, HarmonicMode, FixedShape) identify **stable or oscillatory modes** of the operator algebra.

These appear in the AOG as:
- fixed invariant nodes,
- harmonic subgraphs,
- spectral tags,
- stable geometries (FixedInvariantGeometry).

These stabilized structures are the machine’s **long-run geometry**.

---
## 1.7 Why This Section Matters
This mapping is the **foundation** of the relational computer:
- All components arise from acts.
- All semantics arise from act-level constraints.
- All operators derive from act-level dynamics.
- All stability arises from act-level fixed-point principles.
- All geometry arises from spectral acts.

Every remaining section of this README describes how these primitives assemble into the persistent substrate, runtime AOG, System interface, and operational semantics.

---
# 2. Persistent Layer — Cold Storage of Recognitional Fragments. Persistent Layer — Cold Storage of Recognitional Fragments
The persistent layer is the **cold, non‑living substrate** of the relational computer.  
Nothing here is executable; nothing here is a System; nothing here participates in the AOG.  
These files are simply the *frozen carriers* from which the living AOG is reconstructed at boot.

This layer contains **three** categories of artifacts:
1. **Objects** — serialized recognitional fragments.  
2. **Runbooks** — serialized morphic templates (operator pipelines).  
3. **Realizer metadata** — serialized operator kernel descriptions.

The persistent layer is conceptually analogous to the **genome** of the relational computer:  
it encodes the *potential form* of the machine, but not its active behavior.

---
## 2.1 Objects (`objects/`) — Frozen Recognition-Carriers
Objects are JSON documents validated by `schemas/object.schema.json`.  
Each object is a **finite snapshot of recognitional structure**, possibly including:
- recognition lattices (meet/join/imply/negate),
- contexts, traces, and contextual geometry,
- sites, presheaves, sheaves,
- ProfileTopos fragments,
- PhaseSpace or MeasurementFrame fragments,
- fixed invariant carriers, spectral tags, and operator seeds.

Objects **never** exceed recognitional ontology; they are the smallest frozen units from which the AOG reconstructs its nodes.

During runtime:
- Objects are **loaded**, validated, and **converted into AOG nodes**.
- They are never mutated, and execution never reads from disk.
- Only the AOG holds living state.

---
## 2.2 Runbooks (`runbooks/`) — Frozen Operator Pipelines
Runbooks are YAML documents validated by `schemas/runbook.schema.yaml`. They define the **structure** (not execution) of morphic pipelines:
- each runbook specifies a typed operator sequence,
- each step corresponds to an act-level move,
- dependency and input/output object kinds are encoded structurally.

Runbooks are **static templates** that the AOG uses to construct its operator edges.  
They do not contain logic and cannot be executed directly; execution happens only through the AOG’s operator engine.

---
## 2.3 Realizers (`realizers/`) — Metadata for Operator Kernels
Realizers are described by JSON metadata validated by `schemas/realizer.schema.json`.  
This metadata includes:
- the act (operator) implemented,
- the Python module and function path,
- input/output object kinds,
- invariants and constraints.

The Python sources (`realizers/py/*.py`) contain the **operator kernels** — the actual act-level implementations of Flow, Nucleus, FlowMeasureStep, NormalizeObservation, FixFlowNucleus, etc.

Realizers are **not active** until they are bound to operator edges during boot.

---
## 2.4 Schemas (`schemas/`) — Cold Typing Rules
The schemas directory contains JSON Schema definitions for:
- object correctness,
- runbook correctness,
- realizer correctness.

These schemas enforce **typing discipline** in the persistent layer so the AOG can load and bind structures safely.

They do **not** define runtime behavior; they only guarantee that the persistent substrate is well-formed.

---
## Summary: Persistent Layer as Frozen Potential
The persistent layer stores **recognitional potential**, not behavior.
At boot, the relational computer:
- loads these artifacts,
- validates them,
- and constructs the AOG as a living operator algebra.

After boot, the persistent layer is never accessed again until the next startup.

---
# 3. Runtime Layer — The Aperiodic Operator Graph (AOG). Runtime Layer — The Aperiodic Operator Graph (AOG)
When the computer runs, the persistent files are loaded into an **in-memory typed operator graph**.

## 3. Runtime Layer — The Aperiodic Operator Graph (AOG)
When the computer runs, all persistent objects, runbooks, and realizers assemble into an **in‑memory typed operator graph**. This graph is the machine’s true internal state — the computational incarnation of the hypertensor topos.

This section distinguishes **core operators** (required for computation) from **analytic/spectral operators** (used for measurement, geometry, and eigen-analysis). Over time, both sets may grow large.

---
### 3A. Core Operators — Required for the Machine to Function
These operators must exist for the relational computer to coherently evolve, stabilize, ingest signals, and maintain recognitional integrity. They implement the backbone of the runtime.

#### (1) Logical & Structural
- Meet/Join/Imply/Negate
- ContextGeometry, RecognizeContext, RecognizeSyntax
These maintain the recognition lattice and context structure.

#### (2) Closure (Idempotent)
- Nucleate, NucleateProfile, NucleusSemantics
- AbsorbClosure, DistributeInterior
These ensure recognitions close under internal equivalence.

#### (3) Flow (Dynamics)
- Flow, FlowProfile, ProfileDynamics, ProfileReach
Defines how state evolves.

#### (4) Flow–Nucleus Interaction
- CommuteFlowAndNucleus
- FixFlow, FixNucleus, FixFlowNucleus
Enforces aperiodic commutation and convergence.

#### (5) Trace (Temporal Coherence)
- StartTrace, AdvanceTrace, ContinueTrace, CompleteTrace
- HeadTrace, TailTrace, ReheadTrace, RestepTrace
- TraceReentryClosure, StabilizeTrace
Defines sequential evolution and stabilized temporal memory.

#### (6) Minimal Observation Operators
- SeedObservation, RecognizeObservation, WitnessObservation
- ProfileObserve
These provide the boundary between external carriers and internal recognitions.

> These six families constitute the **irreducible operational backbone**.

---
### 3B. Analytic & Spectral Operators — Measurement, Geometry, Eigenstructure
These operators extend what the machine can *understand about itself*, but are not required for basic evolution.

#### (1) Kernel / Markov Operators
- ObservationKernel, TransitionLaw
- FlowMeasureStep, FixedKernel, ProfileKernelChain
For probabilistic evolution and long-run behaviour.

#### (2) Entropy & Divergence
- EntropySeed, EntropyMeasure, ProfileEntropy
Measures uncertainty and spread under dynamics.

#### (3) Spectral & Harmonic
- SpectrumSeed, SpectrumMap, Spectrum
- HarmonicSeed, HarmonicStep, HarmonicMode, HarmonicBasis
Eigenmodes of kernels, flows, and shuffle structures.

#### (4) Geometric Differential Operators
- Laplacian, HeatKernel, WaveOperator, SpectralGeometry
Enable diffusion, propagation, and wave analysis.

#### (5) Shuffle-Based Geometry
- ShuffleProfileRecognitions, ShuffleTrace, CollapseShuffle
- ShuffleGeometry, FixedShape
Capture geometric symmetries and shuffle-indexed eigenshapes.

---
### 3C. Why This Distinction Matters
- **Core operators** define the computer’s *ability to act*.
- **Analytic operators** define the computer’s *ability to understand its own action*.

Both are supported by the runtime AOG. All operators remain **aperiodic**, ensuring convergence to stable shapes.

## 4. Execution Layer — Operators in Action
The execution layer is where **acts become moves**, and moves become **operator applications** on the AOG. This section defines the concrete semantics of execution.

Execution is not a workflow engine and not a script interpreter. It is the **real‑time application of act‑operators** to recognitional carriers inside the AOG.

---
### 4.1 Realizers — Act-Level Operator Kernels
A **realizer** is a single Python function that implements the operational content of an act. It is the minimal executable unit of the machine.

A realizer:
- accepts a JSON recognition‑carrier (object),
- enforces all invariant, closure, and typing guarantees of its corresponding act,
- applies the operator semantics (Flow, Nucleus, FlowMeasureStep, etc.),
- returns a *new* JSON recognition‑carrier,
- emits diagnostic information about invariants, commutation, and stability.

Every operator in the AOG is backed by exactly one family of realizers. Examples:
- `realize_flow_step` → implements `FlowProfile` / `ProfileDynamics`,
- `realize_nucleus_step` → implements `NucleateProfile` / `NucleusSemantics`,
- `realize_flow_measure_step` → implements `FlowMeasureStep`,
- `realize_normalize_observation` → implements `NormalizeObservation` and observation‑equivalence closure,
- `realize_fix_invariant` → implements `FixFlowNucleus` and fixed‑point extraction.

A realization is **not optional**: without realizers, operators are inert.

---
### 4.2 Runbooks — Morphic Operator Pipelines
A **runbook** is a YAML morphism describing a *typed operator pipeline* from one object‑kind to another.

Runbooks are:
- declarative (no branching, no computation),
- purely structural,
- typed by input/output object kinds,
- internally consistent with act semantics.

Each runbook lists its operator steps as realizer invocations. For example:
- Topos construction pipelines: `build_site_from_recognitions`, `sheafify`, `build_profile_topos`.
- Dynamic pipelines: `flow_step`, `nucleus_step`, `mediate_flow_nucleus_commutation`.
- Measurement pipelines: `measure_state`, `normalize_observation`.
- Stabilization pipelines: `compute_fixed_invariants`.

Runbooks do **not** execute anything by themselves.  
The runtime executes them by applying each realizer in order to the corresponding nodes in the AOG.

---
### 4.3 Execution Semantics — What It Means To “Run” Something
To execute a runbook step:
1. Identify the target node(s) in the AOG.
2. Validate the node’s kind against the realizer’s expected input kind.
3. Invoke the realizer to compute the operator action.
4. Produce a new node representing the operator’s output.
5. Insert the new node into the AOG and connect it with a typed operator edge.
6. Update spectral and invariant tags if required.

Execution is therefore:
- **deterministic** (operators are deterministic),
- **typed** (edges and nodes must match),
- **aperiodic** (operator algebra contracts),
- **graph‑expanding or graph‑stabilizing** depending on the operator,
- **cacheable** (fixed points may reuse existing invariant nodes).

---
### 4.4 Execution Is AOG‑Centric, Not File‑Centric
The Execution Layer acts **only on the in‑memory AOG**.  
Files are never mutated or read during execution except at boot time.

Execution is the AOG updating itself via act‑operators.

This revision replaces the previous, ambiguous phrasing and anchors execution squarely in the stabilized vocabulary of **operators, realizers, runbooks, and typed graph actions**.

---
# 5. System Layer — The Interactive Physical Machine
A **System** is the only externally addressable computational entity. It is not a file, not a JSON document, not a runbook wrapper — it is a **living subgraph** of the Aperiodic Operator Graph (AOG), stabilized under a specific profile, discipline, and set of operators.

A System is the *operational boundary* through which external agents interact with the relational computer. Everything that happens inside a System is governed by act‑level operator semantics.

---
## 5.1 What Is a System?
A System is a **coherent operator‑environment** extracted from the AOG. It consists of:

### **(1) ProfileTopos — Internal Logic Space**
A `ProfileTopos` defines the System’s internal logic, including:
- profile recognitions,
- internal semantics (ProfileSemantics),
- exponentials, classifier, and finite limits,
- admissible internal morphisms.

This gives the System a *logical geometry*.

### **(2) PhaseSpace — Dynamic State Space**
`PhaseSpace` defines the System’s current state as shaped by:
- ProfileDynamics (FlowProfile),
- ProfileReach (reachable states),
- ProfileInvariant and PhaseSpace constraints.

This is the part of the AOG that **can evolve** under observation.

### **(3) MeasurementFrame — Observability Structure**
The MeasurementFrame defines how the System extracts information:
- RecognizeObservation, WitnessObservation,
- ProfileObserve, FixedObserve,
- ObservationKernel and FlowMeasureStep domains.

This determines *how an ObservationCarrier is interpreted*.

### **(4) Regime — Governing Constraints**
A Regime (filters/discipline) determines:
- which operators are active,
- which are suppressed,
- which invariants must always hold,
- which runbooks are permitted.

This is the System’s “physical law.”

### **(5) Trace — Evolutionary Memory**
A System maintains a `Trace` recording:
- sequential operator applications,
- observed events,
- reentry closures,
- stabilized time structure.

The trace ensures **temporal coherence**.

### **(6) FixedInvariants — Long‑Run Geometry**
The System continuously maintains a geometry of fixed invariants under:
- FixFlow,
- FixNucleus,
- FixFlowNucleus,
- Shuffle/Collapse,
- invariant‑lattice and invariant‑geometry acts.

This serves as the System’s **spectral backbone**.

### **(7) Allowed Operator Pipelines**
The System includes the operator pipelines (derived from runbooks) that are permitted under that System’s regime and semantics. These pipelines govern how the System updates its state.

> **A System is thus a total operator‑environment:** logic, dynamics, measurement, constraints, memory, and fixed geometry.

---
## 5.2 How External Interaction Works
External agents do **not** request objects or invoke specific operators.
They push **ObservationCarriers** into a System through the System API.

A System interprets every interaction through the canonical operator pipeline:
```
Observe
→ NucleateProfile
→ FlowProfile
→ FlowMeasureStep
→ NormalizeObservation
→ StabilizeObservation
→ FixFlowNucleus
→ return FixedInvariant
```
This pipeline is:
- **canonical** — directly induced by the acts,
- **closed** — callers cannot alter its structure,
- **aperiodic** — guaranteed to converge,
- **semantic** — produces meaningful recognitions, not arbitrary data.

Each interaction updates:
- the System’s PhaseSpace,
- the System’s Trace,
- possibly the System’s FixedInvariants,
- and returns a stabilized recognition.

> A System is not queried. It is **observed** and **perturbed**, and it returns its stabilized response.

---
## 5.3 Why Systems Exist
Systems provide:
- a **safe encapsulation** of operator semantics,
- a **stable portal** for external interaction,
- a **typed region** of the AOG with consistent geometry,
- a **governed environment** where invariants cannot be violated.

They are the correct computational abstraction because:
- Recognitions alone are too small.
- Profiles alone lack dynamics.
- PhaseSpace alone lacks observability.
- The AOG as a whole is too large and unconstrained.

A System is the *just-right* unit of interaction:  
a **slice of the hypertensor topos** with coherent semantics, state, measurement, and convergence.

---
## 5.4 Summary
A System is the only computational unit exposed to external callers.  
It is a living, operator‑stable subgraph of the AOG that:
- interprets ObservationCarriers,
- evolves via Flow–Nucleus dynamics,
- measures through its MeasurementFrame,
- updates its Trace and geometry,
- converges to FixedInvariants,
- and returns stabilized recognitions.

All interaction proceeds through Systems; all computation proceeds through operators; all structure is governed by acts.

---
# 6. API Surface — Interaction With the Living AOG. API Surface — Interaction With the Living AOG
The relational computer exposes **one** true computational interface. There is no longer a notion of an "admin API" or a split between two surfaces. All meaningful interaction occurs through a **single, principled boundary** between the external world and the living Aperiodic Operator Graph (AOG).

External callers do not access objects, runbooks, realizers, or files. They interact only with **Systems**, which are the operational universes carved out inside the AOG.

A System is the *only* externally addressable entity.

---
## 6.1 What Is a System in API Terms?
A **System** is a stabilized operator‑environment comprising:
- a `ProfileTopos` (the local internal logic),
- a `PhaseSpace` (the current dynamic state),
- a `MeasurementFrame` (how the System perceives inputs),
- a `Regime` (filters, disciplines, and constraints),
- a `Trace` (the record of evolution),
- a `FixedInvariants` geometry (the system's long‑run stable structure),
- a set of allowed operator pipelines (derived from runbooks + realizers).

Systems exist entirely **inside the AOG**. They are not files, they are not JSON documents, and they cannot be constructed or mutated directly by users.

A System is a *portal* into a region of the hypertensor topos.

---
## 6.2 The Only Real Operation: Interaction
All meaningful computation is initiated through a single operator pipeline, expressed programmatically as:

```
Observe
→ NucleateProfile
→ FlowProfile
→ FlowMeasureStep
→ NormalizeObservation
→ StabilizeObservation
→ FixFlowNucleus
→ return FixedInvariant
```

This pipeline is not a convention; it is the **mathematically canonical composite** induced by the acts. It guarantees:
- **aperiodic convergence** (Flow–Nucleus contractive behaviour),
- **semantic coherence** (Nucleus closure + normalization),
- **dynamic evolution** (FlowProfile and observation‑coupled flow),
- **trace‑correctness** (Trace acts),
- **geometric stabilization** (FixFlowNucleus → FixedInvariant).

This pipeline is the *only* action external callers may induce. Everything else is internal operator execution.

---
## 6.3 The Interaction Endpoint
```
POST /system/{system_id}/interact
```

### Request Body
```json
{
  "observation": { ... },
  "intent": { ... },             // optional (default, read_only, predict, invariants_only)
  "constraints": { ... },        // optional operator or regime constraints
  "trace_context": { ... }       // optional pointer into system's trace
}
```

#### ObservationCarrier
The `observation` field must be a valid **ObservationCarrier**, which is:
- a finite external recognition that
- can be interpreted under `RecognizeObservation`, `SeedObservation`, and `ProfileObserve`, and
- fits within the System's `MeasurementFrame`.

This is the *only* way information enters the AOG.

---
## 6.4 Internal Execution (What Happens Inside the AOG)
The System:
1. **Interprets** the carrier using `Observe` / `ProfileObserve`.
2. **Closes** the interpretation using `NucleateProfile`.
3. **Evolves** its PhaseSpace using `FlowProfile`.
4. **Measures** the new state via `FlowMeasureStep`.
5. **Normalizes** observations (`NormalizeObservation`, equivalence closure).
6. **Records** into its Trace (`AdvanceTrace`, `TraceReentryClosure`).
7. **Stabilizes** the combined Flow–Nucleus system via `FixFlowNucleus`.

The result is a **FixedInvariant** — the stabilized recognition reflecting the System’s updated state.

---
## 6.5 Response Body
```json
{
  "fixed_invariant": { ... },
  "updated_trace": { ... },
  "updated_phase_space": { ... },
  "updated_fixed_invariants": { ... },
  "operator_diagnostics": {
      "flow_nucleus_commutation": "ok | lax-ok | violated",
      "operators_used": [ ... ],
      "spectral_effects": { ... }
  }
}
```

This is **not** a CRUD response — it is the stabilized physical‑semantic response of a living operator system to an injected observation.

---
## 6.6 Interaction Modes (Optional Intents)
A System may offer multiple interaction modes, each implemented as a different operator pipeline:
- `default` — full state update + trace update.
- `read_only` — run the pipeline on a cloned PhaseSpace.
- `predict` — evaluate flow and kernel operators without committing.
- `invariants_only` — compute FixedInvariants without revealing PhaseSpace.

These are all variants of the same canonical pipeline, differing only in which intermediate results are committed.

---
## 6.7 Why This API Model Is Correct
This design:
- keeps the **AOG sealed**, ensuring safety and internal consistency;
- reflects the **true semantics of the acts**, where the only admissible external action is `Observe`;
- prevents users from corrupting recognitions or profiles by bypassing operators;
- provides a principled, physical‑semantic interface rather than a data‑centric one;
- matches the intuition that a System is a **computational physics** environment, not a database.

The API exposes the relational computer as a **world that can be observed**, not a filesystem that can be manipulated.

---
# 7. Boot Sequence — Awakening the AOG
When the relational computer starts, it does not merely “load files.” It **awakens** as an active Aperiodic Operator Graph (AOG) by reconstructing its operator structure from the cold persistent substrate.

The boot process unfolds in five distinct phases, each mirroring an act‑level transformation.

---
## **7.1 Load Cold Artifacts Into Memory (Recognition Carriers Only)**
The filesystem is scanned for:
- JSON objects (recognition-carriers),
- runbook definitions (morphic templates),
- realizer metadata (operator kernels).

Artifacts are validated against schemas but remain **inactive**. They are the raw ingredients of the AOG, not the AOG itself.

---
## **7.2 Construct the AOG Skeleton (Nodes & Typed Edges)**
From the cold artifacts, the computer constructs the **skeleton of the AOG**:
- **nodes** → object instances (RecognitionLattice, PhaseSpace, ProfileTopos, Trace, etc.)
- **typed edges** → operator roles derived from runbooks and act metadata

This defines the **static topology** of the hypertensor topos before any dynamics occur.

---
## **7.3 Activate Operators & Establish Aperiodic Semantics**
After the skeleton is built, the runtime:
1. attaches Python realizer functions to operator edges,
2. binds invariants and commutation constraints to each operator,
3. configures operator‑interaction rules:
   - Flow ∘ Nucleus → aperiodic commutation,
   - FlowMeasure coupling with Trace,
   - Shuffle equivalence and collapse,
   - Laplacian/Heat/Wave operator domains,
   - spectral tags for modes and invariants.

At this stage the AOG becomes **live**: an operator algebra capable of evolution.

---
## **7.4 Instantiate Systems (Living Subgraphs)**
A **System** is formed by extracting a coherent operational region of the AOG:
- a ProfileTopos for internal logic,
- a PhaseSpace defining state,
- a MeasurementFrame defining observability,
- a Regime defining constraints,
- a Trace capturing evolution,
- a FixedInvariants geometry capturing long‑run structure,
- a set of allowed operator pipelines.

Each System becomes a **first‑class living environment** to which external agents may submit observations.

---
## **7.5 Begin Serving the System API**
Only after Systems exist does the machine expose:
```
POST /system/{id}/interact
```
At this point:
- external observations may be injected,
- Systems process them through the canonical aperiodic pipeline,
- the AOG evolves accordingly,
- convergence is guaranteed by the operator algebra,
- stabilized recognitions (FixedInvariants) are returned.

The relational computer is now fully awake as a **spectral, convergent operator system**.

---
# 8. Development Roadmap — Tooling, Standards, and Deterministic Build Path
This roadmap specifies **exact tools, libraries, and conventions** to ensure deterministic, reproducible development of the relational computer. Each phase now includes concrete technology choices that align with the architecture of the Aperiodic Operator Graph (AOG).

This is no longer a conceptual roadmap — it is a **build specification**.

---
## 8.1 Phase I — Persistent Substrate & Schema Foundation
**Goal:** Establish the cold-storage substrate with strict typing.

### Tools & Standards
- **JSON Schema 2020-12** — canonical typing for objects and realizers.
- **PyYAML (safe_load)** — for runbook YAML parsing.
- **jsonschema** — for validating objects and realizer metadata.
- **orjson** — fast, deterministic JSON serialization.
- **Directory Conventions:**
  - `objects/` — JSON recognition-carriers.
  - `runbooks/` — YAML morphic templates.
  - `realizers/` — JSON metadata for operator kernels.
  - `realizers/py/` — Python implementations.
  - `schemas/` — JSON Schema definitions.

### Deliverables
- `object.schema.json`
- `runbook.schema.yaml`
- `realizer.schema.json`
- minimal test artifacts (toy ProfileTopos, PhaseSpace, MeasurementFrame).

**Determinism guarantee:** schema validation ensures zero ambiguity in cold artifacts.

---
## 8.2 Phase II — AOG Skeleton (RelationalGraph Structure)
**Goal:** Use selected graph libraries to construct a typed operator graph in memory.

### Tools
- **networkx** for initial AOG representation:
  - supports node/edge attributes,
  - allows multigraphs with typed edges,
  - easy for rapid development.

(We plan a later migration to a custom AOG implementation once semantics stabilize.)

### Deliverables
- `RelationalGraph` Python class with:
  - typed nodes (object-kind tags),
  - typed edges (operator-name tags),
  - metadata hooks for spectral tags/invariants.
- Loader that scans filesystem and builds the cold AOG skeleton.

**Determinism guarantee:** networkx gives predictable topology and graph semantics.

---
## 8.3 Phase III — Operator Binding & Execution Engine
**Goal:** Bind runbooks and realizers into executable act-level operators.

### Tools
- **Python 3.12+** — structural pattern matching, faster interpreter.
- **importlib** — dynamic realizer loading.
- **functools.lru_cache** — memoization for fixed-point convergence.
- **pydantic v2** — typed configuration objects for runbook steps and operator metadata.

### Deliverables
- Realizer registry mapping act → Python callable.
- Execution engine that:
  - enforces input/output kinds,
  - applies realizers to nodes,
  - inserts new nodes & edges into the AOG,
  - checks invariants,
  - performs FixFlow/FixNucleus with guaranteed aperiodic convergence.
- Trace engine implementing all Trace acts: StartTrace → StabilizeTrace.

**Determinism guarantee:** operators are pure, typed, convergent; cacheable scheduling ensures consistent outputs.

---
## 8.4 Phase IV — System Construction
**Goal:** Define Systems as first-class operator environments.

### Tools
- **pydantic v2** for System configuration.
- **networkx subgraphs** to extract System regions.

### Deliverables
- `system.schema.json` defining:
  - ProfileTopos reference,
  - PhaseSpace reference,
  - MeasurementFrame reference,
  - Regime (discipline/filter structure),
  - allowed operator pipelines.
- System instantiation logic:
  - extract node sets from AOG,
  - create in-memory System object,
  - initialize Trace and FixedInvariants.

**Determinism guarantee:** Systems derive entirely from typed AOG subgraphs.

---
## 8.5 Phase V — System API (Observation Pipeline)
**Goal:** Implement the canonical interaction pipeline.

### Tools
- **FastAPI** — async-first, integrates with pydantic & OpenAPI.
- **OpenAPI** — generates machine-readable API specification for Systems.

### Deliverables
- `observation-carrier.schema.json`.
- `/system/{id}/interact` endpoint using pydantic models.
- Implementation of canonical pipeline:
```
Observe
→ NucleateProfile
→ FlowProfile
→ FlowMeasureStep
→ NormalizeObservation
→ StabilizeObservation
→ FixFlowNucleus
→ return FixedInvariant
```
- Response builder with:
  - FixedInvariant,
  - updated Trace,
  - updated PhaseSpace,
  - operator diagnostics.

**Determinism guarantee:** single operator pipeline; zero branching; guaranteed convergence.

---
## 8.6 Phase VI — Spectral & Geometric Operator Layer
**Goal:** Add analytic operators for self-measurement.

### Tools
- **NumPy** + **SciPy** — eigen decomposition, Laplacians, kernels.
- (Optional) **JAX** for GPU-accelerated spectral ops.

### Deliverables
- Implementation of ObservationKernel, TransitionLaw, FixedKernel.
- Laplacian, HeatKernel, WaveOperator realization.
- Spectral analysis:
  - HarmonicMode,
  - HarmonicBasis,
  - SpectrumMap,
  - Spectrum.
- Inspection tools for spectral structure.

**Determinism guarantee:** scipy eigen solvers provide stable numeric results given stable matrices.

---
## 8.7 Phase VII — Tooling, Visualization, & Multi-Agent Support
**Goal:** Make the relational computer usable and debuggable.

### Tools
- **graphviz** — structural visualization of AOG.
- **pyvis** or **d3.js** — interactive displays.
- **typer** — CLI for managing objects, Systems, operators.
- **rich** — developer-friendly console reporting.
- **pytest** — operator-level and convergence testing.

### Deliverables
- Visualization tools for Systems, traces, spectral modes.
- Distributed/multi-agent usage patterns.
- Debugging harnesses for operator stability.

**Determinism guarantee:** deterministic CLI/UI tooling ensures reproducible views of the AOG.

---
# 9. Concluding Notes. Concluding Notes. Concluding Notes
This README is the top-level blueprint for the relational computer.  
Future contributors will be able to reconstruct the entire machine’s design solely from:

- the **acts** document, and
- this **README**.

