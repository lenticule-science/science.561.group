---
title: Relational Knowledge Graph
keywords:
  - theorem
  - internal
  - knowledge
  - traceability
  - topology
depends_on:
  - measurement-stack
  - trace-infrastructure
  - topology-integration
  - policy-stack
---

Relational recognition carriers and their edges, constrained by the trace,
topology, and policy stacks, form a well-structured knowledge graph suitable for
simulating RDF/OWL-style semantics without introducing any additional
primitive storage beyond the earned acts.

## Statement

Let:

- **Recognition carriers** be the triadic runtime carriers produced by the
  recognition, trace, and measurement acts (observation, judgement, witness,
  context, trace).
- **Edges** be directed relations between recognition carriers, each labelled
  by an act-justified edge type and metadata, and stored as edge records inside
  the relational state.
- **Topology data** be the strata, sheaf fibers, and constraint bundles
  produced by the topology integration acts.
- **Policy and audit data** be the disciplines/filters, regimes, and audit
  logs arising from the policy and audit stacks.

Then the following structure is well-defined:

- A **node set** whose elements are recognition carriers, each carrying:
  - a role (observation, judgement, witness, context, trace),
  - a finite list of acts justifying its existence,
  - a content payload (structured terms, attributes, or external identifiers),
  - tags and metadata usable for classification and policy matching.
- An **edge set** whose elements are edge records, each identifying a source
  recognition carrier, a destination recognition carrier, and an edge type that
  is justified by some earned act or specification. Edge records themselves
  live in the relational state.
- A **contextualisation** given by:
  - trace IDs and snapshot IDs,
  - topology constraints (ordering, locality),
  - policy regimes and audit trails.

This data forms a typed, constrained directed graph:

- every node traces back to earned acts,
- every edge label is justified by an act, specification, or architecture
  dependency,
- and the topology and policy layers provide placement and access constraints
  over subgraphs.

## Interpretation

From the perspective of knowledge representation, this structure is the
computer's internal knowledge graph:

- **Knowledge resources** are realised as recognition carriers whose content
  represents concepts, notes, papers, bibliographic entries, site pages, or
  external web resources. Their tags and acts determine their type and
  domain.
- **Knowledge relations** (cites, is-about, expands-on, contradicts) are
  realised as edges between these recognition carriers, with edge_type and
  metadata recording the act that justified the relation and any additional
  context.
- **Context and provenance** are not external annotations but part of the
  same relational structure: trace IDs, snapshots, audit logs, and policy
  annotations all attach structured provenance to nodes and edges.

The theorem asserts that no additional primitive notion of "knowledge object"
is needed: the existing recognition carriers and edges, together with the
topology and policy stacks, already provide a sufficiently rich and
disciplined carrier for knowledge graphs.

## Consequences

- Any knowledge-domain simulation (e.g., relational web app, bibliographic
  graph, concept map) can be implemented entirely in terms of:
  - acts that create or transform recognition carriers,
  - runbooks that wire those acts,
  - and constraints expressed via topology, policy, and measurement.
- Export to external graph standards (RDF/OWL, ActivityStreams) can be
  defined as correspondences from this internal graph to the target models,
  without introducing a second knowledge store.
- Traceability and auditability are built-in: every node and edge in the
  knowledge graph carries its derivation history, placement, and policy
  context by construction.

These properties underpin the Web Interface Knowledge Service: the web
interface becomes a protocol adapter around this internal knowledge graph,
while the graph itself remains an explicit realisation of the relational
mathematics.
