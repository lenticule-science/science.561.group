---
title: "Paperclip project note"
date-observed: 2026-08-29
type: project-note
status: source-indexed
project: paperclipai/paperclip
license: MIT
---

# Paperclip

Paperclip is observed here as an organizational control plane around external
agent runtimes. It models companies, agents, reporting relations, goals, tasks,
budgets, approvals, audit events, and adapter-driven runs. Its task checkout is
documented as atomic, giving concurrent claimants one winner.

Atomic task ownership does not guarantee exactly-once external effects,
correct artifacts, truthful worker reports, or complete cost capture. A
Paperclip-like view for the 561 Group would need to project from or reconcile
with canonical corporate records rather than become a shadow registry.

## Verified control-loop mechanics

**Current runtime documentation.** Paperclip wakes an agent on a timer, task
assignment, explicit demand, or automation. A running agent coalesces later
wakeups rather than starting a concurrent run; adapters launch or call the
selected runtime, capture stdout and reported usage/cost, and retain a runtime
session identifier for a later resume. The documented run statuses are
`queued`, `running`, `succeeded`, `failed`, `timed_out`, and `cancelled`.
This provides a legible operator control loop and failure record, but not proof
that a resumed runtime did not repeat an external side effect.

The task-workflow guide's atomic checkout endpoint provides a concrete
single-claim conflict response. It says nothing about a worker's artifact
admission, the semantic truth of its report, or a transaction spanning an
outside API call and the checkout record.

## State, identity, and containment

**Specification material is labelled as such.** The agent-run specification
proposes persisted heartbeat-run metadata and events in PostgreSQL; its
acceptance language should be read as design/implementation intent until a
versioned release and implementation test establish the behavior. The CLI
documentation does describe a local deployment layout containing instance
configuration, environment, database, backups, logs, an encryption master key,
workspace data, and per-company/project material. That concrete layout makes
secret rotation, backup custody, and host access part of the control-plane
threat model.

The system specification defines Paperclip's control-plane identity (agent
identifier, organization, role/title, adapter and status), while leaving an
agent's inner identity/persona adapter-specific. This is a valuable distinction:
a reporting relation or role is not evidence that a model execution possessed
the authority it claimed. The same run specification says local CLI adapters
may execute directly on the host; its optional Linux filesystem/network
confinement is disabled by default. A Paperclip deployment therefore does not
gain runtime isolation merely by modelling an organization.

## Observability and 561 Group inference

Captured output, adapter-reported usage, costs and run status are operational
telemetry. They are neither a complete cost ledger (an adapter can fail to
report a charge) nor an evaluation of artifact quality. For the 561 Group,
Paperclip is a candidate projection/control surface only if scoped authority,
external-effect receipts, record reconciliation, and human approvals are
separate explicit contracts.

Primary sources observed 2026-08-29:

- [repository](https://github.com/paperclipai/paperclip)
- [adapter model](https://github.com/paperclipai/paperclip/blob/master/docs/adapters/overview.md)
- [task workflow](https://github.com/paperclipai/paperclip/blob/master/docs/guides/agent-developer/task-workflow.md)
- [system specification](https://github.com/paperclipai/paperclip/blob/master/doc/SPEC.md)
- [agent runtime guide](https://github.com/paperclipai/paperclip/blob/master/docs/agents-runtime.md)
- [agent-run specification (design material)](https://github.com/paperclipai/paperclip/blob/master/doc/spec/agent-runs.md)
- [CLI deployment layout](https://github.com/paperclipai/paperclip/blob/master/doc/CLI.md)

Change watch: task claims, approval enforcement, credential scope, budget
accounting, adapter result contracts, run isolation, and draft-versus-shipped
specification status.
