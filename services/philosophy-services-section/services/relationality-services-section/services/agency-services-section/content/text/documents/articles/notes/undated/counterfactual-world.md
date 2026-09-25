---
type: object
class: foundational
status: active
depends-on:
  - teaching/explanations/counterfactual.md
  - structural-equation.md
see-also:
  - ../morphisms/counterfactual-inference.md
references: []
title: Counterfactual world
description: A counterfactual world is the hypothetical world resulting from a counterfactual intervention, given observed evidence about the actual world.
---

# Counterfactual world

A **counterfactual world** is the hypothetical world
resulting from a counterfactual intervention, given
observed evidence about the actual world. It is the
formal object on which counterfactual claims are
evaluated.

## Structure

Given:

- An SCM $M$.
- Observed evidence $E = e$ (some variables observed).
- Counterfactual antecedent: "had $X$ been $x'$
  instead of its actual value."

The counterfactual world is constructed by:

1. **Abduction.** Infer noise $U$ from evidence $e$
   via Bayesian update on $P(U | E = e)$.
2. **Action.** Modify SCM: replace $X$'s equation
   with $X := x'$.
3. **Prediction.** In the modified SCM with
   observation-implied noise, compute the value of
   queried variables.

The result is the *unique counterfactual outcome* for
this evidence-conditioned case.

## Why it's "a world"

The terminology emphasizes:

- **Specificity.** Not a population claim but a
  specific scenario.
- **Counterfactual.** Not actual; could-have-been.
- **Coherent.** All variables take consistent values
  per the modified SCM.
- **Conditioned on evidence.** Reflects what we know
  about the actual unit.

It's a *parallel-world* construction: the same
unit/instance, with one cause changed, and downstream
effects propagating through the same mechanisms.

## Counterfactual semantics

Different counterfactuals yield different worlds:

- "Had this patient taken the drug" — one
  counterfactual world.
- "Had this patient been older" — different world.
- "Had both" — yet another.

Each requires re-running abduction with the relevant
modified SCM.

## Probabilistic counterfactuals

When $P(U | E = e)$ is non-degenerate (because
evidence doesn't pin down all noise):

- Counterfactual world is a *distribution* over
  worlds.
- Counterfactual queries become probability
  statements.
- E.g., "$P(\mathrm{recovery} | \mathrm{actual},
  \mathrm{do}(\mathrm{drug}))$" — probability of
  recovery in the counterfactual world.

## Identifiability

Counterfactual queries are generally *less*
identifiable than interventional queries:

- Interventional queries identifiable from causal
  structure under standard conditions.
- Counterfactual queries also need:
  - Specific functional form (not just structure).
  - Specific noise distribution (not just
    independence).
- Some counterfactual quantities (probability of
  necessity / sufficiency) identifiable only under
  monotonicity or similar.

## Multiple-worlds caveat

Counterfactual worlds raise philosophical issues:

- **Untestable.** The counterfactual didn't happen;
  no direct observation possible.
- **Multiple inconsistent counterfactuals.** Various
  counterfactuals about the same case may not
  combine coherently (e.g., nested counterfactuals).
- **Philosophical disputes.** Lewis-style possible-
  worlds vs Pearl-style structural — different
  formal apparatus.

Pearl's SCM-based counterfactuals are the standard in
causal AI; alternatives exist.

## In contemporary AI

- **Counterfactual fairness.** Define fairness via
  counterfactual claims.
- **Counterfactual explanation.** Generate "what
  would have to change" explanations.
- **Off-policy evaluation in RL.** Reason about
  outcomes under alternative policies on the same
  trajectory data.
- **Algorithmic recourse.** Suggest changes that
  would have flipped algorithmic decisions.

## Limits

- **Distributional assumptions.** Required for
  identifiability.
- **Untestable.** No direct empirical check.
- **Functional-form sensitivity.** Different SCMs
  yield different counterfactuals from same data.
- **Composition.** Nested counterfactuals are
  technically subtle.

## Status

Foundational object for the third rung of Pearl's
hierarchy. Necessary for fairness, explanation, and
attribution work. Inherently more contested than
interventional notions due to identifiability and
metaphysical issues.
