---
title: "World Modeling"
component-of: artificial-intelligence
type: theory
class: engineering-theory
status: active
discipline: >
  The formal study of how agents represent the dynamics of their
  environment and use those representations to predict, plan, and act.
  The theory covers explicit forward models in model-based
  reinforcement learning (Dyna, MuZero, Dreamer), latent world models
  in which dynamics are learned in a compressed representation
  (Ha-Schmidhuber world models, Dreamer, JEPA), the relationship
  between simulators and learned models, the sim-to-real transfer
  problem, and the contemporary question of whether large language
  models constitute implicit world models of the textual or
  multi-modal universe they were trained on. It engages classical
  literature (Sutton 1991, Kaelbling-Littman-Cassandra 1998), the
  modern model-based RL literature (Ha-Schmidhuber 2018, Hafner et al.
  2020/2023, Schrittwieser et al. 2020), and the contemporary debate
  on LLMs as world models (Kambhampati 2024, LeCun 2022).
position: >
  This theory is a sibling of [agents](../agents/_index.md),
  [reinforcement-learning](../reinforcement-learning/_index.md),
  [swarm-intelligence](../swarm-intelligence/_index.md),
  [alignment](../alignment/_index.md), and
  [planning](../planning/_index.md) within the artificial-intelligence
  branch. Where the agents theory characterizes what makes a system
  agentic, RL addresses how an agent updates its policy from reward,
  alignment addresses whether the agent's goals match its principal's,
  and planning addresses how the agent constructs a course of action
  from *known* dynamics, the world-modeling theory addresses the
  prior question: *where do those dynamics come from?* The theory
  provides the formal substrate for the transition relation that
  classical planning and model-based RL both presuppose, analyzes
  the consequences of model error (which compounds with horizon),
  and engages the contemporary controversy over whether LLMs'
  next-token-prediction objective induces an implicit world model
  or merely a surface-statistics predictor.
---

The world-modeling theory gives formal structure to the family of
methods by which agents represent environment dynamics and use those
representations for prediction, planning, and action. It answers
four questions precisely:

**What is a world model?** Formally, a world model is a (possibly
latent) state space, a transition function over that state space,
and an observation function relating latent state to observable
data. The agent's task is to learn the transition and observation
functions from interaction data, and then to use the learned model
to predict, plan, or imagine. See
[world-model](objects/world-model.md) and
[forward-model](concepts/forward-model.md).

**How does model error propagate?** Even small per-step prediction
errors compound exponentially with planning horizon under generic
conditions. This places a fundamental constraint on the planning
horizon achievable with a learned model and motivates techniques
like model-predictive control with short rollouts, ensemble
disagreement for uncertainty estimation, and trust-region planning.
See
[model-error-compounds](theorems/model-error-compounds.md) and
[model-prediction](objects/model-prediction.md).

**How do learned world models relate to simulators?** A simulator
is a *given* model — a hand-engineered transition function
implemented in code. A learned world model is *induced* from data.
Sim-to-real transfer is the bridge: train in simulation (cheap,
unbounded data) and deploy in reality (expensive, limited data).
The transfer succeeds insofar as simulator-reality discrepancy is
small or insofar as the policy is robust to the discrepancy. See
[sim-to-real-transfer](morphisms/sim-to-real-transfer.md) and
[sim-to-real-gap-bound](theorems/sim-to-real-gap-bound.md).

**Are LLMs world models?** Large language models trained on
next-token prediction over web-scale text develop representations
that pass many tests of world-knowledge: they answer factual
questions, simulate dialogue, predict physical outcomes in
described scenarios. Whether this constitutes a *world model* in
the technical sense — a coherent, queryable, predictively
accurate representation of environment dynamics — or whether it
is sophisticated surface-statistics matching of world-shaped text
is contested. The empirical evidence is mixed: LLMs exhibit
systematic incoherences (contradicting themselves across queries,
failing on novel physical reasoning) but also striking
generalization to unseen scenarios. See
[llm-as-world-model](concepts/llm-as-world-model.md),
[llm-world-model-incoherence](theorems/llm-world-model-incoherence.md),
and
[are-llms-implicit-world-models](questions/are-llms-implicit-world-models.md).
