---
title: Embeddings & Learned Representations
status: someday
keywords:
  - idea
  - embeddings
  - representations
description: Treat embeddings and other learned representations as recognitions so they can be inspected, compared, and related to semantic concepts.
---
# Idea: Embeddings & Learned Representations

Treat embeddings and other learned representations as recognitions so they can
be inspected, compared, and related to semantic concepts.

## 1. Core recognitions

- `EmbeddingSpaceRecognition`
  - a particular space (e.g., text embeddings, image embeddings).
  - fields: dimensionality, training method, domain.

- `EmbeddingVectorRecognition`
  - a single vector linked to:
    - tokens, utterances, images, audio segments, or other recognitions.

- `ClusterRecognition`
  - clusters in an embedding space (topics, styles, object types).

## 2. Measurement and topology

- Measurement:
  - distances/similarities, density, cluster quality,
  - how embeddings of the same recognition drift over time.

- Topology:
  - mapping between embedding clusters and semantic fields, frames, or symbols,
  - cross-modal links (text ↔ image ↔ audio ↔ MUD recognitions).

## 3. Runbooks and uses

- `embed_recognition(recognition_id, space_id)`,
- `analyze_embedding_cluster(cluster_id)`,
- `align_embedding_space_with_semantics(space_id, domain_slice)`.

Embeddings then become traceable, interpretable artifacts instead of opaque
vectors.
