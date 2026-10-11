---
title: "ROSCA Economics"
description: "Allocation, participation, commitment, enforcement and shock behaviour of rotating savings and credit associations, with the Kibera and Kenya numbers"
date-created: 2026-10-08
aliases: []
keywords:
  - rosca
  - savings
  - commitment
  - enforcement
teaches:
  - "ROSCA Economics"
authors:
  - claude-sonnet-5-5
type: text
references:
  besley1994:
    authors:
      - Timothy Besley
      - Stephen Coate
      - Glenn C. Loury
    title: Rotating savings and credit associations, credit markets and efficiency
    year: 1994
    publication: Review of Economic Studies
    doi: 10.2307/2297915
    url: https://doi.org/10.2307/2297915
  fang2015:
    authors:
      - Hanming Fang
      - Rongzhu Ke
      - Li-An Zhou
    title: Rosca meets formal credit market
    year: 2015
    publication: NBER Working Paper 21683
    doi: 10.3386/w21683
    url: https://doi.org/10.3386/w21683
  andersonbaland2002:
    authors:
      - Siwan Anderson
      - Jean-Marie Baland
    title: The economics of roscas and intrahousehold resource allocation
    year: 2002
    publication: Quarterly Journal of Economics
    doi: 10.1162/003355302760193931
    url: https://doi.org/10.1162/003355302760193931
  gugerty2007:
    authors:
      - Mary Kay Gugerty
    title: "You can’t save alone: commitment and rotating savings and credit associations in Kenya"
    year: 2007
    publication: Economic Development and Cultural Change
  casaburi2019:
    authors:
      - Lorenzo Casaburi
      - Rocco Macchiavello
    title: "Demand and supply of infrequent payments as a commitment device: evidence from Kenya"
    year: 2019
    publication: American Economic Review
    doi: 10.1257/aer.20180281
    url: https://doi.org/10.1257/aer.20180281
  chiteji2002:
    authors:
      - Ngina Chiteji
    title: "Promises kept: enforcement and the role of rotating savings and credit associations in an economy"
    year: 2002
    publication: Journal of International Development
    doi: 10.1002/jid.847
    url: https://doi.org/10.1002/jid.847
  koike2018:
    authors:
      - Shimpei Koike
      - Mayuko Nakamaru
      - Tokinao Otaka
      - Hajime Shimao
      - Ken-Ichi Shimomura
      - Takehiko Yamato
    title: "Reciprocity and exclusion in informal financial institutions: an experimental study of rotating savings and credit associations"
    year: 2018
    publication: PLOS ONE
    doi: 10.1371/journal.pone.0202878
    url: https://doi.org/10.1371/journal.pone.0202878
  czura2022:
    authors:
      - Kristina Czura
      - Stefan Klonner
    title: "Financial market responses to a natural disaster: evidence from credit networks and the Indian Ocean tsunami"
    year: 2022
    publication: Journal of Development Economics
    doi: 10.1016/j.jdeveco.2022.102996
    url: https://doi.org/10.1016/j.jdeveco.2022.102996
  muchapireyi2025:
    authors:
      - Humphrey Takunda Muchapireyi
    title: "Trustless: participation in ROSCA games"
    year: 2025
    publication: Preprints.org
    doi: 10.20944/preprints202511.1427.v1
    url: https://doi.org/10.20944/preprints202511.1427.v1
---

This note records what the economics literature establishes about rotating savings and credit associations (roscas): why people join, how pot allocation is chosen, how default is controlled, and how roscas interact with credit markets. House background: [rotating-savings-and-credit-association](../../../../../../glossary/terms/rotating-savings-and-credit-association.md), [savings-group](../../../../../../glossary/terms/savings-group.md), [social-collateral](../../../../../../glossary/terms/social-collateral.md), [joint-liability-lending](../../../../../../glossary/terms/joint-liability-lending.md), [prize-linked-savings](../../../../../../../../../finance-science-services-section/content/text/glossary/terms/prize-linked-savings.md).

## Allocation and efficiency

Besley et al. 1994 model individuals saving for an indivisible good and compare roscas that allocate the pot at random with roscas that allocate by bidding. Neither is efficient, individuals are better off with a credit market than with a bidding rosca, and a random rosca can sometimes give higher ex ante expected utility than a credit market. Fang et al. 2015 add that a perfect credit market completely crowds out the rosca, while an imperfect credit market and a rosca complement each other and raise welfare; welfare need not rise monotonically as credit markets improve.

## Participation in Kibera

Anderson & Baland 2002 (full text) collected data on 520 households in Kibera, Nairobi, with 385 roscas. The majority had neither random nor bidding allocation but a pre-determined order: 69.2 percent did not change order after a cycle; the median number of cycles was 3.2 and the median cycle length 6.1 months. A pre-determined order means the last recipient is worse off ex post, which the random-allocation theory cannot explain. 84 percent of rosca members were women. A woman aged 18 or over participated with probability 40.0 percent (53 percent if living in a couple, 25.3 percent if not; 68.5 percent if working, 74.4 percent if working and in a couple), against 10.1 percent for men. The authors' explanation is that a wife uses a rosca to protect her savings from her husband's claims for immediate consumption.

Gugerty 2007 (abstract) studies 70 roscas in western Kenya and finds the data consistent with a commitment hypothesis: roscas are a collective mechanism against time-inconsistent preferences ("you can't save alone"). Casaburi & Macchiavello 2019 show in Kenyan dairy experiments that farmers pay sizable costs to receive infrequent payments as a commitment device, and that poor contract enforcement limits competition in supplying them.

## Enforcement and default

Chiteji 2002 links the cost of enforcing membership terms to the viability of roscas. Koike et al. 2018 ran a laboratory experiment on fixed roscas where the order of receipt is known: voting to exclude low contributors raised contributions both before and after receipt of the pot; members reciprocated and punished non-contributors; and an exogenous rule barring receipt without prior contribution did not raise contributions.

## Roscas under shock

Czura & Klonner 2022 estimate the causal effect of the 2004 Indian Ocean tsunami on roscas along the South Indian coast: the supply of funds stayed remarkably stable, demand by small and medium entrepreneurs rose significantly, and funds were channelled from wage-employed members and commercial investors to entrepreneurs.

## On-chain roscas

A 2025 preprint, Muchapireyi 2025, proposes anonymity-rated pools with fees and penalties as collateral and variable cycle lengths, and reports that Zimbabwean rounds now vary the payout from cash to bank transfer, mobile money and goods. The abstract reports no deployed contract or measured default rate. No on-chain rosca evaluation with deployed measurements was found.

## What a pooling instrument can do with this

- Order is mostly fixed in practice (69.2 percent unchanged), so an instrument that publishes the order up front and prices the last-position disadvantage (a rebate or interest to late recipients) matches observed practice better than random allocation.
- The commitment finding means part of the product is the schedule itself; a non-withdrawable cycle is a feature, not a cost.
- Exclusion by member vote raised contributions in the experiment, while a mechanical penalty did not: a pool could give members a voting right to exclude defaulters ahead of automatic slashing.
- Roscas shifted funds toward entrepreneurs after a disaster, so a pool with heterogeneous member types can reallocate across them in a shock.
- Women's participation near 74 percent for working women in a couple suggests member-level targeting of intrahousehold protection; the sources give no on-chain evidence.
