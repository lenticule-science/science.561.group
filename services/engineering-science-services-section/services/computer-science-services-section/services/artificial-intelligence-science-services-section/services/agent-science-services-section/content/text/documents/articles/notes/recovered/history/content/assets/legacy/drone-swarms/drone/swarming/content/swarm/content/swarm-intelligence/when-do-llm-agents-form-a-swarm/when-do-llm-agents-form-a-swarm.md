---
type: question
class: structural-research
status: open
depends-on:
  - ../theorems/llm-swarms-fail-classical-conditions.md
  - ../theorems/emergence-requires-local-determinism.md
  - teaching/explanations/scalability-premise.md
see-also:
  - stigmergic-context-engineering.md
  - hybrid-swarm-orchestration.md
references:
  - references/doan2025-llm-swarms.md
  - references/bonabeau-dorigo-theraulaz1999.md
---

# When do LLM agents form a swarm?

**Status:** open.

**Question.** Under what restrictions on LLM-agent behavior do the classical swarm-coordinated conditions ([scalability premise](teaching/explanations/scalability-premise.md), [homogeneity](teaching/explanations/homogeneity.md), [stigmergy](teaching/explanations/stigmergy.md), and the local-determinism condition of [emergence-requires-local-determinism](../theorems/emergence-requires-local-determinism.md)) recover, and which classical convergence guarantees follow?

## Why the question matters

The [llm-swarms-fail-classical-conditions](../theorems/llm-swarms-fail-classical-conditions.md) theorem establishes that LLM agents in their default deployment violate the classical conditions and do not inherit classical convergence guarantees.
The theorem also identifies three salvage paths (bounded-entropy LLM agents, stigmergic context substrates, hybrid architectures) but does not characterize them precisely.

This question asks for the precise characterization: what is the maximum permissible LLM behavior under which the classical guarantees recover, and what are the trade-offs?

## What a satisfactory answer looks like

A satisfactory answer would consist of:

1. **A formal weakening of each classical condition.** What is the bounded-entropy condition for LLM-style agents?
  What does "scalability premise modulo per-agent inference cost" mean?
  Can the homogeneity condition be relaxed to "approximately homogeneous" with quantitative bounds?
2. **A re-derivation of the classical convergence theorems under the weakened conditions.** What does the [aco-convergence](../theorems/aco-convergence.md) theorem look like when each ant is an LLM with bounded but nontrivial output entropy?
  What do the stability conditions for [pso-local-convergence](../theorems/pso-local-convergence.md) become?
3. **An empirical demonstration on a benchmark task.** A specific LLM- agent architecture satisfying the weakened conditions, deployed on a swarm-intelligence-canonical task (TSP, function optimization, pattern formation), with measured convergence behavior compared against a classical swarm-intelligence baseline.

## Sub-questions

- *Sub-question A: temperature-zero LLMs.* If the LLM's sampling temperature is set to zero, the per-step output is deterministic given input.
  Does the local-determinism condition recover under any conditions on the input space?
- *Sub-question B: bounded action vocabularies.* If the LLM's action space is a small fixed vocabulary (say, 10–100 actions), does the bounded-entropy condition recover regardless of temperature?
- *Sub-question C: distilled local-rule policies.* If a swarm uses agents that are distilled from LLMs into compact policies (smaller models, or even decision trees), can both the scalability and local-determinism conditions recover?
- *Sub-question D: stigmergic-only LLM swarms.* If LLM agents communicate only through a shared trace field (no direct messages, no growing context), does the [local-rule coordination](teaching/explanations/local-rule-coordination.md) condition recover even if the per-agent cost is still high?

Each sub-question admits independent investigation.

## Why the question is hard

The fundamental difficulty is that what makes LLM agents valuable — flexible, high-bandwidth reasoning over arbitrary contexts — is in direct tension with what makes classical swarm intelligence work — cheap, narrow, low-bandwidth agents.
Recovering the classical conditions requires sacrificing what makes LLM agents distinctive.

A possible satisfying answer might therefore be negative: "no useful restriction on LLM-agent behavior recovers the classical conditions without sacrificing the LLM's value."
This would be a genuine contribution — establishing that the present LLM-agent paradigm and the classical swarm-intelligence paradigm are fundamentally incompatible at the algorithmic level.

## What success looks like

Either a positive answer (a specific restriction that works, with quantitative trade-offs) or a negative answer (an impossibility result establishing that no restriction recovers the classical guarantees).
Both are valuable contributions; both would settle the question.

## Adjacent research

The math-side [toward-agentic-swarm-theory](../../../../../humanities/theories/math/theories/categories/theories/predication-categories/prose/teaching/explanations/toward-agentic-swarm-theory.md) study plan in the predication-categories branch addresses related questions in the predcat framework (bilattice-valued network sheaves, per-agent closure dynamics, mean-field limits).
The engineering-side question here and the math-side study plan there are independently pursuable but mutually informative.
