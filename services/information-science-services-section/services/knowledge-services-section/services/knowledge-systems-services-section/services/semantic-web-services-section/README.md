# Semantic Web Services Section

The semantic web is the research program and W3C standards stack for publishing machine-readable, linked, queryable knowledge on the web: RDF as the data model, RDFS/OWL for ontology, SPARQL for query, SKOS for vocabularies, PROV for provenance, SHACL for validation, and JSON-LD as the serialization through which the program achieved its one mass deployment (schema.org markup).
It is modeled here as a knowledge system — an architecture that operationalizes knowledge — which is why it seats under `knowledge-systems-services-section` rather than under knowledge organization or web engineering.

## Seating derivation

Per `science-services-section`'s ownership rule, a note has one canonical owner at its most specific defensible service section.
A library survey (2026-08-22) found no semantic-web section anywhere under `science-services-section`, despite the library's standing dependence on the stack: the media-science memo `vocabulary-mismatch-research-memo.md` builds on SKOS/ISO 25964, the news-media memos (`news-topology.md`, `claim-infrastructure.md`, `accountable-agentic-newsrooms.md`) presuppose "semantic-web and agentic-web conditions" and W3C PROV, and the sibling `research-services-section` glossary holds `w3c.md` and `tim-berners-lee.md` with no section to ground them.

Candidate seats and why they lost:

- `knowledge-organization-services-section` owns classification, ontologies, and vocabularies as organizational theory; the semantic web is not a theory of organization but a deployed architecture that *carries* such theory (SKOS carries thesauri; OWL carries ontologies).
  The KO section's upper-ontologies note remains canonical for ontology-as-KO; this section owns the web stack.
- `communication-science-services-section`'s web/media forest owns media phenomena on the web, not knowledge-representation infrastructure.
- Engineering's `web-science-services-section` owns web systems as engineered artifacts; the semantic web as a *research literature* (its vision papers, critiques, retrospectives, adoption measurements) is science-side material.

`knowledge-systems-services-section` declares ownership of "architectures that operationalize knowledge"; the semantic web is exactly that, so it seats here as a child section.

## Relations to existing content (not moved)

- `research-services-section`'s `w3c.md` and `tim-berners-lee.md` glossary terms remain canonical there; this section's study and terms link to them rather than re-deriving the institution or the biography.
- `media-science-services-section`'s `vocabulary-mismatch-research-memo.md` remains canonical there as retrieval-focused method; this section owns SKOS itself.
- `news-media-science-services-section`'s claim/provenance memos remain canonical there; this section owns the underlying W3C standards they build on, and the news-media section's claim-and-provenance-standards study cross-links here.

## Scope

This section owns:

- The semantic-web research program: the 2001 vision, its critiques, retrospectives, and measured adoption reality.
- The W3C standards stack: RDF, RDFS, OWL, SPARQL, SKOS, PROV, SHACL, JSON-LD, and their Recommendation history.
- Linked-data principles and practice, the LOD cloud, DBpedia and Wikidata as deployed systems.
- The knowledge-graph turn, schema.org, and structured data in the wild.
- The semantic web's meeting with large language models (knowledge graphs + LLMs, retrieval over graphs), held to dated, verifiable claims.

It does not own knowledge-organization theory, retrieval-system design, or web engineering — those remain with their sections and are related to from here.

## Plausible future children

- `linked-data-services-section` — publication practice, the LOD cloud, and dataset-level work if it outgrows the parent.
- `ontology-engineering-services-section` — OWL/SHACL modeling practice, jointly derived with knowledge-organization.

Founded 2026-08-22 during backup-phase additive study work; parent READMEs could not be edited to register this section, so registration in `knowledge-systems-services-section`'s README is carried as debt for after the backup.
