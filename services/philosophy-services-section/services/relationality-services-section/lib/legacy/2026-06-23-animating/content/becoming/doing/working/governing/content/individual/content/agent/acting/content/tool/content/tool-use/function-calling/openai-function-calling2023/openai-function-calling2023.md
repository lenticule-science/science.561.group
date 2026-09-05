---
type: reference
class: foundational
status: active
authors: ["OpenAI"]
year: 2023
venue: "OpenAI documentation and API release notes (June 2023)"
title: "Function calling and other API updates"
---

# OpenAI 2023 — Function calling

OpenAI.
(2023, June).
Function calling and other API updates.
OpenAI Platform documentation.

The OpenAI API release introducing *function calling* — a vendor-supported protocol for LLMs to emit structured tool invocations.
The protocol provided:

- **JSON-schema declarations** of available functions.
- **Structured call output** in a guaranteed-parseable format.
- **Type validation** of arguments against declared schemas.
- **Multi-tool selection** within a single turn.
- **Consistent integration model** for application developers.

The release was an inflection point for production agentic systems.
Before function calling, tool use relied on prompt engineering with weaker reliability; after, tool calls became reliably parseable and production-ready.

Subsequent OpenAI updates extended the protocol:

- **Parallel function calling** (Nov 2023).
  Multiple tools invoked per turn.
- **Strict mode** (2024).
  Guaranteed schema conformance.
- **Structured outputs** (2024).
  Schema-conformant text outputs beyond just function calls.

The protocol has been adopted in compatible form by Anthropic (tool use), Google (function declarations), and most open-source LLM serving frameworks.
It is now the standard mechanism for production LLM tool use.

The release is technically not a research paper but is arguably more influential on the field than most research papers — it converted an academic concept (tool use) into a production standard.

Cited by: [function-calling](teaching/explanations/function-calling.md), [tool-schema](../objects/tool-schema.md), [from-react-to-tool-use](teaching/explanations/from-react-to-tool-use.md).
