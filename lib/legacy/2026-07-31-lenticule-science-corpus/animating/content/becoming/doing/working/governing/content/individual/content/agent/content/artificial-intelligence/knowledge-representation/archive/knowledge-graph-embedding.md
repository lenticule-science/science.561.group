---
type: object
class: contemporary
status: active
depends-on:
  - teaching/explanations/knowledge-graph.md
  - teaching/explanations/vector-knowledge.md
see-also:
  - ../morphisms/kg-completion.md
references:
  - references/ji-survey-kg2021.md
---

# Knowledge graph embedding

A **knowledge graph embedding** is a vector
representation of knowledge graph entities and
relations, enabling algebraic operations and ML
downstream use over symbolic KG content.

## The basic setup

Given a KG of triples $(h, r, t)$:

- Map each entity $e$ to a vector $\mathbf{e} \in
  \mathbb{R}^d$.
- Map each relation $r$ to a vector or matrix
  representation.
- Define a *scoring function* $f(\mathbf{h},
  \mathbf{r}, \mathbf{t})$ that's high for true
  triples and low for false.
- Train embeddings to maximize score on observed
  triples and minimize on negative samples.

Result: embeddings supporting algebraic operations.

## Major models

### TransE (Bordes et al. 2013)

- Score: $-\|\mathbf{h} + \mathbf{r} - \mathbf{t}\|$.
- Idea: relation as translation in embedding space.
- Limit: struggles with 1-N, N-1, N-N relations and
  symmetric relations.

### DistMult (Yang et al. 2014)

- Score: $\sum_i h_i \cdot r_i \cdot t_i$.
- Symmetric (cannot model asymmetric relations).

### ComplEx (Trouillon et al. 2016)

- Complex-valued; $\langle \mathbf{h}, \mathbf{r},
  \overline{\mathbf{t}} \rangle$.
- Handles asymmetric relations.

### RotatE (Sun et al. 2019)

- Relations as rotations in complex space.
- Handles symmetry, anti-symmetry, inversion,
  composition.

### Convolutional models

- ConvE, ConvKB: 2D convolutions over reshaped
  embeddings.

### GNN-based

- R-GCN: relational graph convolutional networks.
- CompGCN: compositional GNN.
- More expressive; computationally heavier.

### LLM-based

- KG-BERT and successors: pre-trained models
  fine-tuned for KG tasks.

## What they're used for

- **KG completion.** Predict missing triples from
  observed.
- **Triple classification.** Score whether candidate
  triples are true.
- **Entity / relation similarity.** Vector distance
  between embeddings.
- **Question answering.** Embed questions; retrieve
  via embedding similarity.
- **Recommendation.** Use KG embeddings as features.
- **Downstream ML.** Embeddings feed other models.

## Evaluation

Standard benchmarks:

- **FB15k, FB15k-237.** Freebase subsets.
- **WN18, WN18RR.** WordNet-derived.
- **Wikidata5M.** Larger; Wikidata-derived.
- **YAGO3-10.** YAGO subset.

Metrics: Hits@k, MRR (mean reciprocal rank), MR
(mean rank).

Caveat: many older benchmarks have *test-set
leakage* through inverse relations; FB15k-237 and
WN18RR fix this.

## Strengths and limits

**Strengths:**
- ML-compatible representation of KG content.
- Smooth generalization to unseen triples.
- Efficient retrieval / similarity.

**Limits:**
- Black-box: hard to interpret what's encoded.
- Out-of-vocabulary entities (new entities) need
  handling (inductive KGE).
- Single triple scoring doesn't capture multi-hop
  reasoning well.
- Evaluation benchmarks can be misleading.
- Symbolic KG semantics not preserved (no logical
  inference).

## In contemporary AI

- **Pre-trained KG embeddings** released for
  Wikidata, DBpedia, etc.
- **LLM-KG hybrids.** LLM for natural language;
  KG embeddings for structured retrieval.
- **Multimodal KG embeddings.** Combine text,
  images, structure.
- **Drug-discovery KGs.** KG embeddings for
  predicting drug-target interactions.

## Status

Mature method with continued active development.
Standard tool for KG ML. Increasingly displaced or
augmented by LLM-based methods for some tasks.
