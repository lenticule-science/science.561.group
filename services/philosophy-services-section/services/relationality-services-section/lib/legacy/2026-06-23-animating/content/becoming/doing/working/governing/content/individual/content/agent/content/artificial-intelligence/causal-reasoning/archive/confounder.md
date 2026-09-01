---
type: object
class: classical
status: active
depends-on:
  - causal-graph.md
see-also:
  - ../morphisms/backdoor-adjustment.md
  - ../theorems/simpsons-paradox.md
references: []
---

# Confounder

A **confounder** is a variable that causally affects
both *treatment* $X$ and *outcome* $Y$. Confounders
create non-causal associations between $X$ and $Y$,
biasing naive estimates of the causal effect.

## Structure

Graphically, a confounder $U$ is on a *backdoor path*:

$$X \leftarrow U \rightarrow Y$$

The arrows from $U$ flow to both $X$ and $Y$, creating
a path of association that is *not* causal in the
$X \to Y$ direction.

Naive observation of $X$ and $Y$ together captures
both:

- The actual causal effect $X \to Y$ (if any).
- The confounding association via $X \leftarrow U \to
  Y$.

These are conflated unless explicitly separated.

## Examples

- **Age** confounding effect of treatment on
  recovery: older patients more likely to receive
  treatment *and* less likely to recover, regardless
  of treatment effect.
- **Wealth** confounding effect of education on
  health: wealthier people get more education *and*
  better health.
- **Socioeconomic status** confounding effect of
  many social variables on many outcomes.

These are why "correlation isn't causation" in
practice.

## Adjustment

Per [backdoor-adjustment](../morphisms/backdoor-adjustment.md):

If $U$ is observed, adjust by stratifying:

$$P(Y | \mathrm{do}(X)) = \sum_u P(Y | X, U = u) P(U
= u)$$

Effectively: compute treatment effect within each
stratum of confounder; average over stratum
distribution.

This identifies causal effect provided $U$ blocks all
backdoor paths and is itself unaffected by $X$.

## Unmeasured confounders

The major real-world challenge: confounders often
*aren't observed*.

Mitigation:

- **Instrumental variables.** Identify causal effect
  through exogenous variation.
- **Frontdoor adjustment.** Identify through a
  mediator when no backdoor adjustment available.
- **Sensitivity analysis.** Quantify how strong
  unmeasured confounding would have to be to
  invalidate conclusions.
- **Randomization.** Eliminate confounding by design
  (RCTs).

When unmeasured confounders are plausible and other
methods unavailable, observational causal claims are
unsupported.

## Confounding triangle

A useful mnemonic:

- $X \to Y$: causal (what we want).
- $X \leftarrow U \to Y$: confounding (what we don't).
- $X \to Z \leftarrow Y$: collider (different
  problem).

Confusing these — or failing to recognize them — is a
primary source of incorrect causal inference.

## Confounding in AI

- **Spurious correlations in ML.** Shortcut features
  may be confounders for the true label-relevant
  features.
- **Selection bias** is a related (but distinct)
  pattern: selection-into-data acts like a collider
  conditioning.
- **Distributional shift.** When confounder
  distribution shifts, naive predictions break.
- **Causal RL.** Confounding in observational
  policies must be addressed for off-policy
  evaluation.

## Limits

- **Identification depends on observation.** Without
  measuring $U$, naive adjustment fails.
- **Adjustment-set selection.** Choosing which
  variables to adjust for is non-trivial; over-
  adjustment can also bias.
- **Time-varying confounders.** In longitudinal
  settings, confounders that respond to treatment
  require special methods (g-methods).

## Status

Classical and foundational concept. Standard
pedagogical material. Pervasive concern in any
observational causal claim.
