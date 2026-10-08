---
type: narrative
status: active
references:
  - ../references/pearl-bookofwhy2018.md
  - ../references/hernan-whatif2020.md
title: When correlation fails
description: "\"Correlation isn't causation\" is a slogan everyone knows."
---

# When correlation fails

"Correlation isn't causation" is a slogan everyone
knows. But knowing the slogan doesn't make people
actually use it. Practical ML pipelines, scientific
papers, and business decisions routinely treat
correlations as if they were causal. When does this
matter?

## Five failure patterns

### Confounded prediction

Two variables correlate because they share a common
cause. Naively predicting one from the other works
in-distribution but fails when the confounder shifts.

- **Classic example.** Ice cream sales correlate with
  drowning deaths (both caused by summer weather).
  Predicting drownings from ice cream sales works
  seasonally but fails if you intervene to reduce
  ice cream sales.
- **ML example.** Hospital readmission predictors
  that use medication frequency as a proxy for
  underlying severity; "more medication" predicts
  more readmission, but intervening to reduce
  medication doesn't reduce readmission.

Without causal modeling, you can't tell when a
prediction will survive intervention.

### Selection bias

Selection into the dataset induces spurious
correlations between variables that aren't causally
related.

- **Berkson's paradox.** Among hospitalized
  patients, two diseases may appear negatively
  correlated even if they're independent in the
  general population (because each disease alone
  was sufficient for hospitalization).
- **ML example.** Models trained on selected user
  populations learn correlations specific to the
  selection; deploy to broader population, the
  correlations break.

Selection bias is pervasive and often invisible
without causal analysis.

### Spurious features

ML models latch onto features that correlate with the
target in training but don't cause it.

- **Texture vs shape in image classification.**
  ImageNet-trained models often classify by texture,
  not shape. Texture correlates with class in
  training data; intervention (shape-only stimuli)
  reveals the dependence.
- **Linguistic shortcuts in NLP.** Models exploit
  lexical cues that correlate with labels in
  training; benchmarks revealing these cues show
  models drop dramatically.

Robust models would use causal features; getting
there requires intervention-aware training.

### Distribution shift

Training distribution differs from deployment.
Correlations that held in training break in
deployment.

- **Covariate shift.** Input distribution changes;
  outputs may still hold causally.
- **Label shift.** Output distribution changes;
  inputs may still hold causally.
- **Concept drift.** Causal mechanism itself
  changes; both correlations and causation shift.
- **Anti-causal direction.** Training direction was
  effect-to-cause; deployment direction may be
  cause-to-effect; correlations differ.

Causal modeling distinguishes which shifts break
which assumptions.

### Confounded policy evaluation

In RL or contextual bandits, evaluating new policies
from data collected under old policies is
fundamentally a causal-inference problem.

- **Off-policy evaluation.** Estimate $V(\pi_{new})$
  from data $\{(s, a, r, s')\}$ collected under
  $\pi_{old}$. Naive estimators are confounded by
  the old policy.
- **Counterfactual policy evaluation.** "What would
  this trajectory have been under $\pi_{new}$?"
  requires counterfactual reasoning.
- **Selection bias.** Policies that *select which
  contexts to act in* introduce confounding by
  selection.

Correct off-policy methods (importance weighting,
doubly-robust estimators) are causal-inference
methods.

## What causal reasoning provides

In each failure pattern:

- **Confounded prediction.** Adjustment for
  confounders identifies causal effect.
- **Selection bias.** Accounting for selection
  mechanism corrects.
- **Spurious features.** Intervention-style training
  (causal data augmentation, IRM) reduces
  reliance.
- **Distribution shift.** Causal models specify what
  shifts break what.
- **Confounded policy evaluation.** Off-policy
  estimators with causal awareness give unbiased
  estimates.

Causal reasoning isn't magic — it requires structural
assumptions — but it gives a framework for *knowing
what assumptions you're making*.

## The discipline

The lesson isn't "always do causal inference"
(sometimes correlations are fine — within-
distribution prediction works). It's:

- **Know what you're doing.** Distinguish
  associational, interventional, and counterfactual
  questions.
- **Match method to question.** Don't apply
  correlational methods to interventional questions.
- **State assumptions.** When using causal claims,
  state the structural assumptions they require.
- **Validate where possible.** Use experiments to
  check observational claims when feasible.

This discipline is what causal reasoning provides.

## Where it matters most

Domains where correlation routinely fails:

- **Medicine.** Confounded clinical observation;
  RCTs are the gold standard.
- **Public policy.** Almost all evaluation is
  causal-inference.
- **Recommender systems.** Selection bias and
  feedback loops pervade.
- **Hiring and lending.** Fairness and effect of
  interventions both causal questions.
- **Scientific ML.** Discovering mechanisms requires
  causal tools.

Where stakes are high and interventions are
considered, correlation is rarely enough.
