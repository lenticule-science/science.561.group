---
title: "Specs"
description: "Concrete OS spec organized by subsystem. Plan 9 / POSIX-class organization. Each subsystem cites the load-bearing platform theory it implements."
kind: index
---

# Specs

These are the wire-format, on-disk-layout, runtime-cycle, and protocol-binding specs the agent implements against.
Each is normative.

The math substrate is defined by [PredCat](../../../../../../../../theories/humanities/theories/math/theories/categories/theories/predication-categories/_index.md).
The engineering theory is in [PredComp](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/README.md) and its sub-platforms (AgOP, FRP, IAP, web-server, database, distributed-coordination, FARS).
What lives **here** is the concrete byte-, path-, and protocol-level specification of an OS conforming to that theory.

## Organization

Specs are organized by **OS subsystem**, following the structure of POSIX and Plan 9 specifications:

- [kernel/](kernel/) — bilattice algebra, fibers, ISA, `respond`, closure-rule engine, runtime cycles, message language, repair log, evidence vector, error codes, canonicalization, computational model.
- [filesystem/](filesystem/) — cells-as-files, content-addressing, paths, mounts, snapshots, event log.
- [process/](process/) — sessions, dispatch, runbooks, lifecycle, fairness, computation tiers.
- [agential/](agential/) — non-LM model artefacts as substrate cells (Tier-2 surface) and other agential discipline that composes on top of the process model.
- [ipc/](ipc/) — message-passing, signals, pipes-equivalent, federation merge as IPC.
- [network/](network/) — federation protocol, HTTP, WebSocket, Matrix, SMTP/IMAP/POP3, CalDAV/CardDAV, ActivityPub, XMPP, IRC, MQTT, Modbus, Gemini.
- [drivers/](drivers/) — interfacer model, attach/detach, named drivers (matrix, hledger, mqtt, smtp-imap, git, fs, mcp).
- [shell/](shell/) — REPL, message-language CLI, web GUI shell, TUI shell, command grammar.
- [stdlib/](stdlib/) — coreutils-equivalent verbs (project, filter, fold, materialize, hash, fork, await, settle, witness, audit, retract, assert).
- [security/](security/) — capability model, signing/witnessing, persona/personnel, federation trust, sandbox/fuel.
- [init-boot/](init-boot/) — boot sequence, init runlevels, self-test, service supervision.
- [packaging/](packaging/) — package format, Nix flake spec, Guix manifest spec, image build, upgrade flow, dependency resolution.
- [scheduling/](scheduling/) — heartbeat, deadlines, periodic rules, cron equivalent.
- [bundled-apps/](bundled-apps/) — v0.3 standard userland: email, calendar, chat, file browser, text editor, terminal, calculator, ledger tool.
- [deployment/](deployment/) — sysadmin-facing: deployment target, first-run bootstrap, systemd, TLS+ACME, reverse proxy, production config.
- [admin/](admin/) — admin workflows: invites, first-login, personnel lifecycle, federation ops, driver-config UI.
- [operations/](operations/) — backup, restoration, DR test, staging environment.
- [observability/](observability/) — alerting, log aggregation, error investigation, dashboards, captain-home.
- [governance/](governance/) — charter, decisions/ADR, voting, policy-as-closure-rule, amendments, joint-decisions, budget, incident management.
- [work-orchestration/](work-orchestration/) — campaigns, milestones, goals, objectives, tasks, hierarchy, progress tracking.
- [personnel-development/](personnel-development/) — duties, mentoring, work history, peer feedback, performance review, 1:1, promotion.
- [communication/](communication/) — announcements, broadcasts, audience targeting, acknowledgment.
- [conformance-vectors.md](conformance-vectors.md) — cross-implementation conformance suite (cross-cutting; not in any one subsystem).

## Theory grounding

Each subsystem's `_index.md` cites the load-bearing platform theory it implements:

| Subsystem | Primary theory grounding |
|---|---|
| kernel | `predicated-computing/` (parent), `flatfile-agentic-resource-system/` (substrate concretization) |
| filesystem | `predicated-computing/concepts/predication-graph-store`, `flatfile-agentic-resource-system/concepts/flatfile`, `database-platform/` |
| process | `agential-orchestration-platform/` (sessions, dispatch, runbooks, computation tiers), `flatfile-agentic-resource-system/objects/session-record` |
| agential | `agential-orchestration-platform/concepts/formality-layer`, `agential-orchestration-platform/theorems/settlement-path-cost-monotonicity`, `predicated-computing/concepts/closure-rule-system` |
| ipc | `predicated-computing/morphisms/send-message`, `flatfile-agentic-resource-system/concepts/seven-channel-decomposition` |
| network | `web-server-platform/` (HTTP), `predicated-computing/morphisms/federation-handshake`; protocol bindings cite public RFCs |
| drivers | `predicated-computing/concepts/interfacer`, `predicated-computing/concepts/driver-substrate-split` |
| shell | partial — `interactive-application-platform/concepts/form`, `flatfile-agentic-resource-system`'s flatfile-as-shell; mostly fresh design |
| stdlib | `functional-runtime-platform/` (function records, evaluate, capabilities), `predicated-computing/morphisms/insertion`/retraction/traversal |
| security | `agential-orchestration-platform/theorems/governance-as-modal-restriction`, `functional-runtime-platform/theorems/capability-non-amplification`, `predicated-computing/concepts/signature` |
| init-boot | `predicated-computing/concepts/boot-sequence`, `flatfile-agentic-resource-system/morphisms/heartbeat-cycle` |
| packaging | `predicated-computing/objects/container-image`, `predicated-computing/objects/rule-system-version` |
| scheduling | `agential-orchestration-platform/concepts/heartbeat`, `flatfile-agentic-resource-system/concepts/tick-as-iteration`, `distributed-coordination-platform/` for non-CRDT cases |
| bundled-apps | each app cites the relevant external RFC/spec (RFC 5321/9051 for email, RFC 4791 for calendar, Matrix CS API for chat, etc.) |

## Where the sprint writes fresh

The library is silent or sparse on:

- **Real network protocols** (SMTP/IMAP/POP3, CalDAV/CardDAV, ActivityPub, Matrix CS API, XMPP, IRC, MQTT, Modbus, Gemini, WebSocket beyond implication).
- **Shell / REPL / command-grammar.**
- **Package management beyond container-image.**
- **Init runlevels / service-supervision beyond boot-sequence.**
- **Mount-points / namespace-isolation beyond interfacer.**
- **Container exec model beyond container-image.**
- **Doc format beyond text-as-substrate.**

For these, the sprint cites public specs (where they exist) and writes fresh design (where the substrate's algebra suggests a specific shape).
The captain's instruction: we have better math than anyone else; we can do the impossible.

## Conformance

Each subsystem MUST have its conformance criteria stated in its `_index.md`.
Cross-subsystem conformance vectors live in [conformance-vectors.md](conformance-vectors.md).

Implementations MUST pass all subsystems' conformance criteria for their target version (per [milestones/](../milestones/)).
