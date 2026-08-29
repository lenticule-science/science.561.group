---
type: object
class: classical
status: active
depends-on: []
see-also:
  - world-model.md
  - latent-state-space.md
  - teaching/explanations/observation-model.md
references: []
---

# Observation space

The **observation space** $\Omega$ is the set of possible
observations the agent receives. It is the *interface* between
the environment and the agent: everything the agent knows about
the world arrives through $\Omega$.

## Forms

Observation spaces vary enormously across applications:

- **Pixels.** $\Omega = \{0, \ldots, 255\}^{H \times W \times 3}$,
  often around $10^4$–$10^6$ dimensions per frame. Used in
  Atari, robotics from camera, autonomous driving.
- **Structured states.** $\Omega = \mathbb{R}^d$ or finite sets
  for low-dimensional sensor readings, board positions, game
  states. Used in classical control, board games.
- **Tokens.** $\Omega = V^*$ where $V$ is a vocabulary. Used in
  language agents.
- **Multi-modal.** Combinations of pixels, audio, text, structured
  data — increasingly the default in foundation models.
- **Streaming.** Each observation arrives sequentially in time;
  the agent must maintain history. The "observation" is technically
  a single timestep, but the relevant signal is the trajectory.

## The observation-vs-state distinction

The observation space is *not* the state space. Observations are
typically a noisy, partial, possibly redundant function of the
underlying state. The agent's job is to *infer* state from
observations (see
[latent-inference](../morphisms/latent-inference.md)) and to
maintain enough internal state that one-step prediction is
Markovian. Observations themselves rarely satisfy this.

## Design choices that matter

The choice of observation space shapes everything downstream:

- **Information sufficiency.** If the observation space discards
  information critical to the task (no depth in a vision-only
  manipulation setup), no algorithm can recover it.
- **Dimensionality.** High-dimensional observation spaces
  (pixels) require representation learning to be tractable;
  low-dimensional structured states often allow direct learning.
- **Stationarity.** Observations whose distribution shifts over
  time (concept drift, distribution shift) confound learned
  models trained on a fixed sample.
- **Markov-friendliness.** Some observation spaces (chess board,
  full game state) are naturally Markovian; others (single video
  frames, single dialogue turns) are not, requiring history
  maintenance.
