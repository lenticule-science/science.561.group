---
type: theorem
class: informal
status: active
depends-on:
  - ../morphisms/tool-composition.md
see-also:
  - ../morphisms/error-recovery.md
  - ../objects/action-trace.md
references: []
title: Tool error amplification
description: Statement (informal).
---

# Tool error amplification

**Statement (informal).** In tool-call chains of depth $n$ with per-step success probability $p$, end-to-end success probability is at most $p^n$ absent recovery.
Without correction, success rate decays geometrically with chain length.

## The basic calculation

Assume:

- Chain of $n$ tool calls in sequence.
- Each call succeeds independently with probability $p$.
- A single failure breaks the chain (no recovery).

Then end-to-end success probability is $p^n$.

Concretely:

- $p = 0.99$, $n = 10$: 90% success.
- $p = 0.95$, $n = 10$: 60% success.
- $p = 0.9$, $n = 10$: 35% success.
- $p = 0.95$, $n = 20$: 36% success.
- $p = 0.9$, $n = 20$: 12% success.

For chains beyond ~10 steps, even high per-step reliability produces low end-to-end reliability.

## Why this matters

- **Long chains are inherently brittle.** Chain length is a primary reliability driver.
- **Per-step improvements have superlinear leverage.** Going from 90% to 95% per-step reliability roughly triples 10-step success rate.
- **Recovery is essential at scale.** Without recovery, long-running agents fail too often to be useful.
- **Chain-length minimization** is a design principle.

## With recovery

[Error recovery](error-recovery.md) modifies the calculation:

- If recovery succeeds with probability $r$ per failure: per-step effective success becomes $p + (1 - p) \cdot r$.
- This can substantially improve end-to-end success.
- But recovery itself adds cost, latency, and its own failure modes.

Production agentic systems achieve usable reliability through aggressive recovery, not just high per-step reliability.

## Independence assumption

The calculation assumes independence of failures.
Reality:

- Failures are correlated.
  A model that fails at step $k$ may fail similarly at step $k+1$.
- Correlated failures make end-to-end reliability *worse* than naive product.
- Some failures cascade (one tool failure makes subsequent failures more likely).

The naive bound is therefore *optimistic*.

## Empirical evidence

In production agentic systems:

- Single-tool reliability can be ~95-99%.
- 5-step chains achieve ~70-90% end-to-end.
- 10-step chains drop to ~50-80% without aggressive recovery.
- 20+ step chains often fail more than half the time on first attempt.

Specifics vary by domain and tool quality.

## Implications for design

- **Keep chains short.** Decompose tasks to minimize chain depth.
- **Invest in per-step reliability.** Each percentage point matters.
- **Build robust recovery.** Required for non-trivial tasks.
- **Use checkpoints.** Long workflows should checkpoint state to enable resume rather than restart.
- **Monitor chain depth.** Alert on chains that grow unexpectedly long.

## Limits

This is informal:

- Independence assumption rarely holds.
- "Failure" definition matters (hard error vs semantically wrong result).
- Per-step probability varies across tools and contexts.
- Recovery effectiveness varies widely.

## Status

Foundational empirical observation in production agentic systems.
Quantitatively imprecise but qualitatively robust.
Drives practical design choices around chain length and recovery investment.
