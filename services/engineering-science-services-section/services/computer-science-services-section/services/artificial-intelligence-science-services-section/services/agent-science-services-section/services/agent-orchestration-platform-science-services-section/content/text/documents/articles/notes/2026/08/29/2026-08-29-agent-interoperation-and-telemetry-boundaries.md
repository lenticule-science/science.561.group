---
title: "Agent interoperation and telemetry boundaries"
date-created: 2026-08-29
date-observed: 2026-08-29
type: research-note
status: current-source-indexed
evidence-policy: "Technical statements are bounded to the linked A2A specification and OpenTelemetry documentation observed on 2026-08-29. Inferences are labelled."
keywords: [ agent-to-agent, a2-a, open-telemetry, observability, protocol, authority ]
description: Agent runtimes and control planes increasingly exchange work across process and vendor boundaries.
---


## Why protocols belong in this comparison

Agent runtimes and control planes increasingly exchange work across process and
vendor boundaries. That makes agent-to-agent task exchange and execution
telemetry materially relevant tooling, but neither is another corporate control
plane. This note examines the current [A2A specification](https://a2a-protocol.org/latest/specification/)
and the [OpenTelemetry GenAI attribute registry](https://opentelemetry.io/docs/specs/semconv/registry/attributes/gen-ai/),
both observed on 2026-08-29.

## A2A: remote task protocol, not delegated office authority

**Observed in the normative specification.** A2A defines agent discovery via
an Agent Card, a task/message/artifact data model, task state and update
events, synchronous and streaming message operations, task lookup/listing and
cancellation, asynchronous push-notification configuration, and JSON-RPC,
gRPC, and HTTP+JSON bindings. It also specifies idempotency, error handling,
protocol version negotiation, security schemes, authenticated extended Agent
Cards, and an in-task authorization exchange.

These are useful interoperation facts: an A2A client can discover declared
capabilities, submit a task, observe state or artifact updates, and use a
protocol-level security mechanism. The specification also contains explicit
capability-validation and security sections, rather than assuming that a
message is safe merely because it names an agent.

**Limit.** An Agent Card is a service capability declaration. Even when signed
or authenticated, it does not prove that an advertised agent is a 561 Group
office, that its task state is the authoritative work record, that its artifact
satisfies an obligation, or that its remote side effect was accepted. A2A's
idempotency concerns request/task handling; an effectful worker still requires
an effect-specific key and receipt at the system that performs the effect.

**561 Group inference.** If A2A becomes useful, it should be an adapter at a
bounded remote-work boundary. Translate a locally authorized work item into an
A2A task, retain the remote task identifier and declared capability snapshot,
then reconcile returned artifacts and effect receipts through the canonical
record. Do not import an arbitrary remote task state as institutional fact.

## OpenTelemetry GenAI conventions: a trace vocabulary, not an audit proof

**Observed in OpenTelemetry documentation.** The GenAI registry standardizes
attributes for agent identity/version, conversation identity, workflow name,
provider/model information, tool definitions and calls, retrieval data,
messages, token usage, and evaluation scores. Its defined operation names
include `invoke_agent`, `invoke_workflow`, and `execute_tool`. This provides a
cross-runtime vocabulary for joining an agent/workflow invocation to model,
tool, retrieval, and provider observations. The registry marks its current
GenAI attributes as moved/developmental, so producers and consumers must pin
their adopted convention version rather than infer stable field meaning from a
prefix alone.

The registry repeatedly warns that message content, system instructions, tool
arguments/results, and retrieval text may contain sensitive information. It
also says the reported provider may reflect the instrumentation's best
knowledge rather than the actual underlying provider. Telemetry therefore
requires retention, redaction, access-control, and integrity policy before it
can be an operational record.

**Limit.** A trace can say that an instrumented process reported a tool call or
token count. It does not independently attest to the tool's true external
effect, complete provider billing, a human approval, artifact correctness, or
the absence of an uninstrumented path.

**561 Group inference.** Treat OpenTelemetry as a projection format for
execution observations. Link trace/span identifiers to a separate execution
record and preserve the original system-of-record receipt where an effect or
approval matters. Evaluation attributes are measurements only after their
evaluator, corpus, version, threshold, and decision rule are recorded.

## Langfuse: an evaluated-observation service, not a work controller

**Observed in current Langfuse documentation.** Langfuse is maintained by
[Langfuse GmbH / Finto Technologies Inc.](https://langfuse.com/docs/observability/overview)
and is an open-source AI-engineering platform. Its observability model records
traces with nested operations, prompt/model inputs and outputs, token usage,
latency, tool/retrieval steps, and metadata. Its evaluation model can score
live traces, turn examples into datasets, compare variants in experiments, and
use manual or automated evaluators. This makes it a materially different layer
from OpenTelemetry's schema: a running trace/evaluation service with review,
dataset, dashboard, alert, and experiment surfaces.

Its official self-hosting documentation describes Web and asynchronous Worker
containers; Postgres for transactional state; ClickHouse for traces,
observations, and scores; Redis/Valkey for queue/cache; and S3/blob storage for
incoming events and large objects. The documented ingestion path persists
incoming trace/evaluation events to object storage before worker processing,
which is a concrete recovery design for telemetry ingestion. Docker Compose is
officially supported for low-scale testing, while the documentation states that
it lacks high availability, scaling, and backup capabilities; production
options include official Helm and cloud-infrastructure tooling. Some add-on
features require a license key, so "open source" must not be read as a blanket
claim about every deployed feature or support term.

**Limit.** Langfuse can retain what an instrumented application emits and can
organize evaluator results. It does not independently establish that an
instrumented agent performed all of its effects, that an LLM-as-judge score is
valid, that a reviewer held delegated authority, or that a score is an artifact
acceptance decision. Its event payloads can include prompts, outputs, tool
arguments, and retrieval material, so a self-hosted deployment still requires
data classification, access control, redaction, retention, backup, and export
custody decisions.

**561 Group inference.** Langfuse is a candidate observation/evaluation
projection only. Preserve evaluator identity/method/version, test corpus,
threshold, score, reviewer decision, and associated execution/effect receipts
outside any claim that a dashboard alone proves successful operational work.

## Comparative consequences

| Surface | It can standardize | It does not establish |
|---|---|---|
| A2A | remote task/message/artifact exchange, declared capabilities, transport security mechanisms, task updates | corporate standing, approved delegation, artifact acceptance, effect delivery |
| OpenTelemetry GenAI | correlated runtime/model/tool/retrieval observations and selected evaluation fields | complete audit, evidence integrity, privacy compliance, authoritative cost, or success |
| Langfuse | collected traces, evaluation scores, datasets/experiments, dashboard and review surfaces | complete behavioral capture, evaluator validity, delegated approval, or authoritative delivery |

This distinction extends the section's existing separation of runtime,
durable-work ledger, memory substrate, and control plane. Protocol compliance
and observability should be assayable properties of an integration, not labels
that silently elevate a remote agent or a trace into authority.

## Source watch

A2A and GenAI semantic conventions are fast-moving interface surfaces. Before
implementation, re-check the specification version, binding/SDK support,
security guidance, telemetry schema status, content-capture defaults, and
exporter retention path. The linked OpenTelemetry registry itself records a
migration of GenAI conventions; that migration is an interoperability risk,
not evidence that historical instrumentation remains compatible.

Before a Langfuse deployment, re-check its current release, license/add-on
terms, supported topology, encryption/masking configuration, data-residency
constraints, backup/restore procedure, and the independently defined validity
of every evaluator used in a production decision.

## Primary sources observed 2026-08-29

- [A2A specification](https://a2a-protocol.org/latest/specification/)
- [A2A upstream repository](https://github.com/a2aproject/A2A)
- [OpenTelemetry GenAI attribute registry](https://opentelemetry.io/docs/specs/semconv/registry/attributes/gen-ai/)
- [Langfuse observability overview](https://langfuse.com/docs/observability/overview)
- [Langfuse evaluation overview](https://langfuse.com/docs/evaluation/overview)
- [Langfuse self-hosting architecture](https://langfuse.com/self-hosting)
- [Langfuse upstream repository](https://github.com/langfuse/langfuse)
