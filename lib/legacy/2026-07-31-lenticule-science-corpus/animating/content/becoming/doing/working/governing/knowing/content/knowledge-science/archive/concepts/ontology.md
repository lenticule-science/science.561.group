---

introduces: data-structure
description: "A formal specification of what exists in a domain and how things in it relate. In knowledge representation, an ontology defines the concepts, relations, and constraints of a subject area."
aliases: [ontology, ontologies, formal ontology]
extends: schema
examples: [bfo, dolce, owl-ontology]
date-created: 2026-03-31
---

An ontology is a formal specification of what exists in a domain and how things relate. It defines the concepts (classes), the relations (properties), and the constraints (axioms) that govern a subject area.

In philosophy, ontology asks what kinds of things exist. In knowledge representation, an ontology answers this question for a specific domain and encodes the answer in a machine-readable format.

Examples:

- **BFO** (Basic Formal Ontology, Arp, Smith, & Spear 2015): a top-level ontology distinguishing continuants (things that persist) from occurrents (things that happen), with mereological relations (part-of, has-part).
- **DOLCE** (Descriptive Ontology for Linguistic and Cognitive Engineering, Borgo et al. 2022): a foundational ontology with rich mereological and taxonomic structure.
- **OWL ontologies**: Web Ontology Language specifications used in the semantic web, defining classes and properties with description logic semantics.

An ontology is a [schema](./schema.md) with richer structure: not just "what attributes exist" but "what kinds of things exist, how they relate, and what must hold between them." Ontologies impose structure from above; [formal concept analysis](./formal-concept-analysis.md) discovers structure from below.

The typed predicate vocabularies used in the papers on bilattice-valued predication — with attributes like `extends`, `requires`, `produces` — are lightweight ontologies: they assert that certain relations exist and have algebraic properties, without prescribing a full domain theory.
