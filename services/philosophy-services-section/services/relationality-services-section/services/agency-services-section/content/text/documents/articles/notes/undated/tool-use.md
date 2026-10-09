---
title: "Tool use"
component-of: agents
type: theory
class: engineering-theory
status: active
discipline: The formal study of agents augmented with external tools — function-calling APIs, code interpreters, browsers, computer-use interfaces, retrieval systems, and arbitrary external services. The theory comprises the ReAct interleaving paradigm (Yao et al. 2022), Toolformer-style learned tool invocation (Schick et al. 2023), tool-selection from large registries (Gorilla, ToolLLM), the operational structure of action traces and effect propagation, and the safety question of bounding tool-use side effects.position: >
  Subtheory of [agents](../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/acting/content/tool/_index.md) studying the
  substructure that distinguishes tool-using agents from
  agents that only emit text. Where the parent agents
  theory analyzes the *agentic* condition (action,
  planning, persistent state), tool-use theory analyzes
  *what kinds of action* are available and how they
  compose. Closely connected to
  [memory](../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/acting/content/memory/_index.md) (tool calls retrieve
  external state); the chain-error analysis below
  connects to broader robustness and reliability
  concerns in agentic systems.
description: The tool-use theory gives formal structure to LLM agents augmented with external tools.
---

The tool-use theory gives formal structure to LLM agents augmented with external tools.
It answers four questions:

**What is a tool?** A function with a typed schema, an invocation interface, and an effect on environment state.
Tools generalize function-call APIs, REPL evaluators, browsers, and computer-use interfaces under one formalism.

**How do agents select and invoke tools?** From small registries, by direct prompting; from large registries, by retrieval-then-selection; from learned policies, by fine-tuning on tool-call demonstrations.
Each has characteristic costs and failure modes.

**How do tool-call sequences compose?** Tools chain into *action traces*; intermediate failures propagate; side effects accumulate.
The composition algebra is non-trivial — chains can amplify errors, leak information, or produce irreversible effects.

**What's the safety structure?** Tool use expands the action space; capability comes with side-effect risk.
Bounding tool-use side effects is a central open problem for deployed agentic systems.
