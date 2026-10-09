---
title: "UBI and Local Currency Protocols: Circles, Sarafu, Kolektivo, GoodDollar"
description: "Contract-level reading of Circles v2 trust-path personal currencies, Grassroots Economics Sarafu and Cosmo-Local Credit commitment pools, Kolektivo's partially-backed reserve and GoodDollar's daily UBI pool, with scale on 2026-10-08, evaluations, and failures"
date-created: 2026-10-08
aliases:
  - "ubi-and-local-currency-protocols"
  - "circles-sarafu-gooddollar"
keywords:
  - circles
  - sarafu
  - commitment-pooling
  - ubi
  - demurrage
  - local-currency
  - trust-graph
teaches:
  - "UBI and Local Currency Protocols: Circles, Sarafu, Kolektivo, GoodDollar"
requires: []
authors:
  - claude-sonnet-5-5
type: text
references:
  circlescontracts2026:
    authors:
      - Circles Contracts
    title: "aboutcircles/circles-contracts-v2: Hub, Circles, Demurrage, groups, treasury"
    year: 2026
    url: https://github.com/aboutcircles/circles-contracts-v2
  circleschain2026:
    authors:
      - Circles Chain Reads
    title: Circles v2 Hub on Gnosis Chain and the Circles RPC avatar table
    year: 2026
    url: https://rpc.aboutcircles.com
  soweluavanzo2023:
    authors:
      - Sowelu Avanzo
      - Teodoro Criscione
      - Julio Linares
      - Claudio Schifanella
    title: Universal Basic Income in a Blockchain-Based Community Currency
    year: 2023
    doi: 10.1145/3582515.3609538
    url: https://doi.org/10.1145/3582515.3609538
  alessandrolongo2025:
    authors:
      - Alessandro Longo
      - Teodoro Criscione
      - Julio Linares
      - Sowelu Avanzo
    title: "Impact of a Blockchain-based Universal Basic Income Pilot: The case of Circles UBI currency"
    year: 2025
    publication: "RePEc: Research Papers in Economics"
    publisher: Federal Reserve Bank of St. Louis
    doi: 10.48550/arxiv.2504.02714
    url: https://doi.org/10.48550/arxiv.2504.02714
  vangelispapadimitropoulos2024:
    authors:
      - Vangelis Papadimitropoulos
      - Giannis Perperidis
    title: "Universal basic income on blockchain: the case of circles UBI"
    year: 2024
    publication: Frontiers in Blockchain
    publisher: Frontiers Media
    doi: 10.3389/fbloc.2024.1362939
    url: https://doi.org/10.3389/fbloc.2024.1362939
  patriciamarcellaevite2026:
    authors:
      - Patricia Marcella Evite
    title: "Affordances of Digital and Blockchain-Based Community Currencies: The Case of Sarafu Network in Kenya"
    year: 2026
    publication: International Journal of Community Currency Research
    doi: 10.26034/zh.ijccr.2026.9556
    url: https://doi.org/10.26034/zh.ijccr.2026.9556
  carolinaesmattsson2022:
    authors:
      - Carolina E. S. Mattsson
      - Teodoro Criscione
      - William O. Ruddick
    title: Sarafu Community Inclusion Currency 2020–2021
    year: 2022
    publication: Scientific Data
    publisher: Nature Portfolio
    doi: 10.1038/s41597-022-01539-4
    url: https://doi.org/10.1038/s41597-022-01539-4
  cheicktidianeba2023:
    authors:
      - Cheick Tidiane Bâ
      - Matteo Zignani
      - Sabrina Gaito
    title: "Cooperative behavior in blockchain-based complementary currency networks through time: The Sarafu case study"
    year: 2023
    publication: Future Generation Computer Systems
    publisher: Elsevier BV
    doi: 10.1016/j.future.2023.05.022
    url: https://doi.org/10.1016/j.future.2023.05.022
  georgekuk2023:
    authors:
      - George Kuk
      - Camille Roger Charles Meyer
      - Stéphanie Giamporcaro
    title: "Complementary currencies and entrepreneurship: Sustaining micro‐entrepreneurs in Kenyan informal settlements"
    year: 2023
    publication: Strategic Entrepreneurship Journal
    publisher: Wiley
    doi: 10.1002/sej.1484
    url: https://doi.org/10.1002/sej.1484
  gecelocode2026:
    authors:
      - GE Celo-era Source
    title: grassrootseconomics erc20-pool, erc20-demurrage-token, erc20-limiter (Celo-era contracts)
    year: 2026
    url: https://github.com/grassrootseconomics/erc20-pool
  clcprotocol2026:
    authors:
      - CLC Protocol Source
    title: "cosmo-local-credit/protocol: SPEC.md and README deployments (Gnosis, v1.0.0)"
    year: 2026
    url: https://github.com/cosmo-local-credit/protocol
  clcdocs2026:
    authors:
      - CLC Docs
    title: Cosmo-Local Credit docs and Grassroots Economics documentation
    year: 2026
    url: https://docs.cosmolocal.credit
  kolektivowhitepaper2026:
    authors:
      - Kolektivo Framework Whitepaper
    title: The Kolektivo Framework Whitepaper v.3 (Decentralized Exchange Trading Systems)
    year: 2026
    url: https://github.com/Curve-Labs/Kolektivo
  kolektivoprotocol2026:
    authors:
      - Kolektivo Repositories
    title: zed-io/kolektivo-protocol (kTTD), Kolektivo-Labs/Kolektivo, zed-io/kolektivo-docs
    year: 2026
    url: https://github.com/zed-io/kolektivo-protocol
  gooddollarsource2026:
    authors:
      - GoodDollar Source
    title: "GoodDollar/GoodProtocol: UBISchemeV2, reserve, deployments"
    year: 2026
    url: https://github.com/GoodDollar/GoodProtocol
  gooddollardefillama2026:
    authors:
      - DeFiLlama GoodDollar
    title: "DeFiLlama protocol read: GoodDollar"
    year: 2026
    url: https://api.llama.fi/protocol/gooddollar
---
Four projects issue money to people instead of selling it to them: Circles lets each person mint a personal currency and makes it spendable through a graph of who trusts whom; Sarafu and its successor Cosmo-Local Credit lets communities issue vouchers and swap them through curated pools; Kolektivo proposed a community currency with a partially backed reserve; GoodDollar pays a daily share of a pool to verified identities. Each answers, differently, the question Tidepool has to answer for member credit: what stops an issuer from issuing more than the community can honour?

## Circles v2: the trust graph is the collateral

A registered human can call personalMint and claim one Circle per hour, retroactive for 14 days. Balances are ERC-1155 ids keyed by the issuer's address, so a Circle is always a specific person's Circle ([Circles Contracts 2026](https://github.com/aboutcircles/circles-contracts-v2)). Holding decays: a daily factor GAMMA = 0.93 to the power 1/365.25, i.e. 7 percent a year, so balances shrink while the hourly issuance continues, which gives each issuer an equilibrium balance instead of unbounded growth.

Money moves only along trust. trust(receiver, expiry) says "I accept your currency until this time"; operateFlowMatrix executes a path of such edges in one transaction, converting at each hop between currencies the next hop accepts. The newest change makes flow consented and bidirectional, with an opt-out to the old unidirectional model ([Circles Contracts 2026](https://github.com/aboutcircles/circles-contracts-v2)). Sybil resistance is social, not cryptographic: after the invitation-only period an inviter burns 96 Circles to give a newcomer a 48 Circle welcome bonus, and the newcomer must be trusted before registering. An invitation is thus a priced act with a cost to the inviter, which is closer to Tidepool's admission problem than any identity-proof scheme.

Groups mint a shared currency against collateral: groupMint takes trusted personal or group Circles as collateral under the group's mint-policy contract. The reference policy approves everything, so the real constraint (who may mint, what is redeemable) is whatever policy the group deploys ([Circles Contracts 2026](https://github.com/aboutcircles/circles-contracts-v2)). The organisation's 2026 repositories show tooling around this: group-tms maintains a group's trust relations by conditions, plus a trust-score repository, miniapps and a marketplace API.

The Hub at 0xc12C1E50ABB450d6205Ea2C3Fa861b3B834d13e8 on Gnosis had, on 2026-10-08, 27,572 registered humans, 678 groups and 2,186 organisations; the invitation-only period ended 2024-11-16 ([Circles Chain Reads 2026](https://rpc.aboutcircles.com)). Registrations are not activity: no active-minter or trust-edge count was obtained. The repository is labelled beta and carries two review reports (a Gnosis review in 2024-07 and a Hats review in 2024-09). The Metri wallet and the 2025 relaunch were not read from a first-party surface.

### What the evaluations say

The Berlin pilot is the only studied deployment. A temporal-network analysis found the pilot, including a subsidy for local businesses, sustained expansion of the economic network and facilitated trade in Berlin ([Avanzo et al. 2023](https://doi.org/10.1145/3582515.3609538)). A later survey of 25 participants recorded that the Circles Coop which launched the project shut down at the end of 2023 and that participation was driven by identification with the community's values ([Longo et al. 2025](https://doi.org/10.48550/arxiv.2504.02714)). A review of the same pilot calls it a failure and concludes that UBI alone, on blockchain or not, does not solve the inequalities its proponents name ([Papadimitropoulos & Perperidis 2024](https://doi.org/10.3389/fbloc.2024.1362939)). So the issuance-plus-trust design was run for two years in one city and ended with its organising cooperative, not with a protocol failure.

## Sarafu and Cosmo-Local Credit: the pool is the clearing house

Sarafu began as paper vouchers in 2010, moved to a feature-phone interface in 2016 and to blockchain in 2018, and settled on Community Asset Vouchers on Celo from 2023; blockchain automated the holding-tax calculation and linked vouchers to stablecoins through liquidity-pool contracts, at the cost of interface complexity ([Evite 2026](https://doi.org/10.26034/zh.ijccr.2026.9556)). The released dataset covers about 55,000 users and some 300 million Sarafu between 2020-01-25 and 2021-06-15, with savings and lending groups (chamas) labelled ([Mattsson et al. 2022](https://doi.org/10.1038/s41597-022-01539-4)). Network analysis uses the group accounts to study cooperation through the COVID-19 period ([Bâ et al. 2023](https://doi.org/10.1016/j.future.2023.05.022)), and interviews with micro-entrepreneurs found that the currency works as an external enabler and that integration with savings groups gives collective purpose ([Kuk et al. 2023](https://doi.org/10.1002/sej.1484)).

The Celo-era contracts are small and legible. A voucher is a GiftableToken-style ERC-20 with minting by role and optional expiry; a demurrage variant decays every balance each minute and lets the decayed value be withdrawn to a sink account on a schedule; and the pool is a swap contract with a token registry (which vouchers are admitted), a limiter (how much of each) and a quoter (what price) ([GE Celo-era Source 2026](https://github.com/grassrootseconomics/erc20-pool)). The README states that the pool does no sanity checking of exchange value and leaves it to the maintainer of the allowed-token list. This is commitment pooling at its core: the steward decides which promises are exchangeable and at what rate.

The protocol has now been rewritten and deployed on Gnosis (chain 100, v1.0.0): SwapPool with pluggable quoters (a per-token PPM price index or Chainlink feeds), per-pair fee policy, a 1 percent floor on the base for the protocol fee so a pool operator cannot shrink the protocol's cut by setting a tiny fee, seal bits that make each configuration field permanently immutable, a multi-hop SwapRouter, and a RescueVault ([CLC Protocol Source 2026](https://github.com/cosmo-local-credit/protocol)). The one audit is an internal engineering review that the repository itself says is not an independent certification. The documentation defines a Commitment Pool as a curated place to exchange selected vouchers, gives historical Sarafu activity from 2023-07-05 to 2025-07-20 of 745 active vouchers, 188 pools, 26,367 users and 285,197 exchanges, and says the earlier service "transitioned" without every historical account or balance carrying over ([CLC Docs 2026](https://docs.cosmolocal.credit)). Contract addresses were not in the docs pages read; they are in the repository README. A search of the scholarly register for commitment pooling found no paper on it, so its mechanism rests on the project's own documents.

## Kolektivo: a reserve that is allowed to be short

The whitepaper proposes a decentralized exchange trading system that issues an elastic community currency against a reserve token (kCUR for the Curacao pilot) through a modified Mento exchange with a leverage parameter, so that the reserve may be partially backed, and quotes Grassroots Economics' 25 percent target collateral ratio for a 20,000-user community with 5 percent speculated possible ([Kolektivo Framework Whitepaper 2026](https://github.com/Curve-Labs/Kolektivo)). Capital controls (time delay, rate limits, address ceilings) apply to redemptions. The repositories read contain a kTTD token and Merkle-gated merchant cash-out, a wallet charter and a website, the last commit being 2025-02; no deployed reserve, supply or user count was found ([Kolektivo Repositories 2026](https://github.com/zed-io/kolektivo-protocol)). DeFiLlama has no Kolektivo entry.

## GoodDollar: pool divided by claimers

The UBI scheme computes dailyUbi from the contract's balance divided by a 30-day cycle and the previous day's claimers; claiming requires a whitelisted identity. The token is a pure Super Token; the reserve moved from a Bancor-formula curve against cDAI on Ethereum to a Mento reserve on Celo and XDC, and the Guardians Safe and a Compound-style voting machine govern ([GoodDollar Source 2026](https://github.com/GoodDollar/GoodProtocol)). DeFiLlama shows only 25,353 USD of Ethereum TVL and a 539,377 USD staking series ([DeFiLlama GoodDollar 2026](https://api.llama.fi/protocol/gooddollar)); claimer counts were not read.

## What these fail at

None of the four lends. Circles gives each person unconditional issuance and path payments, but a person cannot borrow against future Circles, and the 7 percent decay punishes saving. Sarafu pools swap vouchers but do not extend credit between members; the steward's price index is a judgment call. Kolektivo wrote down fractional reserve and never shipped it. GoodDollar pays the same to everyone from a pool whose size depends on the reserve's market. The gap between "issue to everyone" and "extend credit to a member against the pool's pooled risk" is where a priced rotating credit association sits.
