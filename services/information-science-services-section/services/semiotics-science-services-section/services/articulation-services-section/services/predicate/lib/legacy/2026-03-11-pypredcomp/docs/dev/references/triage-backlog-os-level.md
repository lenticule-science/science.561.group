---
title: "Triage backlog — OS-level material"
description: "Curated list of OS-level files in operations/engineering/triage/. Files relevant to kernel, filesystem, process, IPC, network, drivers, shell, stdlib, security, init-boot, packaging, scheduling, bundled-apps."
kind: reference
---

# Triage backlog — OS-level material

The captain's triage and backlog at `operations/engineering/triage/library/triage/` and `operations/engineering/triage/operations/command/ideas/triage/` contain years of OS-level planning.
This reference curates what's relevant to each OS subsystem.

The agent does not crawl triage; the [specs/](../specs/) directory is the working contract.
Use this file to drill in when writing a specific subsystem's specs.

> **Catalog status (v0.8+).** This catalog is a queue projection of the `pipeline-card` substrate fiber per [specs/governance/triage-workflow.md](../specs/governance/triage-workflow.md) §6 and the [triage-promotes-via-pipeline-stages](../decisions/triage-promotes-via-pipeline-stages.md) decision.
> The per-entry `Integrated into ...
> ` markers below are the legacy form of `pipeline-card.integrated-into-files`.
> Pre-v0.8 markers are migrated to retroactive pipeline-cards in stage `integrated` by the v0.8 sweep (t08-65); the catalog markdown is regenerated from substrate state by the render script (t08-66).
> New integrations from v0.8 onward MUST flow through the pipeline.

## Kernel

### Algebra and runtime model

- `relationality-inner-triage/ideas-for-concept-computers/runtime/structure/repl-program.md` — interactive read-eval-print loop over kernel carriers/operators.
- `relationality-inner-triage/ideas-for-concept-computers/runtime/structure/virtual-machine-program.md` — VM executing bytecode/runbook wiring plans with scheduling/persistence.
- `relationality-inner-triage/ideas-for-concept-computers/runtime/structure/interpreter-program.md` — turns source text into executable wiring plan via recognition.
- `relationality-inner-triage/ideas-for-concept-computers/runtime/structure/recognition-endpoint-program.md` — endpoints for submitting/retrieving recognitions with intake enforcement.
- `relationality-inner-triage/ideas-for-concept-computers/runtime/structure/information-engine-program.md` — core information processing engine.
- `from-gsu-ccs-20260313/proof/RelationalHyperverse/` — 150+ Lean files: Act.lean, Concept.lean, Dyads.lean, ConceptFixedFiber.lean, DynamicResiduation.lean, Histories.lean, HistoryUniversality.lean.
  Formal proofs of the relational computation model.

### MCP and substrate API

- `operations/command/ideas/triage/mcp-as-system-api.md` — MCP as the system's primary API layer.
- `operations/command/ideas/triage/mcp-verb-inventory.md` — 50+ verbs catalog.
- `operations/command/ideas/triage/cells-as-models-mcp-as-io.md` — cells are models with deterministic algebraic inference; MCP unifies cell queries, rules, and LLM calls.

### Architectural primitives

- `operations/command/ideas/triage/primitive-hierarchy.md` — what each layer (FARS/FAOH/MASH) adds; Cell ↔ Node ↔ GFRTU hierarchy.
- `operations/command/ideas/triage/fars-faoh-mash-architecture-from-first-principles.md` — three-system decomposition: FARS (settled σ face), FAOH (firable Δ face), MASH (the tick π=σ∘Δ).
- `operations/command/ideas/triage/unified-record-sketch.md` — unified record structure: action, subject, σ (saturation), Δ (transfer), audience.
- `operations/command/ideas/triage/all-records-are-transactions.md` — every state change is a double-entry transaction.
- `operations/command/ideas/triage/dont-flatten-the-tower.md` — the levels-as-strata argument: asserted (raw triple), saturated (closed under σ), settled (closed under Δ) are different mathematical objects and must not be conflated by flat EAVT storage.

## Filesystem

- `relationality-inner-triage/ideas-for-concept-computers/storage/structure/filesystem-adapter-program.md` — maps computer snapshots to host FS with integrity metadata.
- `relationality-inner-triage/ideas-for-concept-computers/storage/structure/persistence-program.md` — persistence policies, snapshots, retention schedules.
- `on-relationality/texts/computer-architecture/data-catalog.md` — metadata service for recognitions.

## Process / dispatch / scheduling

- `operations/command/ideas/triage/faoh-self-composing-harness-installer.md` — FAOH composes AGENTS.md/CLAUDE.md from FARS entities; installs harnesses.
- `operations/command/ideas/triage/node-rust-responsibility-split.md` — Node.js harness vs Rust daemon split.
- `operations/command/ideas/triage/daemon-world-tick.md` — periodic world-tick cycle.
- `operations/command/ideas/triage/auto-dispatch-daemon.md` — auto-dispatch daemon firing ready work each tick.
- `relationality-inner-triage/ideas-for-concept-computers/network/structure/multi-user-computer-program.md` — multi-user operation: identities, sessions, isolation, resource allocation.
- `on-relationality/texts/computer-architecture/job-orchestrator.md` — job orchestration with dependency ordering.

## IPC

- `operations/command/ideas/triage/everything-is-messages-from-an-entity.md` — message-based entity communication protocol.
- `relationality-inner-triage/ideas-for-concept-computers/network/structure/email-messaging-program.md` — messages and conversations as recognitions.
- `relationality-inner-triage/ideas-for-concept-computers/network/structure/notifications-attention-program.md` — attention queue and notification routing.

## Network

- `relationality-inner-triage/ideas-for-concept-computers/network/structure/socket-gateway-program.md` — exposes kernel over TCP/WebSocket.
- `relationality-inner-triage/ideas-for-concept-computers/network/structure/network-program.md` — generic network program.
- `relationality-inner-triage/ideas-for-concept-computers/operations/structure/external-integrations-program.md` — external APIs as recognitions.
- `on-relationality/texts/computer-architecture/network-controller.md` — network protocol handling.
- `on-relationality/texts/computer-architecture/replication-controller.md` — multi-instance replication.
- `relationality-inner-triage/ideas-for-concept-computers/replication/structure/distributed-relationality-program.md` — distributed relationality and federation.

## Drivers

- `relationality-inner-triage/ideas-for-concept-computers/environment/structure/repository-process-program.md` — git repository as a driver.
- `relationality-inner-triage/ideas-for-concept-computers/environment/structure/mobile-devices-sensors-program.md` — mobile device sensor drivers.
- `relationality-inner-triage/ideas-for-concept-computers/operations/structure/home-automation-program.md` — home automation driver.

## Shell

- `relationality-inner-triage/ideas-for-concept-computers/client/structure/terminal-client-program.md` — CLI/TTY interface.
- `relationality-inner-triage/ideas-for-concept-computers/client/structure/gui-graph-workbench-program.md` — GUI graph explorer/dashboard.
- `relationality-inner-triage/ideas-for-concept-computers/client/structure/personal-site-program.md` — personal site shell.
- `relationality-inner-triage/ideas-for-concept-computers/client/structure/infinity-site-program.md` — infinity site client.
- `operations/command/ideas/triage/relational-expression-syntax.md` — command/expression syntax.
- `operations/command/ideas/triage/web-gui-messaging.md` — web GUI as message-driven shell.

## Stdlib

- `relationality-inner-triage/ideas-for-concept-computers/measurement/structure/measurement-algebra-program.md` — measurement algebra as stdlib.
- `relationality-inner-triage/ideas-for-concept-computers/measurement/structure/measurement-fabric-program.md` — canonical telemetry bus.
- `on-relationality/texts/computer-architecture/modal-reasoning.md` — modal logic stdlib.
- `on-relationality/texts/computer-architecture/logical-reasoning.md` — first-order logic stdlib.
- `operations/command/ideas/triage/graph-is-composition-not-source.md` — graph operations as compositions.

## Security

- `on-relationality/texts/computer-architecture/identity-access.md` — auth, credentials, policy integration.
- `on-relationality/texts/computer-architecture/monitoring-audit.md` — audit logs, provenance, invariant enforcement.
- `on-relationality/texts/computer-architecture/traceability-service.md` — knowledge and traceability state.
- `on-relationality/texts/computer-architecture/policy-audit-console.md` — policy enforcement and audit.
- `relationality-inner-triage/ideas-for-concept-computers/identity/operator/authenticate-access.md` — access control operator.

## Init / Boot

- `on-relationality/texts/computer-architecture/deployment-upgrade.md` — deployment/upgrade flow.
- `relationality-inner-triage/ideas-for-concept-computers/deployment/structure/deployment-upgrade-program.md` — deployment upgrade as recognitions.
- `relationality-inner-triage/ideas-for-concept-computers/ingestion/structure/ingestion-gateway-program.md` — data ingestion pipeline.
- `operations/command/ideas/triage/faoh-self-composing-harness-installer.md` — harness installer (relevant for boot of agential layer).

## Packaging

- `operations/command/ideas/triage/guix-guile-composition-layer.md` — Guix/Guile composition layer.
- `operations/command/ideas/triage/fars-mash-as-packages.md` — FARS/MASH as composable packages.
- `operations/command/ideas/triage/fars-core-algebra-native.md` — native algebraic core.

## Bundled apps (v0.3)

### Email

- `relationality-inner-triage/ideas-for-concept-computers/network/structure/email-messaging-program.md` — relational email client with threading, DKIM/DMARC.

### Calendar

- `relationality-inner-triage/ideas-for-concept-computers/productivity/structure/calendar-scheduling-program.md` — relational calendar with constraints.
- `relationality-inner-triage/ideas-for-concept-computers/productivity/structure/calendar-service-program.md` — calendar as a service.

### Chat

- `operations/command/ideas/triage/mud-chat-as-messaging.md` — chat as MUD-style messages (translate to Matrix-aware framing).

### Calculator / spreadsheet

- `relationality-inner-triage/ideas-for-concept-computers/productivity/structure/relational-spreadsheet-program.md` — spreadsheet as relational computation.

### File browser

- `relationality-inner-triage/ideas-for-concept-computers/resource/structure/resource-manager-program.md` — resource allocation and lifecycle.
- `relationality-inner-triage/ideas-for-concept-computers/resource/structure/relational-desktop-program.md` — relational file browser.

### Terminal

- `relationality-inner-triage/ideas-for-concept-computers/client/structure/terminal-client-program.md` — terminal shell.

## Substrate services (v0.4+ tier)

See [on-relationality-architecture.md](on-relationality-architecture.md) for the full substrate-services-tier index.

## Out of scope (research/demos, not OS-level)

These are content the OS hosts, not OS components — see [milestones/research-sidebar.md](../milestones/research-sidebar.md):

- World-sim, Predicated Zork, Hevî Mala, paracosms (Teraum, Okaga, etc.).
- MUD-toy, generative-paracosms.
- Persona-agents as authoring entities (becomes an app at v0.8).
- Personal apps that are Solitaire-class (music-practice, fitness-movement, recipes, museums, etc.).
- World-sim, Predicated Zork, paracosms / multiverse.

## How to use this file

When writing a sprint spec for subsystem X:

1. Look up X above.
2. Read the listed files in triage to understand what the captain has worked out.
3. Translate forward into current vocabulary (PredCat/PredComp).
4. Write the sprint spec; cite the load-bearing platform theory and the triage source.

Don't bulk-lift content from triage; per [memory feedback], triage lifts have produced disasters.
The sprint spec is a fresh distillation, not a rewrite of the triage file.
