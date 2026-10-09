---
type: morphism
class: contemporary
status: active
depends-on:
  - teaching/explanations/knowledge-graph.md
  - ../objects/knowledge-graph-embedding.md
see-also:
  - ../theorems/kg-incompleteness.md
references:
  - references/ji-survey-kg2021.md
title: KG completion
description: Knowledge graph completion predicts missing triples in a knowledge graph from existing structure.
---

# KG completion

**Knowledge graph completion** predicts missing
triples in a knowledge graph from existing structure.
Operationalizes the fact that real KGs are
*incomplete* (per [kg-incompleteness](kg-incompleteness.md))
and gives ML methods for filling gaps.

## The task

Given a KG with triples $T$:

- Identify likely-true triples $T' \notin T$.
- Score candidate triples by plausibility.
- Rank candidates for verification or use.

Standard formulations:

- **Link prediction.** Given $(h, r, ?)$, predict
  the tail entity.
- **Relation prediction.** Given $(h, ?, t)$,
  predict the relation.
- **Triple classification.** Given $(h, r, t)$, is
  it true?

Link prediction is most studied.

## Approaches

### Embedding-based

Represent entities and relations as vectors; score
candidate triples via the embedding.

- TransE, TransR, TransH (translation-based).
- DistMult, ComplEx (bilinear).
- RotatE (rotational).
- HolE (holographic).

These dominate as baselines.

### Neural network-based

- **ConvE.** Convolutions over reshaped
  embeddings.
- **R-GCN, CompGCN.** Relational GNNs over the KG
  itself.
- More expressive but more compute.

### Rule-based

- **AMIE, RuLES.** Mine logical rules from KG;
  apply them to predict new triples.
- Interpretable; complementary to embeddings.

### Hybrid

- Combinations: embeddings + rules; embeddings +
  GNNs.
- Often best on benchmarks.

### LLM-based

- **KG-BERT, StAR.** Pre-trained models fine-tuned.
- **LLMs as completion engines.** Recent work:
  prompt LLM to fill missing triples.
- Strong on benchmarks; concerns about
  hallucination.

## Evaluation

Standard benchmarks: FB15k-237, WN18RR, YAGO3-10,
Wikidata5M.

Metrics:
- **Hits@k.** Proportion of correct answers in
  top-k predictions.
- **MRR.** Mean reciprocal rank of correct answer.
- **MR.** Mean rank.

Caveats:
- Older benchmarks (FB15k, WN18) had test-set
  leakage through inverse relations; FB15k-237 and
  WN18RR fix this.
- Benchmark performance may not predict real-world
  utility.

## Use cases

- **Drug discovery.** Predict drug-target
  interactions in biomedical KGs.
- **Recommendation.** Predict user-item edges.
- **Enterprise KG enrichment.** Fill gaps in
  internal KGs.
- **QA systems.** Use predicted triples to answer
  questions over incomplete KGs.

## Limits

- **Hallucination risk.** Especially with LLM-based
  completion; predictions may be plausible-sounding
  but false.
- **Out-of-vocabulary entities.** Standard methods
  assume entities seen in training; new entities
  need inductive methods.
- **Single-hop bias.** Most methods score one
  triple at a time; multi-hop reasoning is harder.
- **Long-tail.** Rare entities and relations are
  hard to complete accurately.
- **Benchmark fragility.** Performance varies on
  different benchmarks; rankings unstable.

## In contemporary AI

- **Active integration with LLMs.** LLM-based
  completion is the current research frontier.
- **Multimodal KGs.** Completion incorporating text,
  images, structured data.
- **Inductive completion.** Methods that handle new
  entities.
- **Production KG enrichment.** Used at scale at
  large tech companies.

## Status

Mature task with potential research. Embedding methods
remain strong baselines. LLM-based methods
demonstrating impressive capability with safety
concerns.
