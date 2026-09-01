---
type: morphism
class: foundational
status: active
depends-on:
  - teaching/explanations/counterfactual.md
  - ../objects/structural-equation.md
  - ../objects/counterfactual-world.md
see-also: []
references:
  - references/pearl-causality2009.md
---

# Counterfactual inference

**Counterfactual inference** is the morphism that
evaluates counterfactual claims given a structural
causal model and observed evidence. Pearl's *three-step
procedure*: abduction, action, prediction.

## The three steps

Given:

- An SCM $M$ with structural equations $V_i :=
  f_i(\mathrm{pa}(V_i), U_i)$.
- Observed evidence $E = e$ (some variables
  observed).
- Counterfactual antecedent: "had $X$ been $x$."
- Counterfactual query: value of some variable $Y$.

The procedure:

**1. Abduction.** Update beliefs about exogenous
noise $U$ given evidence:

$$P(U | E = e)$$

This step infers what specific noise realization
explains the observed case.

**2. Action.** Modify the SCM by replacing $X$'s
equation:

$$X := x$$

leaving other equations unchanged.

**3. Prediction.** Compute $Y$ in the modified SCM
using the inferred $P(U | E = e)$:

$$P(Y_{X = x} | E = e) = \sum_u P(Y(u) \text{ in
modified SCM}) \cdot P(U = u | E = e)$$

The result is the (probabilistic) counterfactual
outcome.

## Why three steps

Each step does specific work:

- **Abduction** captures "this specific case" — the
  noise that produced the observation.
- **Action** captures "what would have been" — the
  modified causal mechanism.
- **Prediction** captures "the result" — propagating
  through unchanged mechanisms.

Together they realize Pearl's intuition that
counterfactuals are *parallel-world* claims about the
same individual unit.

## Identifiability

Counterfactual queries are *generally less
identifiable* than interventional ones:

- Interventional: identifiable from causal structure
  + observational distribution under do-calculus
  conditions.
- Counterfactual: additionally requires specific
  functional form of structural equations (not just
  graph) and noise distribution.

Some counterfactual quantities (probability of
necessity, probability of sufficiency) are identifiable
under monotonicity or similar assumptions but not
generally.

## Worked example

Suppose linear SCM:
- $X := U_X$
- $Y := \alpha X + U_Y$
- Observed: $X = 1, Y = 3$, $\alpha = 2$.

Abduction: $U_X = 1$ (since $X = U_X$); $U_Y = 3 - 2
\cdot 1 = 1$.

Counterfactual "had $X$ been 0":

- Action: replace $X$'s equation with $X := 0$.
- Prediction: $Y = 2 \cdot 0 + U_Y = U_Y = 1$.

So the counterfactual is $Y_{X=0} = 1$ for this
specific case.

## Probabilistic counterfactuals

When evidence doesn't pin down all noise:

- $P(U | E)$ is a non-degenerate distribution.
- Counterfactual $P(Y_{X = x'} | E)$ is a
  distribution over outcomes.
- Provides probabilistic counterfactual claim.

This is the general case; deterministic
counterfactuals (like the example) are special.

## In contemporary AI

- **Counterfactual fairness** (Kusner et al. 2017).
  Define fairness via counterfactual claims.
- **Counterfactual explanations.** Generate
  hypothetical "what would have to change" answers.
- **Off-policy evaluation in RL.** Reason about what
  trajectory would have occurred under alternative
  policies.
- **Algorithmic recourse.** Suggest changes that
  would have flipped algorithmic decisions.

## Limits

- **Identifiability.** Stronger requirements than
  for intervention.
- **Functional-form sensitivity.** Different SCMs
  with same graph yield different counterfactuals.
- **Noise distribution.** Often unidentified;
  affects inferences.
- **Untestable.** Counterfactuals are inherently
  unobservable; cannot be checked against data.

## Status

Foundational morphism. Standard formalization of
counterfactual reasoning. Necessary for formal
counterfactual fairness, explanation, and recourse
work.
