---

name: "Type Safety"
description: "The property of a program or system that guarantees operations are only applied to data of the correct type — preventing a category of errors at compile time or validation time rather than at runtime."
domain: computing
enables: structured-output
governs: tool-use
delivered-via: json-schema, pydantic-ai
date-created: 2026-03-29
---

Type safety is the property of a program or system that guarantees operations are only applied to data of compatible types. A type-safe system prevents you from treating a string as a number, passing three arguments to a function that expects two, or accessing a field that does not exist on a given data structure. The guarantee can be enforced at compile time (static type checking), at runtime (dynamic type checking), or at the boundary between systems (schema validation).

In statically typed languages (Rust, Haskell, TypeScript in strict mode), the type checker verifies type correctness before the program runs. In dynamically typed languages (Python, JavaScript), types are checked at runtime when operations are performed. Python's type annotation system (PEP 484, introduced in Python 3.5) adds optional static type hints that tools like mypy can check, but the Python runtime itself does not enforce them. **Pydantic** bridges this gap: it uses Python type annotations to generate runtime validators that enforce type constraints when data enters the system.

Type safety matters for agentic systems because the boundary between a language model and the host application is inherently type-unsafe. A language model produces text — an untyped string. When that string represents a tool call with specific arguments in specific types, something must verify that the output conforms to the expected structure. A malformed tool call (wrong type, missing field, out-of-range value) propagates silently until it causes a downstream failure.

[PydanticAI](../../../../../../../engineering-science-services-section/services/computer-science-services-section/services/artificial-intelligence-science-services-section/services/agent-science-services-section/services/agent-orchestration-platform-science-services-section/content/text/glossary/terms/pydantic-ai.md) makes type safety load-bearing in agent architecture. When an LLM produces structured output, PydanticAI validates it against a Pydantic model. If validation fails, the validation errors are fed back to the LLM as part of the conversation, and the model retries. The type system does not merely detect errors — it participates in the inference loop, guiding the model toward valid output. This is the type-safety-in-the-loop pattern: the type constraint is not a post-hoc check but an active participant in shaping behavior.

[JSON Schema](../../../../../../../../../public-services-section/services/personal-services-section/services/emsenn-services-section/content/text/glossary/terms/json-schema.md) serves a similar function at a different layer: it defines the structure that tool inputs must conform to, and the model's fine-tuning on schema-conformant outputs is what makes tool use reliable. The combination — JSON Schema defining the contract, Pydantic enforcing it at runtime, and the LLM trained to produce conformant output — creates a type-safe pipeline across the boundary between statistical generation and deterministic execution.
