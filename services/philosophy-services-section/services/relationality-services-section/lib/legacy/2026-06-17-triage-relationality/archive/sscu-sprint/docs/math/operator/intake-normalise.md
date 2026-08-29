---
title: Intake Normalisation
tags:
  - intake
  - normalization
layer: internal-theorem
status: plan
depends-on:
  - math/structure/intake-context
  - acts/equate-contexts
claims:
  - type: operator
    judgement: Normalise : IntakeContexts × Observations ⇀ IntakeContexts × Observations enforces contextual equivalence
introduces: operator
part-of: relational-computer
computer-system-type: primitive
in-domain: science/relationality# Intake Normalisation

## Statement

There exists an operator/relation

```text
Normalise : IntakeContexts × Observations ⇀ IntakeContexts × Observations
```

that enforces earned contextual equivalences on intake data.

## Definition by acts

- [`equate-contexts`](../acts/equate-contexts.md) induces normalization over
  contexts and linked observations, ensuring no intake path produces conflicting
  recognitions.

## Uniqueness

Given `IntakeContexts`, `Observations`, and the equate act, `Normalise` is fixed
up to nucleus equivalence.
