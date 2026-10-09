---
name: In-Context Learning
description: In-context learning is a large language model's demonstrated ability, documented in Brown et al.'s peer-reviewed GPT-3 paper (NeurIPS 2020), to adapt its behavior to a task from examples placed in its prompt without any gradient update to its weights, a phenomenon whose mechanistic basis remains actively contested between the induction-head account and newer implicit-weight-update accounts.
date-created: 2026-08-22
aliases: [few-shot prompting, ICL]
instance-of: research-finding
---

In-context learning names the observation that a language model, shown a small number of task examples within its prompt at inference time, adjusts its subsequent output to follow the demonstrated pattern — without any parameter update.
The phenomenon was put into wide circulation by [Brown et al., "Language Models are Few-Shot Learners" (NeurIPS 2020)](https://arxiv.org/abs/2005.14165), the GPT-3 paper, which documented the effect at scale but did not explain it mechanistically.

Two accounts of the underlying mechanism exist and have not, as far as this library has verified, been reconciled with each other.
[Olsson et al., "In-context Learning and Induction Heads" (Anthropic, Transformer Circuits Thread, 2022)](https://arxiv.org/abs/2209.11895) — an industry-lab technical report, not externally peer-reviewed — argues that attention-head pairs called induction heads, which copy whatever token previously followed the current one, account for much of the effect, and that their formation coincides with a measurable phase change during training.
[Dherin et al., "Learning without Training: The Implicit Dynamics of In-Context Learning" (Google Research, 2025)](https://arxiv.org/abs/2507.16003) — an arXiv preprint — instead argues that stacking self-attention with an MLP lets context implicitly apply a low-rank update to the MLP's effective weights.

See the [study of foundation-model science](../../documents/articles/notes/2026/08/22/2026-08-22-note-on-the-study-of-foundation-model-science.md) for the fuller tier discussion, and this section's parent triage memo on the relational dynamics of in-context learning for an application of the Dherin account to prompt design, a claim the study note marks unverified on causal effectiveness.
