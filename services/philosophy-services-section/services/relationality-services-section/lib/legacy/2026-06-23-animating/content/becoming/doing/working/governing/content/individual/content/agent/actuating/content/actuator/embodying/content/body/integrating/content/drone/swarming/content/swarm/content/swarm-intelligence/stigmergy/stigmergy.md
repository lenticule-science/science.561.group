---
type: concept
class: foundational
status: active
depends-on: []
see-also:
  - swarm-coordinated-system.md
  - pheromone-trail.md
  - ../objects/environment-trace-field.md
  - ../morphisms/trace-deposition.md
  - ../morphisms/trace-evaporation.md
references:
  - references/grasse1959.md
  - references/bonabeau-dorigo-theraulaz1999.md
  - references/camazine2001.md
---

# Stigmergy

Stigmergy is the coordination mechanism in which agents influence each other indirectly by modifying a shared environment, with later agents responding to the modifications rather than to the agents that made them.
The term was introduced by Pierre-Paul Grassé in 1959 to describe how termites coordinate complex nest construction without any individual termite holding a plan.
Each termite responds only to the local state of the partially constructed nest; the structure of the nest itself carries the coordination signal.

The defining property of stigmergic coordination is that the *channel of coordination is the environment itself*.
There are no addresses, no recipients, no messages typed by performative.
An agent deposits a trace; a later agent reads the trace as part of its local environment; the trace shapes the later agent's response.
The coordination is thereby decoupled in both space and time: agents that never coexist can coordinate through their shared modifications to a persistent medium.

## The two regimes of stigmergy

The classical literature distinguishes two regimes:

**Quantitative (sematectonic) stigmergy.** The trace is a continuous variable — pheromone concentration, terrain elevation, accumulated wear — and agents respond to its gradient.
Ant Colony Optimization and the classical boids environments are quantitative-stigmergic.

**Qualitative (sign-based) stigmergy.** The trace is a discrete structural state — a wall built, a stone placed, a marker dropped — and agents respond to its presence or pattern.
Termite nest construction and many cellular automata are qualitative-stigmergic.

The mathematical machinery differs between the two regimes; the swarm-intelligence theory's foundational theorems ([aco-convergence](../theorems/aco-convergence.md), [stigmergy-decouples-coordination-cost](../theorems/stigmergy-decouples-coordination-cost.md)) hold in both regimes with appropriate adaptation.

## What stigmergy is not

- **Not message passing.** A message has a sender and a recipient.
  A trace has neither.
  The trace exists in the environment independently of any agent.
- **Not shared memory.** A shared memory is read and written by named parties through an interface.
  A trace field has no interface; agents modify it through their physical or logical actions in the environment.
- **Not blackboard architecture.** A blackboard is a structured shared workspace with explicit read/write protocols.
  A stigmergic field is unstructured by design; the structure emerges from agent activity.
- **Not gossip protocols.** Gossip protocols are agent-to-agent message diffusion.
  Stigmergy has no inter-agent messages at all.

## Why stigmergy is structurally distinct

Stigmergic coordination has cost properties that orchestrated coordination cannot match.
In an orchestrated system the coordination cost grows with the number of pairs of communicating agents; in a stigmergic system the coordination cost grows only with the size of the trace field, which is a function of environment geometry rather than population size.
The [stigmergy-decouples-coordination-cost](../theorems/stigmergy-decouples-coordination-cost.md) theorem makes this precise.
This is the structural reason that biological swarms can scale to millions of individuals while orchestrated multi-agent LLM systems cannot scale beyond a handful (see the agents theory's [saturation-threshold](../../agents/theorems/saturation-threshold.md)).
