---
title: "Relational client SDK"
aliases:
  - "Relational client SDK"
  - "relational client sdk"
keywords:
  - architecture
  - client
depends-on:
  - specifications/interface
  - specifications/measurement-algebra
  - specifications/policy
  - specifications/measurement-fabric
  - specifications/traceability-graph
  - specifications/topology-integration
description: This SDK lets external applications interact with the relational computer, wrapping the interface/policy/measurement semantics.
---
# Relational Client SDK Architecture

This SDK lets external applications interact with the relational computer,
wrapping the interface/policy/measurement semantics.

## Dependencies

- **Interface Simulation**: defines API endpoints and normalization.
- **Measurement Algebra Simulation**: helps clients interpret returned observables.
- **Policy Simulation**: ensures requests include proper credentials/scopes.
- **Measurement Fabric Simulation**: standardizes telemetry (latency, error
  rates) the SDK emits toward the observability stack.
- **Traceability & Knowledge Service**: exposes references/IDs so SDK calls can
  cite the recognitions and runbooks that justify downstream operations.
- **Topology Integration Simulation**: distributes placement/constraint metadata
  so clients can route requests to the proper strata or regions.

## Components

1. **API Client.**
   Handles authentication, request normalization (intake rules), and response
   decoding (observables).

2. **Serializer/Deserializer.**
   Converts between client data types and relational observations.

3. **Policy/Trace/Topology Helper.**
   Assists developers in structuring requests to meet policy requirements,
   attach traceability IDs, and honor topology constraints (e.g., target region
   or stratum hints) exposed by the integration service.

4. **Telemetry Hook.**
   Streams client-side metrics into the measurement fabric using registered
   schemas so monitoring/resource modules observe end-to-end health.

## Usage

Developers link the SDK to their apps; all interactions with the relational
computer go through the SDK, guaranteeing adherence to intake/policy rules.
