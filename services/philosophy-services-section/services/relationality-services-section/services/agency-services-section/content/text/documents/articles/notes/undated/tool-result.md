---
type: object
class: contemporary
status: active
depends-on:
  - tool.md
see-also:
  - tool-schema.md
  - action-trace.md
references: []
title: Tool result
description: A tool result is the structured output of a tool invocation, including the return value, error information, and side-effect record.
---

# Tool result

A **tool result** is the structured output of a tool invocation, including the return value, error information, and side-effect record.
It is the data the agent reads back after invoking a tool.

## Components

A complete tool result includes:

- **Status.** Success, error, partial, timeout.
- **Value.** On success, the function's return value.
- **Error.** On failure, error type and message.
- **Side-effect record.** What persistent change occurred (when applicable).
- **Latency.** How long the invocation took.
- **Cost.** Resource consumption (when relevant).

Vendors typically return value or error; richer metadata (effects, costs) is application-level.

## Result handling

The agent processes results to:

- **Update its state.** Incorporate result into context.
- **Decide next action.** Continue, retry, replan, or terminate.
- **Detect errors.** Recognize failures and engage recovery.
- **Track effects.** Maintain awareness of what's changed in the environment.

This is the *Observation* step in the ReAct loop.

## Result formats

- **Plain text.** Simplest; agent parses naturally.
- **Structured JSON.** Schema-validated; agent can extract specific fields.
- **Multi-modal.** Text + images + files; modern function-calling APIs support these.
- **Streamed.** Long-running tools may stream results as they arrive.

Choice of format affects how reliably the agent uses the result.

## Error results

Errors warrant special treatment:

- **Type.** Validation, runtime, timeout, permission, external service.
- **Recoverability.** Whether retry might succeed.
- **Information.** What error message tells the agent.
- **Action implication.** What the agent should do about it.

Well-designed error results enable [error-recovery](error-recovery.md); poorly-designed ones leave agents stuck.

## Result truncation

Real challenge: tool results may be very large (file contents, search results, screen state):

- **Naive inclusion** can blow context budget.
- **Truncation** loses information.
- **Summarization** introduces interpretation between tool and agent.
- **Pagination** delays full consumption.
- **Out-of-context storage** requires further tool calls to retrieve.

Production systems use various combinations; no clean solution.

## Limits

- **Information density.** Large results may exceed context window.
- **Result-format brittleness.** Format changes break agent parsing.
- **Side-effect opacity.** Standard results don't expose effect information; agent may not know what changed.
- **Trust.** Agent must trust that results accurately reflect tool execution.

## Status

Standard concept.
Modern function-calling APIs standardize the success/error structure.
Richer result metadata (effects, provenance) is application- level and varies.
