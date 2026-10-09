---
title: Reading and Media Queue Program
kind: structure
layer: program
status: someday
uses:
- system/structure/recognition-carrier
- system/structure/trace-carrier
produces: []
derives-from:
  - computer/structure/computer-kernel
description: This program manages reading and media queues as recognitions so consumption and attention are traceable.
---

This program manages reading and media queues as recognitions so consumption and
attention are traceable.

## Behaviour

- Represent items, queues, priorities, and states (to-read, in-progress,
  done) as recognitions with provenance.
- Link items to domains, recommendations, and annotations.
- Measure completion rates, revisit patterns, and attention allocation.

## Intended operators

- Ingest and prioritise items; schedule consumption.
- Annotate and summarise items; feed insights to other programs.
- Review queues and adjust based on measurements and goals.

## Proof
- Derived from: [Computer Kernel](../../../../triage/triage/computer/structure/computer-kernel.md).
- Shows that: this program instantiates the computer kernel to realise the described behaviour without extending machine semantics.
