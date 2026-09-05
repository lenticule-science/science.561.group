---
title: Relational Machine Kernel
kind: structure
keywords:
  - kernel
  - machine
layer: machine
status: plan
uses:
  - machine/structure/evaluation-state
  - machine/structure/recognition-carrier
  - machine/structure/snapshot
  - machine/structure/wiring-plan
  - machine/structure/failure-carrier
produces: []
---

This specification assembles the core structures and operators of the
relational computer into a single **Relational Machine Kernel**: the minimal
state and instruction set that any implementation must realise. The kernel does not
introduce any new notion of “state” beyond what is earned by the acts and
internal theorems; it packages those objects into a single machine model.

## Kernel carriers (machine layer)

- [`RelationalState` (`Section`)](docs/calculus/structure/quasicrystalline-hypertensor-sheaf-section.md) – global sheaf section; snapshots/recognitions are views of it.
- [`EvaluationState`](docs/machine/structure/evaluation-state.md) – machine evaluation context/state.
- [`RecognitionCarrier`](docs/machine/structure/recognition-carrier.md) – earned recognitions at machine layer.
- [`Snapshot`](docs/machine/structure/snapshot.md) – machine snapshot identifiers/contents.
- [`WiringPlan`](docs/machine/structure/wiring-plan.md) – machine execution topology.
- [`FailureCarrier`](docs/machine/structure/failure-carrier.md) – typed failures emitted by machine operators.

## Kernel state

Machine state is the product of the carriers above:

```
KernelState :=
  ( state  : [RelationalState](docs/calculus/structure/quasicrystalline-hypertensor-sheaf-section.md),
    eval   : [EvaluationState](docs/machine/structure/evaluation-state.md),
    recs   : [RecognitionCarrier](docs/machine/structure/recognition-carrier.md)*,
    snaps  : [Snapshots](docs/machine/structure/snapshot.md),
    wiring : [WiringPlan](docs/machine/structure/wiring-plan.md) )
```

No new primitives are introduced beyond these carriers.

## Kernel operators

- [`Recognition`](docs/machine/operator/recognition.md) – yields a machine recognition or [`FailureCarrier`](docs/machine/structure/failure-carrier.md).
- [`Evaluation step`](docs/machine/operator/evaluate-step.md) – advances eval state or yields [`FailureCarrier`](docs/machine/structure/failure-carrier.md).
- [`Storage`](docs/machine/operator/storage.md) – saves/loads snapshots or yields [`FailureCarrier`](docs/machine/structure/failure-carrier.md).
- [`Wiring`](docs/machine/operator/wiring.md) – builds wiring plan or yields [`FailureCarrier`](docs/machine/structure/failure-carrier.md).

For machine ISA reference, see:
- [Acts index](docs/math/acts/index.md) – earned instructions.
- [System operators](docs/system/operator/interface-validate.md), [task precedence](docs/system/operator/task-precedence.md), [distribution](docs/system/operator/distribution-route.md), [wiring](docs/system/structure/connection-graph.md) – upstream definitions each machine operator refines.


## Proof

Sketch: Each carrier is earned at machine layer (via system refinement). The kernel is their same-layer composition. Operators refine their system parents over these carriers, producing machine results or [`FailureCarrier`](docs/machine/structure/failure-carrier.md). Formal proof must show invariant preservation and agreement with system semantics under these refinements.

  ```text
  compatible       : [Port](docs/system/structure/interface-port.md) × [Port](docs/system/structure/interface-port.md) → bool
  connect          : [Port](docs/system/structure/interface-port.md) × [Port](docs/system/structure/interface-port.md) ⇀ Connection
  validate_runbook : [Runbook](docs/machine/structure/wiring-plan.md) → bool
  plan_execution   : [Runbook](docs/machine/structure/wiring-plan.md) → list[[Step](docs/system/structure/task-carrier.md)]
  ```

  implementing the wiring structure and runbook planning used by the runtime.

## 2.1 Instruction set and program form

- **Instruction set (acts).**  
  The ISA of the kernel is exactly the earned acts catalogued in
  [docs/math/acts/index.md](../../math/acts/index.md). Each act is a unary or
  multi-ary operator over finite carriers (windows, fibres, towers, sections,
  recognitions, traces, contexts) and is earned by its `top`/`bottom`
  witnesses; no other instructions exist.

- **Program form (runbooks).**  
  A program is a finite directed acyclic graph over these acts as defined in
  **Specification (Wiring)**:

  ```text
  Program := [WiringPlan](docs/machine/structure/wiring-plan.md) = ([Steps](docs/system/structure/task-carrier.md), [Ports](docs/system/structure/interface-port.md), Connections)
  ```

  where each `Step` names exactly one act (or a small set of acts when earned),
  declares its input/output ports, and `Connections` wire outputs to inputs
  subject to `compatible`. Execution order is given by the acyclic dependency
  partial order; there is no hidden orchestration outside the wiring plan.

The Relational Machine Kernel therefore consists of the sheaf-section state,
the earned operators (acts) as its ISA, and runbooks as its program
representation.

## 3. Kernel invariants

Any implementation claiming to realise the Relational Machine Kernel must uphold:

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
