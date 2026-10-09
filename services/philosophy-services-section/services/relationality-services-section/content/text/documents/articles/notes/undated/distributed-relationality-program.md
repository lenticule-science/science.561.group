---
title: Distributed Relationality Program
kind: structure
layer: program
status: someday
uses:
- system/structure/recognition-carrier
- system/structure/trace-carrier
produces: []
derives-from:
  - computer/structure/computer-kernel
description: This program explains how multiple installations share one relational universe rather than diverging graphs.
---

This program explains how multiple installations share one relational universe
rather than diverging graphs. Recognitions are content-addressed; identical
content under the earned calculus yields the same ID everywhere.

## Behaviour

- Treat each installation as a partial cache of the canonical relational space,
  with local annotations (measurement, policy, runbook history).
- Synchronise by exchanging recognition IDs and neighbourhoods instead of
  reconciling separate ontologies.
- Keep conflicts in annotations (measurements, policies), not in the
  recognitions themselves.

## Intended operators

- Pull/push slices of recognitions by ID/hash with provenance and trace.
- Publish recognitions by hashing canonical content and optionally anchoring
  hashes to external logs.
- Exchange installation stances (accept/reject/quarantine) as recognitions when
  installations meet.

## Proof
- Derived from: [Computer Kernel](../../../../triage/triage/computer/structure/computer-kernel.md).
- Shows that: this program instantiates the computer kernel to realise the described behaviour without extending machine semantics.
