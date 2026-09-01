---
type: morphism
class: foundational
status: active
depends-on:
  - teaching/explanations/ontology.md
  - ../objects/ontology-schema.md
see-also: []
references:
  - references/sowa-knowledge2000.md
---

# Ontology alignment

**Ontology alignment** (also: ontology matching) is
the discovery of correspondences between concepts
across distinct ontologies — saying "your `Author`
class is my `Writer` class" or "your `wrote` property
is my `authoredBy` inverse." Necessary for
integrating data from multiple sources.

## Why it's needed

Different organizations build ontologies for similar
domains:

- Biomedical: SNOMED, UMLS, Gene Ontology, ICD.
- Geography: GeoNames, OSM ontology, DBpedia
  geographic.
- People/Organizations: FOAF, schema.org, Wikidata.

For data integration across these, alignment is
required.

## Forms of correspondence

Types of mappings:

- **Equivalence.** $C_1 \equiv C_2$.
- **Subsumption.** $C_1 \sqsubseteq C_2$.
- **Disjointness.** $C_1 \sqcap C_2 \equiv \bot$.
- **Property-class mapping.** Property in one
  corresponds to subclass in another.
- **Complex mapping.** Multi-axiom correspondences.

Real alignments often need complex correspondences;
simple equivalences are the easy cases.

## Approaches

### Lexical / string-based

- Edit distance, n-grams, tokenization.
- Cheap; works for similar terminologies.

### Structural

- Compare positions in respective hierarchies.
- Combine structure + lexical evidence.

### Semantic

- Use external resources (WordNet, dictionaries).
- Reason over combined ontologies.

### ML-based

- Train classifiers on candidate mappings.
- Embedding-based alignment (compare embeddings of
  concepts across ontologies).

### LLM-based

- Use LLMs to suggest or verify mappings.
- Increasingly common in recent work.

### Interactive

- Human-in-the-loop confirms/rejects suggestions.
- Often necessary for high-stakes integrations.

## Evaluation

The Ontology Alignment Evaluation Initiative (OAEI)
runs annual benchmarks across diverse domains.

Metrics:
- Precision, recall, F-measure on reference
  alignments.
- Performance varies by domain; biomedical hard.

## Challenges

- **Granularity differences.** Ontologies use
  different granularity for same domain.
- **Naming variation.** Same concept named
  differently.
- **Modeling perspective.** Different design
  choices for same domain.
- **Scale.** Large ontologies have huge candidate-
  mapping space.
- **Evolution.** Ontologies update; alignments must
  too.

## Use cases

- **Biomedical data integration.** Map clinical
  ontologies to research ontologies.
- **Linked Open Data.** Connect datasets across
  the web.
- **Enterprise data integration.** Combine
  divisional ontologies.
- **Schema matching in databases.** Related
  problem; similar techniques.

## In contemporary AI

- **OAEI-style benchmarks** continue.
- **LLM-assisted alignment.** Strong recent
  results.
- **Cross-lingual alignment.** Multilingual KGs
  require this.
- **Active ontology engineering.** Alignment is
  routine in collaborative ontology development.

## Limits

- **Expensive at scale.** Large alignments
  computationally hard.
- **Quality bound by source ontologies.** Bad
  ontologies produce bad alignments.
- **Semantic-modeling differences** are hard to
  bridge with technical means alone.
- **Maintenance.** Alignments drift as ontologies
  evolve.

## Status

Mature research area with active practical
deployment. Annual benchmarks continue. LLM-assisted
methods are the current frontier.
