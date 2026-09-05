---
title: Hypertensor Fiber Structure
keywords:
  - hypertensor
  - fiber
layer: internal-theorem
status: plan
depends_on:
  - acts/profile-recognitions
  - acts/flow
  - acts/nucleate
  - acts/commute-flow-and-nucleus
  - acts/flow-composite-profile
  - trace-infrastructure
---

There exists a carrier `Fiber` earned by:

- [Profile Recognitions](./profile-recognitions.md) applied to traced
  contexts from the trace infrastructure;
- flow–nucleus compatibility from
  [Flow](./flow.md), [Nucleate](./nucleate.md),
  [Commute Flow–Nucleus](./commute-flow-and-nucleus.md), and
  [Flow Composite Profile](./flow-composite-profile.md),
  ensuring fibres carry stabilised recognitions and measurements.

Each `Fiber` value is a traced context equipped with its stabilised
recognitions/measurements. Fibres are parameterised by windows defined in
`Hypertensor Window Structure`.
