---
title: "Agent Self-Improvement"
description: "The capability of an agentic system to improve its own prompts, tools, or workflows based on evaluated performance — a feedback loop from execution to instruction."
defines: Agent Self-Improvement
domain: agents
requires: agent-evaluation
optimizes: context-engineering, system-prompt
acts-on: system-prompt
governed-by: human-in-the-loop
contrasts-with: fine-tuning, rlhf
date-created: 2026-03-29
date-modified: 2026-03-29
references:
  - id: icml2025metacog
    type: document
    title: Position: Truly Self-Improving Agents Require Intrinsic Metacognitive Learning
    author:
      - literal: Various
    container-title: ICML 2025
    issued:
      - year: 2025
cites:
  - icml2025metacog
---

Agent self-improvement is the capability of an [agentic system](./agentic-system.md) to modify its own prompts, tools, or workflows based on [evaluated](./agent-evaluation.md) performance.
The agent executes a task, a grading system scores the output, and the scores feed back into the agent's instructions or configuration for the next iteration.
The loop runs: execute → evaluate → revise → execute.

### The practical pattern

The OpenAI cookbook documents a three-stage production pattern:

1. **Baseline agent** performs the task (e.g., content transformation, code generation, document analysis).
2. **Evaluation layer** scores the output through multiple graders.
  Effective grading combines deterministic checks (entity preservation, output length, schema validity) with semantic evaluation (cosine similarity to reference outputs, LLM-as-judge scoring).
  Start with deterministic graders; add semantic evaluation only when deterministic checks are insufficient.
3. **Metaprompt agent** receives the grader scores and the current instructions, then generates revised instructions that address the identified weaknesses.
  The revised instructions replace the originals for the next iteration.

This pattern improves agent performance on measured criteria without [fine-tuning](../../../terms/fine-tuning.md) the underlying model — the model's weights stay fixed; only its [system prompt](../../../terms/system-prompt.md) changes.
The recommended starting pass threshold is ~75%, and human review remains essential before deploying revised instructions to production.

### Limitations

An ICML 2025 position paper ("Truly Self-Improving Agents Require Intrinsic Metacognitive Learning") argues that current self-improvement approaches are rigid, fail to generalize across task domains, and struggle to scale with increasing agent capability.
The paper proposes that effective self-improvement requires **intrinsic metacognitive learning** — the agent's ability to evaluate and adapt its own learning processes, not just its outputs.
Current systems optimize outputs against fixed criteria; they do not revise the criteria themselves or discover new evaluation dimensions.

The AutoGPT experience (2023–2025) illustrates the failure mode: fully autonomous self-improvement produces infinite loops when tasks are ambiguous, [hallucinated](../../../terms/hallucination.md) corrections when the agent misdiagnoses its own failures, and token cost spirals as the agent iterates without convergence.
The consensus by 2025: self-improvement works when grounded in measurable criteria with human oversight; it fails when open-ended and unsupervised.

### Self-improvement in practice

Anthropic's production multi-agent system demonstrates that prompt-based self-improvement works within bounds: models diagnose failures and suggest prompt enhancements.
The key constraint is evaluation quality — the improvement loop is only as good as its graders.
LLM-as-judge evaluations with a single well-crafted prompt produce more consistent results than multiple specialized judges.
Starting with 20 test queries reveals enough pattern to iterate.

File-based [agent memory](./agent-memory.md) systems (MEMORY.md, working notes) provide a natural substrate for self-improvement: the agent records what worked and what failed, reads those records at the start of the next session, and adjusts its approach.
This is self-improvement through accumulated experience rather than automated prompt rewriting — slower, more robust, and compatible with human review.

## Related terms

- [Agent evaluation](./agent-evaluation.md) — the measurement that drives the improvement loop
- [Context engineering](../../../terms/context-engineering.md) — the discipline of designing the prompts being improved
- [Agent memory](./agent-memory.md) — the persistence layer that stores improvement history
- [RLHF](../../../terms/rlhf.md) — model-level improvement from human feedback (distinct from prompt-level self-improvement)
- [Fine-tuning](../../../terms/fine-tuning.md) — weight-level improvement (distinct from prompt-level self-improvement)
