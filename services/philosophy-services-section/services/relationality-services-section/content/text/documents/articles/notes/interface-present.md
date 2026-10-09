---
title: Interface Output Presentation
keywords:
  - interface
  - measurement
layer: system
status: plan
claims:
  - type: operator
    judgement: "Present : OutPorts × State ⇀ Observables derived from recognitions/sections"
depends-on:
  - system/structure/interface-port
  - math/structure/observable-carrier
  - math/structure/measure-carrier
  - math/structure/measurement-kernel
description: that determines which observables or metrics may be presented at each output port and how they are derived from internal recognitions and sections.
---
# Interface Output Presentation

## Statement

There exists a relation/operator

```text
Present : OutPorts × State ⇀ Observables
```

that determines which observables or metrics may be presented at each output
port and how they are derived from internal recognitions and sections.

## Definition by acts

- Uses measurement stack acts to derive observables/metrics from recognitions
  and sheaf sections.
- Constrains exposure per `OutPorts` definitions.

## Uniqueness

Given the earned measurement stack and port carriers, `Present` is fixed up to
nucleus equivalence.
