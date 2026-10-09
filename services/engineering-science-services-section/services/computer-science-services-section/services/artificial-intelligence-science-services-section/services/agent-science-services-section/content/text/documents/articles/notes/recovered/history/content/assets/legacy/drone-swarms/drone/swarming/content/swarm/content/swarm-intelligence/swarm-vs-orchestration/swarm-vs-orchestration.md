---
type: narrative
class: design-guidance
status: active
discusses:
  - ../theorems/swarm-vs-orchestration-dichotomy.md
  - ../theorems/llm-swarms-fail-classical-conditions.md
  - ../theorems/stigmergy-decouples-coordination-cost.md
  - ../../agents/concepts/coordination-topology.md
references:
  - ../references/bonabeau-dorigo-theraulaz1999.md
  - ../references/doan2025-llm-swarms.md
---

# Swarm vs orchestration: a design guide

The [swarm-vs-orchestration-dichotomy](../theorems/swarm-vs-orchestration-dichotomy.md) theorem says the architectural choice between the two regimes is qualitative.
This narrative gives practical guidance on which regime to choose for a given task.

## The decision tree

When designing a multi-agent system, ask in order:

**1.
Is the task structured by an explicit fitness landscape, an implicit one (path quality, resource flow), or by no notion of optimum at all?**

- *Explicit or implicit landscape with locally-evaluable solution components.* Swarm coordination is potentially applicable.
  Continue to question 2.
- *No notion of optimum, or the optimum is defined only by global semantic properties (correctness of a multi-step plan; quality of a piece of writing).* Swarm coordination is not applicable.
  Choose orchestration.

**2.
Can the per-agent cost be made $O(1)$ in the agent population?**

- *Yes.* Classical swarm-intelligence algorithms apply.
  Choose swarm coordination.
- *No, the agents must be expensive (LLMs, large models, complex reasoning).* Continue to question 3.

**3.
Can the task tolerate the loose coordination of stigmergic trace fields, or does it require per-message precision?**

- *Tolerates loose coordination.* The [stigmergic-context-engineering](../learning/questions/stigmergic-context-engineering.md) research direction may apply, but no convergence guarantees are available.
  Use cautiously and benchmark empirically.
- *Requires per-message precision.* Use orchestrated coordination.

In the LLM-agent regime, almost all tasks fall through to "use orchestrated coordination."
This is a structural fact, not a design preference.

## When swarm coordination is the right choice

The classical success cases of swarm intelligence:

| Task class | Algorithm | Why swarm works |
|---|---|---|
| Combinatorial optimization (TSP, VRP, scheduling) | ACO | Solution components evaluable locally; pheromone field captures path quality |
| Continuous function optimization | PSO | Velocity-based exploration of bounded landscapes |
| Network routing | ACO | Routes are paths through a graph; local evaluation matches problem structure |
| Pattern formation | Cellular swarms | Local rules produce global patterns directly |
| Robot swarm coordination | Various | Physical agents with cheap onboard computation |

In each case, the task has the structural properties that make swarm coordination viable: locally-evaluable components, bounded per-agent cost, tolerance of statistical coordination.

## When orchestration is the right choice

The cases where orchestration is structurally required:

| Task class | Why orchestration is required |
|---|---|
| Multi-step planning with causal dependencies | Plan correctness requires global structure; per-agent local evaluation insufficient |
| Dialog with specific counterparties | Per-message precision required; cannot use trace-mediated coordination |
| Software development | Tasks have role specialization (planning, coding, review, testing); homogeneity violated |
| Open-ended creative tasks | No fitness landscape; no convergence target |
| Multi-LLM ensemble reasoning | Per-agent cost dominated by LLM inference; scalability premise violated |

The agents theory applies in each of these cases.
Coordination overhead is $O(N^2)$ and the [saturation-threshold](../../agents/theorems/saturation-threshold.md) caps useful population size.

## The trap of partial conversion

A common pattern is taking an orchestrated multi-agent system and adding "swarm-like" features in the hope of improving scaling.
The patterns and the failures:

**Pattern: shared scratchpad.** Add a shared text scratchpad that all agents can read and write.
Hope that this provides stigmergic coordination.

*Failure:* the scratchpad does not have an evaporation mechanism; content accumulates indefinitely.
Each agent's read cost grows with scratchpad size, which grows with population size.
The scalability property is lost.

**Pattern: large agent populations with simplified prompts.** Use many LLM agents, each with a minimal prompt, to mimic the cheap-agent property of classical swarms.

*Failure:* even minimal LLM prompts dominate per-agent cost compared to classical swarm-intelligence agents.
The scalability gap remains many orders of magnitude.
Population size is still capped by token budget.

**Pattern: parallel agent calls without coordination.** Run $N$ agents in parallel on the same task and aggregate.
Hope that the parallelization recovers swarm scaling properties.

*Failure:* this is best-of-$N$ sampling, not coordination.
The [single-agent-parity-below-saturation](../../agents/theorems/single-agent-parity-below-saturation.md) theorem in the agents theory establishes that best-of-$N$ frequently matches multi-agent performance below the saturation threshold; this pattern collapses to best-of-$N$ and inherits its limits.

In each case, partial conversion fails.
The [swarm-vs-orchestration-dichotomy](../theorems/swarm-vs-orchestration-dichotomy.md) theorem makes the structural reason explicit: the three swarm- coordinated conditions are jointly required, and partial satisfaction gives no benefit.

## What hybrid architectures look like

Genuine hybrid architectures, where they exist, separate the swarm- coordinated layer from the orchestrated layer cleanly:

- **Substrate layer**: a population of cheap agents (often classical-swarm-intelligence agents, possibly purpose-built simulator agents) running a stigmergic coordination protocol on a shared environment.
- **Meta-layer**: a small number of LLM agents reading aggregated state from the substrate layer and making high-leverage decisions.

The substrate layer pays $O(N)$ per step in cost; the meta-layer pays $O(M^2)$ for $M$ small.
Total cost is $O(N + M^2)$ which is acceptable for $N \gg M$.
This is the design pattern the [hybrid-swarm-orchestration](../learning/questions/hybrid-swarm-orchestration.md) research question examines.

The discipline that makes this work is *strict separation*: the substrate layer's agents do not communicate with the meta-layer's agents directly.
The meta-layer reads aggregate state from the substrate; the meta-layer's outputs become parameters or reward signals for the substrate.
The interface is narrow and respects the cost properties of each layer.

## The closing rule

If the task admits the three swarm-coordinated conditions, use swarm coordination.
If it does not, accept orchestration's costs and keep agent counts small.
Do not try to combine the regimes by adding swarm-like features to an orchestrated system; the [swarm-vs-orchestration-dichotomy](../theorems/swarm-vs-orchestration-dichotomy.md) theorem says you will get the worst of both.
Do consider explicit hybrid architectures with strict layer separation; this is open research but the structural reasons it might work are visible.
