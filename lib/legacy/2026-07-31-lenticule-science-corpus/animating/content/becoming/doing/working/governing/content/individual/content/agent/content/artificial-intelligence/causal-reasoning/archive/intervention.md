---
type: concept
class: foundational
status: active
depends-on:
  - causal-reasoning.md
see-also:
  - ../objects/intervention-distribution.md
  - ../morphisms/do-operator.md
references:
  - references/pearl-causality2009.md
---

# Intervention

An **intervention** is an external manipulation that
sets a variable to a particular value, breaking its
dependence on its usual causes. Notation:
$\mathrm{do}(X = x)$ — "set $X$ to $x$ by external
action."

## Distinction from observation

Observing $X = x$ is different from setting $X = x$:

- **Observation.** $P(Y | X = x)$ uses Bayesian
  conditioning. "Among cases where X happened to be
  x, what's Y?"
- **Intervention.** $P(Y | \mathrm{do}(X = x))$ uses
  causal-effect calculation. "If I force X to be x,
  what's Y?"

These differ when X has causes that also affect Y
(confounders). In observational data, X-with-confounder-
present looks different from forced-X.

## The do-operator

The intervention $\mathrm{do}(X = x)$ in a structural
causal model:

- Removes $X$'s structural equation.
- Sets $X = x$ by fiat.
- Leaves all other equations intact.
- Computes the resulting joint distribution.

This is the *graphical surgery* interpretation: cut
incoming edges to X; set X = x; propagate.

## Why interventions matter for agents

Agents act in the world. Acting is intervening:

- An agent that takes action $a$ is performing
  $\mathrm{do}(A = a)$.
- The expected outcome of action depends on
  $P(\mathrm{outcome} | \mathrm{do}(a))$, not
  $P(\mathrm{outcome} | a)$ from data.
- Confusing the two produces systematic agent errors.

Therefore: agents need interventional reasoning, not
just associational.

## Identifying intervention distributions

The central technical question: when can
$P(Y | \mathrm{do}(X))$ be computed from observational
$P(Y, X, \ldots)$?

- **Sometimes.** Per
  [identifiability-pearl](../theorems/identifiability-pearl.md),
  identifiability depends on the causal structure.
- **Backdoor adjustment.** Adjust for a sufficient
  set blocking all backdoor paths.
- **Frontdoor adjustment.** Through a mediator when
  no backdoor adjustment set exists.
- **Do-calculus.** The complete inference system;
  per [do-calculus-completeness](../theorems/do-calculus-completeness.md),
  finds an identification iff one exists.

## Empirical interventions

When identification from observational data fails,
*empirical* intervention works:

- **Randomized experiments.** Direct intervention by
  experimenter; eliminates confounding by design.
- **Natural experiments.** Real-world intervention-
  like events (policy changes, instrumental
  variables).
- **Active learning / experimentation.** Agent
  intervenes to learn effects.

This is the gold standard but expensive and sometimes
infeasible.

## Examples

- **Drug trial.** $\mathrm{do}(\mathrm{drug} = 1)$
  vs $\mathrm{do}(\mathrm{drug} = 0)$; randomization
  achieves intervention.
- **Policy effect.** $\mathrm{do}(\mathrm{policy} = X)$
  vs current policy.
- **Agent action.** $\mathrm{do}(\mathrm{action} = a)$
  with effect on environment.

## Soft interventions

Beyond hard interventions ($\mathrm{do}(X = x)$):

- **Soft intervention.** Modify $X$'s structural
  equation rather than fix value. E.g., shift mean,
  add noise.
- **Conditional intervention.** Intervene differently
  based on observed values.
- **Stochastic intervention.** Set X according to a
  policy distribution.

These extend the framework; same general principles
apply.

## In contemporary AI

- **Causal RL.** Reasoning about interventions to
  improve sample efficiency and transfer.
- **Counterfactual data augmentation.** Generating
  intervention data for ML training.
- **A/B testing.** Industrial-scale empirical
  interventions.
- **Mechanistic interpretability.** Interventions on
  model internals to test causal claims.

## Limits

- **Identifiability gaps.** Many interventions cannot
  be identified from observational data.
- **Action-effect modeling.** Real-world action
  effects are harder to model than discrete
  interventions.
- **Compositional intervention.** Effects of
  intervention sequences are hard to bound.
- **Foundation-model interventions.** Whether LLMs
  reason about interventions correctly is unsettled.

## Status

Foundational concept. Well-developed theoretical
treatment. potential integration with ML and deep
learning.
