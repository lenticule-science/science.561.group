---

introduces: data-structure
description: "A prescribed structure that data must conform to. Contrasts with emergent structure, where the structure is discovered in the data after the fact."
aliases: [ schema, schemas, schemata, data schema, emsenn.net ]
contrasts-with: emergent-structure
date-created: 2026-03-31
type: data-structure
---

A schema is a prescribed structure that data must conform to. It defines what attributes exist, what types their values must have, and what constraints hold between them. Data that violates the schema is invalid.

Relational database schemas specify tables, columns, and types. XML schemas (XSD) specify element hierarchies and value constraints. RDF schemas (RDFS) and OWL ontologies specify classes, properties, and inference rules. JSON Schema specifies the shape of JSON documents.

Schema-first design defines the structure before populating it. The schema is the authority; the data follows. Violations are errors.

The alternative is emergent structure: examine data that already exists and discover what patterns have arisen from practice. [Formal concept analysis](./formal-concept-analysis.md) does this — it takes a collection of key-value records and extracts a [concept lattice](../../../../services/math-services-section/content/text/glossary/terms/concept-lattice.md) that captures the data's implicit organization. Divergences from the emergent pattern are not errors but observations: places where conventions break down or exceptions exist.

A repository of Markdown files with YAML frontmatter has no schema in the traditional sense. Each file's author writes whatever frontmatter keys seem appropriate. The resulting collection has emergent structure: shared keys generate fibers, and the patterns across fibers form the implicit schema. This implicit schema can be examined, formalized after the fact, or left implicit and used as a soft constraint.
