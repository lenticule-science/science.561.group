---
type: theorem
class: structural-claim
status: proved
depends-on:
  - teaching/explanations/stigmergy.md
  - ../objects/environment-trace-field.md
  - ../morphisms/trace-deposition.md
  - ../morphisms/trace-evaporation.md
see-also:
  - swarm-vs-orchestration-dichotomy.md
  - ../../agents/theorems/coordination-overhead-grows-superlinearly.md
  - teaching/explanations/why-stigmergy-works.md
references:
  - references/bonabeau-dorigo-theraulaz1999.md
  - references/camazine2001.md
---

# Stigmergy decouples coordination cost

**Claim.** In the stigmergic coordination regime, total coordination cost per step scales as $O(N + |L|)$ — linear in agent count $N$ plus linear in environment size $|L|$.
In particular, coordination cost is decoupled from the *square* of agent count: there is no $O(N^2)$ term, in contrast to the orchestrated regime's [coordination-overhead-grows-superlinearly](../../agents/theorems/coordination-overhead-grows-superlinearly.md).

For environments whose size $|L|$ is fixed by the problem (independent of how many agents are deployed), the per-step coordination cost is $O(N)$.
This is asymptotically better than the orchestrated regime's $O(N^2)$ at any nontrivial population size.

## Proof

Decompose the per-step coordination cost into the cost of the field-update operators and the cost of agent operations:

**Cost of [trace-evaporation](../morphisms/trace-evaporation.md).** The field is updated at every location; cost is $O(|L|)$.
This cost is *independent of $N$*: evaporation does not consult any agent state.

**Cost of [trace-deposition](../morphisms/trace-deposition.md).** Each agent deposits at its current location; cost per agent is $O(1)$, total cost is $O(N)$.

**Cost of [neighbor-sensing](../morphisms/neighbor-sensing.md) and [position-update](../morphisms/position-update.md).** Each agent reads its bounded neighborhood and updates its state; cost per agent is $O(1)$ by the [scalability premise](teaching/explanations/scalability-premise.md), total cost is $O(N)$.

Total per-step cost:

$$ \text{cost}(t) = O(|L|) + O(N) + O(N) = O(N + |L|) $$

For environments of fixed size, this is $O(N)$.

The key observation is that *no inter-agent operation* appears in the cost decomposition.
There is no operation whose cost scales with the number of pairs of agents, the number of inter-agent messages, or any other quantity quadratic in $N$.
This is the structural source of the decoupling.

## Comparison with the orchestrated regime

The orchestrated regime's [coordination-overhead-grows-superlinearly](../../agents/theorems/coordination-overhead-grows-superlinearly.md) gives $O(N^2)$ in the general case (peer-to-peer message passing) and $O(N \cdot d)$ in the orchestrator-workers case where $d$ is the serialization cost of the orchestrator (which is itself an increasing function of $N$, so the orchestrator-workers cost is also superlinear in $N$).

| Regime | Per-step total cost | Per-agent cost |
|---|---|---|
| Stigmergic | $O(N + |L|)$ | $O(1)$ |
| Orchestrated (peer-to-peer) | $O(N^2)$ | $O(N)$ |
| Orchestrated (orchestrator-workers) | $\omega(N)$ | $O(1)$ for workers, $\omega(N)$ for orchestrator |

For populations of $N = 10^4$, the stigmergic regime is $10^4$ times cheaper per step than the orchestrated peer-to-peer regime.
This is the quantitative reason that biological swarms can scale to colonies of millions while orchestrated multi-agent LLM systems ([saturation-threshold](../../agents/theorems/saturation-threshold.md)) saturate at four agents.

## What the theorem does *not* claim

**Stigmergic coordination is not strictly faster.** The cost is per step.
A stigmergic system may require many more steps to reach a solution than an orchestrated system.
Total coordination cost to solution is the product (cost-per-step × steps-to-solution); this theorem addresses only the first factor.

**Stigmergic coordination does not solve all problems.** The classical swarm algorithms have explicit hypotheses ([aco-convergence](aco-convergence.md), [pso-local-convergence](pso-local-convergence.md)) and apply only to problems satisfying those hypotheses.
Tasks that do not admit local-rule solutions cannot benefit from the cost decoupling because no stigmergic solution exists.

**The result depends on the [scalability premise](teaching/explanations/scalability-premise.md).** If per-agent cost is not $O(1)$, the per-agent contribution to the total becomes super-linear and the decoupling is lost.
This is precisely the condition that LLM-based agents violate; see [llm-swarms-fail-classical-conditions](llm-swarms-fail-classical-conditions.md).

## Engineering consequences

**Stigmergic coordination is the only regime that scales.** If a problem admits both a stigmergic and an orchestrated solution, and the population size is expected to grow, the stigmergic solution is asymptotically the only viable choice.

**Environment-size scaling is the secondary constraint.** $O(|L|)$ cost per step is independent of agent count, but it does scale with environment size.
Sparse-trace optimizations (only updating active locations) can reduce this in practice.

**The decoupling does not transfer to LLM-agent systems.** The combination of this theorem with [llm-swarms-fail-classical-conditions](llm-swarms-fail-classical-conditions.md) implies that LLM-agent systems cannot escape the orchestrated regime's $O(N^2)$ overhead by adopting stigmergic coordination, because the $O(1)$ per-agent cost premise is not satisfied.
