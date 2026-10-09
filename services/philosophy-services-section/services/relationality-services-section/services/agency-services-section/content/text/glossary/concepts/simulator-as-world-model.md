---
type: concept
class: classical
status: active
depends-on:
  - forward-model.md
see-also:
  - ../morphisms/sim-to-real-transfer.md
  - ../theorems/sim-to-real-gap-bound.md
  - teaching/explanations/world-models-vs-simulators.md
references:
  - references/kambhampati-llm-planning2024.md
title: Simulator as world model
description: "A simulator is a hand-engineered, executable specification of environment dynamics: physics engines (MuJoCo, Bullet, PhysX), game rules (chess, Go, StarCraft), business-logic environments (market simulators, ad-auction simulators), or…"
---

# Simulator as world model

A **simulator** is a hand-engineered, executable specification of
environment dynamics: physics engines (MuJoCo, Bullet, PhysX),
game rules (chess, Go, StarCraft), business-logic environments
(market simulators, ad-auction simulators), or robot dynamics
(Drake, Isaac Sim). When such a simulator is available, it
*is* the world model: the agent uses it directly for planning,
training, and evaluation.

## What simulators are good for

**Unbounded data.** Once a simulator runs faster than realtime,
the bottleneck on training data shifts from environment-interaction
cost to compute. AlphaZero, OpenAI Five, and most modern game-
playing systems exploit this: the simulator is the scarce
resource, not labeled data.

**Counterfactual evaluation.** A simulator lets you re-run with
the same initial conditions and a different policy, isolating the
policy's contribution to outcome. This is impossible in reality.

**Curriculum and exploration.** A simulator lets you place the
agent in arbitrary initial states, including states it would never
reach in normal operation. Critical for safety-relevant rare
events (autonomous-vehicle near-misses, financial-system stresses).

## What simulators are bad for

**Domain gap.** A simulator that is wrong in ways the policy
exploits will produce policies that fail in deployment. Classic
failure modes: friction model wrong, sensor noise mis-characterized,
adversary policies in the simulator that don't resemble real
adversaries. See
[sim-to-real-gap-bound](../../documents/articles/notes/undated/sim-to-real-gap-bound.md).

**Engineering cost.** Building a faithful simulator for a complex
domain (manipulation in cluttered scenes, social interaction,
markets with real participants) is often as hard as solving the
agent problem.

**Calibration impossibility.** For some domains there is no
ground truth to calibrate against — what should the simulator say
happens when an LLM agent attempts a novel social manipulation?
There is no oracle.

## Sim-to-real as the practical bridge

The dominant pattern is *train in simulation, deploy in reality*,
with explicit techniques to manage the sim-to-real gap:

- **Domain randomization.** Train across a distribution of
  simulators with randomized parameters (mass, friction,
  sensor noise) so the policy is robust to the real environment
  being some particular draw from that distribution.
- **System identification.** Use real-environment data to
  calibrate simulator parameters, narrowing the distribution.
- **Residual learning.** Train a residual policy on real data
  that corrects the simulator-trained baseline.

See [sim-to-real-transfer](../../documents/articles/notes/undated/sim-to-real-transfer.md).

## Simulator versus learned model

The simulator-vs-learned-model distinction is not always sharp.
Modern training pipelines use *learned* simulators (NeRF for
rendering, learned physics for deformable objects, learned
opponent policies for game agents). The line between "this is a
hand-engineered simulator" and "this is a learned world model" is
mostly about which parts are differentiable, which are tunable,
and which are frozen.
