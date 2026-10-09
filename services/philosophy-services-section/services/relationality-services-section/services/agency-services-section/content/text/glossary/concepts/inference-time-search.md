---
type: concept
class: contemporary
status: active
depends-on:
  - classical-planning.md
  - heuristic-search.md
see-also:
  - monte-carlo-tree-search.md
  - ../theorems/inference-time-compute-tradeoff.md
  - questions/is-llm-cot-genuine-search.md
  - teaching/explanations/why-llm-cot-is-not-quite-search.md
references:
  - references/wei-cot2022.md
  - references/yao-tot2023.md
  - references/silver-alphazero2018.md
title: Inference-time search
description: Inference-time search is the family of techniques in which a trained model spends additional compute at inference time — beyond the basic forward-pass cost — to improve the quality of its outputs.
---

# Inference-time search

**Inference-time search** is the family of techniques in which a trained model spends *additional compute at inference time* — beyond the basic forward-pass cost — to improve the quality of its outputs.
In the planning context, the additional compute takes the form of search over candidate continuations: the model proposes multiple candidate next steps, evaluates them (possibly by additional model calls), and selects or backtracks accordingly.

## The principal techniques

**Chain-of-thought (CoT) prompting** (Wei et al. 2022).
The model is prompted to produce intermediate reasoning steps before its final answer.
This is a *minimal* inference-time-search technique: it is not branching search, just sequential elaboration.
But it substantially improves performance on multi-step reasoning tasks, suggesting that the model's "best output for hard problem in one forward pass" underestimates its capability.

**Self-consistency / majority voting** (Wang et al. 2022).
Sample multiple chain-of-thought completions; return the modal answer.
This adds a *width* dimension to CoT but no branching within an individual chain.
Empirically substantially better than single-CoT on math and reasoning benchmarks.

**Tree of thoughts (ToT)** (Yao et al. 2023).
Explicit tree-search over reasoning steps.
The model generates several candidate next steps at each node, evaluates each (often by self-evaluation prompting), and pursues the highest-rated branches.
Backtracking is supported.
This is the closest LLM analog to classical heuristic search: state = partial reasoning trace, action = next step, heuristic = self-evaluation score.

**ReAct** (Yao et al. 2022).
Interleave reasoning steps with *environmental actions*: the model produces a reasoning step, then an action against an external tool/environment, then observes the result, then continues.
The plan is constructed incrementally as the environment is queried.
Extends inference-time search to settings where the model is acting in the world rather than just reasoning about it.

**Inference-time MCTS / o1-style.** Modern frontier models (o1 family, R1 family, post-2024 reasoning models) use explicit inference-time search trained into the model: the model's policy emits "think" tokens whose total length scales with problem difficulty, and the training objective rewards the search itself rather than only the final answer.
The architectural details are proprietary but the empirical pattern (test-time compute scales inversely with answer error) matches MCTS-style search.

## Structural relationship to classical search

| Element | Classical search | LLM inference-time search |
|---|---|---|
| State | Atom set / problem state | Partial reasoning trace / token sequence |
| Action | Operator application | Next reasoning step / next token group |
| Successor | Deterministic transition | Sample from LLM |
| Goal predicate | Goal atoms hold | Verifier accepts / final answer correct |
| Heuristic | $h$-value | LLM self-evaluation / value model |
| Algorithm | A*, IDA*, MCTS | CoT, ToT, MCTS-with-LLM-rollout |

The structural correspondence is real.
The substantive differences:

- The successor function is **non-deterministic and learned** rather than known.
  Each "expansion" requires a costly model call.
- The state space is **enormously larger** (token sequences, not ground atoms) but the model's prior distribution over reasonable continuations is sharp, so most of the space is never explored.
- The heuristic / verifier is **also learned** (often by the same model).
  Self-evaluation is unreliable and is a principal failure mode.

## Why this matters

Inference-time search shifts compute from training to inference.
The [inference-time-compute-tradeoff](../../documents/articles/notes/undated/inference-time-compute-tradeoff.md) theorem (informal but well-supported empirically): on tasks where the model has the *underlying capability* but uses it unreliably in single-shot inference, inference-time search converts more compute into more accuracy.
The conversion rate decreases with compute (diminishing returns) but is non-trivial across multiple orders of magnitude in the post-2024 reasoning-model literature.

This restructures the economics of capability: the same trained model exhibits substantially different capability levels at different inference budgets.
For capability evaluation, this is the [capability-elicitation](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/acting/planning/content/alignment/morphisms/capability-elicitation.md) phenomenon — a model's "true" capability is bounded above by what it can produce with arbitrary inference compute, not what it produces in a single forward pass.

## What it doesn't do

Inference-time search **does not improve underlying capability**; it only improves elicitation of existing capability.
A model that cannot solve a problem in any forward pass cannot solve it by searching over its own forward passes.
Empirically, inference-time gains are largest on tasks where the model can *check* a candidate answer (math, code, formal verification) and smallest on tasks where verification is as hard as generation (creative writing, value judgments).

The boundary between "this is genuine search elaborating real reasoning" and "this is sophisticated pattern-matching of search-shaped data" is contested; see [is-llm-cot-genuine-search](../../documents/articles/notes/undated/is-llm-cot-genuine-search.md) and the [why-llm-cot-is-not-quite-search](../../documents/articles/notes/undated/why-llm-cot-is-not-quite-search.md) narrative.
