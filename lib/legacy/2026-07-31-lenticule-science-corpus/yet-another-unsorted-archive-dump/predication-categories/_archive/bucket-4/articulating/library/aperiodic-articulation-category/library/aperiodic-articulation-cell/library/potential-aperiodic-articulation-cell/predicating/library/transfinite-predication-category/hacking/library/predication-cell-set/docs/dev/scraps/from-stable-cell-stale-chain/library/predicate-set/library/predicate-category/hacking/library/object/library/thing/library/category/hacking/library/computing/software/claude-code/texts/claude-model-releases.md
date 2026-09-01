---
part-of:
  - claude-code

title: "Claude Model Releases"
description: "A chronological account of the Claude model family's evolution from Claude 1 through Claude 4.6 — tracking the expansion of capabilities, tiers, and access methods across each generation."
date-created: 2026-03-30
keywords:
  - claude
  - anthropic
  - model-releases
requires:
  - claude
  - anthropic
  - large-language-model
  - transformer
  - context-window
  - tool-use
  - computer-use
references:
  - id: anthropic-claude3-2024
    type: document
    title: Introducing the next generation of Claude
    author:
      - literal: Anthropic
    container-title: Anthropic Blog
    issued:
      - year: 2024
    URL: https://www.anthropic.com/news/claude-3-family
  - id: anthropic-claude35sonnet-2024
    type: document
    title: Introducing Claude 3.5 Sonnet
    author:
      - literal: Anthropic
    container-title: Anthropic Blog
    issued:
      - year: 2024
    URL: https://www.anthropic.com/news/claude-3-5-sonnet
  - id: anthropic-35models-2024
    type: document
    title: Introducing computer use, a new Claude 3.5 Sonnet, and Claude 3.5 Haiku
    author:
      - literal: Anthropic
    container-title: Anthropic Blog
    issued:
      - year: 2024
    URL: https://www.anthropic.com/news/3-5-models-and-computer-use
  - id: anthropic-claude4-2025
    type: document
    title: Introducing Claude 4
    author:
      - literal: Anthropic
    container-title: Anthropic Blog
    issued:
      - year: 2025
    URL: https://www.anthropic.com/news/claude-4
  - id: anthropic-opus41-2025
    type: document
    title: Claude Opus 4.1
    author:
      - literal: Anthropic
    container-title: Anthropic Blog
    issued:
      - year: 2025
    URL: https://www.anthropic.com/news/claude-opus-4-1
  - id: anthropic-opus45-2025
    type: document
    title: Introducing Claude Opus 4.5
    author:
      - literal: Anthropic
    container-title: Anthropic Blog
    issued:
      - year: 2025
    URL: https://www.anthropic.com/news/claude-opus-4-5
  - id: anthropic-sonnet45-2025
    type: document
    title: Introducing Claude Sonnet 4.5
    author:
      - literal: Anthropic
    container-title: Anthropic Blog
    issued:
      - year: 2025
    URL: https://www.anthropic.com/news/claude-sonnet-4-5
  - id: anthropic-haiku45-2025
    type: document
    title: Introducing Claude Haiku 4.5
    author:
      - literal: Anthropic
    container-title: Anthropic Blog
    issued:
      - year: 2025
    URL: https://www.anthropic.com/news/claude-haiku-4-5
  - id: anthropic-sonnet46-2025
    type: document
    title: Introducing Claude Sonnet 4.6
    author:
      - literal: Anthropic
    container-title: Anthropic Blog
    issued:
      - year: 2025
    URL: https://www.anthropic.com/news/claude-sonnet-4-6
---

This text traces the evolution of the [Claude](../../../terms/claude.md) model family from its first public release through the current generation. Each generation expanded capabilities, introduced new tiers, or opened new access methods. The pattern is one of increasing breadth: early releases were text-only conversation models; later releases added [vision](../../../terms/embedding.md), [tool use](../../agents/terms/tool-use.md), [computer use](../../agents/terms/computer-use.md), and extended thinking, progressively widening the action space available to [agentic systems](../../agents/terms/agentic-system.md) built on Claude.

## Timeline

| Generation | Date | Key models | What changed |
|---|---|---|---|
| Claude 1 | March 2023 | Claude 1.0, Claude Instant | First public API release. Text-only, 9K context |
| Claude 2 | July 2023 | Claude 2.0, Claude 2.1 | Expanded context to 100K [tokens](../../../terms/token.md). Improved instruction-following |
| Claude 3 | March 2024 | Haiku, Sonnet, Opus | Three-tier structure introduced. Vision capability (image understanding). 200K context. Opus was the frontier capability benchmark |
| Claude 3.5 | June 2024 | 3.5 Sonnet | Surpassed Claude 3 Opus on most benchmarks at Sonnet-tier cost. The first time a lower tier exceeded the previous generation's top tier |
| Claude 3.5 v2 | October 2024 | 3.5 Sonnet (upgraded), 3.5 Haiku | [Computer use](../../agents/terms/computer-use.md) introduced as beta capability. The model could now interact with graphical interfaces via screenshots and mouse/keyboard actions |
| Claude 4 | January 2025 | Opus 4, Sonnet 4 | Opus 4 positioned as "world's best coding model." Major improvements in agentic task completion, multi-step reasoning, and code generation. Claude Code shipped alongside Claude 3.7 Sonnet shortly before |
| Claude 4.1 | 2025 | Opus 4.1 | Incremental improvements to Opus capability |
| Claude 4.5 | 2025 | Opus 4.5, Sonnet 4.5, Haiku 4.5 | Full-tier refresh. Opus 4.5 described as "best model in the world for coding, agents, and computer use" |
| Claude 4.6 | 2025 | Opus 4.6, Sonnet 4.6 | Current generation. Opus 4.6 available with 1M context. Powers Claude Code |

## Patterns in the release history

**Tier leapfrogging.** Claude 3.5 Sonnet surpassing Claude 3 Opus established a pattern: each generation's mid-tier can exceed the previous generation's top tier. This means the most cost-effective model at any moment is often last generation's capability at this generation's price.

**Capability stacking.** Each generation has added a new capability layer rather than replacing previous ones: text (Claude 1) → long context (Claude 2) → vision (Claude 3) → computer use (Claude 3.5) → agentic coding (Claude 4). The later capabilities depend on the earlier ones — computer use requires vision, agentic coding requires tool use.

**Access method expansion.** Claude 1–2 were API-only. Claude 3 added the claude.ai consumer interface. Claude 3.5–4 added Claude Code (CLI, then IDE extensions, then desktop app, then web app). Each access method opens the model to users who would not have used the previous interface.

**Context window growth.** 9K → 100K → 200K → 1M tokens. The expansion is not merely quantitative: longer context enables qualitatively different use patterns. A 200K window can hold an entire codebase; a 1M window can hold a codebase and its test suite and its documentation simultaneously, which is what makes extended [Claude Code](../terms/claude-code.md) sessions viable.
