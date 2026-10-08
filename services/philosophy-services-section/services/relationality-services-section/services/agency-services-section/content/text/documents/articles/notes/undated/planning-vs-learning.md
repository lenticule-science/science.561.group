---
type: narrative
class: structural
status: stable
depends-on:
  - ../teaching/explanations/classical-planning.md
  - ../teaching/explanations/planning-under-uncertainty.md
  - ../teaching/explanations/monte-carlo-tree-search.md
see-also:
  - ../../reinforcement-learning/_index.md
  - from-strips-to-llm-planning.md
references:
  - ../references/ghallab-nau-traverso2016.md
  - ../references/silver-alphazero2018.md
title: Planning vs learning
description: "Planning and learning address the same underlying problem from opposite sides: how should an agent select actions to achieve goals in an environment?"
---

# Planning vs learning

Planning and learning address the same underlying problem from opposite sides: how should an agent select actions to achieve goals in an environment?
The distinction is not in the problem but in the *informational starting point*.

## The structural distinction

**Planning** operates on a *known* model.
The agent has the environment's transition function, reward function, and (in the classical case) initial state.
Its task is purely computational: search the state space to find action sequences leading to goals.
The agent does not need to interact with the environment to plan; it can plan in simulation and execute the plan once.

**Learning** operates on an *unknown* model.
The agent does not have the environment's dynamics; its task is to *infer* the right policy from interaction with the environment.
The information arrives through experience — observations, rewards, consequences — and the policy is updated incrementally as experience accumulates.

This is the principal axis of distinction.
Two derivatives:

**Time of computation.** Planning concentrates compute *before* acting; learning spreads compute across action episodes.

**Cost of mistakes.** A learning agent's mistakes are part of its training process; a planning agent's mistakes (wrong-model planning applied to a real environment) are pure errors.

## The two extremes are rare

In practice, almost no system is purely planning or purely learning.
Real systems sit on a *spectrum* defined by how much model is given versus how much is inferred:

| System | Model status | Planning component | Learning component |
|---|---|---|---|
| Classical STRIPS planner | Fully given | Forward / backward search | None |
| Model-based RL (Dyna) | Partially given, partially learned | Value iteration on model | Model learning from experience |
| AlphaZero (training) | Game rules known; value/policy unknown | MCTS using current value/policy | Value/policy network update |
| AlphaZero (inference) | Game rules + trained networks | MCTS | None per-game |
| Model-free Q-learning | Fully unknown | None | Q-update from experience |
| LLM CoT reasoning | "Soft" world model in weights | Inference-time CoT search | None per-task; model trained off-task |
| LLM agentic loop | Mix of structured and unstructured | LLM-internal CoT plus environment-grounding | None per-task; model trained off-task |

The classical planning end of the spectrum requires a complete model; the model-free RL end requires no model at all; everything useful in between trades off how much model is provided against how much is to be learned.

## Where planning is preferred

Planning is preferred over learning when:

1. **The model is reliable.** A correct, explicit model lets planning compute the optimal action without environmental exploration.
  Learning is unnecessary overhead.
2. **Mistakes are costly.** In safety-critical domains (medicine, robotics in human environments), the agent cannot afford to "explore" — every action must be principled.
  Planning against a known model gives this; learning by trial-and-error does not.
3. **Sample efficiency matters.** Planning is dramatically more sample-efficient than learning when the model is available; one high-quality plan beats thousands of random rollouts.
4. **Goal specifications change.** A new goal in a planning system triggers a new plan against the same model; a new goal in a learning system requires retraining (unless the system is goal-conditioned).

## Where learning is preferred

Learning is preferred over planning when:

1. **The model is unavailable or unreliable.** Real environments are typically partially understood.
  Learning lets the agent discover the dynamics by interaction.
2. **The model is intractable to plan over.** Even when a model is in principle available (e.g., the laws of physics, the rules of Go), planning over it may be infeasible due to state-space size.
  Learning compresses the model into an executable policy.
3. **The environment is non-stationary.** A model becomes obsolete when the environment changes; learning adapts.
  Planning requires re-modeling.
4. **The required behavior is opaque to specification.** Some tasks (write a good poem, hold a natural conversation) cannot be captured in an explicit cost function or transition model.
  Learning from examples or from reward signals is the only tractable approach.

## The hybrid: AlphaZero and its descendants

The AlphaZero recipe shows the planning-learning hybrid at its most elegant.
The model (Go rules) is fully known; planning (MCTS) is the action-selection mechanism.
But the planning's heuristics (value of a position, prior over moves) are *learned* from self-play.
The system learns precisely the components that planning needs to be tractable, while exploiting the structure planning needs to be correct.

This recipe — *learned components inside an explicit search structure* — has spread far beyond games:

- Robotics: learned dynamics models inside model-predictive control
- Compilers: learned cost models inside instruction selection
- Theorem proving: learned proof-search heuristics inside tactic-based provers
- Drug discovery: learned scoring functions inside molecular search
- Most current LLM-based reasoning: learned model components and learned verifiers inside explicit search procedures

## Where LLMs sit

LLMs are an interesting case.
The language model is itself a learned artifact — fundamentally a learning system.
But its operation as a planner (chain-of-thought, tree-of-thoughts, ReAct) is a *planning-like* search over reasoning steps.
The "model" being planned over is the LLM's internal next-token distribution; the planner is an inference-time procedure on top of the LLM.

So an LLM planning agent is a *planning system whose model is itself a learned artifact*.
This is a different hybrid pattern from AlphaZero (where the model is given and the heuristics are learned); in LLM planning, both are learned, with planning structure imposed externally.

The implications for both correctness and compute economics are substantial — this is the principal organizing question of the contemporary planning literature, and the bulk of the [is-llm-cot-genuine-search](is-llm-cot-genuine-search.md) debate.

## Composition with other theories

The planning–learning relationship is one of the principal axes relating this theory to its siblings:

- The [reinforcement-learning theory](../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/acting/planning/content/reinforcement-learning/_index.md) is the *learning* side of the same problem; planning under known MDPs (value iteration, policy iteration) is the boundary between the two theories.
- The [agents theory](../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/acting/planning/content/agents/_index.md) provides the surrounding agentic-system context that both planning and learning slot into.
- The [alignment theory](../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/acting/planning/content/alignment/_index.md) raises the question of *whose* goals are being planned for or learned; neither planning nor learning is, on its own, an answer to the alignment problem.
