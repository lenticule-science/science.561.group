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

- [`RelationalState` (`Section`)](./quasicrystalline-hypertensor-sheaf-section.md) – global sheaf section; snapshots/recognitions are views of it.
- [`EvaluationState`](./evaluation-state.md) – machine evaluation context/state.
- [`RecognitionCarrier`](./recognition-carrier.md) – earned recognitions at machine layer.
- [`Snapshot`](./snapshot.md) – machine snapshot identifiers/contents.
- [`WiringPlan`](./wiring-plan.md) – machine execution topology.
- [`FailureCarrier`](./failure-carrier.md) – typed failures emitted by machine operators.

## Kernel state

Machine state is the product of the carriers above:

```
KernelState :=
  ( state  : [RelationalState](./quasicrystalline-hypertensor-sheaf-section.md),
    eval   : [EvaluationState](./evaluation-state.md),
    recs   : [RecognitionCarrier](./recognition-carrier.md)*,
    snaps  : [Snapshots](./snapshot.md),
    wiring : [WiringPlan](./wiring-plan.md) )
```

No new primitives are introduced beyond these carriers.

## Kernel operators

- [`Recognition`](./recognition.md) – yields a machine recognition or [`FailureCarrier`](./failure-carrier.md).
- [`Evaluation step`](./evaluate-step.md) – advances eval state or yields [`FailureCarrier`](./failure-carrier.md).
- [`Storage`](./storage.md) – saves/loads snapshots or yields [`FailureCarrier`](./failure-carrier.md).
- [`Wiring`](./wiring.md) – builds wiring plan or yields [`FailureCarrier`](./failure-carrier.md).

For machine ISA reference, see:
- [Acts index](docs/math/acts/index.md) – earned instructions.
- [System operators](./interface-validate.md), [task precedence](./task-precedence.md), [distribution](./distribution-route.md), [wiring](./connection-graph.md) – upstream definitions each machine operator refines.


## Proof

Sketch: Each carrier is earned at machine layer (via system refinement). The kernel is their same-layer composition. Operators refine their system parents over these carriers, producing machine results or [`FailureCarrier`](./failure-carrier.md). Formal proof must show invariant preservation and agreement with system semantics under these refinements.

  ```text
  compatible       : [Port](./interface-port.md) × [Port](./interface-port.md) → bool
  connect          : [Port](./interface-port.md) × [Port](./interface-port.md) ⇀ Connection
  validate_runbook : [Runbook](./wiring-plan.md) → bool
  plan_execution   : [Runbook](./wiring-plan.md) → list[[Step](./task-carrier.md)]
  ```

  implementing the wiring structure and runbook planning used by the runtime.

## 2.1 Instruction set and program form

- **Instruction set (acts).**
  The ISA of the kernel is exactly the earned acts catalogued in
  [docs/math/acts/index.md](./acts.md). Each act is a unary or
  multi-ary operator over finite carriers (windows, fibres, towers, sections,
  recognitions, traces, contexts) and is earned by its `top`/`bottom`
  witnesses; no other instructions exist.

- **Program form (runbooks).**
  A program is a finite directed acyclic graph over these acts as defined in
  **Specification (Wiring)**:

  ```text
  Program := [WiringPlan](./wiring-plan.md) = ([Steps](./task-carrier.md), [Ports](./interface-port.md), Connections)
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
