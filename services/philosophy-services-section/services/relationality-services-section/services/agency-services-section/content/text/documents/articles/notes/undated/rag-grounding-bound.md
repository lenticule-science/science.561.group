---
type: theorem
class: contemporary
status: informal
depends-on:
  - teaching/explanations/retrieval-augmented-generation.md
  - retrieval-failure-modes.md
see-also:
  - ../morphisms/retrieval.md
references:
  - references/lewis-rag2020.md
title: RAG grounding bound
description: For a RAG system that generates an answer conditioned on retrieved documents, the system's groundedness — the fraction of the answer's factual claims supported by the retrieved documents — is bounded above by the retrieval recall on the…
---

# RAG grounding bound

## Statement (informal)

For a RAG system that generates an answer conditioned on
retrieved documents, the system's *groundedness* — the
fraction of the answer's factual claims supported by the
retrieved documents — is bounded above by the *retrieval
recall* on the documents that contain the answer:

$$
P(\text{grounded answer}) \le P(\text{relevant doc in retrieved set}).
$$

When retrieval fails to surface the relevant document, the
generator either confabulates (ungrounded but fluent) or
declines (grounded by absence). Production LLMs typically
confabulate.

## The intuition

If the relevant fact is in document $D$, and $D$ is not
retrieved, the generator is in one of two situations:

1. The generator *knows* the fact from parametric memory and
   produces a grounded-by-weights answer (but cannot cite
   the document, since $D$ is not in context).
2. The generator does *not* know the fact, but typically
   produces a fluent answer anyway, drawing on related
   retrievals or pattern-completion. This answer is
   ungrounded.

For facts the generator does not have parametrically (which
is the use case RAG is designed for), the bound is tight:
grounded-with-citation requires the cited document in the
retrieved set.

## What this implies

- **Retrieval recall is the load-bearing metric.** Improving
  generator quality cannot raise grounding above the
  retriever's ceiling.
- **Hallucination defenses depend on retrieval.** A generator
  configured to "answer only from retrieved sources" defaults
  to "I don't know" when retrieval misses, which is
  user-visibly worse than confabulation. Most production
  systems compromise: confabulate but flag uncertainty.
- **Multi-hop questions amplify the bound.** A question
  requiring documents $D_1, D_2, D_3$ has groundedness
  bounded by $\prod_i P(D_i \in \text{retrieved set})$ —
  the joint recall, which is much smaller than any
  individual recall.

## What this does not imply

- The bound is on *grounded-by-citation* answers. It does
  not bound *correct* answers; the generator may answer
  correctly from parametric memory even when retrieval
  misses.
- The bound is for the generator that requires explicit
  citation. A generator that produces parametric answers
  with no citation discipline can produce more correct
  answers but no more grounded-by-citation ones.

## Mitigations

- **Improve retrieval recall.** Better embeddings, hybrid
  retrieval (vector + keyword), query rewriting,
  multi-query expansion.
- **Decompose multi-hop.** Iteratively retrieve as the
  generator works through subquestions.
- **Verify per-claim.** Each claim in the answer is
  separately checked against retrieved sources; unsupported
  claims are flagged or removed.
- **Improve refusal calibration.** Train the generator to
  decline when retrieval is poor — recall of "I don't know"
  is the system's groundedness floor.

## Status

The bound is informal — "groundedness" is not a single
crisp metric. But the structural result (generator quality
cannot rise above retriever quality on grounded-with-citation)
is widely used to allocate engineering investment between
retrieval and generation in RAG pipelines.
