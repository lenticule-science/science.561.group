---
type: narrative
class: positioning
status: active
discusses:
  - ../teaching/explanations/swarm-coordinated-system.md
  - ../teaching/explanations/stigmergy.md
  - ../teaching/explanations/scalability-premise.md
  - ../theorems/llm-swarms-fail-classical-conditions.md
references:
  - ../references/grasse1959.md
  - ../references/reynolds1987.md
  - ../references/dorigo1992.md
  - ../references/kennedy-eberhart1995.md
  - ../references/bonabeau-dorigo-theraulaz1999.md
  - ../references/doan2025-llm-swarms.md
---

# From classical to LLM swarms: a history and a critique

The contemporary use of "swarm" in the LLM-agent literature carries implications inherited from a sixty-year intellectual history of swarm-intelligence research.
This narrative traces that history, the properties of the systems it studied, and the structural reasons that LLM-agent systems do not inherit those properties despite frequently being described in the same vocabulary.

## The biological roots: Grassé and the discovery of stigmergy (1959)

Pierre-Paul Grassé observed termites constructing elaborate nests without any individual termite holding a plan.
He coined the term *stigmergy* — from the Greek *stigma* (sign) and *ergon* (work) — to describe the coordination mechanism: each termite responds only to the local state of the partially constructed nest; the nest itself carries the coordination signal.
Subsequent biological work (E.O. Wilson on ants, work on social insects generally) established that stigmergic coordination is the dominant mechanism in social-insect societies and that the colony-level intelligence vastly exceeds what any individual insect could achieve.

The defining feature of stigmergic coordination, identified in this biological work, is *the decoupling of agents in space and time*: agents that never coexist still coordinate through their shared modifications to a persistent medium.
This is structurally different from any system in which agents communicate by direct messaging, and it is the property that the [stigmergy](../teaching/explanations/stigmergy.md) concept names.

## Reynolds and emergence: the boids model (1987)

Craig Reynolds' 1987 paper "Flocks, Herds and Schools: A Distributed Behavioral Model" demonstrated that complex flocking behavior emerges from three simple local rules — separation, alignment, and cohesion — applied identically by every simulated bird (boid).
No boid contained a representation of "the flock"; the flock-level behavior was an *emergent* property of the local rules.

Reynolds' contribution was methodological: it established that emergence is a constructive property of well-chosen local rules, not a mysterious systems property.
The [emergence](../teaching/explanations/emergence.md) concept and the [emergence-requires-local-determinism](../theorems/emergence-requires-local-determinism.md) theorem are direct intellectual descendants of this constructive view.

## Dorigo and Ant Colony Optimization (1992)

Marco Dorigo's 1992 PhD thesis introduced Ant Colony Optimization, translating the biological pheromone-trail mechanism into a combinatorial-optimization algorithm.
The key technical contributions: the [pheromone field](../objects/pheromone-field.md) abstraction with explicit deposition and evaporation operators, the probability sampling rule for path selection, and (in subsequent work with Stützle) the explicit boundedness conditions that yield the [aco-convergence](../theorems/aco-convergence.md) theorem.

ACO became the canonical demonstration that swarm-intelligence ideas could deliver competitive performance on hard combinatorial-optimization problems (TSP, vehicle routing, network routing, scheduling).
It established that "swarm intelligence" is not just biological description but a genuine engineering paradigm.

## Kennedy and Eberhart and Particle Swarm Optimization (1995)

James Kennedy and Russell Eberhart's 1995 paper introduced Particle Swarm Optimization, motivated by Reynolds' boids and by social- psychological models of opinion dynamics.
Each particle moved in a search space, adjusting its velocity based on its own best-observed position and the swarm's best-observed position.
Subsequent analytical work (Clerc–Kennedy 2002; Trelea 2003) established the parameter regions for stable convergence, yielding the [pso-local-convergence](../theorems/pso-local-convergence.md) theorem.

PSO and ACO became the two canonical swarm-intelligence algorithms, each with formal convergence guarantees and broad practical adoption.

## The consolidating textbook: Bonabeau, Dorigo, Theraulaz (1999)

*Swarm Intelligence: From Natural to Artificial Systems* (1999) consolidated the field.
It established the standard taxonomy of mechanisms (stigmergy, self-organization, emergence), the canonical algorithms (ACO, PSO, and several others), and the structural properties that distinguish swarm-intelligence systems from other multi-agent systems: the [scalability premise](../teaching/explanations/scalability-premise.md), [homogeneity](../teaching/explanations/homogeneity.md), and the central role of [local-rule coordination](../teaching/explanations/local-rule-coordination.md).

The textbook also established the field's normative commitment: swarm intelligence is the study of *cheap, simple agents producing coordinated behavior at scale*.
The cost asymmetry — many cheap agents collectively outperforming few expensive ones — is the structural identity of the field.

## The arrival of LLM agents (2022–2024)

The arrival of LLM-based agentic systems in 2022–2024 was accompanied by an immediate vocabulary appropriation.
"Swarm" terminology was applied freely to multi-agent LLM systems: OpenAI's "Swarm" framework for handoff-based agent coordination, "AgentVerse," "AutoGen multi-agent debate," and many others.
The implicit suggestion: these systems inherited the desirable properties of classical swarm-intelligence systems.

By the analysis of the [swarm-vs-orchestration-dichotomy](../theorems/swarm-vs-orchestration-dichotomy.md) theorem, this is wrong: most "LLM swarm" architectures are orchestrated multi-agent systems in the precise sense of the [agents theory](../../agents/_index.md).
They do not satisfy the three swarm-coordinated conditions and do not inherit any of the classical swarm-intelligence convergence guarantees.

## The 2025 critique: Doan et al.

In June 2025, Doan et al.'s arXiv preprint *"LLM-Powered Swarms: A New Frontier or a Conceptual Stretch?"* (arXiv 2506.14496) made the critique explicit.
The paper's central argument:

- LLM agents violate the **scalability premise** by many orders of magnitude.
- Natural-language coordination violates the **local-rule** discipline.
- Closed-form convergence guarantees do not transfer.

The paper does not deny that LLM-agent collectives can be useful; it denies that they are swarms in the technical sense the classical literature established.
The [llm-swarms-fail-classical-conditions](../theorems/llm-swarms-fail-classical-conditions.md) theorem makes this critique precise within the present theory.

## Where this leaves us

The field is at an honest impasse.
There is no mathematical theory of LLM-agent collectives comparable in rigor to classical swarm- intelligence theory.
There are open research directions ([when-do-llm-agents-form-a-swarm](../learning/questions/when-do-llm-agents-form-a-swarm.md); [stigmergic-context-engineering](../learning/questions/stigmergic-context-engineering.md); [hybrid-swarm-orchestration](../learning/questions/hybrid-swarm-orchestration.md)) that may close the gap, but as of mid-2026 they have not.

The honest engineering position is:

- Use LLM-agent systems where their flexibility and reasoning power justify the cost; deploy them as orchestrated systems with the cost properties characterized by the [agents](../../agents/_index.md) theory.
- Use classical swarm-intelligence algorithms where the problem fits: combinatorial optimization, function optimization, pattern formation, routing.
- Do not expect a single architecture to deliver both the reasoning power of LLMs and the cost properties of classical swarms.
  The swarm-vs-orchestration dichotomy is structural.
