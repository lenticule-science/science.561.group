---
source: [agent, skill, scope, input]
target: [output, witness]
name: invoke-skill
description: "The morphism that runs one SkillRecord: given an invoking agent, a skill, a scope, and an input bundle, check the skill's preconditions against the substrate, run the skill's body, check postconditions, emit one event on the skill's declared channel, and produce a witness."
type: morphism
class: composed-operator
instantiates: [skill-invocation]
depends-on: [skill-record, agent-record, fiber, witness, validation-as-settlement]
see-also: [execute-runbook, dispatch, apply-edit, emit-event]
title: invoke-skill
---


The morphism that runs one [`SkillRecord`](../objects/skill-record.md): given an invoking agent, a skill, a scope, and an input bundle, check the skill's preconditions against the substrate, run the skill's body, check postconditions, emit one event on the skill's declared channel, and produce a witness.
`invoke-skill` is FARS's realization of AgOP's [skill-invocation](../../../skill/skill-invocation/skill-invocation.md) at the bilattice value-domain.

## Signature

```
invoke-skill(agent, skill, scope, input) → (output, witness)
```

Inputs:

- **`agent`** — reference to the [`AgentRecord`](../objects/agent-record.md) performing the invocation.
- **`skill`** — reference to the [`SkillRecord`](../objects/skill-record.md) to invoke.
- **`scope`** — the substrate region the invocation operates on.
  Typically inherited from the agent's current scope; MAY be narrower for skill-specific scope-bounds.
- **`input`** — input bundle.
  A fiber or note carrying the skill-specific arguments (per the skill's declared input shape).

Outputs:

- **`output`** — the skill's output bundle.
  A fiber or note matching the skill's declared output shape.
- **`witness`** — [`Witness`](../objects/witness.md) recording the invocation: input hashes, skill-record hash, agent-record hash, scope, fired closure-rule sub-witnesses, output hash.
  Per the skill's declared `witness-format`.

## Operational semantics

`invoke-skill` SHALL proceed in five phases:

1. **Eligibility check.** Verify the agent's effective capabilities (its own `skills` list union with its offices' `constructors`) include this skill.
  Verify the agent's `scope` covers the invocation's scope.
  Verify the skill's `required-capabilities` are satisfied by the agent's capability fiber.
  Failures produce a `guard`-channel diagnostic event; the invocation is rejected.

2. **Precondition check.** Per [validation-as-settlement](../../settlement/validation-as-settlement/validation-as-settlement.md), settle the skill's `preconditions` predication-pattern against the substrate state plus the input bundle.
  If the result contains $\top$- or $f$-cells, the precondition fails: emit a `guard`-channel diagnostic naming the violated cells; abort with a witness recording the precondition failure.
  The substrate is unchanged.

3. **Body execution.** Dispatch on the skill's `body` reference:
   - **Closure-rule body**: Invoke [`settle`](settle.md) on the body's [`ClosureRuleRecord`](../objects/closure-rule-record.md), with the substrate state extended by the input.
     Collect the per-rule sub-witnesses.
   - **Tool body**: Invoke the realization's tool implementation.
     Capture the tool's output and any sub-witnesses the tool produces.
   - **Runbook body**: Invoke [`execute-runbook`](execute-runbook.md) on the body's [`RunbookRecord`](../objects/runbook-record.md), with the input bundle as initial state.
   - **Prose body**: Invoke the realization's LLM-flavored interpretation (per the cost-settlement-path: F1 skills run at LLM cost).
     The realization's stepping map MAY use a frontier or smaller model based on declared formality and operational context.

4. **Postcondition check.** Settle the skill's `postconditions` predication-pattern against the substrate state plus the output bundle.
  If the result contains $\top$- or $f$-cells, the postcondition fails: per the skill's `failure-policy`, either (a) the failure is recorded as a witness diagnostic and the invocation is reported as partial-success, (b) the body's effects are rolled back via [retraction](../../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/terms/retraction.md), (c) the failure is escalated.

5. **Witness and emit.** Construct the `Witness` aggregating sub-witnesses from the body execution, with `operator: "invoke-skill"`, `input_hashes` covering agent, skill, scope, and input, `output_hash` covering the output, and the skill's declared witness format.
  [`emit-event`](emit-event.md) one event on the skill's `channel` (or its kind-derived default) with the invocation summary.

## Normative invariants

- **Eligibility-gated.** Invocations from ineligible agents (insufficient capabilities, out-of-scope, missing required-capabilities) SHALL be rejected before precondition checking.
  A FARS realization that admits ineligible invocations and relies on later checks is non-conformant.
- **Pre/postcondition-checked.** Both checks SHALL run; both produce witnessed outcomes.
  A skill whose body succeeds but whose postconditions fail is a partial-success per the skill's `failure-policy` — never a silent success.
- **Witness-emitting.** Every invocation SHALL produce a witness, including rejected and aborted invocations.
  Replay reproduces the invocation (or its rejection) byte-for-byte.
- **Channel-correct.** The emitted event SHALL be on the channel declared by the skill's `kind`/`channel` (or per the skill's explicit `channel` field).
  A query-skill emitting on the mutation channel is non-conformance.
- **Deterministic.** Same `(agent, skill, scope, input, substrate-state)` SHALL produce byte-identical `(output, witness)`.
  Skills with non-deterministic bodies (frontier-model invocations, external API calls) SHALL contain the non-determinism by recording the entropy source's hash in the witness, making the invocation deterministic *relative to* the entropy.

## Failure modes

- **Eligibility failure** (capabilities, scope, requirements).
  Substrate unchanged.
  Diagnostic event on `guard` channel.
- **Precondition failure** ($\top$ or $f$ cells from settling preconditions against substrate + input).
  Substrate unchanged.
  Diagnostic event on `guard` channel naming the violations.
- **Body failure** (closure-rule abortion, tool error, runbook step failure, LLM error).
  Per the skill's `failure-policy`: abort the invocation, retry, or report partial-success.
  The witness records the failure mode.
- **Postcondition failure** ($\top$ or $f$ cells from settling postconditions against substrate + output).
  Per failure-policy: rollback, partial-success, or escalate.
- **Channel-emission failure** (channel not found, shape violation, policy violation per [`emit-event`](emit-event.md)).
  The body's effects MAY have already been applied; the substrate's `guard`-channel diagnostic surfaces the inability to record.
  This is a serious substrate-coherence concern requiring repair.

## Composition with dispatch

Per [`dispatch`](dispatch.md): when a message arrives at the substrate without a designated invoker, dispatch ranks candidates and selects an agent-skill pair; that pair becomes the input to `invoke-skill`.
The composition is:

```
dispatched-pair ← dispatch(message, candidates, rules)
output, witness ← invoke-skill(dispatched-pair.agent, dispatched-pair.skill, message.scope, message.payload)
```

The dispatch's witness chains into `invoke-skill`'s witness; an auditor replaying both reproduces the routing decision and the skill's invocation.

## Position

`invoke-skill` is the agent-side substrate's *primary action operator*.
Every action an agent takes that produces a witnessed outcome flows through `invoke-skill` (directly, or indirectly via [`execute-runbook`](execute-runbook.md) which composes invocations).
The morphism is what makes [`SkillRecord`](../objects/skill-record.md)s operational.
