---
title: RDF and OWL Alignment Program
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

This program aligns RDF/OWL knowledge with the relational calculus so external
graphs become earned recognitions.

## Behaviour

- Represent RDF triples, OWL axioms, and vocabularies as recognitions with
  provenance.
- Map external ontologies into earned schemas without breaking invariants.
- Measure alignment quality, coverage, and consistency.

## Intended operators

- Ingest RDF/OWL sources into recognition carriers.
- Align or map vocabularies; surface conflicts for resolution.
- Export aligned slices for use in other programs.

## Proof
- Derived from: [Computer Kernel](../../../computer/structure/computer-kernel.md).
- Shows that: this program instantiates the computer kernel to realise the described behaviour without extending machine semantics.
