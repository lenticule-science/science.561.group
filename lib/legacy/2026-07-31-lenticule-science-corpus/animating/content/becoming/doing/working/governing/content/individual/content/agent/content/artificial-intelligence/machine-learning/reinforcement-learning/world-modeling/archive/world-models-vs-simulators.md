---
type: narrative
class: thematic
status: active
depends-on: []
see-also:
  - ../teaching/explanations/simulator-as-world-model.md
  - ../morphisms/sim-to-real-transfer.md
  - ../theorems/sim-to-real-gap-bound.md
references:
  - ../references/kambhampati-llm-planning2024.md
---

# World models vs simulators

A simulator and a learned world model occupy the same architectural
slot — both provide a transition function the agent can query for
prediction, planning, and imagination — but they arise from
qualitatively different processes and have different failure
modes. Understanding the differences is essential to choosing
the right approach for a given problem.

## Origin

A **simulator** is built. An engineer writes code implementing
known physics, game rules, business logic, or domain dynamics.
The dynamics are *specified*. Investment is in development, not
data collection.

A **learned world model** is induced. Data is collected from
some source (real interaction, simulation, logged trajectories);
parameters of a function approximator are fit to predict
transitions. The dynamics are *discovered*. Investment is in
data and compute.

## Where each excels

**Simulators excel** when:

- The dynamics are *understood*: classical physics, game rules,
  protocols. Engineering effort produces a faithful model.
- Speed-of-rollout matters more than precise calibration. Game
  engines roll out thousands of times faster than realtime.
- Counterfactual fidelity matters: a simulator can be queried
  with arbitrary initial conditions, including ones never
  observed in reality.
- Safety matters: training in simulation costs no real-world
  damage.

**Learned world models excel** when:

- The dynamics are *not understood* well enough to specify:
  manipulation in unstructured scenes, social interaction,
  market microstructure, soft-body physics with unmodeled
  friction.
- Adapting to a specific deployment environment matters:
  every patient's metabolism, every house's layout, every
  language model's user. The simulator would need
  per-instance recalibration; the learned model can adapt.
- The relevant abstractions are not obvious: the latent
  state space discovers what to track rather than requiring
  a priori specification.

## How each fails

**Simulator failures** are typically *systematic*. The simulator
omits a relevant dynamic (humidity affecting friction, traffic
behavior in a long-tail intersection geometry), and any policy
trained on the simulator is uniformly miscalibrated about that
dynamic. The failure is *predictable* in shape if not in
manifestation.

**Learned-model failures** are typically *distributional*. The
model is accurate on the training distribution and
catastrophically wrong off-distribution. The failure mode is
not a missing dynamic but a region of state space the model has
not seen. The failure is *unpredictable* in shape — the model
will produce confident, plausible-looking, completely wrong
predictions for OOD inputs.

This distinction matters for safety: a simulator's failure mode
is often discoverable by careful inspection of what was modeled;
a learned model's failure mode requires testing in regions of
state space the deployer has not yet explored.

## The increasingly blurred line

Modern systems hybridize:

- **Differentiable simulators** (Brax, MuJoCo MPC) make the
  simulator *partly learned* by tuning parameters to match
  real-world data while preserving structural correctness.
- **Learned residuals on simulators** add a learned correction
  term to a simulator's predictions, capturing reality that the
  simulator missed.
- **Neural physics engines** replace specific simulator
  components (cloth, fluid, contact) with learned models while
  keeping the rest hand-engineered.
- **Sim-then-real with adaptation.** Train policy on simulator;
  fine-tune on real data. The simulator and learned model
  contribute at different stages.

The pure simulator and pure learned model are endpoints of a
spectrum. Most successful real-world systems sit somewhere in
the middle, exploiting the relative strengths of each.

## The deeper question

Beneath the engineering choice is a deeper question: what is the
appropriate *level of abstraction* for representing environment
dynamics? Pixels, objects, concepts, language, mathematical
abstractions? See
[what-is-the-right-abstraction-level-for-world-models](../learning/questions/what-is-the-right-abstraction-level-for-world-models.md).
A simulator commits to a level by construction (the engineer
chose a representation); a learned model can in principle
discover one but is constrained by the form of its observations
and its inductive bias.
