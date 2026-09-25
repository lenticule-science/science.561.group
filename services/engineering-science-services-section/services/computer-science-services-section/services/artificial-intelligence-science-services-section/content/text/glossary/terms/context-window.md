---
name: "Context Window"
description: "The maximum number of tokens a language model can process in a single interaction — the hard constraint that shapes agent architecture, prompt design, and memory management."
domain: artificial-intelligence
aliases:
  - Context Window
  - context window
  - context length
measured-by: token
determined-by: transformer
restricts: agentic-system, retrieval-augmented-generation
contains: system-prompt
date-created: 2026-03-29
date-updated: 2026-03-29
---

The context window is the maximum number of [tokens](./token.md) a [large language model](../../../../../../content/text/glossary/terms/large-language-model.md) can process in a single interaction. Everything the model reads and generates — the [system prompt](./system-prompt.md), the user's message, the conversation history, [tool](../domains/agents/terms/tool-use.md) definitions, tool results, and the model's own output — must fit within this fixed budget. Once the context window is full, earlier content must be dropped or compressed to make room for new information.

The constraint is architectural. The [transformer](./transformer.md)'s self-attention mechanism computes pairwise attention scores between all tokens, requiring O(N²) compute and O(N) memory for a sequence of N tokens. Extending the context window requires proportionally more resources per forward pass. Research on efficient attention (sparse attention, sliding window, linear approximations) reduces the constant factor but does not eliminate the fundamental scaling relationship.

Context window sizes have grown rapidly:

| Model | Year | Context window |
|---|---|---|
| GPT-3 | 2020 | 4,096 tokens |
| GPT-4 | 2023 | 8,192 / 32,768 tokens |
| Claude 3 | 2024 | 200,000 tokens |
| Gemini 1.5 Pro | 2024 | 1,000,000 tokens |
| Claude Opus 4.6 | 2025 | 200,000 / 1,000,000 tokens |

Even at one million tokens, the context window is finite and shapes the design of [agentic systems](../domains/agents/terms/agentic-system.md) in three ways:

1. **Memory management.** An agent operating over many steps accumulates tool results and reasoning traces that eventually exceed the window. [Agent orchestration](../domains/agents/terms/agent-orchestration.md) frameworks must implement strategies for summarizing, compacting, or selectively retaining context — a problem analogous to memory management in operating systems.

2. **Prompt budgeting.** A system prompt, tool definitions, conversation history, and instruction files ([AGENTS.md](../../../../services/agent-science-services-section/services/agent-content-science-services-section/services/agent-markdown-file-science-services-section/content/text/glossary/terms/agents-md.md), [SOUL.md](../../../../services/agent-science-services-section/services/agent-content-science-services-section/services/agent-markdown-file-science-services-section/content/text/glossary/terms/soul-md.md)) all compete for the same token budget. Longer instructions leave less room for the task itself.

3. **Retrieval vs. inclusion.** When relevant information exceeds the context window, the system must retrieve it on demand (RAG, tool calls to databases) rather than including it wholesale. The context window determines the boundary between what the model can hold "in mind" and what it must look up.

Context window size is a binding constraint on agent capability. A larger window allows more complex multi-step reasoning without information loss. A smaller window forces more aggressive summarization and more frequent tool calls to re-fetch information.

## Related terms

- [Token](./token.md) — the unit in which context windows are measured
- [Transformer](./transformer.md) — the architecture whose attention mechanism creates the constraint
- [System prompt](./system-prompt.md) — a major consumer of context window budget
- [Agentic system](../domains/agents/terms/agentic-system.md) — systems whose architecture is shaped by context limits

## Earlier material

2. **Prompt budgeting.** A system prompt, tool definitions, conversation history, and instruction files ([AGENTS.md](../../../../services/agent-science-services-section/services/agent-content-science-services-section/services/agent-markdown-file-science-services-section/content/text/glossary/terms/agents-md.md), [SOUL.md](../../../../services/agent-science-services-section/services/agent-content-science-services-section/services/agent-markdown-file-science-services-section/content/text/glossary/terms/soul-md.md)) all compete for the same token budget. Longer instructions leave less room for the task itself.

Even at one million tokens, the context window is finite and shapes the design of [agentic systems](../../../../../../../../../philosophy-services-section/services/relationality-services-section/services/agency-services-section/content/text/documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/content/artificial-intelligence/machine-learning/neural-network/language-models/archive/theories/agents/terms/agentic-system.md) in three ways:
