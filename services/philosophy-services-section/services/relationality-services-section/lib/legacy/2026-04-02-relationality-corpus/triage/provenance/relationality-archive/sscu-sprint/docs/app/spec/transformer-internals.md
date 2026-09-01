---
name: transformer-internals
keywords:
  - idea
  - transformers
  - interpretability
part-of: relational-computer
description: "Represents internal transformer signals as recognitions so interpretability work fits the relational graph."
---

Represent internal transformer signals (attention patterns, activations,
features) as recognitions so interpretability work fits into the relational
graph.

## 1. Core recognitions

- `LayerRecognition`, `HeadRecognition`
  - structural components of a model.

- `AttentionPatternRecognition`
  - attention matrices for a given prompt at a given layer/head.

- `ActivationPatternRecognition`
  - activations for certain neurons/features.

- `FeatureInterpretationRecognition`
  - human or agent interpretation of a feature/head (e.g., “tracks brackets”,
    “responds to names”, “safety feature”).

## 2. Measurement and topology

- Measurement:
  - how often features fire for certain inputs/domains,
  - correlation between features and behaviors (good/bad completions).

- Topology:
  - networks of features and behaviors,
  - mapping from internal features to external recognitions (tokens, frames,
    values).

## 3. Runbooks and uses

- `record_attention(prompt_id, model_id)`,
- `cluster_features_by_behavior(model_id, domain_slice)`,
- `attach_feature_interpretation(feature_id, description)`.

This lets interpretability work be part of the same traceable universe as
everything else.

