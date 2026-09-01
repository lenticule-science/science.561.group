---
title: Interface Input Validation
tags:
  - interface
  - intake
  - policy
layer: system
status: plan
depends-on:
  - system/structure/interface-port
  - math/structure/intake-payload
  - math/structure/intake-observation
  - math/structure/intake-context
  - math/operator/intake-normalise
  - calculus/structure/policy-regime
claims:
  - type: operator
    judgement: Validate : InPorts × Payload ⇀ Recognitions under earned intake/policy rules# Interface Input Validation

## Statement

There exists a relation/operator

```text
Validate : InPorts × Payload ⇀ Recognitions
```

that determines when an incoming payload at an input port can be turned into
recognised observations or views under the earned intake/policy rules.

## Definition by acts

- Uses intake stack acts to normalise and validate payloads.
- Applies policy acts to check discipline/filter/regime constraints.
- Succeeds only when both intake and policy constraints are satisfied.

## Uniqueness

Given the earned intake and policy stacks and the port carriers, `Validate` is
fixed up to nucleus equivalence.
