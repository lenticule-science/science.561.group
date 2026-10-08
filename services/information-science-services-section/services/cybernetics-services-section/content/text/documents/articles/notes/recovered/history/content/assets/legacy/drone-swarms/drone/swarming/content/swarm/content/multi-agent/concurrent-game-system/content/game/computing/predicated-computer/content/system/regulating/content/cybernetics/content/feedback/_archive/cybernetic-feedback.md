---
name: cybernetic-feedback
kind: structure
description: "The structure of a closure-rule-system where output becomes input. Negative feedback contracts toward Fix(R); positive feedback expands away from it."
of: closure-rule-system
---

**Cybernetic feedback** is the structure of a closure-rule-system $R$ where the output of each rule-firing becomes input to the next firing.

## Definition

For a closure-rule-system $R$ with state-space $S$ and rule-set $\{r_i : S \to S\}$, feedback is the iteration

$$ s_0 \mapsto r_{i_1}(s_0) \mapsto r_{i_2}(r_{i_1}(s_0)) \mapsto \ldots $$

where each rule's output is the next rule's input.
The sequence may converge to a fixed point of the closure $\mathrm{cl}_R = \bigsqcup_n r^n$ (closure-fixed-point) or diverge.

## Negative vs. positive feedback

| Variant | Behavior | Convergence |
|---|---|---|
| **Negative** | Each iteration reduces deviation from a reference state | Contractive toward $\mathrm{Fix}(R)$; closure stabilizes |
| **Positive** | Each iteration amplifies deviation from a reference state | Expansive away from $\mathrm{Fix}(R)$; closure escapes any bounded sub-space |

Negative feedback is the typical closure-rule-system behavior (the rules' images contract toward their fixed-point set).
Positive feedback is an aperiodic-regime phenomenon where no finite closure-fixed-point can absorb the iteration.

## Sensor / comparator / effector decomposition

A feedback loop decomposes into three sub-rules:

- **Sensor** $\rho : S \to M$ — projects the current state into a measurement space $M$.
- **Comparator** $c : M \to D$ — measures deviation from a reference state.
- **Effector** $e : D \to S$ — produces a state-change to reduce or amplify the deviation.

The composite $e \circ c \circ \rho : S \to S$ is one iteration of the feedback loop.
The closure-rule-system's rule-set includes this composite as one of its rules.

## Nested feedback

A closure-rule-system may carry feedback at multiple time-scales — a fast loop handling immediate perturbations, a slow loop adjusting the fast loop's reference state.
The two-tier structure is the substrate's foundation for [ultrastability](../ultrastability/ultrastability.md) and the substrate-realization of [single-loop-double-loop-learning](library/single-loop-double-loop-learning/single-loop-double-loop-learning.md).
