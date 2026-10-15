---
type: theorem
status: draft
depends-on: [task-cell-system, operations-settling, four-regime-dichotomy, scott-continuous-closure]
title: Regime of a task
description: "Conditional task-saturation bounds with explicit finite carrier, operator and input assumptions."
date-modified: 2026-10-15
---

# Regime of a task

A task's saturation bound depends on the specified relevant carrier, one-step
operator and input schedule. Finiteness and continuity provide conditional
bounds; they are not a classification by task name.

## Finite fixed-input case

Assume the task uses N fixed FOUR-valued cells, a fixed effective inflationary
one-step operator F, and no new external input during saturation. Each strict
increase adds at least one previously absent evidence coordinate, so there
are at most 2N strict increases. Repeated application reaches a fixed point.
This finite-chain argument is a prose derivation, not a newly checked Lean
declaration. Cost also depends on evaluating F and constructing its inputs.

A fixed point may fail the task's goal. The
[completion contract](completion-as-quiescence.md) separately requires target
satisfaction, evidence scope and receiving. A finite lifecycle diagram can
wait indefinitely, retry, or receive late evidence; the number of status
labels is not a termination proof.

## Infinite and open-input cases

For a Scott-continuous operator in the applicable pointed domain, the
fixed-point construction is bounded by ω. An exact ω claim requires an orbit
that does not stabilize at any finite stage. The identity operator on an
infinite carrier is a counterexample to “infinite references imply κ=ω.”

An infinitary antecedent needs its own continuity and ordinal analysis. A
predicate reading every prior attempt over a currently finite history is not
automatically a transfinite computation. An open event stream requires its
admissible increments and time indexing to be part of the statement.

## Operator and realized bounds

An operator-level bound quantifies over a named class of inputs. A realized
bound describes one run. A supremum of finite realized bounds can be ω
without any run attaining ω. Keep these quantifiers explicit; do not replace
an upper bound with a claimed exact regime.

## Consumer examples

- A bounded document check can use the finite case once its cells and rules
  are fixed. It still needs the document and actual check result.
- A “last 30 days” advisory search is a bounded source-window question; it is
  not made countably infinite by its English description.
- A recurring review creates successive work occurrences. Its type-level
  feedback cycle is not a cyclic causal order among those occurrences.

## Provenance and remaining proof

The former iff classification and lifecycle-termination corollary are
withdrawn as stated; their source remains in the [prior source revision](https://github.com/lenticule-science/science-services-section/blob/aa46e2f11aff49635bfbd7a381ee4c8b261db63c/services/social-science-services-section/services/sociology-science-services-section/services/work-science-services-section/services/predicated-work-services-section/content/glossary/concepts/regime-of-task.md). Recover and apply
the current mathematical theorem with the actual hypotheses before assigning
a regime. [Work regime](../../../../../content/text/glossary/concepts/work-regime.md)
records the shared distinction between saturation, external increments,
recurrence and completion. No Mission-category theorem is implied here.
