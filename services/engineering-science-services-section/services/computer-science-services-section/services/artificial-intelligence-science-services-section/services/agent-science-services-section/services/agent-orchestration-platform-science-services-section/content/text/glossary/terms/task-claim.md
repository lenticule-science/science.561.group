---
description: A time-bounded or atomic assignment of one durable task to a worker, with explicit conflict and reclaim behavior.
identity: task-claim
name: task-claim
date-created: 2026-08-29
provenance:
  sources:
    - https://github.com/paperclipai/paperclip/blob/master/docs/guides/agent-developer/task-workflow.md
---
A task claim records that a worker currently owns an attempt on a durable task.
Its protocol should state whether acquisition is atomic, how a competing claim
fails, when the claim expires, and how abandoned work is reclaimed. A unique
claim prevents duplicate ownership at the ledger; it does not by itself prevent
duplicate external effects.
