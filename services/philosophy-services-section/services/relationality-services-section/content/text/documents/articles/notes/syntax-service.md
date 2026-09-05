---
title: Syntax Formation & Quotient Service
keywords:
  - architecture
  - syntax
depends_on:
  - theorem/internal/judgment-calculus-structure
  - theorem/internal/reduction-normalization-structure
  - specifications/relational-free-quotient
  - specifications/judgment-calculus
  - specifications/measurement-fabric
  - specifications/topology-integration
  - specifications/traceability-graph
---
# Syntax Formation & Quotient Service Architecture

Creates free syntactic structures for modules (types, terms, modalities) and
applies quotient relations derived from earned invariances.

## Dependencies

- **Free and Quotient Act Simulation**: describes formation, reduction, and
  congruence maintenance for algebraic structures.
- **Judgment Calculus Simulation**: supplies internal typing and evaluation
  rules for syntax trees.
- **Measurement Fabric Simulation**: emits telemetry about syntax formation
  throughput/errors.
- **Topology Integration Simulation**: ensures generated modules/operators are
  annotated with proper strata/tower placement.
- **Traceability & Knowledge Service**: records which acts/specs justify each syntax
  element and quotient.

## Components

1. **Formation Engine.**
   Generates syntax trees for requested constructs (terms, modalities, profile
   operators) and records their derivation histories.

2. **Reduction Service.**
   Normalizes trees using the simply-typed lambda calculus and free-act reduction rules; stores normal
   forms and trace evidence.

3. **Invariance Registry.**
   Evaluates predicates representing earned invariances, merges equivalent normal
   forms, and emits quotient representatives.

4. **API, Audit & Telemetry Hooks.**
   Provides requests for new syntax, exposes provenance (traceability IDs),
   integrates with policy/audit modules to avoid unauthorized mutations, and
   publishes telemetry via the measurement fabric.

## Invariants

- Reductions terminate and produce canonical results consistent with specs.
- Quotient classes remain closed under all registered formation operations.
- Downstream modules can trace every syntax element back to the acts that earned
  it.

## Realisation in the implementation

The syntax service is realised as a thin shell over the relational instruction
set, internal theorems, and specifications.

- **Acts (syntax and reduction).**
  Syntax formation and reduction never bypass acts in `docs/math/acts/`. Acts
  such as `recognize-syntax`, `normalize-syntax`, `sound-syntax`,
  `reduce`, and the judgement calculus acts are each implemented as a single
  handler in `app/rewriter/acts/`. These handlers operate only on finite
  carriers (Pydantic representations of syntax trees and contexts).

- **Internal theorems (judgment calculus and normalization).**
  Internal theorems like `judgment-calculus-structure` and
  `reduction-normalization-structure` define:
  - the structure of syntax/state (contexts, terms, judgements),
  - admissible reduction operators,
  - and normalization and canonicity results.
  The service must implement formation and quotienting as instantiations of
  these structures and operators; new behaviours require new internal theorems.

- **Specifications (types and functions).**
  The free-and-quotient specification and simply-typed lambda simulation define
  the concrete types and functions used by the service. In code, these are
  realised as Pydantic types in `app/schemas/` and pure functions in
  `app/rewriter/measurement_algebra.py` and related modules.

- **Runbooks (wiring).**
  Multi-step syntax workflows (for example, “form syntax, normalize, apply
  quotients, and emit a report”) are expressed only as YAML runbooks under
  `runbooks/library/` and invoked by the runtime. The syntax service does not
  embed ad hoc orchestration logic; it selects and executes runbooks via the
  rewriter engine.

- **Service shell.**
  The API layer exposes endpoints that:
  - accept syntax requests in external formats,
  - coerce them into the Pydantic carriers defined by specs,
  - launch the appropriate runbooks,
  - and return recognitions, normal forms, and quotient representatives with
    full traceability.

These constraints ensure that syntax formation and quotienting remain faithful
to the earned structures and operators and cannot drift into hand-written,
non-relational behaviour.
