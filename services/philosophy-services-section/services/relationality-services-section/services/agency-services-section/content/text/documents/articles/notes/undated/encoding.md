---
type: morphism
class: classical
status: active
depends-on:
  - ../objects/memory-trace.md
  - ../objects/memory-store.md
see-also:
  - retrieval.md
  - consolidation.md
references: []
title: Encoding
description: Encoding is the transformation of perceptual or computational input into a stored memory-trace.
---

# Encoding

**Encoding** is the transformation of perceptual or
computational input into a stored [memory-trace](memory-trace.md).
It is the entry point of the memory pipeline: what is encoded
is what is later retrievable; what fails to encode is gone
regardless of how good retrieval is.

## What encoding determines

The encoding step fixes:

- **Which fields are recorded.** A schema-mapped record drops
  whatever the schema doesn't have a slot for.
- **At what granularity.** Coarse representations are
  efficient but lose detail; fine representations are
  detailed but expensive.
- **In what representation.** Symbolic record vs vector
  embedding vs distributed activation pattern. Different
  representations support different downstream queries.
- **With what metadata.** Provenance, timestamp, salience —
  any annotation must be added at encoding (or lost).

## Encoding in different memory systems

- **Symbolic.** Encoding is schema mapping: extract typed
  fields from input, populate a record. Failure mode: the
  input has structure the schema doesn't capture.
- **Vector.** Encoding is application of an embedding model.
  Failure mode: the embedding model trained on different
  data distorts the embedding for out-of-distribution
  inputs.
- **Distributed neural.** Encoding is one or more learning-
  rule updates to network weights. Failure mode: the update
  interferes with previously stored items.

## Encoding effort and depth

Cognitive psychology distinguishes *shallow* encoding (surface
features, low effort, low retrievability) from *deep* encoding
(semantic features, high effort, high retrievability). The
*levels-of-processing* framework (Craik & Lockhart 1972)
correlates retrieval success with encoding depth.

The AI analog: an embedding model that encodes only surface
text features (tokens, n-grams) yields lower retrieval quality
than one that encodes semantic features (entities, relations,
intent). Encoding-time choice of embedding model is a load-
bearing decision.

## Encoding bottlenecks

Encoding is often the throughput bottleneck of a memory
system:

- **Embedding inference cost.** Each item to be stored
  requires an embedding-model forward pass.
- **Schema mapping cost.** Extracting structured fields from
  unstructured input may require LLM calls.
- **Indexing cost.** Inserting into a vector index updates
  the index structure.

For agents that store conversation turns or document streams,
the encoding pipeline determines what is feasible to store at
all.

## Encoding versus consolidation

Encoding produces an initial trace; [consolidation](consolidation.md)
stabilizes it into long-term form. Encoding can succeed without
consolidation (the trace exists but is fragile). The
distinction matters because the failure modes differ:
encoding-failure means "never stored"; consolidation-failure
means "stored but lost before stabilizing."
