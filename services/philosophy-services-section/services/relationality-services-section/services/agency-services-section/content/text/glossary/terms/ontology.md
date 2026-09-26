---
title: "emsenn.net"
type: "data-structure"
date-created: 2026-03-31
description: A formal specification of what exists in a domain and how things in it relate.
aliases:
  - Ontology
  - formal ontology
  - ontologies
  - ontology
introduces: data-structure
extends: schema
examples:
  - bfo
  - dolce
  - owl-ontology
---

A formal specification of what exists in a domain and how things in it relate. In knowledge representation, an ontology defines the concepts, relations, and constraints of a subject area.

An ontology is a formal specification of what exists in a domain and how things relate. It defines the concepts (classes), the relations (properties), and the constraints (axioms) that govern a subject area.

In philosophy, ontology asks what kinds of things exist. In knowledge representation, an ontology answers this question for a specific domain and encodes the answer in a machine-readable format.

Examples:

- **BFO** (Basic Formal Ontology, Arp, Smith, & Spear 2015): a top-level ontology distinguishing continuants (things that persist) from occurrents (things that happen), with mereological relations (part-of, has-part).

- **DOLCE** (Descriptive Ontology for Linguistic and Cognitive Engineering, Borgo et al. 2022): a foundational ontology with rich mereological and taxonomic structure.

- **OWL ontologies**: Web Ontology Language specifications used in the semantic web, defining classes and properties with description logic semantics.

An ontology is a [schema](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/knowledge-science/archive/schema.md) with richer structure: not just &ldquo;what attributes exist&rdquo; but &ldquo;what kinds of things exist, how they relate, and what must hold between them.&rdquo; Ontologies impose structure from above; [formal concept analysis](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/knowledge-science/archive/formal-concept-analysis.md) discovers structure from below.

The typed predicate vocabularies used in the papers on bilattice-valued predication — with attributes like `extends`, `requires`, `produces` — are lightweight ontologies: they assert that certain relations exist and have algebraic properties, without prescribing a full domain theory.
