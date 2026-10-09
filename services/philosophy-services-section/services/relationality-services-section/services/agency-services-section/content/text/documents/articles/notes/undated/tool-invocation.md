---
type: morphism
class: atomic-operation
status: active
depends-on:
  - teaching/explanations/tool-schema.md
  - teaching/explanations/environmental-action.md
  - ../objects/tool-call.md
  - ../objects/action-space.md
see-also:
  - ../objects/execution-trace.md
  - ../morphisms/task-decomposition.md
  - ../theorems/tool-schema-bounds-action-space.md
  - ../terms/tool-use.md
  - ../terms/tool-call.md
references:
  - references/schick2023.md
  - references/anthropic2024.md
title: Tool invocation
description: Tool invocation is the operation by which an agentic system produces a tool call and receives its result.
---

# Tool invocation

Tool invocation is the operation by which an agentic system produces a [tool call](tool-call.md) and receives its result.
It is the atomic unit of environmental action: one invocation produces one tool call, receives one result, and returns control to the model for the next reasoning step.

## Operational structure

Tool invocation is a five-step sequence:

1. **Schema selection.** The model, given its current conversation state and the available [action space](action-space.md), decides whether to invoke a tool and which one.
  If no tool invocation is needed, the model produces free text instead.

2. **Argument construction.** The model constructs a JSON object conforming to the selected tool schema's input specification.
  This is the model's primary output for this step — it replaces free-text generation with structured argument production.

3. **Execution.** The host application receives the (function-name, arguments) pair and executes the function against the external system.
  Execution crosses the context/environment boundary: the function runs outside the model's computation.

4. **Result delivery.** The host application delivers the function's return value to the model as a text observation in the next conversation turn.
  The model cannot directly observe the execution — it only sees the result.

5. **Observation integration.** The model incorporates the result into its reasoning and either produces another tool invocation or a final response.

## Domain and codomain

As a morphism in the agents theory, tool invocation maps:

- **Domain:** (conversation state, action space, schema selection decision)
- **Codomain:** (updated conversation state with result appended, execution trace entry)

The mapping is not deterministic in general: the model's schema selection and argument construction are stochastic.
However, for a fixed model, fixed conversation state, and fixed action space, the distribution over tool calls is determinate.

## Validity conditions

A tool invocation is valid if and only if:

- The selected schema is present in the current action space.
- The constructed arguments conform to the schema's JSON Schema input specification (correct types, required fields present, no additional disallowed fields).
- The invocation occurs within the agent's delegated scope and authority.

Invalid invocations are rejected at step 3: the host application may refuse to execute a call that violates schema constraints or authority bounds.

## Composability

Tool invocations compose sequentially: the result of invocation $i$ is available as an observation when the model is selecting schema for invocation $i+1$.
This sequential composition is the primitive from which [task decomposition](task-decomposition.md) builds multi-step plans.
The composition is not merely sequential execution — each invocation's result may redirect which schema the model selects next, producing adaptive rather than fixed sequences.
