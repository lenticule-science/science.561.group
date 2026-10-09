---
type: reference
class: empirical
status: published
year: 2023
authors: ["Yao, Shunyu", "Yu, Dian", "Zhao, Jeffrey", "Shafran, Izhak", "Griffiths, Thomas L.", "Cao, Yuan", "Narasimhan, Karthik"]
title: Yao et al. 2023
description: "Tree of Thoughts: Deliberate Problem Solving with Large Language Models."
---

# Yao et al. 2023

**Tree of Thoughts: Deliberate Problem Solving with Large Language Models.** In: Advances in Neural Information Processing Systems 36 (NeurIPS 2023).

## What the paper does

Introduces Tree of Thoughts (ToT): an inference-time procedure that performs explicit *tree search* over reasoning steps in an LLM.
At each step, the model proposes several candidate next-steps, an evaluation prompt rates them, and the search continues from the most promising branches with backtracking when needed.

Demonstrates substantial accuracy improvements over chain-of-thought on tasks requiring search, exploration, and lookahead: Game of 24, creative writing, mini-crosswords.

## Key contributions

1. **The ToT framework.** Generalize CoT from a *linear* reasoning chain to a *tree* of reasoning chains.
  The tree is searched by an inference-time procedure (BFS, DFS, or beam-style) with model-based evaluation at each node.
2. **Self-evaluation as heuristic.** The model is prompted to rate each reasoning step on quality dimensions (correctness, progress, plausibility); the rating drives the search policy.
3. **Demonstration that explicit search structure matters.** ToT substantially outperforms both single-shot CoT and self-consistency on problems where the right answer requires considering and rejecting several candidate paths.
  The improvement is not just from more samples but from the *search structure* organizing them.

## Why this paper matters

ToT is the clearest LLM-side analog of classical heuristic search.
It establishes that the structural ideas of search (branching, evaluation, selection, backtracking) transfer to LLM-based reasoning and confer measurable benefits beyond linear CoT.
It is the bridge result connecting the classical-planning vocabulary to the LLM- inference-time-search vocabulary.

The paper also made explicit a methodological point: the LLM is *both* the proposer of next-steps and the evaluator of next-steps.
This dual role creates structural failure modes (self-confirming reasoning, plausibility-driven non-correctness) that the [why-llm-cot-is-not-quite-search](../notes/undated/why-llm-cot-is-not-quite-search.md) narrative analyzes in detail.

ToT seeded a substantial follow-up literature: graph-of-thoughts, program-of-thoughts, learned-tree-search, and the post-2024 frontier reasoning models that internalize tree-style search into the model itself rather than running it as an external scaffold.

## Cited where

- [inference-time-search](../../../glossary/concepts/inference-time-search.md) — primary reference for ToT.
- [inference-time-compute-tradeoff](../notes/undated/inference-time-compute-tradeoff.md) — empirical exemplar.
- [from-strips-to-llm-planning](../notes/undated/from-strips-to-llm-planning.md) — for the LLM-era developments.
- [why-llm-cot-is-not-quite-search](../notes/undated/why-llm-cot-is-not-quite-search.md) — as the closest LLM-analog to classical heuristic search.
