---
type: theorem
class: contemporary
status: informal
depends-on:
  - ../morphisms/activation-patching.md
  - ../morphisms/ablation.md
  - ../morphisms/circuit-tracing.md
see-also:
  - linear-probe-correlation-vs-causation.md
references: []
title: Attribution faithfulness bound
description: Attribution methods — activation patching, ablation, gradient-based attribution, integrated gradients, attention-based attribution, ACDC, SAE-feature attribution — are bounded in faithfulness by their assumptions about feature…
---

# Attribution faithfulness bound

## Statement (informal)

Attribution methods — activation patching, ablation,
gradient-based attribution, integrated gradients,
attention-based attribution, ACDC, SAE-feature attribution —
are bounded in *faithfulness* by their assumptions about
feature independence, additivity, and distribution stability.
When these assumptions are violated, attribution results may
identify components that *correlate* with a behavior without
being *causally* responsible in the way claimed.

## The faithfulness criterion

An attribution method is *faithful* if its output (e.g., "this
component contributes $X$ to the behavior") accurately
describes the network's actual computation. Faithfulness has
multiple operationalizations:

- **Causal faithfulness.** Removing the attributed
  components breaks the behavior; restoring them restores
  it.
- **Reproductive faithfulness.** Running only the attributed
  components reproduces the behavior.
- **Counterfactual faithfulness.** The attribution
  correctly predicts behavior on inputs other than those
  used for attribution.

These are inequivalent; a method may be faithful in one
sense and not another.

## Common failure modes

- **Distribution shift.** Patching or ablation introduces
  out-of-distribution activations downstream; the resulting
  behavior change reflects the distribution shift, not the
  component's role on natural inputs.
- **Compensation.** Multiple components implement redundant
  pathways; ablating one alone shows little effect even
  when the pathway is important. Attribution underestimates
  the pathway's role.
- **Spurious correlation.** A component correlates with a
  behavior on the studied input distribution but doesn't
  cause it; attribution flags the component spuriously.
- **Polysemanticity.** A component participates in multiple
  behaviors; attribution on one behavior may mislead about
  the component's overall function.
- **Path dependence.** Attribution depends on the choice of
  baseline (zero, mean, resample); different baselines
  yield different attributions.
- **Non-additivity.** Attribution methods often assume
  contributions add. When components interact non-linearly,
  the assumption fails and attribution misallocates.

## Why this is informal

The bound is *qualitative*: attribution methods can fail in
each of the listed ways, with no general bound on how much
they fail. A *quantitative* faithfulness bound would have to
specify:

- The attribution method.
- The class of networks.
- The class of behaviors.
- The faithfulness operationalization.

For specific (method, network, behavior) triples, faithfulness
can be measured empirically (e.g., causal scrubbing
quantifies one form of faithfulness). General theorems are
absent.

## The methodological response

The robust response to faithfulness limits:

- **Triangulate.** Use multiple attribution methods; trust
  components flagged by all.
- **Test on held-out inputs.** Faithfulness on the studied
  inputs may not generalize; verify on separate inputs.
- **Causal-scrub** when feasible. The strongest faithfulness
  test for circuit identification.
- **Document assumptions explicitly.** When using a method,
  state the faithfulness operationalization being claimed.

## In the broader interpretability program

The faithfulness bound is the structural reason mechanistic
interpretability progresses by *case studies* with careful
methodology rather than by sweeping automated scans. Each
identified circuit is the result of triangulation across
methods, with explicit faithfulness checks. The field has
internalized that attribution alone is not sufficient
evidence for mechanistic claims.

## Status

Widely accepted methodological principle. Specific
faithfulness measurements are reported per-method and
per-behavior in the literature. A general theory of
attribution faithfulness across methods does not exist.
