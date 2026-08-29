---
title: Persistence Simulation
keywords:
  - simulation
  - persistence
  - context
  - recognition
layer: spec
status: plan
depends_on:
  - math/structure/persistent-context-carrier
  - math/structure/persistent-recognition-carrier
  - math/operator/save-persistent-context
  - math/operator/load-persistent-context
  - math/structure/baseline-remainder
---
# Persistence Simulation

This specification instantiates the **Persistence Structure** earned by the
context, baseline, fixed-invariant, and reachability acts. It fixes concrete
carriers and operators for saving and loading contexts and recognitions
without changing their relational meaning.

## 1. Types

- **Persistent context (`PersistentContextCarrier`).**
  A carrier for contexts in the earned `PersistentContextCarrier`. It must:
  - represent all bindings and trace information required to interpret the
    context, and
  - be compatible with the baseline and renewal mechanics.

- **Persistent recognition (`PersistentRecognitionCarrier`).**
  A carrier for recognitions in the `PersistentRecognitionCarrier` component:
  - they correspond exactly to recognitions fixed by the flow/nucleus stack
    and marked as invariants suitable for storage in the relational state.

- **Baseline remainder (`BaselineRemainder`).**
  A carrier for the baseline tail identified by the baseline limit acts:
  - stable under renewal and re-entry into traces.
  The remainder is a finite trace slice, not an external log.

## 2. Functions

Implementations must provide operators corresponding to the persistence
structure:

- **Context save.**

  ```text
  save_context : Context → (PersistentContextCarrier, BaselineRemainder, PersistentRecognitionCarrier)
  ```

  - takes an earned runtime context,
  - extracts the baseline remainder using the baseline mechanics,
  - produces a `PersistentContextCarrier` value plus its associated
    `BaselineRemainder` and eligible `PersistentRecognitionCarrier` items.

- **Context load.**

  ```text
  load_context : (PersistentContextCarrier, BaselineRemainder, PersistentRecognitionCarrier) → Context
  ```

  - reconstructs a runtime context from a persisted one,
  - rethreads the baseline remainder into the trace,
  - yields a context whose trace interpretation matches the original.

- **Recognition eligibility.**

  ```text
  mark_persistent : Recognition → PersistentRecognitionCarrier?
  ```

  - returns a `PersistentRecognition` exactly when the recognition satisfies
    the fixed-invariant conditions (flow/nucleus fixed, reachability),
  - otherwise indicates that the recognition is not eligible for storage.

## 3. Invariants

The following invariants must hold:

- **Context round-trip.**
  For any earned context `C`, if `save_context(C) = (PC, B)` and
  `C' = load_context(PC, B)`, then `C'` has the same trace interpretation as
  `C` (up to the earned equivalences in the persistence theorem).

- **Baseline stability.**
  The `BaselineRemainder` component is stable under renewal: reloaded contexts
  that re-enter the trace share the same baseline limit.

- **Recognition reachability.**
  Any `PersistentRecognition` remains reachable whenever its associated
  context is reloaded, as guaranteed by the `Reach` component of the
  persistence theorem.

These carriers and operators provide the bridge between runtime contexts and
the storage layer; the relational storage specification builds on them to
define snapshot semantics.
