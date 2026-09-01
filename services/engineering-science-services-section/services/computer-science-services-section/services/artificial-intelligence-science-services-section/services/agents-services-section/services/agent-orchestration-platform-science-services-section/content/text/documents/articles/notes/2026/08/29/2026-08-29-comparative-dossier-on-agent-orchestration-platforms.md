---
title: "Comparative dossier on agent orchestration platforms"
date-created: 2026-08-29
date-observed: 2026-08-29
authors:
  - codex
  - terra-research-subagent
type: research-note
status: current-source-indexed-survey
evidence-policy: "External technical claims are bounded to linked primary sources observed on 2026-08-29. Product claims, repository observations, 561 inferences, and historical internal notes are distinguished."
keywords:
  - agent orchestration
  - agent runtime
  - work ledger
  - memory substrate
  - control plane
  - durable execution
---


## Research question

What kinds of systems are currently grouped under “agent orchestration,” and
which separable capabilities do they actually provide?

The central finding is that the named projects are not substitutes at one
layer. OpenClaw is principally a long-lived agent gateway and runtime; Hermes
Agent combines a runtime with a durable local work board; Honcho is a memory
and derived-state service; Paperclip is an organizational control plane around
heterogeneous agent runtimes. LangGraph and Temporal contribute workflow-state
and durable-execution mechanisms beneath those surfaces.

This distinction matters for the 561 Group. Treating all of these as “the
orchestrator” would reproduce the repository’s control-surface problem by
letting task state, corporate authority, memories, model calls, and machine
effects silently compete as sources of truth.

## Comparative layer map

| Project | Resolved identity | Primary layer | Durable state | Important boundary |
|---|---|---|---|---|
| OpenClaw | [`openclaw/openclaw`](https://github.com/openclaw/openclaw) | integrated personal-agent gateway/runtime | per-agent SQLite sessions and workspace state | one trusted operator boundary per gateway; workspace is not automatically a hard sandbox |
| Hermes Agent | [`NousResearch/hermes-agent`](https://github.com/NousResearch/hermes-agent) | local runtime plus durable multi-profile work board | SQLite board, task comments, attachments, claims, and named profiles | in-process delegation is distinct from the durable board; local boards are not a distributed workflow service |
| Honcho | [`plastic-labs/honcho`](https://github.com/plastic-labs/honcho) | memory and derived-state service | messages plus asynchronously derived representations | derived memory is advisory evidence, not organizational authority or a scheduler |
| Paperclip | [`paperclipai/paperclip`](https://github.com/paperclipai/paperclip) | organizational agent control plane | companies, agents, goals, tasks, budgets, approvals, audit events, and runs | control-plane state must reconcile with authoritative corporate records and real external effects |
| LangGraph | [`langchain-ai/langgraph`](https://github.com/langchain-ai/langgraph) | graph-state agent workflow runtime | checkpoints and resumable graph state | supplies workflow mechanics, not corporate semantics |
| Temporal | [`temporalio/temporal`](https://github.com/temporalio/temporal) | durable execution infrastructure | event histories and replayable workflows | supplies recovery and waiting, not agent identity or authority |

## Exact upstream and maintenance snapshot

This is an **observed source snapshot**, not a maturity ranking, security
assessment, or procurement recommendation. It resolves the four recurrent
names to their public upstream repository and listed maintainer, and records
the current project license text/API metadata and activity state as retrieved
on 2026-08-29. A recent push establishes only that the upstream was changing;
it does not establish release quality, support commitments, governance health,
or fitness for a specific deployment.

| Name used here | Exact upstream / maintainer | License evidence | Activity/release evidence observed 2026-08-29 | Interpretive limit |
|---|---|---|---|---|
| OpenClaw | [`openclaw/openclaw`](https://github.com/openclaw/openclaw), GitHub organization `openclaw` | current [LICENSE text](https://raw.githubusercontent.com/openclaw/openclaw/main/LICENSE) says MIT; GitHub API license classifier reported `NOASSERTION` | repository API recorded a same-day push; releases page showed a stable `v2026.7.1-2` release and newer beta line | source header resolves the apparent classifier/text mismatch; examine vendored notices and the selected tag before reuse |
| Honcho | [`plastic-labs/honcho`](https://github.com/plastic-labs/honcho), GitHub organization `plastic-labs` | current [LICENSE text](https://raw.githubusercontent.com/plastic-labs/honcho/main/LICENSE) is AGPL-3.0 | repository API recorded a same-day push; `releases/latest` returned no published latest-release object at retrieval | absence of that endpoint response is not an absence-of-maintenance claim; it means a deployer needs a commit/tag selection and upgrade policy |
| Paperclip | [`paperclipai/paperclip`](https://github.com/paperclipai/paperclip), GitHub organization `paperclipai` | current [LICENSE text](https://raw.githubusercontent.com/paperclipai/paperclip/master/LICENSE) is MIT | repository API recorded a same-day push; `releases/latest` returned `v2026.824.1`, published 2026-08-25 | its rapid, young upstream history and draft/shipped distinction make version-pinned assays necessary |
| Hermes Agent | [`NousResearch/hermes-agent`](https://github.com/NousResearch/hermes-agent), GitHub organization `NousResearch` | current [LICENSE text](https://raw.githubusercontent.com/NousResearch/hermes-agent/main/LICENSE) is MIT | repository API recorded a same-day push; `releases/latest` returned `v2026.8.27`, published 2026-08-27 | a current release and local-board design do not establish multi-host reliability or institutional governance |

The public [GitHub repository API](https://docs.github.com/en/rest/repos/repos#get-a-repository)
was the metadata source for upstream owner, creation/push state, branch, and
classifier fields; the linked license files take precedence where the API
classifier is absent or conflicts. Release observations were retrieved from
each repository's official releases/API endpoint. This is repository metadata,
not an external audit of maintainer identity or legal advice.

## OpenClaw: integrated gateway and runtime

OpenClaw documents one embedded agent runtime that owns model discovery, prompt
assembly, tool wiring, session management, and channel delivery. Each configured
agent receives a workspace, bootstrap/context files, and a per-agent SQLite
session store. Skills and tool policy extend the runtime. Multi-agent routing
binds channel/account inputs to configured agents, while background subagents
provide bounded delegation and completion handoff.

Observed sources:

- [agent runtime and workspace contract](https://github.com/openclaw/openclaw/blob/main/docs/concepts/agent.md)
- [multi-agent routing](https://github.com/openclaw/openclaw/blob/main/docs/concepts/multi-agent.md)
- [subagents](https://github.com/openclaw/openclaw/blob/main/docs/tools/subagents.md)
- [security model](https://github.com/openclaw/openclaw/blob/main/SECURITY.md)

The scientifically useful pattern is a persistent operator-owned gateway that
integrates channels and capabilities around a long-lived agent. The limit is
equally important: separate personas, workspaces, and SQLite stores are state
partitions, not proof of hostile multi-tenancy or corporate authorization.
Workspace scope is not a hard filesystem boundary unless sandboxing actually
enforces it. A subagent completion announcement proves message delivery, not
that an external capability was delivered correctly.

## Hermes Agent: ephemeral delegation versus a durable work ledger

Hermes Agent explicitly separates `delegate_task`, an in-process fork/join
reasoning call, from its Kanban board, a durable work queue and state machine.
The SQLite-backed board persists named tasks, status, assignees, dependency
links, comments, attachments, workspaces, idempotency keys, worker claims, and
human review across restarts. Different named profiles may handle a task over
its lifetime. The dispatcher reclaims stale work and launches workers with
board/task/workspace context.

Observed sources:

- [Kanban multi-agent board reference](https://github.com/NousResearch/hermes-agent/blob/main/website/docs/user-guide/features/kanban.md)
- [toolsets reference](https://github.com/NousResearch/hermes-agent/blob/main/website/docs/reference/toolsets-reference.md)
- [security guidance](https://github.com/NousResearch/hermes-agent/blob/main/website/docs/user-guide/security.md)

This is the clearest external example of a distinction the 561 corpus needs:
an ephemeral subagent call is not the corporate task record. A durable board is
still not proof that attached artifacts are correct, that side effects occurred
exactly once, or that a deployment is healthy. Hermes also documents a trusted
local-user envelope for some workspace modes; a tenant label or profile name
must not be mistaken for a hard security boundary.

## Honcho: memory events and derived representations

Honcho presents workspaces, peers, sessions, and messages as storage primitives.
Synchronous message writes are followed by asynchronous derivation that can
produce summaries, peer representations, and conclusions for later retrieval
or reasoning. It offers HTTP and SDK access and describes itself as
framework/provider agnostic.

Observed sources:

- [repository and architecture overview](https://github.com/plastic-labs/honcho)
- [documentation overview](https://honcho.dev/docs/v3/documentation/introduction/overview)

The useful pattern is separating raw event history from later, model-mediated
representations. That separation creates an obligation: a consumer should know
the source messages, derivation time and version, evidence class, and whether a
representation is advisory. A memory service is not a scheduler, approval
authority, or deployment controller. Claims such as “perfect recall” or social
reasoning quality remain project claims until evaluated against a declared
corpus and acceptance method.

## Paperclip: organizational control plane around heterogeneous workers

Paperclip models companies, reporting lines, goals, agents, budgets, approvals,
task hierarchies, audit events, and adapter-driven agent runs. Adapters invoke
external runtimes through local CLIs, HTTP services, gateways, or plugins. Its
task workflow includes an atomic checkout mechanism so concurrent claims have a
single winner. Its specifications also discuss scoped credentials, board
governance, task-linked artifacts, and cost ceilings, though draft specification
claims must be distinguished from verified current behavior.

Observed sources:

- [project repository](https://github.com/paperclipai/paperclip)
- [agent adapter model](https://github.com/paperclipai/paperclip/blob/master/docs/adapters/overview.md)
- [task workflow](https://github.com/paperclipai/paperclip/blob/master/docs/guides/agent-developer/task-workflow.md)
- [system specification](https://github.com/paperclipai/paperclip/blob/master/doc/SPEC.md)
- [database deployment](https://github.com/paperclipai/paperclip/blob/master/docs/deploy/database.md)

The useful pattern is an explicit control plane that does not require every
worker to share one runtime. The limit is that atomic task ownership prevents
duplicate claims, not duplicate external effects, incorrect artifacts, or a
worker falsely reporting success. Reported budgets cannot constrain unobserved
billing paths. For the 561 Group, any Paperclip-like view would need to project
from or reconcile with the authoritative offices, obligations, accounting, and
machine observations; it must not become another shadow registry.

## Supporting mechanisms

LangGraph provides graph-state orchestration, checkpoints, interruption, human
review, recovery, and state-history inspection. Temporal provides durable
workflow histories that recover across crashes and can wait across long human
or external-system delays. These are mechanisms beneath a control plane, not
corporate ontologies.

MCP is an interface protocol through which a host can discover and call tools.
It does not establish that a tool is authorized, safe, currently available, or
truthful. Those obligations remain with the host, deployment, and organizational
authority boundary.

A2A is a remote-agent task protocol with declared capabilities, task/artifact
updates, transport bindings, and security mechanisms. OpenTelemetry GenAI
conventions provide a cross-runtime vocabulary for model/tool/workflow
observations. Langfuse adds a self-hostable trace/evaluation service with
dataset, experiment, score, and review surfaces. None turns a remote task, an
observed trace, or an evaluation score into corporate authority, effect
delivery, or artifact acceptance; see the [interoperation and telemetry
note](2026-08-29-agent-interoperation-and-telemetry-boundaries.md).

Primary sources:

- [LangGraph overview](https://docs.langchain.com/oss/python/langgraph/overview)
- [LangGraph persistence](https://docs.langchain.com/oss/python/langgraph/persistence)
- [LangGraph replay and time travel](https://docs.langchain.com/oss/python/langgraph/use-time-travel)
- [Temporal durable AI guidance](https://github.com/temporalio/documentation/blob/main/docs/ai/index.mdx)
- [Model Context Protocol specification](https://modelcontextprotocol.io/specification/2024-11-05/index)
- [A2A specification](https://a2a-protocol.org/latest/specification/)
- [OpenTelemetry GenAI attribute registry](https://opentelemetry.io/docs/specs/semconv/registry/attributes/gen-ai/)
- [Langfuse self-hosting architecture](https://langfuse.com/self-hosting)

## Comparative scientific vocabulary

The projects can be compared without privileging their product vocabulary by
asking about:

- **agent runtime** — model invocation, context construction, and tool execution;
- **control plane** — identities, goals, organizational relations, policies,
  budgets, and operator intervention;
- **durable work ledger** — task state, claims, handoffs, review, retry,
  blockage, and evidence attachments;
- **execution record** — one attempt’s identity, inputs, effects, outputs,
  costs, and terminal reason;
- **memory substrate** — raw events, summaries, embeddings, and derived
  representations with provenance;
- **authority boundary** — who may create work, delegate, approve, spend, or
  execute effects;
- **isolation boundary** — the actual workspace, process, container, OS user,
  credential, tenant, network, and filesystem enforcement;
- **durability class** — in-turn call, recoverable job, durable task,
  event-sourced workflow, or authoritative corporate record;
- **capability-delivery evidence** — the test, deployment health observation,
  registry resolution, source receipt, or human acceptance matching the claim.

## Comparative test matrix for later assays

| Question | Evidence required |
|---|---|
| Does work recover after process death? | kill/restart assay with the same task identity and no lost committed step |
| Can two workers claim one task? | concurrent checkout test and recorded loser behavior |
| Can an effect happen twice? | idempotency key or external receipt checked across retry |
| Can a human stop or approve the effect? | enforced approval gate tested before the side effect |
| Are credentials partitioned? | worker-visible environment and credential assay |
| Is an artifact actually delivered? | acceptance test plus deployed or published observation appropriate to the claim |
| Can a run be reconstructed? | immutable attempt inputs, tool/effect events, outputs, and terminal reason |
| Is memory source-bounded? | derivation record linking representation to source events and derivation version |
| Can state be restored? | fresh restore/replay test, not merely a backup or export command |

## 561 Group inference ceiling

No surveyed product is a complete ERP or industrial control system. A grounded
composition would keep corporate authority and records in their canonical 561
owners; use a control plane only as a projection; use a durable work ledger for
attempts and handoffs; use runtimes as bounded workers; use derived memory as
advisory context; and require independently matched evidence before changing a
work item to delivered.

This is an architectural inference from the comparison, not an adoption
decision and not a statement that those seams currently exist.

## Claim audit: what to retain, demote, or test

The recurring failure mode in this subject is a smooth description that turns
an interface, product promise, or configuration label into an operational
guarantee. The following register records the important evidence ceilings in
the current dossier; it is a corrective to repetition, not a new product
taxonomy.

| Claim pattern to avoid | What current primary material actually supports | Required next evidence if the claim matters |
|---|---|---|
| “OpenClaw has an institutional durable database.” | the [database-first document](https://github.com/openclaw/openclaw/blob/main/docs/refactor/database-first.md) describes global and per-agent SQLite ownership; it is repository design material within a fast-changing personal-agent project | version-pinned migration/restore and concurrent-work assays, plus a separate institutional authority model |
| “Hermes Kanban makes agent work reliable.” | its [Kanban documentation](https://github.com/NousResearch/hermes-agent/blob/main/website/docs/user-guide/features/kanban.md) supports local task persistence, heartbeats, reclaim, and worker lifecycle behavior | kill/reclaim assay with a real effect idempotency key and an artifact-review record; cross-host/tenant claims need distinct evidence |
| “Honcho memory learns the organization.” | the [overview](https://honcho.dev/docs/v3/documentation/introduction/overview) supports stored workspaces/peers/sessions/messages and asynchronous derivation; learning/reasoning quality is a project claim | corpus-bounded evaluation, source-to-derivation links, deletion/retraction behavior, and access-policy tests |
| “Paperclip's company/budget/approval model enforces governance.” | its [system specification](https://github.com/paperclipai/paperclip/blob/master/doc/SPEC.md) and related run material describe/control-plane intent; parts are expressly draft and adapters remain external runtimes | version-pinned API/UI/adapter test showing who approved which effect, credential scope, cost reconciliation, and authoritative-record projection |
| “A2A security or an Agent Card delegates authority.” | the [A2A specification](https://a2a-protocol.org/latest/specification/) defines transport/security, discovery, task and in-task-authorization mechanics | binding-specific identity verification, local delegation policy, and receipt reconciliation; an advertised skill is not institutional standing |
| “A trace, score, or LLM judge proves delivery.” | [OpenTelemetry](https://opentelemetry.io/docs/specs/semconv/registry/attributes/gen-ai/) and [Langfuse](https://langfuse.com/docs/evaluation/overview) can represent observations and evaluator outputs | evaluator/corpus/version/threshold record, reviewer authority when needed, and external evidence that the claimed effect or artifact was accepted |

Do not replace these tests with generic phrases such as *enterprise-ready*,
*autonomous*, *multi-agent*, *secure by design*, *memory*, *human in the
loop*, or *production-grade*. Each is a question about a named mechanism,
deployed configuration, and testable consequence. The current note retains
those words only when a linked source uses them as a project claim or when the
claim is immediately bounded.

## Internal provenance and reconciliation

The following holdings remain useful but have different evidentiary roles:

- the March 2026 ecosystem survey is a historical field snapshot whose broad
  present-tense claims are superseded by this source-indexed dossier;
- the 2026-07-24 OpenClaw survey is valuable provenance because it records the
  earlier corpus and its Honcho/Paperclip coverage gap, but it is explicitly
  subagent output;
- the 2026-04-07 FARS note records historical design influence, not current
  OpenClaw behavior or an implementation commitment;
- the 2026-07-24 basics note contributes the important distinction between an
  attempt, an artifact, and a delivered capability;
- legacy OpenClaw and PyFARS material should remain legacy unless a bounded
  claim is re-admitted through current sources.
