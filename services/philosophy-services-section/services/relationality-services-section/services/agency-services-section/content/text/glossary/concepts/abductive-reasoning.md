---
type: concept
class: foundational
status: active
depends-on:
  - reasoning.md
see-also:
  - ../morphisms/abduction.md
  - ../theorems/abductive-underdetermination.md
references:
  - references/lipton-inferencetobestexplanation2003.md
title: Abductive reasoning
description: Abductive reasoning infers the best explanation for observed evidence.
---

# Abductive reasoning

**Abductive reasoning** infers the *best explanation*
for observed evidence. Charles Sanders Peirce's term
for the inference: given $E$ observed and hypothesis
$H$ that would explain $E$, infer $H$ as plausibly
true.

Sometimes called *inference to the best explanation*
(Lipton 2003).

## The structure

Pattern:

- Observe evidence $E$.
- Among candidate hypotheses $\{H_1, H_2, \ldots\}$,
  identify which would best explain $E$.
- Infer that hypothesis as the explanation.

Defeasible: a better hypothesis may emerge; new
evidence may force revision.

## Examples

- The grass is wet. Best explanation: it rained.
  (Could also be: sprinkler, dew, etc.)
- Patient has fever, cough, fatigue. Best
  explanation: viral infection. Diagnosis is
  abductive.
- Detective story: the butler did it. Sherlock
  Holmes does abduction.
- Scientific hypothesis: this theory best explains
  the data.
- Code debugging: this bug best explains the
  observed behavior.

Abduction underlies diagnosis, science,
investigation.

## Selection criteria

Multiple hypotheses may fit evidence; selection needs
extra criteria:

- **Parsimony.** Simpler is better (Occam's razor).
- **Probability.** Higher prior plausibility.
- **Explanatory power.** Explains more.
- **Predictive power.** Suggests testable
  predictions.
- **Coherence.** Fits with other accepted
  knowledge.

Different traditions weight these differently. None
provides a formal algorithm; abduction remains
partly art.

## Underdetermination

Per [abductive-underdetermination](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/reasoning/_archive/from-language-models-reasoning/theorems/abductive-underdetermination.md):
finite evidence is consistent with multiple
hypotheses. Abduction always has a *selection*
problem beyond what evidence alone determines.

This is a structural feature of abductive reasoning.

## Abduction in AI

- **Diagnosis systems.** Medical, fault diagnosis.
- **Scientific discovery.** Hypothesis generation
  (e.g., BACON, Eurisko).
- **Logical abduction.** Given $H \to E$ and $E$,
  infer $H$. Computationally hard (NP-hard).
- **Probabilistic abduction.** Bayesian inference;
  posterior over hypotheses.
- **Plan recognition.** Inferring agent's plan from
  observed actions.
- **NLP.** Inferring intended meaning, resolving
  pragmatic implicatures.

## Abduction vs induction

Easily confused:

- **Induction.** Generalize from instances to rule.
  All observed swans white → all swans white.
- **Abduction.** Explain instances by hypothesis.
  Wet grass → it rained.

Both go beyond the data; both defeasible. But
induction generalizes patterns; abduction selects
explanations.

## Abduction and LLMs

LLMs do abduction-like inference:

- Generate plausible explanations for observations.
- Diagnose problems from descriptions.
- Resolve ambiguities by inferring intent.
- Generate hypotheses from data summaries.

Performance varies; quality depends on whether
relevant hypotheses are in distribution.

## Bayesian framing

A Bayesian view of abduction:

$$
P(H | E) \propto P(E | H) \cdot P(H)
$$

The "best" explanation maximizes posterior $P(H |
E)$. Combines prior plausibility with explanatory
fit.

This formalization handles much abductive practice
but doesn't address how to *generate* candidate
hypotheses.

## Limits

- **Hypothesis generation.** Abduction picks among
  candidates; doesn't generate them.
- **Underdetermination.** Multiple hypotheses always
  consistent.
- **Defeasibility.** Conclusions revisable.
- **Computational cost.** Logical abduction NP-hard.
- **Subjective criteria.** "Best" is partly judgment.

## In contemporary AI

- **Diagnosis systems** continue.
- **LLM-based diagnosis.** Active research.
- **Causal inference** uses abductive reasoning
  about causes from effects.
- **Scientific-discovery agents.** Active research
  on AI hypothesis generation.

## Status

Foundational reasoning type. Less formally developed
than deduction; more practically pervasive than its
profile suggests.
