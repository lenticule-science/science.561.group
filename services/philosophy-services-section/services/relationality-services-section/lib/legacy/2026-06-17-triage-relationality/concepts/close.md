---
title: "Close"
kind: term
---
Stabilizing closure. The operator that expands a recognition to the least [Iterate](iterate.md)-stable element containing it. Idempotent, inflationary, monotone.

## What it is

`Close(a)` is the closure operator on the field of recognition, characterized by three axioms:

- **Inflationary**: $a \leq \text{Close}(a)$.
- **Idempotent**: $\text{Close}(\text{Close}(a)) = \text{Close}(a)$.
- **Monotone**: $a \leq b \implies \text{Close}(a) \leq \text{Close}(b)$.

Concretely, Close takes a recognition and stabilizes it — finds the least element in the field that contains it and is also a fixed point of [Iterate](iterate.md). On a powerset, the corresponding map $c: P(E) \to P(E)$ is the standard topological closure.

In the philosophical vocabulary, Close is the formal name for *coherence* — the minimal unit that stabilizes the interplay between including and excluding so that equivalence holds across self-application.

## What it produces

- **Fixed points**: the *reflexive locus* — the closed recognitions, $L_C = \{a \mid \text{Close}(a) = a\}$.
- **The first layer of persistence** — where further self-application yields no change.
- **The ground for its dual**: [Open](open.md).
