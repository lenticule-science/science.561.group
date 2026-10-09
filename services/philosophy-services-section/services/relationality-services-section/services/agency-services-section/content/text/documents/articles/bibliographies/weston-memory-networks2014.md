---
type: reference
class: foundational
status: active
authors: ["Jason Weston", "Sumit Chopra", "Antoine Bordes"]
year: 2014
venue: "arXiv:1410.3916; ICLR 2015"
title: "Memory Networks"
description: Weston, J., Chopra, S., & Bordes, A.
---

# Weston, Chopra & Bordes 2014 — Memory Networks

Weston, J., Chopra, S., & Bordes, A. (2014). Memory Networks.
*arXiv:1410.3916*. (Also presented at ICLR 2015.)

The introduction of *memory networks*: neural architectures
augmented with an explicit external memory, with read and
write operations integrated into the network's training. The
paper demonstrates the architecture on question-answering
tasks, showing that the model can store and retrieve
information across long supporting-fact chains.

Memory networks (with Sukhbaatar et al.'s *End-to-End Memory
Networks* the next year) and Graves et al.'s *Neural Turing
Machine* (2014) together established the template for
*differentiable external memory* in deep learning. They were
later superseded by transformers (whose self-attention
implements content-addressed memory directly), but the design
pattern — *small parametric model + large external memory* —
re-emerges in [retrieval-augmented-generation](../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/content/artificial-intelligence/machine-learning/neural-network/language-models/agentic-systems/memory/archive/teaching/explanations/retrieval-augmented-generation.md).

Cited by: in the [the-rag-revolution](../notes/undated/the-rag-revolution.md)
narrative as the architectural ancestor of RAG.
