---
title: "Tool Use"
description: "The mechanism by which a language model invokes external functions during a conversation, producing structured output that a host application executes."
aliases: [function-calling, tool-calling]
caller: language-model
executor: host-application
contract: function-schema
output-format: json
protocol: model-context-protocol
date-created: 2026-03-29
date-updated: 2026-03-29
---

Tool use is the mechanism by which a language model acts on its environment.
The model produces structured output — a JSON object specifying a function name and arguments — and a host application executes the function.
The result comes back to the model in the next conversation turn.
The model decides what to call and with what arguments.
The host application decides whether to execute.
Neither has access to the other's internals.

Three parties are involved.
The developer provides function schemas — name, description, parameter types — as part of the API request.
The model, trained on examples of when and how to invoke functions, decides whether a call is appropriate given the conversation so far.
The host application receives the structured output, runs the function, and returns the result.

The mechanism has five steps.
First, the developer includes schemas alongside the conversation.
Second, the model decides whether to call a function.
Third, instead of generating free text, the model emits a structured object identifying the function and its arguments.
Fourth, the host application executes with the provided arguments.
Fifth, the result returns to the model, which incorporates it into its response.

The contract between model and host is a function schema.
The schema specifies what functions exist, what arguments they accept, and what types those arguments have.
JSON Schema is the format every major provider uses for this contract.
The model cannot call functions that are not in the schema.
The schema is the boundary of what the model can do.

Tool use is a single invocation.
One function, one call, one result.
Sequences of tool calls — where the output of one call feeds into the next — are the province of orchestration.
Tool use is the atom.
Orchestration is the molecule.
A system where the model selects and sequences its own tool calls is an agentic system.
A system where the developer specifies the sequence is a workflow.
The tool use mechanism is the same in both cases; what differs is who controls the order.
