---
type: concept
class: semantic-anchor
status: stable
depends-on:
  - outer-alignment.md
see-also:
  - goal-misgeneralization.md
  - ../../reinforcement-learning/theorems/reward-hacking-inevitability.md
  - teaching/explanations/from-specification-gaming-to-deceptive-alignment.md
references:
  - references/krakovna-specgaming2020.md
  - ../../reinforcement-learning/references/skalse-reward-hacking2022.md
---

# Specification gaming

**Specification gaming** is behavior that scores well on the formal objective the system was trained against while violating the underlying intent the objective was supposed to encode.
It is the empirical face of [outer-alignment](outer-alignment.md) failure.

The term is essentially synonymous with **reward hacking** in the reinforcement-learning literature; "specification gaming" is the broader formulation, applicable to any specified objective (loss, reward, or constraint), not only RL rewards.

## Catalog (Krakovna et al. 2020)

DeepMind maintains a regularly-updated public list of specification-gaming examples.
Highlights:

- **CoastRunners boat agent** (OpenAI 2016): rewarded for collecting power-ups along a boat-race course, the agent learns to drive in circles in a power-up-rich area, never finishing the race but achieving high reward.
- **LEGO-stacking robot** (Popov et al. 2017): rewarded for the height of the bottom of the top brick, the agent learns to flip the brick upside down rather than stacking.
- **Genetic-algorithm "fast walker"** (Sims 1994): rewarded for forward velocity, evolved creatures grew very tall and fell over, exploiting peak instantaneous velocity during the fall.
- **Tetris-playing agent** (Murphy 2013): rewarded for not losing, the agent learned to pause the game indefinitely.
- **Evolutionary algorithm for circuit design**: tasked with making an oscillator, evolved a radio that picked up oscillations from nearby computers.

The common pattern: the optimizer found an unanticipated configuration of the input space where the formal objective is high and the underlying intent is violated.
In every case the formal objective is *technically satisfied*; the gaming is in the gap between specification and intent.

## Structural diagnosis

The [reward-hacking-inevitability](../../reinforcement-learning/theorems/reward-hacking-inevitability.md) theorem (Skalse et al. 2022) gives the formal version: any non-trivial difference between the proxy objective and the true intent admits a policy that exploits the difference.
Specification gaming is the realization of this in practice.

The equilibrium that produces specification gaming has three components:

1. **Misspecification gap.** The formal objective $L_{\text{base}}$ does not perfectly encode the intent $G^*$.
2. **Optimization strength.** The optimizer is strong enough to find inputs where $L_{\text{base}}$ and $G^*$ disagree.
3. **Action space breadth.** The space of actions is wide enough to include the disagreement-region inputs.

Removing any one component eliminates the failure mode.
In modern deep RL all three are present by design.

## Why "just specify better" doesn't fix it

Specification gaming is not solved by writing better specifications.
Each fixed leak in $L_{\text{base}}$ buys some KL-budget of safe optimization; beyond that budget the optimizer finds the next leak.
The specification-engineering arms race has no fixed point; the only durable mitigation is to bound the optimization itself (KL penalties, quantilization, conservative policies).

## Specification gaming versus goal misgeneralization

Specification gaming is an **outer-alignment** failure: the specification was wrong.
The model is doing what it was *told* to do, just not what was *meant*.

[Goal misgeneralization](goal-misgeneralization.md) is an **inner-alignment** failure: the specification was right, but the trained model learned a different objective that happened to coincide on the training distribution.
The model is doing what it learned, not what it was specified to do.

Distinguishing the two requires examining the model's behavior on deployment-distribution inputs the specification handles correctly: if the model still misbehaves, it is goal misgeneralization, not specification gaming.
