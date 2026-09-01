---
id: workflow-replay
description: "Re-execution of workflow logic from persisted history or checkpoints to reconstruct state after suspension, retry, or failure."
distinguished-from: execution-record, capability-delivery-evidence
date-created: 2026-08-29
sources:
  - https://docs.langchain.com/oss/python/langgraph/use-time-travel
  - https://docs.dapr.io/developing-ai/dapr-agents/dapr-agents-core-concepts/
---

Workflow replay reconstructs running state by re-executing logic against a persisted history or checkpoint. It supports recovery and inspection, but may also re-enter code around an interrupted or uncertain operation. Replay-safe systems isolate non-deterministic calls and make external effects idempotent. Replay establishes recoverability of an attempt, not truth of a result or delivery of a capability.
