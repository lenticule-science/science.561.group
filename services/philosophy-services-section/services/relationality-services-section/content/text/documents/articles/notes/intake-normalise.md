---
title: Intake Normalisation
keywords:
  - intake
  - normalization
layer: internal-theorem
status: plan
claims:
  - type: operator
    judgement: "Normalise : IntakeContexts × Observations ⇀ IntakeContexts × Observations enforces contextual equivalence"
depends-on:
  - math/structure/intake-context
  - acts/equate-contexts
description: that enforces earned contextual equivalences on intake data.
---
# Intake Normalisation

## Statement

There exists an operator/relation

```text
Normalise : IntakeContexts × Observations ⇀ IntakeContexts × Observations
```

that enforces earned contextual equivalences on intake data.

## Definition by acts

- [`equate-contexts`](./equate-contexts.md) induces normalization over
  contexts and linked observations, ensuring no intake path produces conflicting
  recognitions.

## Uniqueness

Given `IntakeContexts`, `Observations`, and the equate act, `Normalise` is fixed
up to nucleus equivalence.
