---
type: question
class: open
status: open
depends-on:
  - teaching/explanations/llm-as-world-model.md
  - ../theorems/llm-world-model-incoherence.md
see-also:
  - teaching/explanations/why-llms-are-imperfect-world-models.md
references:
  - references/lecun-jepa2022.md
  - references/kambhampati-llm-planning2024.md
---

# Are LLMs implicit world models?

## The question

Do large language models trained on next-token prediction
constitute world models in any technical sense — coherent,
queryable, predictively-accurate representations of environment
dynamics — or are they sophisticated surface-statistical
predictors of text-shaped data without an underlying world model?

## Why it is open

The empirical evidence is genuinely mixed:

- LLMs answer factual questions, simulate dialogue, and predict
  obvious next-events well enough to be useful. They have *some*
  world-shaped representation.
- LLMs exhibit systematic incoherences (reversal curse, query-
  order dependence, planning failure on small instances) that a
  coherent world model would not. The
  [llm-world-model-incoherence](../theorems/llm-world-model-incoherence.md)
  pattern is consistent and well-documented.
- The structural argument (LeCun 2022, Kambhampati 2024) makes
  a principled case that next-token prediction *cannot in
  principle* induce a coherent world model — the objective
  selects for something else.
- The empirical scaling pattern shows incoherences shrinking
  with scale but not vanishing. Whether they would vanish at
  larger scale or whether the structural argument bites
  asymptotically is unresolved.

## What would resolve it

Several lines of work could move the question forward:

- **Sharper formalization of "world model".** Currently the term
  is used somewhat loosely. A precise definition (likely:
  invariance under semantically-preserving query transformations,
  closure under composition of known facts) would let claims
  about LLMs be tested rigorously rather than impressionistically.
- **Extrapolation studies.** If the rate at which incoherences
  shrink with model scale follows a predictable pattern, one
  could project where coherence would emerge — or whether the
  curve plateaus.
- **Architectural ablations.** Compare next-token-trained models
  to JEPA-style or world-model-trained models on coherence
  benchmarks. If structurally different objectives produce
  qualitatively more coherent representations at the same scale,
  the structural argument gains support.
- **Mechanistic interpretability.** Direct examination of model
  internals to determine whether there are circuits implementing
  *forward simulation* of dynamics or only circuits matching
  *patterns over text*. Early evidence (Othello-GPT, chess-LLM
  probing) is suggestive but not yet conclusive.

## Why it matters

The answer determines how AI agents should be architected. If
LLMs are sufficient world models, then increasingly capable
agent systems can be built end-to-end on LLMs alone. If they
are not, then the dominant pattern (LLMs as interfaces;
external systems for world modeling, planning, verification)
is structurally necessary, not merely a temporary engineering
convenience. The two architectures have very different
trajectories — the first scales with foundation-model
capability; the second scales with the integration of
specialized modular components.

The pragmatic position (work with what works) does not need
to wait for the answer. The theoretical position (understand
what we're building) does.
