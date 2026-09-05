---
type: morphism
class: foundational
status: active
depends-on:
  - ../objects/causal-graph.md
  - ../objects/confounder.md
see-also:
  - frontdoor-adjustment.md
  - teaching/explanations/do-calculus.md
references: []
---

# Backdoor adjustment

**Backdoor adjustment** is the standard identification
strategy for the causal effect of $X$ on $Y$: find a
set $Z$ that *blocks all backdoor paths* from $X$ to
$Y$ and adjust for it.

## The backdoor criterion

A set $Z$ satisfies the backdoor criterion relative to
$(X, Y)$ if:

- No node in $Z$ is a descendant of $X$.
- $Z$ blocks every backdoor path from $X$ to $Y$
  (paths starting with an arrow *into* $X$).

If such $Z$ exists, $P(Y | \mathrm{do}(X))$ is
*identifiable* from observational data via:

$$P(Y | \mathrm{do}(X = x)) = \sum_z P(Y | X = x, Z =
z) P(Z = z)$$

## Why it works

Backdoor paths represent confounding routes — paths
that create $X$-$Y$ association *not* due to causal
effect. Conditioning on a set that blocks them removes
the confounding contribution, leaving the causal
effect.

The first condition (no descendants of $X$) prevents
conditioning on colliders or mediators, which would
introduce *new* confounding (selection bias) or block
the causal effect itself.

## Choosing the adjustment set

Multiple sets often satisfy the backdoor criterion.
Choices:

- **Direct parents of $X$.** Always works (blocks
  every backdoor path) but may be unmeasured.
- **Sufficient observed set.** Practical choice when
  parents include unobserved variables.
- **Minimal sufficient set.** Smallest set blocking
  backdoor paths; reduces variance of estimates.

Tools (DoWhy, dagitty) automate backdoor-set
identification given a graph.

## Examples

**Drug effect on recovery, with age confounding.**

- Graph: $\mathrm{Age} \to \mathrm{Drug}$, $\mathrm{Age}
  \to \mathrm{Recovery}$, $\mathrm{Drug} \to
  \mathrm{Recovery}$.
- Backdoor path: $\mathrm{Drug} \leftarrow \mathrm{Age}
  \to \mathrm{Recovery}$.
- Adjust for Age: $P(\mathrm{Rec} | \mathrm{do}(\mathrm{Drug}))
  = \sum_a P(\mathrm{Rec} | \mathrm{Drug}, \mathrm{Age} =
  a) P(\mathrm{Age} = a)$.

**Education effect on income, with parental wealth
confounding.** Adjust for parental wealth (assuming
it blocks all backdoors).

## Common pitfalls

- **Adjusting for descendants of $X$.** Introduces
  selection bias or blocks causal effect.
- **Adjusting for colliders.** Opens previously-
  blocked paths (M-bias).
- **Failing to adjust for an unblocked backdoor
  path.** Residual confounding.
- **Wrong causal graph.** Even valid backdoor
  adjustment is wrong if the assumed graph is wrong.

## Estimation

Once identified, the adjustment formula can be
estimated from data:

- **Stratification.** Direct empirical computation.
- **Regression.** Model $E[Y | X, Z]$ as function;
  marginalize.
- **Inverse probability weighting.** Weight
  observations by $1 / P(X | Z)$.
- **Doubly robust estimators.** Combine outcome
  modeling and propensity weighting.

These are well-developed statistical techniques.

## In contemporary AI

- **Causal effect estimation pipelines.** DoWhy,
  EconML, CausalML libraries automate backdoor
  identification + estimation.
- **Off-policy evaluation in contextual bandits.**
  Backdoor adjustment for treatment effects in
  observational policy data.
- **Causal inference at tech companies.** Standard
  tool when randomized experiments not available.

## Limits

- **Requires correct graph.** If graph is wrong,
  adjustment is wrong.
- **Requires observed adjustment set.** If
  confounders unobserved, can't adjust.
- **Estimation noise.** Adjusted estimators have
  variance; can be high.
- **Positivity.** Need $P(X | Z) > 0$ for all $X, Z$
  combinations of interest.

## Status

Foundational. Standard tool. The default
identification strategy when applicable.
