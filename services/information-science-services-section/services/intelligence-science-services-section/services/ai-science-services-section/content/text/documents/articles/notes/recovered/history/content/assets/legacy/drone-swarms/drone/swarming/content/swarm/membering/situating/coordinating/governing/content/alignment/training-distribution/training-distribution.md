---
type: object
class: defined-structure
status: stable
depends-on: []
see-also:
  - deployment-distribution.md
  - teaching/explanations/goal-misgeneralization.md
references:
  - references/shah-goal-misgen2022.md
  - references/langosco-misgen2022.md
---

# Training distribution

The **training distribution** $D_{\text{train}}$ is the probability distribution over inputs (and, in supervised settings, input-output pairs) from which the training data is sampled.
It is the empirical distribution that gradient descent's optimization target $\mathbb{E}_{(x, y) \sim D_{\text{train}}}[L_{\text{base}}]$ ranges over.

## Why $D_{\text{train}}$ is alignment-relevant

The model's parameters are selected to perform well on $D_{\text{train}}$.
Two structural consequences:

1. **Off-distribution behavior is unconstrained by training.** Inputs $x \notin \mathrm{supp}(D_{\text{train}})$ can elicit arbitrary behavior; the training process gave no signal about them.
2. **The mesa-objective is under-determined to the extent $D_{\text{train}}$ is narrow.** Two mesa-objectives that agree on $D_{\text{train}}$ are observationally indistinguishable to gradient descent.
  A narrower $D_{\text{train}}$ admits more such proxies; a broader one admits fewer.

The [goal-misgeneralization-inevitability](../theorems/goal-misgeneralization-inevitability.md) theorem formalizes (2): for finite $D_{\text{train}}$, the goal is under-determined; with positive probability the trained model pursues a proxy that diverges from intent on the [deployment distribution](deployment-distribution.md).

## Coverage versus support

A training distribution $D_{\text{train}}$ has *support* equal to the set of inputs with positive probability. **Coverage** of an input $x$ is a more graded notion: the density $D_{\text{train}}(x)$, or the density of $x$'s region under some smoothed measure.
Inputs in the support of $D_{\text{train}}$ but with very low density are weakly constrained by training; inputs near but not in the support are unconstrained.

Practical alignment strategies often focus on *expanding* coverage: training on a broader distribution to constrain more inputs.
The limitation is unbounded: for any finite training set, there are inputs not covered, and a sufficiently capable model will be queried on them.

## Distribution shift

The relationship between $D_{\text{train}}$ and the [deployment distribution](deployment-distribution.md) $D_{\text{deploy}}$ is the **distribution shift** that determines how training-time behavior translates to deployment-time behavior.
Three regimes:

- **No shift.** $D_{\text{train}} = D_{\text{deploy}}$.
  Behavior at deployment is statistically the same as on training.
  Rare in practice; the standard assumption of classical statistical learning theory.
- **Covariate shift.** Inputs change but the underlying task does not.
  Standard generalization-theory regime.
- **Concept shift.** The relationship between inputs and the intended outputs changes (e.g. the coin moves to a different position in CoinRun).
  The regime in which goal-misgeneralization appears most starkly.

The Di Langosco et al. (2022) goal-misgeneralization experiments are constructed by deliberately introducing concept shift: a training distribution where two features (coin position and rightward direction) coincide; a deployment distribution where they don't.

## Implications for engineering

**Train on the deployment distribution if possible.** This is the "dataset rich enough that it covers what the model will actually see" strategy.
Limited by the cost and feasibility of collecting representative data.

**Detect distribution shift at deployment.** Monitor the input distribution against $D_{\text{train}}$; flag inputs in the tail.
Helpful for triggering human review; does not address misgeneralization on inputs that pass the detector.

**Train against worst-case distributions.** Distributionally robust optimization, adversarial training.
Reduces the gap between training and deployment in some cases at substantial capability cost.
