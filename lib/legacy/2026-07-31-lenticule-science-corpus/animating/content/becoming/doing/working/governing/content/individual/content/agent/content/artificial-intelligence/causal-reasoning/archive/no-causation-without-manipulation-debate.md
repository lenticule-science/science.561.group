---
type: theorem
class: informal
status: contested
depends-on:
  - teaching/explanations/causal-reasoning.md
  - teaching/explanations/intervention.md
see-also: []
references:
  - references/pearl-causality2009.md
  - references/hernan-whatif2020.md
---

# No causation without manipulation (debate)

## The slogan

Paul Holland (1986): **"No causation without
manipulation."** Causal claims about a variable $X$
are meaningful only insofar as we can imagine
manipulating $X$. Variables that cannot in principle
be manipulated (sex, race, native language) cannot
have well-defined causal effects.

Pearl and others reject this restriction.

## Holland's position

The argument:

- Causal claims about $X$'s effect on $Y$ are claims
  about counterfactuals: "had $X$ been different, $Y$
  would have been different."
- Counterfactual claims are grounded in *experimental
  manipulation*: we know what "had $X$ been
  different" means by analogy to actual interventions.
- For non-manipulable variables, the counterfactual
  is meaningless: "had this person been a different
  race" doesn't pick out a coherent
  intervention/comparison.
- Therefore: causal effects of non-manipulable
  variables are *not well defined*.

This view is influential in statistics and shapes
how empirical work in epidemiology and social
science is presented.

## Pearl's position

Pearl rejects the manipulation requirement:

- Causality is *structural*, not *interventional*:
  causes generate effects through mechanisms.
- An SCM can encode causal claims without requiring
  manipulability: $X := f(\ldots)$ specifies a
  mechanism regardless of whether we can intervene.
- "Effect of race" can be analyzed as the effect of
  the mechanisms by which race operates (e.g.,
  perception of race, treatment by others), even if
  the underlying classification can't be
  manipulated.
- Restricting causality to manipulable variables
  would prevent vast swathes of legitimate causal
  inquiry.

## Why "debate" not "theorem"

This is a *foundational dispute* about the meaning of
causal claims, not a mathematical result. Both
positions have defenders. The dispute affects:

- **Methodology.** What variables may be subjects
  of causal analysis.
- **Reporting.** How to present effects of
  non-manipulable variables.
- **Fairness.** Counterfactual fairness with respect
  to non-manipulable protected attributes is in the
  middle of this dispute.

## Resolution attempts

Several middle-ground positions:

- **Surrogate manipulation.** Treat
  non-manipulable variables as proxies for
  manipulable mechanisms (perceived race, signaled
  attributes).
- **Hypothetical interventions.** Allow well-defined
  hypothetical interventions even if not physically
  realizable.
- **Mechanism-level analysis.** Decompose effects
  into manipulable mechanism components.
- **Restricted counterfactuals.** Define
  counterfactuals only at the mechanism level, not
  at the level of inherent attributes.

The right resolution remains contested.

## Implications for AI

- **Counterfactual fairness.** Whether to evaluate
  counterfactuals across protected attributes
  hangs on this debate (Kasirzadeh-Smart 2021
  argues against under Holland-style constraints).
- **Causal explanation.** What features can be
  legitimate subjects of causal explanation.
- **Algorithmic recourse.** Whether
  recommendations to change immutable attributes
  even make sense.

## Status

Long-standing methodological debate. No consensus
resolution. Live concern in fairness and explanation
work.
