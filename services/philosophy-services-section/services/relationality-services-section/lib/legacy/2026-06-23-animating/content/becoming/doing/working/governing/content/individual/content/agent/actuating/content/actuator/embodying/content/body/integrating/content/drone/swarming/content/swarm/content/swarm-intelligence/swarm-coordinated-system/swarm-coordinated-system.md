---
type: concept
class: foundational
status: active
depends-on:
  - stigmergy.md
  - scalability-premise.md
  - homogeneity.md
  - local-rule-coordination.md
see-also:
  - emergence.md
  - ../theorems/swarm-vs-orchestration-dichotomy.md
  - ../../agents/concepts/coordination-topology.md
references:
  - references/bonabeau-dorigo-theraulaz1999.md
  - references/camazine2001.md
---

# Swarm-coordinated system

A swarm-coordinated multi-agent system is a multi-agent system satisfying three structural conditions jointly: the [scalability premise](scalability-premise.md), [homogeneity](homogeneity.md), and [stigmergy](stigmergy.md).
Each condition is individually necessary; all three are jointly sufficient to qualify as a swarm-coordinated system in the sense of the classical literature (Bonabeau–Dorigo–Theraulaz 1999; Camazine et al. 2001).
A multi-agent system satisfying fewer than three conditions is some other kind of multi-agent system — typically an *orchestrated* system in the sense of the [agents theory](../../agents/_index.md) — and does not inherit the convergence guarantees, scaling properties, or robustness profile that the classical swarm literature establishes.

## The three conditions

**Scalability premise.** Per-agent computational and communication cost is bounded by a small constant independent of population size.
The classical update rules of Ant Colony Optimization, Particle Swarm Optimization, and the boids model are O(1) or O(k) for small constant k (where k is the neighborhood radius). *Test:* fix the local-rule implementation and measure its cost as the population grows.
A swarm-coordinated agent's per-step cost is invariant; an LLM-based agent's per-step cost scales with context length and is not bounded by a small constant.

**Homogeneity.** Agents are interchangeable in role and capability.
Every agent runs the same local rule with the same parameters; agent identity does not affect the global behavior. *Test:* permute agent identities and observe whether global behavior changes.
A swarm-coordinated system is invariant under permutation; an orchestrated system with role-typed agents (orchestrator, worker, critic) is not.

**Stigmergy.** Inter-agent influence is mediated by persistent modifications to a shared environment, not by direct messages.
Agents read and write a [trace field](../objects/environment-trace-field.md); they do not have addresses or recipients. *Test:* remove direct messaging channels and observe whether the system still coordinates.
A swarm-coordinated system continues to function; a system that stops coordinating when its message channels are removed is not stigmergic.

## What the concept excludes

- **Orchestrated multi-agent systems** in the sense of [coordination-topology](../../agents/concepts/coordination-topology.md): orchestrator-workers, peer-to-peer message passing, debate protocols.
  These violate stigmergy.
- **Heterogeneous teams** with role-typed agents (planner, executor, verifier).
  These violate homogeneity.
- **LLM agent collectives** that pass natural-language messages.
  These violate scalability (per-agent cost is unbounded), homogeneity (system prompts differentiate roles), and frequently stigmergy (no shared environment trace).
- **Single-agent systems with multiple tool calls.** No population.

## Position relative to the agents theory

The [agents theory](../../agents/_index.md) covers orchestrated multi-agent coordination as its core subject.
The swarm-intelligence theory covers a distinct regime.
The two theories are not subordinate; they describe disjoint coordination patterns.
The [swarm-vs-orchestration-dichotomy](../theorems/swarm-vs-orchestration-dichotomy.md) theorem establishes that intermediate hybrids inherit the worst-case overhead of the orchestrated regime, so the design choice is qualitative rather than continuous.
