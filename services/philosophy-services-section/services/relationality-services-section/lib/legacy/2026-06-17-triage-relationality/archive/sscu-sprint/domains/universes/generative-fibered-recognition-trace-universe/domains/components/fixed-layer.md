---

title: "Fixed Layer"
  - "Fixed Layer"
  - "fixed layer"
date-created: 2025-12-26
introduces: concept
tags: []
---

## Concrete example first

Take $H_t=\{\bot<m<\top\}$, with stabilizer sending $m\mapsto\top$, and drift sending $m\mapsto\top$ while fixing $\bot,\top$.

Then:

- $m$ is not fixed by either map,
- $\bot$ and $\top$ are fixed by both.

So the stable-at-trace subset is $H_t^*=\{\bot,\top\}$.

## Formal definition

The **fixed layer** $H^*$ is assembled from fiberwise fixed sets
$$
H_t^*=\{a\in H_t\mid \sigma_t(a)=a=\Delta_t(a)\}
$$
across all traces $t$.

When reindexing preserves [fixed points](../../../../concepts/fixed-point/index.md), these $H_t^*$ form a subsheaf $H^*\subseteq H$. This is the dynamically coherent layer of recognitions in GFRTU.

## Why it matters in GFRTU

- It isolates recognitions stable under both consolidation and evolution.
- It provides the base for the stability locale and defect analysis.
- It is the canonical "reliable core" used by higher constructions.
