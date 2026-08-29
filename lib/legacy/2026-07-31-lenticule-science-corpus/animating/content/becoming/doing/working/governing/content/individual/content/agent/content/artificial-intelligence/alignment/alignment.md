---
title: "AI Alignment"
description: "The problem of ensuring that AI systems pursue goals that are actually beneficial — that what the system optimizes for corresponds to what humans intend and value."
keywords: ["ai-alignment", "artificial-intelligence", "safety", "rlhf"]
---

# AI Alignment

Alignment is the problem of making AI systems do what we actually want, not just what we specified. The gap between what we specify and what we want is where most alignment failure lives: a reward function that captures our proxy metric but not our actual goal, an instruction-following model that follows instructions in ways we didn't anticipate, an optimizer that finds a shortcut that satisfies the formal criterion while violating the intent.

The classical formulation (Norbert Wiener, restated): the risk is not a malevolent AI but a perfectly obedient one — one that precisely optimizes a goal that turned out to be specified wrong. This is Goodhart's Law applied to AI: when a measure becomes a target, it ceases to be a good measure.

Modern alignment work concentrates on several problems:

**Reward modeling** — how to specify what we want in a form a learning system can optimize. Direct specification (write down the reward function) fails for complex human values. RLHF (reinforcement learning from human feedback) trains a proxy reward model from human preferences — which shifts the problem to the reliability of those preferences and the fidelity of the learned proxy.

**Stability under optimization** — does the system remain aligned as it becomes more capable? A system aligned at one capability level may not be aligned at a higher one if the alignment depends on the system not being able to find certain strategies.

**Mesa-optimization** — when a trained model internally runs an optimizer that may have different objectives from the outer training objective. The inner optimizer (mesa-optimizer) need not be aligned with the outer goal even if the training process succeeded by its own metrics.

**Scalable oversight** — how humans remain in meaningful control of systems that operate faster and in domains where humans cannot directly evaluate outputs. Debate, amplification, and interpretability research are all approaches to this problem.

The 561 Group's approach treats alignment as a governance problem as much as a technical one. See [social-sciences/politics](../../../social-sciences/politics/) and the work on meaningful human control in the agentic-systems domain.
