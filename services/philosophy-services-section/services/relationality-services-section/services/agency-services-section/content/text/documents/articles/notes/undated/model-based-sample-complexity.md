---
type: theorem
class: classical
status: proved-with-conditions
depends-on:
  - teaching/explanations/model-based-rl.md
  - ../morphisms/model-learning.md
see-also:
  - ../../reinforcement-learning/_index.md
references:
  - references/sutton-dyna1991.md
  - references/azar-munos-kappen2013.md
  - references/agarwal-kakade-yang2020.md
title: Model-based sample complexity
description: Consider a finite tabular MDP with $|S|$ states, $|A|$ actions, discount $\gamma$ (effective horizon $H = 1/(1-\gamma)$), and rewards in $[0,1]$.
---

# Model-based sample complexity

## Statement (informal, regime-dependent)

Consider a finite tabular MDP with $|S|$ states, $|A|$ actions,
discount $\gamma$ (effective horizon $H = 1/(1-\gamma)$), and
rewards in $[0,1]$. Generative-model results (Azar, Munos &
Kappen 2013; Agarwal, Kakade & Yang 2020) establish that a
*plug-in* model-based estimator — collect $N$ transitions per
state-action pair, then plan optimally in the empirical MDP —
achieves $\epsilon$-suboptimality with sample complexity

$$
\tilde{O}\!\left(\frac{|S| |A| H^3}{\epsilon^2}\right)
$$

per state-action, matching the minimax lower bound up to log
factors in the generative-access setting. The exact constants
and horizon exponents depend sensitively on the access model
(generative vs online), the reward structure, and the planning
guarantee required (PAC vs regret).

Model-free methods can also achieve minimax-optimal sample
complexity in the tabular generative-access setting (Sidford et
al. 2018, Li et al. 2021), so the *theoretical* model-based
advantage is more subtle than a clean horizon-factor separation.
The advantage is more pronounced in:

- **Multi-task / multi-reward** settings, where the model
  amortizes over many downstream tasks while a model-free
  policy must be relearned per task.
- **Function-approximation** settings under the realizability
  assumption, where model-based methods can extract more from
  each sample by leveraging structure of the model class.

In neither case is the separation a clean asymptotic theorem;
the literature provides regime-dependent results. *This entry
reports the qualitative pattern rather than a single canonical
bound.*

## Why model-based is favored

The intuition: the model is a *single shared object* that
captures all dynamics information. Once learned, it can be
re-used across arbitrary reward functions, planning horizons, and
policies. Model-free methods relearn (implicitly) the same
dynamics for each task or reward signal.

A second source of advantage: the model can be queried at
arbitrarily many synthetic state-action pairs, while real
samples are constrained to the policy's actual visits. This is
the *imagination amplification* that Dyna and Dreamer exploit —
each real sample contributes to many model-based updates.

## Realizability is the binding assumption

The bound assumes the learned model class contains the true
dynamics (or approximates them well). In tabular MDPs this is
trivially true. In deep MBRL with neural-network dynamics it is
typically false: the true environment is not in the model class,
and the realizability gap dominates the sample-complexity advantage.

This is why empirical MBRL gains over model-free are real but
modest (factor 2–10× in sample efficiency, not the asymptotic
ideal). Bridging the gap requires either:

- **Better model classes** that capture relevant dynamics
  structure (latent models with appropriate inductive bias).
- **Ensemble-based pessimism** that prevents the policy from
  relying on parts of the model where the realizability gap is
  large.
- **Continual model retraining** so the model is approximately
  realizable on the current on-policy distribution.

## Lower bound

The information-theoretic lower bound for $\epsilon$-suboptimal
policy estimation in the generative-access tabular setting is
$\tilde{\Omega}(|S| |A| H^3 / \epsilon^2)$ (Azar et al. 2013),
matching the plug-in model-based upper bound up to logarithmic
factors. Model-based plug-in algorithms are minimax-optimal in
this setting.

## What this does not say

The theorem does not say model-based RL is always better in
practice. It says: *under realizability, in the tabular limit,
model-based RL achieves the minimax-optimal sample complexity*.
In settings where realizability fails badly, the model can
*hurt* — the policy exploits model inaccuracies and degrades
worse than a model-free baseline. Engineering MBRL well is
substantially about preventing this.
