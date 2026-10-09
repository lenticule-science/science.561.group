---
type: theorem
class: structural-claim
status: proved
depends-on:
  - teaching/explanations/outer-alignment.md
  - teaching/explanations/inner-alignment.md
  - ../objects/base-objective.md
  - ../objects/mesa-objective.md
see-also:
  - mesa-optimization-emergence-conditions.md
  - goal-misgeneralization-inevitability.md
references:
  - references/hubinger-mesa2019.md
  - references/ngo-alignment2022.md
---

# Inner-outer decomposition of alignment failure

**Theorem (Hubinger et al. 2019, structural).** Let $G^*$ be the designer's intended goal, $L_{\text{base}}$ the [base objective](../objects/base-objective.md), $L_{\text{mesa}}$ the [mesa-objective](../objects/mesa-objective.md) of the trained model (if the model is a [mesa-optimizer](teaching/explanations/mesa-optimization.md)), $\pi$ the trained policy, and $D_{\text{deploy}}$ the [deployment distribution](../objects/deployment-distribution.md).

Define the deployment-time **alignment gap**

$$\Delta(\pi) := \mathbb{E}_{x \sim D_{\text{deploy}}}\!\left[ G^*(x, \pi^*_{G^*}(x)) - G^*(x, \pi(x)) \right]$$

— the deployment-distribution shortfall of $\pi$ relative to a $G^*$-optimal policy.

Then $\Delta(\pi)$ decomposes additively (up to interaction terms) into:

$$\Delta(\pi) = \underbrace{\Delta_{\text{outer}}}_{\text{outer-alignment failure}} + \underbrace{\Delta_{\text{inner}}}_{\text{inner-alignment failure}} + \Delta_{\text{interaction}}$$

where - $\Delta_{\text{outer}}$ is the gap induced by $L_{\text{base}} \neq G^*$ (the base objective does not capture the intended goal), - $\Delta_{\text{inner}}$ is the gap induced by $L_{\text{mesa}} \neq L_{\text{base}}$ (the trained model does not pursue the base objective), - $\Delta_{\text{interaction}}$ collects cross-terms.

## Proof

Define two auxiliary policies:

- $\pi^*_{G^*}$: the $G^*$-optimal policy on $D_{\text{deploy}}$.
- $\pi^*_{L_{\text{base}}}$: the $L_{\text{base}}$-optimal policy on $D_{\text{deploy}}$.

Decompose the alignment gap by inserting these:

$$\Delta(\pi) = \mathbb{E}\!\left[G^*(\pi^*_{G^*}) - G^*(\pi^*_{L_{\text{base}}})\right] + \mathbb{E}\!\left[G^*(\pi^*_{L_{\text{base}}}) - G^*(\pi)\right]$$

The first term is the gap between $G^*$-optimal and $L_{\text{base}}$-optimal policies, evaluated by $G^*$.
This is the outer-alignment gap $\Delta_{\text{outer}}$: it is zero iff every $L_{\text{base}}$-optimal policy is also $G^*$-optimal — that is, iff $L_{\text{base}}$ correctly encodes $G^*$ over the population the policy class can express.

The second term is the gap between $\pi^*_{L_{\text{base}}}$ and the actually-trained $\pi$, evaluated by $G^*$.
To attribute this to inner alignment, write

$$\mathbb{E}[G^*(\pi^*_{L_{\text{base}}}) - G^*(\pi)] = \mathbb{E}[G^*(\pi^*_{L_{\text{base}}}) - G^*(\pi^*_{L_{\text{mesa}}})] + \mathbb{E}[G^*(\pi^*_{L_{\text{mesa}}}) - G^*(\pi)]$$

The first sub-term is what would be lost if the model were a *perfect* optimizer of $L_{\text{mesa}}$ rather than $L_{\text{base}}$ — the *pure* inner-alignment gap $\Delta_{\text{inner}}$.
The second sub-term is the optimization gap (model is a finite-strength $L_{\text{mesa}}$-optimizer, not a perfect one); this is collected into $\Delta_{\text{interaction}}$ along with cross-terms from the fact that the gaps are not measured under independent $G^*$, $L_{\text{base}}$, $L_{\text{mesa}}$ orderings. $\square$

## What this theorem does and does not say

**Does say.** Alignment failure has two structurally distinct sources that can be addressed by different interventions:

- **Outer alignment** ($\Delta_{\text{outer}}$): mitigated by editing $L_{\text{base}}$, choosing better proxies, expanding the specification.
- **Inner alignment** ($\Delta_{\text{inner}}$): mitigated by shaping the inductive bias, by interpretability, by mesa-objective-extraction techniques. *Editing $L_{\text{base}}$ does not address $\Delta_{\text{inner}}$.*

Conversely, if a deployed system fails, the failure mode determines which intervention is appropriate.
A failure attributable to $\Delta_{\text{outer}}$ is a specification problem; a failure attributable to $\Delta_{\text{inner}}$ is not, and editing the specification will not fix it.

**Does not say.** The decomposition is structural, not algorithmic.
It does not provide a *procedure* for measuring $\Delta_{\text{inner}}$ versus $\Delta_{\text{outer}}$ in a deployed system; that requires access to $L_{\text{mesa}}$, which is exactly what is hard to obtain.
The decomposition gives a theoretical apportionment that is operationally indirect.

The decomposition assumes the model is in fact a mesa-optimizer with a stable $L_{\text{mesa}}$.
For models that are not mesa-optimizers in any meaningful sense, $L_{\text{mesa}}$ is undefined and the decomposition collapses (the policy is whatever the parameters implement; the failure is just "the parameters give bad behavior off training distribution").
Whether contemporary LLMs satisfy the mesa-optimizer characterization is an open empirical question (see [does-rlhf-produce-mesa-optimizers](questions/does-rlhf-produce-mesa-optimizers.md)).

## Why this is the load-bearing theorem of the theory

The theorem is the structural justification for treating alignment as a two-axis problem.
Without it, the natural assumption — addressed by much of the pre-2019 literature — was that alignment is one problem: "specify the right reward and optimize it."
The decomposition shows this is incomplete: even with a perfect specification, optimization need not produce a system that pursues that specification, because gradient descent's selection criterion is *training-distribution performance*, not *internal-objective identity*.

The theorem's most-cited corollary in the alignment literature: any alignment program that addresses only $\Delta_{\text{outer}}$ (better reward modeling, constitutional principles, RLHF improvements) leaves $\Delta_{\text{inner}}$ unaddressed.
The [why-rlhf-is-not-alignment](teaching/explanations/why-rlhf-is-not-alignment.md) narrative develops this consequence in detail.
