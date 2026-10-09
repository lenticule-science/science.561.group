---
type: morphism
class: contemporary
status: active
depends-on:
  - tool-invocation.md
  - ../objects/action-trace.md
see-also:
  - error-recovery.md
  - ../theorems/tool-error-amplification.md
  - ../theorems/composition-correctness-undecidable.md
references: []
title: Tool composition
description: Tool composition is the morphism that chains tool calls — output of one tool feeding input of the next, or multiple tools combined to achieve outcomes no single tool could.
---

# Tool composition

**Tool composition** is the morphism that chains tool calls — output of one tool feeding input of the next, or multiple tools combined to achieve outcomes no single tool could.

## Sequential composition

The simplest pattern:

- Tool $T_1$ produces output $r_1$.
- Agent uses $r_1$ to construct arguments for tool $T_2$.
- $T_2$ produces $r_2$, etc.

Common in workflows: search → read → summarize → draft → send.

## Parallel composition

When subtasks are independent:

- Multiple tools called in parallel.
- Results aggregated by agent.
- Reduces wall-clock latency.

Modern function-calling APIs support this natively.

## Conditional composition

Tool calls conditional on previous results:

- If $r_1$ indicates X, call $T_2$; else call $T_3$.
- Implements branching logic in the agent's reasoning.

Standard in non-trivial agent workflows.

## Iterative composition

Same tool repeatedly:

- Refining queries until satisfactory result.
- Iterating until convergence.
- Looping until termination condition.

Risk: infinite loops if termination poorly designed.

## Why composition is hard

Composition introduces difficulties beyond single calls:

- **Argument-from-result extraction.** Agent must extract right values from $r_1$ for $T_2$ arguments.
  Often where errors enter.
- **Type alignment.** $r_1$'s shape must match $T_2$'s parameter types.
- **Effect ordering.** Side-effect ordering matters; reordering may produce different outcomes.
- **Error propagation.** Failure of $T_1$ affects whether to call $T_2$.
- **State consistency.** Tools may make assumptions about state changes between calls.

These are ordinary programming concerns now applied to agent reasoning.

## Composition and error compounding

Per [tool-error-amplification](tool-error-amplification.md):

- Single-tool error rate $p$ produces chain error rate roughly $1 - (1 - p)^n$ for $n$ steps.
- Without correction, success rate decays geometrically.
- Long chains require either very low per-step error rates or aggressive [error-recovery](error-recovery.md).

Empirically, chains beyond 5-10 steps without recovery have low success rates.

## Composition correctness

Per [composition-correctness-undecidable](composition-correctness-undecidable.md):

- Verifying that a chain achieves a stated goal is undecidable in general.
- Specific structured cases admit static checking (typed sequences, pure functional chains).
- Production verification typically relies on test-and-monitor rather than static analysis.

## In contemporary AI

Tool composition is what makes agents *interesting*:

- Single-call tool use is essentially RAG.
- Multi-call composition is what enables non-trivial task automation.
- Frameworks (LangGraph, AutoGen) provide composition primitives.

## Composition patterns

- **Sequential pipeline.** Linear $T_1 \to T_2 \to \ldots$.
- **Branching workflow.** Conditional dispatch.
- **Recursive composition.** Agents calling sub- agents.
- **Reactive composition.** Composition driven by intermediate results.
- **Plan-based composition.** Compose per upfront plan.

Different patterns suit different task types.

## Limits

- **Error compounding.** Long chains fail.
- **Verification.** Generally undecidable.
- **State management.** Cross-call state is fragile.
- **Cost.** Compositions multiply latency and cost.

## Status

Foundational morphism for agentic systems.
Active research on more reliable composition (planning-with- verification, structured workflows).
