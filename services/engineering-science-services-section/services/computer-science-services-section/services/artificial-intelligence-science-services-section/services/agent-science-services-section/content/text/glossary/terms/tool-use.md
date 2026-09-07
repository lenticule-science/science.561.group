---
aliases:
  - function-calling
  - tool-calling
description: The mechanism by which a language model invokes external functions during a conversation, producing structured output that a host application executes.
identity: tool-use
name: Tool Use
provenance:
  date-created: 2026-03-29
  date-modified: 2026-03-29
relations:
  caller: language-model
  executor: host-application
  contract: function-schema
  output-format: json
  protocol: model-context-protocol
references:
  openai2026functioncalling:
    authors: ["OpenAI"]
    title: "Function calling"
    year: 2026
    publication: "OpenAI API Documentation"
    url: "https://developers.openai.com/api/docs/guides/function-calling"
  modelcontextprotocol2025tools:
    authors: ["Model Context Protocol"]
    title: "Tools"
    year: 2025
    publication: "Model Context Protocol Specification"
    url: "https://modelcontextprotocol.io/specification/2025-06-18/server/tools"
---
Tool use is the mechanism by which a language model acts on its environment. The model produces structured output — a JSON object specifying a function name and arguments — and a host application executes the function. The result comes back to the model in the next conversation turn. The model decides what to call and with what arguments. The host application decides whether to execute. Neither has access to the other's internals.

Three parties are involved. The developer provides function schemas — name, description, parameter types — as part of the API request. The model, trained on examples of when and how to invoke functions, decides whether a call is appropriate given the conversation so far. The host application receives the structured output, runs the function, and returns the result.

The mechanism has five steps. First, the developer includes schemas alongside the conversation. Second, the model decides whether to call a function. Third, instead of generating free text, the model emits a structured object identifying the function and its arguments. Fourth, the host application executes with the provided arguments. Fifth, the result returns to the model, which incorporates it into its response.

The contract between model and host is a function schema. The schema specifies what functions exist, what arguments they accept, and what types those arguments have. JSON Schema is the format every major provider uses for this contract. The model cannot call functions that are not in the schema. The schema is the boundary of what the model can do.

A tool declaration is distinct from a tool request and an execution. The
declaration supplies a name, description, and input schema; the model emits a
request against that declaration; and the receiver validates and authorizes any
execution. A tool result may report a tool error, whereas a protocol-level
error is a failure of the surrounding request/response exchange
[@openai2026functioncalling; @modelcontextprotocol2025tools]. A model request
does not itself establish that an external effect occurred.

Token use, elapsed time, request counts, provider quotas, and account-window
limits are measurements of a particular execution or provider response. They
are not values supplied by a portable tool declaration, and must remain
separate from a tool result unless a receiver records them as observations.

Tool use is a single invocation. One function, one call, one result. Sequences of tool calls — where the output of one call feeds into the next — are the province of orchestration. Tool use is the atom. Orchestration is the molecule. A system where the model selects and sequences its own tool calls is an agentic system. A system where the developer specifies the sequence is a workflow. The tool use mechanism is the same in both cases; what differs is who controls the order.
