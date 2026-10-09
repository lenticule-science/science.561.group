---
type: theorem
class: classical
status: proved-with-conditions
depends-on:
  - teaching/explanations/equilibrium-concept.md
see-also:
  - ../objects/joint-policy.md
references:
  - references/koutsoupias-papadimitriou1999.md
---

# Price of anarchy

## Statement

The **price of anarchy** (PoA) of a game is the worst-case ratio of social welfare at the *worst Nash equilibrium* to social welfare at the *socially optimal* outcome: $$\text{PoA} = \frac{\text{social welfare at optimum}}{\text{social welfare at worst Nash}}.$$

A small PoA means decentralized self-interested play approaches the centrally-optimal outcome; a large PoA means decentralization is costly.

For specific game classes, PoA is bounded:

- **Selfish routing** (Roughgarden-Tardos): PoA $\leq 4/3$ for parallel-link congestion routing with linear latencies.
- **Network formation games**: PoA bounds depending on cost structure.
- **Load balancing**: PoA $\leq 4/3$ for many natural variants.
- **Auctions**: Many auction settings have constant-factor PoA.

## Why it matters

The PoA quantifies the *cost of decentralization*.
If PoA is small, designers can rely on agents' self-interest; the equilibrium will be close to optimal anyway.
If PoA is large, designers must intervene (mechanism design, side payments, regulation) to align self-interest with collective optimum.

## Variants

- **Pure PoA.** Worst pure-strategy Nash.
- **Mixed PoA.** Worst mixed-strategy Nash.
- **Coarse PoA.** Worst correlated equilibrium or no-regret outcome (often easier to bound, larger).
- **Price of stability.** Best Nash to optimum ratio (lower bound on what equilibria can achieve).

## What it shows

- **Bounded inefficiency.** Many natural games have small PoA; decentralization is cheap.
- **Worst-case is informative.** Even when expected inefficiency is small, worst-case bounds on PoA bound what could go wrong.
- **Incentive design.** Mechanisms achieving small PoA in natural games are designable.
- **Universal limits.** Some game classes have unboundedly bad PoA; no incentive scheme rescues them.

## In multi-agent AI

PoA matters when:

- **Decentralized AI resource allocation.** What's the efficiency loss from letting AI agents bid for resources rather than centrally allocating?
- **Multi-agent reinforcement learning.** Convergence to Nash equilibrium may yield substantially worse performance than the social optimum.
- **AI marketplaces.** PoA bounds the welfare loss of decentralized AI services compared to centrally optimized ones.
- **Selfish routing in AI systems.** Compute and bandwidth allocation across competing AI processes.

## Why "proved-with-conditions"

PoA bounds are *game-class specific*.
There is no general theorem "PoA is bounded by X for all games"; instead, for specific structured game classes, specific PoA bounds are proved.
The framework is general; each application requires a problem-specific analysis.

## Limits

- **Worst-case may be pessimistic.** Average PoA is often much better; PoA gives upper bound on inefficiency.
- **Equilibrium reachability.** PoA bounds *equilibrium* outcomes; agents may not reach equilibrium.
- **Multiplicity.** Different equilibria have different social welfare; PoA captures the worst.

## Status

Foundational concept introduced by Koutsoupias & Papadimitriou 1999, later developed extensively (Roughgarden's *smoothness framework* generalizes many PoA results).
Active research area: PoA for game classes relevant to AI multi-agent systems.
