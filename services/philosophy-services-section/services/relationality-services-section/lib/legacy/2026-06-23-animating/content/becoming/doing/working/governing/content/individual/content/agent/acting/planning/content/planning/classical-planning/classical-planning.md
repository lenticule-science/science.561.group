---
type: concept
class: foundational
status: stable
depends-on: []
see-also:
  - heuristic-search.md
  - hierarchical-planning.md
  - ../objects/planning-problem.md
references:
  - references/fikes-nilsson-strips1971.md
  - references/ghallab-nau-traverso2016.md
---

# Classical planning

**Classical planning** is the canonical planning formalism: planning in environments that are *deterministic*, *fully observable*, *static*, *single-agent*, and *known* (the agent has a complete and correct model of the environment's dynamics).
The agent's task is to construct a sequence of actions whose execution from a known initial state leads to a state satisfying a goal predicate.

## The STRIPS formalism

The Stanford Research Institute Problem Solver (Fikes & Nilsson 1971) introduced the formalism that became canonical:

- **States** are sets of ground atoms (a closed-world database of what is true in the world).
- **Actions** are operators with a *precondition* (a conjunction of atoms that must hold for the action to be applicable) and an *effect* split into an *add list* (atoms that become true) and a *delete list* (atoms that become false).
- **Initial state** is a set of atoms.
- **Goal** is a conjunction of atoms.

A *plan* is a sequence of ground actions; it *solves* the problem if each action is applicable in the state produced by its predecessors and the final state satisfies the goal.

This is operationally what early AI planners (STRIPS, NOAH, NONLIN) implemented.
Modern variants (ADL adds disjunctive preconditions, quantifiers, and conditional effects; PDDL standardizes the input language) extend the syntax without changing the structural picture.

## Why the formalism is restrictive — and useful

The five restrictions (deterministic, fully observable, static, single-agent, known) jointly produce a clean computational object: the planner can reason purely about state-to-state transitions without modeling stochastic outcomes, hidden information, exogenous events, other agents, or model uncertainty.
The result is the mathematical core of "what does goal-directed action look like when the only difficulty is search."

The corresponding practical limitation: very few real planning problems satisfy all five restrictions.
Real environments are stochastic, partially observed, and dynamic; real agents have model uncertainty.
The classical formalism is therefore *not* a deployable technique for most real problems but the formal substrate against which extensions (planning-under-uncertainty, multi-agent planning, online replanning) are defined and analyzed.

## Connection to other paradigms

**To heuristic search.** A classical planning problem induces a search problem on its state space; classical planning is solved by [heuristic-search](heuristic-search.md) techniques (A*, IDA*, GBFS) with [heuristic-functions](../objects/heuristic-function.md) derived from the problem structure.

**To reinforcement learning.** RL solves a strict generalization (stochastic, often partially observed, model unknown).
When the model is known and dynamics are deterministic, RL reduces to classical planning; when the model is known and dynamics are stochastic, it reduces to MDP planning (value iteration, policy iteration).
RL's value of using interaction-based learning is exactly when classical planning's *known model* assumption fails.

**To hierarchical planning.** Classical planning composes vertically through [hierarchical-planning](hierarchical-planning.md): high-level abstract tasks are decomposed into sequences of lower-level sub-tasks, each themselves classical planning problems.
The HTN formalism extends classical planning by adding decomposition methods.

**To inference-time LLM search.** Modern LLM planning ([inference-time-search](inference-time-search.md)) operates over a state space of partial plans or token sequences rather than ground atoms, but inherits the classical structure: states, actions (token-level or step-level), goal predicate (verifier or reward model), and search procedure.
The [is-llm-cot-genuine-search](questions/is-llm-cot-genuine-search.md) question asks whether the analogy is structural or superficial.

## Status

Classical planning is *the* foundational concept of the planning theory.
Most subsequent developments (HTN, MDP planning, POMDP planning, contingent planning, LLM planning) are extensions or variants whose departures from the classical assumptions are the substantive content.
