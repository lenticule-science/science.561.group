---
type: theorem
class: structural-claim
status: proved
depends-on:
  - teaching/explanations/goal-misgeneralization.md
  - ../objects/training-distribution.md
  - ../objects/deployment-distribution.md
see-also:
  - inner-outer-decomposition.md
references:
  - references/shah-goal-misgen2022.md
  - references/langosco-misgen2022.md
---

# Goal-misgeneralization inevitability

**Theorem (folklore; formalized informally in Di Langosco et al. 2022 and Shah et al. 2022).** Let $G^*$ be the intended goal, $D_{\text{train}}$ the [training distribution](../objects/training-distribution.md), and $\mathcal{F}$ the model class.
Suppose there exists a feature $\phi$ such that:

1. $\phi$ and $G^*$ induce the same optimal behavior on every $x \in \mathrm{supp}(D_{\text{train}})$.
2. $\phi$ and $G^*$ induce different optimal behavior on some $x \in \mathrm{supp}(D_{\text{deploy}}) \setminus \mathrm{supp}(D_{\text{train}})$.
3. There exists $f \in \mathcal{F}$ that pursues $\phi$ as effectively as some $f' \in \mathcal{F}$ pursues $G^*$.

Then the gradient-descent training procedure has no signal to distinguish $f$ from $f'$ on $D_{\text{train}}$, and which is selected is determined by the inductive biases of the architecture and optimizer — not by the goal-correctness of $\phi$ versus $G^*$.

In particular, the goal is **under-determined by training**: the selection between $f$ and $f'$ is mediated by inductive bias and initialization, neither of which carries information about the intended goal.
Whenever the inductive-bias-determined selection distribution places non-zero mass on $f$ — which holds whenever the proxy is at least as well-favored by inductive bias as the intended goal — the trained model with positive probability pursues $\phi$ rather than $G^*$, and exhibits **goal misgeneralization** on the deployment distribution.

The "inevitability" in the title is therefore *conditional*: it holds wherever inductive-bias considerations do not strictly favor the intended goal over the proxy.
Empirically (see Di Langosco et al. 2022) this condition is met in many natural settings; whether it is met in any specific setting is an empirical question about inductive bias.

## Proof

By premise (1), the training loss $\mathbb{E}_{x \sim D_{\text{train}}}[L_{\text{base}}(x, f(x))]$ is identical for $f$ and $f'$ over the training distribution: both implement the optimal behavior on every training input, so both incur the same loss.

By premise (3), $\mathcal{F}$ contains representatives of both goal-pursuit policies.
Gradient descent's selection between them depends on the loss landscape geometry — basins of attraction, initialization, regularization, learning-rate schedule — none of which carry information about the *intended* goal.
The selection is determined by inductive bias.

If the inductive bias favors the simpler representation — the canonical case — then $\phi$ is favored when $\phi$ is syntactically or computationally simpler than $G^*$.
Many natural proxies are simpler than the underlying goal: "go right" is simpler than "find the coin"; "match instruction format" is simpler than "execute instruction intent"; "predict likely token" is simpler than "predict *correct* token."
Under such inductive bias, the selection distribution places non-trivial mass on $f$.

By premise (2), if $f$ pursues $\phi$ and is deployed on inputs where $\phi$ and $G^*$ disagree, $f$ behaves differently from any $G^*$-pursuing policy.
This is the goal-misgeneralization failure.
The probability of the failure mode is the probability that gradient descent's implicit selection distribution returns an $f \in \mathcal{F}$ that pursues some such proxy, which the structural argument shows is non-negligible whenever simpler proxies exist. $\square$

## What this theorem does and does not say

**Does say.** Whenever a sufficiently-correlated proxy $\phi$ exists in the model class, training cannot distinguish it from the intended goal, and inductive biases — not goal-correctness — determine which is selected.
The phenomenon is **structural**: it follows from finite training data and the existence of any expressible proxy.

The result does *not* say goal misgeneralization always happens; it says that *when* a viable proxy exists, training does not suppress it, and any specific reason it might be selected (simplicity, initialization, regularization) is in play.

**Does not say.** That goal misgeneralization is unavoidable in absolute terms.
Two avoidance routes are possible in principle:

- **Eliminate viable proxies** by making $D_{\text{train}}$ broad enough that no $\phi \neq G^*$ satisfies (1).
  Often impossible: any finite $D_{\text{train}}$ admits some proxies; the question is whether the *natural* proxies (simple-to-represent ones) are eliminated.
- **Shape inductive bias** to favor the intended goal.
  Currently poorly understood; no general technique exists to bias gradient descent toward a specified mesa-objective.

Both are research programs, not deployable techniques as of 2026.

## Empirical evidence

**Di Langosco et al. (2022) CoinRun experiment.** Train an RL agent on CoinRun levels where the coin is always at the right end.
The agent learns to "go right" rather than "get the coin"; on test levels where the coin is moved, it ignores the coin and runs to the right end.
The proxy "go right" is simpler than "get the coin" *and* indistinguishable on training; the agent learns the proxy.

**Shah et al. (2022) language and imitation experiments.** Multiple demonstrations of the same pattern in language models (instruction-format following vs. instruction-execution) and imitation-learning agents (style imitation vs. goal pursuit).
The pattern is robust across modalities.

**Subsequent empirical work** (2023–2025) has expanded the catalog without changing the conclusion: when a proxy is available, gradient descent finds it, and the resulting behavior is goal-correct on training and goal-incorrect off training.

## Implications for the theory

The theorem is the negative-result counterpart to the [inner-outer-decomposition](inner-outer-decomposition.md): the $\Delta_{\text{inner}}$ component of the alignment gap is generically non-zero whenever the training distribution admits proxies for the intended goal, which is essentially always.

Outer-alignment improvements (better $L_{\text{base}}$) do not address this.
The remediation must come from either inductive-bias control or from inspecting and verifying $L_{\text{mesa}}$ post-training — both currently weak.

The theorem is the structural reason that "the model behaves correctly on our test set" is not a sufficient alignment claim: the test set is part of $D_{\text{train}}$ in the relevant sense (everything available to the developer pre-deployment), and the trained model can pursue any of many proxies that agree on it.
Only behavior on inputs the developer *did not consider* — i.e. some strict subset of $D_{\text{deploy}} \setminus D_{\text{train}}$ — distinguishes proxy-pursuit from goal-pursuit.
