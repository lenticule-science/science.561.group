---
type: concept
class: classical
status: active
depends-on: []
see-also:
  - episodic-memory.md
  - retrieval-augmented-generation.md
  - ../objects/memory-store.md
references:
  - references/tulving1972.md
---

# Semantic memory

**Semantic memory** is memory of *general facts and concepts*
decoupled from the specific occasions on which they were
acquired. The term is from Tulving (1972), who introduced it in
contrast to episodic memory (memory of specific events).

## What makes a memory semantic

A semantic memory has three structural features:

- **Generality.** It refers to a class or concept, not a
  specific instance. "Birds fly" is semantic; "I saw a robin
  yesterday" is episodic.
- **Context-decoupling.** The memory is not indexed by when
  or where it was acquired. The agent can use the fact
  "Paris is the capital of France" without remembering when
  it was learned.
- **Composability.** Semantic memories combine into inferences
  via reasoning chains: "Birds fly" + "Robins are birds" $\to$
  "Robins fly."

## Encoding and retrieval

Semantic memories are typically *not* encoded in a single
event; they crystallize across many episodes via a
generalization or consolidation process. Retrieval is
content-addressed: a query specifies the concept of interest,
and the store returns matching facts.

## Computational implementations

Semantic memory has been implemented across the AI stack:

- **Knowledge graphs** (Cyc, ConceptNet, Wikidata) store
  semantic facts as $(\text{subject}, \text{predicate}, \text{object})$
  triples.
- **Knowledge bases** with logical inference engines.
- **Distributed semantic representations** in connectionist
  models (word embeddings, distributional semantics).
- **Parametric knowledge in LLM weights** — the LLM
  "remembers" semantic facts through its training-induced
  weights, not through any explicit store.

## Parametric vs retrieval-based

A central design choice in modern AI:

- **Parametric** semantic memory is fast at inference (no
  external lookup) but expensive to update (requires
  retraining or fine-tuning) and prone to hallucination
  (cannot distinguish remembered from confabulated facts).
- **Retrieval-based** semantic memory (RAG) is slower at
  inference (requires retrieval) but cheap to update (just
  add to the index) and grounded (citations available).

The tradeoff is the substrate of [can-rag-replace-fine-tuning](questions/can-rag-replace-fine-tuning.md).

## Limits

Semantic memory in current AI systems is limited by:

- **Update cost.** Parametric semantic memory cannot be
  edited locally without risk of catastrophic side effects.
- **Provenance loss.** Both parametric and embedding-based
  semantic stores typically discard the source of each fact,
  hindering verification.
- **Inconsistency.** Multi-source semantic stores accumulate
  contradictions; resolving them requires explicit machinery
  (truth maintenance, source-trustworthiness models).
