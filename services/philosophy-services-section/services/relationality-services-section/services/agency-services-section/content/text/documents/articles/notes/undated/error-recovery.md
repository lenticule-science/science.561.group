---
type: morphism
class: contemporary
status: active
depends-on:
  - tool-invocation.md
  - ../objects/tool-result.md
see-also:
  - tool-composition.md
  - ../theorems/tool-error-amplification.md
references: []
title: Error recovery
description: "Error recovery is the morphism that handles tool- call failures: retry, fallback, replanning, or graceful termination."
---

# Error recovery

**Error recovery** is the morphism that handles tool- call failures: retry, fallback, replanning, or graceful termination.
Without it, error rates compound per [tool-error-amplification](tool-error-amplification.md).

## Failure types

Different failures call for different responses:

- **Transient.** Network blip, rate-limit, timeout.
  Often retryable.
- **Argument errors.** Invalid arguments.
  Retry with corrected arguments.
- **Authorization errors.** Missing permissions.
  Cannot retry; need higher-level handling.
- **Permanent errors.** Tool genuinely cannot fulfill request.
  Need fallback or replan.
- **Semantic errors.** Tool succeeded but result is wrong / unhelpful.
  Need different approach.

Misclassifying failure type produces poor recovery.

## Recovery strategies

- **Retry.** Same call, perhaps with backoff.
  Suits transient failures.
- **Retry with modification.** Adjusted arguments based on error message.
- **Fallback tool.** Different tool that achieves same goal.
- **Replan.** Higher-level reasoning to find different approach.
- **Decompose.** Break failed action into smaller pieces.
- **Ask user.** Escalate to human when agent stuck.
- **Abandon.** Give up gracefully; report failure.

Production agents combine these.

## Retry policies

Standard patterns:

- **Fixed retries** (e.g., 3 attempts) with delay.
- **Exponential backoff** for rate-limited APIs.
- **Idempotency keys** to safely retry stateful tools.
- **Circuit breakers** to avoid hammering broken tools.

These are ordinary distributed-systems patterns applied to agent loops.

## LLM-specific recovery

Recovery in LLM agents uses model capabilities:

- **Reasoning about errors.** Model interprets error message and decides response.
- **Argument correction.** Model regenerates arguments with error context.
- **Strategy switch.** Model recognizes a strategy isn't working and tries different approach.
- **Self-critique.** Model reviews its own actions to diagnose failures.

These work imperfectly; agents often fail to recover when the failure mode requires capability they lack.

## Recovery failure modes

- **Loop.** Repeated retries with same arguments.
- **Drift.** Recovery moves the agent off-task.
- **Cascade.** Recovery action causes new errors.
- **Silent failure.** Agent reports success after unrecovered failure.
- **Premature abandonment.** Agent gives up too quickly.

Diagnostics for these are essential in production.

## In contemporary AI

- **Framework support.** LangGraph, AutoGen, etc. provide retry primitives.
- **Reflection patterns.** "Reflexion" (Shinn et al.
  2023) adds explicit error analysis.
- **Test-time supervision.** Some systems use a separate "supervisor" agent to monitor and recover.

## Bounds

Recovery has limits:

- **Cannot fix capability gaps.** If task is beyond agent capability, recovery doesn't help.
- **Cannot fix fundamental tool errors.** Broken tool isn't fixed by retry.
- **Cost.** Each recovery adds latency and tokens.
- **Reliability degradation.** Recovery itself can fail; recursion bounds needed.

## Status

Standard concept and practice.
Quality of error recovery is a major differentiator between toy and production agentic systems.
Active research on more robust recovery patterns.
