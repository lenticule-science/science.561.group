---
type: reference
class: empirical
status: published
year: 2022
authors: ["Wei, Jason", "Wang, Xuezhi", "Schuurmans, Dale", "Bosma, Maarten", "Ichter, Brian", "Xia, Fei", "Chi, Ed H.", "Le, Quoc V.", "Zhou, Denny"]
title: Wei et al. 2022
description: Chain-of-Thought Prompting Elicits Reasoning in Large Language Models.
---

# Wei et al. 2022

**Chain-of-Thought Prompting Elicits Reasoning in Large Language Models.** In: Advances in Neural Information Processing Systems 35 (NeurIPS 2022).

## What the paper does

Introduces chain-of-thought (CoT) prompting: instead of asking an LLM directly for an answer, prompt it to produce a sequence of intermediate reasoning steps before its final answer.
Demonstrates substantial accuracy improvements across multi-step arithmetic, commonsense, and symbolic reasoning benchmarks.

## Key contributions

1. **The CoT prompting technique.** Provide a few-shot prompt that includes worked examples of "problem → step-by-step reasoning → answer", then present the test problem.
  The model produces its own step-by-step reasoning before answering, substantially improving accuracy.
2. **Empirical scaling.** CoT's benefit emerges sharply with model scale: small models do not benefit (or are hurt); models above ~100B parameters benefit dramatically.
  This was the first widely-cited empirical demonstration of an *emergent capability* with model scale.
3. **No fine-tuning required.** CoT is a pure prompting technique; no model weights are changed.
  Suggested that LLM capability was substantially *under-elicited* by single-shot prompting.
4. **Domain breadth.** CoT improves arithmetic, commonsense reasoning, symbolic manipulation, and other multi-step tasks.

## Why this paper matters

CoT is the foundational technique of the "inference-time-search in LLMs" research program.
It established that capability extracted from an LLM is a function not only of the model but also of how it is prompted; that LLMs have substantial latent reasoning capability that single-shot prompting fails to elicit; and that the elicited capability scales with the inference budget allocated to producing the reasoning chain.

The technique seeded an enormous follow-up literature: self-consistency (sampling multiple chains, voting), tree-of-thoughts (branching search over chains), self-verification (asking the model to check its own reasoning), and the contemporary frontier "reasoning models" that internalize CoT into the trained model itself.

## Cited where

- [inference-time-search](../../../glossary/concepts/inference-time-search.md) — primary reference for CoT.
- [inference-time-compute-tradeoff](../notes/undated/inference-time-compute-tradeoff.md) — empirical exemplar.
- [from-strips-to-llm-planning](../notes/undated/from-strips-to-llm-planning.md) — for the LLM-era kickoff.
- [why-llm-cot-is-not-quite-search](../notes/undated/why-llm-cot-is-not-quite-search.md) — as the canonical case being analyzed.
