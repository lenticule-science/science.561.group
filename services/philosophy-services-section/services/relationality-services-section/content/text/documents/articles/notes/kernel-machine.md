---
title: Kernel Relational Machine
keywords:
  - specification
  - kernel
  - machine
layer: spec
status: plan
depends_on:
  - theorem/internal/universal-state-hypertensor
  - theorem/internal/evaluation-engine
  - theorem/internal/relational-storage
  - theorem/internal/persistence-stack
  - theorem/internal/recognition-carrier-structure
  - theorem/internal/recognition-operator
  - theorem/internal/module-wiring
  - specifications/judgment-calculus
  - specifications/recognition-carrier
  - specifications/recognition-endpoint
  - specifications/storage
  - specifications/persistence
  - specifications/wiring
---

This specification assembles the core structures and operators of the
relational computer into a single **kernel machine**: the minimal state and
instruction set that any implementation must realise. The kernel does not
introduce any new notion of “state” beyond what is earned by the acts and
internal theorems; it packages those objects into a single machine model.

## 0. Kernel carriers

We fix the following canonical carriers for the rest of this spec.

- **Relational state (`RelationalState`).**
  The global relational state is a section of the quasicrystalline
  hypertensor sheaf:

  ```text
  RelationalState := Section
  ```

  where `Section` and its companions (`Window`, `Fiber`, `Tower`, `restrict`,
  `glue`) are as in **Specification (Quasicrystalline Hypertensor Sheaf
  Simulation)** and the universal‑state theorems. All persistent state lives
  in `RelationalState`; snapshots and recognitions are summaries or views of
  it, not independent stores.

- **Evaluation state (`EvalState`).**
  A state of the evaluation engine:

  ```text
  EvalState ⊆ Frame × Term
  ```

  where `Frame` and `Term` come from the judgment calculus and evaluation
  engine structures. `EvalState` is purely syntactic; it does not mutate
  `RelationalState` on its own.

- **Recognition carriers (`RecognitionCarrier`).**
  Points in the recognition‑carrier structure:

  ```text
  RecognitionCarrier = (state   : RelationalState,
                        carrier : Carrier,
                        trace   : Trace,
                        policy  : PolicySnapshot)
  ```

  where `Carrier`, `Trace`, and `PolicySnapshot` are the concrete types from
  **Specification (Recognition Carrier)**. `trace` is a finite, replayable
  sequence of admissible derivation steps; `policy` snapshots the active
  discipline/filter/regime state at recognition time.

- **Snapshots (`SnapId`, `SnapContent`).**
  Snapshot identifiers and contents from **Specification (Relational Storage
  Simulation)**:

  ```text
  SnapContent = (obs      : Observations,
                 baseline : BaselineRemainder,
                 fixed    : FixedInvariants)
  ```

  as in the relational‑storage and persistence theorems. Each snapshot
  summarises some `RelationalState`.

## 1. Kernel state

The kernel state consists of:

- **Global state (`Section`).**
  The global relational state, equal to `RelationalState`:
  a section of the quasicrystalline hypertensor sheaf as in
  **Specification (Quasicrystalline Hypertensor Sheaf Simulation)**:
  - carriers `Window`, `Fiber`, `Tower`, and `Section`,
  - restriction and gluing operators.

- **Evaluation state (`EvalState`).**
  A state of the evaluation engine (`EvalState ⊆ Frame × Term`) as above.

- **Recognition carriers (`RecCar`).**
  A (possibly finite) collection of `RecognitionCarrier` values witnessing
  earned recognitions of the current `RelationalState`.

- **Snapshots (`SnapId`, `SnapContent`).**
  A table of snapshot identifiers and contents:

  ```text
  Snapshots : SnapId ↦ SnapContent
  ```

  as in the storage and persistence specifications.

## 2. Kernel operators

The kernel exposes the following families of operators.

- **Evaluation.**

  ```text
  step : EvalState ⇀ EvalState
  norm : EvalState ⇀ EvalState
  ```

  implementing the evaluation engine structure over the judgment calculus
  carriers. These operators act only on `EvalState`; any change to
  `RelationalState` must arise from earned relational acts wired via
  runbooks.

- **Recognition.**

  For each criterion `ϕ` and policy `π`:

  ```text
  Rec_{ϕ,π} : RelationalState ⇀ RecognitionCarrier
  ```

  satisfying the recognition-operator theorems (soundness, idempotence,
  policy monotonicity, compositionality).

- **Storage and persistence.**

  ```text
  save : RelationalState → SnapContent × SnapId
  load : SnapId ⇀ RelationalState
  save_context : Context → PersistentContext × BaselineRemainder
  load_context : PersistentContext × BaselineRemainder → Context
  ```

  implementing the relational storage and persistence structures.

- **Wiring and runbooks.**

  ```text
  compatible      : Port × Port → bool
  connect         : Port × Port ⇀ Connection
  validate_runbook : Runbook → bool
  plan_execution   : Runbook → list[Step]
  ```

  implementing the wiring structure and runbook planning used by the runtime.

## 3. Kernel invariants

Any implementation claiming to realise the kernel machine must uphold:

- **Sheaf invariants.**
  Sections, restriction, and gluing obey the hypertensor sheaf axioms.

- **Evaluation invariants.**
  Subject reduction, progress, and normalisation for the earned fragment as
  given by the judgment calculus and evaluation engine theorems.

- **Recognition invariants.**
  Recognition carriers and operators satisfy the recognition-carrier and
  recognition-operator theorems.

- **Storage/persistence invariants.**
  Snapshots and persistent contexts round-trip (up to earned equivalences)
  under `save/load` and `save_context/load_context`.

- **Wiring invariants.**
  All connections and runbooks respect the wiring structure, and execution
  plans respect dependency order.

This kernel specification is the target for architecture: all runtime,
ingestion, storage, and analytics components must be realisations of this
machine, not independent systems.
