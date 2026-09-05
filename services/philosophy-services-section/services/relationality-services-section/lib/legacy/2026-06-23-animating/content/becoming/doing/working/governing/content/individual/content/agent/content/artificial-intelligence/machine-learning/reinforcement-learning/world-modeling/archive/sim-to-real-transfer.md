---
type: morphism
class: classical
status: active
depends-on:
  - teaching/explanations/simulator-as-world-model.md
see-also:
  - ../theorems/sim-to-real-gap-bound.md
  - teaching/explanations/world-models-vs-simulators.md
references:
  - references/kambhampati-llm-planning2024.md
---

# Sim-to-real transfer

**Sim-to-real transfer** is the morphism

$$
\text{(policy trained in simulator)} \;\longrightarrow\;
\text{(policy deployed in reality)}
$$

— the practical bridge between training in a fast, cheap, perfectly
controllable simulated environment and deploying in a slow,
expensive, partially-observable real one.

## Why the bridge is needed

For most physical-world tasks (robotics, autonomous driving,
hardware control) the simulator is the *only* training environment
that scales: real-environment data is bounded by physical wall
time, hardware costs, and safety constraints, while simulators
run faster than realtime and allow arbitrary curricula. But the
deployed policy must work in reality, where the simulator's
inevitable inaccuracies reveal themselves.

## Failure modes

A sim-trained policy can fail in deployment in qualitatively
distinct ways:

- **Reality is harder.** The simulator omitted noise or
  perturbations the real environment provides. The policy has not
  trained against them. (Sensor noise, actuator delays, dynamic
  obstacles.)
- **Simulator is harder.** The simulator over-modeled some
  difficulty (excessive friction, exaggerated noise). The policy
  is unnecessarily conservative or fails to exploit reality.
- **Exploitation.** The policy found a strategy that works only
  due to a simulator quirk (penetrating a wall, exploiting an
  edge case in the contact model). In reality the strategy
  doesn't exist.
- **Distribution shift.** The simulator's state distribution
  differs from reality, even if local dynamics are similar.
  Compounds over horizon.

## Standard techniques

**Domain randomization.** Train across a distribution of
simulators with randomized parameters: mass, friction, sensor
noise, lighting, textures. The policy is forced to be robust to
the variation. Reality is treated as one more sample from the
distribution. Used famously in OpenAI's robotic hand cube
manipulation. Limitation: randomization may produce overly
conservative policies.

**System identification.** Use real-environment data to estimate
simulator parameters (friction coefficients, motor gains, sensor
calibrations). Narrows the simulator distribution to one that
better matches reality. Limited by what's identifiable from
limited real data.

**Residual learning.** Train a base policy in simulation; on
real-world deployment, train a *residual* policy on real data
that corrects the simulator-trained baseline. The residual is
typically small and learnable from much less data than the full
policy.

**Adaptive curricula.** Continually move the simulator distribution
toward what reality looks like as more real data accumulates.
Couples simulator parameters to a real-world critic.

## The fundamental bound

Performance loss in sim-to-real transfer is bounded by the
discrepancy between the simulator and reality (in some appropriate
distance — TV divergence, Wasserstein) times the policy's
sensitivity (Lipschitz constant of value w.r.t. state distribution).
See
[sim-to-real-gap-bound](../theorems/sim-to-real-gap-bound.md).
This is fundamentally the same theorem as
[model-error-compounds](../theorems/model-error-compounds.md): a
small per-step model error becomes a large performance gap when
amplified by a long horizon and a non-robust policy.
