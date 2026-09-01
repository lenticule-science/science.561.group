---
name: "JSON Schema"
description: "A declarative language for describing the structure, constraints, and validation rules of JSON data — the standard contract format for defining tool interfaces in agentic systems."
domain: computing
enables: tool-use, structured-output
governs: structured-output
instance-of: type-safety
date-created: 2026-03-29
date-updated: 2026-03-29
---

JSON Schema is a declarative language for describing the structure of JSON data. A schema specifies what properties an object must have, what types those properties must be, which are required, what values are permitted, and how nested structures are composed. It is defined as an Internet Engineering Task Force (IETF) draft specification, with the 2020-12 release being the current stable version.

A JSON Schema document is itself JSON. A simple example describing a function call:

```json
{
  "type": "object",
  "properties": {
    "name": { "type": "string" },
    "arguments": {
      "type": "object",
      "properties": {
        "query": { "type": "string" },
        "max_results": { "type": "integer", "minimum": 1 }
      },
      "required": ["query"]
    }
  },
  "required": ["name", "arguments"]
}
```

This schema declares that a valid object must have a `name` (string) and `arguments` (object with a required `query` string and an optional `max_results` integer that must be at least 1).

JSON Schema's relevance to [agentic systems](../../../../services/artificial-intelligence-science-services-section/services/agents-services-section/content/text/glossary/terms/agentic-system.md) is structural. When a language model performs [tool use](../../../../services/artificial-intelligence-science-services-section/services/agents-services-section/content/text/glossary/terms/tool-use.md), the developer provides tool definitions as JSON Schema documents. The schema tells the model what arguments the tool expects, and the model produces a JSON object conforming to that schema. This is the contract that makes tool use reliable: the schema constrains the model's output to valid function calls, and the host application can validate the output before executing it.

The same mechanism underpins:

- **Structured output.** Providers allow developers to specify a JSON Schema for the model's entire response, ensuring outputs conform to a predefined structure regardless of the natural language content.
- **[MCP](../domains/artificial-intelligence/domains/agents/domains/model-context-protocol/index.md) tool definitions.** MCP tools declare their input schemas as JSON Schema, making tool capabilities machine-discoverable.
- **[A2A](../../../../services/artificial-intelligence-science-services-section/services/agents-services-section/content/text/glossary/terms/agent-to-agent-protocol.md) Agent Cards.** Agent capabilities are described using structured JSON documents that follow schema conventions.
- **[PydanticAI](../../../../services/artificial-intelligence-science-services-section/services/agents-services-section/content/text/glossary/terms/pydantic-ai.md) models.** Pydantic models generate JSON Schema automatically, creating tool contracts from Python type annotations.

JSON Schema is not the only schema language (Protocol Buffers, Avro, and XML Schema serve similar purposes in different ecosystems), but it has become the de facto standard for LLM tool interfaces because JSON is the native interchange format of web APIs and LLM providers adopted it first.

## Related terms

- [Tool use](../../../../services/artificial-intelligence-science-services-section/services/agents-services-section/content/text/glossary/terms/tool-use.md) — the mechanism that uses JSON Schema as its contract format
- [Type safety](./type-safety.md) — the broader concept JSON Schema enables at runtime
