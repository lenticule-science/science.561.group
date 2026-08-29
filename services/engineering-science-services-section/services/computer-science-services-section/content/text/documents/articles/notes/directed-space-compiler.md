---
title: "Directed Space compiler"
aliases:
  - "Directed Space compiler"
  - "directed space compiler"
keywords:
  - architecture
  - topology
depends_on:
  - specifications/directed-homotopy
  - specifications/directed-stratified-site
  - specifications/topology-integration
  - specifications/measurement-fabric
  - specifications/traceability-graph
---
# Directed Space Compiler Architecture

Generates the directed spaces, flows, and stratified sites consumed by runtime,
analytics, and reasoning modules.

## Dependencies

- **Directed Homotopy Simulation**: supplies flow/nucleus mechanics and tower
  coherence checks for oriented paths.
- **Directed Stratified Site Simulation**: provides strata definitions, coverage,
  and tower templates for each module family.
- **Topology Integration Simulation**: consumes compiled artifacts; this service
  validates that emitted bundles satisfy the integration rules.
- **Measurement Fabric Simulation**: exports compiler diagnostics (coherence
  checks, coverage errors) for monitoring/policy use.
- **Traceability & Knowledge Service**: records which acts/specs justify each
  published topology bundle.

## Components

1. **Strata Registry.**
   Materializes the strata catalog with their discipline/filter settings and
   exposes APIs to register new module strata.

2. **Coverage Builder.**
   Evaluates discipline/filter rules to compute coverage families, ensuring they
   are stable under directed morphisms before publishing them to consumers.

3. **Homotopy Engine.**
   Maintains the directed flow/nucleus operators, computes reachable components,
   and records tower coherence diagnostics.

4. **Export Layer.**
   Emits compiled site bundles (objects, morphisms, towers) for the sheaf
  /infinity-site modules and for runtime scheduling constraints, tagging each
   export with traceability IDs and publishing health metrics via the measurement
   fabric.

## Invariants

- Flow and nucleus must commute for every published stratum.
- Coverage families remain closed under pullback and composition.
- Tower projections agree with underlying strata definitions and are traceable to
  the underlying acts/specs.
