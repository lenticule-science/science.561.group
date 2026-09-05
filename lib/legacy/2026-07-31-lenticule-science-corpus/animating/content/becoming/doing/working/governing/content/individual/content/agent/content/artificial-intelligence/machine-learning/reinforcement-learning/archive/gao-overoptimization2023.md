---
type: reference
class: empirical-paper
status: stable
---

# Gao, Schulman, Hilton 2023 — Scaling Laws for Reward Model Overoptimization

Gao, Leo, John Schulman, and Jacob Hilton. "Scaling Laws for Reward
Model Overoptimization." *Proceedings of the 40th International
Conference on Machine Learning* (2023).

The paper that empirically characterized **reward-model overoptimization**
as a scaling-law phenomenon in [RLHF](teaching/explanations/rlhf.md). Using a
synthetic-preference setup (a fixed "gold-standard" reward model
plays the role of the true human preference; smaller proxy reward
models are trained on its outputs), the authors measured how the
true reward and the proxy reward diverge as a function of optimization
strength (KL-distance from the reference policy).

Key empirical findings:

- True reward initially rises with KL-distance, peaks, then declines.
- Proxy reward continues to rise even after true reward declines.
- The peak-KL shrinks as the proxy reward model is scaled up.
- The shape of the curves is well-fit by a simple two-parameter
  functional form (linear-times-square-root or similar).
- The phenomenon is robust across reward-model architectures, sizes,
  and optimization methods (best-of-$n$ sampling, RL fine-tuning).

The paper is the empirical anchor for the
[rlhf-overoptimization](../theorems/rlhf-overoptimization.md) theorem
in this theory. It does not prove the inevitability claim (that is
[Skalse et al. 2022](skalse-reward-hacking2022.md)'s contribution);
it establishes that the phenomenon is quantitatively reliable and
characterizable.

Cited by the [rlhf](teaching/explanations/rlhf.md) concept, the
[reward-model](../objects/reward-model.md) object, the
[rlhf-overoptimization](../theorems/rlhf-overoptimization.md)
theorem, the [from-bellman-to-rlhf](teaching/explanations/from-bellman-to-rlhf.md)
narrative, and the
[can-rlhf-be-made-robust-to-overoptimization](questions/can-rlhf-be-made-robust-to-overoptimization.md)
question.
