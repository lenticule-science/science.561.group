---
type: morphism
class: contemporary
status: active
depends-on:
  - ../objects/tool.md
  - ../objects/tool-result.md
see-also:
  - tool-composition.md
references: []
---

# Tool invocation

**Tool invocation** is the morphism by which an agent calls a tool with arguments, receives a [result](../objects/tool-result.md), and integrates the result into its context.
It is the elementary action in tool-augmented generation.

## Steps

A complete invocation:

1. **Selection.** Agent decides which tool to call among available tools.
2. **Argument synthesis.** Agent generates argument values matching the tool schema.
3. **Emission.** Agent emits the call in the appropriate format (function call JSON, structured text, etc.).
4. **Validation.** Runtime parses and validates against schema.
5. **Dispatch.** Runtime invokes tool implementation.
6. **Execution.** Tool performs work, possibly producing side effects.
7. **Return.** Result returned to runtime.
8. **Integration.** Result placed in agent context for continuation.

Each step has failure modes; all must succeed for the invocation to complete cleanly.

## Failure modes per step

- **Selection.** Wrong tool selected.
- **Argument synthesis.** Wrong arguments, hallucinated arguments.
- **Emission.** Malformed call format.
- **Validation.** Call fails schema validation.
- **Dispatch.** Routing error, tool not found.
- **Execution.** Tool errors, timeouts, exceptions.
- **Return.** Result missing or malformed.
- **Integration.** Result not properly incorporated into reasoning.

These failure modes cascade in tool chains per [tool-error-amplification](../theorems/tool-error-amplification.md).

## Argument hallucination

A persistent failure mode worth special mention:

- Model selects right tool.
- Generates arguments that pass schema validation.
- But arguments are *hallucinated* — references to entities that don't exist, values out of valid range, etc.
- Tool execution fails or returns incorrect results.

Mitigation: schema constraints (enums, ranges), example-driven prompting, post-call validation.

## Synchronous vs asynchronous

- **Synchronous.** Agent waits for result; simplest pattern.
- **Asynchronous.** Tool returns a handle; agent continues; later checks for completion.
  Useful for long-running tools.
- **Streaming.** Tool streams partial results; agent consumes as available.

Most simple agentic systems use synchronous; complex production systems mix.

## Parallel invocation

Modern function-calling APIs support invoking multiple tools in a single turn when independent:

- Reduces latency.
- Better matches problem structure (independent subtasks).
- Requires more sophisticated argument synthesis.

Parallel calls are standard in OpenAI and Anthropic APIs.

## In contemporary AI

Standard practice:

- Function-calling APIs handle steps 3-5 automatically.
- Agentic frameworks scaffold the full loop.
- Observability tools (LangSmith, etc.) trace each step.

## Limits

- **Per-call latency.** Tool calls add real-time delay; chains compound it.
- **Argument hallucination.** Persistent issue; no complete solution.
- **Verification.** Hard to verify the right tool was called with right arguments to achieve right effect.
- **Error recovery.** Recovery requires careful scaffolding; agents rarely recover well alone.

## Status

Standard primitive.
Production-mature.
Continued research on reducing hallucinated arguments and improving error recovery.
