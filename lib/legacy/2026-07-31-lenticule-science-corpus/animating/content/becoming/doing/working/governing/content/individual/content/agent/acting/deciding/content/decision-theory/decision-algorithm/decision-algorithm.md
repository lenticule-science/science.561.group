---
type: object
class: contemporary
status: active
depends-on:
  - decision-problem.md
  - teaching/explanations/embedded-agency.md
see-also:
  - ../theorems/fdt-newcomb-resolution.md
references:
  - references/yudkowsky-tdt2010.md
  - references/soares-fallenstein2015.md
---

# Decision algorithm

A **decision algorithm** is the computation an agent runs to select an act from a [decision-problem](decision-problem.md).
Functional Decision Theory takes the decision algorithm itself — rather than the act — as the agent's *choice variable*: the agent asks not "which act should I select?" but "which output should this decision algorithm produce?"

## Why this matters

Classical Causal Decision Theory asks: *holding the rest of the world fixed, which act produces the best outcome?* This breaks on Newcomblike problems, where the act is correlated with other parts of the world (the predictor's prediction, copies of the agent, the agent's own past) through the *algorithmic* structure of the agent.

If the agent is implemented as algorithm $A$, and a predictor $P$ has accurately predicted that $A$ outputs "two-box", then choosing "two-box" is not an act CDT can analyze: there is no counterfactual in which $A$ outputs "two-box" but $P$ predicted "one-box", because $P$'s prediction *is* a function of $A$.

Treating the algorithm's *output* as the choice variable sidesteps this.
The agent asks: *of the worlds where this algorithm outputs $x$, which has higher utility?*

## What the agent is choosing

For Functional Decision Theory:

$$ A^* = \arg\max_{A} \mathbb{E}_{w \sim P}[u(w \mid A_{\text{output}}(w) = x)] $$

where the conditional ranges over all parts of the world that implement (or predict, or simulate) the agent's algorithm $A$ and they all produce output $x$ in the conditional.
This treats the algorithm as a *Platonic object* whose instances are the physical implementations.

## The Platonic move

The decision algorithm in FDT is *not* the agent's source code on a particular physical machine; it is the abstract computation, of which the source code is one instance and the predictor's simulation is another.
This Platonic move is controversial — see [is-logical-induction-the-right-account-of-self-knowledge](questions/is-logical-induction-the-right-account-of-self-knowledge.md).

## In other formalisms

The decision-algorithm-as-object also appears in:

- **Updateless Decision Theory** — choose the policy (mapping from observations to acts), not the act.
- **Tiling agents** — choose successor algorithms whose decisions the current agent endorses.
- **Open-source game theory** — agents whose source code is visible to one another can cooperate via mutual algorithmic prediction.

## Limits

Treating the algorithm as the choice variable raises questions the act-as-choice framework does not: - What counts as "the same algorithm" across implementations?
(Source-equivalence?
Behavioral equivalence?) - How does the agent reason about predictors that approximate but do not exactly compute the agent's algorithm? - Does the framework give correct answers on "exotic" problems that postulate logical-counterfactual structure?
