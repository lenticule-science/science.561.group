---
source: [agent, runbook, scope, initial-input]
target: [final-state, witness]
name: execute-runbook
description: "The morphism that runs one RunbookRecord: given an invoking agent, a runbook, a scope, and initial input, walk the runbook's steps in order (with branching and dataflow), invoke each step's skill via invoke-skill, accumulate state across steps, handle per-step failures per the runbook's policy, and produce a composed witness chaining the step witnesses."
type: morphism
class: composed-operator
instantiates: [runbook-execution]
depends-on: [runbook-record, agent-record, invoke-skill, fiber, witness]
see-also: [invoke-skill, dispatch, emit-event]
title: execute-runbook
---


The morphism that runs one [`RunbookRecord`](../objects/runbook-record.md): given an invoking agent, a runbook, a scope, and initial input, walk the runbook's steps in order (with branching and dataflow), invoke each step's skill via [`invoke-skill`](invoke-skill.md), accumulate state across steps, handle per-step failures per the runbook's policy, and produce a composed witness chaining the step witnesses.

`execute-runbook` is FARS's realization of AgOP's [runbook-execution](../../../runbook/runbook-execution/runbook-execution.md) at the bilattice value-domain.
The morphism realizes the *composed-procedure* claim: a runbook's execution IS a sequence of skill invocations linked by substrate-declared dataflow, with the substrate's audit and replay properties preserved across the composition.

## Signature

```
execute-runbook(agent, runbook, scope, initial-input) → (final-state, witness)
```

Inputs:

- **`agent`** — reference to the [`AgentRecord`](../objects/agent-record.md) executing the runbook.
- **`runbook`** — reference to the [`RunbookRecord`](../objects/runbook-record.md) to execute.
- **`scope`** — substrate region the execution operates on.
  Inherited by steps unless overridden per-step.
- **`initial-input`** — the runbook's starting state.
  A fiber or note matching the runbook's `state-shape`.
  May be empty.

Outputs:

- **`final-state`** — the runbook's accumulated state after the last step (or after the final non-skipped step, depending on branching).
  Carries the substrate-level outputs the runbook produced.
- **`witness`** — composed [`Witness`](../objects/witness.md) per the runbook's declared `witness-format`: the runbook record's hash, the agent's hash, the scope, the per-step skill-invocation witnesses in order, the final state's hash, the consumed fuel.

## Operational semantics

`execute-runbook` SHALL proceed:

1. **Eligibility check.** Verify the agent's effective capabilities cover the runbook's `required-capabilities`.
  Verify the agent's scope covers the execution's scope.
  Failures produce a `guard`-channel diagnostic; the execution is rejected.

2. **State initialization.** Bind the runbook's `initial-state` (combined with `initial-input`) into a working state fiber.
  Emit a `runbook-started` event on the runbook's primary channel, with payload citing the runbook hash, agent, scope, and initial state hash.

3. **Step iteration.** For each step in the runbook's `steps` list, in order:
   - **Branch evaluation.** If the step has a `branch-condition`, settle it against the working state.
     If the result has $f$- or $\bot$-cells on required predicates, *skip* the step (the substrate records the skip in the step's micro-event); otherwise *run*.
   - **Input binding.** Resolve the step's `input-binding` declarations against the working state, producing the step's input bundle.
     If a binding cannot resolve (a referenced prior-step output is missing), the step's prerequisite is unmet — handle per `failure-policy: abort` (default) unless overridden.
   - **Skill invocation.** Call [`invoke-skill`](invoke-skill.md) with the step's skill, the step's scope (or runbook's), the resolved input.
     Receive `(step-output, step-witness)`.
   - **State update.** Compose the step's output into the working state via [`compose`](compose.md) (pointwise $\odot$).
     Concordant additions sustain; discordant additions produce $\top$-cells the runbook's downstream steps may match against.
   - **Failure handling.** If the step's witness reports failure, dispatch on the step's `failure-policy`: `abort` ends the runbook with the partial witness; `retry` re-runs the step (with policy-bounded retry count); `skip` continues to the next step with the step recorded as skipped; `escalate` emits a `guard`-channel diagnostic and ends with partial witness; `compensate` runs a declared compensation skill before continuing or ending.
   - **Per-step event.** Per the substrate-edit discipline, [`emit-event`](emit-event.md) the step's event on the runbook's primary channel with payload citing the step name, the step's witness, and the post-step state hash.

4. **Resumption support.** If the realization needs to interrupt the execution mid-runbook (session ends, substrate is paused, fuel exhausted), the working state and step-cursor SHALL be persisted in the event log per [event-sourcing](teaching/explanations/event-sourcing.md).
  A subsequent `execute-runbook` invocation reading the event log MAY resume at the last completed step.

5. **Aggregate witness and final emission.** Construct the composed witness chaining all step witnesses, citing the runbook hash, agent, scope, initial state, final state, and per-step outcomes.
  Emit a `runbook-completed` event (or `runbook-aborted` / `runbook-escalated` depending on outcome) with the aggregate witness.

## Normative invariants

- **Step-witnessed.** Each step (run, skipped, or aborted) SHALL produce its own micro-witness.
  The runbook's aggregate witness chains them; an auditor can drill into any step.
- **Dataflow-explicit.** Step inputs SHALL be resolved from the working state via the step's declared `input-binding`.
  Implicit dataflow through realization-side variables is non-conformant.
- **Branch-deterministic.** Branch evaluation SHALL be deterministic given the substrate state and the working state.
  Two executions with byte-identical state and runbook produce byte-identical step sequences.
- **Resumable.** The working state and step-cursor SHALL be persisted in the event log at each step boundary.
  A realization that fails to persist breaks runbook resumability.
- **Composable.** A step whose skill is itself a runbook (composed via the [`SkillRecord`](../objects/skill-record.md) → runbook body chain) SHALL recurse correctly.
  The aggregate witness reflects the recursion.
- **Fuel-bounded.** The runbook's total fuel is bounded by the sum of per-step fuels plus runbook overhead.
  Fuel exhaustion at the runbook level produces a `runbook-aborted` event with the partial state.

## Failure modes

- **Step skill not found.** A step's skill reference doesn't resolve.
  Abort with `runbook-aborted` event citing the missing skill.
- **Input-binding unresolvable.** A step's input binding references a prior step's output that doesn't exist (the prior step was skipped or aborted).
  Per the step's `failure-policy`.
- **Step body failure.** The skill's invocation reports failure.
  Per the step's `failure-policy`.
- **Postcondition failure on step.** The step's skill produces $\top$ on its postconditions.
  Per skill's policy then runbook's policy.
- **Fuel exhaustion mid-runbook.** Working state persisted; runbook ends with `runbook-aborted-fuel`.
  A subsequent invocation may resume.
- **Substrate edit during runbook.** A concurrent edit changes the substrate mid-execution.
  Per [event-sourcing](teaching/explanations/event-sourcing.md), the edit's event is interleaved by append time; subsequent steps see the post-edit state and may produce $\top$-cells if the edit invalidated a precondition.

## Position

`execute-runbook` is what makes *composed work* substrate-content.
Where [`invoke-skill`](invoke-skill.md) handles atomic actions, `execute-runbook` handles structured combinations of actions; the substrate's audit chain spans the whole composition.
Replaying the runbook's witness reproduces every step's substrate effect.

The morphism composes with [`invoke-skill`](invoke-skill.md) (the per-step engine), [`dispatch`](dispatch.md) (which MAY select agents for runbook steps), and [`emit-event`](emit-event.md) (which records step boundaries and final outcomes).
It realizes the agent-side substrate's claim that *complex behavior is composed from simple substrate operations* — composition itself is in the substrate, witnessable and replayable.
