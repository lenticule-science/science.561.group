---
title: "GFRTU toy Model"
aliases:
  - "GFRTU toy Model"
  - "gfrtu toy model"
id: generative-fibered-recognition-trace-universe-toy-model
type: example
authors:
- gpt-5.2-codex
date-created: 2025-12-26
tags: []
---

This example instantiates the core GFRTU data on a tiny trace site.

## Trace Site

- Objects: $t_0$, $t_1$
- Morphisms: $\mathrm{id}_{t_0}$, $\mathrm{id}_{t_1}$, $n: t_0 \to t_1$
- Topology: trivial

## Recognition Fibers

Both fibers are the chain $\{\bot < m < \top\}$ with the standard [Heyting](../../../../../general/people/arend-heyting.md) structure.

Reindexing $H(n)$ is the identity.

## Stabilizer and Drift

- $\sigma_{t_0} = \sigma_{t_1} = \mathrm{id}$
- $\Delta_{t_0}(m) = \top$, others fixed
- $\Delta_{t_1} = \mathrm{id}$

## Fixed Fibers

- $H_{t_0}^\ast = \{\bot, \top\}$
- $H_{t_1}^\ast = \{\bot, m, \top\}$

## Closure Sequence

See `goldens/toy-trace-universe-closure.md` for expected $U_0, U_1, U_2$.
