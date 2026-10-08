---
name: LLM-as-Judge
description: The practice of using a strong language model to score or compare other language models' open-ended outputs in place of exhaustive human evaluation, validated for open-ended chat by MT-Bench and Chatbot Arena (Zheng et al., NeurIPS 2023) at above 80% agreement with human preference, but documented in the same paper to carry position, verbosity, and self-enhancement biases, with self-preference specifically isolated and shown to correlate with a judge's own self-recognition ability by Panickssery et al. (NeurIPS 2024).
date-created: 2026-08-22
aliases: ["LLM judge", "model-as-judge", "AI judge", "automated judge"]
instance-of: evaluation-method
---

LLM-as-judge is the use of a language model, typically a strong general-purpose one, to evaluate the quality of another model's (or the same model's) free-form output — scoring a single response, or picking a winner between a pair of responses — as a scalable substitute for exhaustive human annotation.
Zheng et al. validate the approach against two purpose-built resources: MT-Bench, an 80-question multi-turn instruction-following benchmark, and Chatbot Arena, a crowdsourced platform where human users blind-vote between anonymized model pairs; they report GPT-4-as-judge agreement with human preference above 80%, comparable to typical human-human agreement.
Source: [Zheng et al., "Judging LLM-as-a-Judge with MT-Bench and Chatbot Arena," NeurIPS 2023 Datasets and Benchmarks Track](https://papers.nips.cc/paper_files/paper/2023/hash/91f18a1287b398d378ef22505bf41832-Abstract-Datasets_and_Benchmarks.html).

The same paper documents three systematic judge biases: position bias (favoring whichever response is shown first or second, independent of quality), verbosity bias (favoring longer responses regardless of whether length adds correctness or helpfulness), and an early framing of self-enhancement bias, later isolated more precisely as self-preference bias by Panickssery et al., who show LLM judges score their own generations higher than human-quality-matched alternatives and establish a linear correlation between a model's ability to recognize its own output and how strongly it prefers that output — a causal mechanism, not merely a correlation, demonstrated through controlled fine-tuning experiments that manipulate self-recognition ability directly.
Source: [Panickssery, Bowman, and Feng, "LLM Evaluators Recognize and Favor Their Own Generations," NeurIPS 2024](https://proceedings.neurips.cc/paper_files/paper/2024/hash/7f1f0218e45f5414c79c0679633e47bc-Abstract-Conference.html).

For any pipeline that would use an LLM judge to gate another LLM's output — including this library's own editorial-gate designs — the self-preference finding means a judge sharing model lineage with the system it is grading cannot be treated as an independent check, and position/verbosity biases mean raw judge scores need position-swapping and length-normalization before they are trustworthy even between unrelated models.

See the fuller discussion in the [study of LLM evaluation and reliability science](../../documents/articles/notes/2026/08/22/2026-08-22-note-on-the-study-of-llm-evaluation-and-reliability-science.md), Sections 4–5.
