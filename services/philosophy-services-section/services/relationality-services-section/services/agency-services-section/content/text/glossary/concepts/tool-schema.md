---
type: concept
class: foundational
status: active
depends-on:
  - environmental-action.md
see-also:
  - ../objects/action-space.md
  - ../objects/tool-call.md
  - ../morphisms/tool-invocation.md
  - ../theorems/tool-schema-bounds-action-space.md
  - ../terms/tool-use.md
  - ../terms/model-context-protocol.md
references:
  - references/schick2023.md
  - references/anthropic2024.md
title: Tool schema
description: A tool schema is the formal contract defining what function an agent may invoke, what argument types it accepts, and what result type it returns.
---

# Tool schema

A tool schema is the formal contract defining what function an agent may invoke, what argument types it accepts, and what result type it returns.
Tool schemas are the boundary between the agent's reasoning and external execution: the agent can only call functions with schemas provided to it, and the schema determines what arguments are structurally valid.

## Structure of a tool schema

A tool schema specifies:

- **Name.** A unique identifier for the function.
- **Description.** Natural-language explanation of what the function does, consumed by the model to decide when and whether to call it.
- **Input schema.** A JSON Schema object specifying parameter names, types, required vs. optional, and any additional constraints.
- **Output type.** What the function returns (often implicit: all tool results return to the model as a text observation).

JSON Schema is the industry-standard format.
Every major provider (Anthropic, OpenAI, Google, Mistral) uses JSON Schema for tool parameter definitions.

## Schemas as authority grants

Tool schemas function as authority grants: by including a schema in the agent's context, the operator grants the agent the authority to invoke that function.
Functions not in the schema cannot be called.
The schema is therefore not merely a technical definition but a governance artifact: it bounds the agent's action space.

This is the content of [tool-schema-bounds-action-space](../../documents/articles/notes/undated/tool-schema-bounds-action-space.md): the agent's [action space](../../documents/articles/notes/undated/action-space.md) at any step is exactly the set of tool schemas provided at that step.

## Dynamic toolsets

Schemas need not be static.
Frameworks including PydanticAI and AutoGen support dynamic toolsets: the set of schemas available to an agent changes during execution based on context.
An agent might start with a read-only toolset and acquire write-capable schemas after passing a validation step.
Dynamic toolsets require careful management: the action space changes as the conversation progresses, and accountability for what schemas are available at each step belongs to the system designer.

## Protocol standardization

The Model Context Protocol (MCP) standardizes the transport for tool schemas: an MCP server exposes tool schemas and implementations; an MCP client (the agent framework) discovers and invokes them.
MCP separates the schema definition from the agent runtime: changing the implementation of a tool does not require changing the agent's code, only the MCP server.
As of early 2026, MCP had 5,800+ servers and 97M+ monthly SDK downloads, making it the de facto standard for tool schema distribution.
