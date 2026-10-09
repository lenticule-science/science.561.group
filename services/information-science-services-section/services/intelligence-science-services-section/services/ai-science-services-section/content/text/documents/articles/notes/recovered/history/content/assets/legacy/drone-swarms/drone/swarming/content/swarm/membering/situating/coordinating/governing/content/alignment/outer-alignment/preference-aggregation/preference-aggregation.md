---
type: morphism
class: operator
status: stable
depends-on:
  - ../objects/base-objective.md
see-also:
  - teaching/explanations/outer-alignment.md
  - ../../reinforcement-learning/concepts/rlhf.md
references:
  - references/ngo-alignment2022.md
---

# Preference aggregation

**Preference aggregation** is the operation of combining preferences from multiple individuals (or multiple judgments from one individual under different framings) into a single objective that the trained model can be optimized against.

## Why aggregation is required

Modern alignment via RLHF or constitutional methods rests on preference data: pairwise comparisons, ratings, principle-violation judgments.
The data come from many sources.
To produce a single [base objective](../objects/base-objective.md) the training process optimizes against, the per-source preferences must be aggregated.

## Standard aggregation procedures

**Bradley–Terry maximum-likelihood**, the implicit aggregation in standard RLHF: fit a single reward model whose differences explain the empirical preference frequencies under the Bradley–Terry model.
Treats every preference equally, conflating different raters.

**Weighted aggregation.** Reweight per-rater contributions by estimated rater reliability.
Reduces noise from low-quality annotators; assumes the reliability estimate itself is reliable.

**Majority voting.** For each pair $(y, y')$, take the modal preference among raters.
Robust to individual noise; loses information about minority but principled disagreements.

**Ranked aggregation** (Borda, Schulze, Kemeny).
Treats per-rater input as a ranking and applies a social-choice rule.
Less common in practice; cleaner theoretical properties.

**Constitutional aggregation.** Replace human raters with an AI model conditioned on written principles.
The aggregation is now a function of the principles and the conditioning model, with no direct human-preference input at the comparison stage.

## Why no aggregation procedure is principled

**Arrow's impossibility theorem** (1950) and its successors: no aggregation rule satisfying a small set of natural conditions (Pareto, IIA, non-dictatorship, universal domain) exists for three or more options.
Preference aggregation is therefore *necessarily* ad hoc — every choice violates some natural axiom.

The implication for alignment: there is no neutral way to combine disagreeing preferences into a single objective.
Choice of aggregation procedure is itself an ethical/political choice with no purely technical resolution.

**Within-rater inconsistency.** Even a single rater's preferences are typically inconsistent across framings, time, and context.
Aggregating across the same rater's multiple judgments faces the same Arrow-style obstructions as aggregating across raters.

**Population shift.** The rater population changes over time and between training rounds.
The aggregated $L_{\text{base}}$ shifts correspondingly; what the model is being aligned *to* is itself a moving target.

## Implications

The standard RLHF pipeline obscures these problems by treating preferences as if there were a single coherent underlying utility function being noisily sampled.
Under that model, more data converges to the truth.
Under a more realistic model — preferences as individual positions in a non-aggregable space — more data does not converge to anything in particular; it produces an aggregation-procedure-dependent average.

This is one of the structural reasons that "the model has been RLHF-trained on human preferences" is a much weaker alignment claim than it sounds.
The model has been trained on a *particular aggregation* of *some* preferences from *some* raters at *some* time.
The relationship between this and "what humans want" is mediated by many ad hoc choices.

The [why-rlhf-is-not-alignment](teaching/explanations/why-rlhf-is-not-alignment.md) narrative develops this point.
