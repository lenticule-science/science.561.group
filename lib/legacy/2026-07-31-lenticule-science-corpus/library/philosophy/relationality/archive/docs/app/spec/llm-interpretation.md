---
title: Interpreting LLMs & Language Transformers
status: someday
keywords:
  - idea
  - llm
  - transformers
---
# Idea: Interpreting LLMs & Language Transformers

Treat prompts, completions, and model behaviors as recognitions so language
models become inspectable components inside the relational computer.

## 1. Core recognitions

- `ModelRecognition`
  - a particular LLM/transformer (architecture, size, training data summary,
    version).

- `PromptRecognition`
  - a specific prompt/input:
    - text, metadata (who/what generated it, domain, constraints).

- `CompletionRecognition`
  - model output for a prompt:
    - text, sampling parameters, timing.
    - links to `PromptRecognition` and `ModelRecognition`.

- `LLMInteractionRecognition`
  - a full interaction (possibly multi-turn):
    - sequence of prompt/completion pairs,
    - context (task, domain, agent that called it).

## 2. Measurement and topology

- Measurement:
  - performance metrics: helpfulness, correctness (when checkable),
    hallucination rate, latency, token usage.
  - alignment metrics: adherence to values/norms (via `ValueRecognition`,
    `LensRecognition`).

- Topology:
  - graphs of similar prompts/completions (via embeddings),
  - links between LLM outputs and recognitions they touch (facts, policies,
    symbols).

## 3. Runbooks and uses

- `log_llm_interaction(agent_id, model_id, prompt, completion)`,
- `evaluate_completion(completion_id, criteria)`,
- `summarize_model_behavior(model_id, domain_slice)`.

In the multi-agent setting, this treats LLM calls as internal, traceable tools
used by agents, not opaque magic.

