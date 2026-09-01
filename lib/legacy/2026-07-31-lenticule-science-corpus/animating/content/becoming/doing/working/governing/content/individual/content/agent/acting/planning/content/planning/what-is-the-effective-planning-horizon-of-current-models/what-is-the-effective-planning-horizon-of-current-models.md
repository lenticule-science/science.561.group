---
type: question
class: open
status: open
depends-on:
  - teaching/explanations/inference-time-search.md
  - teaching/explanations/plan-execution-monitoring.md
see-also:
  - ../theorems/inference-time-compute-tradeoff.md
  - is-llm-cot-genuine-search.md
references:
  - references/yao-tot2023.md
---

# What is the effective planning horizon of current models?

**Question.** Over how many sequential steps can current frontier LLMs construct and execute coherent goal-directed plans before performance degrades to chance or to incoherence?
How does the horizon depend on task structure, inference budget, and external scaffolding?

## Why the question matters

The planning horizon of a model bounds the kinds of agentic tasks it can perform.
A model that can plan over 5 steps is useful for short interactions but cannot complete multi-day projects; a model that can plan over 1000 steps is qualitatively a different agent.

Three deployment-relevant decisions depend on horizon estimates:

**Task selection.** Which tasks can the model be deployed on unsupervised?
Tasks shorter than the effective horizon can be delegated; longer tasks require either decomposition (with monitoring at the boundaries) or human checkpoints.

**Scaffolding design.** Where in the agentic-system loop should checkpoints, replanning, and human review be inserted?
The checkpoint frequency should be at most the horizon length minus some safety margin.

**Capability forecasting.** Future models will plan over longer horizons; how much longer, and at what rate?
The horizon-vs-time trend is one of the principal AI-progress indicators.

## What is known

**Order-of-magnitude estimates from benchmarks.** Mid-2024 frontier models could complete coding tasks of ~1 hour of human-equivalent work; by mid-2026, that figure has expanded to ~4–8 hours depending on task type and how "completion" is measured.
Coding benchmarks (METR's RE-Bench, SWE-bench Verified) provide the most rigorous current measurements.

**Task-type variance.** Horizon depends substantially on task structure:

- *Repetitive tasks with clear feedback*: long horizons (the model can iterate against feedback indefinitely).
- *Tasks requiring stable long-term goal-tracking*: shorter horizons (the model "drifts" from the original goal as the context grows).
- *Tasks with subtle dependencies between distant decisions*: shortest horizons (the model fails to maintain consistency).

**Inference-budget scaling.** Inference-time-compute extends effective horizons in narrow domains where verification is cheap (math, code) but provides less benefit on horizons that require sustained narrative coherence.

**External scaffolding.** Memory systems, summarization, hierarchical task decomposition, and explicit checkpoint mechanisms all extend effective horizons by augmenting the LLM with structured external state.
The scaffolded horizon can be substantially longer than the unscaffolded horizon, but the scaffolding itself is the engineering art.

## What is unknown

**The functional form of horizon-vs-task-type.** Why are some task types longer-horizon than others?
Is the limiting factor context length, attention pattern, training-distribution coverage, or something more subtle?

**The horizon scaling rate.** How fast is effective horizon growing with model generation?
METR's METR-Bench measurements show super-exponential growth in some narrow domains (coding); the rate in broader domains is unclear.

**The horizon ceiling.** Is there a point at which horizon plateaus even with continued scaling?
Or does horizon continue to grow without bound?
The answer depends on whether long-horizon planning is a quantitative property of compute or a qualitative property that requires architectural change.

**Adversarial horizons.** Most horizon measurements are on non-adversarial tasks where the model is given honest feedback and a active goal.
An adversarial deployment (where the model must maintain plan integrity against deceptive observations or goal-drift attacks) likely has a much shorter effective horizon.
This is barely measured.

**Compositional horizons.** A model that can complete two 4-hour sub-tasks in sequence has not necessarily completed an 8-hour combined task; coherence across the boundary is an additional challenge.
The relationship between sub-task horizon and composite-task horizon is poorly characterized.

## Why this is hard to settle

**Definition ambiguity.** "Planning horizon" can mean: maximum number of executed steps, maximum wall-clock time of completion, maximum branching factor of the plan tree, maximum semantic complexity.
Different definitions yield different estimates.

**Measurement infrastructure.** Benchmarks for long-horizon agentic tasks are expensive to construct (each task requires extensive reference solutions and verification).
The benchmark inventory is small, biased toward coding and math, and changes rapidly as frontier capabilities advance.

**Capability elicitation.** As with other LLM capabilities, *measured* horizon depends on inference budget and prompting methodology.
The reported horizon for a given model is typically a substantial underestimate of what the model can do with maximal elicitation.

**Moving target.** Frontier model capabilities change every few months.
By the time a horizon estimate is published, it is often out of date.

## What would settle it

**A standardized horizon benchmark.** A regularly-updated benchmark suite measuring effective horizon across task types, with standardized inference budgets and elicitation methodologies.
METR's work is the closest current approximation; the field needs similar work in non-coding domains.

**Mechanistic understanding of horizon limits.** Identification of the architectural and training factors that bound horizon, allowing prediction of next-generation model horizons before deployment.

**Adversarial horizon measurements.** Systematic study of horizon under adversarial conditions, which is where deployment-safety margins ultimately bind.

## Status

Active research with rapidly-evolving estimates.
The single most important quantitative question for AI capability forecasting in the 2025–2028 window.
Currently estimated by benchmark extrapolation rather than first-principles theory; the field would benefit from theoretical work on what determines horizon and why some tasks are intrinsically harder to extend.

## Related questions

- [inference-vs-training-compute-tradeoff](inference-vs-training-compute-tradeoff.md) — inference-time compute extends horizon, but the rate is domain-dependent.
- [is-llm-cot-genuine-search](is-llm-cot-genuine-search.md) — whether CoT is genuine search affects what kinds of long-horizon tasks the model can sustain.
- The capability-elicitation problem in the [alignment theory](../../alignment/morphisms/capability-elicitation.md) — measured horizons systematically under-estimate elicited horizons.
