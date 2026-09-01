---
description: The attributable record of one execution attempt's identity, inputs, actions, effects, outputs, costs, and terminal reason.
identity: execution-record
name: execution-record
provenance:
  date-created: 2026-08-29
---
An execution record describes one attempt, not the abstract task and not the
delivered capability. It should identify the worker and runtime, input and
policy versions, tool or effect events, outputs and artifacts, resource costs,
timestamps, and terminal reason. A new retry receives a new attempt identity
even when it belongs to the same durable task.
