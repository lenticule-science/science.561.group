---
type: narrative
class: historical
status: active
depends-on: []
see-also:
  - ../teaching/explanations/forward-model.md
  - ../teaching/explanations/model-based-rl.md
  - ../teaching/explanations/dreamer-style-world-model.md
references:
  - ../references/sutton-dyna1991.md
  - ../references/ha-schmidhuber-world-models2018.md
  - ../references/hafner-dreamer2020.md
  - ../references/schrittwieser-muzero2020.md
---

# From MDP to world model

The arc of model-based methods in AI runs from environments
**given** as MDPs to environments **learned** as world models —
from Bellman's original formulation, where the transition function
was a known stochastic matrix, to today's deep latent world models
that induce dynamics from pixels.

## Stage 1: MDP as given (1957–1980s)

In Bellman's foundational work and through the early development
of dynamic programming and reinforcement learning, the MDP was a
*specification*: someone wrote down $T(s' \mid s, a)$ and
$R(s, a)$, and the algorithm computed the optimal value function
or policy by backward induction or value iteration. The model
was an input, not an output.

This worked for small structured problems (inventory management,
queueing, simple board games) where the dynamics were genuinely
known. It did not extend to environments where dynamics were
unknown, complex, or only observable through interaction.

## Stage 2: Dyna and the integration of learning, planning, acting (1991)

Sutton's Dyna (1991) was the architectural breakthrough that
unified model-learning, planning, and acting into a single online
loop. Each real interaction was used three ways:

1. To update the policy directly (Q-learning).
2. To update an empirical model of the environment.
3. To drive simulated experience: query the model, perform
   additional Q-updates from imagined transitions.

Dyna established the pattern that all subsequent model-based RL
inherits: *interleave model-learning with policy-learning, use
the model to amplify each real sample*. See
[dyna-convergence](../theorems/dyna-convergence.md).

For two decades after Dyna, model-based RL remained tabular or
linear-functional and was outperformed by emerging deep model-
free methods (DQN, A3C). The model gave back less than it cost
when high-dimensional perception entered the picture.

## Stage 3: Deep latent world models (2018–)

Two papers reignited model-based RL by moving the model into a
*latent space*:

**Ha & Schmidhuber, World Models (2018).** Train a VAE on game
frames to compress them to a latent. Train an MDN-RNN on the
sequence of latents to model dynamics. Train a tiny controller
in pure imagination — never on real frames. Demonstrates
respectable performance on car-racing and Doom from imagination
alone.

**Hafner et al., Dreamer (2020).** Replace the VAE+MDN-RNN with
a unified Recurrent State-Space Model (RSSM). Train policy and
value with backprop through imagined trajectories. Achieves
state-of-the-art on continuous-control benchmarks with
substantially better sample efficiency than model-free competitors.

These papers demonstrate that the difficulty had been the
*pixel-prediction objective* — wasting capacity on visual detail
— rather than model-based RL itself. Latent dynamics are far
more learnable.

## Stage 4: End-to-end learned models without reconstruction (2020–)

**Schrittwieser et al., MuZero (2020).** Combine MCTS-style
planning with a learned latent dynamics model trained *only* on
reward, value, and policy targets — no observation reconstruction
at all. The model has no obligation to encode anything except
what supports good planning. State-of-the-art on Atari, Go,
chess, shogi without simulator access.

**LeCun, JEPA (2022).** Argue programmatically for joint-
embedding predictive architectures: predict the latent of the
next observation directly, never reconstruct pixels. Spend
capacity on what matters for prediction.

**Hafner et al., DreamerV3 (2023).** A single algorithm with
fixed hyperparameters solves Atari, DMControl, and Minecraft. The
generality marks the field's transition from "research demonstration"
to "drop-in algorithm".

## Stage 5: LLMs and the question of implicit world models (2022–)

The contemporary controversy: do next-token-trained LLMs
constitute implicit world models? They were trained on text
*about* the world, not on environment interaction. The
[llm-world-model-incoherence](../theorems/llm-world-model-incoherence.md)
empirical evidence is that they encode dense world-shaped
correlations without coherent forward-model structure. The
field is divided on whether scale alone could close the gap or
whether structurally different objectives are required. See
[are-llms-implicit-world-models](../learning/questions/are-llms-implicit-world-models.md).

## The arc in one sentence

The history runs from *the model is given* (Bellman) through
*the model is learned tabularly* (Dyna) through *the model is
learned in latent space from pixels* (Dreamer, MuZero) to the
contested question of *whether the model is implicit in
foundation models* (LLMs as world models). Each stage solved the
preceding stage's binding constraint and exposed a new one.
