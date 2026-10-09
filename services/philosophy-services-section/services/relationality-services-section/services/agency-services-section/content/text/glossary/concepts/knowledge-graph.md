---
type: concept
class: contemporary
status: active
depends-on:
  - knowledge-representation.md
see-also:
  - ../objects/rdf-triple.md
  - ../objects/knowledge-graph-embedding.md
  - ../morphisms/kg-completion.md
references:
  - references/hogan-knowledgegraphs2021.md
  - references/ji-survey-kg2021.md
title: Knowledge graph
description: A knowledge graph is a graph of entities (nodes) and relations (labeled edges) encoding factual knowledge.
---

# Knowledge graph

A **knowledge graph** is a graph of *entities* (nodes)
and *relations* (labeled edges) encoding factual
knowledge. Modern successor to semantic networks; the
dominant deployed form of large-scale symbolic KR.

## Core structure

A KG consists of:

- **Entities.** Things (Barack Obama, France, the
  novel *Beloved*).
- **Relations.** Typed edges (bornIn, presidentOf,
  authorOf).
- **Triples.** $(subject, predicate, object)$ form,
  per RDF tradition.
- **(Optional) Schema/ontology.** Class hierarchy,
  domain/range constraints.
- **(Optional) Literals.** Strings, numbers, dates as
  edge endpoints.

The *open* form: just triples, no ontology. The
*closed* form: triples plus ontology constraining
their shape.

## Famous knowledge graphs

- **Google Knowledge Graph (2012-).** Powers Google
  search infoboxes and entity-aware results. Closed.
- **Wikidata (2012-).** Crowdsourced; open;
  substantial; widely re-used.
- **DBpedia (2007-).** Wikipedia-derived KG.
- **YAGO.** Wikipedia + WordNet derived.
- **Freebase (2007-2014).** Acquired by Google;
  feeds Google KG.
- **Enterprise KGs.** Many companies have internal
  KGs (Amazon Product KG, LinkedIn Knowledge Graph,
  etc.).

These collectively demonstrate KG technology at
production scale.

## Why KGs took off

Several factors converged in the 2000s-2010s:

- **Web-scale data.** Wikipedia, Linked Data,
  semantic web data became available.
- **Query needs.** Search engines wanted entity-
  aware results.
- **RDF tooling.** Mature triple stores, SPARQL.
- **ML integration.** KG embeddings made KGs
  consumable by ML systems.
- **Practical scaling.** Solutions to scaling triple
  stores and reasoning emerged.

The result: KGs went from research curiosity (1990s)
to industry standard (2010s).

## KG completion

KGs are necessarily *incomplete*:

- New entities added constantly.
- Relations not exhaustively recorded.
- Many factually-correct triples missing.

**KG completion** predicts missing triples from
existing structure:

- **Embedding-based.** TransE, DistMult, ComplEx,
  RotatE: embed entities and relations; predict via
  algebraic operations.
- **Neural network-based.** GNNs over KGs.
- **Rule-based.** Mine logical rules; apply.
- **Hybrid.** Combinations.

Completion accuracy on held-out triples is the
standard benchmark.

## KG embeddings

Vector representations of entities and relations:

- **TransE.** $h + r \approx t$ for triple $(h, r,
  t)$.
- **DistMult.** $\langle h, r, t \rangle$ as
  scoring.
- **ComplEx.** Complex-valued for asymmetric
  relations.
- **RotatE.** Rotations in complex space.
- **GNN-based.** R-GCN and successors.

Embeddings enable:

- KG completion via algebraic prediction.
- Downstream ML over KG-derived features.
- Question answering via embedding similarity.

## SPARQL and queries

Standard query language for RDF KGs:

```sparql
SELECT ?author WHERE {
  ?author :wrote :Beloved .
}
```

SPARQL gives expressive graph patterns; production
KG endpoints (Wikidata, DBpedia) support it.

## In contemporary AI

- **Web search.** Google, Bing use KGs for entity
  understanding.
- **Question answering.** KG-augmented QA systems.
- **Recommender systems.** KG-aware
  recommendation.
- **Drug discovery.** Biomedical KGs for
  hypothesis generation.
- **LLM grounding.** KGs as factual grounding for
  LLMs (retrieval-augmented).

## Limits

- **Incompleteness.** Always missing data; never
  comprehensive.
- **Quality.** Crowdsourced KGs have errors;
  curated KGs are expensive.
- **Update.** Keeping KGs current is hard.
- **Integration.** Combining KGs requires
  ontology alignment.
- **Long tail.** Common entities well-represented;
  long-tail entities sparse.

## Status

Mature technology. Production use at scale. Active
research on KG-LLM integration, KG completion,
multi-modal KGs.
