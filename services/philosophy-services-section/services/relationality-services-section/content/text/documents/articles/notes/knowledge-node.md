---
title: Knowledge Node
id: knowledge-node
role: structure
status: plan
proof_refs: []
derives-from: math/structure/recognition
description: Nodes in the knowledge graph are recognition carriers annotated with role, justifying acts, payload, and tags/metadata for classification/policy.
---



Nodes in the knowledge graph are recognition carriers annotated with role,
justifying acts, payload, and tags/metadata for classification/policy.

## Definition
- Carrier: a [Recognition Carrier](./recognition.md)
  instance with additional fields: role (e.g., fact, hypothesis), justifying
  acts, tags, and policy bindings.

## Invariants
- Recognition validity: node must be an earned recognition.
- Policy/tag coherence: tags/policies align with recognition payload.
- Traceability: retains recognition provenance/trace.

## Proof
- Derived from: [Recognition Carrier](./recognition.md).
- Shows that: annotating recognitions with role/tags yields knowledge nodes for
  system-level knowledge graphs.
