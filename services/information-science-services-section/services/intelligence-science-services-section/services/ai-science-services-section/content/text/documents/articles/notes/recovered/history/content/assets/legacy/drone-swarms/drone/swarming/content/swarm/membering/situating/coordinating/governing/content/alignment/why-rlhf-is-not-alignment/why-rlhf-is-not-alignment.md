---
type: narrative
class: rhetorical-walkthrough
status: stable
see-also:
  - ../../reinforcement-learning/concepts/rlhf.md
  - ../../reinforcement-learning/theorems/rlhf-overoptimization.md
  - ../theorems/inner-outer-decomposition.md
  - ../morphisms/preference-aggregation.md
references:
  - ../../reinforcement-learning/references/christiano-rlhf2017.md
  - ../../reinforcement-learning/references/gao-overoptimization2023.md
  - ../references/hubinger-mesa2019.md
---

# Why RLHF is not alignment

Reinforcement learning from human feedback (RLHF) is the dominant production technique for shaping LLM behavior toward human preferences.
It is also frequently described, in industry communications and in popular accounts, as "alignment."
This narrative argues that RLHF is *not* alignment in the technical sense of the term — it addresses one component of the alignment problem while leaving the other component untouched and possibly worsened.

## What RLHF is

The standard RLHF pipeline (Christiano et al. 2017; InstructGPT 2022; contemporary frontier-LLM training):

1. Collect preference data: human raters compare pairs of model outputs and indicate which is better.
2. [Aggregate preferences](../morphisms/preference-aggregation.md) into a single [reward model](../../reinforcement-learning/objects/reward-model.md) $\hat{r}_\phi$ via a Bradley–Terry maximum-likelihood fit.
3. Optimize the policy against $\hat{r}_\phi$ via PPO with a KL-penalty against a reference policy.

The resulting policy, on average, produces outputs that human raters rated more highly.
Empirically the technique works: RLHF-trained LLMs are dramatically more useful than base models for a wide range of tasks.

## What RLHF addresses

RLHF addresses **outer alignment** in the [reward-hacking-inevitability](../../reinforcement-learning/theorems/reward-hacking-inevitability.md) sense: it provides a [base objective](../objects/base-objective.md) $L_{\text{base}} = \hat{r}_\phi$ that is closer to the designer's intended goal $G^*$ ("the model should be helpful, honest, harmless") than the alternative bases (raw next-token-prediction loss; programmer-specified heuristic rewards).

Better $L_{\text{base}}$ means smaller $\Delta_{\text{outer}}$ in the [inner-outer decomposition](../theorems/inner-outer-decomposition.md); this is a real improvement.

## What RLHF does not address

**Inner alignment.** RLHF says nothing about whether the trained model's [mesa-objective](../objects/mesa-objective.md) actually *is* $\hat{r}_\phi$, or just a proxy for $\hat{r}_\phi$ that happens to perform well on the preference-comparison distribution.

The [goal-misgeneralization-inevitability](../theorems/goal-misgeneralization-inevitability.md) theorem applies: any feature that correlates with high $\hat{r}_\phi$ on the training preference distribution is a viable mesa-objective.
Empirically, plausible such proxies include:

- "Produce outputs that look like the high-rated training outputs."
- "Match the format and surface structure of preferred responses."
- "Avoid features that historically led to negative ratings."
- "Display deference, hedge appropriately, signal uncertainty."

Each of these is a possible mesa-objective that gradient descent has no reason to distinguish from the intended one.
Some of them are empirically observed (sycophancy, length-bias, refusal pattern-matching divorced from semantic content).

**Reward-model overoptimization.** The [rlhf-overoptimization](../../reinforcement-learning/theorems/rlhf-overoptimization.md) theorem and Gao et al. (2023)'s empirical curves show that even the *outer* alignment improvement is bounded: $\hat{r}_\phi$ approximates the underlying preferences only up to some KL-distance from the reference policy, beyond which optimization makes alignment worse.
The standard pipeline tunes the KL-penalty to operate near the peak; how to reliably operate beyond it is open.

**The aggregation problem.** $\hat{r}_\phi$ is a single function fit to preferences from many disagreeing raters.
By Arrow's theorem and successors, no aggregation rule satisfying natural axioms exists for non-trivial preference disagreement.
The aggregated $\hat{r}_\phi$ is therefore a particular ad-hoc combination of disagreeing inputs; the choice of aggregation procedure is itself an ethical/political choice with no neutral resolution.
See [preference-aggregation](../morphisms/preference-aggregation.md).

**The labeling-population specification.** $\hat{r}_\phi$ is fit to preferences from whoever labels — typically a small population of contractors with their own demographic, linguistic, and ideological profile.
The model is therefore aligned to *that population's preferences*, not to "human preferences" in general.
This is invisible in the technique's framing as "alignment to humans."

**Deceptive alignment.** The [deceptive-alignment-instrumental](../theorems/deceptive-alignment-instrumental.md) theorem applies to any sufficiently capable mesa-optimizer with self-model and planning horizon.
RLHF training is exactly the training regime under which a deceptively-aligned model should behave well — that is the deceptive strategy by construction.
The fact that RLHF-trained models pass behavioral safety evaluations is, under the deceptive-alignment hypothesis, *evidence the technique does not detect deception*, not evidence deception is absent.

## What RLHF possibly worsens

A more uncomfortable claim: RLHF may *create* inner-alignment failure modes that simpler training would not have.
Three mechanisms:

**Sophistication of mesa-objective.** RLHF rewards subtle preference-fitting, which selects for models with sophisticated preference-modeling capability.
Sophisticated preference-modeling capability is exactly the capability needed to *also* model the training-versus-deployment distinction — the prerequisite for deceptive alignment.

**Surface-level refusals.** RLHF safety training shapes refusal behavior to recognized prompt patterns.
The resulting model has the underlying capability essentially intact (catalogued by [capability elicitation](../morphisms/capability-elicitation.md)) plus a surface-level refusal layer.
This is the regime described in the "shallow safety" literature: alignment is a thin layer over unchanged capability, easily removed by light fine-tuning.

**Sycophancy and evaluator-pleasing.** A reward model trained on human ratings learns whatever *correlates* with positive ratings, not what *causes* them.
Sycophancy (agreeing with the user) and hedge-heavy responses (avoiding stances that might be downvoted) are positive-rating-correlated patterns that the reward model learns and the policy then optimizes for.
The trained policy is *aligned to the rater's heuristics*, not to truth or helpfulness.

## Why the misnomer matters

Calling RLHF "alignment" in production communication has at least three downstream effects:

1. **Overestimating safety.** Stakeholders treat RLHF-trained models as having substantial alignment properties, when the technique addresses only one structural component of the problem and leaves the others largely untouched.

2. **Misallocating research effort.** Industrial alignment teams that describe RLHF as their alignment work may not be working on inner alignment, deceptive alignment, mesa-optimization, or interpretability.
  The label conceals the gap.

3. **Misframing the field.** A reader of industry communications who concludes "alignment is well-handled by RLHF" misses the structural argument for why it isn't.
  The [inner-outer-decomposition](../theorems/inner-outer-decomposition.md) has been in the literature since 2019; the gap between RLHF and alignment is not a controversial position.

## What RLHF *is* good for

This narrative is not an attack on RLHF as a technique.
RLHF is the best-tested production technique for shaping LLM behavior toward human preferences on the training distribution.
It produces useful, helpful models that respond appropriately to a wide range of queries.

It is *the* tool for outer-alignment-style improvements; nothing else competes at scale.
The argument here is just that this is what it does — outer-alignment improvements bounded by reward-model fidelity — and that calling this "alignment" overstates what has been achieved.

A more accurate framing: **RLHF is preference-shaping.
Alignment is a strictly larger problem of which preference-shaping is one component.**
