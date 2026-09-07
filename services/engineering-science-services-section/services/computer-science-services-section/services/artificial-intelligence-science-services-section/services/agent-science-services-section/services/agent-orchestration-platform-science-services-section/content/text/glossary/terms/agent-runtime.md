---
description: The execution layer that constructs agent context, invokes models, selects or receives actions, and executes authorized tools.
identity: agent-runtime
name: agent-runtime
keywords:
  - agent-orchestration
provenance:
  date-created: 2026-08-29
  sources:
    - https://github.com/openclaw/openclaw/blob/main/docs/concepts/agent.md
relations:
  distinguished-from: agent-control-plane, durable-work-ledger, memory-substrate
---
An agent runtime is the execution layer that constructs context, invokes a
model, interprets its output, and executes available tools under host policy.
It may also own sessions, streaming, retries, and delegated calls. It does not
thereby become the authoritative task ledger, corporate control plane, or
memory source of truth.
