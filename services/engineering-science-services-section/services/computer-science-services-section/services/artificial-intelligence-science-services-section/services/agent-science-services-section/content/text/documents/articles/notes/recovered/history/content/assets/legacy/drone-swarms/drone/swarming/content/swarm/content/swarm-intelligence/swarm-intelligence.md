---
title: "Swarm Intelligence"
component-of: artificial-intelligence
type: theory
class: engineering-theory
status: active
discipline: >
  The formal study of swarm-coordinated multi-agent systems: collections of
  simple agents that produce coherent global behavior through local interaction
  rules and indirect coordination via environmental traces (stigmergy), without
  central control. The theory covers the structural prerequisites for swarm
  coordination (the scalability premise, local-rule determinism, stigmergic
  channels), the classical convergence results for canonical swarm algorithms
  (Ant Colony Optimization, Particle Swarm Optimization), and the structural
  reasons that LLM-based agent populations fail to satisfy the classical
  conditions and therefore do not inherit classical convergence guarantees.
position: >
  This theory is the sibling of the [agents](../agents/_index.md) theory within
  the artificial-intelligence branch. The two theories address structurally
  distinct coordination regimes. The agents theory addresses deliberative,
  high-cost agents coordinated through explicit message passing in topologies
  with O(n²) overhead. The swarm-intelligence theory addresses simple,
  low-cost agents coordinated through stigmergic environment modification with
  sublinear overhead. The two regimes are not interpolated by intermediate
  topologies — the design choice is qualitative. The theory engages the
  classical swarm-intelligence literature (Reynolds 1987, Dorigo 1992,
  Kennedy–Eberhart 1995, Bonabeau–Dorigo–Theraulaz 1999) and the recent
  critique of LLM-swarm framings (Doan et al. 2025, arXiv 2506.14496). It is
  positioned to coordinate with the math-side agentic-swarm-theory study plan
  in predication-categories without depending on it.
---

The swarm-intelligence theory gives formal structure to the family of multi-agent systems whose coherent global behavior arises from simple local rules executed by interchangeable agents communicating indirectly through environmental modification.
It answers four questions precisely:

**What distinguishes a swarm from a multi-agent system?** A swarm-coordinated multi-agent system is a multi-agent system that satisfies three structural conditions: agents follow local rules with bounded computational cost (scalability premise), agents are interchangeable in role (homogeneity), and inter-agent influence is mediated by persistent environmental traces rather than direct messages (stigmergy).
A system failing any one of these is not a swarm in the classical sense and does not inherit classical swarm convergence guarantees.
See [swarm-vs-orchestration-dichotomy](theorems/swarm-vs-orchestration-dichotomy.md).

**When does a swarm converge?** Classical swarm algorithms have proved convergence theorems under explicit hypotheses on the local-rule structure, the trace-decay rate, and the noise model.
Ant Colony Optimization converges to the global optimum with probability one under bounded pheromone updates (Dorigo–Stützle 2004).
Particle Swarm Optimization converges in distribution to a stable region under specific parameter constraints (Trelea 2003; Clerc–Kennedy 2002).
See [aco-convergence](theorems/aco-convergence.md) and [pso-local-convergence](theorems/pso-local-convergence.md).

**Why do LLM-based agent populations fail to inherit these guarantees?** LLM agents violate the scalability premise: per-agent prompt-processing cost is many orders of magnitude greater than the simple update rules of classical swarm intelligence, so the asymptotic-population regimes that gave classical swarm theory its convergence guarantees are computationally inaccessible.
Natural-language coordination further violates the local-rule-determinism condition.
See [llm-swarms-fail-classical-conditions](theorems/llm-swarms-fail-classical-conditions.md).

**What does stigmergy buy that orchestration does not?** Stigmergic coordination has overhead that scales with environment size, not with agent count, so coordination cost is decoupled from population size.
Orchestrated coordination (the regime of the agents theory) has overhead that scales quadratically with agent count.
The two regimes are not interpolated; the choice between them is structural.
See [stigmergy-decouples-coordination-cost](theorems/stigmergy-decouples-coordination-cost.md).

## Structure

- **[concepts/](concepts/_index.md)** — semantic anchors: stigmergy, emergence, local-rule coordination, the swarm conditions.
- **[objects/](objects/_index.md)** — defined structures: swarm states, environmental traces, pheromone fields, fitness landscapes.
- **[morphisms/](morphisms/_index.md)** — operators: trace deposition and evaporation, neighbor sensing, position updates, role differentiation.
- **[theorems/](theorems/_index.md)** — proved claims grounded in the classical literature and in the 2025 LLM-swarm critique.
- **[narratives/](narratives/_index.md)** — rhetorical walk-throughs.
- **[references/](references/_index.md)** — annotated bibliography.
- **[questions/](questions/_index.md)** — open problems and research targets.

## Relationship to the agents theory

The agents theory and the swarm-intelligence theory are siblings, not parent and child.
Concepts cross-reference between them but neither imports the other's machinery.
The agents theory's [coordination-topology](../agents/concepts/coordination-topology.md) catalog (orchestrator-workers, peer-to-peer, pipeline, debate) is the universe of *orchestrated* coordination patterns; the swarm-intelligence theory adds *stigmergic* coordination as a structurally distinct regime that does not appear on that list.
The [coordination-overhead-grows-superlinearly](../agents/theorems/coordination-overhead-grows-superlinearly.md) theorem applies to the agents theory's regime; the [stigmergy-decouples-coordination-cost](theorems/stigmergy-decouples-coordination-cost.md) theorem in this theory establishes that the superlinear scaling does not apply to the stigmergic regime, and the [llm-swarms-fail-classical-conditions](theorems/llm-swarms-fail-classical-conditions.md) theorem establishes that LLM agents cannot in general be deployed in the stigmergic regime to escape the superlinear scaling.
