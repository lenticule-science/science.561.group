---
id: coordination-overhead
description: "The token cost, latency, and error amplification incurred when multiple agents communicate and synchronize."
defines: coordination-overhead
cost-of: multi-agent-system
components: token-cost, latency, error-amplification
saturation-threshold: approximately-4-agents
baseline-cost: 15x-single-turn
contrasts-with: prompt-chaining
date-created: 2026-03-29
date-modified: 2026-03-29
---

Coordination overhead is the token cost, latency, and error amplification incurred when multiple agents communicate and synchronize. Every message between agents consumes tokens. Every synchronization point adds latency. Every handoff introduces an opportunity for misinterpretation. Coordination overhead is the tax on [multi-agent systems](./multi-agent-system.md) that single-agent systems avoid.

The overhead has three components. Token cost: agents communicate through natural language, which is expensive per unit of information transferred. Latency: coordination points require agents to wait for each other, and this grows approximately quadratically with the number of agents. Error amplification: each handoff between agents is an opportunity for misinterpretation, and errors cascade — one agent's mistake becomes the next agent's input.

Research shows a saturation threshold at approximately 4 agents. Beyond that point, adding agents increases overhead faster than it increases capability. Coordination latency grows from roughly 200ms with 2 agents to over 4 seconds with 8+. Anthropic's production multi-agent research system — a well-engineered, mature deployment — consumes approximately 15x more tokens than equivalent single-turn interactions. That is the baseline cost, not a failure case.

Multi-agent coordination overcomes its overhead in three situations. The task requires capabilities a single agent cannot hold simultaneously (isolated tool environments). The task decomposes into independent subtasks (parallel execution reduces wall-clock time). The task benefits from diverse perspectives (debate patterns reduce hallucination at the cost of N× tokens). In all other cases, a single agent with well-designed tools outperforms a multi-agent system at lower cost and higher reliability.

See [Multi-Agent Failure Modes](../../documents/articles/notes/multi-agent-failure-modes.md) for the MASFT study's taxonomy of 14 failure modes and empirical findings.
