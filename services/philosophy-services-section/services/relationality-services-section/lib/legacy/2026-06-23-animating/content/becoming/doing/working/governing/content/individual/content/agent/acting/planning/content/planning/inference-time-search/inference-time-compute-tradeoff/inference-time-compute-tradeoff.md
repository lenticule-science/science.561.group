---
type: theorem
class: structural-claim
status: proved
depends-on:
  - teaching/explanations/inference-time-search.md
see-also:
  - uct-convergence.md
  - questions/inference-vs-training-compute-tradeoff.md
references:
  - references/wei-cot2022.md
  - references/yao-tot2023.md
  - references/silver-alphazero2018.md
  - references/kocsis-szepesvari2006.md
---

# Inference-time compute tradeoff

**Claim (structural; well-supported empirically across multiple families of inference-time-search systems).** Let $M$ be a model with an underlying capability profile $\mathcal{C}$ for some task distribution.
Let $\sigma_n(M)$ denote a sample-based inference procedure that draws $n$ candidate completions from $M$ and selects among them via a verification or evaluation function.
Define $\mathrm{acc}(\sigma_n(M))$ as the task accuracy of the selected output.

Suppose:

1. The model $M$ has *latent capability* $C^* \in \mathcal{C}$ on the task: that is, $\sup_n \mathrm{acc}(\sigma_n(M)) \to C^*$ as $n \to \infty$.
2. The verification function $V$ used by $\sigma_n$ is *better than chance* at distinguishing correct from incorrect samples.
3. The model's per-sample success probability $p$ is bounded away from 0 (the model can sometimes produce a correct answer).

Then **accuracy is monotone increasing in $n$**: $$\mathrm{acc}(\sigma_{n+1}(M)) \geq \mathrm{acc}(\sigma_n(M))$$ with the inequality strict for $\mathrm{acc}(\sigma_n(M)) < C^*$.

Furthermore, when $V$ is a *perfect verifier* (correct sample is always selected when present), $$\mathrm{acc}(\sigma_n(M)) = 1 - (1 - p)^n$$ and the accuracy converges to $C^* = 1$ exponentially fast in $n$.

For *imperfect verifiers*, $C^*$ is bounded above by the verifier's own accuracy, and the convergence rate is slower.

## Proof sketch

**Monotonicity.** Sampling $n+1$ candidates instead of $n$ is strictly more information for the verifier; with a verifier satisfying premise (2), more candidates can only weakly increase expected accuracy.

**Perfect-verifier rate.** If each sample is i.i.d. with success probability $p$, the probability that *at least one* of $n$ samples is correct is $1 - (1-p)^n$.
With a perfect verifier, the at-least-one-correct event implies a correct selection, so accuracy equals this probability.

**Imperfect-verifier ceiling.** When $V$ has accuracy $\alpha < 1$ on the (correct, incorrect) discrimination task, the selection can choose a wrong sample even when correct samples are present.
The asymptotic accuracy is bounded above by $V$'s discrimination ability, which is structurally bounded above by $V$'s own capability on the task.
In the common case where $V$ is the same model as $M$ in self-evaluation mode, $C^*$ is bounded by $M$'s self-discrimination ability.

$\square$

## Empirical confirmation

The structural claim is heavily confirmed by recent literature:

- **CoT scaling**: Wei et al. 2022 show that CoT prompting improves accuracy on multi-step reasoning tasks; the improvement saturates at the model's underlying capability ceiling.
- **Self-consistency / majority-voting scaling**: Wang et al. 2022 show monotone gains from $n$ up to $n \approx 40$ on standard reasoning benchmarks, with diminishing returns thereafter.
- **Tree-of-thoughts scaling**: Yao et al. 2023 show similar gains from explicit tree search, with the scaling extending further than self-consistency by virtue of branching exploration.
- **AlphaZero**: Silver et al. 2018 show explicit search-vs-strength scaling: more MCTS iterations per move yield monotonically stronger play, with smooth diminishing returns.
- **Frontier reasoning models (o1, R1, post-2024)**: explicit test-time compute scaling laws, with accuracy log-linearly improving in inference compute over multiple orders of magnitude on math, code, and reasoning benchmarks.

The structural claim above is the formal version of "test-time compute scales accuracy" — a generalized statement of these empirical findings in terms that hold for any sampling-based inference-time procedure with a non-trivial verifier.

## What this claim does and does not say

**Does say.** Sampling more candidates and selecting via a non-trivial verifier monotonically increases accuracy, up to a ceiling determined by the model's latent capability and the verifier's discrimination ability.

**Does not say.** That the accuracy converges to 1.
Only the *latent capability* $C^*$ is approached; if $C^* < 1$ (the model cannot solve the task even with infinite samples), inference-time compute cannot close the gap.

**Does not say.** That all problems benefit equally.
Tasks where *verification is as hard as generation* (creative writing, value judgments, debates without ground truth) have weak verifiers and the inference-time compute tradeoff is substantially less favorable.

**Does not say.** That training-time compute is replaceable.
The underlying capability $C^*$ is set by training; inference-time compute extracts more of it but cannot raise the ceiling.
The inference-vs-training-compute *substitution rate* is the content of the [inference-vs-training-compute-tradeoff](questions/inference-vs-training-compute-tradeoff.md) open question — the structural result above tells us the substitution exists, but not at what rate.

**Does not say.** That the diminishing returns are slow enough to matter at deployment scales.
Many inference-time-compute techniques exhaust their useful regime before the marginal cost of further compute exceeds the marginal accuracy gain.

## Relationship to other results

The claim is a generalization of [uct-convergence](uct-convergence.md): UCT is a particular sampling-based inference procedure with a particular verifier (the rollout outcome), and its convergence is a particular instance of the inference-time-compute tradeoff.

It is also closely related to *capability elicitation* in the alignment literature: the same model exhibits substantially different *measured* capabilities at different inference-time compute budgets.
This is the formal content of "we don't know what a model can do until we've spent enough compute trying."

The claim has practical implications for capability evaluation: single-shot benchmarks systematically *underestimate* model capability; the appropriate measure is the asymptotic inference-time-compute-extended capability, which is harder to measure but more decision-relevant.
