---
title: Import Linked Data
id: import-linked-data
role: operator
status: someday
derived_from: computer/function/recognition
inputs: []
outputs: []
transformation:
- return
- value
proof_refs: []
---



Ingests external RDF/linked-data (e.g., Wikidata/Wiktionary dumps or HTTP fetch)
into the internal [Linked Data Graph](./linked-data-graph.md).

## Definition
- Inputs: source descriptor (URI, format, retrieval parameters).
- Outputs: [Linked Data Graph](./linked-data-graph.md) or
  [Computer Failure](./computer-failure.md).
- Behaviour: fetch/parse RDF, populate triples/quads with provenance, optional
  mappings; emit failure on parse/integrity/policy errors.

## Invariants
- Integrity: payload hashes must verify; provenance recorded.
- Policy: import complies with source licensing/usage constraints.
- No state mutation on failure.

## Proof
- Derived from: [Computer Recognition](./recognition.md), treating
  RDF payload as recognised data with provenance.
