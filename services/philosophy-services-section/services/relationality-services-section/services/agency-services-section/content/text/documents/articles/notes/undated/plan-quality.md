---
type: object
class: foundational
status: stable
depends-on:
  - plan.md
see-also:
  - planning-problem.md
references:
  - references/ghallab-nau-traverso2016.md
title: Plan quality
description: Plan quality is the measure by which one valid plan is preferred over another.
---

# Plan quality

**Plan quality** is the measure by which one valid plan is preferred over another.
The choice of quality measure changes what "optimal" means and which planning algorithms are appropriate.

## Standard measures

**Total cost.** $\mathrm{cost}(\pi) = \sum_{a \in \pi} c(a)$, where $c$ is the action-cost function on the planning problem.
The canonical measure for cost-optimal classical planning.
A* with admissible heuristic produces cost-optimal plans.

**Plan length.** The number of actions in the plan.
The default when no cost function is given.
BFS produces length-optimal plans.

**Makespan.** For partial-order plans with parallelism, the duration of the longest critical path.
Relevant for scheduling-style problems where actions can occur concurrently.

**Expected return.** For MDP planning, the expected sum of (typically discounted) rewards.
The optimal MDP policy maximizes this.

**Robustness.** The plan's tolerance to execution-time deviations: how many step failures it can absorb without total failure.
Hard to measure precisely; often proxied by the number of recovery branches in a contingent plan.

## Multi-objective settings

Real planning problems often involve multiple competing quality measures: cost, time, risk, side-effects, robustness.
Standard approaches:

- **Scalarization**: combine measures into a single weighted sum $Q = \sum_i w_i Q_i$ and optimize that.
  Requires choosing weights before planning; loses information about tradeoffs.
- **Pareto optimization**: find the Pareto frontier of plans non-dominated under any weighting.
  Computationally expensive; produces a set of plans for the user to choose among.
- **Lexicographic**: order measures by priority; optimize the highest-priority measure subject to constraints on the others.
  Common in safety-relevant domains where a hard "no constraint violation" comes before any soft optimization.

## Soft vs hard goals

Classical planning treats the goal as a *hard* constraint: a plan is either valid (achieves the goal) or invalid.
Modern formulations generalize:

- **Soft goals**: each potential outcome carries a utility; the planner maximizes expected utility subject to feasibility.
  This generalizes both classical hard-goal planning (utility = 1 if goal achieved, 0 otherwise) and MDP reward-maximization.
- **Goal-utility planning** (PDDL3, oversubscription planning): multiple goals with different priorities; the planner achieves a utility-maximizing subset.

These reframings extend the planning theory toward decision theory.

## Quality in LLM planning

LLM-generated plans are typically not evaluated against an explicit quality measure; the LLM produces "a plan" and the surrounding scaffold accepts it.
This is one of the principal weaknesses of deployed LLM-agent systems: there is no formal notion of "the LLM chose this plan because it is optimal under measure $Q$"; there is only "the LLM produced this plan because its prior favored it."

When LLM planning systems do evaluate quality, the evaluator is typically another LLM call (self-evaluation, often unreliable) or a domain-specific verifier (math correctness, code execution success).
The development of robust quality measures for LLM-planned actions is an active research area; the value-model component of inference-time-search systems is one direction.

## Connection to other theories

Plan quality is the planning-theory side of the *evaluation* problem addressed by the [capability-evaluation](../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/acting/planning/content/planning/alignment/_index.md) part of the alignment theory and by the broader literature on AI evaluation.
What counts as a "good plan" is not purely formal — it depends on the principal's preferences, which in alignment terms is the specification problem.
