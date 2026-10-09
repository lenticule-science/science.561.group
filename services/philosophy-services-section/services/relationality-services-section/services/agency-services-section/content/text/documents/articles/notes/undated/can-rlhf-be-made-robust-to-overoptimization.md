---
type: question
class: open-problem
status: open
see-also:
  - ../theorems/rlhf-overoptimization.md
  - ../theorems/reward-hacking-inevitability.md
  - teaching/explanations/rlhf.md
  - ../objects/reward-model.md
references:
  - references/gao-overoptimization2023.md
  - references/skalse-reward-hacking2022.md
title: Can RLHF be made robust to overoptimization?
description: The rlhf-overoptimization theorem establishes that, under the standard pipeline, true preference peaks at finite KL-budget and declines beyond it.
---

# Can RLHF be made robust to overoptimization?

The [rlhf-overoptimization](rlhf-overoptimization.md)
theorem establishes that, under the standard pipeline, true preference
peaks at finite KL-budget and declines beyond it. Current engineering
practice tunes $\beta$ in the KL-penalty to operate near the peak.

The open question is whether RLHF can be modified so that **true
preference monotonically improves** with optimization strength, rather
than peaking and declining.

## Why this is hard

The [reward-hacking-inevitability](reward-hacking-inevitability.md)
theorem (Skalse et al. 2022) implies that any fixed proxy reward
that is not exactly equivalent to the true preference will be
hackable. Robustness in the strong sense — *no* peak — requires the
proxy to *become equivalent* to the true preference in the limit of
optimization, not merely to be locally accurate.

Three families of approaches are visible in the literature.

## Family 1: Active preference learning

Iteratively retrain the reward model on outputs of the current
policy, so that the reward model remains accurate on the support of
the current policy. The peak-and-decline curve becomes a series of
ascending peaks; the question is whether the envelope is monotonic.

Empirically (preliminary results from 2024–2025): the envelope rises
but flattens, suggesting the true preference is bounded above by
the policy class capacity rather than by reward-model fidelity.
Whether the envelope ever declines is an open empirical question.

## Family 2: Conservative optimization

Replace the standard PPO objective with a quantilization or
trust-region objective that penalizes outputs scoring at the extremes
of the reward-model distribution. The intuition: extreme rewards are
the ones most likely to be artifacts. Cf. Taylor (2016) on
quantilization.

Theoretical guarantees in toy MDPs are known. Empirical results in
LLM RLHF are mixed; the technique loses much of the optimization
benefit it was designed to safely deliver.

## Family 3: Direct preference learning

Bypass the reward model entirely (DPO, Rafailov et al. 2023; IPO,
Azar et al. 2024) by deriving the policy update directly from
preference pairs. This avoids the reward-model approximation step
but does not avoid the underlying preference-distribution
approximation; the same overoptimization phenomenon reappears at one
level of indirection further down.

Theoretical work (Azar et al. 2024) shows that DPO has a similar
overoptimization curve under similar assumptions; the question is
whether tighter analysis reveals a regime in which the curve is
monotonic.

## What would resolve the question

A positive resolution: a training procedure (and its analysis)
producing a policy whose true preference is monotonically
non-decreasing in some measurable optimization-strength quantity.

A negative resolution: a no-go theorem showing that any RLHF-style
procedure (defined broadly) inherits some form of the overoptimization
phenomenon. Skalse et al.'s unhackability result is close to such a
theorem but does not by itself rule out the family of approaches
above; it rules out *fixed* proxy rewards.

## Connection to the agents theory

Resolution of this question would have downstream consequences for
the [agents theory](../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/content/artificial-intelligence/machine-learning/agents/_index.md): the reliability of
RLHF-trained LLMs at the heart of agentic systems is bounded by
whatever the answer turns out to be. A negative resolution would
strengthen the case for non-RLHF approaches to LLM training, with
unknown structural consequences for the agentic-system regime.
