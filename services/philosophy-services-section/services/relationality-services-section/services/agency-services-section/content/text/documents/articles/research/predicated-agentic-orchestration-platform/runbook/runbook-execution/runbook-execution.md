---
type: morphism
class: composed-operator
realizes: [runbook]
depends-on: [runbook, skill-invocation, predication-settling, increment-sequence]
see-also: [dispatch, witness, session-as-time-bounded-sublocale]
title: Runbook execution
description: The composed operator that executes a runbook — running its declared steps in order, threading state through them, branching on intermediate results, and producing a composed witness entry.
---

# Runbook execution

The composed operator that executes a [runbook](teaching/explanations/runbook.md) — running its declared steps in order, threading state through them, branching on intermediate results, and producing a composed [witness](../../../objects/witness.md) entry.
A runbook execution is structurally a sequence of [skill invocations](../../skill/skill-invocation/skill-invocation.md), each contributing one or more increments to the substrate's [increment sequence](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/increment-sequence.md), advancing the substrate's [predication settling](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-settling.md) by the runbook's full step count.
Formally, given an [agent](teaching/explanations/agent.md), a runbook entity, a scope, and an input bundle:

$$ \mathrm{execute}(\mathrm{agent},\, \mathrm{runbook},\, \mathrm{scope},\, \mathrm{input}) \;\longrightarrow\; (\mathrm{output},\, \mathrm{witness}_\mathrm{rb}) $$

The execution iterates the runbook's step list:

1. For each step $i$, the runbook's step-specification cites a [skill](teaching/explanations/skill.md) entity, a binding from prior outputs to the step's input, and (optionally) a precondition predicate over the runbook's accumulated state.
2. The step's [skill invocation](../../skill/skill-invocation/skill-invocation.md) operator is called with the resolved input; the resulting output is recorded in the runbook's accumulated state.
3. If the step has a precondition that does not hold, the step is skipped (or the runbook branches per its branch declarations).
4. The runbook's witness aggregates the sub-witnesses of each step — typically as an ordered list, with the canonical hash of each step's witness chained.
5. On completion, the runbook's output bundle is whatever the runbook's final step (or its declared output binding) computes; the composed witness is appended to the [event log](../../../objects/event-log.md).

Three engineering properties:

- **Resumable.** Per [session-as-time-bounded-sublocale](../../session/session-as-time-bounded-sublocale/session-as-time-bounded-sublocale.md), a runbook execution interrupted partway through can be resumed by reading the most recent state from the event log and continuing from the next un-executed step.
  The resumability is what makes runbooks safe to interrupt and what lets the [heartbeat](teaching/explanations/heartbeat.md) interleave runbook execution with [tick](teaching/explanations/tick.md) work on other entities.
- **Composable.** A runbook's body may invoke another runbook.
  The platform admits arbitrary composition; the witness chain records the nesting.
  Loops in runbook composition are detected by the runbook execution operator and rejected as ill-formed.
- **Bounded by skill discipline.** Each step is a [skill invocation](../../skill/skill-invocation/skill-invocation.md); the skill's pre/postcondition discipline applies to each step.
  A runbook with a step whose preconditions fail aborts (or branches, depending on declared behavior); the abort is recorded in the witness.

The ergonomics distinguish runbooks from arbitrary scripts: a runbook is *one entity, one canonical hash, one witness chain*.
Per [settlement-determinism](../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/settlement-determinism.md), two replays of the same runbook on the same input produce the same step sequence and the same witness chain (modulo non-deterministic skills, where the entropy source's hash is recorded).
This is the engineering content of "the runbook is the unit of work" — and is what lets governance-level decisions per [governance-as-modal-restriction](../../governance/governance-as-modal-restriction/governance-as-modal-restriction.md) be made about runbook *invocations* (allow this office to run this runbook? require quorum approval before this runbook executes?) rather than about individual skill invocations.
