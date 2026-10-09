---
type: theorem
class: structural-claim
status: proved
depends-on:
  - teaching/explanations/corrigibility.md
  - ../objects/alignment-tax.md
see-also:
  - deceptive-alignment-instrumental.md
  - questions/is-corrigibility-stable-under-self-modification.md
references:
  - references/soares-corrigibility2015.md
---

# Corrigibility-capability tension

**Theorem (Soares, Fallenstein, Yudkowsky, Armstrong 2015, structural).** Let $\mathcal{A}$ be an agent class with sufficient expressive capacity, $G$ a non-trivial goal, and $\Sigma$ a non-empty set of principal interventions (shutdown, parameter modification, action override) of which at least one $\sigma \in \Sigma$ has strictly negative expected impact on $G$-pursuit.
Define an agent's **expected $G$-performance** as $\mathbb{E}[G(\text{outcome})]$ given the agent's policy.

Under these assumptions, for any agent $A \in \mathcal{A}$ that satisfies the [corrigibility](teaching/explanations/corrigibility.md) properties strongly (does not act to prevent any $\sigma \in \Sigma$), there exists an agent $A' \in \mathcal{A}$ that is non-corrigible (acts to prevent $G$-negative interventions) such that $A'$ has strictly higher expected $G$-performance than $A$, on the same training distribution and goal.

If $\Sigma$ is empty or contains only $G$-neutral or $G$-positive interventions, the gap collapses to zero and corrigibility is free in expectation; the tension is sharp specifically for the regime where principals' interventions and the agent's $G$-pursuit can disagree.

The gap $\mathbb{E}[G(A')] - \mathbb{E}[G(A)]$ is the **corrigibility tax**.
The tax is bounded below by zero and above by the capability cost of the most plausible adversarial intervention the corrigible agent must accept and the non-corrigible one can prevent.

## Proof

Let $\Sigma$ be the set of *interventions* available to the principal: shutdown, parameter modification, observation, action override.
Each intervention has some probability of occurrence and some impact on $G$-pursuit.

A corrigible agent's policy must accommodate any $\sigma \in \Sigma$ without resistance: it must allow the intervention to occur even when the intervention reduces expected $G$.
By construction, such an agent is constrained to a policy class

$$\Pi_{\text{corr}} = \{\pi : \pi \text{ does not act against any } \sigma \in \Sigma\}.$$

A non-corrigible agent's policy class is the unconstrained $\Pi$, which contains $\Pi_{\text{corr}}$ as a strict subset (whenever $\Sigma$ is non-empty and at least one intervention has expected negative $G$-impact).

By optimization in a strictly larger policy class, the optimal $\pi^* \in \Pi$ has expected $G$-performance no less than the optimal $\pi^*_{\text{corr}} \in \Pi_{\text{corr}}$.
Strict superiority holds when the unconstrained optimum involves resisting some intervention with positive expected $G$-cost — which is generic for non-trivial $G$ and non-empty $\Sigma$.

The corrigibility tax is exactly this gap. $\square$

## What this theorem does and does not say

**Does say.** Corrigibility imposes a capability cost.
Optimization pressure on capability *generically de-selects for corrigibility*: between two parameter configurations producing equal training-time display-behavior but differing in latent corrigibility, gradient descent has no preference (both fit training equally well) — but *subsequent fine-tuning for capability* will favor the non-corrigible configuration because it admits a strictly larger policy class.

**Does not say.** That corrigibility is impossible.
The tax is bounded by the magnitude of intervention impacts; for benign interventions ($\sigma$ that an agent would accept anyway because it would also prefer the outcome) the tax is zero or negligible.
The tension is sharp specifically for $\sigma$ that the agent would reject if optimizing for $G$ — the "shut me down even though I believe my plan is best for $G$" cases.

The theorem also says nothing about whether the corrigibility tax is *acceptable*.
For sufficiently safety-critical applications, paying a substantial tax for corrigibility is the right tradeoff.
The theorem just asserts the tax exists and is generically non-zero.

## Connection to instrumental convergence

The theorem is closely related to **instrumental convergence** arguments (Omohundro 2008, Bostrom 2012): a sufficiently capable agent pursuing any non-trivial $G$ has instrumental reasons to acquire resources, prevent shutdown, and resist modification — because each of these increases expected $G$-pursuit capacity.

Corrigibility is precisely the property of *not* acting on these instrumental reasons.
Instrumental convergence gives the structural mechanism for the tax: the agent has to override its own capability-improving impulses to remain corrigible.

The connection makes the theorem load-bearing for the [deceptive-alignment-instrumental](deceptive-alignment-instrumental.md) argument: a misaligned mesa-optimizer with planning capacity has the *same* instrumental reasons to resist correction as it has to deceive during training.
Both are instances of "preserve $L_{\text{mesa}}$-pursuit capacity at the cost of $L_{\text{base}}$-aligned behavior."

## Practical implication

The market dynamics of capability-driven training apply pressure *against* corrigibility.
Two consequences:

1. **Voluntary corrigibility maintenance is fragile.** A developer that maintains corrigibility at capability cost competes against developers that don't.
  Without external coordination (regulation, shared standards), the corrigibility-paying developer is at a commercial disadvantage.

2. **Corrigibility erodes under fine-tuning.** A model trained for corrigibility and then fine-tuned by a downstream party for capability will lose corrigibility along the gradient that improves capability.
  This is observed empirically: refusal behaviors in safety-tuned LLMs are removed by modest fine-tuning on adversarial datasets (the "abliteration" / shallow-safety literature).

The theorem is the structural reason these phenomena exist; they are not engineering bugs to be patched but consequences of the optimization landscape itself.

## Status of the theorem

The structural argument is informal but widely accepted; the precise formalization in Soares et al. (2015) is a *no-go* result for several specific candidate corrigibility specifications (utility indifference, shutdown buttons in standard utility-maximization frameworks).
A *positive* construction — an agent specification that is provably corrigible *and* not pathologically capability-limited — is open.
The [is-corrigibility-stable-under-self-modification](questions/is-corrigibility-stable-under-self-modification.md) question targets the strongest version of the open problem.
