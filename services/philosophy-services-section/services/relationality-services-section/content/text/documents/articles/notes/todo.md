---
title: TODO
description: This roadmap translates the relational mathematics (acts, profiles, hypertensors) into a software stack.
---
# TODO

This roadmap translates the relational mathematics (acts, profiles, hypertensors)
into a software stack. Each phase builds on earlier ones; finish phases in
order so the runtime remains coherent.

## Phase 0 — Mathematical + Content Grounding

- Audit the acts, strata, and texts to produce a canonical taxonomy of
  recognitions, contexts, and morphisms suitable for storage.
- Decide how much metadata a “context node” must carry (stratum, reflex depth,
  tags, parent references, allowed morphisms).
- Extract rewrite rules, flow/nucleus relationships, and hypertensor
  definitions from the docs into structured specification.

## Phase 1 — Core Data Layer

- Stand up XTDB locally.
- Define schemas for:
  - Context nodes (IDs, strata, reflex depth, metadata blobs, pointers to
    hypertensor payload locations).
  - Directed morphisms (refinement/abstraction/restriction/extension edges with
    type metadata, provenance, effective dates).
  - Local neighborhood indexes that support lookup-by-stratum and path queries
    for rewrite planning.
- Provision S3/MinIO buckets and decide on sparse binary formats for hypertensor
  payloads (e.g., compressed ndarray shards). Record URIs inside XTDB nodes.

## Phase 2 — Runtime Rewrite Engine

- Implement the normalization / rewrite core in Rust:
  - Encode acts as rewrite rules operating over context neighborhoods.
  - Ensure Flow/Nucleus interactions are first-class operations.
- Expose the engine through WASM modules so Python, MCP services, or CLI tools
  can invoke rewrites deterministically.
- Define the EDN for rule declarations, type metadata, and effect
  annotations; build parsers/validators.
- Integrate with Tokio so localized patches pulled from XTDB execute concurrently
  while preserving causal ordering.

## Phase 3 — Hypertensor Layer

- Implement quasicrystalline hypertensor objects in Rust (ndarray backend first;
  leave CUDA/XLA hooks for later).
- Define serialization for lattice coordinates + recognition payloads so fibers
  can be stored/retrieved as sparse blobs.
- Implement pushforward/pullback operations induced by morphisms, ensuring they
  respect Flow covariance and Nucleus stability.
- Write adapters that let the rewrite engine fetch/update hypertensor slices via
  XTDB references + object storage.

## Phase 4 — Distributed Context Agents

- Package each context as a lightweight Rust service that:
  - Watches XTDB for relevant changes.
  - Maintains its local hypertensor slice.
  - Runs rewrite steps via the WASM-exposed engine.
- Use NATS for regulator/feedback messaging between agents (per stratum and
  cross-stratum signals).
- Deploy via Nomad or Kubernetes, using Consul/etcd for discovery and secrets.
  Ensure agents can scale horizontally and rehydrate from XTDB snapshots.

## Phase 5 — Observability + Control Loops

- Emit metrics (rewrites, flow steps, regulator signals, latency) via
  Prometheus exporters; craft Grafana dashboards per stratum and per agent.
- Instrument rewrites and morphism traversals with OpenTelemetry spans; ship to
  Jaeger for trace analysis.
- Implement at least one regulator loop (e.g., stability enforcement across
  strata) over NATS to demonstrate Ashby-compliant heterogeneous control.

## Phase 6 — Minimal End-to-End Prototype

- Populate XTDB with a small subset of contexts/morphisms derived from the docs.
- Store one hypertensor blob and prove pushforward/pullback works through a
  morphism.
- Run a single agent + regulator loop that performs rewrites on demand and emits
  telemetry.
- Validate OAuth/MCP integration requirements (auth story) and document the API
  surface to be formalized in OpenAPI later.

## Phase 7 — Expansion + Productization

- Design the OpenAPI schema + MCP services that expose site objects, fibers, and
  rewrite operations.
- Layer OAuth scopes over context strata and morphism types.
- Gradually ingest the full act catalogue, automate hypertensor generation for
  new content, and onboard heterogeneous inputs (text, citations, media, MCP
  tools) by mapping them to contexts + fibers.
