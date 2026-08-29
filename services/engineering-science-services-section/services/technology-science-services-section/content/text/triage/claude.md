---

title: "Claude"
description: "Anthropic's family of large language models — the AI system behind Claude Code, the developer API, and consumer products at claude.ai."
defines: Claude
domain: artificial-intelligence
extends: large-language-model
produced-by: anthropic
governed-by: constitutional-ai
requires: transformer
enables:
  - claude-code
  - tool-use
  - computer-use
delivers:
  - text-generation
  - vision
  - tool-use
  - extended-thinking
date-created: 2026-03-30
aliases:
  - Claude
  - Claude models
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
  - id: anthropic-claude4-2025
    type: document
    title: Introducing Claude 4
    author:
      - literal: Anthropic
    container-title: Anthropic Blog
    issued:
      - year: 2025
    URL: https://www.anthropic.com/news/claude-4
  - id: anthropic-models-overview
    type: document
    title: Models overview
    author:
      - literal: Anthropic
    container-title: Claude API Docs
    issued:
      - year: 2025
    URL: https://docs.anthropic.com/en/docs/about-claude/models/overview
---

Claude is [Anthropic's](./anthropic.md) family of [large language models](../../on-device-inference/terms/large-language-model.md), built on the [transformer](./transformer.md) architecture and trained using [Constitutional AI](./anthropic.md) and [RLHF](./rlhf.md). Claude powers the consumer interface at claude.ai, the developer API, and [Claude Code](../domains/software/terms/claude-code.md).

Each Claude generation ships in multiple tiers that trade capability for speed and cost:

- **Opus** — highest capability, deepest reasoning, best for complex analysis and [agentic](../domains/agents/terms/agentic-system.md) tasks
- **Sonnet** — balanced performance and cost, the default for most applications
- **Haiku** — fastest and cheapest, optimized for high-throughput tasks

The current generation (as of early 2026) comprises Opus 4.6, Sonnet 4.6, and Haiku 4.5.

Claude models support text generation and analysis, vision (image understanding since Claude 3), structured [tool use](../domains/agents/terms/tool-use.md) via the API, [computer use](../domains/agents/terms/computer-use.md) (GUI interaction via screenshots and mouse/keyboard actions since Claude 3.5 v2), extended [context windows](./context-window.md) up to 200K tokens (1M for some Opus configurations), and extended thinking for step-by-step reasoning on complex problems.

Access methods include the claude.ai web and mobile interface, the Claude API via Anthropic SDKs (Python, TypeScript), [Claude Code](../domains/software/terms/claude-code.md) as CLI and IDE extensions, and third-party platforms (Amazon Bedrock, Google Cloud Vertex AI, GitHub Copilot).

For the release history and evolution of the Claude model family, see [Claude Model Releases](../domains/software/texts/claude-model-releases.md).
