---
title: Interface Simulation
keywords:
  - simulation
  - interface
depends-on:
  - system/structure/interface-port
  - system/operator/interface-validate
  - system/operator/interface-present
description: Gives an implementation plan for the interface stack (APIs exposing the relational calculus).
---

Gives an implementation plan for the interface stack (APIs exposing the relational calculus).

## State representation

- **Endpoint registry.**
  Catalog of APIs, each mapped to intake/policy rules. Registry entries are
  recognitions inside the global `RelationalState := Section`; this spec does
  not introduce a separate API store.

- **Request context.**
  Wraps incoming requests with metadata (auth, module target, etc.). Request
  contexts are transient carriers used while handling a call; any persistent
  effects are expressed as changes to `RelationalState` via acts and runbooks,
  not by mutating an interface-specific state.

## Inputs

1. External requests (e.g., data ingestion, execution commands).
2. Policy definitions.
3. Intake/measurement handlers.

## Procedures

1. **Authenticate/authorize.**
   Apply policy stack rules to ensure caller is allowed.
2. **Normalize input.**
   Run intake stack to convert payloads into observations.
3. **Dispatch.**
   Route to appropriate module via distribution stack.
4. **Respond.**
   Use measurement stack to format outputs (observables, metrics).

## Invariants

- Every request must pass intake validation and policy checks before dispatch.
- Responses are well-formed observables recognised by the measurement stack.

## Outputs

- API responses.
- Audit recognitions for each request, including policy decisions.
