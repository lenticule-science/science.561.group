---
title: Converging Baseline
act: BaselineConvergence
index: 43
slug: baseline-convergence
top: ReflexStepIterate
bottom: Nothing
summary: >-
  To see whether an iteration collapses toward pure absence, we compare it
  against the void; this comparison defines baseline convergence.
strata:
  - trace
phase: free
keywords:
  - act
---
# Converging Baseline

## Interpretation

To see whether an iteration collapses toward pure absence, we compare it against the void; this comparison defines baseline convergence.

The composition `(ReflexStepIterate Nothing)` runs the iterated step against *Nothing*.  If the result agrees with the baseline, we have convergence, hence the name *Baseline Convergence*.


{{ act_info(page.meta) }}

{{ act_nav(page.meta) }}
