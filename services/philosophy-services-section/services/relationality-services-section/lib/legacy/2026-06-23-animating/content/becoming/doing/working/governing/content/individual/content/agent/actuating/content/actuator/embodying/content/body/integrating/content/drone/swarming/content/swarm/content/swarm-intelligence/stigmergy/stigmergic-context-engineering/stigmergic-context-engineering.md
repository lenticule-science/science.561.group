---
type: question
class: applied-research
status: open
depends-on:
  - teaching/explanations/stigmergy.md
  - ../theorems/llm-swarms-fail-classical-conditions.md
  - ../theorems/stigmergy-decouples-coordination-cost.md
see-also:
  - when-do-llm-agents-form-a-swarm.md
  - hybrid-swarm-orchestration.md
references:
  - references/doan2025-llm-swarms.md
  - references/bonabeau-dorigo-theraulaz1999.md
---

# Stigmergic context engineering

**Status:** open.

**Question.** Can the shared-context substrate of LLM agent systems serve as a genuine stigmergic channel in the technical sense of [stigmergy](teaching/explanations/stigmergy.md), and if so, under what disciplines?
What design constraints on the shared context recover which structural properties of stigmergic coordination?

## Why the question matters

LLM-agent systems frequently use shared context — a database, a scratchpad, a vector store — that multiple agents read from and write to.
Architectural patterns described as "agent memory," "shared workspace," "knowledge base," and "context substrate" all point at the same structural element: persistent state that mediates coordination.

This *looks like* stigmergy.
The question is whether it actually satisfies the technical conditions.

By the [llm-swarms-fail-classical-conditions](../theorems/llm-swarms-fail-classical-conditions.md) theorem, deployed LLM-agent systems do not satisfy the stigmergy condition because they typically also use direct messaging.
The counterfactual: what if they did *not* use direct messaging — could the shared context substrate alone provide adequate coordination?

## What a satisfactory answer looks like

A satisfactory answer would specify:

1. **The trace-field structure on the shared context.** What is the value space $V$?
  What is the location space $L$?
  Are there evaporation dynamics, and on what timescale?
2. **The deposition and reading disciplines.** When does an agent write to the context, and to what location?
  When and what does an agent read?
3. **The recovered properties.** Does the [stigmergy-decouples-coordination-cost](../theorems/stigmergy-decouples-coordination-cost.md) theorem apply, in modified form?
  Does any classical convergence guarantee transfer?
4. **The empirical performance.** Does the architecture, deployed on a benchmark task, exhibit any of the cost-scaling or coordination benefits of classical stigmergic systems?

## Specific architectural questions

- *Sub-question A: write-once vs evaporating context.* Most LLM-agent shared-context substrates accumulate indefinitely.
  Adding evaporation (time-decay of older context entries) would more closely match classical pheromone-field dynamics.
  Does this recover any structural property?
- *Sub-question B: location-typed context.* A shared scratchpad with no spatial structure does not support neighborhood-bounded reading.
  Imposing a spatial structure (sections, regions, topics with adjacency) would give locations and neighborhoods.
  Does this make the substrate a [trace field](../objects/environment-trace-field.md) in the technical sense?
- *Sub-question C: scalar-valued vs document-valued contexts.* Classical pheromone fields are scalar-valued.
  LLM context substrates are typically document-valued.
  Does the change in value type break the classical analysis, or can analogs be derived?
- *Sub-question D: read-locality discipline.* Most LLM-agent architectures let each agent read the full shared context.
  Imposing a bounded-read discipline (each agent reads only its local neighborhood) would restore the [local-rule coordination](teaching/explanations/local-rule-coordination.md) condition.
  What is the cost in coordination quality?

## Why the question is hard

The fundamental tension: stigmergic coordination depends on *statistical* coordination over a shared substrate.
LLM agents are typically used precisely because they can do *precise* coordination over rich shared state.
Forcing LLM agents into a stigmergic discipline means giving up most of what makes them valuable.

The honest possibility: the answer may be that imposing the stigmergic disciplines on LLM-agent systems makes the LLM agents no better than their non-LLM equivalents, and the cost differential makes the architecture uncompetitive.

## What success looks like

Either a specific stigmergic-context-engineering discipline with demonstrated benefits over both pure-LLM-orchestration and pure- classical-swarm baselines, or an analysis showing that no such discipline can outperform the simpler alternatives.
A negative result would still settle the question.

## Adjacent work

This question is the engineering-side complement to several research directions in the math-side [toward-agentic-swarm-theory](../../../../../humanities/theories/math/theories/categories/theories/predication-categories/prose/teaching/explanations/toward-agentic-swarm-theory.md) study plan, particularly the per-agent closure dynamics direction and the Q-enriched network-sheaf direction.

Related but distinct: the [hybrid-swarm-orchestration](hybrid-swarm-orchestration.md) question, which asks about combining stigmergic substrates with orchestrated LLM-agent layers rather than running LLM agents stigmergically.
