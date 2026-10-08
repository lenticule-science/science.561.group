---
name: single-loop-double-loop-learning
kind: structure
description: "Argyris-Schön's two-tier feedback. Single-loop: feedback adjusts actions. Double-loop: feedback adjusts the rules that determine actions. Double-loop is feedback whose target is the closure-rule-system's own rules."
of: cybernetic-feedback
---

**Single-loop / double-loop learning** (Argyris-Schön 1978) is the two-tier feedback structure where the outer loop modifies the rules that produce the inner loop's behavior.

## Single-loop

A standard [cybernetic-feedback](../../cybernetic-feedback.md) iteration: the system's actions are adjusted to better achieve a fixed reference state under a fixed rule-set.
The closure-rule-system's rules do not change; only its state moves toward $\mathrm{Fix}(R)$ under iteration.

## Double-loop

Feedback whose target is the closure-rule-system's own rules.
When the inner single-loop fails to achieve the reference state — when iterating the rules produces persistent error — the outer double-loop modifies the rules themselves.

Formally: the system carries two closure-rule-systems:

- $R_{\mathrm{action}}$ with rules $\{r_i\}$ acting on the state-space $S$.
- $R_{\mathrm{meta}}$ with rules $\{m_j\}$ acting on the rule-set $\{r_i\}$ of $R_{\mathrm{action}}$.

Single-loop iteration applies $R_{\mathrm{action}}$ to $S$.
Double-loop iteration applies $R_{\mathrm{meta}}$ to $\{r_i\}$ when single-loop fails its reference.
The fixed point of double-loop iteration is a rule-set whose single-loop closure achieves the desired essential-variable maintenance.

## Connection to ultrastability

Double-loop learning is the substrate-realization of [ultrastability](../../../ultrastability/ultrastability.md) at the rule-modification scale: the outer regulator searches the parameter-space of inner regulators until one with sufficient [requisite-variety](../../../requisite-variety/requisite-variety.md) is found.
The two concepts are isomorphic at the structural level; "double-loop learning" emphasizes the temporal/learning aspect; "ultrastability" emphasizes the regulator-structural aspect.

## Connection to second-order-cybernetics

When the rule-modification is itself observed by the system, the closure-rule-system becomes self-referential — the system carries within itself a representation of its own rule-modifying activity.
This crosses into [second-order-cybernetics](../../../../../../../../commutating/library/aperiodic-nuclear-quartet-category/library/joint-quiescent-corner/library/aperiodic-autopoiesis-cell/library/operational-closure/library/second-order-cybernetics/second-order-cybernetics.md) territory, where the observer is included in the system.
