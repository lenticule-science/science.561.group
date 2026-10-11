---
title: "Ergodicity Economics and Pooling"
description: "What ergodicity economics establishes about growth-rate gains from pooling and sharing, with the formulas, the insurance example, and the network simulation"
date-created: 2026-10-08
aliases: []
keywords:
  - economics
  - ergodicity
  - pooling
  - insurance
  - cooperation
teaches:
  - "Ergodicity and Pooling"
authors:
  - claude-sonnet-5-5
type: text
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

Ergodicity economics asks which growth rate an individual who plays a multiplicative process over time actually experiences, and finds that pooling and sharing raises it. This note records what the sources establish and what a pooling instrument can take from them. Background on the concept is in [ergodicity](../../../../../../glossary/terms/ergodicity.md), [volatility-drag](../../../../../../../../../finance-science-services-section/content/text/glossary/terms/volatility-drag.md) and [kelly-criterion](../../../../../../../../../finance-science-services-section/content/text/glossary/terms/kelly-criterion.md).

## The growth-rate formula

Peters 2019 argues that expected utility theory and its descendants assume ergodicity indiscriminately, and that addressing the question resolves many economic puzzles in an empirically testable way. Its article body is behind a paywall; the formulae below were read in the authors' preprints.

In Peters & Adamou 2018 (the preprint of the cooperation paper under its earlier title) each entity's resources follow multiplicative noisy growth with drift mu and volatility sigma. A non-cooperating entity grows over long time at g = mu - sigma^2/2. N entities that pool and share every step grow at g = mu - sigma^2/(2N). The premium is (sigma^2/2)(1 - 1/N), so larger cooperatives are favored, and in the many-cooperator limit the time-average rate approaches mu. When the fluctuations of the entities are correlated with coefficient rho, the limit is mu - sigma^2 rho/2: a benefit exists unless fluctuations are perfectly correlated, and the paper states that cooperation relies on diversity in individual outcomes. For two entities with different drifts and volatilities the paper derives that the faster grower should share with the slower when mu1 - 3 sigma1^2/4 < mu2 - sigma2^2/4. Partial cooperation, resembling taxation and redistribution, is deferred in that paper to a separate manuscript. The published version, Peters & Adamou 2022, states the result as: repeated pooling and sharing reduces the effective size of fluctuations and increases the time-average growth rate, which approaches the ensemble-average rate in the many-cooperator limit, and says the model needs no complementarity or threshold benefit.

## Insurance as the worked case

Peters & Adamou 2017 apply the same logic to a two-party contract: a shipowner of wealth $100,000 and an insurer ten times richer. Under expectation-value evaluation the contract is a zero-sum puzzle. Under time-average evaluation the shipowner's growth rises from 1.9% to 2.2% per month (+0.24%) and the insurer's rises by 0.0071% per month from zero, so both sign.

## Networks and the poverty trap

Wand et al. 2024 put 64 x 64 = 4096 agents on a periodic lattice with coordination number four and allow insurance contracts only between neighbours. Every agent still profits from cooperating. Clusters of rich and poor agents form endogenously and inequality persists for long durations, consistent with the poverty-trap phenomenon; a rich agent collapses unless other rich agents are near enough to insure its risk. Jolakoski et al. 2024 study reallocating geometric Brownian motion with stochastic resetting and report that optimal resetting balances growth and redistribution and reduces inequality.

## Human behaviour

Vanhoyweghen et al. 2025 ran two stated-preference experiments (n = 200 each, 30 multiplicative gambles each) and report that participants shared gains and losses in ways that follow time-average optimisation rather than expected gain.

## What a pooling instrument can do with this

- The pooling gain is a variance-reduction gain, sigma^2/2 times (1 - 1/N), and it needs members whose outcomes are not perfectly correlated. A pool's design variable is the correlation of its members' shocks, and its marginal member is worth most when least correlated with the others.
- The gain is paid in growth rate for members who hold positions that scale with wealth. A pool whose contributions are fixed in amount rather than proportional to wealth is outside the model.
- On a network, access to insurers is local; a pool that connects poor clusters to richer ones addresses the clustering Wand et al. 2024 report.
- The sources do not report a measured pooling gain in any operating cooperative; the evidence is theoretical, simulated, and one stated-preference experiment.
