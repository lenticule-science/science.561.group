---
type: question
status: open
references:
  - references/kiciman-llms-causal2023.md
  - references/pearl-bookofwhy2018.md
title: Can LLMs do causal reasoning?
description: Do large language models actually reason causally, or do they only produce text that describes causal reasoning?
---

# Can LLMs do causal reasoning?

## The question

Do large language models actually *reason* causally,
or do they only produce text that *describes* causal
reasoning? If the former, how — given that they're
trained on observational text data?

## Why it's contested

Two camps:

**Skeptics (often Pearl-aligned).** LLMs are trained
on associational text data; per the causal hierarchy
theorem, this data does not determine interventional
or counterfactual quantities. Therefore LLMs cannot
genuinely reason causally; they at best
*ventriloquize* causal language they've seen.

**Defenders (empirical).** LLMs perform competitively
on causal reasoning benchmarks (Kıcıman et al. 2023
report GPT-4 outperforming dedicated causal
discovery methods on benchmarks). This empirical
evidence suggests *something* is going on, even if
not classical Pearl-style reasoning.

## What we know

- **Benchmarks.** LLMs handle text-described causal
  problems with non-trivial accuracy (commonsense
  causal reasoning, counterfactual evaluation,
  causal discovery from textual descriptions of
  variables).
- **Arithmetic-like causal reasoning.** Models do
  multi-step causal inference patterns visible in
  training data.
- **Failure modes.** Models also fail predictably:
  novel causal structures, real-world interventions
  not covered in training, contradictory or
  counter-stereotypical setups.

## What it might mean

Several interpretations of LLM causal performance:

1. **Pure pattern matching.** Models reproduce
   causal text patterns from training. Performance
   reflects training-distribution coverage, not
   reasoning.
2. **Implicit causal models.** Training-data text
   encodes substantial causal information; models
   internalize implicit causal models from this.
3. **Bootstrapped reasoning.** Models combine
   pattern matching with chain-of-thought to perform
   genuine multi-step reasoning, including causal
   reasoning.
4. **Hybrid.** Models do well on
   training-distribution causal patterns; fail on
   novel ones; reasoning capability is genuine but
   bounded.

Evidence is consistent with hybrid; the precise
boundaries are unclear.

## Why this matters

For practical AI:

- **Use of LLMs in causal-inference pipelines.**
  Whether to trust LLM-suggested causal structures
  depends on this question.
- **Foundation models for science.** Whether models
  can suggest causal hypotheses or only summarize
  existing ones.
- **AI agents acting on the world.** Whether
  LLM-based agents reason correctly about their own
  actions.

For theory:

- **What causal reasoning *is*.** If LLMs do it,
  the prevailing characterization (requires explicit
  SCMs, do-calculus, etc.) may be too narrow.
- **Pearl's hierarchy.** Whether models trained on
  rung-1 data can effectively answer rung-2 and
  rung-3 questions, even partially.

## What might resolve it

- **Better benchmarks.** Targeted at specific
  failure modes; novel causal structures absent from
  training data.
- **Mechanistic interpretability.** Understanding
  whether internal computations resemble causal
  inference algorithms.
- **Hybrid systems.** LLM-causal-tool combinations
  that explicitly augment LLMs with causal
  machinery; comparison to LLM-only baselines.
- **Theory.** Frameworks characterizing what kinds of
  causal reasoning are achievable from pure
  observational training.

## Status

Genuinely open. Active empirical and theoretical
work. Likely to remain disputed at least until
mechanistic understanding catches up with benchmark
performance.
