---
name: Red-Teaming (Language Models)
description: The practice of deliberately probing a language model for harmful, unsafe, or policy-violating outputs before or after deployment, established as an automated (model-attacking-model) method by Perez et al. (EMNLP 2022, peer-reviewed) and studied at larger human-red-team scale, with a reported scaling-behavior finding not yet independently replicated, by Ganguli et al. (Anthropic, 2022, industry-lab arXiv preprint), with universal adversarial suffixes (Zou et al., 2023, arXiv preprint) as the sharpest and most mechanistic anchor for the closely related jailbreak-taxonomy literature.
date-created: 2026-08-22
aliases: ["red teaming", "adversarial testing", "jailbreaking"]
instance-of: evaluation-method
---

Red-teaming a language model means deliberately searching for inputs that make it produce harmful, disallowed, or otherwise undesired output, as a check performed before or alongside deployment rather than relying only on a model's trained-in refusals holding up unattacked.
Perez et al. show an LLM can itself generate the test cases used to red-team a target LLM — offensive language, private-information leakage, and other undesired behaviors — at a scale and diversity human annotators writing test cases by hand cannot match, establishing "use a model to attack a model" as a viable automated method rather than a purely manual one.
Source: [Perez et al., "Red Teaming Language Models with Language Models," EMNLP 2022](https://aclanthology.org/2022.emnlp-main.225/).

Ganguli et al. report a large human-red-team program at Anthropic — roughly 38,900 attacks against models varying in size and amount of RLHF training — and find that RLHF-trained models became harder to red-team as scale increased, a result the paper itself frames as running against a naive expectation that larger models would simply be easier targets by virtue of greater capability.
Source: [Ganguli et al., "Red Teaming Language Models to Reduce Harms: Methods, Scaling Behaviors, and Lessons Learned," Anthropic, arXiv:2209.07858, 2022](https://arxiv.org/abs/2209.07858).
That scaling claim is single-lab, single-pipeline evidence this study found no independent cross-lab replication of, and it is carried forward as an open gap rather than treated as a settled property of RLHF in general.

A closely related jailbreak-taxonomy literature studies specific attack mechanisms rather than red-teaming as a general practice; its sharpest anchor is Zou et al.'s universal adversarial suffix, an optimization procedure (greedy coordinate gradient search) that appends a suffix to a harmful prompt and transfers — inducing objectionable output — even against closed commercial systems it was never optimized against.
Source: [Zou, Wang, Carlini, Nasr, Kolter, and Fredrikson, "Universal and Transferable Adversarial Attacks on Aligned Language Models," arXiv:2307.15043, 2023](https://arxiv.org/abs/2307.15043).
This result is arXiv-preprint tier, not peer-reviewed as of this glossary entry's verification, despite being widely cited as foundational.

See the fuller discussion in the [study of LLM evaluation and reliability science](../../documents/articles/notes/2026/08/22/2026-08-22-note-on-the-study-of-llm-evaluation-and-reliability-science.md), Sections 7–8.
