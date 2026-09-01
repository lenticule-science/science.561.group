---
description: An externally observable operation whose repeated execution under the same effect identity has the intended result of one logical effect.
identity: idempotent-effect
name: idempotent-effect
provenance:
  date-created: 2026-08-29
  sources:
    - https://docs.langchain.com/oss/python/langgraph/interrupts
    - https://docs.dapr.io/developing-applications/sdks/dotnet/dotnet-actors-next/dotnet-actorsnext-statemachine/
relations:
  distinguished-from: workflow-replay, task-claim
---
An idempotent effect can be retried without producing an unintended second logical outcome. A durable workflow may replay a node or retry an invocation after uncertain delivery. For a message, payment, deployment, physical command, or database write, durability therefore requires an effect identity, idempotency key, upsert/read-before-write rule, or external receipt appropriate to the target system. Checkpointing alone does not provide this.
