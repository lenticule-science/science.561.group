---
type: narrative
class: historical
status: stable
depends-on:
  - ../teaching/explanations/classical-planning.md
  - ../teaching/explanations/heuristic-search.md
  - ../teaching/explanations/monte-carlo-tree-search.md
  - ../teaching/explanations/inference-time-search.md
see-also:
  - planning-vs-learning.md
  - why-llm-cot-is-not-quite-search.md
references:
  - ../references/fikes-nilsson-strips1971.md
  - ../references/hart-nilsson-raphael1968.md
  - ../references/kocsis-szepesvari2006.md
  - ../references/silver-alphazero2018.md
  - ../references/wei-cot2022.md
  - ../references/yao-tot2023.md
title: From STRIPS to LLM planning
description: The history of automated planning is a sequence of expansions in what counts as a plan, what counts as a planner, and what substrate the planner operates on.
---

# From STRIPS to LLM planning

The history of automated planning is a sequence of expansions in *what counts as a plan*, *what counts as a planner*, and *what substrate the planner operates on*.
The arc spans roughly six decades and four major eras.

## 1968–1990: The classical era

The founding moves: A* (Hart, Nilsson, Raphael 1968) for general heuristic search; STRIPS (Fikes & Nilsson 1971) for the first modern planning representation; PROLOG-based and Lisp-based planners through the 1970s and 1980s.

The substrate was the *closed-world propositional database*: a finite set of atoms representing what is true; actions as add/delete/precondition triples; goals as conjunctions of atoms.
The planner was a search procedure (typically backward; STRIPS itself was backward) over this database, terminating when an action sequence was found that transformed the initial state into a goal-satisfying state.

The era's defining concern was *expressivity*.
STRIPS could not express conditional effects, quantifiers, or numerical fluents; ADL extended it to handle these; PDDL (Planning Domain Description Language, 1998) standardized the input format for an emerging research community.
The planning competitions (IPC, starting 1998) established benchmark problems and standardized algorithms.

The era's foundational result is the [classical-planning-complexity](classical-planning-complexity.md) theorem: PSPACE-completeness for plan-existence, NP-completeness for bounded plan-existence.
This established that planning is hard, and that any practical planner must be a method of *avoiding* the worst case.

## 1990–2010: The heuristic-search era

The defining transition: forward search overtook backward; admissible heuristics derived from problem relaxations (delete-relaxation, abstraction, landmarks) became the dominant tractability technology; A*-with-good-heuristic became the standard.

FF (Hoffmann 2001), Fast Downward (Helmert 2006), and LAMA (Richter & Westphal 2010) successively raised the state of the art.
Each represented a major advance in heuristic technology rather than a search-algorithm innovation: A* itself remained essentially unchanged from 1968, while the heuristics fed to it became dramatically stronger.

The era's structural insight (the [heuristic-relaxation-admissibility](heuristic-relaxation-admissibility.md) theorem and its specializations): admissible heuristics can be *automatically derived* from problem structure.
The planning theory became, in large part, the theory of how to derive good heuristics from problem descriptions.

In parallel, the MCTS family emerged for sample-based planning.
[UCT](../../../../glossary/concepts/monte-carlo-tree-search.md) (Kocsis & Szepesvári 2006) provided the first principled algorithm for anytime planning without explicit heuristics, with [convergence guarantees](uct-convergence.md).
This proved decisive for game-playing (AlphaGo, AlphaZero) and increasingly for planning in domains with weak structural heuristics.

## 2010–2020: The learning-augmented era

Two streams of work converged.
The reinforcement-learning community developed methods for learning policies and value functions from interaction; the planning community began incorporating learned components into traditional search algorithms.

AlphaZero (Silver et al. 2018) is the canonical achievement: MCTS with a learned value network (replacing rollouts) and a learned policy network (biasing selection).
The system was strong-superhuman in Go, chess, and shogi from self-play alone.
The architectural recipe — explicit search × learned function approximation — became the template for high-performance planning across many domains.

Parallel developments in learned heuristics for classical planning (Garrett, Chitnis, et al.; Toyer et al. 2018), in option discovery for hierarchical RL (Bacon, Harb, Precup 2017), and in differentiable planning architectures (Tamar et al. 2016) all pursued the same insight: search structure provides correctness; learning provides heuristic strength.

## 2020–present: The LLM era

Large language models reframed the planning problem.
Chain-of-thought prompting (Wei et al. 2022) showed that LLMs could be *induced* to produce step-by-step reasoning by prompt structure alone.
Tree of Thoughts (Yao et al. 2023) added explicit branching search.
ReAct (Yao et al. 2022) interleaved reasoning with environmental action.
The agentic-scaffolding ecosystem (AutoGPT, BabyAGI, LangChain agents) operationalized LLM-based planning loops.

The substrate is now token sequences rather than atom sets; the search is over partial reasoning traces rather than world states; the heuristic is a learned likelihood (the LLM's own continuation distribution) rather than an explicitly-derived admissible bound.
Frontier reasoning models (the o1 family from late 2024 onward, R1 in early 2025, and the post-2025 "test-time compute" generation) internalize inference-time search into the model itself: the model emits reasoning tokens whose total length scales with problem difficulty, and the training objective rewards search-as-process rather than only final-answer correctness.

This era's planning theorem is the [inference-time-compute-tradeoff](inference-time-compute-tradeoff.md) result: more inference-time compute scales accuracy through many orders of magnitude.
The corresponding open question — at what *rate* does inference-time compute substitute for training-time compute — is the central economics-of-AI question of the 2025–2027 cycle.

## What the arc shows

Three structural observations across the arc:

**Substrate invariance of search structure.** The four-phase template — branch, evaluate, select, backtrack — recurs across classical search, MCTS, and LLM tree-of-thoughts despite radical substrate differences.
The planning theory is, at its core, the theory of this template.

**Steady weakening of heuristic provenance.** Classical heuristics are derived from explicit problem structure with admissibility guarantees; AlphaZero's heuristics are learned from self-play with no admissibility but strong empirical performance; LLM heuristics are implicit in the model's training distribution with neither admissibility nor reliable empirical performance.
Each era's heuristic technology is broader-applicability and weaker-guarantee than its predecessor.

**Migration of cost from training to inference.** Classical planners have no training; AlphaZero has expensive training and moderate inference; modern reasoning models have very expensive training and even-more-expensive inference.
The economic balance is shifting toward inference-time compute as the principal lever for capability.

The contemporary research question — and the next chapter of the arc — is whether the *guarantees* of classical planning can be recovered in the LLM substrate.
See [can-classical-and-llm-planning-be-unified](can-classical-and-llm-planning-be-unified.md).
