---
type: object
class: algorithmic
status: stable
depends-on:
  - planning-problem.md
see-also:
  - teaching/explanations/heuristic-search.md
  - ../morphisms/heuristic-relaxation.md
  - ../theorems/a-star-optimality.md
  - ../theorems/heuristic-relaxation-admissibility.md
references:
  - references/hart-nilsson-raphael1968.md
  - references/ghallab-nau-traverso2016.md
title: Heuristic function
description: "A heuristic function $h: S \\to \\mathbb{R}{\\geq 0}$ assigns to each state an estimate of the cost of an optimal path from that state to a goal state."
---

# Heuristic function

A **heuristic function** $h: S \to \mathbb{R}_{\geq 0}$ assigns to each state an estimate of the cost of an optimal path from that state to a goal state.
Heuristic functions are the principal vehicle by which domain knowledge is injected into search algorithms.

## Key properties

Let $h^*(s)$ denote the *true* optimal cost from $s$ to the nearest goal (or $\infty$ if no goal is reachable from $s$).

**Admissibility.** $h$ is *admissible* iff $$h(s) \leq h^*(s) \quad \text{for all } s \in S.$$ An admissible heuristic never overestimates remaining cost.
Admissibility is the precondition for the [a-star-optimality](a-star-optimality.md) theorem.

**Consistency** (also: monotonicity). $h$ is *consistent* iff for every state $s$ and every successor $s'$ of $s$ via action $a$: $$h(s) \leq c(a) + h(s').$$ Consistency is the heuristic analogue of the triangle inequality.
Every consistent heuristic is admissible (by induction along an optimal path); the converse fails (admissible-but-inconsistent heuristics exist).

Consistency matters operationally: with a consistent heuristic, A* can implement a closed list and never re-expand a node; with a merely-admissible heuristic, A* may need to re-open closed nodes, which complicates implementation but does not threaten optimality.

**Dominance.** Heuristic $h_1$ *dominates* $h_2$ iff $h_1(s) \geq h_2(s)$ for all $s$ and both are admissible.
A dominating heuristic expands no more nodes than the dominated one (with appropriate tie-breaking).
"Stronger" heuristics in this sense are always preferred when available; the bottleneck is the cost of computing the heuristic vs the savings in node expansions.

## Sources of heuristics

**Relaxation.** Solve a *simplification* of the planning problem; the optimal cost in the relaxation is admissible for the original.
Standard relaxations:

- **Delete relaxation** ($h^+$): drop the delete-list of every action, so atoms can never become false.
  Solving the relaxed problem is itself NP-hard, but cheap approximations (FF, additive heuristic) are widely used.
- **Abstraction**: project the state space to a coarser space (a pattern database is the abstraction's optimal cost table).
  Trades precomputation for runtime.
- **Landmark heuristics**: identify atoms that must be true at some point on every plan; cost is bounded below by the cost of achieving the landmarks.

The [heuristic-relaxation-admissibility](heuristic-relaxation-admissibility.md) theorem gives the general statement.

**Composition.** Take the maximum of multiple admissible heuristics (still admissible; usually dominates each component).
Take a *cost partition*: split action costs across heuristics in a way that lets their sum remain admissible.

**Domain-specific.** Hand-crafted heuristics encoding domain knowledge.
Often dominate domain-independent heuristics on the specific domain; not transferable.

**Learned.** Train a function approximator (typically a neural network) on solved instances to predict $h^*$ or a related quantity.
Learned heuristics are typically *not* admissible (they are empirical-loss minimizers, not lower bounds).
They sacrifice the A* optimality guarantee for empirical speed; in modern usage (notably AlphaZero's value network) they have been spectacularly successful in domains where admissible heuristics are weak.

## The cost-quality tradeoff

A heuristic that is closer to $h^*$ produces less search but is more expensive to compute.
Two extremes:

- $h \equiv 0$: trivially admissible; A* reduces to uniform-cost search and explores the entire $f \leq C^*$ contour.
- $h = h^*$: A* expands only nodes on the optimal path.
  But computing $h^*$ is solving the original planning problem.

The art is in finding heuristics in the productive middle: tight enough to prune most of the search space, cheap enough that the pruning savings exceed the heuristic-evaluation cost.

## In LLM planning

The "heuristic" in LLM-based inference-time search is implicit in the language-model logits over candidate continuations: the model's prior over what comes next is the heuristic ranking.
Modern systems augment this with explicit *value models* (separate networks trained to predict outcome quality) that play the role of an admissible heuristic but are not provably so.
