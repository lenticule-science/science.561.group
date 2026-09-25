---
type: concept
class: foundational
status: active
depends-on:
  - knowledge-representation.md
see-also:
  - ../objects/ontology-schema.md
  - description-logic.md
references:
  - references/sowa-knowledge2000.md
  - references/ehrlinger-ontologies2016.md
title: Ontology
description: An ontology is a formal specification of the categories, properties, and relationships in a domain.
---

# Ontology

An **ontology** is a formal specification of the
categories, properties, and relationships in a domain.
The "what is there" theory for a particular subject
matter, expressed in a machine-processable form.

## Classical definition

Tom Gruber's much-cited definition (1993):

> An ontology is an *explicit, formal specification of
> a shared conceptualization*.

Decomposing:

- **Conceptualization.** A model of what entities and
  relations exist in the domain.
- **Shared.** Agreed by a community of users.
- **Explicit.** Categories, relations, axioms made
  explicit (not left implicit in code or
  documentation).
- **Formal.** In a machine-processable language with
  well-defined semantics.

Each part is contested in practice — "shared"
especially is more aspirational than achieved.

## Components

A typical ontology contains:

- **Classes.** Categories of entities (Person,
  Organization, Event).
- **Properties.** Attributes (name, age) and
  relations (memberOf, hasParent).
- **Hierarchy.** Subclass and subproperty relations
  (Person ⊑ Animal).
- **Axioms.** Constraints (every Person has
  exactly one birthDate).
- **Instances.** Individual entities (sometimes
  separated as ABox vs class TBox).

The TBox/ABox distinction (terminological/assertional
boxes) comes from description logics.

## Ontology vs schema vs taxonomy

A common terminology fog:

- **Taxonomy.** Hierarchical classification (is-a
  tree). Simplest.
- **Schema (database).** Tables, columns, types.
  Domain-specific operational structure.
- **Ontology.** Schema + semantic axioms expressing
  conceptual structure.

Ontologies are richer than taxonomies (more relations,
not just is-a) and richer than DB schemas (semantic
axioms, not just types).

## Ontology languages

- **OWL (Web Ontology Language).** W3C standard;
  multiple variants (OWL 2 EL, QL, RL, DL, Full)
  trading expressiveness for tractability.
- **RDFS.** Lighter; vocabulary on top of RDF.
- **OBO format.** Used in biomedical ontologies (Gene
  Ontology, etc.).
- **F-Logic, Common Logic.** Other formalisms.

OWL DL is the standard for substantive ontologies;
its expressiveness and decidability balance well for
many uses.

## Famous ontologies

- **Cyc.** Lenat's encyclopedic ontology (1984-).
  Massive; controversial.
- **Gene Ontology.** Biomedical; productive.
- **SUMO.** Suggested Upper Merged Ontology.
- **Schema.org.** Lightweight; web-search focus.
- **Wikidata.** Crowdsourced KG with ontology.
- **DBpedia.** Wikipedia-derived KG.

These show ontology engineering at scale across
domains.

## What ontologies are good for

- **Interoperability.** Common vocabulary across
  systems.
- **Inference.** Subsumption, classification,
  consistency checking.
- **Query.** Semantic queries beyond keyword
  matching.
- **Integration.** Mapping between data sources.
- **Documentation.** Machine-readable specification
  of domain assumptions.

Successful ontology applications usually emphasize
one or two of these primarily.

## Ontology engineering

Building an ontology is hard:

- **Conceptual analysis.** What are the right
  categories?
- **Granularity.** How fine-grained should classes
  be?
- **Modular structure.** How to organize?
- **Maintenance.** How to update as understanding
  evolves?
- **Alignment.** How to map to other ontologies?

Methodologies (NeOn, METHONTOLOGY, OntoClean)
codify approaches but don't eliminate the
difficulty.

## In contemporary AI

- **Knowledge graphs use ontologies.** Wikidata,
  Google KG, etc., have associated ontology layers.
- **Biomedical NLP.** Heavy ontology use (UMLS,
  SNOMED CT).
- **Enterprise.** Semantic-data-management
  applications.
- **LLMs and ontologies.** Emerging research on
  using LLMs to construct, extend, and query
  ontologies.

## Limits

- **Construction cost.** Substantial expert effort
  required.
- **Maintenance.** Ontologies drift as domains
  evolve.
- **Closed-world tendency.** Ontologies often
  implicitly assume closed worlds despite OWL's
  open-world semantics.
- **Limited expressiveness.** Many real-world
  notions resist formalization.

## Status

Mature formalism with active production use.
Ontology engineering is craft as much as science.
Active research on automated and ML-assisted
ontology construction.
