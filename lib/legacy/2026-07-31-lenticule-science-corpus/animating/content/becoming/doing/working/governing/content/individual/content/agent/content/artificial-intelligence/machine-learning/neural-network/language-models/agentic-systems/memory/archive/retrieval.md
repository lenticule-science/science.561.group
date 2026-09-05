---
type: morphism
class: classical
status: active
depends-on:
  - ../objects/memory-store.md
  - ../objects/retrieval-key.md
see-also:
  - encoding.md
  - ../theorems/retrieval-failure-modes.md
  - ../theorems/rag-grounding-bound.md
references: []
---

# Retrieval

**Retrieval** is the query-driven extraction of memory traces
from a [memory-store](../objects/memory-store.md). A query
(formally a [retrieval-key](../objects/retrieval-key.md)) is
matched against stored items, and matching items (possibly
with similarity scores) are returned.

## Retrieval as approximate matching

Outside of exact-key databases, retrieval is *approximate*:

- **Vector retrieval** returns nearest neighbors in embedding
  space — which may or may not be the most semantically
  relevant items.
- **Pattern-completion retrieval** returns the stored
  pattern best matching a partial query — which may
  partially confabulate from related stored patterns.
- **Attention-based retrieval** in LLMs computes a soft
  weighted average of value vectors — neither item-precise
  nor confidence-calibrated.

The approximate nature of retrieval is the substrate of
several failure modes:
[retrieval-failure-modes](../theorems/retrieval-failure-modes.md).

## What can be retrieved

Retrieval is bounded by:

- **What was encoded.** Items not encoded cannot be retrieved.
- **The indexing structure.** Items not indexed by a key
  matching the query are not findable.
- **The query's quality.** A query that does not specify the
  target distinctly returns ambiguous results.
- **Ranker capacity.** The system's ability to score
  candidates against the query.

## Retrieval pipelines

In production systems, retrieval is typically a multi-stage
pipeline:

1. **Embed** the query.
2. **Approximate-nearest-neighbor lookup** to get $k$
   candidates ($k$ in the hundreds).
3. **Rerank** by a more expensive model (cross-encoder,
   LLM).
4. **Filter** by metadata (date, source, access control).
5. **Return** top items to the consumer.

Each stage is a tradeoff between recall and cost. Pipeline
tuning is the bulk of practical RAG engineering.

## Retrieval failures

The three-way taxonomy in
[retrieval-failure-modes](../theorems/retrieval-failure-modes.md):

- **Miss.** The relevant item was not returned.
- **Intrusion.** A wrong item was returned with high
  confidence.
- **Partial reconstruction.** Multiple items were returned
  and conflated, producing a plausible composite that
  matches no single stored fact.

LLM-augmented retrieval (RAG) is particularly prone to the
last failure mode: when retrieval returns related but not
exactly relevant documents, the LLM fluent-completes a
plausible answer that mixes details across documents.

## In agent systems

Retrieval is the operational core of memory in agent systems.
Most "agent memory" use cases reduce to: at the right moment,
return the right past item to the agent's current
deliberation. The cost of getting this wrong is hallucination,
factual drift, or simple forgetting. Most production agent
debugging time goes into retrieval pipeline tuning.
