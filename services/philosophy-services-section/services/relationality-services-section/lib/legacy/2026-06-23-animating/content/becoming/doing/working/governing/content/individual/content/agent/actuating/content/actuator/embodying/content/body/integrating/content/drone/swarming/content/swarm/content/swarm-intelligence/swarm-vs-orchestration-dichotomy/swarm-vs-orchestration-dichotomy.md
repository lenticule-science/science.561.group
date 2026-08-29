---
type: theorem
class: structural-claim
status: proved
depends-on:
  - teaching/explanations/swarm-coordinated-system.md
  - teaching/explanations/stigmergy.md
  - teaching/explanations/scalability-premise.md
  - teaching/explanations/homogeneity.md
see-also:
  - stigmergy-decouples-coordination-cost.md
  - llm-swarms-fail-classical-conditions.md
  - ../../agents/concepts/coordination-topology.md
  - ../../agents/theorems/coordination-overhead-grows-superlinearly.md
  - teaching/explanations/swarm-vs-orchestration.md
references:
  - references/bonabeau-dorigo-theraulaz1999.md
  - references/doan2025-llm-swarms.md
---

# Swarm-vs-orchestration dichotomy

**Claim.** Swarm-coordinated multi-agent systems and orchestrated multi-agent systems are structurally distinct coordination regimes.
Architectures that violate any of the three swarm-coordinated conditions ([scalability-premise](teaching/explanations/scalability-premise.md), [homogeneity](teaching/explanations/homogeneity.md), [stigmergy](teaching/explanations/stigmergy.md)) inherit the worst-case overhead properties of the orchestrated regime, including the superlinear coordination overhead established in [coordination-overhead-grows-superlinearly](../../agents/theorems/coordination-overhead-grows-superlinearly.md).
There is no continuous interpolation between the two regimes that preserves swarm-coordinated cost properties; the design choice is qualitative.

## Proof

The argument proceeds by considering each of the three swarm-coordinated conditions and showing that violating any one of them forces overhead at least as bad as the orchestrated regime.

**Violating scalability.** Suppose per-agent cost is $c(N)$ for some function unbounded in $N$.
Total per-step cost is at least $N \cdot c(N)$, which is super-linear in $N$.
The orchestrated regime's worst case is $O(N^2)$ from peer-to-peer message passing ([coordination-overhead-grows-superlinearly](../../agents/theorems/coordination-overhead-grows-superlinearly.md)).
A system whose per-agent cost grows polynomially in $N$ is at least as expensive as the orchestrated regime's worst case.

**Violating homogeneity.** Suppose agents have $k$ distinct roles with distinct local rules.
Inter-role coordination requires that role-typed agents identify each other and route role-specific information.
The coordination structure is the role-graph, with cost $O(k^2)$ in role count and $O(N \cdot k)$ in agent and role count combined.
For $k = O(1)$ this is acceptable; for $k$ growing with $N$ (the limit of "every agent is its own role"), the cost matches the orchestrated peer-to-peer topology.

**Violating stigmergy.** Suppose coordination uses direct messages rather than environmental traces.
The [coordination-overhead-grows-superlinearly](../../agents/theorems/coordination-overhead-grows-superlinearly.md) theorem applies directly: message-passing coordination has overhead $O(N^2)$ in the general case (every pair of agents may exchange messages).
Even in the orchestrator-workers special case, the orchestrator serializes on the slowest worker and per-step cost grows with $N$.

In each case, the violated condition forces the system into the orchestrated regime's overhead profile.

## Why no continuous interpolation

The three conditions are independent: a system can satisfy any subset.
But the cost properties are non-monotonic in the conditions: satisfying two of three conditions does not buy two-thirds of the cost benefit.
To get the swarm-coordinated cost profile (per-step cost $O(N)$ total, $O(1)$ per agent), all three conditions must hold simultaneously.
Violating any single one immediately permits cost growth that swamps the benefit of satisfying the other two.

This is what is meant by "no continuous interpolation": there is no intermediate regime between swarm-coordinated and orchestrated that has intermediate cost.
The architectures with one or two of the three conditions satisfied still pay the worst-case orchestrated overhead.

## Engineering consequences

**The choice is binary, not graded.** When designing a multi-agent system, decide whether the task admits a true swarm-coordinated solution (satisfying all three conditions) or whether it requires orchestration.
"Sort of a swarm" architectures get the worst of both worlds.

**Heterogeneous LLM-agent collectives are not swarms.** A team of specialized LLM agents (planner, executor, verifier) violates homogeneity.
Adding a shared scratchpad does not make the team a swarm; the scratchpad is shared memory, not stigmergy in the sense of the [stigmergy](teaching/explanations/stigmergy.md) concept (agents have addresses relative to each other; messages have implicit recipients).

**Stigmergic LLM systems are constrained by the [llm-swarms-fail-classical-conditions](llm-swarms-fail-classical-conditions.md) theorem.** Even an architecture that uses a shared environment trace without direct messaging still violates scalability if the agents are LLMs.

**Hybrid designs require the [hybrid-swarm-orchestration](questions/hybrid-swarm-orchestration.md) research direction.** Combining stigmergic substrates for some coordination with orchestrated coordination for other tasks is open research.
The dichotomy theorem says it cannot be done by simple mixing; structural innovation is required.

## Scope and limitations

The theorem characterizes the asymptotic cost behavior of the two regimes.
Small-population systems (say, $N \leq 10$) may not exhibit the asymptotic gap clearly, and intermediate architectures may be acceptable in this regime.
The dichotomy bites at larger populations, which is exactly the regime where swarm coordination would be theoretically attractive but, by the [llm-swarms-fail-classical-conditions](llm-swarms-fail-classical-conditions.md) theorem, is not currently accessible to LLM-agent systems.
