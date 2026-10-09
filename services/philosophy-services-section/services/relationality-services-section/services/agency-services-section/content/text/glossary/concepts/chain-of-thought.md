---
type: concept
class: contemporary
status: active
depends-on:
  - reasoning.md
see-also:
  - ../objects/reasoning-trace.md
  - ../theorems/cot-faithfulness.md
  - ../theorems/scratchpad-helps.md
references:
  - references/wei-cot2022.md
  - references/kojima-zsm-cot2022.md
title: Chain-of-thought
description: Chain-of-thought (CoT) prompting elicits step-by-step reasoning traces from large language models.
---

# Chain-of-thought

**Chain-of-thought (CoT)** prompting elicits
step-by-step reasoning traces from large language
models. Empirically, LLMs solve harder problems when
prompted to "think step by step" rather than emit
answers directly. The most-studied recent reasoning
phenomenon in LLMs.

## The discovery

Wei et al. 2022: prompting LLMs with worked examples
that include reasoning steps substantially improves
performance on math word problems and other reasoning
benchmarks.

Kojima et al. 2022: even *zero-shot* — just adding
"Let's think step by step" — yields large gains.

Both findings replicated widely.

## The pattern

Without CoT:

```
Q: Roger has 5 tennis balls. He buys 2 more cans
   of tennis balls. Each can has 3 tennis balls.
   How many tennis balls does he have now?
A: 11
```

With CoT:

```
Q: ...
A: Roger started with 5 balls. 2 cans of 3 balls
   each is 6 balls. 5 + 6 = 11. The answer is 11.
```

Same model, same problem, different output → often
better accuracy with CoT.

## Why it might help

Several explanations, not mutually exclusive:

### Allowing more compute

Per [scratchpad-helps](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/reasoning/_archive/from-language-models-reasoning/theorems/scratchpad-helps.md):
intermediate tokens give the transformer more
compute to allocate. CoT gives more compute per
problem.

### Decomposition

Breaking the problem into steps may align with
training-data patterns: textbooks, worked examples,
explanations all contain step-by-step structure.

### Self-conditioning

Each generated step conditions on previous steps;
the model can build up complex inferences via
incremental conditioning.

### Distribution adjustment

Step-by-step output may be more in-distribution than
direct-answer output for hard problems, especially
if training data contains many step-by-step
solutions.

## Variants

A taxonomy:

- **Few-shot CoT.** With worked-example prompts.
- **Zero-shot CoT.** Just "Let's think step by step."
- **Self-consistency.** Sample multiple CoTs;
  majority-vote.
- **Tree-of-thought.** Search over branching
  reasoning paths.
- **Graph-of-thought.** More general structures.
- **Reflexion.** CoT with self-critique.
- **Reasoning tokens** (o-series, R1). Models
  trained to internally use CoT-like reasoning.

Each tries to enhance or extend basic CoT.

## The faithfulness question

Per [cot-faithfulness](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/reasoning/_archive/from-language-models-reasoning/theorems/cot-faithfulness.md):
do CoT traces *reflect* what the model is actually
computing?

Evidence is mixed:
- Sometimes traces *do* reflect the actual
  computation.
- Sometimes they're *post-hoc rationalization* —
  generated to look reasonable, but the actual
  computation went elsewhere.
- Influence-function and activation-patching studies
  give partial answers.

The unfaithfulness possibility limits using CoT for
interpretation.

## The reasoning-vs-pattern question

A deeper question (per [llm-reasoning-debate](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/reasoning/_archive/from-language-models-reasoning/archive/teaching/explanations/llm-reasoning-debate.md)):

- Is CoT *real* multi-step reasoning?
- Or sophisticated pattern matching that happens to
  produce step-like output?

Different framings lead to different research
programs and predictions.

## The reasoning-model era

Post-2024: models trained explicitly to use CoT-like
internal reasoning (OpenAI o1/o3, DeepSeek-R1):

- Train with RL to produce useful reasoning traces.
- Reasoning traces sometimes hidden from user.
- Substantial gains on math, code, science
  benchmarks.
- Compute-time scaling: more reasoning = better
  results.

This shifts CoT from prompting trick to architectural
feature.

## Limits and failures

- **CoT helps mostly on hard problems.** Easy
  problems may not benefit.
- **Long CoT can degrade** performance via
  distractor reasoning.
- **CoT can compound errors.** Errors in early
  steps propagate.
- **Faithfulness is partial.** Per above.
- **Brittle to prompt phrasing.**

## Implications

- **Reasoning-as-prompting.** Reasoning capability
  partially elicited rather than purely
  architectural.
- **Test-time compute.** Trade compute for
  accuracy.
- **Training implications.** Train models to use CoT
  effectively.
- **Evaluation implications.** Per
  [evaluation](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/reasoning/_archive/evaluation/_index.md), CoT
  affects measured capability.

## In contemporary AI

CoT and its descendants are now central to LLM
deployment:
- Reasoning models use CoT internally.
- Test-time compute scaling exploits CoT.
- Tool-using LLMs use CoT to plan tool calls.
- Verifier-augmented systems verify CoT traces.

## Status

Empirically robust. Theoretically partially
understood. Mechanism and faithfulness remain
active research.
