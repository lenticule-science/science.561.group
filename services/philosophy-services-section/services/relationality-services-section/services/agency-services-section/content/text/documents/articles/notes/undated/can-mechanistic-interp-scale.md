---
type: question
status: open
see-also:
  - teaching/explanations/mechanistic-interpretability.md
  - teaching/explanations/the-sae-revolution.md
  - ../theorems/sae-reconstruction-faithfulness-tradeoff.md
title: Can mechanistic interpretability scale?
description: Mechanistic interpretability has produced detailed circuit identifications in small models (GPT-2 small, toy transformers) and large feature catalogs in frontier models (Claude Sonnet via SAEs).
---

# Can mechanistic interpretability scale?

## The question

Mechanistic interpretability has produced detailed circuit
identifications in small models (GPT-2 small, toy
transformers) and large feature catalogs in frontier models
(Claude Sonnet via SAEs). Can the methodology produce a
*complete* mechanistic understanding of a frontier model?
Or does the work scale only by accepting an
interpretability-coverage tradeoff that grows with model
size?

## Two scaling questions

**Coverage.** Does the methodology recover *all* the
features and circuits in a network, or only some? As models
grow, does the recovered fraction stay constant, grow, or
shrink?

**Depth.** Does the methodology produce *complete*
mechanistic explanations of behaviors, or only partial ones?
As models grow more capable, do behaviors become harder to
fully explain mechanistically?

These are separate scaling concerns; a method that scales on
one may fail on the other.

## What the empirical record shows

- **Small models (GPT-2 small).** Detailed circuit
  identifications exist for several behaviors. Coverage
  appears decent (most behaviors have plausible circuit
  explanations); depth is high (algorithms are documented
  step-by-step).
- **Mid-size models.** Less complete. Some circuits
  identified; many behaviors lack detailed explanations.
- **Frontier models (Claude Sonnet, GPT-4 class).** Feature
  catalogs exist via SAEs. Circuit-level explanations of
  specific behaviors are sparse. Coverage of feature
  catalogs is partial; depth (algorithmic explanation) is
  thin.

The pattern suggests scaling is hard but not impossible —
methodology improves, scale of effort grows, frontier
models slowly become more interpretable. But the field has
not produced anything like a complete mechanistic
explanation of any frontier model.

## Why scaling is hard

- **Combinatorial explosion.** Number of components grows
  with model size; number of *circuits* (subgraphs) grows
  exponentially. Exhaustive analysis is infeasible.
- **Polysemanticity grows.** Features per dimension scale;
  features per neuron stay roughly constant. The
  interpretability problem per neuron stays hard.
- **Abstract behaviors are harder.** Frontier models do
  things smaller models can't (long-form reasoning,
  multi-step planning); these are inherently harder to
  decompose into circuits.
- **Distribution complexity.** Frontier models operate over
  vast input distributions; per-input-distribution
  attribution becomes intractable.
- **Mechanistic ambiguity.** It is increasingly unclear
  whether frontier-model behaviors *have* clean circuit
  decompositions, or whether they're irreducibly
  distributed.

## What scaling might require

- **Hierarchical methods.** Circuit identification at
  multiple granularities (feature → component → layer →
  region).
- **Automated discovery infrastructure.** Tools that can
  systematically explore circuit space, not just verify
  hypothesized circuits.
- **Cross-model methodology.** Insights from smaller models
  transferring to larger ones; lifting circuit
  identifications across scale.
- **Acceptable partial coverage.** A theory of *which
  parts* of a frontier model can be mechanistically
  understood and which cannot.
- **Different ontology.** Maybe "features and circuits" is
  the wrong vocabulary at scale; alternative
  decompositions may be needed.

## Why this matters

If mechanistic interpretability scales:

- Frontier-model alignment proposals depending on internal-
  state access become tractable.
- Capability evaluations can use interpretability tools.
- Safety arguments based on "we know what the model is
  doing" become defensible.

If it doesn't scale:

- Alignment must rely on behavioral methods, with
  consequent epistemic limits.
- Capability evaluations face fundamental detection limits.
- The pre-deployment safety case for frontier models is
  weakened.

The scalability question is therefore not merely
methodological; it is strategic for the broader project of
deploying frontier AI safely.

## Status

Open. Active work on scaling SAEs, automated circuit
discovery, cross-model feature transfer, and frontier-model
case studies. Whether the methodology will succeed in
producing *complete* mechanistic understanding at the
frontier — or only useful partial understanding — is the
single largest open question for the program.
