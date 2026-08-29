---
type: morphism
class: contemporary
status: active
depends-on:
  - teaching/explanations/embedded-agency.md
  - ../objects/agent-environment-boundary.md
see-also:
  - ../objects/decision-algorithm.md
references:
  - references/demski-garrabrant2019.md
---

# Embedding

**Embedding** is the realization of an abstract decision algorithm as a physical computation in a particular environment.
A given algorithm can be embedded in many ways — different hardware, different boundaries, different I/O channels — and the choice of embedding is itself a structure the agent reasons about.

## The basic move

The agent-foundations program treats an agent as having a *Platonic algorithm* (the abstract computation) and one or more *embeddings* (physical realizations).
The same algorithm can be embedded as:

- An algorithm running on a CPU.
- A predictor's mental simulation of the algorithm.
- A copy of the agent in a Newcomblike scenario.
- A successor agent constructed by self-modification.

Functional Decision Theory leverages this by reasoning over the *algorithm*, treating all its embeddings as instances.
See [decision-algorithm](../objects/decision-algorithm.md).

## What an embedding specifies

A particular embedding fixes:

- The physical substrate executing the computation (electronics, neurons, paper-and-pencil, etc.).
- The [agent-environment-boundary](../objects/agent-environment-boundary.md): what counts as "the agent" in this realization.
- The I/O channels: which physical degrees of freedom carry observations in and actions out.
- The computational resources: time, memory, energy budget.

Two embeddings of the same algorithm can disagree on all of these and still implement the same decision-theoretic agent.

## When embedding matters

Embedding details matter when:

- The agent's *physical* properties affect what the agent can do (e.g. an agent embedded as a slow neural network cannot beat a chess engine running on a fast CPU, even if the abstract algorithm is the same).
- The agent's *physical* properties are observable to other agents who reason about it (e.g. an agent whose source code is visible can be cooperated with by predictors).
- The agent's *physical* properties affect its causal reach (e.g. an agent embedded as one process among many on a shared machine has different action space than an isolated agent).

## Why this is hard

Choosing the right level of abstraction — when to treat two embeddings as "the same algorithm" and when to treat them as distinct — is a deep open problem.
Source-equivalence is too strict (two compilations of the same program differ).
Behavioral equivalence is too coarse (would identify a chess-bot with a lookup table).
The agent-foundations literature has not converged.
