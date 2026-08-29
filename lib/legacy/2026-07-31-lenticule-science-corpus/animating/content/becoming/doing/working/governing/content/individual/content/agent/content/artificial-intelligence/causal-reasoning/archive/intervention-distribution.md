---
type: object
class: foundational
status: active
depends-on:
  - teaching/explanations/intervention.md
see-also:
  - ../morphisms/do-operator.md
  - teaching/explanations/do-calculus.md
references: []
---

# Intervention distribution

The **intervention distribution** $P(V | \mathrm{do}(X
= x))$ is the joint distribution over variables when
$X$ is set by external intervention to $x$ (rather
than by its usual causes).

## Definition via SCM

Given an SCM $M = (V, U, F, P(U))$:

- The **observational distribution** is $P(V)$,
  derived from propagating noise through $F$.
- The **intervention distribution**
  $P(V | \mathrm{do}(X = x))$ is derived from the
  *modified* SCM $M_{\mathrm{do}(X = x)}$:
    - Replace $X$'s equation with $X := x$.
    - Leave others intact.
    - Propagate noise.

This *truncated factorization*:

$$P(V | \mathrm{do}(X = x)) = \prod_{i: V_i \neq X}
P(V_i | \mathrm{pa}(V_i)) \cdot \mathbb{1}[X = x]$$

(omitting the factor for $X$, since it's set by
intervention).

## Distinction from conditional

$P(Y | \mathrm{do}(X = x))$ vs $P(Y | X = x)$:

- The former conditions on intervention.
- The latter conditions on observation.

These differ when $X$ has causes that also cause $Y$
(confounding). Then observing $X = x$ is evidence for
*both* $X = x$ and the upstream factors that produced
it; intervention severs that link.

In general:

$$P(Y | \mathrm{do}(X = x)) \neq P(Y | X = x)$$

Equality holds when $X$ has no confounders with $Y$
(e.g., $X$ is fully randomized).

## Identifiability

Per [identifiability-pearl](../theorems/identifiability-pearl.md):

$P(V | \mathrm{do}(X))$ is *identifiable* from $P(V)$
if there is a do-calculus derivation transforming the
former into a function of the latter. Per
[do-calculus-completeness](../theorems/do-calculus-completeness.md),
do-calculus is complete: identification exists iff
do-calculus finds it.

When identification fails:

- Intervention distribution is not determined by
  observational data alone.
- Either experiments or stronger assumptions are
  needed.

## Examples

- **Drug effect.** $P(\mathrm{recovery} |
  \mathrm{do}(\mathrm{drug}))$ vs $P(\mathrm{recovery}
  | \mathrm{drug})$. Differ if confounded.
- **Policy effect.** $P(\mathrm{outcome} |
  \mathrm{do}(\mathrm{policy}))$ for hypothetical
  policy.
- **Agent action.** $P(\mathrm{state}' |
  \mathrm{state}, \mathrm{do}(\mathrm{action}))$ —
  the *transition function* in RL.

## In contemporary AI

- **A/B testing.** Computes interventional
  expectations directly via randomization.
- **Causal inference from observational data.**
  Identifies and estimates intervention distributions
  from observational data + causal assumptions.
- **Causal RL.** Models transition dynamics as
  intervention distributions; reasons about novel
  actions.
- **Off-policy evaluation.** Computing intervention
  distributions for policies not in data.

## Multi-variable interventions

Generalizations:

- **Joint intervention.** $\mathrm{do}(X = x, Y =
  y)$.
- **Stochastic intervention.** Set $X$ according to a
  policy distribution.
- **Conditional intervention.** $X$ set as function
  of observed $Z$.

These extend the framework; identifiability analysis
extends correspondingly.

## Limits

- **Identifiability.** Often fails; requires
  experiments.
- **Estimation.** Even when identified, finite-sample
  estimation has variance.
- **Model dependence.** Wrong causal graph yields
  wrong intervention distribution.
- **Composition.** Sequential intervention
  distributions compound assumptions.

## Status

Foundational concept. Operationalized through
observational identification methods (backdoor,
frontdoor) and experimental methods (RCTs).
