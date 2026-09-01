---
title: Intake Structure Simulation
keywords:
  - simulation
  - intake
  - interface
layer: spec
status: plan
depends_on:
  - math/structure/intake-payload
  - math/structure/intake-observation
  - math/structure/intake-context
  - math/operator/intake-normalise
---

This specification instantiates the **Intake Structure**: it provides a
concrete pipeline for normalising, validating, and contextualising incoming
payloads into recognised, measured observations before they enter the
relational computer.

## State representation

- **Schema registry recognitions.**  
  Recognition carriers that enumerate admissible payload types, bindings, and
  normalisation procedures for each interface. These recognitions live inside
  the global relational state; there is no auxiliary registry store.

- **Validation stages as acts.**  
  Ordered discipline/policy filters that align with the intake acts (seed,
  recognise, transport). The ordering is recorded as recognitions in the state
  so evaluation can replay the same sequence.

- **Context seeding trace.**  
  Recognition carriers that record which contexts were seeded (seed first
  context, renew) when admitting a stream. These reuse the trace
  infrastructure; no separate tracker exists.

## Inputs

1. Raw payloads from external clients or partner systems.
2. Policy annotations describing which disciplines/filters apply.
3. Measurement schemas indicating how observables should be wrapped.

## Procedures

1. **Normalisation.**  
   Parse payloads, bind names, and transport them into canonical syntax per the
   intake structure, producing observation recognitions backed by the schema
   registry recognitions.

2. **Validation.**  
   Run policy/discipline filters in the recorded order, including recognition
   checks and context seeding, rejecting payloads that fail.

3. **Context seeding.**  
   For accepted payloads, apply the context acts (seed first context, renew as
   needed) and record the resulting recognitions so downstream runtime
   components can consume the same context.

4. **Emission.**  
   Forward normalised observations as recognitions into the distribution
   structure with metadata referencing schemas and policy decisions; nothing is
   buffered outside the relational state.

## Invariants

- Every payload references a registered schema recognition; unregistered data is
  rejected.
- Policy filters are applied in the recorded order; missing filters block the
  intake.
- Context seeding acts are executed and recorded before downstream execution.

## Outputs

- Normalised observation recognitions ready for routing.
- Audit recognitions describing policy decisions and schema versions.
- Measurement recognitions (e.g., acceptance rates) for the measurement fabric.
