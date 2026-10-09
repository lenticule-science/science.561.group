---
type: concept
class: agent
status: sketch
depends-on: [runbook, skill-invocation, dispatch, bordini-et-al2007, degiacomo-et-al2000]
see-also: [practical-reasoning-as-runbook-execution, intention-as-scope-bounded-commitment]
title: Plan body as runbook
description: "The platform's reformulation of the plan body construct from BDI agent programming languages (AgentSpeak/Jason, ConGolog at degiacomo-et-al2000): a plan body — a sequence of actions, sub-goal achievements, and belief updates with…"
---

# Plan body as runbook

The platform's reformulation of the *plan body* construct from BDI agent programming languages ([AgentSpeak/Jason](../../bordini-et-al2007/bordini-et-al2007.md), ConGolog at [degiacomo-et-al2000](../degiacomo-et-al2000/degiacomo-et-al2000.md)): a plan body — a sequence of actions, sub-goal achievements, and belief updates with structuring operators (sequence, conditional, loop, non-deterministic choice, concurrency) — is structurally a [runbook](runbook.md), with each plan-body construct realized as a substrate-content runbook structure.

The classical view: a BDI agent's plans have the form `triggering-event : context <- body`, where the body is a sequence of constructs:

- *Action* `a` — perform action `a` on the environment.
- *Belief addition / deletion* `+b` / `-b` — update the belief base with the new fact.
- *Goal addition* `+!g` — add `g` as a new sub-goal that must be achieved by recursively applying applicable plans.
- *Test goal* `?g` — check that `g` holds in the current belief base.
- *Sequencing*, *conditionals*, *loops*, *non-deterministic choice*, *concurrent execution* — structural operators.

Jason's interpreter executes the body step-by-step: each action is dispatched to the environment, each belief update mutates the belief base, each sub-goal triggers recursive plan-applicability computation.
ConGolog's body has analogous constructs with situation-calculus semantics.

The platform's reformulation: each plan-body construct corresponds to a runbook structure.

- **Action** ↔ a [skill invocation](../../skill/skill-invocation/skill-invocation.md).
- **Belief addition / deletion** ↔ a substrate edit operation admitting or retracting a predication on the agent's scope.
- **Goal addition** ↔ a sub-runbook invocation (the platform's runbook composition discipline).
  The sub-runbook's preconditions match the goal; its body achieves the goal through skill invocations.
- **Test goal** ↔ a substrate query against the agent's scope predications.
- **Sequencing / conditional / loop** ↔ runbook structural operators (the runbook-as-substrate-content discipline supplies a structural vocabulary corresponding to ConGolog's program operators).
- **Non-deterministic choice** ↔ dispatch's ranking step: the runbook step is "dispatch the eligible-skill set ranked by match strength," letting the substrate's dispatch operator select.
- **Concurrent execution** ↔ multi-agent runbook composition: parallel plan-body branches become parallel runbook steps assigned to different agents (or to the same agent with tick-time multiplexing).

Three engineering consequences:

- **Plan composition is substrate-level composition.** Sub-goals and concurrent branches in a plan body invoke other runbooks; the runbook-composition discipline supplies the platform analog of plan-body composition.
  Composite plans are first-class runbook entities.
- **Plan-body structure is editable substrate content.** AgentSpeak/Jason plans are loaded into the interpreter at startup; rewriting a plan requires reloading.
  The platform's runbooks are substrate content per [agential self-generation](../../agent/agential-self-generation/agential-self-generation.md), editable through normal substrate operations at runtime.
- **Plan-body witness chain is built in.** Each runbook execution produces witnesses for every step (a skill-invocation witness, a substrate-edit witness, a sub-runbook-invocation witness).
  Auditing an agent's plan execution is a substrate traversal.

The concept is *sketch* status: it names the relationship between BDI plan-body constructs and the platform's runbook discipline so the [upstream-synthesis-bridges](../../upstream-synthesis-bridges/upstream-synthesis-bridges.md) narrative has an atomized referent.
A theorem-level statement — that any AgentSpeak plan body or ConGolog program can be embedded as a substrate-content runbook with a corresponding execution semantics — is left for follow-up work.
