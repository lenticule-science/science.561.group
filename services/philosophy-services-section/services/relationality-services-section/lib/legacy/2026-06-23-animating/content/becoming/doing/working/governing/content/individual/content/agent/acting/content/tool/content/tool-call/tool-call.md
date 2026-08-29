---

title: "Tool Call"
description: "The atomic unit of agent-environment interaction — a structured invocation of a named function with parameters, executed by the runtime and returning a result to the model."
defines: Tool Call
domain: agents
extends: tool-use
requires: large-language-model
acts-on: external-environment
governed-by: permission-model
produces: tool-result
date-created: 2026-03-30
aliases:
  - Tool Call
  - tool call
  - function call
  - tool invocation
references:
  - id: anthropic-tool-use
    type: document
    title: Tool use with Claude
    author:
      - literal: Anthropic
    container-title: Claude API Docs
    issued:
      - year: 2025
    URL: https://docs.anthropic.com/en/docs/build-with-claude/tool-use/overview
---

A tool call is the atomic unit of interaction between an AI [agent](./agentic-system.md) and its environment.
The model generates a structured request — a tool name and a set of parameters conforming to a schema — and the host runtime executes the request against the environment and returns a result.
The model then reasons about the result and may issue further tool calls.
This call-observe-reason-call loop is the basic rhythm of [agentic](./agentic-system.md) behavior.

A tool call is distinct from [tool use](./tool-use.md) as a capability: tool use is the model's ability to generate tool calls; a tool call is a single instance of that ability being exercised.
The relationship is analogous to "language" (capability) versus "utterance" (instance).

The structure of a tool call is fixed across providers and protocols:

1. **Name** — identifies which tool to invoke (e.g., `Read`, `Bash`, `Edit`)
2. **Parameters** — a JSON object conforming to the tool's input schema
3. **Execution** — the runtime (not the model) performs the action
4. **Result** — the output is returned to the model as a message

The model never executes a tool call directly.
The runtime mediates: it validates the parameters against the schema, checks permissions, executes the call, and returns the result.
This separation between intent (the model's generated request) and execution (the runtime's action) is what makes [permission models](../../software/terms/permission-model.md) and [hooks](../../software/terms/hooks.md) possible — they intercept the call at the runtime layer.

In [Claude Code](../../software/terms/claude-code.md), tool calls are the events that [hooks](../../software/terms/hooks.md) attach to: PreToolUse fires before execution, PostToolUse fires after.
In the [Model Context Protocol](./model-context-protocol.md), tool calls are JSON-RPC requests from the MCP client to the MCP server.
In both cases, the structure is the same: name, parameters, execute, result.
