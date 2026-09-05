---
title: Baseline and renewal Mechanics
aliases:
  - Baseline and renewal Mechanics
  - baseline and renewal mechanics
tags:
  - trace
  - baseline
  - persistence
depends-on:
  - baseline-convergence
  - baseline-limit
  - renew-trace
  - restep-trace
form: research
in-domain: science/relationality
readiness: raw
# Theorem (Baseline and Renewal Mechanics)

Baseline convergence isolates the stabilized remainder of a trace, while renewal
acts (re)attach that remainder to future contexts.  This text collects the
results needed whenever we speak about “limits of traces” or “renewed tails.”

## 1. Baseline convergence and limits

**Theorem 1 (Convergence test).**  
Converging Baseline compares iterative
reflex steps against `Nothing`, so it detects exactly when a tail collapses to
the void.  When `BaselineConvergence` holds, every extension of the tail
eventually agrees with the baseline.

*Proof sketch.* `(ReflexStepIterate Nothing)` iterates the reduction trace while
watching the empty witness.  If the iteration stabilizes, the trace remainder is
indistinguishable from the baseline. ∎

**Theorem 2 (Limit extraction).**  
Limiting Baseline applies the convergence act to
Tail Trace, yielding the stabilized remainder `Baseline
Limit`.  The limit is unique up to nucleus collapse and persists under further
tail observations.

*Proof sketch.* `(BaselineConvergence TailTrace)` records that once convergence
is known, watching the tail through it isolates the exact remainder.  Any other
observation factors through this composite, so the limit is canonical. ∎

## 2. Renewal of traces

**Theorem 3 (Renewal loop).**  
Renew Trace,
Restep Trace, and
Iterative Persistence ensure that the
stabilized remainder can re-enter the evaluation trace indefinitely without
changing its baseline limit.

*Proof sketch.* `RenewTrace` rethreads the remainder into the head of the trace.
`RestepTrace` witnesses that after renewal the tail matches the previous limit.
`IterativePersistence` guarantees this behavior persists under further
iterations, so renewal does not disturb the limit. ∎

## 3. Baselines and contexts

**Theorem 4 (Renewed contexts).**  
Extend First Context,
Renew Context, and
Extend Context show that the baseline limit may be
lifted to contexts: the renewed seed can be extended with arbitrary bindings,
and future renewals respect those bindings.

*Proof sketch.* `SeedFirstContext` anchors the baseline remainder.  Applying
`BindTrace` yields `ExtendFirstContext`, and letting that witness
`ContextualizeTrace` gives `RenewContext`.  Finally `ExtendContext` records that
bound variables propagate through the renewed context, so the baseline remainder
is consistent with future extensions. ∎

## Summary

| Feature | Witnessing acts |
| ------- | --------------- |
| Detect convergence | `BaselineConvergence` |
| Limit extraction | `BaselineLimit` |
| Stable renewal | `RenewTrace`, `RestepTrace`, `IterativePersistence` |
| Context transport | `ExtendFirstContext`, `RenewContext`, `ExtendContext` |

Whenever the runtime arguments mention “the baseline tail” or “renewing the
remainder,” they rely on these theorems to guarantee existence, uniqueness, and
contextual compatibility of that limit.
