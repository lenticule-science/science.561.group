---
title: Linked Data Graph
id: linked-data-graph
role: structure
status: someday
proof_refs: []
derives-from: computer/type/computer-recognition
description: Internal representation of external RDF/linked-data sources (e.g., Wikidata, Wiktionary) as computer-layer recognitions.
---



Internal representation of external RDF/linked-data sources (e.g., Wikidata,
Wiktionary) as computer-layer recognitions.

## Definition
- Carrier: refinement of [Computer Recognition](./computer-recognition.md)
  that stores RDF triples/quads plus provenance and mapping to internal ids.
- Fields (computer layer):
  - `graph_id` (UUID)
  - `triples` (list of `{subject, predicate, object, graph?}` with IRIs/literals)
  - `provenance` (source URI, retrieval timestamp, hash)
  - `mappings` (optional): map external ids to internal entity ids
  - `policy` (access/usage constraints)

## Invariants
- Provenance recorded for each import; hashes/digests verify payload integrity.
- Stable identifiers: external IRIs preserved; mappings maintained when used.
- Policy compliance: usage aligns with declared policy/attribution.

## Proof
- Derived from: [Computer Recognition](./computer-recognition.md).
- Shows that: representing linked data as recognitions yields an internal graph
  carrier suitable for import/query/snapshot operations without extending
  kernel semantics.
