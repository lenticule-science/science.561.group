---
type: object
class: foundational
status: active
depends-on:
  - teaching/explanations/ontology.md
  - teaching/explanations/description-logic.md
see-also:
  - owl-axiom.md
references:
  - references/baader-dlhandbook2003.md
---

# Ontology schema

An **ontology schema** (often called the **TBox** in
DL terminology) is the structural part of an ontology:
the classes, properties, and axioms defining the
domain's *terminology*. Distinct from the **ABox**
(assertional box) which holds individual facts.

## Components

A schema typically contains:

- **Class declarations.** Named categories
  (Person, Organization, Document).
- **Property declarations.** Named relations
  (hasName, partOf, authoredBy).
- **Class hierarchies.** $\text{Mother} \sqsubseteq
  \text{Person}$.
- **Property hierarchies.** $\text{authoredBy}
  \sqsubseteq \text{relatedTo}$.
- **Domain/range restrictions.** $\text{authoredBy}$
  has domain Document and range Person.
- **Cardinality constraints.** A Person has exactly
  one birthDate.
- **Class equivalences.** $\text{Mother} \equiv
  \text{Person} \sqcap \exists\text{hasChild}.\text{Person}$.
- **Disjointness axioms.** $\text{Person}$ disjoint
  with $\text{Organization}$.

These axioms encode what's *necessarily* true given
the categories.

## TBox vs ABox

A clean separation:

- **TBox** is generic, slow-changing, semantic.
- **ABox** is specific, fast-changing, factual.

Reasoning over TBox+ABox can be modular: TBox
classification computed once, ABox queries answered
against it.

## Schema languages

- **RDFS.** Lightweight: subclass, subproperty,
  domain, range. Sufficient for many purposes.
- **OWL 2.** Full DL semantics with rich axioms.
- **SHACL.** Shape constraints (more like
  validation than ontological commitment).
- **JSON Schema, XML Schema.** Type-system schemas;
  not ontological in the same sense.

OWL 2 is the standard for semantic ontologies; RDFS
covers simpler cases; SHACL handles validation.

## Schema design principles

Ontology engineering wisdom:

- **Minimal commitment.** Don't over-specify.
- **Reuse.** Use existing ontologies (FOAF, schema.org)
  where possible.
- **Modularity.** Separate concerns; allow extension.
- **OntoClean methodology** (Guarino-Welty 2004):
  formal criteria for class hierarchy correctness
  (rigidity, identity, unity).

These prevent common modeling errors.

## Schema validation and reasoning

A schema enables:

- **Validation.** Check ABox conforms to TBox
  constraints.
- **Classification.** Compute the full subsumption
  hierarchy.
- **Consistency checking.** Detect contradictory
  axioms.
- **Query rewriting.** Translate semantic queries to
  efficient lower-level queries.

Production ontology systems offer these services.

## Schema evolution

A challenge: schemas change as understanding evolves.

- **Backward compatibility.** New schema should
  support old ABox.
- **Migration.** Old data may need transformation.
- **Versioning.** Track schema versions; support
  multi-version queries.
- **Modular extension.** Add new modules without
  breaking existing.

Schema evolution is harder than schema design.

## In contemporary AI

- **Biomedical ontologies.** Substantial schema
  effort (Gene Ontology, SNOMED CT, UMLS).
- **Enterprise knowledge.** Schema-as-data-contract
  in many enterprises.
- **Wikidata.** Lightweight schema; extensive ABox.
- **schema.org.** Web-scale schema for structured
  data on web pages.

## Limits

- **Construction cost.** Substantial expert effort.
- **Maintenance.** Schemas drift.
- **Limits of formalization.** Many natural concepts
  resist clean formalization.
- **Closed-world tendency in practice.** OWL is
  open-world; users often expect closed-world.

## Status

Standard ontology component. Production deployment
across domains. Ontology engineering remains a
specialized skill.
