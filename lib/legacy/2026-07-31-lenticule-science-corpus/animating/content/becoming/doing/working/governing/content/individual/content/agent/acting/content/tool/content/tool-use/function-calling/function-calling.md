---
type: concept
class: contemporary
status: active
depends-on:
  - tool-use.md
see-also:
  - ../objects/tool-schema.md
references:
  - references/openai-function-calling2023.md
---

# Function calling

**Function calling** is the vendor-supported protocol by which LLMs emit structured tool invocations.
It replaces prompt-engineered tool-call formats with a typed, guaranteed-parseable interface.

## The protocol

In function-calling APIs:

1. **Schema declaration.** The caller registers available functions with the LLM, providing JSON- schema-like declarations (name, parameters, types, descriptions).
2. **Generation.** The model generates either text responses or structured function calls.
3. **Parsing.** Function calls are emitted in a well-defined format that decoders parse reliably.
4. **Execution.** The application executes the function and returns results to the model.
5. **Continuation.** The model continues with results in context.

Function calling formalizes what was previously done through prompt engineering with weaker guarantees.

## Vendors and protocols

- **OpenAI function calling** (2023).
  The first widely-adopted function-calling API; uses JSON schemas.
- **Anthropic tool use.** XML-tagged tool calls in Claude; semantically similar to OpenAI's.
- **Google function calling** in Gemini.
  Comparable protocol with vendor-specific schema conventions.
- **Open-source.** Many open-source LLMs are fine- tuned for function calling with vendor-compatible formats.

## What it enables

Function calling provides:

- **Reliable structured output.** Calls are parseable; malformed calls are rare.
- **Type safety.** Parameter types are declared and validated.
- **Schema-driven UX.** Tools self-document via schemas.
- **Multi-tool selection.** Models choose among registered functions per turn.
- **Standardized integration.** Application code can uniformly handle function calls across vendors.

## Distinguishing function calling from tool use

- **Tool use** is the broader phenomenon — agent invokes external functionality.
- **Function calling** is a *specific protocol* for tool use, with vendor-supported structured I/O.

Tool use predates function-calling APIs (early ReAct implementations used prompt-based tool calls); function calling is now the standard implementation.

## Limits

- **Schema design overhead.** Authoring good schemas takes care; bad schemas degrade tool-call quality.
- **Argument hallucination.** Models can call functions with hallucinated arguments that pass validation but fail semantically.
- **Tool selection from large sets.** Function-calling APIs typically support 10s to 100s of functions; per [selection-cost-bound](../theorems/selection-cost-bound.md), beyond ~100 retrieval is needed.
- **Side-effect classification absent.** Standard schemas don't distinguish read-only from side-effecting tools; safety-critical applications need additional metadata.

## Status

Mature standard in vendor APIs since 2023.
The dominant mechanism for production LLM tool use.
Continues to evolve (parallel function calls, structured outputs, strict mode) but the basic protocol is stable.
