---
type: morphism
class: foundational
status: active
depends-on:
  - ../objects/causal-graph.md
see-also:
  - backdoor-adjustment.md
  - teaching/explanations/do-calculus.md
references:
  - references/pearl-causality2009.md
title: Frontdoor adjustment
description: Frontdoor adjustment is an identification strategy for the causal effect of $X$ on $Y$ when no observed backdoor adjustment set exists, but a mediator $M$ exists that is unconfounded with $Y$.
---

# Frontdoor adjustment

**Frontdoor adjustment** is an identification strategy
for the causal effect of $X$ on $Y$ when no observed
backdoor adjustment set exists, but a *mediator* $M$
exists that is unconfounded with $Y$.

## When to use it

Frontdoor adjustment applies when:

- $X$ and $Y$ have unobserved confounders (no
  backdoor adjustment available).
- A mediator $M$ exists with $X \to M \to Y$ as the
  *only* causal path.
- $M$ is unconfounded with $Y$ (no unobserved
  confounders affect both).
- $M$ is fully mediating: no direct $X \to Y$ edge.
- $X$ is unconfounded with $M$ (or backdoor-adjustable
  for the $X \to M$ effect).

This is a strong set of conditions but enables
identification when backdoor fails.

## The formula

Under the frontdoor criterion:

$$P(Y | \mathrm{do}(X = x)) = \sum_m P(M = m | X = x)
\sum_{x'} P(Y | M = m, X = x') P(X = x')$$

Decomposes the effect into:

- $X \to M$: identified from $P(M | X)$ (assumed
  unconfounded).
- $M \to Y$: identified by adjusting for $X$ (which
  blocks confounders of $M, Y$ via the $X$
  backdoor).
- Composition gives total effect.

## Derivation

The frontdoor formula is a do-calculus consequence:

- $P(M | \mathrm{do}(X)) = P(M | X)$ (no confounders
  of $X, M$ assumed).
- $P(Y | \mathrm{do}(M)) = \sum_x P(Y | M, X = x)
  P(X = x)$ (backdoor adjustment for $X$ as confounder
  of $M, Y$).
- Total effect via chain rule.

The full derivation walks through the three do-calculus
rules.

## Classical example: Pearl's smoking-tar-cancer

- $\mathrm{Smoking} \to \mathrm{Tar} \to
  \mathrm{Cancer}$ with hypothesized direct paths.
- Suppose unobserved genetic confounder of smoking
  and cancer.
- Backdoor adjustment unavailable (gene unobserved).
- Frontdoor adjustment via tar deposit (assumed
  unconfounded with cancer) identifies the smoking-
  cancer effect.

This was Pearl's motivating illustration. The
plausibility of the assumptions is itself debated
(does tar fully mediate?), but the formal logic is
clean.

## Limits

- **Strong assumptions.** All of: full mediation, no
  confounders of mediator-outcome, mediator
  unconfounded with treatment.
- **Plausibility.** In practice, all conditions
  rarely jointly hold.
- **Sensitivity.** Small violations of conditions
  bias estimates.
- **Real-world rarity.** Frontdoor situations are
  less common than backdoor situations.

## When does it apply?

Realistic frontdoor situations:

- Mediation by a measurable biomarker that's
  unconfounded with outcome.
- Mechanism where treatment acts through a fully-
  observable intermediate.
- Some natural-experiment situations with measured
  mediating variables.

These are uncommon but valuable when available.

## In contemporary AI

- **Mediation analysis.** Frontdoor-related methods
  for decomposing total effects into mediated
  components.
- **Sensitivity-based identification.** When
  frontdoor conditions are partially plausible,
  bound the effect.
- **Causal inference libraries.** DoWhy supports
  frontdoor identification.

## Status

Standard but less-commonly-applicable than backdoor.
Important for the completeness of identification
theory; do-calculus shows backdoor and frontdoor are
the two basic patterns from which more complex
identifications are built.
