---
title: Reinforcement Learning from Human Feedback
description: Reinforcement learning from human feedback (RLHF) is the alignment technique, originating in Christiano et al.'s peer-reviewed 2017 NeurIPS paper and carried through Stiennon et al. (2020) and Ouyang et al.'s InstructGPT (2022, both NeurIPS), of fitting a reward model to human pairwise preference comparisons and optimizing a policy against it, since extended by the arXiv-tier Constitutional AI (Bai et al. 2022) and simplified by the peer-reviewed Direct Preference Optimization (Rafailov et al. 2023, NeurIPS).
date-created: 2026-08-22
aliases: [RLHF, reinforcement learning from human preferences]
defines: reinforcement learning from human feedback
instance-of: training-method
---

Reinforcement learning from human feedback trains a model in two stages: a reward model is fit to human pairwise comparisons between candidate outputs, and a policy model is then optimized, typically by PPO, to maximize that learned reward.
The technique originates in [Christiano et al., "Deep Reinforcement Learning from Human Preferences" (NeurIPS 2017)](https://arxiv.org/abs/1706.03741), demonstrated on Atari and simulated-robotics control rather than language.

[Stiennon et al., "Learning to Summarize from Human Feedback" (NeurIPS 2020)](https://arxiv.org/abs/2009.01325) carried the recipe into open-ended text generation, and [Ouyang et al., "Training Language Models to Follow Instructions with Human Feedback" (NeurIPS 2022)](https://arxiv.org/abs/2203.02155) — the InstructGPT paper — scaled it to GPT-3-class models, establishing RLHF as the default alignment recipe for production chat models.
Two later developments sit at different evidentiary tiers: [Bai et al., "Constitutional AI: Harmlessness from AI Feedback" (Anthropic, 2022)](https://arxiv.org/abs/2212.08073) replaces RLHF's human-comparison step with AI-generated critiques scored against written principles, and remains, as far as this library has verified, an arXiv preprint / industry-lab technical report rather than a peer-reviewed publication; [Rafailov et al., "Direct Preference Optimization" (NeurIPS 2023)](https://arxiv.org/abs/2305.18290) is peer-reviewed and shows the RLHF objective's optimal policy can be substituted directly into the preference loss, removing the explicit reward model and PPO loop.

See the [study of foundation-model science](../../documents/articles/notes/2026/08/22/2026-08-22-note-on-the-study-of-foundation-model-science.md) for the full lineage and tier labeling.
