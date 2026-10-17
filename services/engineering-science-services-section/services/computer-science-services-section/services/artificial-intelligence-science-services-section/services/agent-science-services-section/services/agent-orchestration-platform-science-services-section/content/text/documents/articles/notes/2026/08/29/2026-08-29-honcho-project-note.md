---
title: "Honcho project note"
date-observed: 2026-08-29
type: project-note
status: source-indexed
project: plastic-labs/honcho
license: AGPL-3.0
date-created: 2026-08-29
description: Honcho is observed here as a memory and derived-state service.
---

# Honcho

Honcho is observed here as a memory and derived-state service. Workspaces,
peers, sessions, and messages form its stored substrate; asynchronous workers
derive summaries, representations, and conclusions for later retrieval or
reasoning.

The important scientific boundary is between source events and model-mediated
derived memory. A consumer needs provenance, derivation version and time, and
an evidence/status class. Honcho is not by itself a scheduler, organizational
authority system, or deployment controller.

## Verified service topology

**Repository and deployment documentation.** Honcho separates a synchronous
storage API from asynchronous derivation: its documented self-hosted topology
contains an API service, a `deriver` worker, PostgreSQL with `pgvector`, and
Redis. The repository describes workspaces, peers, sessions, and messages as
stored objects, while the worker creates later representations and insights.
This separation is operationally useful: accepting a source event and deriving
an interpretation are different failure and retry domains. It does not by
itself describe a durable work scheduler, an approval workflow, or a
distributed-effect idempotency key.

The example compose deployment restarts API and deriver services and binds the
database to localhost. It also exposes configuration for Prometheus metrics,
CloudEvents telemetry, Sentry, model-provider credentials, and optional JWT
authentication. These are deployer choices, not proof of a secure default: the
example's authentication toggle must be consciously enabled and supplied with
its secret before it can serve as an access boundary.

## Claims, integration, and institutional limit

**Project claim.** Honcho's overview presents the derivation layer as continual
learning/reasoning over interaction history. The directly observed architecture
supports the weaker statement that a background worker derives state from the
stored substrate; a claim of reliable learning, truth, or social cognition
requires independently specified evaluation and source-linkage tests.

Its peer and workspace identifiers organize memory access but do not establish
that a caller is an authorized 561 Group office, that a summary is admissible
evidence, or that deleting a source will retract every dependent derivation.
Any MCP-facing or agent-runtime integration must carry those checks at its own
boundary.

## 561 Group inference

Honcho belongs behind an explicit memory admission layer: preserve source
events and derivation metadata, then expose retrieval as a revisable aid. It
cannot serve as the corporate task ledger, authorization service, or durable
effect controller solely from the capabilities documented here.

Primary sources observed 2026-08-29:

- [repository and architecture](https://github.com/plastic-labs/honcho)
- [documentation overview](https://honcho.dev/docs/v3/documentation/introduction/overview)
- [self-hosted Compose topology](https://github.com/plastic-labs/honcho/blob/main/docker-compose.yml.example)

Change watch: derivation pipeline, source linkage, deletion/privacy behavior,
MCP surface, self-hosting topology, and evaluation claims.
