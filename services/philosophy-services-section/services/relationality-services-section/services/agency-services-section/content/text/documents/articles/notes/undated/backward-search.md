---
type: morphism
class: algorithmic
status: stable
depends-on:
  - ../objects/planning-problem.md
  - ../objects/search-tree.md
see-also:
  - forward-search.md
references:
  - references/ghallab-nau-traverso2016.md
  - references/fikes-nilsson-strips1971.md
title: Backward search
description: Backward search (regression planning) is the planning technique that explores the state space regressing from the goal toward the initial state.
---

# Backward search

**Backward search** (regression planning) is the planning technique that explores the state space *regressing* from the goal toward the initial state.
The search tree is rooted at the goal predicate; expansion of a node finds actions whose effects could establish the node's open conditions, replacing those conditions with the actions' preconditions; the search terminates when all open conditions are satisfied by the initial state.

## Mechanics

Backward search operates over *partial state descriptions* (sets of atoms that must hold) rather than complete states.
A node carries a *subgoal* set $\gamma \subseteq \mathrm{Atoms}$.
To regress over an action $a$ whose effects subsume some atom in $\gamma$, the node's new subgoal is

$$\gamma' = (\gamma \setminus \mathrm{add}(a)) \cup \mathrm{pre}(a)$$

provided $\gamma \cap \mathrm{del}(a) = \emptyset$ (the action does not delete any atom we still need).

The search succeeds when a node's subgoal $\gamma$ is satisfied by the initial state $s_0$ (i.e., $\gamma \subseteq s_0$).

## Why consider backward

**Goal-directedness for free.** Backward search is inherently biased toward the goal: every node represents a regressed goal description.
Forward search needs heuristics to provide goal-directedness; backward search has it structurally.

**Smaller search space when goal is sparse.** When the goal is a small subset of atoms (typical), the regressed-goal space is much smaller than the forward-state space, and backward search can dramatically outperform forward.

**Historical precedence.** STRIPS (Fikes & Nilsson 1971) was a backward planner; backward search dominated classical planning research for two decades.

## Limits

**Action selection is harder.** At each step, backward search must identify *all* actions whose effects subsume the open condition.
This is more expensive than forward's "all actions applicable in this state" (which can be precomputed).

**Inconsistent partial states.** Backward-regressed subgoals can become *inconsistent* (mutually contradictory atoms).
Detecting and pruning inconsistent subgoals requires per-domain reasoning; forward search's concrete states are always consistent.

**Heuristic asymmetry.** Most modern planning heuristics (FF, landmarks, abstraction) are designed for concrete forward states, not regressed subgoal descriptions.
This is a major reason forward search overtook backward in the 1990s: heuristic technology favored the forward direction.

## Bidirectional search

A natural hybrid: search forward from $s_0$ and backward from the goal simultaneously, succeeding when the two frontiers meet.
Theoretically attractive (each frontier is shallower); practically finicky (the meet condition over partial states is complex).
Used in some specialized planners; not dominant.

## In LLM planning

Backward search is unusual in LLM-based planning.
The dominant LLM planning paradigm is forward (extend the reasoning trace), in part because the LLM's natural-language outputs do not naturally represent regressed subgoals.
Some research explores "goal-conditioned" LLM planning that prompts the model with the goal first and asks it to produce a regression-style plan, but this is uncommon.

The structural reason: the LLM's prior is over forward-narrative text (problem statements followed by reasoning followed by answer), not over regressive proofs.
Eliciting backward search from an LLM typically requires substantial prompt engineering.
