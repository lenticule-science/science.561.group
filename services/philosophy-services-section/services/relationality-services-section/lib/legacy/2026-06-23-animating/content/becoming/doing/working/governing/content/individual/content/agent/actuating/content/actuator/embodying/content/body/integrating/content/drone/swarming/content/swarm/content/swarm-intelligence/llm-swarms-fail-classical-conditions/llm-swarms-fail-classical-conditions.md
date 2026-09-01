---
type: theorem
class: structural-claim
status: proved
depends-on:
  - teaching/explanations/swarm-coordinated-system.md
  - teaching/explanations/scalability-premise.md
  - teaching/explanations/local-rule-coordination.md
  - swarm-vs-orchestration-dichotomy.md
  - emergence-requires-local-determinism.md
see-also:
  - stigmergy-decouples-coordination-cost.md
  - questions/when-do-llm-agents-form-a-swarm.md
  - questions/stigmergic-context-engineering.md
  - teaching/explanations/from-classical-to-llm-swarms.md
references:
  - references/doan2025-llm-swarms.md
  - references/bonabeau-dorigo-theraulaz1999.md
---

# LLM swarms fail classical conditions

**Claim.** Multi-agent systems composed of LLM-based agents ("LLM swarms" in the contemporary literature) violate at least the [scalability premise](teaching/explanations/scalability-premise.md) and the local-determinism condition of [emergence-requires-local-determinism](emergence-requires-local-determinism.md), and frequently violate [local-rule coordination](teaching/explanations/local-rule-coordination.md) as well.
The classical swarm convergence theorems ([aco-convergence](aco-convergence.md); [pso-local-convergence](pso-local-convergence.md)) do not apply to LLM swarms without independent re-derivation under weakened hypotheses, which has not been done in the literature as of mid-2026.

This theorem makes precise the critique of Doan et al. (2025), *"LLM-Powered Swarms: A New Frontier or a Conceptual Stretch?"* (arXiv 2506.14496).

## Statement of the failures

**Failure 1: scalability premise violation.** LLM agents have per-step cost dominated by language-model inference.
A forward pass over a production language model costs $\sim 10^9$–$10^{12}$ floating-point operations, depending on model size and context length.
Classical swarm-intelligence agents have per-step cost of $\sim 10^1$–$10^2$ floating-point operations.
The ratio is on the order of $10^7$–$10^{11}$.

The asymptotic-population regime in which classical swarm convergence theorems are stated — populations of $N = 10^4$ or larger — is computationally inaccessible for LLM-based agents at any presently practical cost.
The [scalability-premise](teaching/explanations/scalability-premise.md) condition is violated by many orders of magnitude.

This is not a temporary engineering limitation that will dissolve as hardware improves.
A thousandfold drop in per-inference cost would still leave LLM swarms $10^4$ times more expensive per step than classical swarms of equivalent size.

**Failure 2: local-determinism violation.** LLM agents using natural-language reasoning to choose actions have per-step output distributions whose entropy is high and grows with context length and vocabulary size.
The bounded-entropy condition required by [emergence-requires-local-determinism](emergence-requires-local-determinism.md) is not satisfied.
Population-level trajectories from the same initial conditions diverge across runs; reproducible emergent behavior is not guaranteed.

This failure can be partially mitigated by lowering sampling temperature toward zero and tightly constraining the action space, but full mitigation amounts to making the LLM agent function as a fixed lookup table, which sacrifices the LLM's primary value.

**Failure 3: local-rule coordination violation (typical).** Most deployed "LLM swarm" architectures pass a growing context window across agents.
Each agent's input includes summaries or excerpts of all prior agent contributions in the current task.
The input size grows with the number of agents that have already acted; the [local-rule coordination](teaching/explanations/local-rule-coordination.md) condition's bounded-input requirement is not satisfied.

This failure is architectural and could in principle be avoided by adopting strict-locality designs (each agent sees only a bounded local context).
In practice such designs are rare because they sacrifice the LLM's ability to reason over global context.

## Why classical convergence theorems do not transfer

Each of the classical convergence theorems uses the failed conditions in essential ways:

- **[aco-convergence](aco-convergence.md)** requires that every solution remain sampleable with bounded-below probability over many iterations.
  This relies on the per-iteration cost being small enough that many iterations are computationally feasible, and on the per-agent action distribution having bounded entropy.
  Both fail for LLM agents.
- **[pso-local-convergence](pso-local-convergence.md)** requires the position-update operator to have a specific algebraic form whose stability analysis depends on bounded inertia and bounded coefficient ranges.
  The LLM-agent analog of position update is an LLM forward pass, which has no closed-form algebraic structure to analyze.
- **[stigmergy-decouples-coordination-cost](stigmergy-decouples-coordination-cost.md)** delivers $O(N + |L|)$ total cost only when per-agent cost is $O(1)$.
  With LLM-agent per-step cost dominating, total cost is $O(N \cdot \text{LLM-cost} + |L|)$, where the first term is many orders of magnitude larger than $|L|$ for any realistic deployment.
  The decoupling is lost.

## What can be salvaged

Three partial salvage paths are visible in the 2025–2026 literature:

**Salvage 1: bounded-entropy LLM agents.** Constrain the LLM to a small fixed action space and use temperature $T = 0$ to recover bounded per-step entropy.
The local-determinism condition can be approached asymptotically.
This loses much of the LLM's flexibility but enables some convergence-style analysis.
See the [when-do-llm-agents-form-a-swarm](questions/when-do-llm-agents-form-a-swarm.md) research question.

**Salvage 2: stigmergic context substrates.** Use a shared context-state substrate (a database or shared scratchpad) that LLM agents read from and write to without direct messaging.
This recovers some properties of stigmergy.
The [stigmergic-context-engineering](questions/stigmergic-context-engineering.md) research question asks whether this is enough to recover any of the classical convergence guarantees.

**Salvage 3: hybrid architectures.** Combine a classical swarm-intelligence substrate (the cheap-agent layer) with an LLM-based meta-coordinator (the expensive-agent layer at much smaller population size).
This preserves swarm-intelligence convergence on the substrate while using LLMs for the high-leverage decisions.
Open research; see [hybrid-swarm-orchestration](questions/hybrid-swarm-orchestration.md).

None of the three has produced a clean convergence theorem as of mid-2026.

## Engineering consequences

**Do not deploy LLM swarms with the expectation of swarm-intelligence convergence guarantees.** The guarantees do not transfer.
An LLM-agent collective may produce useful behavior but its behavior is not governed by the classical swarm-intelligence theorems and should not be analyzed as if it were.

**Do not interpret "LLM swarm" terminology in the literature as implying classical-swarm-intelligence semantics.** Many 2024–2026 papers use the term loosely.
Ask: does the system satisfy scalability, homogeneity, and stigmergy?
If not, the system is an orchestrated multi-agent system in the sense of the [agents theory](../../agents/_index.md), and the [saturation-threshold](../../agents/theorems/saturation-threshold.md) and [coordination-overhead-grows-superlinearly](../../agents/theorems/coordination-overhead-grows-superlinearly.md) theorems apply.

**The cost-decoupling property of stigmergy is not available to LLM systems.** Architects looking for the $O(N)$-scaling promise of swarm coordination cannot get it by adding LLMs to a stigmergic substrate.
The structural reason is established here.

**The right question is not "how do we make LLM swarms converge" but "what are LLM agent collectives, if not swarms?"** The honest answer in the present literature is: small (saturation $\sim$ 4 agents), orchestrated, expensive, with no convergence guarantees.
The agents theory's [three-condition-characterization](../../agents/theorems/three-condition-characterization.md) characterizes them as agentic systems; this theory establishes that they are not swarm-coordinated systems.

## Scope and possible future revision

The theorem is conditional on the present state of LLM technology and on the present state of LLM-swarm architectural practice.
Three plausible developments could weaken it:

- An LLM architecture with $O(1)$ per-step inference cost (some form of cached or compiled inference) would weaken Failure 1.
- A theoretical framework for analyzing convergence of high-entropy local rules under appropriate weakened hypotheses (a conjectured generalization of the classical theorems) would weaken Failure 2.
- Strict-locality LLM agent architectures becoming standard would weaken Failure 3.

None of these has occurred as of mid-2026, and the first two are not on the visible research agenda.
Revisiting this theorem when any of them changes is appropriate.
