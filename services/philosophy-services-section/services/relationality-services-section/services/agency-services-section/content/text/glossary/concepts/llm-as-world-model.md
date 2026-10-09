---
type: concept
class: contemporary
status: active
depends-on:
  - forward-model.md
  - latent-world-model.md
see-also:
  - ../theorems/llm-world-model-incoherence.md
  - questions/are-llms-implicit-world-models.md
  - teaching/explanations/why-llms-are-imperfect-world-models.md
references:
  - references/lecun-jepa2022.md
  - references/kambhampati-llm-planning2024.md
title: LLM as world model
description: "The claim under examination: a large language model trained on next-token prediction over web-scale text — and increasingly on multi-modal data including images, video, and audio — develops an implicit world model of the universe…"
---

# LLM as world model

The claim under examination: a large language model trained on
next-token prediction over web-scale text — and increasingly on
multi-modal data including images, video, and audio — develops an
*implicit world model* of the universe described by its training
data. Whether this claim is true in any technical sense is one
of the principal contemporary controversies in AI.

## What the claim does and doesn't mean

The strong version of the claim: LLMs maintain queryable,
predictively accurate, internally consistent representations of
environment dynamics, including physical, social, and agent
dynamics, and can be used as world models for planning and
imagination in the same way Dreamer's RSSM can.

The weak version: LLMs have *enough* world-knowledge embedded in
their parameters to answer factual questions, predict obvious
next-events in described scenarios, and simulate dialogue in ways
that pass casual inspection. They are world *encyclopedias* with
some interpolation ability.

The empirical evidence supports the weak version unambiguously
and the strong version partially and inconsistently.

## Evidence for the strong version

- **Counterfactual reasoning.** LLMs answer "what would happen
  if X" questions about novel scenarios with often-correct results,
  suggesting some compositional dynamics modeling rather than
  pattern lookup.
- **Mechanistic interpretability findings.** Probes recover
  representations of board state in chess-playing LLMs (Li et al.
  2023, Karvonen 2024), spatial maps in models trained on
  navigation traces, and agent-belief representations in models
  trained on theory-of-mind tasks. The model has *something*
  internally that correlates with the variables a world model
  would track.
- **Generalization.** Models trained on text generalize to novel
  combinations of described situations they cannot have seen
  verbatim — the so-called "world model" defense of compositional
  generalization.

## Evidence for the weak version (against strong)

- **Systematic incoherences.** LLMs contradict themselves across
  paraphrased queries about the same physical scenario (Berglund
  et al. 2023 on the reversal curse; Yildirim & Paul 2024 on
  intuitive physics). A coherent world model would not.
- **Failure on novel physical reasoning.** When tested on physical
  reasoning problems out-of-distribution from training data, LLMs
  fail in ways consistent with surface-statistical pattern-matching
  rather than mechanistic simulation (Kambhampati 2024).
- **Brittleness to formulation.** Re-wording a physics question
  as a story versus a textbook problem versus a dialogue produces
  inconsistent answers. A world model should be invariant to
  surface form.
- **Failure on planning.** Despite many claims, LLMs perform
  poorly on classical planning benchmarks (PlanBench, Kambhampati
  et al. 2024), even on small instances they should be able to
  solve by direct simulation if they had a usable forward model.

See [llm-world-model-incoherence](../../documents/articles/notes/undated/llm-world-model-incoherence.md).

## The structural objection

LeCun (2022) and Kambhampati (2024) make essentially the same
structural argument: next-token prediction on text **selects for**
producing text that is consistent with how text about the world is
written, not for representing the world itself. The training
objective rewards plausible-sounding continuations, not predictively-
accurate world simulation. The two are correlated — text about a
real world is usually consistent with that world — but the
correlation is imperfect, and the objective does not push toward
fixing the imperfections.

## A productive synthesis

The most defensible position: LLMs contain world-shaped
representations, partial and incoherent, that are useful for many
tasks the way an opinionated human encyclopedia is useful, but
they are not world models in the technical sense required for
reliable planning, imagination rollout, or counterfactual
simulation. Augmenting LLMs with explicit external world models
(physics simulators, knowledge graphs, code-execution sandboxes)
is the dominant practical pattern, and is increasingly recognized
as essential rather than optional. See
[are-llms-implicit-world-models](../../documents/articles/notes/undated/are-llms-implicit-world-models.md).
