---
name: Grounded Generation
description: The pattern of conditioning language-model output on retrieved evidence so its claims are checkable against a source, established architecturally by retrieval-augmented generation (Lewis et al., NeurIPS 2020) and evaluated for citation correctness by ALCE (Gao et al., EMNLP 2023) and the Attributable to Identified Sources framework (Rashkin et al., Computational Linguistics 2023), whose own human-annotation-based reference implementation signals that citation-correctness checking is not yet a solved automated problem.
date-created: 2026-08-22
aliases: ["retrieval-grounded generation", "citation-grounded generation", "RAG", "retrieval-augmented generation"]
instance-of: systems-pattern
---

Grounded generation is text generation conditioned on retrieved evidence, so that the generated claims can in principle be checked against the retrieved sources rather than against the model's parameters alone.
Lewis et al. established the architecture: a fine-tuned seq2seq model (parametric memory) conditioned on passages returned by a learned neural retriever over a dense-vector index (non-parametric memory), comparing a formulation that fixes retrieved passages across a whole generated sequence against one that can vary passages per generated token.
Source: [Lewis et al., "Retrieval-Augmented Generation for Knowledge-Intensive NLP Tasks," NeurIPS 2020](https://proceedings.neurips.cc/paper/2020/hash/6b493230205f780e1bc26945df7481e5-Abstract.html) [corrected: linked to the primary NeurIPS proceedings page rather than a dblp bibliography record].

Conditioning on retrieved evidence does not by itself guarantee that generated text correctly cites what it was conditioned on, which is why a distinct citation-evaluation literature exists.
Gao et al.'s ALCE benchmark scores LLM output on fluency, correctness, and citation quality across three datasets, finding even the strongest tested systems lack complete citation support roughly half the time on the ELI5 subset.
Source: [Gao et al., "Enabling Large Language Models to Generate Text with Citations," EMNLP 2023](https://aclanthology.org/2023.emnlp-main.398/).
Rashkin et al.'s Attributable to Identified Sources (AIS) framework stipulates that NLG output about the external world should be verifiable against an independently provided source, and operationalizes this through a two-stage human-annotation pipeline validated across conversational QA, summarization, and table-to-text tasks.
Source: [Rashkin et al., "Measuring Attribution in Natural Language Generation Models," Computational Linguistics 49(4), 2023](https://aclanthology.org/2023.cl-4.2/).
That AIS's own reference implementation is human-annotated, not a standalone automated classifier, is itself evidence that citation-correctness checking at generation time remains only partially automatable — relevant to any claim-infrastructure gate that would rely on an automated citation check as a substitute for review rather than a supplement to it.

See the fuller discussion in the [study of claim extraction and grounded generation engineering](../../documents/articles/notes/2026/08/22/2026-08-22-note-on-the-study-of-claim-extraction-and-grounded-generation-engineering.md), Section 5.
