---
type: reference
class: foundational
status: active
authors: ["Patrick Lewis", "Ethan Perez", "Aleksandra Piktus", "Fabio Petroni", "Vladimir Karpukhin", "Naman Goyal", "Heinrich Küttler", "Mike Lewis", "Wen-tau Yih", "Tim Rocktäschel", "Sebastian Riedel", "Douwe Kiela"]
year: 2020
venue: "NeurIPS 2020"
title: "Retrieval-Augmented Generation for Knowledge-Intensive NLP Tasks"
description: Lewis, P., Perez, E., Piktus, A., Petroni, F., Karpukhin, V., Goyal, N., Küttler, H., Lewis, M., Yih, W.-t., Rocktäschel, T., Riedel, S., & Kiela, D.
---

# Lewis et al. 2020 — RAG

Lewis, P., Perez, E., Piktus, A., Petroni, F., Karpukhin, V.,
Goyal, N., Küttler, H., Lewis, M., Yih, W.-t., Rocktäschel, T.,
Riedel, S., & Kiela, D. (2020). Retrieval-Augmented Generation
for Knowledge-Intensive NLP Tasks. *Advances in Neural
Information Processing Systems* 33.

The defining paper of *retrieval-augmented generation*. The
architecture pairs a dense retriever (DPR) with a generator
(BART), training them jointly so that the retriever surfaces
documents the generator can use. The paper demonstrates
strong performance on open-domain question answering,
fact verification, and other knowledge-intensive tasks,
*outperforming* parametric-only baselines.

The paper popularized the *separation of procedural from
factual knowledge* in LLM systems: the generator learns how
to reason and write; the retriever (with its external index)
holds the facts. This separation reshaped production LLM-
agent architecture (see
[the-rag-revolution](../notes/undated/the-rag-revolution.md)).

Cited by:
[retrieval-augmented-generation](../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/content/artificial-intelligence/machine-learning/neural-network/language-models/agentic-systems/memory/archive/teaching/explanations/retrieval-augmented-generation.md),
[embedding-index](../notes/undated/embedding-index.md),
[rag-grounding-bound](../notes/undated/rag-grounding-bound.md).
