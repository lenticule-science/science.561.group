---
type: definition
class: adversarial-filter-witness
status: draft
depends-on: [witness, bilattice-network-sheaf-consensus]
see-also: [six-way-intersection-composition]
title: Byzantine-resilience-witness
description: The substrate-cell shape recording that an observation passed the W-MSR Byzantine consensus filter with the polity's $(2F+1)$-robust graph condition.
---

# Byzantine-resilience-witness

The substrate-cell shape recording that an observation **passed the W-MSR Byzantine consensus filter** with the polity's $(2F+1)$-robust graph condition.
Required as part of the $S_A$ (adversarial-filter) cobordism in [six-way-intersection-composition](../six-way-intersection-composition/six-way-intersection-composition.md).

## Distinguishing predication-shape

```yaml
type: byzantine-resilience-witness
slug: <observation-id>--byzantine-filter
observation-id: <observation-id>
participants-considered: [<drone-record-slug>, ...]
F: <int>                              # number of Byzantine faults the filter tolerates
graph-robustness-class: <int>          # the (2F+1)-robust graph property certifying this F
filter-output-value: <bilattice-value>
filter-trim-low: <int>                # number of low values trimmed
filter-trim-high: <int>               # number of high values trimmed
intrusion-detection-flag: false | inconsistency-detected
intrusion-detection-source: <bilattice-network-sheaf-consensus-cell>
```

Per the [theory-gap question §"In federation-resilience-and-degradation"](../../../../../../../../../tools/platform/pyfars/questions/predicated-drone-swarm-theory-as-theory-gap.md), the adversarial-filter is a substrate-realization of LeBlanc–Zhang–Sundaram–Koutsoukos W-MSR Byzantine consensus.
The `F` parameter is the number of Byzantine faults the filter tolerates; the graph-robustness condition $(2F+1)$-robust must hold for the filter's correctness.

The `intrusion-detection-flag` reads from the bilattice-network-sheaf-consensus level — when the consensus produces a $\top$-cell (paraconsistent inconsistency), an intrusion is detected and surfaces as a witness with `intrusion-detection-flag: inconsistency-detected`.

## Step-induction role

Without byzantine-resilience-witness cells the polity cannot certify that observations passed the adversarial-filter step — the [six-way-intersection-composition](../six-way-intersection-composition/six-way-intersection-composition.md)'s $S_A$ cobordism has no witness on its boundary.
With them, the composition's adversarial-resilience is auditable per-observation.

## Position

Byzantine-resilience-witness is the **boundary witness** of $S_A$ in `Cob_settling`.
Its presence in the witness chain is required for the composite cobordism $S_R \circ S_X \circ S_A \circ S_C \circ S_P \circ S_L$ to be certifiable when the deployment includes the adversarial axis.

## Open

- The relationship between the W-MSR filter and the bilattice's $\top$-firings ($H¹_χ−$).
  The intrusion-detection-flag bridges these but the algebraic relationship deserves explicit treatment in the [bilattice-network-sheaf-consensus theorem](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/bilattice-network-sheaf-consensus.md)'s exposition.
- GNSS-spoofing-resilient localization is a separate Byzantine resilience axis (positional rather than observational); whether it shares the same witness or has a `byzantine-positional-resilience-witness` is an authoring question.
