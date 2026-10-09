---
type: concept
class: classical
status: active
depends-on:
  - multi-agent-system.md
see-also:
  - ../theorems/price-of-anarchy.md
  - ../objects/joint-policy.md
references:
  - references/vonneumann-morgenstern1944.md
  - references/fudenberg-tirole1991.md
---

# Equilibrium concept

An **equilibrium concept** is a solution concept in game theory characterizing *stable* joint behaviors of interacting agents — joint strategies from which no agent has an incentive to unilaterally deviate.

## The classical hierarchy

- **Dominant-strategy equilibrium.** Each agent plays their best response *regardless* of others' strategies.
  Strongest concept; rare to exist.
- **Nash equilibrium.** Each agent plays a best response to the others' equilibrium strategies.
  Most general; exists in mixed strategies for finite games (Nash 1950).
- **Subgame-perfect equilibrium.** Nash equilibrium that is also a Nash equilibrium in every subgame.
  Eliminates non-credible threats in sequential games.
- **Bayesian Nash equilibrium.** Nash equilibrium when agents have private types/information.
- **Perfect Bayesian equilibrium.** Bayesian extension with belief consistency in sequential games.
- **Correlated equilibrium.** Allows for a public randomization device; weaker than Nash, broader.
- **Trembling-hand perfect.** Robust to small mistakes by other agents.

Each refines or extends the previous, ruling out implausible equilibria or extending to richer settings.

## Why "equilibrium concept" plural

For most games, *multiple* equilibria exist.
Different equilibrium concepts disagree about which to pick:

- **Multiplicity of Nash equilibria.** Coordination games have multiple pure Nash equilibria (drive on left, drive on right).
- **Refinement debates.** Subgame-perfectness, trembling- hand, sequential equilibrium each rule out some Nash equilibria — but disagree about which.
- **Equilibrium selection** is a separate problem: even given an equilibrium concept, which equilibrium do agents end up at?
  Schelling-point analysis, Pareto- dominance, risk-dominance offer partial answers.

## Stability vs reachability

An equilibrium is *stable* (no unilateral deviation profitable) but not necessarily *reachable* (agents may not actually arrive at it from arbitrary starting strategies).
Equilibrium concepts characterize stability; *learning dynamics* characterize reachability.

In multi-agent reinforcement learning:

- Self-play sometimes converges to Nash equilibrium (zero-sum two-player games).
- Often does not (general-sum games, multi-player games).
- May converge to non-equilibrium attractors (cycles, chaos).

The gap between equilibrium analysis and dynamical analysis is substantial.

## Limits

- **Existence.** Some games have no equilibrium of a given type; some have continuum-many.
- **Computability.** Computing Nash equilibria is PPAD-complete; intractable for large games.
- **Normative status.** Whether real agents (especially bounded-rationality agents) actually play equilibria is contested.
- **Multiplicity.** When multiple equilibria exist, the theory does not predict which is selected.

## In multi-agent AI

Equilibrium concepts matter for:

- **Multi-agent RL convergence.** What is the agents converging *to*?
- **Mechanism design.** Mechanisms are designed so that desired outcomes are equilibria.
- **Adversarial training.** GANs, adversarial RL aim at Nash equilibria of the generator-discriminator game.
- **AI safety.** When AI agents face other AI agents, equilibrium analysis informs predictions of joint behavior.

## Status

Foundational.
The core concepts (Nash, subgame-perfect, Bayesian Nash) are well-understood.
Active areas: equilibrium selection, learning-dynamics-equilibrium relationship, multi-agent RL convergence theory, applicability to bounded-rationality agents.
