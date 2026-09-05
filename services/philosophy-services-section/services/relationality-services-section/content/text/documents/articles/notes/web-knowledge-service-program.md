---
title: Web Interface Knowledge Service Program
id: web-knowledge-service-program
role: structure
status: someday
derived_from:
- computer/type/documentation-interpreter
proof_refs: []
---



A program to wrap the relational computer’s knowledge layer with a web-facing
service for sites and federation (RDF/OWL, ActivityStreams/ActivityPub).

## Separation
- **Knowledge Service**: the internal knowledge graph (recognition carriers +
  edges, policy, topology, measurement) as runbooks.
- **Web Interface**: thin translation layer (HTTP/HTML/JSON-LD/ActivityPub)
  that maps requests/responses to knowledge runbooks without inventing new
  storage.

## Goals
- Use the relational computer as the canonical store for concepts/notes/posts.
- Align internal knowledge with RDF/OWL semantics; align activities with
  ActivityStreams/ActivityPub.
- Keep the web interface minimal: only translate formats, never bypass
  runbooks.

## Internal view
- Knowledge resources: recognition carriers for concepts, notes, bibliographic
  entries, posts, external resources.
- Relations: edge records (cites, references, expands-on), tags/metadata for
  classification.
- Provenance: trace IDs, snapshots, audit logs, policy/topology annotations.

## External correspondences
- RDF/OWL: assign stable IRIs, emit classification/data/object triples from
  recognitions and edges; correspond internal knowledge graph fragments to RDF.
- ActivityStreams/ActivityPub: map posts/actors/activities to internal
  recognitions; mediate inbox/outbox by translating ActivityStreams JSON to/from
  the knowledge graph.

## Realisation path
- Internal theorems: relational knowledge graph; relational activity streams.
- External theorems: RDF/OWL correspondence; ActivityStreams correspondence.
- Specs: knowledge graph simulation; ActivityPub simulation.
- Program runs atop the kernel with runbooks for ingest/export and federation.

## Proof
- Derived from: [Documentation Interpreter](./documentation-interpreter.md).
- Shows that: this program instantiates the documentation interpreter to realise the described behaviour without extending machine semantics.
