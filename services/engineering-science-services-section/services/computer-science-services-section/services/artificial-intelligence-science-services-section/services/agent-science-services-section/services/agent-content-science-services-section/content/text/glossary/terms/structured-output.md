---
id: structured-output
description: "Output from a language model that conforms to a predefined schema — JSON, typed records, or other machine-parseable formats — rather than free-form text."
aliases: [structured outputs]
produced-by: language-model
schema-format: json-schema
enables: tool-use
enforcement: schema-guided-decoding, post-hoc-validation, fine-tuning
validated-by: pydantic-ai
date-created: 2026-03-29
date-updated: 2026-03-29
---

Structured output is output from a [large language model](../../../../../../../../../on-device-inference-services-section/content/text/glossary/terms/large-language-model.md) that conforms to a predefined schema — a [JSON Schema](../../../../../../../../../../content/text/glossary/terms/json-schema.md), a typed record, or another machine-parseable format — rather than free-form text. The model generates text that happens to be valid JSON (or XML, or YAML) because it has been [fine-tuned](../../../../../../../../content/text/glossary/terms/fine-tuning.md) on examples of schema-conformant output and, in some implementations, because the decoding process constrains token selection to only those tokens that maintain schema validity.

Structured output is what makes [tool use](../../../../../../content/text/glossary/terms/tool-use.md) work. When a model calls a tool, it produces a JSON object specifying the function name and arguments. That object must conform to the tool's input schema — correct field names, correct types, required fields present. If the output is malformed, the tool call fails. Structured output turns a text generator into a system that can interface with typed APIs.

### Implementation approaches

**Schema-guided decoding.** The provider constrains the model's token sampling at each step to only emit tokens that produce schema-valid output. OpenAI's "Structured Outputs" mode (August 2024) and Anthropic's tool use both implement this. The model cannot produce invalid JSON because invalid tokens are masked during generation. This guarantees conformance but adds latency.

**Post-hoc validation with retry.** The model generates output freely, and a validator checks it against the schema afterward. If validation fails, the errors are fed back to the model and it tries again. [PydanticAI](../../../../../agent-orchestration-platform-science-services-section/content/text/glossary/terms/pydantic-ai.md) uses this approach: Pydantic models validate the output, and validation errors become part of the next prompt. This is more flexible (works with any model) but does not guarantee first-attempt conformance.

**Fine-tuning.** Models are trained on datasets containing schema-conformant outputs to increase the probability of valid generation without runtime constraints. All major providers fine-tune their models for JSON output; open-weight models vary in quality.

These approaches compose: a model can be fine-tuned for JSON output, constrained during decoding to a specific schema, and validated post-hoc with retry as a safety net.

### Scope

Structured output extends beyond tool use. It applies to any case where an application needs machine-readable model output: extracting entities from text into typed records, classifying inputs into predefined categories, generating API payloads, or producing configuration files. In [agentic systems](../../../../../../content/text/glossary/terms/agentic-system.md), structured output is the interface between the statistical text generator and the deterministic execution environment.
