---
type: object
class: classical
status: active
depends-on:
  - memory-store.md
see-also:
  - ../morphisms/encoding.md
  - ../morphisms/forgetting.md
references: []
title: Memory trace
description: A memory trace is an individual stored item in a memory-store.
---

# Memory trace

A **memory trace** is an individual stored item in a
[memory-store](memory-store.md). It can be:

- A *symbolic record* (a database row, a knowledge-graph
  triple).
- A *vector* (an embedding in a learned representation
  space).
- A *distributed pattern* (a particular activation vector in
  a neural net's representation, in the cognitive-psychology
  reading of distributed memory).
- An *episode* (a tuple containing observation, action,
  reward, next-state).

## Properties of a trace

A useful memory trace has:

- **Content.** The information itself.
- **Index keys.** Fields by which the trace is retrievable.
- **Metadata.** Provenance, timestamp, salience, source.
- **Decay parameters** (in decay-aware stores). When was it
  last accessed; what is its current strength.

## Encoding

A trace is *encoded* when it is created and inserted into the
store. Encoding is rarely a faithful copy of the input:

- For symbolic stores, encoding involves schema mapping (which
  fields of the input go where).
- For vector stores, encoding is the application of an
  embedding model. Two different embedding models produce
  incomparable traces of the same input.
- For neural distributed memory, encoding is determined by
  the network's update rule under exposure to the input.

## Retrieval

A trace is *retrieved* when a query matches it. Retrieval can
be:

- **Exact** (hash, SQL where-clause).
- **Pattern-match** (regular expression, graph pattern).
- **Approximate-nearest-neighbor** (vector cosine or
  Euclidean distance to query).
- **Pattern-completion** (in distributed neural memory: a
  partial input cues completion to a stored pattern).

## Why traces are not perfect copies

A common error in talking about memory is to treat traces as
faithful copies of the original input. They are not:

- Symbolic traces drop information not in the schema.
- Vector traces compress information into the dimensionality
  of the embedding space, losing detail.
- Distributed traces interfere with one another, blurring as
  more are stored. See
  [memory-superposition-collapse](memory-superposition-collapse.md).

The lossiness of encoding is a substantive property of any
memory architecture, not an implementation detail.
