# Knowledge Organization Services Section

Owns theory and research about classification, ontologies, vocabularies,
libraries, domain analysis, and arrangements of conceptual material.

## Carrier-kind schemas

`data/records/schema/carriers/<kind>.schema.json` are the canonical schemas for content carriers by kind, the kind their artifact-role directory states.
`note` is the first; `concept`, `log`, `readme`, `research`, `essay`, `topic` and `teaching-article` follow in the order the corpus ledger measured.
They borrow aliases, keywords, references and provenance from the term-science section's `glossary/terms/term` schema.

`data/ontology/carriers/` holds their OWL classes and SHACL shapes, generated and never hand-edited.
Engineering projects the schemas and regenerates the ontology from
[carrier-kind-engineering](../../../../../../../engineering-services-section/services/computer-engineering-services-section/services/computer-systems-engineering-services-section/services/computer-knowledge-systems-services-section/services/carrier-kind-engineering-services-section/README.md).
