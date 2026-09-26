---
id: closure-system
description: "A ClosureSystem is a System defined by a closure operator — a monotone, idempotent, extensive endomorphism — whose fixed point is the system's settled content."
implements: System
date-created: 2026-03-18
date-modified: 2026-03-19
params:
  carrier: relational-universe
  closure-operator: relational-universe-morphism
output: relational-history-fiber-fixed-layer
ast:
  nuclear-fixed-point-determination:
    - carrier
    - closure-operator:
        - carrier
        - carrier

aliases:
  - Closure System
---

# Closure System

## What this is

A **ClosureSystem** is a System whose content is organized by a closure operator.
The closure operator is the engine: feed it any input, and it produces the closed hull — the smallest closed set containing that input.
The fixed point of the operator is the system's settled content: what the system IS at its limit.

## Projection from mathematics

This concept projects from [closure-operator](./closure-operator.md), which establishes three axioms:

1. **Extensive**: the input is always contained in its closure — $X \subseteq C(X)$
2. **Monotone**: more input produces at least as much closure — $X \subseteq Y \Rightarrow C(X) \subseteq C(Y)$
3. **Idempotent**: closing a closed set changes nothing — $C(C(X)) = C(X)$

These three rules project in cleanly.
A ClosureSystem MUST satisfy all three.
A system that satisfies only some of them is not a ClosureSystem.
It MUST have a fixed point — the smallest set closed under the operator.
It MUST accept any input — extensivity guarantees the input is already in the closure before any rules run.

## Open questions

- Whether every ClosureSystem must have a unique fixed point, or whether multiple fixed points are permitted.
  In lattice-theoretic closure operators, the fixed point is unique; in more general settings it may not be.
