---
title: "Mutual Credit and Obligation Clearing"
description: "WIR counter-cyclicality, Sardex clearing savings, the Slovenian national clearing dataset and the Cycles Protocol, LETS inclusion, with numbers"
date-created: 2026-10-08
aliases: []
keywords:
  - mutual-credit
  - obligation-clearing
  - WIR
  - Sardex
  - LETS
teaches:
  - "Mutual Credit and Obligation Clearing"
authors:
  - claude-sonnet-5-5
type: text
references:
  stodder2009:
    authors:
      - James Stodder
    title: "Complementary credit networks and macroeconomic stability: Switzerland’s Wirtschaftsring"
    year: 2009
    publication: Journal of Economic Behavior and Organization
    doi: 10.1016/j.jebo.2009.06.002
    url: https://doi.org/10.1016/j.jebo.2009.06.002
  fleischman2020:
    authors:
      - Tomaž Fleischman
      - Paolo Dini
      - Giuseppe Littera
    title: "Liquidity-saving through obligation-clearing and mutual credit: an effective monetary innovation for SMEs in times of crisis"
    year: 2020
    publication: Journal of Risk and Financial Management
    doi: 10.3390/jrfm13120295
    url: https://doi.org/10.3390/jrfm13120295
  fleischman2021:
    authors:
      - Tomaž Fleischman
      - Paolo Dini
    title: Mathematical foundations for balancing the payment system in the trade credit market
    year: 2021
    publication: Journal of Risk and Financial Management
    doi: 10.3390/jrfm14090452
    url: https://doi.org/10.3390/jrfm14090452
  motta2017:
    authors:
      - Wallis Motta
      - Paolo Dini
      - Laura Sartori
    title: "Self-funded social impact investment: an interdisciplinary analysis of the Sardex mutual credit system"
    year: 2017
    publication: Journal of Social Entrepreneurship
    doi: 10.1080/19420676.2017.1321576
    url: https://doi.org/10.1080/19420676.2017.1321576
  dini2019:
    authors:
      - Paolo Dini
      - Alexandros Kioupkiolis
    title: "The alter-politics of complementary currencies: the case of Sardex"
    year: 2019
    publication: Cogent Social Sciences
    doi: 10.1080/23311886.2019.1646625
    url: https://doi.org/10.1080/23311886.2019.1646625
  fleischmanbuchman2026:
    authors:
      - Tomaž Fleischman
      - Ethan Buchman
    title: "Deepening the secondary market: integrating trade credit into market clearing with the Cycles Protocol"
    year: 2026
    publication: arXiv:2605.02436
    doi: 10.48550/arxiv.2605.02436
    url: https://arxiv.org/abs/2605.02436
  williams1996:
    authors:
      - Colin C. Williams
    title: "Local exchange and trading systems: a new source of work and credit for the poor and unemployed?"
    year: 1996
    publication: Environment and Planning A
    doi: 10.1068/a281395
    url: https://doi.org/10.1068/a281395
---

This note records what the literature establishes about mutual credit and multilateral obligation clearing, and what a pooling instrument can take from it. The first-party surfaces of Sardex, WIR, Credit Commons, Holo and Unyt are read in the sibling record `2026-10-08-mutual-credit-first-party-sardex-wir-credit-commons.json` and its note; this note covers the academic evaluations and the clearing mathematics. House background: [tally](../../../../../../glossary/terms/tally.md), [tally-credit](../../../../../../glossary/terms/tally-credit.md), [social-collateral](../../../../../../../../../economics-science-services-section/content/text/glossary/terms/social-collateral.md), [joint-liability-lending](../../../../../../../../../economics-science-services-section/content/text/glossary/terms/joint-liability-lending.md). The velocity and turnover table for WIR is in the demurrage note.

## Counter-cyclical credit: WIR

Stodder 2009 (abstract, from RePEc) studies the Swiss Wirtschaftsring, founded in 1934. Its credit provides residual spending power that is counter-cyclical: individuals short of cash in a recession use more WIR credit, so WIR money is negatively correlated with GDP in the short run, unlike ordinary money, and this is confirmed by empirical estimates. The paper concludes such credit networks play a stabilizing role that should be considered in monetary policy. Sample size and coefficients are in the subscription-only body. The velocity paper read in the demurrage record puts WIR velocity at 2.6 and turnover at CHF 1.55 billion in 2011.

## Clearing: Sardex data

Fleischman et al. 2020 (abstract) use real Sardex data on the obligation network: obligation-clearing alone cut net internal debt by about 25 percent, and clearing together with mutual credit as a liquidity source cut it by about 50 percent. They add that the circuit manager can give banks information on individual companies, which helps lenders and relieves non-performing-loan companies, and recommend including the tax authority as a node in the obligation network. Fleischman & Dini 2021 prove for a payment system with any number of liquidity sources that the liquidity saved by clearing is maximum, using graph theory, and define a balanced subsystem that can be settled in full and removed as a whole.

Motta et al. 2017 interview 29 Sardex members and argue the system funds itself endogenously within a bounded context, a form of self-funded social impact investment. Dini & Kioupkiolis 2019 read the circuit as an alter-political combination of bottom-up micropolitics and top-down infrastructure design, claiming that a market mediating only the real economy provides a shield against financial crises.

## Clearing at national scale: Slovenia and the Cycles Protocol

Fleischman & Buchman 2026 (arXiv, full text) give the largest dataset in the sources read. Trade credit is large: accounts payable of US non-financial firms are about three times bank credit and fifteen times commercial paper, trade credit is about 20 percent of GDP across advanced economies, and supplier trade credit sustains up to 14 percent higher output and absorbs roughly 45 percent of output losses in modelled shocks. The Slovenian national clearing system, using administrative records of the agency AJPES, covers 111 monthly clearing cycles from mid-2016 to early 2025: 80,124 unique firms, 5,880,447 obligations, average monthly volume 269 million euro, average obligation 5,464 euro. The network shrank from about 24,000 firms in 2016 to about 11,000 in 2025 while the average obligation rose from 4,217 to 7,320 euro. Specialised liquidity-provider firms hold 12.8 percent of submitted debt, but removing them cuts cleared value by 55.5 percent on average (range 31.8 to 71.2 percent), because their obligations sit on long cycles that bridge many firms. The paper's Cycles Protocol is a distributed multilateral clearing mechanism using double-entry accounting and atomic cycle execution; it compresses balance sheets without novation, so it does not move counterparty risk to a central party. The authors state that the Slovenian evidence is descriptive and shows no performance, security or governance property of a protocol implementation.

## LETS

Williams 1996 (abstract) surveyed LETS nationally and in Manchester: membership was growing rapidly with a high share of poor and unemployed members, but use was mainly by a disenfranchised middle class; wider inclusion needs changes in the operating environment of LETS and in the government approach to benefit claimants.

## What a pooling instrument can do with this

- Mutual credit and clearing are separate levers with measured, additive effect: 25 percent net-debt reduction from clearing alone, 50 percent with a liquidity source. A pool can be the liquidity source (a node with a store of value) for an obligation graph among members.
- Liquidity providers are structurally disproportionate: 12.8 percent of debt supports 55.5 percent of clearing. A pool that places capital at the bridge nodes of members' obligation cycles captures that leverage; this is a measurable placement rule.
- WIR's counter-cyclicality suggests drawing on the pool's credit leg precisely when members' cash is short; the evidence is one network's time series.
- Including a tax authority as a node (the recommendation of Fleischman et al. 2020) points to a pool that clears members' tax and fee obligations as part of the same graph.
- The sources contain no on-chain obligation-clearing deployment with measured results; the Cycles Protocol is a design with Slovenian analogue data.
