---
type: narrative
status: active
see-also:
  - ../teaching/explanations/tool-use.md
  - ../theorems/tool-augmentation-strict-improvement.md
title: Why tools changed LLM agents
description: Tool use is not an incremental capability for LLMs — it is the substrate that turned them from text generators into agentic systems.
---

# Why tools changed LLM agents

Tool use is not an incremental capability for LLMs — it is the substrate that turned them from text generators into agentic systems.
This narrative collects the structural reasons.

## Before tools: LLMs as text generators

A pure-text LLM:

- Receives a prompt; emits a response.
- Cannot retrieve information beyond training data.
- Cannot perform computation beyond what generation approximates.
- Cannot interact with the external world.
- Is essentially a sophisticated function from text to text.

Useful for: writing, summarizing, answering questions within training distribution, reasoning about provided context.

Not useful for: anything requiring current information, external action, or reliable computation.

## What tools added

Tool augmentation enabled:

- **Real-time information.** Search, retrieval, database queries.
- **Computation.** Arithmetic, code execution, simulation.
- **Action.** Sending messages, modifying systems, triggering external workflows.
- **Multi-step task completion.** Composing tools to achieve goals.
- **Verification.** Testing claims by running code or querying authoritative sources.

These transform what LLMs are *for*.

## The qualitative shift

Per [tool-augmentation-strict-improvement](tool-augmentation-strict-improvement.md), the capability gain is *strict*.
Tasks impossible with pure generation become possible with tools.

But the shift is more than additive.
With tools:

- **The LLM becomes an orchestrator.** Coordinating external systems rather than producing standalone outputs.
- **Reasoning becomes verifiable.** Claims can be tested via tool calls rather than just asserted.
- **Errors become recoverable.** Tools provide feedback enabling correction.
- **Tasks become open-ended.** Rather than completing in a single response, agents iteratively work toward goals.

The agentic paradigm is *constituted* by tool use.

## The ReAct insight

Yao et al.'s key contribution: *interleaving* reasoning and acting.
Pure reasoning hallucinates; pure acting lacks direction; interleaving lets each correct the other.

This is structural, not incidental:

- Reasoning *guides* tool use (decides what to invoke next).
- Tool use *grounds* reasoning (provides evidence for claims).
- Without both, the system loses the loop's corrective power.

ReAct's structure is now universal in agentic systems precisely because the structural insight is deep.

## Why production-ready tools mattered

Vendor function-calling APIs (OpenAI June 2023, then others) were inflection because:

- **Reliability.** Calls are parseable; failures are detectable.
- **Type safety.** Argument types validated.
- **Standardization.** Cross-vendor portability.
- **Tooling.** Frameworks could rely on well-defined protocol.

Without this, tool use stayed in research demos.
With it, production agentic systems became practical.

## The capability-risk co-evolution

Tool augmentation is unique among LLM capability expansions in coupling capability and risk:

- Larger context windows = more capability, modest risk increase.
- Better reasoning = more capability, modest risk increase.
- Tool augmentation = more capability, *substantial* risk increase.

The risk arises because tools can *do things in the world*.
Pure generation can produce harmful text; tools can produce harmful actions.

This co-evolution drives the safety conversation in agentic AI: capability and safety must scale together or risk outpaces ability to manage.

## Why "agent" became a buzzword

Pre-tools: "AI agent" referred to RL agents in classical AI literature.

Post-tools: "AI agent" became synonymous with "tool-using LLM."
The semantic shift reflects that LLM tool use produces something agent-like in the classical sense — situated systems that act in environments to achieve goals.

This is why "agent" is now everywhere in industry discourse: tool use made LLMs agentic in the RL sense.

## What changed for users

End users experience tool-augmented LLMs as qualitatively different:

- **From "answers" to "actions."** Asks become task completions.
- **From static to dynamic.** Conversations involve real-time information.
- **From single-turn to multi-turn workflows.** Agents persist across long task arcs.
- **From advice to execution.** Agents *do* rather than just *suggest*.

The user mental model shifts accordingly.

## What changed for developers

Developers building on LLMs now think about:

- **Tool registries.** What capabilities to expose.
- **Tool schemas.** How to describe them.
- **Action traces.** How to observe and debug.
- **Side effects.** How to constrain.
- **Verification.** How to test agent behavior.

Tool-using systems require different engineering than pure-generation systems.
Most LLM application engineering is now agent engineering.

## What changed for AI safety

Tool use changed the safety landscape:

- **From content concerns to action concerns.** What the AI does, not just what it says.
- **From single-response to multi-step trajectories.** Long-horizon behavior matters.
- **From prompt injection to action injection.** Adversaries can target the agent's actions.
- **From abuse mitigation to capability bounding.** What can the agent be made to do?

Tool-using systems raise risk classes that pure generation does not.
Safety frameworks have evolved accordingly (constitutional AI for action, capability evaluations, action-level oversight).

## In summary

Tool use isn't a feature added to LLMs; it is the substrate that makes LLMs into agents.
The strict capability gain, the qualitative shift in user and developer mental models, the new safety landscape, and the dominant paradigm of contemporary AI all trace to this substrate.
Understanding tool use is understanding what contemporary AI agents are.
