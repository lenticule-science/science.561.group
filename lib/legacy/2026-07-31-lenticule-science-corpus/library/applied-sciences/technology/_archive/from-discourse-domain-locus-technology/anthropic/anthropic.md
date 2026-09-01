---

title: "Anthropic"
description: "The AI safety company that builds Claude — a Public Benefit Corporation pursuing the responsible development of frontier AI systems."
domain: artificial-intelligence
extends: ai-research-laboratory
produces:
  - claude
  - model-context-protocol
  - claude-code
  - constitutional-ai
governed-by: public-benefit-purpose
date-created: 2026-03-30
aliases:
  - Anthropic
  - Anthropic PBC
references:
  - id: anthropic-company
    type: document
    title: Company
    author:
      - literal: Anthropic
    container-title: Anthropic
    issued:
      - year: 2025
    URL: https://www.anthropic.com/company
  - id: bai2022
    type: document
    title: Constitutional AI: Harmlessness from AI Feedback
    author:
      - literal: Yuntao Bai
      - literal: Saurav Kadavath
      - literal: Sandipan Kundu
      - literal: Amanda Askell
      - literal: Jackson Kernion
      - literal: Andy Jones
      - literal: Anna Chen
      - literal: Anna Goldie
      - literal: Azalia Mirhoseini
      - literal: Cameron McKinnon
      - literal: et al.
    container-title: Anthropic Research
    issued:
      - year: 2022
    URL: https://www.anthropic.com/research/constitutional-ai-harmlessness-from-ai-feedback
  - id: anthropic-constitution
    type: document
    title: Claude's Constitution
    author:
      - literal: Anthropic
    container-title: Anthropic Blog
    issued:
      - year: 2025
    URL: https://www.anthropic.com/news/claudes-constitution
---

Anthropic is a Public Benefit Corporation founded in 2021 by Dario Amodei (CEO), Daniela Amodei (President), and several former OpenAI researchers. Its corporate purpose is "the responsible development and maintenance of advanced AI for the long-term benefit of humanity." It is headquartered in San Francisco.

Anthropic builds and operates the [Claude](./claude.md) family of [large language models](../../on-device-inference/terms/large-language-model.md). Its principal alignment technique is **Constitutional AI** (CAI): instead of relying solely on human feedback to shape model behavior, CAI provides the model with an explicit set of principles — a "constitution" — against which it evaluates and revises its own outputs. The constitution draws from the UN Declaration of Human Rights, trust and safety best practices, principles from other AI labs, and efforts to incorporate non-Western perspectives. The technique was published in 2022 (Bai et al.) and remains the foundation of Claude's training process.

Anthropic positions itself as a safety research company rather than a product company. Its research spans interpretability (mechanistic analysis of neural network internals), alignment (Constitutional AI, [RLHF](./rlhf.md)), and evaluations (frontier model capability assessments).

Beyond models, Anthropic has produced infrastructure used across the AI industry: the [Model Context Protocol](../domains/agents/terms/model-context-protocol.md) (MCP), an open standard for connecting agents to tools now maintained by the Linux Foundation; [Claude Code](../domains/software/terms/claude-code.md), an [agentic](../domains/agents/terms/agentic-system.md) coding tool; and the [computer use](../domains/agents/terms/computer-use.md) capability, which extends model action from APIs to graphical interfaces.

