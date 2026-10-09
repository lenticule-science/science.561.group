---
type: theorem
class: classical
status: established
depends-on:
  - ../objects/instrumental-variable.md
see-also: []
references:
  - references/hernan-whatif2020.md
title: Instrumental variable bound (LATE)
description: Under instrumental-variable conditions and monotonicity (no defiers), the IV estimator identifies the local average treatment effect (LATE) — the average causal effect for compliers, those whose treatment status was changed by the…
---

# Instrumental variable bound (LATE)

## Statement

Under instrumental-variable conditions and
**monotonicity** (no defiers), the IV estimator
identifies the **local average treatment effect
(LATE)** — the average causal effect *for compliers*,
those whose treatment status was changed by the
instrument. Result due to Imbens-Angrist (1994).

## Setup

Let:

- $Z$: binary instrument (e.g., randomized
  encouragement).
- $X$: binary treatment (e.g., took drug).
- $Y$: outcome.

Define for each unit:

- $X(z = 0)$: treatment if unencouraged.
- $X(z = 1)$: treatment if encouraged.
- $Y(x = 0), Y(x = 1)$: potential outcomes under
  treatment.

Categorize units:

- **Compliers.** $X(0) = 0, X(1) = 1$. Take
  treatment when encouraged.
- **Always-takers.** $X(0) = X(1) = 1$. Take
  regardless.
- **Never-takers.** $X(0) = X(1) = 0$. Don't take
  regardless.
- **Defiers.** $X(0) = 1, X(1) = 0$. Take when
  unencouraged but not when encouraged.

## The LATE result

Under:

- **IV exclusion.** $Z$ affects $Y$ only through
  $X$.
- **IV independence.** $Z \perp Y(X), X(Z)$.
- **Monotonicity.** No defiers.

The IV estimator

$$\frac{E[Y | Z = 1] - E[Y | Z = 0]}{E[X | Z = 1] -
E[X | Z = 0]}$$

equals the average treatment effect *for compliers*:

$$E[Y(1) - Y(0) | \mathrm{complier}]$$

This is the LATE.

## What it doesn't identify

LATE is *not* the average treatment effect (ATE) over
the whole population:

- Always-takers' effect not identified (they take
  regardless).
- Never-takers' effect not identified.
- Compliers' effect *is* identified.

Without further assumptions (no-effect-modification by
compliance type), one cannot extrapolate from LATE to
ATE.

## Why "bound"

The LATE result is sometimes seen as "merely" a
local result. Stronger identification (of ATE) requires
additional assumptions:

- **Effect homogeneity.** Same effect for all
  compliance types (strong).
- **Conditional effect homogeneity.** Same effect
  controlling for covariates.
- **Bounds.** Manski-style bounds on ATE without
  homogeneity.

Without these, only LATE is identified — that's the
"bound."

## Importance

LATE clarified what IV does and doesn't identify.
Before, IV estimates were sometimes interpreted as
ATEs without warrant; the LATE result drew attention
to the *local* nature of the identification.

This has practical implications: an experiment with
partial compliance estimates ATE only for compliers,
not for always- and never-takers (whose treatment
isn't actually changed by the experiment).

## Implications for AI

- **Off-policy evaluation in contextual bandits.**
  IV-style identification subject to LATE-like
  restrictions.
- **Encouragement designs.** When experiments use
  encouragement rather than direct treatment
  assignment, LATE applies.
- **Heterogeneous treatment effects.** LATE results
  motivate explicit modeling of heterogeneity rather
  than assuming homogeneity.

## Limits

- **Monotonicity untestable.** Like exclusion,
  monotonicity is a substantive assumption that
  data alone cannot validate.
- **Local applicability.** LATE applies to compliers
  for the specific instrument; different instruments
  yield different LATEs.
- **Heterogeneity.** Real treatment effects vary;
  LATE captures one slice.

## Status

Foundational result for IV interpretation. Standard
content in econometrics and causal-inference courses.
Practical implications for any IV analysis.
