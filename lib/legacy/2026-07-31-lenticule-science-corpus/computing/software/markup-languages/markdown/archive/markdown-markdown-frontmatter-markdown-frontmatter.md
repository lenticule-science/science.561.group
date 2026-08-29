---

title: "Markdown Frontmatter"
description: "YAML frontmatter in markdown files as a serialization of an RDF graph — each file is a subject, each key is a predicate, each value is an object."
defines: markdown-frontmatter
aliases: [yaml frontmatter, front matter]
extends: frontmatter
serializes: rdf-graph
validated-by: shacl
date-created: 2026-03-18
date-modified: 2026-04-01
---

YAML [frontmatter](theories/computing/theories/markdown/terms/frontmatter.md) in markdown files is a serialization of an RDF directed labeled graph.

The RDF data model (W3C 2004; Cyganiak, Wood, Lanthaler 2014) represents knowledge as a **directed labeled graph** G = (V, E) where:

- **V** is a set of nodes — IRIs (named resources) or literals (typed values)
- **E** is a set of directed labeled edges — **triples** (subject, predicate, object) where subject ∈ IRIs, predicate ∈ IRIs, object ∈ IRIs ∪ Literals

A YAML frontmatter block is a serialization of the RDF triples for one subject node. Each `.md` file is a subject IRI; each frontmatter key is a predicate IRI; each frontmatter value is the object — an IRI if it references a known entity `id`, a typed literal otherwise. The complete set of all frontmatter blocks in the corpus is a serialization of the full RDF graph over the corpus.

This encoding requires no separate `.ttl` data files: the graph is distributed across the frontmatter of the entity files themselves.

## Frontmatter-to-graph conversion

- **Subject IRI**: derived from the entity's `id` field using the repository's base namespace (`<repo:{id}>`)
- **Predicate IRI**: each frontmatter key maps to `<repo:{key}>`
- **Object**: IRI if value matches a known entity `id`; typed literal otherwise
- **Structured values**: YAML lists under a key produce one triple per list item, or blank nodes with sub-triples for nested structure

## SHACL validation

**SHACL** (Shapes Constraint Language; W3C 2017) is a constraint language over RDF graphs. A SHACL **shape** is a formula in a restricted fragment of first-order logic that targets a subset of nodes and states properties they must satisfy. The constraint language is decidable and polynomially tractable for the core fragment.

One SHACL shape file per predicate lives at `shacl/{predicate-id}.ttl`. Each shape uses `sh:targetSubjectsOf :{predicate-id}` to target every node carrying that predicate. The shapes applicable to a given node are exactly those for the predicates in its frontmatter — the node selects its own applicable constraints.

`shacl/id.ttl` targets every node (every node has `id`) and states universal constraints: `description` is required, `id` is a kebab-case string, filename matches. Every other shape adds constraints specific to one predicate.

## Validation pipeline

1. Parse the entity file's YAML frontmatter
2. Convert to an in-memory `rdflib.Graph` (no disk write)
3. For each frontmatter key, load `shacl/{key}.ttl` if it exists
4. Merge the applicable shapes into one shape graph
5. Call `pyshacl.validate(data_graph, shacl_graph=shapes)`
6. Fail if `conforms` is False; return the violation report

Cross-file queries load multiple entity files, merge their frontmatter graphs into one in-memory graph, and run SPARQL against the merged graph.

