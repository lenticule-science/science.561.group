---
title: "Multi-Agent Failure Modes"
description: "The MASFT study's taxonomy of how multi-agent LLM systems fail — 14 failure modes in 3 categories, with empirical findings on coordination costs."
examines: coordination-overhead, multi-agent-system
source: masft2025
date-created: 2026-03-29
---

The MASFT study (arXiv 2503.13657, March 2025) analyzed 150+ execution traces across 5 multi-agent frameworks with 6 expert annotators (Cohen's Kappa 0.88).
The central finding: multi-agent architectures showed minimal performance gains over single-agent baselines on popular benchmarks.
Some multi-agent systems performed worse than best-of-N sampling from a single agent — running the same single agent N times and taking the best result outperformed the coordinated multi-agent system.

Optimizing prompts and redesigning coordination topology produced only modest improvements: +5% for AG2 MathChat, +14% maximum for ChatDev with topology redesign.

## The 14 failure modes

The study identified 14 failure modes in 3 categories.

### Specification failures (FC1)

Failures in how the task is specified to the multi-agent system.
These are not coordination failures — they would affect single-agent systems too.

### Inter-agent misalignment (FC2)

The 6 failures specific to coordination:

1. **Communication breakdown** — agents fail to transmit critical information.
2. **Task derailment** — one agent's output sends the system off track.
3. **Information withholding** — agents omit context the receiver needs.
4. **Role violation** — agents act outside their designated scope.
5. **Conflicting actions** — agents produce contradictory outputs on shared state.
6. **Cascading misinterpretation** — one agent's error propagates and amplifies through subsequent agents.

### Verification failures (FC3)

Failures in checking whether the multi-agent system's output is correct.

## Empirical cost data

Research shows a saturation threshold where coordination gains plateau beyond approximately 4 agents.
Coordination latency grows from ~200ms with 2 agents to over 4 seconds with 8+ agents — approximately quadratic growth.
Beyond the threshold, adding agents increases overhead faster than it increases capability.

Anthropic's production multi-agent research system consumes approximately 15x more tokens than equivalent single-turn chats.
This is the baseline cost of multi-agent coordination in a well-engineered system.

## When multi-agent coordination pays

Multi-agent coordination overcomes its overhead in three situations:

1. The task requires capabilities a single agent cannot hold simultaneously — isolated tool environments (coding sandbox + web browser).
2. The task decomposes into independent subtasks — parallel execution reduces wall-clock time.
3. The task benefits from diverse perspectives — debate/consensus patterns reduce hallucination at the cost of N× token consumption.

In all other cases, a single agent with well-designed tools outperforms a multi-agent system at lower cost and higher reliability.
