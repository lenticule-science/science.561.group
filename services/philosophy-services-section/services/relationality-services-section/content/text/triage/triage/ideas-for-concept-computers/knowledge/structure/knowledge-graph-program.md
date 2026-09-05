---
title: Knowledge Graph Program
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

This program treats knowledge graphs as recognitions so ontology, provenance,
and measurement stay aligned with the relational calculus.

## Behaviour

- Represent entities, relations, and statements as recognitions with explicit
  provenance and policy bindings.
- Support typed schemas and alignment with external vocabularies without
  breaking the earned relational semantics.
- Measure coverage, consistency, and change over time.

## Intended operators

- Ingest and align external graphs into recognition carriers.
- Query, merge, and diff slices with traceable results.
- Enforce schema/policy constraints and surface inconsistencies for repair.

## Proof
- Derived from: [Computer Kernel](../../../computer/structure/computer-kernel.md).
- Shows that: this program instantiates the computer kernel to realise the described behaviour without extending machine semantics.
