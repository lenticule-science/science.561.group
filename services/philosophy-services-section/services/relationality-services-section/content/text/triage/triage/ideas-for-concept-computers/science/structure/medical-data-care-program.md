---
title: Medical Data and Care Program
kind: structure
layer: program
status: someday
derived_from:
- computer/structure/computer-kernel
uses:
- system/structure/recognition-carrier
- system/structure/trace-carrier
produces: []
---
# Medical Data and Care Program

This program models medical data and care pathways as recognitions so clinical
work is traceable and aligned with policy and measurement.

## Behaviour

- Represent patients, encounters, observations, orders, and care plans as
  recognitions with provenance and consent/policy bindings.
- Link data to instruments, providers, and timelines; keep units and coding
  schemes explicit.
- Measure outcomes, adherence, and safety signals.

## Intended operators

- Ingest clinical data with validation and policy checks.
- Plan and update care pathways; track outcomes and adverse events.
- Export auditable slices for research or coordination while preserving
  provenance and policy constraints.

## Proof
- Derived from: [Computer Kernel](../../../computer/structure/computer-kernel.md).
- Shows that: this program instantiates the computer kernel to realise the described behaviour without extending machine semantics.
