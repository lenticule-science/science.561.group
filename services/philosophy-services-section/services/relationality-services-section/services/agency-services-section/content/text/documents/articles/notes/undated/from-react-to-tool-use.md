---
type: narrative
status: active
see-also:
  - ../teaching/explanations/tool-augmented-generation.md
  - ../teaching/explanations/function-calling.md
  - ../teaching/explanations/computer-use.md
title: From ReAct to tool use
description: The arc from ReAct's interleaved reasoning-and-acting to vendor function-calling APIs to computer use traces a three-year evolution that transformed LLMs from text generators into agentic systems.
---

# From ReAct to tool use

The arc from ReAct's interleaved reasoning-and-acting to vendor function-calling APIs to computer use traces a three-year evolution that transformed LLMs from text generators into agentic systems.

## ReAct (Yao et al. 2022)

Before ReAct, two paradigms dominated:

- **Pure reasoning** (Chain-of-Thought).
  Model reasons step-by-step in text but does not act.
- **Pure acting** (early agents).
  Model emits actions but does not reason about them.

Yao et al. proposed *interleaving*: thought → action → observation → thought → ...
The result outperformed both pure paradigms on knowledge-intensive and decision-making tasks.

ReAct established the *paradigm* — the loop structure underlying essentially all subsequent agent architectures.

## The early agent frameworks (2022-2023)

ReAct's structure was implemented in increasingly elaborate frameworks:

- **LangChain** (Oct 2022).
  Generalized scaffolding for tool-using agents.
- **AutoGPT** (Mar 2023).
  Autonomous goal decomposition and tool use.
- **BabyAGI, AgentGPT, etc.** Variations on the pattern.

These were *prompt-engineered* — tools described in prompts, calls emitted as text, results parsed heuristically.
Brittle but proof-of-concept.

## Toolformer (Schick et al. 2023)

In parallel, Toolformer demonstrated tool use could be *learned*: a self-supervised training procedure fine-tuned models to insert tool calls during generation when useful.
Not just prompted — trained.

This was the first compelling demonstration that tool use could be a *first-class capability* of the model rather than an afterthought.

## Function calling (OpenAI June 2023)

OpenAI introduced function calling as a vendor API: JSON-schema declarations, structured call format, guaranteed parseability.
The protocol handled what prompt-based tool use did unreliably.

This was the inflection point: tool use became *production-ready* for the first time.
Function calling quickly became standard — Anthropic's tool use, Google's function declarations, and many open-source models adopted compatible formats.

## Specialized tool models (2023)

In parallel, models trained specifically for tool use emerged:

- **Gorilla** (Patil et al. 2023).
  Trained on massive API documentation; selects from thousands of APIs.
- **ToolLLM / ToolBench** (Qin et al. 2023).
  16,000+ APIs from RapidAPI; demonstrated tool use at scale.
- **HuggingGPT** (Shen et al. 2023).
  Orchestrates ML models as tools.

These showed tool selection from large registries was tractable with appropriate training.

## The retrieval turn

As registries grew, fitting all tools in prompt became infeasible.
Retrieval-augmented selection emerged: embed tool descriptions, retrieve top-$k$ for selection.
Standard practice for medium-large registries.

This decoupled registry size from prompt cost — enabling agents to operate against thousands of tools without prompt blow-up.

## Code interpreter (mid-2023)

OpenAI's Code Interpreter (renamed Advanced Data Analysis) introduced sandboxed Python execution as a tool for ChatGPT.
The capability gain was qualitative: arbitrary computation became available.

Per [tool-use-expressivity](tool-use-expressivity.md), code interpreter is the most consequential single tool — many other tools become redundant when code execution is available.

## Computer use (Anthropic, October 2024)

Anthropic released Claude with Computer Use: direct keyboard/mouse/screen control of arbitrary software.
The capability extended tool use to *any* software with a UI — vastly expanding action space and risk surface.

OpenAI Operator (2025) and Google Project Mariner followed.

This was the *next inflection point*: agents transitioned from "tools through APIs" to "tools through UIs," addressing software without modern API access.

## Where the arc points

The trajectory across three years:

- **2022.** Prompt-engineered tool use; brittle.
- **2023.** Standardized function calling; production- ready for API tools.
- **2024.** Computer use; UI-level action.
- **2025+.** Standardized computer use; broader deployment; more sophisticated safety.

The pattern: each year extends the action space qualitatively, with corresponding safety mechanisms catching up.

## What stayed constant

Despite the changes:

- **The ReAct loop.** Thought → action → observation.
  Universal.
- **Tool schemas.** Typed declarations of capability.
  Universal.
- **Selection problems.** Registry size always matters.
- **Side-effect concerns.** Always central to safety.
- **Composition difficulty.** Long chains always brittle.

The substructure is stable; the action space expanded.

## Lessons

- **Standardization matters.** Vendor APIs consolidating prompt-engineered patterns made tools production-ready.
- **Capability comes with risk.** Each capability gain introduced new safety needs.
- **Tools are infrastructure.** Tool registries, retrieval, and gating are foundational infrastructure for agentic systems.
- **The action space keeps expanding.** Future capability gains likely extend the trajectory further.
