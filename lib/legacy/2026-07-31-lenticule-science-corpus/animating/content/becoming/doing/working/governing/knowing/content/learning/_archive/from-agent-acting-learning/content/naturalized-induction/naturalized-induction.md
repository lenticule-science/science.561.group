---
type: concept
class: contemporary
status: active
depends-on:
  - embedded-agency.md
see-also:
  - logical-induction.md
  - ../objects/prior-belief.md
  - ../theorems/embedded-agent-impossibility.md
references:
  - references/demski-garrabrant2019.md
  - references/soares-fallenstein2015.md
---

# Naturalized induction

**Naturalized induction** is the problem of formulating inductive inference for an agent whose hypothesis space must include physical theories that *contain the agent itself* as a described subsystem.

## The problem

Solomonoff induction — the classical Bayesian limit, in which the prior is the universal semimeasure over computable hypotheses — assumes the agent stands outside the universe being modeled.
Each hypothesis is a Turing machine producing the agent's observation stream, and the agent updates by Bayes.

For an [embedded-agency](embedded-agency.md), this picture is incoherent in two ways:

1. **The agent is a physical subsystem.** The "true hypothesis" is a description of a universe that contains the agent.
  But the agent's input is not the universe's whole state; it is a coarse-grained slice (sense data) extracted by a physically-realized process (the agent's sensors and brain).
  How is the prior to be specified over universes that contain their own observers?

2. **The agent is uncertain about itself.** The agent does not know, with certainty, what its own source code is, where its sensors point, what its computational resources are.
  These are facts about the same universe the agent is trying to model.

## The anthropic puzzle

Naturalized induction is closely related to anthropic reasoning.
If the agent's prior includes universes with many observer- moments, how should the agent reason about which observer-moment *it* is?
The standard Self-Sampling Assumption and Self- Indication Assumption disagree on basic cases (the Doomsday argument, the Sleeping Beauty problem).
Embedded agents inherit this controversy, since the choice of anthropic principle affects update rules.

## Partial proposals

The agent-foundations literature offers partial responses:

- **Cartesian frames** (Garrabrant 2020) — a category-theoretic framework for specifying agent-environment boundaries that permits ambiguity.
- **Logical inductors** (Garrabrant 2016) — provide calibrated beliefs over logical sentences, including sentences about the inductor's own behavior.
  See [logical-induction](logical-induction.md).
- **Functional Decision Theory** — sidesteps part of the problem by treating the *decision algorithm* as the choice variable rather than the act.

None of these constitutes a complete solution.
Naturalized induction is one of the four open problems Demski-Garrabrant (2019) identify as central to the embedded-agency program.

## Why it matters

Without naturalized induction, the agent has no principled account of how it forms beliefs about a world that contains itself.
This propagates: the [mesa-optimization](../../alignment/concepts/mesa-optimization.md) analyses in alignment, the self-improvement arguments in [reflective-stability](reflective-stability.md), and the [vingean-reflection](vingean-reflection.md) problem of reasoning about more-capable successors all presuppose some account of how an agent represents and updates beliefs about itself.
