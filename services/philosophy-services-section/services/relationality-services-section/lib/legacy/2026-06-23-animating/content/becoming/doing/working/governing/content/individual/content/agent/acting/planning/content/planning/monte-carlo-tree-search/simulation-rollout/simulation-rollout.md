---
type: morphism
class: algorithmic
status: stable
depends-on:
  - ../objects/planning-problem.md
see-also:
  - teaching/explanations/monte-carlo-tree-search.md
  - teaching/explanations/planning-under-uncertainty.md
references:
  - references/kocsis-szepesvari2006.md
  - references/silver-alphazero2018.md
---

# Simulation rollout

A **simulation rollout** is the operation of sampling a complete trajectory from a state $s$ to a terminal (goal or terminal-non-goal) state by repeatedly applying actions chosen by some *default policy*.
The rollout's outcome — a value, a goal-achievement bit, or some trajectory statistic — is used as an estimate of the value of $s$.

## The operation

```
rollout(s, π_default, simulator):
    trajectory ← [s]
    while not terminal(s):
        a ← π_default(s)            # sample action
        s ← simulator(s, a)         # advance state
        trajectory.append(s)
    return value(trajectory)
```

The rollout requires:

- A **simulator**: the ability to advance the environment one step given a state-action pair.
  In classical planning, this is the transition function.
  In MDPs, it is the stochastic transition kernel.
  In LLM planning, it is the LLM itself: "what comes next in this reasoning trace."
- A **default policy** $\pi_{\text{default}}$: the action-selection rule used during the rollout.
  Random in the simplest case; heuristic or learned in practice.
- A **value function** on completed trajectories: the goal-achievement bit, the cumulative reward, or a learned value estimate of the terminal state.

## Where rollouts are used

**MCTS simulation phase.** The rollout's outcome is backed up to update value estimates throughout the tree.

**Sample-based planning under uncertainty.** Many trajectories are sampled; the empirical distribution of outcomes approximates the true value of $s$.

**LLM inference-time search.** "Speculative" or "lookahead" generation in LLM agents: sample a continuation and evaluate it before committing.

**Replanning under deviation.** When a plan fails mid-execution, sample several continuations from the deviation point to find a recovery plan.

## Default-policy choice

The default policy determines whether the rollout is informative.

- **Random policy**: theoretically guaranteed to sample everywhere (eventually); practically informative only in domains where random play is non-trivial.
- **Heuristic policy**: handcrafted "play reasonably" rules.
  Better than random in most domains; expensive to design.
- **Learned policy**: a network trained to predict good actions.
  AlphaZero replaces random rollouts entirely with learned value-network evaluations; modern MCTS variants typically use learned default policies.

The art of MCTS-style planning is largely the art of default-policy design: a well-tuned default policy can make the difference between a tractable and a hopeless application of MCTS.

## Costs

**Computational**: each rollout requires one trajectory of simulator calls.
In MCTS variants where simulator calls are cheap (games, formal MDPs), thousands of rollouts per decision are typical.
In LLM planning, where each "simulator call" is an LLM forward pass, rollouts are expensive enough that few are taken per decision.

**Variance**: rollouts are samples; their variance can dominate the bias contribution to value estimation.
Variance-reduction techniques (control variates, importance sampling, common random numbers across rollouts) are standard in production implementations.

## Connection to model-based RL

A simulation rollout against a learned model is the principal tool of model-based RL: the agent uses its learned model to "imagine" trajectories, evaluates them, and updates its policy.
The boundary between planning (rollout against a known model) and model-based RL (rollout against a learned model) is the question of where the model came from; the rollout operation itself is identical.
