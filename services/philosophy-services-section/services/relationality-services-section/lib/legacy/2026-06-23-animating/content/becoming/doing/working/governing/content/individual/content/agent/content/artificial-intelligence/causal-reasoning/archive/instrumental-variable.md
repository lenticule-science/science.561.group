---
type: object
class: classical
status: active
depends-on:
  - causal-graph.md
see-also:
  - ../theorems/instrumental-variable-bound.md
references:
  - references/hernan-whatif2020.md
---

# Instrumental variable

An **instrumental variable** $Z$ for the effect of $X$
on $Y$ is a variable satisfying:

- **Relevance.** $Z$ affects $X$.
- **Exclusion.** $Z$ affects $Y$ only through $X$
  (no direct path $Z \to Y$ or $Z \to U \to Y$ that
  bypasses $X$).
- **Independence.** $Z$ is independent of unmeasured
  confounders of $X$ and $Y$.

Under these, $Z$ enables identification of the causal
effect of $X$ on $Y$ even when $X$ and $Y$ have
unmeasured confounders.

## The basic IV identity

Under linear effects and no defiers:

$$\frac{\mathrm{Cov}(Y, Z)}{\mathrm{Cov}(X, Z)}$$

estimates the causal effect of $X$ on $Y$. This
*IV estimator* uses $Z$'s exogenous variation to
identify what naive observation cannot.

## Examples

Classical IVs in econometrics:

- **Distance to college** as instrument for years of
  schooling (effect on wages).
- **Quarter of birth** as instrument for years of
  schooling (Angrist-Krueger).
- **Lottery for military service** as instrument for
  service (effect on later outcomes).
- **Random assignment to treatment** in noncompliance
  settings (intent-to-treat as IV for actual
  treatment).

In each, the instrument provides exogenous variation
in the treatment, enabling causal inference under
unmeasured confounding.

## When IV works

The exclusion restriction is often the *binding*
constraint. It must be:

- Defended by argument (cannot be tested from data
  alone in general).
- Plausible domain knowledge.
- Robust to alternative-pathway concerns.

Bad IVs are common; small violations of exclusion
restriction can produce large bias.

## Limits

- **Exclusion violation.** Hard to defend
  empirically; often fails subtly.
- **Weak instruments.** Low correlation between $Z$
  and $X$ produces high-variance estimates.
- **Heterogeneity.** IV estimates the *local average
  treatment effect* (LATE) — effect for those whose
  treatment was moved by the instrument, not for the
  whole population.
- **Defiers.** People whose treatment moves opposite
  to the instrument violate monotonicity.

## In contemporary AI

- **Off-policy evaluation.** IV-style identification
  for evaluating policies under unmeasured
  confounding.
- **Causal effect estimation in observational data.**
  Standard tool when confounding suspected.
- **Mendelian randomization.** Genetic variants as
  instruments in epidemiology.
- **Recommendation system A/B testing.** Random
  assignment as IV when compliance is partial.

## Status

Classical method (Wright 1928 for simultaneous
equations; modern formulation Angrist-Imbens-Rubin
1996). Standard in econometrics and increasingly in
causal ML. The default approach for unmeasured
confounding when a credible instrument exists.
