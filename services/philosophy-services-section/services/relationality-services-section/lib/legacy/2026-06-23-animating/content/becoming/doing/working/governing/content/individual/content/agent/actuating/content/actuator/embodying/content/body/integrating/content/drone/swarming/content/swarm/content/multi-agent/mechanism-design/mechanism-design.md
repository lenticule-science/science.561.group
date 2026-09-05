---
type: concept
class: classical
status: active
depends-on:
  - multi-agent-system.md
see-also:
  - social-choice.md
  - ../objects/auction.md
  - ../theorems/revelation-principle.md
  - ../theorems/gibbard-satterthwaite.md
references:
  - references/vickrey1961.md
  - references/shoham-leyton-brown2009.md
---

# Mechanism design

**Mechanism design** is the inverse problem of game theory: given a desired social outcome (allocation, decision, collective action), design the *rules of the game* — actions available, payoffs, communication protocol — so that self-interested agents acting strategically reach the desired outcome at equilibrium.

## The framing

Standard game theory: given a game, predict equilibria.
Mechanism design: given desired equilibria, design the game.
Hence "inverse game theory."

A mechanism specifies:

- **The action space** for each agent (what they can do or report).
- **The outcome function** mapping joint actions to outcomes.
- **Payments or transfers** if any.

The designer cannot directly choose agents' preferences; those are private.
The designer chooses mechanism structure such that agents' best-response behavior implements desired outcomes.

## Key constraints

- **Incentive compatibility (IC).** Agents do best by reporting true preferences (or playing intended strategies); strategic manipulation is unprofitable.
- **Individual rationality (IR).** Each agent is no worse off participating than not.
- **Budget balance.** Payments sum to zero (or to a designer-specified surplus).
- **Pareto efficiency.** The implemented outcome is Pareto-optimal.
- **Computational tractability.** The mechanism can be computed and operated.

These constraints often conflict; mechanism design is the art of balancing them.

## Foundational results

- **[Revelation principle](../theorems/revelation-principle.md)** (Myerson, others).
  Any equilibrium outcome of any mechanism is achievable by an *incentive-compatible direct-revelation* mechanism — agents report preferences truthfully.
  This reduces the design space enormously.
- **[Gibbard-Satterthwaite](../theorems/gibbard-satterthwaite.md)**.
  For voting over three or more options, every non- dictatorial mechanism is manipulable.
  Severe limit on truthful voting.
- **VCG mechanisms** (Vickrey-Clarke-Groves).
  For *quasi-linear utility* and *unrestricted preferences*, the VCG mechanism is incentive-compatible and efficient.
  The dominant practical mechanism.
- **Vickrey auction.** Second-price sealed-bid auction; truth-revealing as dominant strategy.
  The simplest practical incentive-compatible mechanism.

## Applications

- **Auction design.** Spectrum auctions, online ad auctions, treasury auctions.
- **Matching markets.** School choice, residency matching, organ exchange.
- **Public goods provision.** Mechanisms for honest preference revelation about funding levels.
- **Combinatorial allocation.** Allocating bundles of goods to agents with combinatorial preferences.

## In multi-agent AI systems

Mechanism design becomes relevant when:

- **Multiple AI agents bid for resources.** Allocation of compute, bandwidth, attention.
- **AI agents represent users.** AI proxies need mechanisms ensuring honest preference relay.
- **AI marketplaces.** Where AI agents transact services or capabilities, mechanism design governs.
- **Multi-agent training.** When agents learn in environments with shared resources, mechanism design shapes what they learn to do.

## Limits

- **Bounded rationality.** Mechanisms assume agents optimize; bounded agents may behave differently.
- **Information assumptions.** Many results assume common-prior beliefs about the type distribution; violations break results.
- **Computational complexity.** Some mechanisms are NP- hard to compute; tractable approximations may lose guarantees.
- **Behavioral deviations.** Real agents (and possibly AI agents) deviate from theoretical predictions; mechanism designers must account for these.

## Status

Foundational area of microeconomic theory, with active extension to AI multi-agent systems.
Whether classical mechanism-design results apply to LLM-agent multi-agent systems is an open question; see [is-mechanism-design-applicable](questions/is-mechanism-design-applicable.md).
