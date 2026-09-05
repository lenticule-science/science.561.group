---
title: Relational ActivityStreams Correspondence
tags:
  - theorem
  - external
  - activitypub
  - activitystreams
  - knowledge
depends_on:
  - theorem/internal/knowledge-graph
  - specifications/policy
  - specifications/traceability-graph
---
# Theorem (Relational ActivityStreams Correspondence)

The relational knowledge graph and policy/trace infrastructure admit a
translation into ActivityStreams 2.0 / ActivityPub-style activities,
actors, and objects, so that publications and interactions in the
relational computer can be federated without a separate data model.

## Statement

Let:

- `K` be the relational knowledge graph,
- `P` be the set of policy regimes and audit logs governing flows,
- `T` be the trace infrastructure (traces, trace steps, renewal).

Then there exists a mapping from suitable subgraphs of `K` and `T` to
ActivityStreams JSON-LD objects such that:

- Certain TracePoints play the role of Actors (e.g. user accounts,
  domain contexts) with stable IDs and profile attributes.
- Certain knowledge resources (TracePoints with content representing
  posts, pages, notes) play the role of ActivityStreams Objects (Note,
  Article, etc.).
- Trace steps and derived recognitions (witnessed transitions,
  policy decisions, measurement events) play the role of Activities
  (Create, Update, Delete, Follow, Like, etc.), relating Actors and
  Objects via their IDs and content.
- Edges and trace IDs supply the thread/context structure (inReplyTo,
  context, conversation identifiers) needed for ActivityPub threads.

Conversely, ActivityStreams objects satisfying a syntactic/semantic
profile (well-formed IDs, known object types, compatible addressing)
can be reflected into the knowledge graph as:

- TracePoints with content derived from their JSON-LD fields,
- edges representing relationships between actors and objects,
- new traces or trace steps capturing the temporal structure of
  activities.

## Interpretation

Under this theorem, the relational computer does not maintain a
separate ActivityPub-specific store. Instead:

- ActivityPub inbox/outbox handling becomes a matter of:
  - parsing ActivityStreams JSON-LD into recognitions and edges,
  - validating them against policy regimes,
  - recording them as part of the trace and knowledge graph.
- Outbound activities are constructed from existing knowledge
  resources and trace events, then serialised back to ActivityStreams
  JSON-LD for transmission.

This correspondence ensures that the same relational invariants
(traceability, policy, topology, measurement) apply to both internal
knowledge and federated activities, and that web/social protocols are
treated as external views of the underlying relational dynamics.

