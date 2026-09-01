---
type: theorem
class: classical
status: established
depends-on:
  - ../objects/confounder.md
  - ../morphisms/backdoor-adjustment.md
see-also: []
references:
  - references/pearl-causality2009.md
---

# Simpson's paradox

## Statement

**Simpson's paradox**: a trend that appears in
subgroups of data can *disappear* or *reverse* when
the subgroups are combined.

The "paradox" is a statistical phenomenon; the
*resolution* is causal — purely statistical reasoning
cannot decide which trend (subgroup or aggregate) to
report. Causal reasoning must.

## Classical example

**Berkeley admissions (1973).** University-wide,
admission rates appeared higher for men than women,
suggesting gender bias.

But disaggregating by department:

- In most departments, women had *higher* admission
  rates than men.
- The aggregate apparent bias was an artifact: women
  applied disproportionately to *more competitive*
  departments.

So:
- **Aggregated:** men admitted more often (apparent
  bias).
- **Within department:** women admitted more often
  (apparent reverse bias).

Both statements are true of the data; they describe
different things.

## The causal resolution

Pearl's account: the question "is admission gender-
biased?" is *causal*, not statistical. To answer it,
we need to know the causal structure:

- If department-of-application is a *mediator* of
  gender effect on admission (gender → department →
  admission), then disaggregating by department
  blocks part of the causal effect — wrong analysis.
- If department-of-application is a *confounder*
  (gender ← department-effect → admission, e.g.,
  gendered preferences from external causes), then
  disaggregating is the right analysis.

Without specifying the causal structure, we cannot
choose between the aggregated and disaggregated
analyses.

## Why this is a theorem

Per Pearl's analysis, Simpson's paradox is *not* a
genuine paradox but a *symptom* of trying to do
causal reasoning without causal tools.

- The "paradox" is statistical: same data, different
  conclusions depending on conditioning.
- The resolution is causal: the right answer depends
  on the causal graph.
- *No purely statistical criterion* picks the right
  conditioning. The graph must be specified.

This is sometimes called the *Sure-Thing Principle
violation*: the principle "if X is preferred under all
subgroups, X is preferred overall" fails statistically
but holds *causally* under proper analysis.

## Implications for AI

- **ML on observational data.** Aggregating vs
  disaggregating training data can flip estimated
  effects; choosing requires causal modeling.
- **A/B test analysis.** Subgroup analyses can
  exhibit Simpson reversals; need causal awareness.
- **Fairness audits.** Per-group fairness statistics
  vs aggregate ones can disagree; the right answer
  depends on causal structure.
- **Confounding diagnosis.** Simpson's paradox is a
  signal of likely confounding worth investigating.

## Variants

- **Lord's paradox.** Statistical-causal mismatch in
  pre-post analyses.
- **Yule-Simpson.** Older formulation by Yule.
- **Berkson's paradox.** Selection-induced
  associations; different mechanism.
- **Simpson-style reversal in regression.** Sign of
  estimated effect can flip when adding predictors.

All have the same underlying lesson: statistical
reasoning alone is insufficient.

## Status

Classical result with clean Pearl-style resolution.
Standard pedagogical content. Important warning for
practitioners.
