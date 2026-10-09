---
title: "Context Engineering"
description: "The discipline of designing the complete information environment a language model receives — system prompts, retrieved documents, tool definitions, instruction files — to maximize task performance within the context window budget."
keywords: ["context-engineering", "language-models", "system-prompts", "agentic-systems"]
---


Context engineering is the discipline of designing the complete information environment a language model receives. Everything the model knows during a generation pass comes through its context window: the system prompt, conversation history, retrieved documents, tool definitions, instruction files, and the model's own prior outputs. Context engineering asks: what should go in, in what order, at what token cost, and through what mechanism?

The term emerged in mid-2025 and supersedes the narrower idea of prompt engineering. Prompt engineering focuses on the text of instructions — wording, formatting, examples. Context engineering focuses on the whole information environment: how information reaches the model, when it's included versus retrieved, how competing needs for context budget are prioritized.

**Why it matters in agentic systems.** A single-turn chatbot can tolerate a loosely designed context — the user sees the output immediately and can correct. An agent executing a multi-step workflow cannot: a missing instruction, a retrieved document with the wrong chunk boundary, or a tool definition that omits a key constraint leads to cascading errors that are expensive to recover from.

Core problems context engineering addresses:

- **Priority and position** — information near the beginning and end of the context tends to be weighted more heavily (the "lost in the middle" effect). Critical instructions belong at the top; key retrieved material at the point of use.
- **Budget allocation** — system prompt, tool definitions, conversation history, and retrieved content all compete for the same token budget. Longer instructions leave less room for task content.
- **Retrieval vs. inclusion** — not everything can fit. Context engineering defines when to include information directly versus retrieve it on demand (RAG).
- **Instruction files** — persistent instruction documents (CLAUDE.md, AGENTS.md, SOUL.md patterns) that shape agent behavior across sessions.

See [context-compaction](context-compaction.md) for how agents handle contexts that grow beyond the window limit.
