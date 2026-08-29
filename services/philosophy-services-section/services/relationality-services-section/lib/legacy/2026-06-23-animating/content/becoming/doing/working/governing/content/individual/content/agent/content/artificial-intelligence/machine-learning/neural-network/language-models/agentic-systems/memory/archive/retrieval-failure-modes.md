---
type: theorem
class: classical
status: informal
depends-on:
  - ../morphisms/retrieval.md
see-also:
  - rag-grounding-bound.md
references: []
---

# Retrieval failure modes

## Statement (informal)

Retrieval from any approximate memory system can fail in
exactly three structurally distinct ways:

1. **Miss.** The query has a relevant target in the store,
   but the retrieval returns no item or returns only
   irrelevant items.
2. **Intrusion.** The retrieval returns an item the system
   scores as highly relevant, but it is not the relevant
   target — a false positive with high confidence.
3. **Partial reconstruction.** The retrieval returns
   multiple items that are individually partially relevant;
   downstream consumers (a generator, a reasoner) conflate
   them into a *plausible composite* matching no single
   stored item.

Each failure mode has a distinct empirical signature, distinct
mitigations, and distinct downstream consequences.

## Why exactly three

The three modes correspond to the three ways the relationship
between query, target, and retrieved set can break:

- *Target not in retrieved set, no false positive*: miss.
- *Target not in retrieved set, false positive present*:
  intrusion.
- *Target in retrieved set but conflated with others*:
  partial reconstruction.

A retrieval that returns exactly the target with no
extraneous items is the success case; everything else falls
in one of the three failure modes.

## Signatures

- **Miss** signatures: low retrieval scores across the
  returned set; downstream consumer reports "I don't know"
  or refuses to answer.
- **Intrusion** signatures: high retrieval score on a single
  item; downstream consumer answers confidently but
  incorrectly.
- **Partial reconstruction** signatures: moderate scores
  across multiple items; downstream consumer answers
  plausibly but with mixed details (this is the dominant
  RAG failure mode in production).

## Mitigations

- **Miss:** broaden the retriever (more candidates, hybrid
  retrieval combining vector + keyword), improve query
  rewriting, check for index gaps.
- **Intrusion:** add a reranker, raise the score threshold
  for "confident answer," surface citations to enable
  user-side verification.
- **Partial reconstruction:** chunk documents finer (so each
  retrieved chunk is more topically homogeneous), require
  the consumer to cite specific chunks per claim, add
  per-claim verification passes.

The three failures require *different* engineering
investments; conflating them is the central architectural
mistake in RAG systems.

## In LLM agents

Partial reconstruction is the dominant and most-pernicious
failure mode for LLM-based RAG: the LLM is good at producing
coherent text from disparate inputs and will fluently
combine details across retrieved documents into a single
plausible answer that does not match any document. The user
cannot tell from the surface text alone that the synthesis
is unsupported.

Mitigation requires consumer-side discipline (cite each
claim, verify per-claim against retrieved sources) rather
than retrieval-side improvements alone.

## Status

The three-way taxonomy is stable across substrates (vector
RAG, classical IR, distributed neural memory). Quantitative
forms — what fraction of retrievals fail in each mode at a
given system configuration — are workload-specific and
require empirical estimation.
