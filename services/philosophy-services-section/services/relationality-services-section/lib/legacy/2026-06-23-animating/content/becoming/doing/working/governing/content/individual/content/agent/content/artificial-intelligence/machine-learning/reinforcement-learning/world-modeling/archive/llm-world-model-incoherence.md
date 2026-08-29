---
type: theorem
class: contemporary
status: empirically-supported
depends-on:
  - teaching/explanations/llm-as-world-model.md
see-also:
  - questions/are-llms-implicit-world-models.md
  - teaching/explanations/why-llms-are-imperfect-world-models.md
references:
  - references/kambhampati-llm-planning2024.md
  - references/lecun-jepa2022.md
---

# LLM world model incoherence

## Statement (informal but well-supported)

Large language models trained on next-token prediction exhibit
**systematic incoherences** in their implicit representations of
environment dynamics. Specifically, for sufficiently many
formulations $f, f'$ of the *same* underlying physical or causal
question $q$, an LLM produces answers $\mathrm{LLM}(f(q))$ and
$\mathrm{LLM}(f'(q))$ that are mutually inconsistent — either
direct contradictions, or assignments of probability mass to
mutually exclusive outcomes that exceed any reasonable
calibration tolerance.

A coherent world model would, by definition, satisfy the
*invariance property*: queries that differ only in surface form
about the same underlying world fact must produce the same answer
(modulo phrasing-appropriate variation in expression). LLMs
empirically violate this invariance.

## Empirical evidence

The status is "empirically supported" rather than "proved" because
the claim is statistical — about the *prevalence* and
*systematicity* of incoherences across natural query distributions.
Convergent evidence:

- **Reversal curse** (Berglund et al. 2023). Models trained on
  "A is B" frequently fail to answer "what is B?" with "A". The
  bidirectional structure of the underlying relation is not
  represented; the surface direction of training text is.
- **PlanBench** (Valmeekam et al., Kambhampati 2024). On
  classical-planning benchmarks small enough that any usable
  forward model would solve them by direct simulation, LLMs
  fail at rates inconsistent with possessing a usable internal
  forward model.
- **Theory-of-mind probing.** Models that pass standard
  theory-of-mind tests fail systematically when the test is
  phrased adversarially or with surface modifications,
  suggesting the success is partial pattern-matching rather
  than agent simulation.
- **Physical-reasoning incoherence.** LLMs answer "what
  happens if you drop a ball" correctly but assign inconsistent
  probabilities to "ball lands in position X" across paraphrased
  queries about the same drop.

## What the theorem does and doesn't say

It **does** say: LLMs are not world models in the strict sense
required for reliable planning, imagination rollout, or
counterfactual simulation. They cannot be relied upon as the
forward-model component of a model-based agent without external
augmentation.

It **does not** say: LLMs have no world knowledge, or that LLM
world-knowledge is useless. The empirical evidence supports a
weaker claim: LLMs encode a *dense web of world-shaped
correlations*, useful for many tasks, but not coherent enough to
function as a forward model in the technical sense. They are
encyclopedias with significant interpolation ability, not
simulators.

## The structural cause

The proposed mechanism (LeCun 2022, Kambhampati 2024): the
training objective rewards producing text that resembles
plausible continuation of training-distribution text. Coherence
of an underlying world model is correlated with this — text
about a real coherent world is usually consistent — but the
correlation is imperfect. The training objective places no
direct pressure on the model to fix the incoherences. They
persist because the surface-statistics objective does not
penalize them.

Whether **scaling** training data, training compute, or model
size eliminates the incoherences is the open question:
[are-llms-implicit-world-models](questions/are-llms-implicit-world-models.md).
Empirically, frontier models reduce some incoherences (the
reversal curse is partially addressed by post-training; planning
performance improves with scale) but do not eliminate them.
The structural argument suggests they cannot be eliminated by
scale alone — only by training objectives that directly target
world-model coherence.

## Why "empirically-supported" not "proved"

A formal proof would require:

- A precise definition of "coherence" capturing what a world
  model owes (likely: query invariance under semantically-
  preserving transformations).
- A specification of the training-objective class for which the
  result holds.
- A separation between the objective's induced solutions and
  coherent solutions, demonstrating that no minimizer of the
  objective can be coherent.

Partial formalizations exist for restricted settings (autoregressive
models trained on specific text distributions cannot represent
certain dependency structures) but no general proof. The result
is accepted in the field on the strength of accumulating
empirical evidence pointing in the same direction.
