---
type: reference
class: contemporary
status: active
authors: ["Danijar Hafner", "Jurgis Pasukonis", "Jimmy Ba", "Timothy Lillicrap"]
year: 2023
venue: "arXiv preprint"
title: "Mastering Diverse Domains through World Models"
---

# Hafner et al. 2023 — DreamerV3

Hafner, D., Pasukonis, J., Ba, J., & Lillicrap, T. (2023).
Mastering Diverse Domains through World Models. *arXiv preprint
arXiv:2301.04104*.

Introduces DreamerV3 — a single algorithm with fixed
hyperparameters that achieves strong performance across diverse
domains (Atari, DMControl, Minecraft, ProcGen, Crafter) without
per-domain tuning. Key technical contributions: symlog
predictions, return normalization, and architectural
regularizations that stabilize training across reward scales.
Marks the field's transition from per-domain tuning to drop-in
algorithmic generality.

Cited by:
[dreamer-style-world-model](teaching/explanations/dreamer-style-world-model.md),
[model-based-rl](teaching/explanations/model-based-rl.md),
[model-learning](../morphisms/model-learning.md).
