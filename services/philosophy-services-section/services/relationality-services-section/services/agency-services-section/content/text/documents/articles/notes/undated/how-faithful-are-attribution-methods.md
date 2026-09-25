---
type: question
status: open
see-also:
  - ../morphisms/activation-patching.md
  - ../morphisms/ablation.md
  - ../theorems/attribution-faithfulness-bound.md
title: How faithful are attribution methods?
description: Attribution methods — activation patching, ablation, gradient-based attribution, ACDC, SAE-feature attribution — identify components or features as "causally responsible" for a behavior.
---

# How faithful are attribution methods?

## The question

Attribution methods — activation patching, ablation,
gradient-based attribution, ACDC, SAE-feature attribution —
identify components or features as "causally responsible"
for a behavior. How accurately do these attributions
describe the network's actual computation? When can we
trust an attribution claim, and when not?

The [attribution-faithfulness-bound](attribution-faithfulness-bound.md)
theorem states that all attribution methods have
faithfulness limits depending on assumptions about
independence, additivity, and distribution stability. The
*open question* is how to measure these faithfulness gaps
and what bounds them.

## What faithfulness means

Multiple operationalizations:

- **Sufficiency.** Running only the attributed components
  reproduces the behavior.
- **Necessity.** Removing the attributed components breaks
  the behavior.
- **Generalization.** The attribution holds across input
  distributions, not just the studied one.
- **Mechanism.** The attributed components actually
  implement the algorithm the attribution suggests.

These criteria are inequivalent and individually
non-trivial to verify.

## Causal scrubbing as a partial answer

*Causal scrubbing* (Chan et al. 2022) gives one strong
faithfulness test: replace all activations *not* in the
hypothesized circuit with random activations from unrelated
inputs; check whether the behavior survives. If yes, the
circuit is faithful in a strong sense.

But causal scrubbing is computationally expensive and not
the standard test. Most published attributions report
weaker tests (single-input patching, single-input ablation),
which are more easily fooled by spurious correlations.

## Empirical findings

- **Attributions agree on prominent components** but
  disagree on details. Layer-level "what matters most" is
  reasonably reproducible across methods; head-level or
  neuron-level attributions vary more.
- **Distribution shift effects are large.** Patching with
  out-of-distribution activations can produce large
  apparent attributions that don't reflect natural-input
  computation.
- **Compensation is real.** Networks routinely have
  redundant pathways; ablation underestimates pathway
  importance.
- **Faithfulness varies by behavior.** Some behaviors have
  clean small-circuit explanations; others are
  irreducibly distributed.

## Methodological responses

Active work on:

- **Attribution method comparison.** Run many methods on
  the same task; trust components flagged by all.
- **Faithfulness benchmarks.** Construct known-circuit toy
  models; test which methods recover the truth.
- **Causal-scrubbing extensions.** More efficient or more
  precise versions of the strong faithfulness test.
- **Calibrated attribution.** Methods that report
  *uncertainty* over attributions, not point estimates.

## Why it matters

Mechanistic-interpretability claims rest on attribution
results. If attributions are unfaithful, the claims are
unsupported. The credibility of:

- Published circuit identifications.
- Alignment claims based on internal-state monitoring.
- Capability evaluations using interpretability tools.
- Safety arguments depending on "we can read what the
  network is doing."

— all depend on the faithfulness of attribution methods.
Open faithfulness questions are open safety questions.

## Status

Open. The faithfulness limits are widely acknowledged;
quantitative measurement is partial. The field is
developing better tests and better methods, but a *general*
theory of attribution faithfulness across methods,
behaviors, and networks is absent.
