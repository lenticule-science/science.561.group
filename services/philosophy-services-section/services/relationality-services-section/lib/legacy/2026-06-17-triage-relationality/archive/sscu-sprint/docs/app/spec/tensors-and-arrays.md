---
title: Tensors, Arrays, and Numeric Fields
keywords:
  - idea
  - tensors
  - numeric
part-of: relational-computer
description: "Gives tensors and arrays a clear place as recognitions so ML and quantitative work links to the graph."
---
# Idea: Tensors, Arrays, and Numeric Fields

Give tensors/arrays a clear place as recognitions so ML/quantitative work can be
linked to the rest of the graph.

## 1. Core recognitions

- `TensorRecognition`
  - numeric array with shape, dtype, and semantics.
  - examples: embeddings, model weights, images as arrays, audio spectrograms.

- `TensorFieldRecognition`
  - a tensor-valued field over some domain:
    - e.g., temperature over space/time, vector fields, feature maps.

- `TensorOperationRecognition`
  - operations applied:
    - matrix mult, convolution, pooling, normalization, etc.

## 2. Measurement and topology

- Measurement:
  - norms, variances, eigenvalues, rank, sparsity,
  - drift over time (e.g., model weight changes, embedding drift).

- Topology:
  - where tensors live in the system:
    - as representations of recognitions (embeddings),
    - as parts of models,
    - as raw data (images/audio).

## 3. Runbooks and uses

- `summarize_tensor(tensor_id)`,
- `compare_tensors(tensor_id_1, tensor_id_2)`,
- `track_tensor_drift(tensor_series)`.

This bridges numeric ML artifacts with your semantic/relational layers.

