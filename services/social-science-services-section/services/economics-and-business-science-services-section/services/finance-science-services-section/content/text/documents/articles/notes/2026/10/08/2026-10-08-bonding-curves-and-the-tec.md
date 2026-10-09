---
title: "Bonding Curves and the Token Engineering Commons"
description: "How the Bancor formula, Aragon Fundraising, the Commons Stack augmented bonding curve with Hatch and Impact Hours, Continuous Organizations and the Token Engineering Commons work at the contract level, what the TEC did at what scale from Hatch to the 2025-2026 shutdown and claim, and where each design stops"
date-created: 2026-10-08
aliases:
  - "augmented bonding curve survey"
  - "TEC teardown"
keywords:
  - bonding-curve
  - augmented-bonding-curve
  - hatch
  - continuous-organization
  - token-engineering-commons
  - bancor
teaches:
  - "Bonding Curves and the Token Engineering Commons"
requires: [bonding-curve, augmented-bonding-curve, hatch, continuous-organization, conviction-voting, common-pool-resource, proof-of-humanity]
authors:
  - claude-sonnet-5-5
type: text
references:
  aragonfundraising2021:
    authors:
      - Aragon Fundraising
    title: "AragonBlack/fundraising: Aragon Fundraising apps (BatchedBancorMarketMaker, BancorFormula, Tap, Presale), commit f61db01 (2021-05-24)"
    year: 2021
    publisher: GitHub
    url: https://github.com/AragonBlack/fundraising/tree/f61db01950418a3528161fdcd2dbe3afd5e1c05c/apps
  bancorv3readme2022:
    authors:
      - Bancor Contracts v3
    title: bancorprotocol/contracts-v3 README (Dawn release; raw.githubusercontent.com, dev branch)
    year: 2022
    publisher: GitHub
    url: https://github.com/bancorprotocol/contracts-v3/blob/dev/README.md
  defillamadeploys2026:
    authors:
      - DeFiLlama Protocols
    title: DeFiLlama api.llama.fi/protocol reads for Gardens, Honeyswap, Bancor V2.1, Bancor V3, Proof of Humanity, Giveth (2026-10-08)
    year: 2026
    publisher: DeFiLlama
    url: https://api.llama.fi/protocol/gardens
  commonsstackabc2021:
    authors:
      - Commons Stack ABC Design
    title: "Commons-Stack/augmented-tbc-design: parameters and math of the augmented bonding curve (commit 80dc175, 2021-07-16)"
    year: 2021
    publisher: GitHub
    url: https://github.com/Commons-Stack/augmented-tbc-design/blob/80dc175fd0ea89bc4ef62ad2cd00203ecc1e52a9/src/math.ts
  commonsstackhatch2023:
    authors:
      - Commons Stack Hatch
    title: Commons-Stack/hatch-app and impact-hours-app (commits 0ef22e8 and 06710c9, 2023)
    year: 2023
    publisher: GitHub
    url: https://github.com/Commons-Stack/hatch-app/blob/0ef22e8f67da6866ad190ce52eea31051b442e7a/README.md
  fritsch2021:
    authors:
      - Felix Fritsch
      - Jeff Emmett
      - Emaline Friedman
      - Rok Kranjc
      - Sarah Manski
      - Michael Zargham
      - Michel Bauwens
    title: Challenges and Approaches to Scaling the Global Commons
    year: 2021
    publication: Frontiers in Blockchain
    doi: 10.3389/fbloc.2021.578721
    url: https://doi.org/10.3389/fbloc.2021.578721
  tecmediumhatch2021:
    authors:
      - TEC Medium Hatch
    title: "The Hatch Was Successful! TEC Latest News: July 31 - August 15 (Medium, 2021-08-18, read via Wayback Machine)"
    year: 2021
    publisher: Medium
    url: https://medium.com/token-engineering-commons/the-hatch-was-successful-2443cd07cbb0
  tecabcgnosis2026:
    authors:
      - TEC Gnosis ABC
    title: "TEC augmented bonding curve on Gnosis Chain: verified AugmentedBondingCurve source and state (0x74ade20c...f99f), read 2026-10-08"
    year: 2026
    publisher: Gnosis Chain
    url: https://gnosisscan.io/address/0x74AdE20C12067e2F9457c037809a73F35694f99f
  tecforumfinance2023:
    authors:
      - TEC Forum Financial Analysis
    title: Financial Analysis of the TEC (forum.tecommons.org topic 1322, read via Wayback Machine)
    year: 2023
    publisher: Token Engineering Commons forum
    url: https://forum.tecommons.org/t/financial-analysis-of-the-tec/1322
  tecforumshutdown2025:
    authors:
      - TEC Forum Shutdown Plan
    title: TEC Shutdown Proposal (forum.tecommons.org topic 1520, read via Wayback Machine)
    year: 2025
    publisher: Token Engineering Commons forum
    url: https://forum.tecommons.org/t/tec-shutdown-proposal/1520
  tecforummigration2023:
    authors:
      - TEC Forum Migration Advice
    title: Community Advice Process on TEC Migration to Optimism (forum.tecommons.org topic 1294, read via Wayback Machine)
    year: 2023
    publisher: Token Engineering Commons forum
    url: https://forum.tecommons.org/t/community-advice-process-on-tec-migration-to-optimism/1294
  tecabcoptimism2026:
    authors:
      - TEC Optimism ABC
    title: "TEC augmented bonding curve on Optimism: ABC 0xe5c04ee3...b77f, TEC token, common pool and reserve (read 2026-10-08)"
    year: 2026
    publisher: Optimism
    url: https://optimistic.etherscan.io/address/0xe5c04ee3f2ea5deb62ee9c3c2fcd63c06c80b77f
  tecforumquorum2024:
    authors:
      - TEC Forum Quorum Thread
    title: Increasing the minimum quorum on Tao Voting (forum.tecommons.org topic 1372, read via Wayback Machine)
    year: 2024
    publisher: Token Engineering Commons forum
    url: https://forum.tecommons.org/t/increasing-the-minimum-quorum-on-tao-voting/1372
  tecforumutility2025:
    authors:
      - TEC Forum Utility Report
    title: TEC Token Infrastructure & Utility Report (forum.tecommons.org topic 1487, read via Wayback Machine)
    year: 2025
    publisher: Token Engineering Commons forum
    url: https://forum.tecommons.org/t/tec-token-infrastructure-utility-report/1487
  tecforumsunsetvote2025:
    authors:
      - TEC Forum Sunset Vote
    title: "Proposal: Initiate the Sunsetting Process for the $TEC Token (forum.tecommons.org topic 1503, read via Wayback Machine)"
    year: 2025
    publisher: Token Engineering Commons forum
    url: https://forum.tecommons.org/t/proposal-initiate-the-sunsetting-process-for-the-tec-token/1503
  tecforumtreasury2025:
    authors:
      - TEC Forum Treasury Framework
    title: "Sunsetting the $TEC: Proposal & Treasury Distribution Framework (forum.tecommons.org topic 1500, read via Wayback Machine)"
    year: 2025
    publisher: Token Engineering Commons forum
    url: https://forum.tecommons.org/t/sunsetting-the-tec-proposal-treasury-distribution-framework/1500
  tecforumtokensunset2025:
    authors:
      - TEC Forum Token Sunset
    title: TEC Token Sunset (forum.tecommons.org topic 1531, read via Wayback Machine)
    year: 2025
    publisher: Token Engineering Commons forum
    url: https://forum.tecommons.org/t/tec-token-sunset/1531
  tecshutdowncode2025:
    authors:
      - TEC Shutdown Contracts
    title: "CommonsBuild/tec-shutdown: TECClaim contract and balance snapshots (commit c05257e, 2025-12-12); claim contract 0x55456B5a...70A5 on Optimism"
    year: 2025
    publisher: GitHub and Optimism
    url: https://github.com/CommonsBuild/tec-shutdown/blob/c05257ee0369a9bf8fbd1176579b8c06a9f73646/README.md
  corgwhitepaper2018:
    authors:
      - Thibauld Favre
    title: "Continuous Organizations: Aligning stakeholders' financial interests in the Digital Economy, whitepaper v1.2 (C-ORG/whitepaper)"
    year: 2018
    publisher: GitHub
    url: https://github.com/C-ORG/whitepaper/blob/master/README.md
  fairmintcorg2023:
    authors:
      - Fairmint C-Org
    title: "Fairmint/c-org reference implementation of Continuous Organizations: README, SPECIFICATIONS.md and contracts (commit 781d1ed, 2023-09-05)"
    year: 2023
    publisher: GitHub
    url: https://github.com/Fairmint/c-org/blob/781d1ed8d70d733eed57c5e7fff8931b096de0e9/SPECIFICATIONS.md
  praiserepo2024:
    authors:
      - Praise Source Code
    title: commons-stack/praise (General Magic), packages/api quantification service and README (commit 31bd9b5, 2024-10-14)
    year: 2024
    publisher: GitHub
    url: https://github.com/commons-stack/praise/blob/31bd9b579dea7463160ac0953f662be10b10bddd/packages/api/src/quantifications/services/quantifications.service.ts
  fairsharingcontracts2025:
    authors:
      - FairSharing Contracts
    title: "lxdao-official/fairsharing-contract (commit 892b726, 2025-01-26): FairSharing contribution protocol on Optimism"
    year: 2025
    publisher: GitHub
    url: https://github.com/lxdao-official/fairsharing-contract/blob/892b7262ad96d693057768d1c685d96165c14701/README.md
  pohcontract2026:
    authors:
      - Proof of Humanity Registry
    title: "Proof of Humanity v1 registry 0xC5E9dDebb09Cd64DfaCab4011A0D5cEDaf7c9BDb: verified source and parameters read 2026-10-08"
    year: 2026
    publisher: Ethereum mainnet
    url: https://eth.blockscout.com/address/0xC5E9dDebb09Cd64DfaCab4011A0D5cEDaf7c9BDb
  siddarth2020:
    authors:
      - Divya Siddarth
      - Sergey A. Ivliev
      - Santiago Siri
      - Paula Berman
    title: Who Watches the Watchmen? A Review of Subjective Approaches for Sybil-Resistance in Proof of Personhood Protocols
    year: 2020
    publication: Frontiers in Blockchain
    doi: 10.3389/fbloc.2020.590171
    url: https://doi.org/10.3389/fbloc.2020.590171
  miranda2026:
    authors:
      - Mauricio L. Miranda
      - Daniel Sadoc Menasché
      - Milton R. Ramirez
    title: "Speculative Token Trading Platforms: Capital Dissipation, Bonding Curves, and Market Signals"
    year: 2026
    publication: Workshop on Blockchain (WBlockchain)
    doi: 10.5753/wblockchain.2026.23127
    url: https://doi.org/10.5753/wblockchain.2026.23127
  deschermayer2024:
    authors:
      - Livia Deschermayer
      - Lisa Wocken
      - Nathalia Scherer
    title: What is Token Engineering? A Stakeholder Study
    year: 2024
    publisher: OSF Preprints
    doi: 10.31235/osf.io/xw48b
    url: https://doi.org/10.31235/osf.io/xw48b
  kirste2025:
    authors:
      - Daniel Kirste
      - Niclas Kannengießer
      - Ricky Lamberty
      - Ali Sunyaev
    title: "Automated Market Makers in Cryptoeconomic Systems: A Taxonomy and Archetypes"
    year: 2025
    publication: ACM Computing Surveys
    doi: 10.1145/3769669
    url: https://doi.org/10.1145/3769669
---

## The Bancor formula and what Aragon built on it

A bonding curve is a contract that is the counterparty to every trade: it mints a token when a buyer deposits a reserve asset and burns it when a holder sells, at a price set by supply. The Bancor connector formula used by Aragon Fundraising computes a purchase as `supply * ((1 + deposit / connectorBalance)^(w / 1,000,000) - 1)`, with the connector weight `w` in parts per million; at 100% weight it is linear, and selling the whole supply returns the whole connector balance. Spot price is `balance / (supply * reserveRatio)` (Aragon Fundraising 2021). Aragon Fundraising wraps the formula in three modules. The market maker batches orders over a block window and fills them at one price "to mitigate front-running attacks", with a virtual supply, virtual balance, reserve ratio and slippage cap per collateral; the Tap releases reserve to a beneficiary at a bounded rate per block above a floor; the Presale sets a target that must be met for the campaign to start (Aragon Fundraising 2021). The repository carries a no-liability disclaimer.

Bancor v3's README describes an Omnipool with single-sided liquidity and auto-compounding rewards, and lists audits by PeckShield, OpenZeppelin and ChainSecurity (Bancor Contracts v3 2022). DeFiLlama shows Bancor V2.1 TVL of $10,075,191 on 2026-10-08 against a peak of $2,424,753,876 on 2021-05-10, and V3 of $16,368,109 against $88,926,883 at its 2022-08-19 start (DeFiLlama Protocols 2026). Bancor's own statement about pausing impermanent-loss protection in 2022-06 was not read, because its blog answered HTTP 403.

## The augmented bonding curve and the Hatch

The Commons Stack's design tool turns four chosen numbers into a curve: Hatch raise `d0`, commons tribute `theta` (the share of the Hatch raise sent to the funding pool), Hatch price `p0` and open price `p1`. It sets `kappa = p1/p0/(1-theta)`, initial reserve `(1-theta)*d0`, initial supply `d0/p0` and the invariant `R = S^kappa / V0`, so reserve is a power function of supply. An exit tribute is deducted on every burn and goes to the funding pool; Hatch tokens vest on a half-life after a cliff, which sets a price floor the tool calls the Lockup Curve (Commons Stack ABC Design 2021). The Hatch app sets a minimum goal, a goal that closes it early, a period and an exchange rate; with the minimum unmet contributors are refunded; Impact Hours mints tokens for hours worked at `R * x / (x + E)` where `x` is funds raised, which raises the wage as the raise grows (Commons Stack Hatch 2023). Both apps state they are unaudited and the design tool contains no comparison with a deployed curve (Commons Stack ABC Design 2021; Commons Stack Hatch 2023). The peer-reviewed description of the Commons Stack is a commons-scaling paper co-authored by its founders, which reports no operating measurement (Fritsch et al. 2021).

## The Token Engineering Commons, in order

**Hatch.** The Hatch closed on 2021-08-14 at 1,571,223.57 wxDAI against an 800,000 minimum (TEC Medium Hatch 2021).

**Gnosis ABC.** The bonding-curve app 0x74AdE20C12067e2F9457c037809a73F35694f99f was created 2022-01-13. It uses the Bancor formula with wxDAI collateral at 198,200 ppm (19.82%), a virtual supply and balance of 1e18, a 2% buy fee and a 12% sell fee; fees go to the common pool, not the reserve. Orders are immediate (not batched) and the TEC mint and burn go through an Aragon token manager (TEC Gnosis ABC 2026). A buy then immediate sell at an unchanged curve returns 0.98 x 0.88 = 86.2% of the deposit. At launch the tributes were 22% on entry and 2% on exit and were later changed to 2% and 12% (TEC Forum Financial Analysis 2023). TEC supply on Gnosis is 1,546,092 and Blockscout lists 728 holders (TEC Gnosis ABC 2026).

**Operation.** The common pool held 308,478 wxDAI as of 2023-12-08; tributes since 2022-01 were 327,037 wxDAI (210,491 entry, 116,547 exit); reported common-pool spending was 456.7k wxDAI on grants and 349.5k on operations; the reserve was 133,288 wxDAI at 0.42 wxDAI per TEC, and the post projected one year before the common pool ran out (TEC Forum Financial Analysis 2023). The shutdown plan counts $433,316 of direct grants and $250,000 catalyzed with Gitcoin, and says "most of the original community moved on in late 2021" (TEC Forum Shutdown Plan 2025). The migration advice cites earlier member posts about the commons' reliance on xDAI (TEC Forum Migration Advice 2023).

**Migration.** The TEC announced the move from Gnosis to Optimism complete on 2023-12-19 with rETH as the reserve asset. The Optimism curve (token 0x8Fc7C1109c08904160d6AE36482B79814D45eB78, curve 0xe5c04ee3f2ea5deb62ee9c3c2fcd63c06c80b77f) holds a 20% ratio, a virtual supply and balance of 1 wei and the same 2% and 12% fees; TEC supply there is 1,107,830.74 (TEC Optimism ABC 2026). The migration forum thread gave the Optimism grant to Commons Stack, access to capital and the end of xDAI reliance as reasons, and records that the Aragon dispute arbitrator Celeste does not exist on Optimism (TEC Forum Migration Advice 2023).

**Decline.** A steward reported in 2024-05 that token distribution was more concentrated than at the Hatch, with the largest holder nearly able to pass any proposal alone (TEC Forum Quorum Thread 2024). The common pool held, as of 2025-07, about $207,215 and the reserve about $42,775, tributes since migration were $25,235, and the team was three people (TEC Forum Utility Report 2025). The sunset framework says participation and governance activity had slowed for 18 months and the value proposition for the token had become unclear (TEC Forum Sunset Vote 2025), with about $300K left in treasury and reserve (TEC Forum Treasury Framework 2025). A commenter observed the reserve was one fifth of funds, so the token was implicitly backed by about 20% (TEC Forum Treasury Framework 2025).

**Shutdown and claim.** The shutdown plan budgeted $52,671, including $10,000 for a retrospective analysis of the curve, conviction voting and Praise, and retired the brand (TEC Forum Shutdown Plan 2025). The implementation set each address's claim at the lower of its balance on 2025-07-23 and at dissolution, replaced the curve with a claims contract, and gave a roughly six-month window (TEC Forum Token Sunset 2025). The claim proxy 0x55456B5a78b1EA17771caf0f99C7fEd7292670A5 on Optimism was funded on 2025-12-11 with 118,908.57 DAI and 32.9054 rETH. By its 2026-06-20 deadline 69 holder payouts had taken 74,933.73 DAI and 20.7363 rETH (63.0% of the DAI). On the 2026-07-01 sweep the remaining 43,974.84 DAI (37.0%) and 12.1691 rETH went to the contract owner and one other address; 384,949 snapshot tokens were never burned (TEC Shutdown Contracts 2025). The contract is upgradeable and its owner can block addresses and burn any address's snapshot balance before activation (TEC Shutdown Contracts 2025).

## Continuous Organizations

The whitepaper defines a Continuous Securities Offering: an organization funnels a fixed share of realized revenue into a trust whose bonding curve has separate buy and sell functions (Favre 2018). Fairmint's reference implementation fixes the shapes: a linear buy curve (`x = sqrt(2c/buy_slope + supply^2) - supply`) and a sell slope derived from the buyback reserve, `2 * reserve / (supply + burnt)^2`; only the investment-reserve share of each investment is held back; closing requires the beneficiary to pay an exit fee covering the gap between buy-curve value and reserve; a control address can change fees, whitelist and revenue commitment, and the commitment can rise but never fall (Fairmint C-Org 2023). The repository's own README says Fairmint moved on to the CAFE and the Community SAFE, lists only DAI and USDC addresses, and contains no deployed instance; no operating continuous organization was found (Fairmint C-Org 2023).

## Reward systems next to the curve

Praise is an off-chain tool: members praise each other in Discord, quantifiers score each item, and the score is an average; dismissal scores zero (Praise Source Code 2024). No contract settles Praise rewards in the repository, and no measure of quantifier collusion was found (Praise Source Code 2024). FairSharing puts contributions, votes and claims on Optimism as attestations with pluggable voting strategies, and the default strategy passes an item when weighted votes for are at least votes against (FairSharing Contracts 2025). The searches for "Curve Studios" and for a "Fairshare" protocol tied to Giveth found no source.

## Identity under the curve

Proof of Humanity v1 is a curated registry with a request-challenge protocol and vouches; on mainnet it reads submissionCounter 20,740, a 0.1 ETH base deposit, a 2-year submission duration, a 3.5-day challenge period and one required vouch, with a governor able to add and remove entries (Proof of Humanity Registry 2026). A review of subjective Sybil-resistance protocols places it among vouching systems (Siddarth et al. 2020).

## What these designs fail at

- **Price follows reserve, not use.** The curve fixes price as a function of reserve and supply; analytic work shows bonding curves amplify capital dissipation under trading churn through convex price and concave supply growth (Miranda et al. 2026). Ignoring slippage, a buy followed by a sell on the TEC curve returned 86 cents on the dollar; tributes of 327,037 wxDAI over two years sat against 806.2k wxDAI of reported common-pool spending, and the sources read do not split that spending between tributes and the Hatch allocation (TEC Forum Financial Analysis 2023).
- **Collateral and chain are single points of failure.** The reserve was wxDAI until the 2023 migration, a risk members raised (TEC Forum Migration Advice 2023); the Gnosis token stayed live with 728 holders and no reserve, and the Aragon DAO app there stopped being maintained (TEC Forum Financial Analysis 2023).
- **The curve has no exit for the commons.** When activity stopped the only terminal design was a bespoke claims contract with a snapshot rule, a six-month window and an owner who could sweep the remainder; 37% of the DAI was unclaimed when it was swept (TEC Shutdown Contracts 2025).
- **Concentration drifts upward.** The largest-holder warning came within three years of the Hatch (TEC Forum Quorum Thread 2024).
- **No audit on file.** Hatch and Impact Hours state they are unaudited; the Aragon Fundraising and Fairmint repositories carry no audit report (Aragon Fundraising 2021; Commons Stack Hatch 2023; Fairmint C-Org 2023).
- **The research base is thin.** Searches of OpenAlex and Crossref found a token engineering interview study (Deschermayer et al. 2024), an AMM taxonomy (Kirste et al. 2025) and the bonding-curve paper above, and no paper measuring an augmented bonding curve, Hatch or Continuous Organization outcome.

## Openings for a pooling protocol

The measured TEC mechanics give parameters to beat: a 12% exit tribute made leaving expensive, and the common pool was projected in 2023 to run out within a year at the then spend; a pool whose members can leave at par and whose operating funds come from yield rather than exit friction avoids the dissipation result. The claim-contract path shows how to dissolve a pool by snapshot, and also what it costs: 63% of the funds reached holders in six months. A design that keeps funds in members' own accounts, as the Tidepool directed-yield specification does, has no dissolution event of this kind.
