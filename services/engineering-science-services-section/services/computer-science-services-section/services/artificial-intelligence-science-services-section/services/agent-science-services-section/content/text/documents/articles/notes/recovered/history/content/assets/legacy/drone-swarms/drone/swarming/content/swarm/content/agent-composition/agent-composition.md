---
type: morphism
class: structural-operation
status: active
depends-on:
  - teaching/explanations/coordination-topology.md
  - teaching/explanations/agentic-system.md
  - ../objects/coordination-graph.md
see-also:
  - ../morphisms/delegation.md
  - ../theorems/coordination-overhead-grows-superlinearly.md
  - ../theorems/saturation-threshold.md
  - ../theorems/single-agent-parity-below-saturation.md
  - ../terms/multi-agent-system.md
  - ../texts/orchestration-vs-choreography-survey.md
references:
  - references/masft2025.md
  - references/anthropic2024.md
---

# Agent composition

Agent composition is the operation of combining two or more agentic systems into a [coordination graph](../objects/coordination-graph.md) that pursues a shared goal.
It is a structural operation: composition defines the edges of the coordination graph (who communicates with whom) and assigns roles (who orchestrates, who executes) without necessarily changing the internal structure of any participating agent.

## Composition as graph construction

Given a set of agents $A_1, A_2, \ldots, A_n$, agent composition constructs a directed graph $G = (V, E)$ where:

- $V = \{A_1, \ldots, A_n\}$ plus a designated entry vertex (the principal or human-in-the-loop).
- $E$ contains an edge $(A_i, A_j)$ for each directed communication link in the chosen [coordination topology](teaching/explanations/coordination-topology.md).

The choice of topology determines the edge set and thus the overhead characteristics of the composed system.

## Properties of composition

**Overhead superlinearity.** Adding agents to a composition increases coordination overhead superlinearly.
See [coordination-overhead-grows-superlinearly](../theorems/coordination-overhead-grows-superlinearly.md).
This means the composition operator is not cost-neutral: composing two capable agents does not simply sum their capabilities while summing their costs.
It sums their capabilities while potentially multiplying their coordination costs.

**Saturation.** The performance benefit of composition saturates at approximately four agents.
Beyond this threshold, additional agents increase overhead without proportional capability gain.
See [saturation-threshold](../theorems/saturation-threshold.md).

**Non-interference (open problem).** For agents operating on disjoint scopes, their joint outputs should commute: the order of their operations should not affect the final state.
This is true by design in pipeline topologies (sequential execution) and by scope disjointness in orchestrator-workers topologies.
In peer- to-peer topologies with shared resources, non-interference requires explicit design.
See [formal-non-interference-in-multi-agent](questions/formal-non-interference-in-multi-agent.md).

## When to compose

Agent composition is warranted when:

1. **Capability disjointness.** The task requires capabilities no single agent can hold simultaneously — isolated tool environments, specialized knowledge, or separate execution contexts.
2. **Independent parallelism.** The task decomposes into subtasks with no dependencies between them, and parallel execution reduces wall-clock time.
3. **Diversity for error reduction.** Multiple independent perspectives reduce hallucination at the cost of N× compute (debate pattern).

In all other cases, a single agent with well-designed tools is preferable.
The baseline comparison is always single-agent performance; composition is justified only when the composed system exceeds that baseline by more than the overhead cost.
See [single-agent-parity-below-saturation](../theorems/single-agent-parity-below-saturation.md).
