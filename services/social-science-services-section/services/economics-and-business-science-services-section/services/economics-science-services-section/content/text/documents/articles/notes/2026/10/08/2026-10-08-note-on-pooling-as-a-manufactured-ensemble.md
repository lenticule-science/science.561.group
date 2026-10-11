---
title: "Pooling as a Manufactured Ensemble"
description: "The founding note of the Tidepool protocol's theory: the Peters and Adamou growth-rate result stated exactly (g = μ − σ²/2; μ − σ²/(2N); premium (σ²/2)(1 − 1/N); the ρ-limit; the two-party sharing rule), the insurance example, the behavioural evidence, the sizing note's reading of the pool as a sleeve with a barrier whose ruin is re-seeded, the absence of a measured pooling gain in an operating cooperative as the protocol's first falsifier, and the Lean module Decorrelation."
date-created: 2026-10-08
aliases: []
keywords:
  - tidepool
  - ergodicity
  - pooling
  - ensemble
  - decorrelation
  - insurance
  - cooperation
  - sleeve
  - barrier
  - falsifier
teaches:
  - "Pooling as a manufactured ensemble"
requires:
  - ergodicity
authors:
  - claude-sonnet-5-5
type: notes
name: 2026-10-08-note-on-pooling-as-a-manufactured-ensemble
status: active
references:
  peters2019:
    authors:
      - Ole Peters
    title: The ergodicity problem in economics
    year: 2019
    publication: Nature Physics
    doi: 10.1038/s41567-019-0732-0
    url: https://doi.org/10.1038/s41567-019-0732-0
  petersadamou2018:
    authors:
      - Ole Peters
      - Alexander Adamou
    title: An evolutionary advantage of cooperation
    year: 2018
    publication: arXiv:1506.03414v2
    url: https://arxiv.org/abs/1506.03414
  petersadamou2022:
    authors:
      - Ole Peters
      - Alexander Adamou
    title: The ergodicity solution of the cooperation puzzle
    year: 2022
    publication: Philosophical Transactions of the Royal Society A
    doi: 10.1098/rsta.2020.0425
    url: https://doi.org/10.1098/rsta.2020.0425
  petersadamou2017:
    authors:
      - Ole Peters
      - Alexander Adamou
    title: Insurance makes wealth grow faster
    year: 2017
    publication: arXiv:1507.04655v2
    url: https://arxiv.org/abs/1507.04655
  wand2024:
    authors:
      - Tobias Wand
      - Oliver Kamps
      - Benjamin Skjold
    title: "Cooperation in a non-ergodic world on a network: insurance and beyond"
    year: 2024
    publication: arXiv:2403.12095
    doi: 10.48550/arxiv.2403.12095
    url: https://arxiv.org/abs/2403.12095
  jolakoski2024:
    authors:
      - Petar Jolakoski
      - Pece Trajanovski
      - A. Pal
      - Viktor Stojkoski
      - Ljupčo Kocarev
      - Trifce Sandev
    title: "The impact of stochastic resetting on resource allocation: the case of reallocating geometric Brownian motion"
    year: 2024
    publication: arXiv:2411.12390
    doi: 10.48550/arxiv.2411.12390
    url: https://doi.org/10.48550/arxiv.2411.12390
  vanhoyweghen2025:
    authors:
      - Arne Vanhoyweghen
      - Cathy Macharis
      - Vincent Ginis
    title: Investigating the origins of redistributive behaviour in non-ergodic contexts
    year: 2025
    publication: Proceedings of the Royal Society A
    doi: 10.1098/rspa.2025.0598
    url: https://doi.org/10.1098/rspa.2025.0598
---

## What this note is

The Tidepool specification (the 2026-10-08 specification of the Tidepool protocol, §1) opens with one sentence of theory: Tidepool is a cooperative that manufactures an ensemble for people who face the time average. This note is the theory under that sentence. It states the result the sentence rests on exactly as the sources state it, says what the sources do and do not establish, reads it through the house's sizing note, and names the Lean module that carries the arithmetic. Every outside claim cites a row of the research record `2026-10-08-ergodicity-and-pooling.json`; the longer survey of the same record is [ergodicity economics and pooling](./2026-10-08-ergodicity-and-pooling.md). The concept itself is the glossary term [ergodicity](../../../../../../glossary/terms/ergodicity.md).

## The result, stated exactly

Peters 2019 argues that expected utility theory and its descendants assume ergodicity indiscriminately: the source's words are "the prevailing formulations of economic theory — expected utility theory and its descendants — make an indiscriminate assumption of ergodicity." The article body is behind the journal paywall; the formulae below are read from the preprint of the cooperation paper, Peters & Adamou 2018, full text.

Each entity's resources follow multiplicative noisy growth with drift μ and volatility σ.

1. **Alone.** A non-cooperator grows over long time at g = μ − σ²/2.
2. **Pooled.** N cooperators who pool and share every step grow at g = μ − σ²/(2N). The source prints it as "ḡ y (N ) = µ − σ²/2N".
3. **The premium.** The premium of cooperating is (σ²/2)(1 − 1/N). The source: "The premium increases with the number of cooperators as 1 − 1/N ... implying that larger cooperatives are favored over smaller ones." As N grows the pooled rate approaches μ.
4. **Correlated fluctuations.** With pairwise correlation ρ in the entities' fluctuations the many-cooperator limit is μ − σ²ρ/2. The source: "provided fluctuations are not perfectly correlated, a cooperation benefit always exists ... In our setup, cooperation relies on diversity in individual outcomes." At ρ = 1 the limit is μ − σ²/2 and the premium is zero.
5. **The two-party sharing rule.** For N = 2 with different drifts and volatilities, "the fast grower should share with the slow grower if µ1 − 3σ1²/4 < µ2 − σ2²/4." Written as the condition on the pair: μ₁ − 3σ₁²/4 < μ₂ − σ₂²/4.

The published version, Peters & Adamou 2022, states the result as: "Repeated pooling and sharing of resources reduces the effective size of fluctuations and increases the time-average growth rate, which approaches the ensemble-average growth rate in the many-cooperator limit." It also states that the model needs no complementarity or threshold benefit: "Classical treatments assume circumstances where combining resources creates an immediate benefit, e.g. through complementarity or thresholds. Here we ask whether cooperation is predictable without such circumstances." The record carries the formulae from the preprint row, not from the journal text. Partial cooperation (sharing only a fraction, as in taxation) is deferred in the preprint to a separate manuscript, so nothing in this note is a statement about a pool that shares part of what members hold.

What the result asks of a pool, read off the formulae and nothing else:

- The gain is the reduction of σ² to σ²/N, or to σ²ρ in the limit. Its design variable is ρ, the correlation of members' shocks, not membership count. N helps only to the extent that added members are not perfectly correlated with those already in.
- The gain is paid in time-average growth for entities whose resources scale multiplicatively with what they hold. A pool whose contributions are fixed amounts is outside the model.
- The sharing rule is an admission test between two parties and is the test the specification uses for a reseed edge between sleeves and between pools.

## The insurance example

Peters & Adamou 2017 apply the same logic to a two-party contract. Under expectation-value evaluation insurance is a zero-sum puzzle: what the insurer expects to gain the insured expects to lose. Judged by time-average growth, "here +0.24% per month ... here +0.0071% per month. Hence, in the time paradigm not only the shipowner but also the insurer should sign the contract." The record reads this as the shipowner's growth rising from 1.9% to 2.2% per month and the insurer's rising by 0.0071% per month from zero, with the puzzle dissolving without utility functions or information asymmetry: "business happens when both parties grow faster." The example is the two-party case of the pooled formula, and it is the observation that insurance is a pool whose margin is set by the party with the bigger ensemble.

## The network and the poverty trap

Wand et al. 2024, a simulation of 4096 agents on a lattice, restrict insurance contracts to lattice neighbours and still find that "all agents profit from cooperating through insurance." Clusters of rich and poor agents emerge endogenously and "wealth inequalities persist for a long duration, consistent with the phenomenon known as the poverty trap"; a rich agent collapses unless other rich agents are nearby to insure it. The record notes that per-agent growth-rate gains are given only in figures. Jolakoski et al. 2024 study reallocating geometric Brownian motion with stochastic resetting and report that "optimal resetting can effectively balance growth and redistribution, reducing inequality." The federation topology that reads these results as a design rule is the subject of a later note.

## The behavioural evidence

Vanhoyweghen et al. 2025 report an empirical study with n = 200 in which participants shared potential gains and losses in multiplicative gambles. The source: "The observed behaviour supports the hypothesis that an element of human decision-making prefers time-average optimization over expected outcomes." The record does not carry the country of recruitment or effect sizes, which the abstract does not state. The study is stated-preference, not a record of any group's actual pooling.

## The house's reading: ruin re-seeded, the pool as a sleeve with a barrier

The house's sizing note (`2026-09-04-note-on-sizing-without-a-bank`) supplies the reading this note adopts. Ensemble reasoning is rational for an actor whose ruined trajectories are replayed from outside, as a frontier, a bank, a discharge or a bailout replays them. A group with no such replenishment faces the time average, and an absorbing barrier above zero ends its trajectory before any ensemble average could smooth it. The sizing note's answer is that a pool is the ensemble such a group can build: N members each facing a time average, holding bounded sleeves, face together something closer to independent trajectories averaged at one moment, with each member's ruin no longer absorbing because the pool re-seeds it. Three constraints follow in that note and carry into the specification:

1. The pool is a sleeve too. It has its own barrier, the point below which it can no longer re-seed anyone, and that barrier is the group's survival line.
2. Draws are priced on circulation, not on balance: tally credit.
3. The pool is booked with two witnesses.

The specification realizes the first reading as the Reseed Mutual (B4): a member whose sleeve is below its declared barrier with an obligation due may claim, and the mutual re-seeds principal into the sleeve, capped, from the reserve. The formulae above explain why this is not charity: the member's absorbing barrier is moved from the member's trajectory to the pool's, where the pool's N makes ruin a rarer event, provided the shocks are not correlated. Where they are correlated, the barrier rises everywhere in the same month and the pool's own barrier rises fastest, which the sizing note records as the reason for the barrier being a time series and not a number.

## The first falsifier

The record contains no measured pooling gain in any operating cooperative. In its words the evidence is theoretical (Peters & Adamou 2018, 2022, 2017), simulated (Wand et al. 2024, Jolakoski et al. 2024) and one stated-preference experiment (Vanhoyweghen et al. 2025). The searches in the record that looked for a field measurement returned the network paper, the experiment and the insurance paper and nothing observational. Tidepool therefore stands on a theorem whose prediction has not been measured in the kind of body Tidepool is. That is the protocol's first falsifier, and it is stated in the specification's §10: the pooled variance reduction attributable to sites and pools is not positive over a year. The measurement is Tidepool's own: per-cycle outcome streams told as cells, the pooled variance computed from them, and the reduction attributable to each site and pool. If the reduction is zero or negative, the premium (σ²/2)(1 − 1/N) is not being collected, and the pool is a ledger with no ensemble in it.

## The Lean module

The arithmetic is carried by a module named `Decorrelation` in `ObsmetrologiaEconomics` (roadmap task TP-LEAN-015, to be written; no file exists at this note's date). Its declarations, by name:

- `ObsmetrologiaEconomics.Decorrelation.pooledVariance`: (1/N²) Σᵢⱼ σᵢσⱼρᵢⱼ in scaled integers, the pooled variance of §3 B10.
- `ObsmetrologiaEconomics.Decorrelation.marginalReduction`: a party's reduction of pooled variance.
- `ObsmetrologiaEconomics.Decorrelation.premium`: σ²(N − 1)/(2N) scaled, which is (σ²/2)(1 − 1/N).
- `ObsmetrologiaEconomics.Decorrelation.premium_nonneg`.
- `ObsmetrologiaEconomics.Decorrelation.premium_zero_iff_perfect_correlation`: ρ ≡ 1 gives the limit μ − σ²/2 and premium zero.
- `ObsmetrologiaEconomics.Decorrelation.shouldShare`: 4μ₁ − 3σ₁² < 4μ₂ − σ₂², the two-party rule multiplied through by four.
- `ObsmetrologiaEconomics.Decorrelation.shouldShare_irreflexive_at_equal`: a party does not share with an identical party.

The realizer is `DecorrelationV1` (specification A.15), judged by vectors of the suite `decorrelation`.

## Left open

- No source in the record fixes how a pool should weight members by marginal reduction. The specification makes the dividend first a weight and only later a payment; that choice is the house's.
- The record establishes nothing for partial cooperation. The specification's pools share yield and not wealth, so the full-sharing formulae are an upper bound the pool's design does not claim to reach.
- Whether member outcomes on Hive and the EVM sites are decorrelated enough for the premium to be material is a measurement the protocol makes after launch, not a result in the record.
