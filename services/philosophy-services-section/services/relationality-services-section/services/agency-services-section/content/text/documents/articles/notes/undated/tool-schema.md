---
type: object
class: contemporary
status: active
depends-on:
  - tool.md
see-also:
  - teaching/explanations/function-calling.md
references:
  - references/openai-function-calling2023.md
title: Tool schema
description: A tool schema is the typed declaration of a tool's name, parameters, return shape, and metadata.
---

# Tool schema

A **tool schema** is the typed declaration of a tool's name, parameters, return shape, and metadata.
It is the *interface* between the LLM agent and the tool's implementation: the agent reasons about and emits calls in terms of the schema; the runtime parses calls against the schema and dispatches to the implementation.

## Components

A complete tool schema typically declares:

- **Name.** Function-callable identifier.
- **Description.** Natural-language explanation of what the tool does.
- **Parameters.** For each: name, type, required/ optional, default, description, constraints.
- **Return type.** Shape of successful return.
- **Error types.** Possible error responses.
- **Examples.** Concrete invocation examples.

Modern schemas use JSON Schema (OpenAI) or XML/JSON hybrids (Anthropic) as the underlying format.

## What good schemas provide

- **Reliable parsing.** Calls match a known structure; malformed calls are easily detected.
- **Type validation.** Parameter types and constraints enforced at parse time.
- **Selection signal.** Descriptions guide model in selecting the right tool.
- **Documentation.** Schema *is* the documentation for agent and human developer alike.
- **Testability.** Mock implementations matching schema enable testing without real backend.

## Schema design heuristics

From production experience:

- **Names should be verbs.** `get_user_email` not `user_email`.
- **Descriptions should explain *when* to use.** Not just what the function does.
- **Parameter descriptions matter.** Models hallucinate arguments when descriptions are vague.
- **Examples beat verbose descriptions.** Concrete invocations clarify usage.
- **Avoid optional+default for important parameters.** Models may omit them.
- **Consistent vocabulary.** `user_id` everywhere, not `user`/`uid`/`user_id` mixed.

Bad schemas tank tool-call accuracy regardless of model quality.

## Schema as contract

The schema is a *contract* between agent and implementation:

- Agent commits to emitting calls matching the schema.
- Implementation commits to handling all valid calls.
- Runtime validates and routes.

Violations of either side are bugs.

## Schema vs implementation

Critical distinction:

- **Schema** is the *interface specification*.
- **Implementation** is the *actual behavior*.

Schemas don't enforce semantic correctness — a tool implemented to do the wrong thing while matching its schema is hard to detect from the agent's side.

## Limits

- **Effect-class metadata absent.** Standard schemas don't natively express read-only/mutating/ irreversible classifications.
- **Cross-tool semantics absent.** Schemas describe individual tools, not how they compose.
- **Vendor differences.** Subtle differences in JSON Schema interpretation across vendors.
- **Schema drift.** Tool implementations evolve; schemas need maintenance to match.

## Status

Standard practice.
JSON Schema (or close variants) is the dominant format.
Schema design is an emerging craft with established heuristics.
