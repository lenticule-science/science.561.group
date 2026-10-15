---
type: theorem
status: draft
depends-on: [task-cell-system, operations-settling, settling-quiescence, four-regime-dichotomy, quiescence-as-closure-algebra]
title: "Completion, target satisfaction and scoped quiescence"
description: "Task completion is scoped target satisfaction and receiving; saturation alone neither achieves a goal nor excludes future contrary evidence."
date-modified: 2026-10-15
---

# Completion, target satisfaction and scoped quiescence

A task's successful completion requires its goal condition to be satisfied
under its receiving contract. Quiescence alone is insufficient: a fixed point
can leave every goal unknown or contradicted. Closing an attempt after an
error, abandoning a task and fulfilling a Mission are different outcomes.

## Fixed-snapshot model

Let T carry goal cells G_T and a target predicate Accept_T on their valuations.
Fix the admitted evidence window I, relevant carrier and rule set S, and let
q be the result of saturation under S on I. A scoped completion assessment
records:

- the exact T, I, S and resulting q;
- whether q is fixed under the specified saturation operator;
- whether Accept_T(q restricted to G_T) holds;
- the required artifact/effect and the receiving judgment.

The acceptance predicate must say whether positive-only evidence is required,
how contradictions are handled and what evidence discharges each goal. It is
not supplied by a generic `done` status or by knowledge-order growth alone.
An explicit rule may accept a different target, but it must not silently read
⊤ as unopposed support.

## What quiescence establishes

For a fixed operator F, F(q)=q establishes saturation of that input. Permanent
stability under an external stream requires a further preservation condition:
every admissible future increment and subsequent closure must preserve the
accepted goal projection. Without that condition, the assessment is scoped
to I and can be challenged by later evidence.

Counterexample to the previous sketch: at a receiving time one goal is t and
no negative report is present. A later negative report moves it to ⊤.
Monotonicity holds, but the earlier claim of equality at all future times is
false. A consumer must retain both the earlier assessment and the later
challenge, with their scopes and source references.

## Terminal and nonterminal outcomes

- **Fulfilled/completed successfully:** the declared target and receiving
  conditions hold in the assessed scope.
- **Failed:** the attempted work did not establish that target; impossibility
  claims require their own evidence and scope.
- **Abandoned/cancelled/recalled:** the responsible party ends or releases a
  commitment under its governing rights. This does not assert its goal.
- **Suspended/blocked:** execution is deferred; the goal and history remain.

Suspending an evaluator does not delete old activation evidence or stop other
producers from adding evidence. Admission must consult an explicit current
policy/context. Reasserting an already-positive cell is not a universal
resume mechanism, and the duration of a pause is not a closure ordinal.
Mission recall and conditional executor abandonment follow the commission's
own rules, rather than a generic task status transition.

## Receiving cases

Check a saturated-but-unsatisfied task; a target with contradictory evidence;
a successful output awaiting its required receiver; a failed attempt whose
error was recorded; an authorized recall; an interrupted run; and a later
challenge to a previously accepted result. For each, preserve the goal,
attempt outcome, current commitment state and source evidence separately.

## Proof status and provenance

This replaces the previous theorem sketch's unsupported implication from
“no contrary evidence now” to “stable for all future time.” The old statement
remains in the [prior source revision](https://github.com/lenticule-science/science-services-section/blob/aa46e2f11aff49635bfbd7a381ee4c8b261db63c/services/social-science-services-section/services/sociology-science-services-section/services/work-science-services-section/services/predicated-work-services-section/content/glossary/concepts/completion-as-quiescence.md). The construction above is a proposed scoped work
contract. Finite-state saturation bounds are stated in
[Work regime](../../../../../content/text/glossary/concepts/work-regime.md);
they do not prove goal achievement or operational receiving. No new Lean
completion theorem or deployed evaluator is certified by this document.
