---
title: Relational Activity Streams Program
kind: structure
layer: program
status: someday
uses:
- system/structure/recognition-carrier
- system/structure/trace-carrier
produces: []
derives-from:
  - computer/structure/computer-kernel
description: This program expresses activity streams as recognitions so events, actors, and objects are traceable in the relational fabric.
---

This program expresses activity streams as recognitions so events, actors, and
objects are traceable in the relational fabric.

## Behaviour

- Represent activities, actors, objects, and contexts as recognitions with
  provenance.
- Map streams to domains while respecting policy and privacy constraints.
- Measure activity volume, latency, and propagation.

## Intended operators

- Ingest and normalise activity events.
- Project streams into domain-specific views with trace.
- Analyse activity patterns and drive notifications or audits.

## Proof
- Derived from: [Computer Kernel](../../../../triage/triage/computer/structure/computer-kernel.md).
- Shows that: this program instantiates the computer kernel to realise the described behaviour without extending machine semantics.
