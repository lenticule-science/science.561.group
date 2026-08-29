---
title: Calibration
description: The property of a model's confidence scores matching its actual accuracy, established as a systematic weakness of modern deep classifiers by Guo et al. (ICML 2017, peer-reviewed) and extended to LLM self-knowledge — including a self-assessed P(True) protocol for open-ended generation — by Kadavath et al. (Anthropic, 2022, industry-lab arXiv preprint), a tier split this glossary keeps explicit rather than treating the two results as equally settled.
date-created: 2026-08-22
aliases: ["model calibration", "confidence calibration", "self-knowledge"]
defines: calibration
instance-of: evaluation-method
---

Calibration is the match between a model's stated or implied confidence and its actual correctness rate: a well-calibrated model that says it is 70% confident should be right about 70% of the time across many such predictions, neither systematically over- nor under-confident.
Guo et al. show, for pre-LLM deep classifiers, that modern neural networks are typically overconfident despite higher accuracy than older, smaller networks, identify depth, width, weight decay, and batch normalization as architectural drivers of the effect, and show a simple post-hoc temperature-scaling correction recovers good calibration cheaply.
Source: [Guo, Pleiss, Sun, and Weinberger, "On Calibration of Modern Neural Networks," ICML 2017](https://proceedings.mlr.press/v70/guo17a/guo17a.pdf).

Kadavath et al. extend the question to LLM self-knowledge specifically: larger models are reasonably well calibrated on multiple-choice and true/false formats, and for open-ended generation — where no natural confidence score exists — they introduce a self-evaluation protocol asking a model to assess "P(True)," the probability its own previously generated answer is correct, finding this self-assessed probability carries genuine, if imperfect, calibration signal that improves somewhat with scale.
Source: [Kadavath et al., "Language Models (Mostly) Know What They Know," Anthropic, arXiv:2207.05221, 2022](https://arxiv.org/abs/2207.05221).

The tier gap between these two results is itself the load-bearing fact for this library's practice: Guo et al.'s finding is peer-reviewed and about pre-LLM classifiers; Kadavath et al.'s extension to LLM self-knowledge is an industry-lab preprint this study found no independent peer-reviewed replication of, so "the model can partially predict its own errors" should be cited with that qualification rather than as settled science.

See the fuller discussion in the [study of LLM evaluation and reliability science](../../documents/articles/notes/2026/08/22/2026-08-22-note-on-the-study-of-llm-evaluation-and-reliability-science.md), Section 6.
