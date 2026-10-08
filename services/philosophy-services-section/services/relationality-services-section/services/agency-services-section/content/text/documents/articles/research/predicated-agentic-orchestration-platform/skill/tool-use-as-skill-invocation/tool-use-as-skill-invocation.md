---
type: concept
class: agent
status: sketch
depends-on: [skill, skill-invocation, dispatch, schick-et-al2023, openai-agents-docs, anthropic-agent-loops]
see-also: [scratchpad-as-session-memory-projection, formality-layer]
title: Tool use as skill invocation
description: "The platform's reformulation of the LLM-era tool use / function calling discipline (Toolformer, OpenAI function calling, Anthropic tool use): an LLM's tool call is a substrate-content skill invocation, with the tool's schema becoming the…"
---

# Tool use as skill invocation

The platform's reformulation of the LLM-era *tool use* / *function calling* discipline ([Toolformer](schick-et-al2023/schick-et-al2023.md), [OpenAI function calling](../../openai-agents-docs/openai-agents-docs.md), [Anthropic tool use](../../anthropic-agent-loops/anthropic-agent-loops.md)): an LLM's tool call is a substrate-content [skill invocation](../skill-invocation/skill-invocation.md), with the tool's schema becoming the skill's substrate-recorded preconditions and shape, and the tool's result becoming substrate-content typed by the value-domain.

The classical view: an LLM agent's tool use is a model-internal capability — the model emits a structured tool-call object naming a function and arguments; the application executes the function and returns the result; the model continues with the result in its context.
The tool call is a *capability of the model* mediated by the application's tool-router; the result is interpolated back into the prompt buffer.

The platform's reformulation: each tool call is a [skill invocation](../skill-invocation/skill-invocation.md) — a substrate operator running with the agent as caller, the skill as callee, the arguments as input predications, and the result as output predications.
Three structural identifications:

- **Tool schema as substrate shape.** The JSON-schema-typed parameter list of an OpenAI / Anthropic tool corresponds to the substrate's [shape](../../scope/shape/shape.md) discipline applied to the skill's input.
  The substrate records the shape; dispatch checks that the agent's available context satisfies the shape before invoking the skill; per [conformance](../../teaching/explanations/conformance.md), the input is verified at the substrate level rather than relying on the LLM to produce well-formed arguments.
- **Tool selection as dispatch ranking.** The model's choice of *which tool to call* corresponds to dispatch's ranking of eligible skills against the agent's current context.
  In a fully LLM-mediated agent, the LLM's selection is a hint to dispatch (the model proposes; dispatch confirms against substrate state and authorization).
  In a non-LLM-mediated agent, dispatch's ranking determines selection directly.
  The same skill-invocation discipline covers both.
- **Tool result as typed predication.** The classical-LLM-agent pattern interpolates tool results as text in the prompt buffer; the substrate makes results substrate-content predications typed by the value-domain.
  A tool that returns a list of search results admits substrate predications about each result; the predications are queryable by other agents, federation-replicable, and persist beyond the calling agent's session.

Three engineering consequences:

- **Authorization is checked by the substrate, not by the application's tool-router.** Per [authorization](../../governance/authorization/authorization.md), every skill invocation composes against the agent's capability fiber.
  An agent without the appropriate capability predications cannot invoke the skill, even if the LLM emits the tool call.
  The substrate-level authorization is uniform across LLM-mediated and non-LLM-mediated invocations.
- **Tool-call provenance is built in.** Every skill invocation produces a witness recording the agent, the skill, the arguments, the result, and the substrate state at invocation.
  Auditing tool use is a substrate traversal; reconstructing what the agent did is event-log replay.
- **Self-tuning skill catalogs through formality-layer micromodels.** Toolformer's contribution — that LLM tool use is *learnable* from past examples — propagates into the platform's [formality-layer](../../scope/formality-layer/formality-layer.md) discipline: substrate-content micromodels trained on the substrate's own dispatch and skill-invocation logs replace frontier-model invocations with cheaper substrate-content classifiers for routine cases.
  The substrate's self-tuning skill catalog is the engineering realization of Toolformer's pattern at the substrate level rather than at the model-fine-tuning level.

The concept is *sketch* status: it names the relationship between LLM-era tool use and the platform's skill-invocation discipline so the [upstream-llm-agentic](../../upstream-llm-agentic/upstream-llm-agentic.md) narrative has an atomized referent.
A theorem-level statement — that any tool-augmented LLM-agent loop can be embedded as a substrate session with corresponding skill, shape, and dispatch entities — is left for follow-up work.
