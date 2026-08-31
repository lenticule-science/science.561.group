---
title: "Tool Use"
date-created: 2026-08-22
description: "Tool use is an LLM agent's capacity to call an external function — a calculator, a search API, a code interpreter, a file-edit interface — mid-generation and condition its subsequent output on the returned result, extending what the model can do beyond what it can compute or recall from its own weights."
aliases:
  - "tool calling"
  - "function calling"
defines: tool-use
instance-of: agent-architecture
---

Tool use names the mechanism by which a language model reaches outside its own forward pass to call an external function during generation — a calculator, a search engine, a code interpreter, a database query, a file-edit or shell command — and then continues generating conditioned on whatever that function returns. It is the piece of an [LLM agent](llm-agent.md)'s loop that turns "reasoning about the world" into "acting on the world."

Timo Schick et al.'s ["Toolformer: Language Models Can Teach Themselves to Use Tools"](https://arxiv.org/abs/2302.04761) (NeurIPS 2023) is the anchor result for tool use as a *learned* capability rather than a hand-engineered one: the model self-supervises which API calls to insert into its own training generations and where, from a handful of demonstrations per tool, rather than following a fixed heuristic for when to call out. Shunyu Yao et al.'s ["ReAct: Synergizing Reasoning and Acting in Language Models"](https://arxiv.org/abs/2210.03629) (ICLR 2023) is the companion result for tool use as *interleaved with reasoning*: the model's chain-of-thought explicitly narrates why a given tool call is being made and what it expects back, which both improves the choice of action and gives a human or another agent a legible trace to audit.

Downstream, agent-benchmark design treats tool use as a first-class variable rather than an implementation detail. John Yang et al.'s ["SWE-agent: Agent-Computer Interfaces Enable Automated Software Engineering"](https://arxiv.org/abs/2405.15793) (NeurIPS 2024) shows that the *interface* through which an agent calls its tools — a custom edit/search/execute surface, as opposed to a raw shell — materially changes solve rate on [SWE-bench](../../documents/articles/notes/2026/08/22/2026-08-22-note-on-the-study-of-llm-agent-science.md) independent of the underlying model, meaning tool-use quality is partly an interface-design problem, not only a model-capability problem. Shunyu Yao et al.'s [τ-bench](https://arxiv.org/abs/2406.12045) (first posted 2024; accepted to ICLR 2025) stress-tests tool use under a further constraint — the agent must follow domain-specific policy while calling APIs during a live multi-turn conversation with a simulated user — and finds even strong function-calling models succeed on under half of tasks. See the [study note on LLM agent science](../../documents/articles/notes/2026/08/22/2026-08-22-note-on-the-study-of-llm-agent-science.md) for tier labels on all of these sources.
