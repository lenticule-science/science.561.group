---
type: object
class: classical
status: active
depends-on: []
see-also:
  - tool.md
  - ../theorems/side-effect-irreversibility-bound.md
  - teaching/explanations/tool-use-and-safety.md
references: []
title: Side effect
description: A side effect is a persistent change to environment state caused by a tool invocation.
---

# Side effect

A **side effect** is a persistent change to environment state caused by a tool invocation.
The classical programming-language concept; in tool-use theory it acquires a safety-critical role because LLM agents have limited ability to predict and undo their own side effects.

## Classification

Side effects vary along axes:

- **Locality.** In-process / sandbox-local / application / external.
- **Reversibility.** Easily undone / reversible with effort / irreversible.
- **Visibility.** Visible to agent / hidden from agent.
- **Scope.** Affects user only / affects others / affects systems / affects physical world.
- **Magnitude.** Negligible / minor / significant / catastrophic.

These dimensions interact: irreversible + external + significant = highest-stakes.

## Examples by class

- **Read-only tools.** No side effects.
- **Sandbox file write.** Local, reversible (delete file).
- **Database update.** Application-scoped, reversible with backup.
- **Email send.** External, irreversible.
- **Wire transfer.** External, irreversible, significant.
- **Computer-use action.** Variable; depends on what's clicked.

## Why side effects matter for agents

LLM agents have limitations that interact badly with side effects:

- **Imperfect prediction.** Agent may not foresee what a tool call will do.
- **Limited verification.** Agent often can't verify effect occurred as intended.
- **No undo capacity.** Once an effect happens, the agent typically cannot reverse it.
- **Composition opacity.** Effect chains are hard to reason about end-to-end.
- **Adversarial inputs.** Prompt injection can trigger unintended side effects.

Together these mean agents need *external safety mechanisms* to manage side effects beyond their own reasoning.

## Mitigation patterns

- **Read-only-by-default.** Restrict agents to read-only tools by default; require approval for mutating tools.
- **Pre-commit gating.** Side-effecting actions require explicit user approval before execution.
- **Dry-run capability.** Tools support a "what would happen" mode for preview.
- **Sandbox isolation.** Side effects contained to sandbox; production effects mediated by separate approval pipeline.
- **Effect logging.** All side effects logged for audit and rollback.
- **Idempotency.** Where possible, tools designed to be safely retryable.

Production agentic systems combine multiple patterns.

## Effect classes in schemas

Standard schemas (JSON Schema, OpenAI function-calling) don't natively express effect classes.
Application- level conventions:

- Naming patterns (`get_*` read-only, `create_*` state-mutating, etc.).
- Custom metadata fields in schema descriptions.
- Separate registries for read-only vs mutating tools.
- Wrapper layers that classify and gate.

Lack of standardization is a significant gap.

## Per-tool effect documentation

Useful per-tool documentation:

- What state changes the tool produces.
- Reversibility and how to reverse.
- Visibility (does the agent see the effect?).
- Failure modes (partial effects? inconsistent state?).
- Idempotency.

Most schemas don't include this; production safety benefits from including it.

## Limits

- **Prediction bound.** Side effects of complex tool chains are not fully predictable.
- **Detection bound.** Some side effects (delayed email actions, async background work) aren't visible to the agent.
- **Recovery bound.** Per [side-effect-irreversibility-bound](side-effect-irreversibility-bound.md), some effects cannot be undone post hoc.
- **Composition.** Even reversible effects may compose into irreversible outcomes.

## Status

Standard concept; foundational to safety analysis of agentic systems.
Active development of effect classification standards and gating mechanisms.
