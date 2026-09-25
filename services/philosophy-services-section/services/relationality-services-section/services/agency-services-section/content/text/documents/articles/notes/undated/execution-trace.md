---
type: object
class: observability
status: active
depends-on:
  - teaching/explanations/agentic-system.md
  - ../objects/tool-call.md
  - ../objects/agent-session.md
see-also:
  - teaching/explanations/delegation-chain.md
  - ../morphisms/tool-invocation.md
  - ../theorems/accountability-chain-must-be-total.md
  - ../terms/agent-observability.md
  - ../texts/accountability-tracing-in-multi-agent-systems.md
references:
  - references/masft2025.md
  - references/anthropic2024.md
title: Execution trace
description: The execution trace of an agent session is the complete ordered log of all agent invocations and tool calls that occurred during the session.
---

# Execution trace

The execution trace of an agent session is the complete ordered log of all agent invocations and [tool calls](tool-call.md) that occurred during the session.
It is the primary evidentiary artifact for accountability tracing, debugging, and audit.

## Contents of a complete trace

A complete execution trace records, for each step in the session:

1. **Agent identity** — which agent (in a multi-agent system) produced this step.
2. **Step number** — the position of this step in the session's execution order.
3. **Model input** — the conversation state (messages plus tool results) the model received as input.
4. **Model output** — the model's response: either free text or a structured tool call request.
5. **Tool call** (if any) — the function name and arguments.
6. **Tool result** (if any) — what the tool returned.
7. **Timestamp** — when the step occurred.
8. **Decision rationale** (optional) — the model's reasoning trace, if chain-of- thought or extended thinking is enabled.

A trace that omits any of these fields is partial and limits the quality of accountability tracing: missing tool call arguments make it impossible to assess whether the call was authorized; missing timestamps make it impossible to reconstruct execution order in concurrent multi-agent systems.

## Completeness and accountability

The central accountability-tracing question — "Did the principal have sufficient visibility into the agent's operation that the error should have been caught?" — can only be answered from a complete trace.
The trace shows what the agent saw at each step (observations), what it decided to do (tool calls), and what the results were (tool results).
Without a complete trace, accountability tracing produces only probabilistic assessments rather than definitive ones.

The [accountability-chain-must-be-total](../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/running/content/agent-session/content/theorems/accountability-chain-must-be-total.md) theorem establishes that every outcome must be assigned to a principal.
The execution trace is the operational prerequisite: without it, assignment is impossible.

## Cross-agent trace correlation

In a multi-agent system, each agent produces its own local trace.
Accountability tracing across agents requires correlating these traces: identifying that agent B's step 3 (receiving a malformed input) corresponds to agent A's step 5 (producing the malformed output).
Correlation requires shared identifiers — session IDs, request IDs, or message IDs that appear in both traces at the relevant steps.

The MASFT study (arXiv 2503.13657) found that cascading misinterpretation — one agent's error propagating and amplifying through subsequent agents — was one of the six core inter-agent failure modes.
Cross-agent trace correlation is the diagnostic tool for detecting and locating this failure mode.

## Trace as a checkpoint recovery artifact

A complete execution trace doubles as a recovery artifact for [durable execution](../../../../../../../../../../../engineering-science-services-section/services/computer-science-services-section/services/artificial-intelligence-science-services-section/services/agent-science-services-section/content/text/glossary/terms/durable-execution.md).
A system that has logged every step can, after a crash, replay the trace to the last recorded step and resume from that point.
Frameworks like LangGraph implement this: the trace IS the checkpoint, and recovery is trace replay up to the failure point.
