---
type: concept
class: semantic-anchor
status: stable
see-also:
  - reward-hypothesis.md
  - ../objects/reward-model.md
  - ../theorems/reward-hacking-inevitability.md
  - ../theorems/rlhf-overoptimization.md
  - teaching/explanations/from-bellman-to-rlhf.md
  - questions/can-rlhf-be-made-robust-to-overoptimization.md
references:
  - references/christiano-rlhf2017.md
  - references/gao-overoptimization2023.md
  - ../../agents/_index.md
---

# RLHF

**Reinforcement learning from human feedback** (RLHF) is the dominant
2024–2026 paradigm for fine-tuning large language models for assistant
behavior. The pipeline has three stages:

1. **Supervised fine-tuning (SFT).** Start from a pretrained base
   model. Fine-tune on human-written demonstrations of the desired
   assistant behavior. The result is the SFT policy $\pi_{\text{SFT}}$.

2. **Reward-model training.** Collect human preference comparisons:
   for each prompt, ask a human to choose between two model
   completions. Train a [reward model](../objects/reward-model.md)
   $\hat{r}_\phi$ to predict the preferred completion's score. The
   standard parameterization is the Bradley–Terry model.

3. **RL fine-tuning.** Use the reward model as a reward signal in a
   policy-gradient algorithm (PPO is canonical) to fine-tune the SFT
   policy. The objective typically includes a KL-divergence penalty
   against $\pi_{\text{SFT}}$ to prevent the policy from drifting too
   far. The result is the RLHF policy $\pi_{\text{RLHF}}$.

## Why RLHF works

RLHF lets the policy explore beyond the support of human demonstrations.
The SFT policy is bounded above by the demonstrators' quality; the
RL stage can find policies that no demonstrator wrote, by following
the gradient of a learned reward signal.

## Why RLHF is fragile

The reward signal is a *learned proxy*, not the actual human-preference
distribution. The
[reward-hacking-inevitability](../theorems/reward-hacking-inevitability.md)
theorem applies: optimizing strongly against a proxy that is not the
true objective inevitably finds solutions that score well under the
proxy and badly under the true objective.
[rlhf-overoptimization](../theorems/rlhf-overoptimization.md)
makes the same point quantitatively, citing Gao et al. (2023): true
preference initially rises with KL-budget then declines, with the peak
KL-budget shrinking as the reward model gets more aggressively
optimized.

## Variants

**Direct preference optimization (DPO; Rafailov et al. 2023)** skips
explicit reward-model training, deriving an equivalent loss directly
from the preference data. Avoids one stage of the pipeline but does not
escape the underlying reward-hacking pathology.

**Constitutional AI (Bai et al. 2022)** uses model-generated
critiques in place of some human feedback. Reduces labeling cost
but introduces additional proxy: the critique model is a learned
proxy for the human evaluator.

**Reinforcement learning from AI feedback (RLAIF)** generalizes the
constitutional-AI move: an AI system replaces the human in the
preference-comparison loop. Makes the proxy chain longer.

## Position in the agents theory

The dominant LLMs powering deployed [agentic systems](../../agents/_index.md)
in 2026 are RLHF-trained. The pathologies of RLHF therefore propagate
into the agents theory: an orchestrated multi-agent system whose nodes
are RLHF-trained LLMs inherits the proxy-reward pathologies of its
training pipeline at every node. This is the mechanism by which
reinforcement-learning theory becomes load-bearing for the agents
theory even though the agents theory does not itself describe a
reinforcement-learning loop at deployment time.
