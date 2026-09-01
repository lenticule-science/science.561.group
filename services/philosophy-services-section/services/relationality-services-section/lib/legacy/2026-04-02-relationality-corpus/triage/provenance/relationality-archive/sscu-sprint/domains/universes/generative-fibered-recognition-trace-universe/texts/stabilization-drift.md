---

name: stabilization-drift
  - "Stabilization and Drift"
date-created: 2025-12-26
tags: []
teaches:
  - "Stabilization and Drift"
---

## Concrete example first

In a fiber $H_t=\{\bot<m<\top\}$:

- stabilization $\sigma_t$ sends $m\mapsto\top$,
- drift $\Delta_t$ also sends $m\mapsto\top$,
- both keep $\bot$ and $\top$ fixed.

Then only $\bot$ and $\top$ survive both dynamics. That surviving set is $H_t^*$.

## Formal lesson content

For each trace $t$:

- $\sigma_t:H_t\to H_t$ is monotone and idempotent,
- $\Delta_t:H_t\to H_t$ is monotone,
- $\sigma_t\circ\Delta_t=\Delta_t\circ\sigma_t$.

The fixed fiber is
$$
H_t^*=\{a\in H_t\mid \sigma_t(a)=a=\Delta_t(a)\}.
$$
Across traces, these fixed fibers must respect reindexing so they assemble into a subsheaf $H^*$.

## Why this lesson matters

GFRTU is not only about local logic; it is about dynamic coherence. Stabilization and drift tell you which recognitions persist under repeated consolidation and evolution.

## Checks you should run

- Verify monotonicity of both maps.
- Verify idempotence of $\sigma_t$.
- Verify commutation between $\sigma_t$ and $\Delta_t$.
- Verify reindexing preserves [fixed points](../../../../teaching/explanations/fixed-point/index.md).
