---
title: "Platform theories"
description: "The six PredComp sub-platforms and FARS. What each contains, which OS subsystem each informs."
kind: reference
---


The library has substantive theory for the OS at `theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theories/`.
Each platform contains concepts, objects, morphisms, theorems, narratives.
The sprint's specs cite these.

## Agential orchestration platform (172 files)

Path: `theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theories/agential-orchestration-platform/`

OS subsystems served: **process, scheduling, ipc, security**.

Load-bearing files: - `concepts/dispatch.md` — work-unit routing. - `concepts/heartbeat.md` — periodic rhythm; first-class scheduler. - `concepts/governance.md` — authority structure. - `concepts/formality-layer.md` — F0–F6 grading for skill execution. - `concepts/personnel-vs-office.md` — distinct entity classes. - `objects/dispatch-table.md`, `heartbeat-scheduler.md`, `agent-record.md`, `skill-record.md`, `runbook-record.md`, `session-record.md`, `office-record.md`, `mode-record.md`. - `morphisms/dispatch-matching.md`, `skill-invocation.md`, `runbook-execution.md`, `tick-advance.md`, `heartbeat-cycle.md`, `open-session.md`, `close-session.md`, `resume-session.md`, `federation-handshake.md`, `governance-decision.md`. - `theorems/dispatch-as-closure-rule-system.md`, `governance-as-modal-restriction.md`, `dispatch-composes-authorization.md`, `settlement-path-cost-monotonicity.md`, `agent-community-consensus.md`.

## Flatfile agentic resource system (60+ files; nested in AgOP)

Path: `theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theories/agential-orchestration-platform/theories/flatfile-agentic-resource-system/`

OS subsystems served: **kernel, filesystem, process, scheduling, init-boot, ipc, packaging**.

The substrate concretization at the flatfile-with-frontmatter level.
Substantively defines how the OS works at the file/cell/event level.

Load-bearing files: - `concepts/flatfile.md` — directory of `.md` files as substrate. - `concepts/frontmatter-as-presentation.md` — YAML frontmatter as predication fiber. - `concepts/entity-as-model.md` — one file = one entity. - `concepts/event-sourcing.md` — event log as source of truth. - `concepts/four-layer-rule-architecture.md` — user/shape/governance/closure layers. - `concepts/seven-channel-decomposition.md` — logical event channels. - `concepts/tick-as-iteration.md` — tick = file walk + rule cascade. - `concepts/three-tier-memory.md` — volatile/implicit/consolidatable session memory. - `objects/note.md` — entity record (frontmatter + body). - `objects/fiber.md` — predication-valued bilattice fiber. - `objects/witness.md` — operator execution record. - `objects/event.md`, `closure-rule-record.md`, `heartbeat-record.md`, `session-record.md`. - `morphisms/load.md` — read file → Note → fiber. - `morphisms/interpret.md` — frontmatter + body → predication fiber. - `morphisms/settle.md` — closure to fixed point. - `morphisms/respond.md` — produce output fiber from settled state + input. - `morphisms/heartbeat-cycle.md` — boot through tick discipline.

## Functional runtime platform (28 files)

Path: `theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theories/functional-runtime-platform/`

OS subsystems served: **kernel, process, security, stdlib**.

Load-bearing files: - `concepts/code-as-substrate.md` — programs are substrate cells. - `concepts/capability.md` — capability primitive. - `concepts/capability-passing.md` — non-amplifying delegation. - `concepts/effect.md` — declared side-effect. - `objects/function-record.md` — typed callable. - `objects/type-record.md` — type predications. - `objects/capability-record.md` — capability cell. - `morphisms/evaluate.md`, `invoke-function.md`, `check-type.md`, `exercise-capability.md`. - `theorems/type-soundness.md`, `function-purity-replay-fidelity.md`, `capability-non-amplification.md`.

## Interactive application platform (28 files)

Path: `theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theories/interactive-application-platform/`

OS subsystems served: **process, shell, security**.

Load-bearing files: - `concepts/user.md`, `account.md`, `authentication-method.md`. - `concepts/document.md`, `text-span.md`, `collaborative-editing.md`. - `concepts/list.md`, `form.md`, `validation-rule.md`. - `concepts/notification.md`. - `objects/user-record.md`, `account-record.md`, `document-record.md` (CRDT shape), `form-record.md`, `notification-record.md`. - `morphisms/register-account.md`, `authenticate-user.md`, `edit-document.md`, `submit-form.md`, `send-notification.md`. - `theorems/collaborative-edit-convergence.md`, `account-uniqueness-and-attribution.md`.

## Web server platform (16 files)

Path: `theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theories/web-server-platform/`

OS subsystems served: **network**, partial **process** + **shell**.

The only platform with explicit network protocol material (HTTP, REST, GraphQL, webhooks, middleware).
For protocols beyond these (SMTP, IMAP, Matrix, etc.) the sprint writes fresh.

Load-bearing files: - `concepts/endpoint.md`, `route.md`, `middleware.md`, `rest-resource.md`, `graphql-schema.md`, `webhook.md`, `content-negotiation.md`. - `objects/endpoint-record.md`, `middleware-record.md`, `webhook-record.md`. - `morphisms/handle-request.md`, `emit-response.md`, `fire-webhook.md`. - `theorems/request-response-determinism.md`, `middleware-composability.md`.

## Database platform (14 files)

Path: `theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theories/database-platform/`

OS subsystems served: **filesystem, stdlib, scheduling**.

Load-bearing files: - `concepts/oltp-vs-olap.md`, `query-planning.md`, `secondary-index.md`, `read-replica.md`, `materialized-view.md`, `online-schema-change.md`. - `objects/query-plan-record.md`, `read-replica-record.md`, `materialized-view-record.md`. - `morphisms/plan-query.md`, `refresh-materialized-view.md`. - `theorems/read-replica-eventual-consistency.md`, `online-schema-change-zero-downtime.md`.

## Distributed coordination platform (21 files)

Path: `theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theories/distributed-coordination-platform/`

OS subsystems served: **kernel, scheduling, network** (only when CRDT discipline isn't sufficient).

Load-bearing files: - `concepts/leader-election.md`, `quorum-consensus.md`, `distributed-lock.md`, `sharding.md`, `consistent-hashing.md`, `cluster-membership.md`, `failure-detection.md`. - `objects/leader-record.md`, `quorum-record.md`, `distributed-lock-record.md`, `shard-record.md`, `cluster-record.md`. - `morphisms/elect-leader.md`, `propose-and-vote.md`, `acquire-distributed-lock.md`, `release-distributed-lock.md`. - `theorems/quorum-consensus-safety.md`, `quorum-safety-under-partition.md`, `consistent-hashing-minimal-movement.md`.

## Parent (predicated-computing)

Path: `theories/engineering/theories/tech/theories/computing/theories/predicated-computing/`

100+ concepts, ~50 objects, ~50 morphisms.
Parent theory; everything in the platforms inherits from here.

Load-bearing for OS: - `concepts/closure-rule-system.md`, `predication-fiber.md`, `settlement-determinism.md`, `witness-chain.md`, `hash-discipline.md`, `canonical-form.md`. - `concepts/interfacer.md`, `boundary.md`, `driver-substrate-split.md`, `reification.md`. - `concepts/encryption.md`, `signature.md`, `transport.md`. - `concepts/boot-sequence.md`, `bootstrap.md`, `container-image.md`. - `objects/witness.md`, `predication-graph-store.md`, `event-log.md`. - `morphisms/settle.md`, `emit-witness.md`, `federation-handshake.md`, `send-message.md`, `receive-message.md`, `verify-signature.md`, `encrypt-region.md`.

## Where the library is silent

Per the survey: real network protocols (SMTP, IMAP, CalDAV, Matrix, ActivityPub, MQTT, etc.), shell/REPL design, package management beyond container-image, init runlevels beyond boot-sequence, mount points / namespace isolation, container exec model, doc format.
The sprint writes fresh for these, citing public RFCs where they exist.
