---
type: theorem
class: contemporary
status: proved-with-conditions
depends-on:
  - teaching/explanations/embedded-agency.md
  - ../objects/prior-belief.md
see-also:
  - teaching/explanations/naturalized-induction.md
references:
  - references/demski-garrabrant2019.md
---

# Embedded agent impossibility

## Statement (informal)

No computable Bayesian agent with a fixed prior over a hypothesis space $\mathcal{H}$ can have $\mathcal{H}$ contain a *complete* description of the agent itself with positive probability, on pain of self-referential incoherence.
Any such agent must either (a) approximate, (b) restrict its self-model to abstract properties rather than complete descriptions, or (c) operate outside strict Bayesianism.

This is *proved-with-conditions* rather than a clean theorem because the precise formal statement depends on what "complete description of the agent" means; multiple sharpenings exist in the literature with somewhat different scope.

## The intuitive obstruction

Suppose Bayesian agent $A$ has prior $P$ over hypothesis space $\mathcal{H}$, and one hypothesis $h^* \in \mathcal{H}$ is "the world is exactly such that $A$ has prior $P$."
For $A$ to condition on observations, $A$ must compute $P(e \mid h)$ for relevant $h$, including $h^*$.
But $P(e \mid h^*)$ is $P(e)$ — which is exactly what conditioning is computing.
The self-reference makes the computation either circular or trivializing.

More carefully: a strict Bayesian's *full* hypothesis space includes its own brain-state.
Any update on evidence requires updating the joint distribution over (world, agent's brain-state including beliefs about the world).
The agent's beliefs after update become a function of the prior beliefs, but the prior beliefs were themselves modeled by a hypothesis in the hypothesis space — leading to a fixed-point requirement that is not in general satisfiable for arbitrary observations.

## Sharpenings

The literature gives several sharpenings:

- **Diagonal arguments.** A perfect Bayesian self-predictor cannot exist, by an analog of Cantor's diagonal: if the predictor outputs $P(\text{my next prediction})$ and that prediction is at all responsive to the input, the computation runs into a self-defeating fixed-point.
- **Reflective oracles** (Christiano et al. 2013) — show that *probabilistic* relaxations of self-prediction can be consistent, but require oracles that are not classically computable.
- **Logical induction** (Garrabrant 2016) — bypasses the problem by giving up strict Bayesian conditioning in favor of a market criterion that admits self-reference.

## Why it matters

The result is the formal substrate of [embedded-agency](teaching/explanations/embedded-agency.md).
It shows that the Cartesian assumption of classical Bayesianism — that the agent stands outside the world — is not just a modeling convenience but a *load-bearing* assumption: dropping it requires substantive replacements (logical induction, reflective oracles, FDT) for standard Bayesian and decision-theoretic infrastructure.

## Status

The general impossibility is widely accepted in the agent- foundations literature; precise formal statements vary.
The result motivates rather than concludes research: it tells the field that strict Bayesianism is the wrong substrate for embedded agents and points toward the substrate the field is trying to build.
