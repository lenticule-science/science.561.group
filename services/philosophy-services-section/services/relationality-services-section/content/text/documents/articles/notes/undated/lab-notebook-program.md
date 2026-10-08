---
title: Lab Notebook Program
kind: structure
layer: program
status: someday
uses:
- system/structure/recognition-carrier
- system/structure/trace-carrier
produces: []
derives-from:
  - computer/structure/computer-kernel
description: This program records experiments, observations, and analyses as recognitions so scientific work is traceable and auditable.
---

This program records experiments, observations, and analyses as recognitions so
scientific work is traceable and auditable.

## Behaviour

- Capture experiments, hypotheses, procedures, observations, and analyses as
  recognitions with provenance and measurement channels.
- Link entries to instruments, samples, and versions; keep timelines coherent.
- Measure replication status, data quality, and outcome validity.

## Intended operators

- Log experiments and observations with trace.
- Attach analysis steps and outcomes; flag replication or follow-up needs.
- Export slices for publication or collaboration while preserving provenance.

## Proof
- Derived from: [Computer Kernel](../../../../triage/triage/computer/structure/computer-kernel.md).
- Shows that: this program instantiates the computer kernel to realise the described behaviour without extending machine semantics.
