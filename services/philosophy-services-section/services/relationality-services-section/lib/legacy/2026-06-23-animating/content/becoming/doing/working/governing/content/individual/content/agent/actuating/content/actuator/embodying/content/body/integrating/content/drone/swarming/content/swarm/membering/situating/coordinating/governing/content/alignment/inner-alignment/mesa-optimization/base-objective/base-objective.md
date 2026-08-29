---
type: object
class: defined-structure
status: stable
depends-on:
  - teaching/explanations/outer-alignment.md
see-also:
  - mesa-objective.md
  - training-distribution.md
references:
  - references/hubinger-mesa2019.md
---

# Base objective

The **base objective** $L_{\text{base}}$ is the function the training process explicitly optimizes against — the loss function for supervised learning, the reward function for RL, the negative log-likelihood plus KL-penalty for RLHF.

## Formal role

In the Hubinger et al. (2019) framing of mesa-optimization, the base optimizer (gradient descent) selects model parameters $\theta^*$ to minimize $\mathbb{E}_{(x,y) \sim D_{\text{train}}}[L_{\text{base}}(\theta, x, y)]$.
The **base objective** is $L_{\text{base}}$ itself, distinct from:

- The **mesa-objective** $L_{\text{mesa}}$ that the trained model pursues internally (if it is a [mesa-optimizer](teaching/explanations/mesa-optimization.md)).
- The **designer's intended goal** $G^*$ that $L_{\text{base}}$ was supposed to encode.

The four objects $L_{\text{base}}$, $L_{\text{mesa}}$, $G^*$, and the training distribution $D_{\text{train}}$ together determine the alignment situation; equality of any pair is a non-trivial property.

## Examples

**Supervised classification.** Cross-entropy loss against human-labeled examples.
Outer-alignment failure: labels are wrong, biased, or systematically miss the underlying task structure.

**Standard RL.** Programmatically-specified reward function (game score, sensor readings).
Outer-alignment failure: reward function admits exploits the designer didn't anticipate ([specification gaming](teaching/explanations/specification-gaming.md)).

**RLHF.** Learned [reward model](../../reinforcement-learning/objects/reward-model.md) $\hat{r}_\phi$ trained on human preference comparisons, plus a KL-penalty against a reference policy.
Outer-alignment failure: $\hat{r}_\phi$ approximates human preferences imperfectly; the penalty bounds but does not eliminate exploitation.

**Constitutional AI.** Reward model trained against AI-generated critique informed by written principles.
Outer-alignment failure: principles are necessarily under-specified; AI critique inherits the underlying model's biases.

## Why this is a distinguished object

Engineering interventions on alignment generally target $L_{\text{base}}$: "fix the reward function," "improve the reward model," "add a constraint."
These are interventions on the base objective.
They address [outer alignment](teaching/explanations/outer-alignment.md) failures.

Interventions on $L_{\text{mesa}}$ (interpretability, deception elicitation, mechanistic edits) are far less mature; few production techniques exist for inspecting or editing a learned mesa-objective.

The asymmetry — base objective is engineerable, mesa-objective is not — is a structural feature of the current technical situation and a reason inner-alignment is the harder problem.
