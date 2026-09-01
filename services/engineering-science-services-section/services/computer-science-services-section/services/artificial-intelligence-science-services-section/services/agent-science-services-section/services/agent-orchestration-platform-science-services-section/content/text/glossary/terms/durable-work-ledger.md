---
description: A persistent record of tasks, claims, dependencies, handoffs, review, blockage, retries, and delivery evidence across worker and process lifetimes.
identity: durable-work-ledger
name: durable-work-ledger
provenance:
  date-created: 2026-08-29
  sources:
    - https://github.com/NousResearch/hermes-agent/blob/main/website/docs/user-guide/features/kanban.md
relations:
  distinguished-from: ephemeral-delegation, durable-execution
---
A durable work ledger persists coordination state beyond one agent turn or
worker process. It records task identity, status, claims, dependencies,
handoffs, review, blockage, retries, and evidence attachments. It differs from
an ephemeral delegated call, whose result normally returns only to a parent
context. It also differs from durable execution: a ledger records the social
and operational life of work, while durable execution recovers a workflow’s
computational state.
