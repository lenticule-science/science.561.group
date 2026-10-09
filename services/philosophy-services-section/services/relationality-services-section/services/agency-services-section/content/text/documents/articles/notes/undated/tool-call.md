---
type: object
class: atomic
status: active
depends-on:
  - teaching/explanations/tool-schema.md
  - teaching/explanations/environmental-action.md
see-also:
  - ../morphisms/tool-invocation.md
  - ../objects/action-space.md
  - ../objects/execution-trace.md
  - ../theorems/tool-schema-bounds-action-space.md
  - ../terms/tool-use.md
  - ../terms/tool-call.md
references:
  - references/schick2023.md
  - references/anthropic2024.md
title: Tool call
description: A tool call is the atomic unit of environmental action in an agentic system.
---

# Tool call

A tool call is the atomic unit of environmental action in an agentic system.
It is a triple **(function-name, arguments, result)** produced by a single model invocation and executed by the host application against an external system.

## Components

**Function name.** A string identifying which function to invoke, matched against the names in the current [action space](action-space.md).
A function name not present in the action space is structurally invalid — the host application will not execute it.

**Arguments.** A JSON object conforming to the function's input schema.
The model produces the argument values; the schema constrains their types and structure.
Invalid arguments (wrong type, missing required field) are rejected before execution.

**Result.** The return value of the executed function, delivered back to the model as a text observation in the next conversation turn.
The result is in the model's context and is the basis for the next reasoning step.

## Atomicity

A tool call is the indivisible unit.
It is not a plan; it is not a sequence.
A [tool invocation](tool-invocation.md) — the act of producing a call and receiving a result — may be embedded in a longer sequence, but each invocation is a single call-result pair.
The sequencing of tool calls into purposive chains is the province of [goal-directed planning](../../../../glossary/concepts/goal-directed-planning.md); the tool call itself is structurally simple.

## Role in the execution trace

Every tool call that occurs in an [agent session](agent-session.md) is recorded in the [execution trace](execution-trace.md).
The trace is the ordered sequence of all (function-name, arguments, result) triples produced during the session.
For accountability tracing purposes, the execution trace is the primary evidence: it shows exactly what the agent called, with what arguments, and what was returned.

## Distinction from tool-use as a concept

The [tool-use](../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/acting/content/tool/content/tool-schema/terms/tool-use.md) term names the mechanism in general — the practice of LLMs invoking external functions.
A tool call is a single instance of that mechanism: one function, one invocation, one result.
The distinction between the mechanism and its instances matters for reasoning about costs (cost per tool call), observability (logging each call), and accountability (which calls were made under which authority).
