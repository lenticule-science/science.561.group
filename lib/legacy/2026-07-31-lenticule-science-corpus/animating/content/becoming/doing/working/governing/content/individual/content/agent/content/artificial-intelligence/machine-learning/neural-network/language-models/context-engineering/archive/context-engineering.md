---

title: "Context Engineering"
description: "The discipline of designing the complete information environment a language model receives — system prompts, retrieved documents, tool definitions, conversation history, and instruction files — to maximize task performance within the context window budget."
defines: Context Engineering
domain: artificial-intelligence
extends: system-prompt
optimizes: context-window
governs: system-prompt, agents-md, soul-md
requires: token
contains: retrieval-augmented-generation
optimized-by: agent-self-improvement
date-created: 2026-03-29
---

Context engineering is the discipline of designing the complete information environment a [language model](../../on-device-inference/terms/large-language-model.md) receives — [system prompts](./system-prompt.md), retrieved documents, [tool](theories/agents/terms/tool-use.md) definitions, conversation history, and instruction files — to maximize task performance within the [context window](./context-window.md) budget. The term became established in **June 2025** when Shopify CEO Tobi Lutke and former OpenAI researcher Andrej Karpathy publicly endorsed it. Lutke described it as "the art of providing all the context for the task to be plausibly solvable by the LLM." Gartner defines it as "designing and structuring the relevant data, workflows and environment so AI systems can understand intent, make better decisions and deliver contextual, enterprise-aligned outcomes."

Context engineering supersedes prompt engineering. Prompt engineering focuses on the text of instructions — word choice, formatting, few-shot examples. Context engineering focuses on the entire information environment: what information reaches the model, in what order, at what token cost, and through what mechanisms (direct inclusion, retrieval, tool calls, instruction files).

### Why order matters

Research on context window utilization documents a "lost in the middle" problem: model accuracy is highest when relevant information appears at the beginning or end of the context, with over 30% accuracy drop for information placed in the middle. This produces a U-shaped attention curve. In [agentic systems](theories/agents/terms/agentic-system.md), this means the placement of instructions, tool definitions, and retrieved documents within the context window directly affects output quality — the same information in a different position produces measurably different results.

### Why length matters

As instruction count increases, instruction-following quality decreases. A focused 50-line instruction file outperforms a 1,000-line file because models have limited instruction-following capacity — additional instructions dilute attention to earlier ones. A February 2026 study of 138 coding tasks found that LLM-generated context files (the kind produced by automated `/init` commands) decreased agent success rates by approximately 0.5% compared to no context file at all. Human-written, curated context files performed better than auto-generated ones. Stale context files — instructions describing a codebase that has since changed — actively degrade performance.

### Application to agent instruction files

[AGENTS.md](theories/agents/terms/agents-md.md), [CLAUDE.md](theories/agents/terms/agents-md.md), and [SOUL.md](theories/agents/terms/soul-md.md) are context engineering artifacts. Their content is injected into the model's context window and competes for [tokens](./token.md) with the actual task. Context engineering principles apply directly:

- Keep instruction files short and specific to observed problems
- Place the most critical constraints first (identity before procedures before edge cases)
- Remove stale instructions that describe outdated state
- Prefer structured formats (lists, tables) over prose for procedural instructions
- Measure the token cost of instruction files against the available context budget

### Relationship to retrieval

Context engineering includes decisions about what information to retrieve and what to include directly. [RAG](./retrieval-augmented-generation.md) is a context engineering strategy: retrieve relevant documents on demand rather than including everything upfront. Tool definitions are another: the model sees tool schemas in its context and decides which to invoke. The context engineer's job is to design the retrieval, inclusion, and ordering strategy that maximizes task performance per token spent.

