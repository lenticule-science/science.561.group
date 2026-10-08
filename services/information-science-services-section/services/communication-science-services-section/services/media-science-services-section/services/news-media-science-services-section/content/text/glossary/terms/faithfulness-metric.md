---
name: Faithfulness Metric
description: An automated score for whether generated text is supported by its source or reference material, exemplified by FActScore's atomic-fact decomposition (Min et al., EMNLP 2023) and QAFactEval's question-answering-based consistency check (Fabbri et al., NAACL 2022), both validated on summarization or biography-generation tasks and both, per the ACM Computing Surveys hallucination survey (Ji et al. 2023), structurally limited to catching intrinsic rather than extrinsic hallucination.
date-created: 2026-08-22
aliases: ["factual consistency metric", "factuality metric", "faithfulness evaluation"]
instance-of: evaluation-metric
---

A faithfulness metric scores whether a generated text's claims are supported by a designated source or reference, as opposed to scoring fluency or overlap with a gold text.
FActScore decomposes long-form generation into atomic facts — the smallest single-proposition units — then validates each against a reference knowledge source, reporting the supported fraction; its automated estimator (retrieval plus a strong LM) reaches under 2% error against human judgment on biography generation.
Source: [Min et al., "FActScore: Fine-grained Atomic Evaluation of Factual Precision in Long Form Text Generation," EMNLP 2023](https://aclanthology.org/2023.emnlp-main.741/).
QAFactEval instead generates questions from the summary, answers them against both the summary and the source, and scores consistency by answer overlap; Fabbri et al. show that careful choice of its sub-components yields a 14% average improvement over prior QA-based metrics on the SummaC benchmark and outperforms the best entailment-based metric tested.
Source: [Fabbri et al., "QAFactEval: Improved QA-Based Factual Consistency Evaluation for Summarization," NAACL 2022](https://aclanthology.org/2022.naacl-main.187/).

Both metrics are reference-conditioned, and both catch what Ji et al.'s survey terms intrinsic hallucination — output that contradicts the source.
Source: [Ji et al., "Survey of Hallucination in Natural Language Generation," ACM Computing Surveys 55(12), Article 248, 2023](https://dl.acm.org/doi/10.1145/3571730).
Neither is built to catch extrinsic hallucination — a claim the source neither confirms nor contradicts — which is the harder failure mode for a claim-infrastructure gate, since there is by construction no source span to check the claim against; this is also why neither metric has a published newsroom-prose evaluation, only summarization- and biography-generation validation.

See the fuller discussion in the [study of claim extraction and grounded generation engineering](../../documents/articles/notes/2026/08/22/2026-08-22-note-on-the-study-of-claim-extraction-and-grounded-generation-engineering.md), Sections 6 and 7.
