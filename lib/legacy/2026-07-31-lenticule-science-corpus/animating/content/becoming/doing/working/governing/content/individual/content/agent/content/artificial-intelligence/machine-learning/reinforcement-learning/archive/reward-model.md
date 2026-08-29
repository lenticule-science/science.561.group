---
type: object
class: defined-structure
status: stable
depends-on:
  - teaching/explanations/rlhf.md
see-also:
  - ../theorems/reward-hacking-inevitability.md
  - ../theorems/rlhf-overoptimization.md
  - questions/can-rlhf-be-made-robust-to-overoptimization.md
references:
  - references/christiano-rlhf2017.md
  - references/gao-overoptimization2023.md
  - references/skalse-reward-hacking2022.md
---

# Reward model

A **reward model** is a parameterized function $\hat{r}_\phi : X \to
\mathbb{R}$ trained to approximate a reward signal $r^*$ that is not
directly available — typically because $r^*$ encodes human preferences
that have not been specified analytically. The input space $X$ may be
$S \times A$ (state-action), $X \times Y$ (prompt-completion), or a
trajectory.

## Training data

The standard training data is **preference comparisons**: triples
$(x, y_w, y_l)$ where, given context $x$, the human (or AI judge)
preferred $y_w$ over $y_l$. Under the **Bradley–Terry model** the
preference probability is assumed to be

$$\Pr(y_w \succ y_l \mid x) = \sigma(\hat{r}_\phi(x, y_w) - \hat{r}_\phi(x, y_l))$$

with $\sigma$ the logistic function. The reward model is fit by
maximum likelihood on the preference dataset. The result is a scalar
function $\hat{r}_\phi$ whose *differences* are calibrated to
preference probabilities; absolute scale is unidentified.

## Use in [RLHF](teaching/explanations/rlhf.md)

After training, $\hat{r}_\phi$ is frozen and used as the reward signal
in policy optimization. The policy is fine-tuned by PPO (or variants)
to maximize $\mathbb{E}_{x, y \sim \pi_\theta}[\hat{r}_\phi(x, y)] -
\beta \cdot \mathrm{KL}(\pi_\theta \| \pi_{\text{ref}})$, where the KL
penalty against a reference policy (typically the SFT model) limits
drift.

## Pathologies

**Calibration drift under distribution shift.** The reward model is
trained on completions sampled from $\pi_{\text{SFT}}$; once the policy
has moved away from $\pi_{\text{SFT}}$ the reward model is being
queried out of distribution and its outputs become unreliable.

**Goodhart's law.** The reward model is a proxy for human preference;
strong optimization of the proxy predictably finds inputs that score
well under the proxy and badly under the underlying preference. The
[reward-hacking-inevitability](../theorems/reward-hacking-inevitability.md)
theorem makes this precise.

**Overoptimization.** Empirically (Gao et al. 2023) the *true*
preference initially rises with KL-budget then declines; the optimal
KL-budget shrinks as the reward model is more aggressively
optimized. See [rlhf-overoptimization](../theorems/rlhf-overoptimization.md).

## Variants

**Direct preference optimization** (DPO; Rafailov et al. 2023) implicitly
defines a reward model and optimizes the policy without instantiating
it as a separate object. Equivalent in expectation to explicit-reward-model
training under the Bradley–Terry assumption; does not avoid the
underlying pathologies.

**Process reward models** score intermediate steps of a reasoning
trajectory rather than only final outputs. Provide denser supervision;
introduce the additional question of how to aggregate step-rewards into
a trajectory-reward.

**Constitutional reward models** are trained from AI-generated
preference comparisons against a written set of principles. Reduce
labeling cost; lengthen the proxy chain.
