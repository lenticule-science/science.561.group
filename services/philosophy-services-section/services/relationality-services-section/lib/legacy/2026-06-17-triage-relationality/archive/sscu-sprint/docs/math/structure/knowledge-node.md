---
title: Knowledge Node
role: structure
derived_from: math/structure/recognition
proof_refs: []
introduces: structure
part-of: relational-computer
computer-system-type: primitive
---



Nodes in the knowledge graph are recognition carriers annotated with role,
justifying acts, payload, and tags/metadata for classification/policy.

## Definition
- Carrier: a [Recognition Carrier](../math/structure/recognition.md)
  instance with additional fields: role (e.g., fact, hypothesis), justifying
  acts, tags, and policy bindings.

## Invariants
- Recognition validity: node must be an earned recognition.
- Policy/tag coherence: tags/policies align with recognition payload.
- Traceability: retains recognition provenance/trace.

## Proof
- Derived from: [Recognition Carrier](../math/structure/recognition.md).
- Shows that: annotating recognitions with role/tags yields knowledge nodes for
  system-level knowledge graphs.
