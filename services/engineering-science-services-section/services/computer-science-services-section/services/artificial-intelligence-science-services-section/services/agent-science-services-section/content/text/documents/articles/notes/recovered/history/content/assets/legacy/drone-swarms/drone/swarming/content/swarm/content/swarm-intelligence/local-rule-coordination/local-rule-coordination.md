---
type: concept
class: foundational
status: active
depends-on: []
see-also:
  - swarm-coordinated-system.md
  - emergence.md
  - ../objects/neighborhood.md
  - ../morphisms/neighbor-sensing.md
  - ../morphisms/position-update.md
references:
  - references/reynolds1987.md
  - references/bonabeau-dorigo-theraulaz1999.md
---

# Local-rule coordination

Local-rule coordination is the discipline that each agent in a swarm acts only on bounded, locally observable information about its immediate neighborhood and the trace field at its location.
No agent has access to global state; no agent receives the joint state of the population.

The locality constraint is structural, not incidental.
It is what enables the [scalability premise](scalability-premise.md): if every agent's input were the joint state of the population, the per-agent cost of a single step would scale with population size, and the swarm-coordinated regime would degenerate into the orchestrated regime.

## The bounded-information condition

For a system to operate by local-rule coordination, the per-agent input at each step must be characterizable as a function of:

- The agent's own internal state (position, velocity, personal best, etc.).
- The trace-field values at the agent's location and an O(1)-radius neighborhood of it.
- The visible state of agents in an O(1)-radius [neighborhood](../objects/neighborhood.md).
- A bounded source of randomness.

The bound on the neighborhood radius is what distinguishes local-rule coordination from "all agents see all other agents," which is the peer-to-peer topology of the orchestrated regime.

## Local in space, local in time

Local-rule coordination is bounded both spatially and temporally:

- **Spatial locality**: as above, the input is bounded to a neighborhood.
- **Temporal locality**: the input does not include arbitrary history.
  The agent may have bounded internal state with a small amount of recent-past information (PSO particles remember their personal best; ants do not), but it does not consult arbitrary historical state.

Temporal locality is what distinguishes swarm-coordinated agents from agents with persistent memory in the [agents theory](../../agents/_index.md) sense.
A swarm-coordinated agent's "memory" is in the trace field, not in the agent.

## The price of locality

The information available to a swarm-coordinated agent is strictly less than the information available to an orchestrated agent in a peer-to-peer topology.
This is a constraint, not a feature; some problems cannot be solved by local-rule-only systems.
The trade-off is between:

- **Bounded per-agent cost** (locality buys this) versus **arbitrary per-agent capability** (orchestration buys this).
- **Scalability to large populations** (locality buys this) versus **fine-grained coordination** (orchestration buys this).

The choice between regimes depends on whether the task admits local-rule solutions.
Path optimization, function optimization in continuous spaces, and pattern formation in spatial domains admit local-rule solutions and are the canonical swarm-intelligence application areas.
Tasks that require representing the global state explicitly (planning a multi-step sequence with causal dependencies, the agents theory's [goal-directed-planning](../../agents/concepts/goal-directed-planning.md)) do not admit local-rule solutions.

## Why locality matters for LLM swarms

LLM agents communicating via natural language frequently violate the bounded-information condition.
A typical "LLM swarm" architecture passes a growing context window across agents, with each agent's input including all prior agent contributions.
The input size grows with the number of agents that have already acted; the system is not local-rule.
The [llm-swarms-fail-classical-conditions](../theorems/llm-swarms-fail-classical-conditions.md) theorem makes this precise.
