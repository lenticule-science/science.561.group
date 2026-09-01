---
title: Web Interface Knowledge Service
status: someday
keywords:
  - specification
  - knowledge
  - web
  - activitypub
  - rdf
layer: spec
---


Wrap the relational computer's knowledge layer with a web-facing service that
can both serve a personal/public website (e.g. `emsenn.net`) and participate
in federated ecosystems (ActivityPub, RDF/OWL) without introducing any new
fundamental storage beyond recognition carriers and their edges.

The core separation is:

- **Knowledge Service** – the relational knowledge graph itself, expressed in
  terms of acts, theorems, specifications, and architecture. It lives entirely
  inside the existing runtime (recognition carriers + edge records, policies,
  topology, measurement).
- **Web Interface** – a thin wrapper that speaks web-native protocols
  (HTTP/HTML/JSON-LD/ActivityPub) by translating requests and responses into
  the Knowledge Service's runbooks and recognitions.

## Goals

- Use the relational computer as the canonical store for concepts, ideas,
  research notes, bibliographic entries, and site content, instead of a
  separate CMS or static site.
- Align the internal knowledge layer with W3C standards (RDF, OWL) so that
  every "thing" in the system has a clear semantic interpretation.
- Align the operational layer with ActivityStreams/ActivityPub so the same
  knowledge objects can be published and federated as social activities.
- Keep the web interface thin: it should never bypass runbooks or invent its
  own data model, only translate between external formats and internal acts.

## Knowledge layer (internal view)

The knowledge layer is a disciplined use of recognition carriers and edges:

- **Knowledge resources** are recognition carriers (typically observation or
  judgement roles) whose content payloads represent:
  - concepts and definitions,
  - research notes and essays,
  - bibliographic entries (papers, books, articles),
  - site pages and posts,
  - external web resources and their extracted structure.
- **Relations** between resources use:
  - explicit edge records for dependencies (cites, references,
    expands-on, contradicts),
  - tags and metadata for soft classification (topics, domains, contexts).
- **Context and provenance** are preserved via:
  - `trace_id` and snapshots,
  - audit logs,
  - policy annotations and topology constraints.

From a mathematical perspective, internal theorems make precise how
recognition carriers + edges + tags form a typed, constrained relational
knowledge graph, and how that structure composes with profiles/towers,
topology, and traceability.

## External correspondences (RDF/OWL and ActivityStreams)

To keep the system interoperable and grounded in existing standards, we plan
two external correspondence layers:

- **RDF/OWL correspondence.**
  - Each recognition carrier is assigned a stable identifier (content-hash
    IRI or site-local IRI) and contributes:
    - classification triples (rdf:type, ontology-specific classes),
    - data-property triples (labels, descriptions, timestamps),
    - object-property triples arising from edge records and structured content
      (cites, isAbout, partOf, etc.).
  - An external theorem would relate the internal knowledge graph structure to
    RDF models and OWL class/property hierarchies, showing how a fragment of
    the relational universe corresponds to standard semantic web structures.

- **ActivityStreams/ActivityPub correspondence.**
  - Certain knowledge resources and traces correspond to Activities, Actors,
    and Objects:
    - site posts as `Note` or `Article`,
    - the human user (and perhaps contexts) as `Actor`,
    - replies, boosts, and likes as Activities referencing resources.
  - The web interface mediates ActivityPub inbox/outbox operations by
    mapping ActivityStreams JSON into the internal knowledge graph
    (recognition carriers + edges + policies) and vice versa.

## Specifications and architecture alignment

This idea should be realised through the usual chain:

1. **Internal theorems.**
   - Theorem (Relational Knowledge Graph): characterise the knowledge layer
     using recognition carriers, edges, topology, policy, and measurement.
   - Theorem (Relational Activity Streams): characterise how activities,
     actors, and objects live within the same trace/context structure.

2. **External theorems.**
   - Theorem (RDF/OWL correspondence): mapping between knowledge graph
     fragments and RDF/OWL models.
   - Theorem (ActivityStreams correspondence): mapping between relational
     activities and ActivityStreams/ActivityPub data.

3. **Specifications.**
   - Knowledge Graph Simulation spec: state representation and procedures for
     ingesting web pages/RDF, storing knowledge resources, and exporting RDF.
   - ActivityPub Simulation spec: how to handle inbound/outbound activities,
     apply policy and topology constraints, and integrate with traceability.

4. **Architecture texts.**
   - A "Knowledge Service" architecture component under computer-architecture
     that describes:
     - a knowledge API (runbook-driven) for creating/updating/linking
       resources,
     - a publishing interface for HTML/JSON-LD/ActivityPub,
     - how the component uses existing subsystems (intake gateway, policy,
       measurement, traceability, topology) without introducing new ones.

## Implementation direction

Given the above, the implementation path is:

- Use existing acts (e.g. `seed-observation`, trace/traceability, topology,
  policy) to construct and link knowledge resources as recognition carriers,
  rather than introducing new acts.
- Add runbooks for:
  - upserting knowledge resources (creating/editing content) by seeding
    observations with agreed-upon payload shapes,
  - linking resources (citations, references, threads) by recording edges
    justified by existing relation/traceability acts,
  - exporting snapshots to RDF/JSON-LD using the knowledge graph simulation
    procedures.
- Extend the FastAPI layer with:
  - read-only endpoints for listing and viewing knowledge resources,
  - ActivityPub-compatible endpoints (inbox/outbox) that delegate to runbooks,
  - HTML/JSON-LD views for site pages generated from the same knowledge layer.

All of this must stay faithful to the acts → theorems → specifications →
architecture stack: no ad-hoc models or direct DB shortcuts. The web interface
is only a thin protocol adapter around the Knowledge Service, which remains an
expression of the relational mathematics.
