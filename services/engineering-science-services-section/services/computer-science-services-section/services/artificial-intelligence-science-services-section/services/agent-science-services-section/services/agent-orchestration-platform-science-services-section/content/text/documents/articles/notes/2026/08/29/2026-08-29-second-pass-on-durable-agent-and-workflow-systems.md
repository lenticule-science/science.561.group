---
title: "Second pass on durable agent and workflow systems"
date-created: 2026-08-29
date-observed: 2026-08-29
authors:
  - terra-research-subagent
  - codex
type: research-note
status: current-source-indexed-survey
evidence-policy: "Technical statements identify observed documentation, project claims, or 561 inferences. Sources are primary project documentation or repositories observed on 2026-08-29."
keywords: [agent-orchestration, durable-execution, workflow-replay, agent-memory, kubernetes]
description: This pass covers systems materially distinct from the OpenClaw, Hermes Agent, Honcho, and Paperclip holdings.
---


## Scope and identity resolution

This pass covers systems materially distinct from the OpenClaw, Hermes Agent, Honcho, and Paperclip holdings. It does not treat every agent framework as a new control plane.

- **LangGraph** is LangChain's low-level graph workflow runtime, not a corporate work ledger.
- **Temporal** is a durable-execution platform, not an agent runtime by itself.
- **Dapr Agents** is Dapr's Python agent framework on a distributed runtime; it is the relevant Kubernetes-native candidate because its durable-agent mechanics are coupled to Dapr Workflows, state, pub/sub, observability, and deployment controls.
- **Microsoft Agent Framework** is the current Microsoft framework for new production agent and workflow work. It is the successor worth studying when encountering prior AutoGen/Semantic Kernel material.
- **CrewAI** is a role/crew/flow application framework.
- **Letta** is a stateful-agent and memory runtime, distinct from Honcho's asynchronous derived-memory service.
- **OpenAI Agents SDK** is a model-runtime harness with optional sandbox
  execution, not an organizational control plane or a general work ledger.
- **Hatchet** is a queue-first orchestration engine for workers, durable tasks,
  and workflows; it is not an agent memory product or a corporate ontology.

## Comparative matrix

| System | Observed primary role | State/recovery model | Human and policy seam | Important limit |
|---|---|---|---|---|
| LangGraph | graph-state workflow runtime | checkpointers at graph super-step boundaries; resume re-executes affected nodes | `interrupt()` pauses and resumes with human input | checkpoints do not make effects exactly once; pre-interrupt effects must be idempotent |
| Temporal | durable execution platform | event/history-backed workflows resume after process or infrastructure failure | signals/updates permit long waits and approval patterns | workflow durability does not authorize or validate an external effect |
| Dapr Agents | distributed durable-agent framework | `DurableAgent` uses Dapr Workflows, event sourcing, and replay | before-tool and before-LLM hooks can deny, mutate, or require approval | durable replay still requires explicit effect idempotency and deployment discipline |
| Microsoft Agent Framework | Python/.NET agent and workflow framework | project documentation describes checkpoints, restartability, and time travel | middleware and human-in-the-loop workflow support | framework abstractions do not create a durable corporate record or independent success evidence |
| CrewAI | crews plus event-driven flows | flows manage state and can persist/resume long-running work | guardrails, callbacks, and human-feedback triggers | role/backstory configuration is not an authority model |
| Letta | stateful-agent/memory runtime | persisted agent state, attached memory blocks, archival memory | API tool rules can require approval before a named tool | context attachment/revocation is not organizational authorization or source adjudication |
| OpenAI Agents SDK | model-runtime harness with optional sandbox compute | snapshot/rehydration of externalized agent state across a sandbox loss | explicit workspace manifest and harness/compute separation | sandbox/runtime controls do not create corporate standing, a work ledger, or independent delivery evidence |
| Hatchet | queue-first durable task/workflow engine | durable event-log checkpoints, durable waits, retries, task runs and workers | users/roles, environments, cancellation, pause, and web management surfaces | run-level idempotency is beta and does not prove an external effect occurred once or was authorized |

## LangGraph: checkpointed graph execution

**Observed.** LangGraph describes itself as a low-level runtime for long-running, stateful agents, with durable execution, persistence, streaming, and human-in-the-loop controls. Its persistence documentation says checkpointers save state at super-step boundaries. On resume after an interrupt or retry, an affected node runs again from the beginning; the project therefore explicitly requires idempotent handling of effects before an interrupt.

Sources observed 2026-08-29:

- [LangGraph overview](https://docs.langchain.com/oss/python/langgraph/overview)
- [re-execution, interrupts, and idempotency](https://docs.langchain.com/oss/python/langgraph/interrupts)
- [persistence and recovery](https://docs.langchain.com/oss/python/langgraph/persistence)

**Inference.** A checkpoint restores computational state. It does not by itself prevent a duplicate database write, message, payment, actuator command, or deployment. A workflow that resumes needs an idempotency key or an external receipt appropriate to its effect.

## Temporal: durable execution beneath an agent system

**Observed.** Temporal documents durable execution as workflow resumption after crashes, network failures, and infrastructure outages; its AI documentation places long-running agent loops and multi-day waits for human approval among the intended uses. Temporal's OpenAI Agents integration documents an approval flow that waits on a signal or update.

Sources observed 2026-08-29:

- [Temporal documentation](https://docs.temporal.io/)
- [durable AI overview](https://github.com/temporalio/documentation/blob/main/docs/ai/index.mdx)
- [OpenAI Agents integration](https://github.com/temporalio/documentation/blob/main/docs/develop/typescript/integrations/openai-agents.mdx)

**Inference.** Temporal is a workflow spine candidate when work must remain recoverable across machine/process loss or real human delays. It does not decide who has standing to start a workflow, whether a result satisfies an obligation, or whether its business record is canonical.

## Dapr Agents: a Kubernetes-native durable-agent candidate

**Observed.** Dapr Agents v1.0 is documented as a Python framework whose `DurableAgent` runs on Dapr Workflows. Its documentation describes persisted conversation/execution state, child durable-agent workflows invoked as tools, and replay-aware logging. Hooks around tool and LLM calls can mutate, deny, or pause for approval. Dapr can run as a sidecar in Kubernetes pods and is installed there through its CLI or Helm chart; Kubernetes deployment enables mTLS by default unless explicitly disabled.

Sources observed 2026-08-29:

- [Dapr Agents overview](https://docs.dapr.io/developing-ai/dapr-agents/)
- [DurableAgent core concepts](https://docs.dapr.io/developing-ai/dapr-agents/dapr-agents-core-concepts/)
- [hooks and human-in-the-loop](https://docs.dapr.io/developing-ai/dapr-agents/dapr-agents-hooks/)
- [Dapr on Kubernetes](https://docs.dapr.io/operations/hosting/kubernetes/kubernetes-overview/)
- [Kubernetes deployment](https://docs.dapr.io/operations/hosting/kubernetes/kubernetes-deploy/)

**Observed caution.** Dapr documents replay and at-least-once actor effects: an unconfirmed invocation can be retried, and external effects can consequently run twice unless made idempotent. [Dapr actor effect guidance](https://docs.dapr.io/developing-applications/sdks/dotnet/dotnet-actors-next/dotnet-actorsnext-statemachine/)

**Inference.** Dapr is relevant for an industrial-control execution substrate only after authority and effect contracts exist. Kubernetes gives scheduling, deployment, and process isolation mechanisms; it does not turn an arbitrary agent prompt or memory representation into a legitimate corporate command.

## Microsoft Agent Framework and the AutoGen transition

**Observed.** Microsoft's current repository presents Agent Framework as the Python/.NET framework for production agents and multi-agent workflows. It documents sequential, concurrent, handoff, and group patterns alongside checkpointing, streaming, human-in-the-loop, and time travel; its repository and documentation provide migration paths from AutoGen.

Sources observed 2026-08-29:

- [Microsoft Agent Framework repository](https://github.com/microsoft/agent-framework)
- [Microsoft Agent Framework documentation](https://learn.microsoft.com/en-gb/agent-framework/)
- [AutoGen teams, retained as historical framework reference](https://microsoft.github.io/autogen/dev/user-guide/agentchat-user-guide/tutorial/teams.html)

**Inference.** New science notes should use the precise product identity: AutoGen for its historical team/conversation model; Microsoft Agent Framework for the current Microsoft framework. Neither identity proves independent verification, organizational accountability, or reliable delivery.

## OpenAI Agents SDK: harness and sandbox compute

**Observed in official OpenAI documentation, dated 2026-04-15.** The current
Agents SDK release describes a harness for instructions, memory, files, shell
and patch tools, MCP integrations, and sandbox-aware orchestration. It can
describe an agent workspace through a Manifest, mount data or local files, and
run compute in a native or supported third-party sandbox. The documentation
states that harness and compute can be separated so credentials remain outside
the environment executing model-generated code; it also describes snapshotting
and rehydrating externalized agent state into a fresh container after sandbox
loss or expiry. The initial release is Python-first, with TypeScript support
planned rather than represented as already available.

Sources observed 2026-08-29:

- [official Agents SDK release and architecture](https://openai.com/index/the-next-evolution-of-the-agents-sdk/)
- [OpenAI's workflow and guardrail guide](https://openai.com/business/guides-and-resources/a-practical-guide-to-building-ai-agents/)

**Inference.** This is an important comparison because it separates the agent
harness from disposable execution compute and gives a concrete workspace and
recovery model. It remains a runtime SDK: a sandbox Manifest names an
environment, not a corporate office; snapshot recovery is not exactly-once
external effects; traces/guardrails do not alone bind a human authorization to
an effect; and the documentation does not turn SDK state into an authoritative
enterprise or industrial-control record.

## Hatchet: queue-first durable work execution

**Observed in current Hatchet documentation and upstream repository.** Hatchet
is maintained at [`hatchet-dev/hatchet`](https://github.com/hatchet-dev/hatchet)
and is MIT-licensed. Its core objects are code-defined tasks, long-running
workers that execute them, and durable workflows that compose tasks. The
official docs expose scheduled/cron/event/webhook triggers; retries, timeouts,
cancellation and pause; concurrency, rate-limit and priority controls; child
spawning, durable sleep/event waits and DAGs; OpenTelemetry/Prometheus/logging;
and Docker/self-hosted or cloud deployment. The project documents PostgreSQL as
the minimal self-hosted dependency for simple workloads and describes its
durable state as an event log with checkpoints used to resume after worker
failure.

Its current idempotency feature is expressly beta. It supports TTL- and
status-based deduplication of runs: a matching input-derived key can reject a
duplicate trigger, and status-based ownership releases when a run reaches a
terminal status. The latter is a useful queue claim but explains its own limit:
a later duplicate is admissible after completion, and neither scheme proves
that an external call inside the accepted run was applied exactly once.

Sources observed 2026-08-29:

- [Hatchet overview and operational surface](https://docs.hatchet.run/v1)
- [durable-execution semantics and assumptions](https://docs.hatchet.run/v1/durable-execution)
- [idempotency semantics (beta)](https://docs.hatchet.run/v1/idempotency)
- [upstream repository and MIT license](https://github.com/hatchet-dev/hatchet)

**Inference.** Hatchet adds the important queue-first pattern missing from
agent-framework comparisons: an agent call can be one task in a general
durable-worker system with backpressure, scheduling and operational telemetry.
Users, roles, multi-tenancy and a control UI are deployment-management
mechanisms, not by themselves a 561 Group authority, obligation, approval, or
artifact-acceptance model. Stronger claims require a kill/replay assay, a
selected retention/backup policy, worker credential/isolation inspection, and
effect-specific receipts across a retry or idempotency collision.

## CrewAI: role-oriented collaboration and flows

**Observed.** CrewAI documents agents, crews, and flows. It presents crews as collaborative agent configurations and flows as event-driven orchestration with state, persistence/resumption, guardrails, callbacks, and human-feedback triggers.

Sources observed 2026-08-29:

- [CrewAI documentation](https://docs.crewai.com/index)
- [CrewAI flow implementation documentation](https://github.com/crewAIInc/crewAI/blob/main/docs/v1.15.12/en/concepts/flows.mdx)

**Inference.** A natural-language role, goal, or backstory is not a standing, delegated authority, budget, or proof obligation. Such claims require separate records and enforcing interfaces.

## Letta: persistent context under explicit attachment

**Observed.** Letta documents persisted agent state and memory blocks that can be independently created, attached to agents, detached, shared, and reattached. Attached blocks are injected into an agent's context. Its API type system also defines tool rules including a rule that requires approval before a named tool can run.

Sources observed 2026-08-29:

- [Letta documentation](https://docs.letta.com/)
- [memory-block attachment and detachment](https://docs.letta.com/tutorials/attaching-detaching-blocks/)
- [agent block and tool-rule API](https://docs.letta.com/api/resources/agents/subresources/blocks/methods/attach)
- [client-side tool execution](https://docs.letta.com/guides/agents/tool-execution-client-side/)

**Inference.** Letta's attach/detach mechanism is a context-access mechanism. It can support least-context design, but it is not enough by itself to prove that a user, agent, or office had authority to see data or invoke an effect.

## Consequences for comparison and evaluation

1. **Replay safety is not delivery evidence.** LangGraph and Dapr both make replay behavior explicit; durable systems still need idempotency and effect-specific receipts.
2. **Human interruption is not a governance model.** A pause/approval API must identify the approver, delegated authority, reviewed object, decision, time, and subsequent effect.
3. **Memory access is not institutional memory.** A memory block, archive, or derived profile needs provenance, versioning, access policy, and a separate route for admission into any authoritative record.
4. **Kubernetes is an execution environment, not an ERP/ICS.** It contributes scheduling, deployment, workload isolation, and runtime policy surfaces; it does not supply corporate ontology, obligations, accounting, or proof of capability delivery.

## Corpus status and source watch

**Observed local status.** A reconciliation count found 421 Markdown hits across the public and science corpus when legacy material is included. That count demonstrates historical depth and repetition, not 421 current authorities. This current service section is the canonical research seat; earlier OpenClaw, FARS, PyFARS, and relationality holdings remain provenance/genealogy unless a bounded claim is re-admitted here with current sources.

**Source watch.** Revisit the linked project repositories, release notes, security advisories, protocol specifications, and deployment documentation before using this note for implementation. The highest-drift surfaces are runtime security boundaries, durable-execution semantics, license/deployment terms, MCP/A2A interfaces, and whether an announced framework migration has reached the relevant supported release.
