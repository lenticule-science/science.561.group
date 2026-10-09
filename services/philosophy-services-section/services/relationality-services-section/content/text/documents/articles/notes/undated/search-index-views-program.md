---
title: Search Index and Views Program
kind: structure
layer: program
status: someday
uses:
- system/structure/recognition-carrier
- system/structure/trace-carrier
produces: []
derives-from:
  - computer/structure/computer-kernel
description: This program expresses search indexes and views as recognitions so querying is traceable and honest to the underlying graph.
---

This program expresses search indexes and views as recognitions so querying is
traceable and honest to the underlying graph.

## Behaviour

- Represent indexes, queries, and view definitions as recognitions with
  provenance.
- Bind indexes to underlying recognitions; avoid denormalised hidden stores.
- Measure recall, precision, latency, and freshness.

## Intended operators

- Build and update indexes with trace.
- Serve queries/views with provenance; surface what slice was searched.
- Audit search quality and tune indexing strategies.

## Proof
- Derived from: [Computer Kernel](../../../../triage/triage/computer/structure/computer-kernel.md).
- Shows that: this program instantiates the computer kernel to realise the described behaviour without extending machine semantics.
