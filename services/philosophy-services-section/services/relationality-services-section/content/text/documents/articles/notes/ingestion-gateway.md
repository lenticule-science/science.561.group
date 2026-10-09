---
title: Ingestion Gateway
keywords:
  - architecture
  - ingestion
depends-on:
  - theorem/internal/intake-structure
  - specifications/interface
  - specifications/policy
  - specifications/introspection
  - specifications/intake-stack
  - specifications/measurement-fabric
  - specifications/topology-integration
description: This gateway accepts external data feeds, runs intake/policy validation, and injects normalized observations into the relational network.
aliases:
  - ingestion gateway
---
# Ingestion Gateway Architecture

This gateway accepts external data feeds, runs intake/policy validation, and
injects normalized observations into the relational network.

## Dependencies

- **Interface Simulation**: defines API/normalization workflow.
- **Policy Simulation**: enforces discipline/filter rules on incoming data.
- **Introspection Simulation**: monitors gateway health and provides feedback.
- **Intake Stack Simulation**: supplies the canonical normalization/validation
  pipeline before data enters the network.
- **Measurement Fabric Simulation**: standardizes telemetry emitted by the
  gateway (acceptance rates, latency).
- **Topology Integration Simulation**: informs routing/placement decisions so
  intake traffic lands on admissible strata.
- **Traceability & Knowledge Service**: records schema/policy versions used for
  each intake path.

## Components

1. **API Frontend.**
   Exposes REST/MCP/WebSocket endpoints. Normalizes payloads via the interface
   spec and intake stack instructions (schema binding, context seeding).

2. **Policy Engine.**
   Applies discipline/filter rules per policy spec before forwarding data.

3. **Router.**
   Sends validated observations into the distribution stack (network controller)
   for downstream modules, respecting topology constraints from the integration
   service.

4. **Measurement/Trace Hook.**
   Emits observables (latency, throughput, error rates) through the measurement
   fabric and records traceability metadata (schema/policy IDs) for audit.

## Data Flow

1. External client sends request → API normalizes payload using intake rules.
2. Policy engine authorizes/filters.
3. Router enqueues observation into appropriate channel (e.g., runtime module).
4. Monitoring/audit modules record the event for later review.

## Invariants

- No unvalidated data enters the relational spine.
- Policy decisions and payloads are logged for audit.
- Backpressure is applied when downstream modules lag.

## Realisation in the implementation

The ingestion gateway is realised as an interface around the intake, policy,
and measurement structures and acts.

- **Acts (intake and recognition).**
  Normalization and validation are performed only by earned acts such as
  `seed-observation`, `recognize-observation`, `normalize-observation`,
  and related intake acts in `docs/math/acts/`, each with a single handler in
  `app/rewriter/acts/`. Handlers operate on Pydantic carriers for raw and
  normalized observations.

- **Internal theorems (intake structure).**
  The intake-structure theorem defines the intake state and operators
  (payloads, observations, contexts, normalization operators). The gateway
  must be an instantiation of these operators; any new intake behaviour must
  be justified at the theorem/specification level.

- **Specifications (types and functions).**
  The interface, intake-stack, policy, and measurement-fabric specifications
  define the types and functions used at the boundary (request envelopes,
  observation carriers, policy regimes, telemetry schemas). In code these are
  Pydantic models in `app/schemas/` and pure functions in `app/intake/`,
  `app/policy/`, and `app/measurement/`.

- **Runbooks (wiring).**
  Complete ingestion workflows (for example, “normalize payload, check policy,
  route into storage and runtime”) are expressed only as YAML runbooks under
  `runbooks/library/` (such as `ingest-text.yaml` or similar). The gateway’s
  handlers select and execute runbooks via the rewriter engine; they do not
  contain bespoke orchestration logic.

- **Service shell.**
  FastAPI route handlers in `app/main.py` provide the HTTP and MCP interface:
  they parse incoming requests into Pydantic carriers, pick the appropriate
  runbook, and delegate all domain work to acts and runbooks. Policy and
  measurement middleware enforce the corresponding specifications on every
  ingestion path.

With these constraints, the ingestion gateway cannot drift into arbitrary
application logic: all behaviour is a composition of earned acts over carriers
specified and justified in the math and specification layers.
