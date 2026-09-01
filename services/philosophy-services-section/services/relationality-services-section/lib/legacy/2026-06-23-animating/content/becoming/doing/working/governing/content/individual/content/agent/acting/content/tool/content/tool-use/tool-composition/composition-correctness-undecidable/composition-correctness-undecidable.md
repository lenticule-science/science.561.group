---
type: theorem
class: informal
status: active
depends-on:
  - ../morphisms/tool-composition.md
see-also:
  - ../objects/action-trace.md
references: []
---

# Composition correctness undecidable

**Statement (informal).** Verifying that an arbitrary tool-call chain achieves a stated goal is undecidable in general.
Static analysis can verify specific structured cases; full correctness requires execution and observation.

## Why it's undecidable

Tool composition is general computation:

- Tool calls can be conditional on arbitrary results.
- Loops over tool calls express arbitrary algorithms.
- Tool semantics include arbitrary external systems.

Verifying a goal is achieved by composition reduces to verifying program correctness in the full programming- language sense — undecidable per Rice's theorem and the Halting Problem.

This isn't a deep result; it's the application of classical undecidability to the tool-composition setting.

## What can be verified

Despite the general undecidability:

- **Type-correctness.** That outputs of one tool match input types of next.
  Static.
- **Schema-conformance.** That all calls match their schemas.
  Static.
- **Termination of bounded loops.** When loop bounds are static.
- **Specific structured properties.** Idempotency, monotonicity in restricted settings.
- **Pure functional chains.** Compositions of pure functions admit equational reasoning.

These are useful but don't cover general correctness.

## What cannot be verified statically

- **Goal achievement.** Whether the chain produces the intended outcome.
- **Side-effect totality.** Whether all required side effects occurred.
- **External-system consistency.** Whether external state ends up as expected.
- **Reasoning correctness.** Whether agent's intermediate reasoning is sound.

Verification of these requires observation.

## Implications for safety

- **Cannot prove agent correctness in general.** Production deployments rely on testing, monitoring, and bounded-rollback rather than proof.
- **Pre-commit gating** helps for irreversible effects: human approval substitutes for proof.
- **Sandbox testing** approximates verification by observing in safe environment first.
- **Test-and-monitor** is the standard approach.

Agents cannot be proven correct; they can be observed and constrained.

## Implications for design

- **Constrain tool semantics.** Tools with restricted, composable semantics admit more verification.
- **Pure where possible.** Pure (read-only, side-effect-free) tools admit equational reasoning.
- **Side-effect minimization.** Reduce verification surface by reducing side-effecting calls.
- **Effect logging.** Observability substitutes for verifiability.
- **Approval workflows.** Human-in-loop for irreversible chains.

## Connection to other results

- **Rice's theorem.** Non-trivial semantic properties of programs are undecidable; tool composition inherits.
- **Halting problem.** Termination of arbitrary tool loops is undecidable.
- **Frame problem in AI.** What changes when an action happens is generally hard to bound.

## Limits

This is informal:

- The result is qualitative, not quantitative.
- Many *useful* compositions admit verification (just not arbitrary ones).
- Restricted DSLs for tool composition can be verifiable.

## Status

Standard application of undecidability to tool composition.
Justifies the practical reliance on testing and monitoring rather than verification in production agentic systems.
