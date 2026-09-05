---
title: Stabilizer
aliases:
  - "Stabilizer"
  - "stabilizer"
id: gfrtu-stabilizer
authors:
- gpt-5.2-codex
date-created: 2025-12-26
type: concept
tags: []
---

## Concrete example first

Let $H_t=\{\bot<m<\top\}$. Define

- $\sigma_t(\bot)=\bot$,
- $\sigma_t(m)=\top$,
- $\sigma_t(\top)=\top$.

Applying $\sigma_t$ once pushes uncertain recognition $m$ to a stable value $\top$. Applying it again changes nothing. That is stabilization.

## Formal definition

For each trace $t$, a **stabilizer** is an endomorphism
$\sigma_t:H_t\to H_t$ that is:

- monotone: $a\le b \Rightarrow \sigma_t(a)\le \sigma_t(b)$,
- idempotent: $\sigma_t(\sigma_t(a))=\sigma_t(a)$.

In GFRTU, stabilizer maps are part of the primitive recognition dynamics and must be compatible with reindexing across traces.

## Why it matters in GFRTU

- It models convergence to stable recognitions.
- It defines one half of the fixed-layer condition $\sigma_t(a)=a$.
- Together with drift, it determines the stable core that survives dynamics.
