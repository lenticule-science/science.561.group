---
type: object
class: foundational
status: stable
depends-on:
  - planning-problem.md
see-also:
  - plan-quality.md
  - teaching/explanations/plan-execution-monitoring.md
references:
  - references/ghallab-nau-traverso2016.md
title: Plan
description: "A plan is the output of a planner: a structured prescription for action that, when executed from the initial state of a planning problem, achieves the goal."
---

# Plan

A **plan** is the output of a planner: a structured prescription for action that, when executed from the initial state of a planning problem, achieves the goal.
The structure of the plan depends on the planning paradigm.

## Forms

**Sequential plan** $\pi = \langle a_1, a_2, \ldots, a_n \rangle$.
The classical form: an ordered sequence of ground actions.
Solves a classical planning problem if each $a_i$ is applicable in the state produced by $a_1, \ldots, a_{i-1}$ and the resulting final state satisfies the goal.

**Partial-order plan**: a partially-ordered set of actions with causal links.
Allows the planner to defer ordering decisions to execution time, exploiting parallelism among independent actions.
Common in classical-planning research; commercial planners often linearize before execution.

**Policy** $\pi: S \to A$.
The standard form for fully-observed stochastic planning (MDPs): for every state, what action to take.
Required because the agent does not know in advance which states will be visited.

**Contingent plan** (policy tree): a tree whose branches are conditioned on observations.
Each leaf is a goal state; each internal node specifies an action followed by an observation-conditioned branch.
Required for partial-observability planning.

**Conformant plan**: a sequence (no branching) that succeeds for every possible initial state and outcome.
Like a sequential plan, but verified against the entire belief.

**Belief-state policy** $\pi: \Delta(S) \to A$.
The standard form for POMDP planning.
Computationally hardest form; typically approximated by point-based policies or sampling.

## Plan quality

A plan can be *valid* (achieves the goal) or *optimal* (achieves the goal with minimum cost / maximum expected return).
Optimality is meaningful only with a [plan-quality](plan-quality.md) measure.

In classical planning, "the optimal plan" usually means "the lowest-total-cost valid plan."
In MDP planning, "the optimal policy" means "the policy maximizing expected discounted return."

## Plan as object vs plan as artifact

Two different uses of "plan" in the literature:

**Plan as mathematical object**: the formal element produced by the planner, with properties to prove (valid, optimal, of length $k$).
The above forms.

**Plan as deployable artifact**: the actual data structure executed by an agent in an environment, with execution-monitoring metadata, recovery branches, sub-plan invocations.
Production planning systems maintain richer plan structures than the mathematical object suggests (plans annotated with confidence estimates, alternative branches, fallback policies, monitoring conditions).
The artifact superset of the object.

The theorems in this theory concern the mathematical object; the plans actually executed by deployed planning systems are nearly always the artifact form.

## Connection to LLM planning

LLM-generated plans are typically sequential (a numbered list of steps) or weakly-hierarchical (steps that themselves expand to sub-steps).
The LLM produces plan tokens; the surrounding agent scaffold is responsible for execution, monitoring, and replanning.
The structural relationship between LLM plan output and the formal plan object is rarely made explicit in the deployed-system literature; whether LLM-output plans satisfy classical-plan validity properties (executability, goal-achievement) is empirical and problem-specific.
This is part of what makes [is-llm-cot-genuine-search](is-llm-cot-genuine-search.md) a substantive open question.
