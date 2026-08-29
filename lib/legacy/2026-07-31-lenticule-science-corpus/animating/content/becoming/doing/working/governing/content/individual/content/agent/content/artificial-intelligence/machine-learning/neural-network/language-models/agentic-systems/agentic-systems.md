---
title: "Agentic Systems"
description: "AI systems that perceive their environment, plan multi-step actions, use tools, and produce effects in the world — as distinguished from single-turn generative models."
keywords: ["agentic-systems", "artificial-intelligence", "agents"]
---

# Agentic Systems

An agentic system is an AI system that does more than respond to a single prompt. It perceives its environment, maintains state across steps, selects and executes tools, and produces effects in the world — files written, APIs called, messages sent, decisions made. The distinction from a simple generative model is that an agent acts in a loop rather than producing a single output.

The minimal architecture is an LLM paired with a set of tools and a loop: the model reads its context, decides whether to call a tool or produce a final response, receives the tool result back into context, and continues. What makes this powerful is also what makes it dangerous: the model's outputs become inputs to systems with real effects.

**Agent workflows** organize multi-step task execution — how steps are sequenced, how context is managed across a long horizon, and how the agent recovers from errors. This includes patterns like chain-of-thought, react-style tool use, and orchestration of subagent fleets.

**Agent roles** define what kind of work an agent does within a system: researcher, writer, critic, orchestrator, executor. Role differentiation matters because a single prompt cannot efficiently handle all tasks — specialization allows better prompting and clearer evaluation.

**Agent skills** are reusable, composable capabilities that agents can be given: how to search a corpus, how to read code, how to draft a document in a particular style. In this library, skills are represented as structured documents that agents can load into context.

Key concepts that appear throughout this domain:

- **Context window** — the hard constraint that shapes everything else; see [context-window](../language-models/archive/context-window.md)
- **Tool use** — how agents call external functions and receive their results
- **Memory** — how agents maintain relevant information across steps; see [memory](../memory/)
- **Hallucination** — the risk that agent outputs are confident but false; see [hallucination](../hallucination/archive/hallucination.md)
- **Human-in-the-loop** — the design pattern of keeping a human in the approval path for consequential actions
