---
title: "Conviction Voting as Deployed"
description: "How conviction voting works at the contract level in 1Hive's Conviction Voting app, Gardens v1 and Gardens v2, what the Gnosis Chain 1Hive instance and the Gardens v2 deployments show in dated numbers, what the code and its security ledger say about attacks, and what the mechanism does not do"
date-created: 2026-10-08
aliases:
  - "conviction voting survey"
  - "1Hive Gardens teardown"
keywords:
  - conviction-voting
  - gardens
  - 1hive
  - aragon
  - dao-governance
teaches:
  - "Conviction Voting as Deployed"
requires: [conviction-voting, common-pool-resource, quadratic-funding, proof-of-humanity]
authors:
  - claude-sonnet-5-5
type: text
references:
  blocksciencecvmodel2020:
    authors:
      - BlockScience Conviction Model
    title: BlockScience/Aragon_Conviction_Voting (1Hive/conviction-voting-cadcad) cadCAD model and notebooks, commit 634ae37 (2020-11-17)
    year: 2020
    publisher: GitHub
    url: https://github.com/1Hive/conviction-voting-cadcad
  gardensdocs2026:
    authors:
      - Gardens Docs
    title: "Gardens documentation: Conviction Parameters, Conviction 101, Dispute (docs.gardens.fund)"
    year: 2026
    publisher: Gardens
    url: https://docs.gardens.fund/conviction-voting/conviction-parameters.md
  onehivecvapp2021:
    authors:
      - 1Hive Conviction Voting
    title: 1Hive/conviction-voting-app ConvictionVoting.sol (commit 27df568, 2021-11-05; repo last pushed 2023-01-24)
    year: 2021
    publisher: GitHub
    url: https://github.com/1Hive/conviction-voting-app/blob/27df568fcf640dc3f1f96fb534c1cf3029422ac7/contracts/ConvictionVoting.sol
  onehivecvchain2026:
    authors:
      - 1Hive Gnosis Deployment
    title: 1Hive Conviction Voting app on Gnosis Chain, state read at block 48657058 (2026-10-08)
    year: 2026
    publisher: Gnosis Chain
    url: https://gnosisscan.io/address/0x0b21081c6f8b1990f53fc76279cc41ba22d7afe2
  defillamadeploys2026:
    authors:
      - DeFiLlama Protocols
    title: DeFiLlama api.llama.fi/protocol reads for Gardens, Honeyswap, Bancor V2.1, Bancor V3, Proof of Humanity, Giveth (2026-10-08)
    year: 2026
    publisher: DeFiLlama
    url: https://api.llama.fi/protocol/gardens
  onehivegardenstemplate2023:
    authors:
      - Gardens v1 Template
    title: 1Hive/gardens GardensTemplate.sol and deployment params (commit 7390427, 2023-12-01)
    year: 2023
    publisher: GitHub
    url: https://github.com/1Hive/gardens/blob/739042716f0f19f23e6baf193621d0590188b46d/packages/hardhat/contracts/GardensTemplate.sol
  tecforumgardens2022:
    authors:
      - TEC Forum Gardens Feedback
    title: Feedback for Gardens and CV governance (forum.tecommons.org topic 1061, read via Wayback Machine)
    year: 2022
    publisher: Token Engineering Commons forum
    url: https://forum.tecommons.org/t/feedback-for-gardens-and-cv-governance/1061
  tecforumfinance2023:
    authors:
      - TEC Forum Financial Analysis
    title: Financial Analysis of the TEC (forum.tecommons.org topic 1322, read via Wayback Machine)
    year: 2023
    publisher: Token Engineering Commons forum
    url: https://forum.tecommons.org/t/financial-analysis-of-the-tec/1322
  tecforummigration2023:
    authors:
      - TEC Forum Migration Advice
    title: Community Advice Process on TEC Migration to Optimism (forum.tecommons.org topic 1294, read via Wayback Machine)
    year: 2023
    publisher: Token Engineering Commons forum
    url: https://forum.tecommons.org/t/community-advice-process-on-tec-migration-to-optimism/1294
  gardensv2contracts2026:
    authors:
      - Gardens v2 Contracts
    title: 1Hive/gardens-v2 contracts (commit 59e4dde, 2026-09-17), pkg/contracts/src and security/
    year: 2026
    publisher: GitHub
    url: https://github.com/1Hive/gardens-v2/tree/59e4ddee12cf9c3c819fdbb53504f20f002c9cdf/pkg/contracts/src
  gardensv2deployed2026:
    authors:
      - Gardens v2 Deployments
    title: Gardens v2 deployment config and proxy-owner reads on Gnosis, Optimism, Arbitrum and Base (2026-10-08)
    year: 2026
    publisher: Gnosis, Optimism, Arbitrum and Base RPC
    url: https://github.com/1Hive/gardens-v2/blob/59e4ddee12cf9c3c819fdbb53504f20f002c9cdf/pkg/contracts/config/networks.json
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
  faqirrhazoui2021:
    authors:
      - Youssef Faqir-Rhazoui
      - Javier Arroyo
      - Samer Hassan
    title: A comparative analysis of the platforms for decentralized autonomous organizations in the Ethereum blockchain
    year: 2021
    publication: Journal of Internet Services and Applications
    doi: 10.1186/s13174-021-00139-6
    url: https://doi.org/10.1186/s13174-021-00139-6
  davo2025:
    authors:
      - David Davó
      - Javier Arroyo
      - Samer Hassan
      - Silvia Semenzin
    title: "The rise and fall of DAOstack: lessons for decentralized autonomous organizations"
    year: 2025
    publication: PeerJ Computer Science
    doi: 10.7717/peerj-cs.3320
    url: https://doi.org/10.7717/peerj-cs.3320
  tecforumquorum2024:
    authors:
      - TEC Forum Quorum Thread
    title: Increasing the minimum quorum on Tao Voting (forum.tecommons.org topic 1372, read via Wayback Machine)
    year: 2024
    publisher: Token Engineering Commons forum
    url: https://forum.tecommons.org/t/increasing-the-minimum-quorum-on-tao-voting/1372
---

## What it does

Conviction voting allocates a shared treasury without a vote deadline. Each member stakes tokens on the proposals they want funded, stake accumulates "conviction" over blocks, and anyone may execute a funding proposal once its conviction passes a threshold that rises with the size of the request. The cadCAD digital twin from BlockScience, 1Hive, Aragon and the Commons Stack describes the mechanism as a linear system akin to a capacitor: "Conviction voting is based on a linear system akin to a capacitor which "charges up" dynamically and proposals pass when a certain level of collective energy is reached." (BlockScience Conviction Model 2020). The Gardens documentation credits BlockScience with the 2019 invention (Gardens Docs 2026).

## Mechanism, from the contract

1Hive's Conviction Voting app (1Hive Conviction Voting 2021) implements conviction as the recursion `a^t * y(0) + x * (1 - a^t) / (1 - a)` with `a = decay / D` and `D = 10,000,000`, `t` in blocks since the last record, and `x` the stake. Stake `x` held for ever converges to `x / (1 - a)`. A proposal executes when `convictionLast > calculateThreshold(requestedAmount)`, where the threshold is `weight * totalStaked * D^2 * funds^2 / (D - decay) / (maxRatio * funds - requestedAmount * D)^2`, that is rho times total stake over (1 - a) over (beta minus request share) squared. Three consequences follow from the formula and are not stated in the README:

- The stake that must sit on a proposal for it to pass eventually is `rho * S / (beta - requested/funds)^2`, where `S` is total stake floored at `minThresholdStakePercentage` of token supply. The requirement diverges as the request approaches `maxRatio` of the pool, and the contract refuses requests at or above it.
- The floor means a thin active stake cannot cheapen the threshold: `_totalStaked()` returns the larger of actual stake and the percentage of supply.
- A voter can stake on at most ten proposals (`MAX_STAKED_PROPOSALS = 10`), and moving tokens away withdraws stake through the token-manager hook, so conviction cannot outlive the balance.

Governance of the app itself is Aragon roles: settings, pausing, cancelling and the funds manager sit behind Aragon ACL roles, and the repository README says the code is unaudited (1Hive Conviction Voting 2021).

## The 1Hive instance on Gnosis Chain

Read from chain at block 48657058 (1Hive Gnosis Deployment 2026): the 1Hive kernel was created 2021-03-05, and its conviction voting app 0x0b21081c6f8b1990f53fc76279cc41ba22d7afe2 holds decay 9999799, maxRatio 2000000, weight 10000 and a 20% minimum stake floor, i.e. a = 0.9999799 (half-life about 2.0 days at 5-second blocks), beta = 0.2 and rho = 0.001. Honey (HNY) supply is 75,429.94 and 8,298.27 HNY (11.0%) is staked on proposals, so the 15,086 HNY floor sets the threshold. At that floor a request for 5% of the pool needs 671 HNY held on it, and a request for 15% needs 6,034 HNY.

The app's event logs show 213 proposals added from 2021-03-05 to 2026-06-23, of which 120 executed (last on 2026-06-26), 86 were cancelled and 6 rejected. Proposals added per year fell from 72 in 2021 and 78 in 2022 to 25 in 2023, 24 in 2024, 13 in 2025 and 1 in 2026; executions fell from 51 and 36 to 12, 8 and 12 over 2023 to 2025. Honeyswap, 1Hive's exchange, carries $732,964 of TVL on 2026-10-08 against an xDai peak of $18.51M on 2021-06-06 (DeFiLlama Protocols 2026). 1Hive's governance forum hosts did not answer, so what 1Hive's members said about the decline was not read.

## Gardens v1

Gardens v1 packages the app with a hooked token manager, disputable voting, dynamic issuance and an Agreement (Covenant) app whose challenge mechanism gates every proposal; the template takes `convictionGrowthHours`, `spendingLimit`, `minimumConviction` and `minActiveStakePercentage`, and the sample garden uses 48 hours, 0.1, 0.025 and 0.2 with proposal and challenge deposits of 0.1 (Gardens v1 Template 2023). The Token Engineering Commons ran a garden of this kind; a 2022-06 member thread asks for proposals to expire after a time limit "instead of staying up forever if they don't accrue enough conviction" (TEC Forum Gardens Feedback 2022), and the commons' 2023-12 balance sheet notes the Aragon DAO app on Gnosis "stopped working" (TEC Forum Financial Analysis 2023). The migration advice records that Celeste, the Aragon dispute arbitrator that backed Covenant challenges, does not exist on Optimism (TEC Forum Migration Advice 2023).

## Gardens v2

Gardens v2 keeps the recursion and threshold, adds a fixed minimum threshold, and reorganizes the app into communities and pools (Gardens v2 Contracts 2026). A RegistryCommunity holds members' registration stake; each pool is Signaling, Funding or Streaming; voting power comes from one of five point systems (Fixed, Capped, Unlimited, Quadratic, Custom). The documentation names the pool parameters as Conviction Growth (a half-life), Minimum Conviction, Spending Limit and Fixed Minimum Threshold, and a dispute needs collateral with a one-week tribunal ruling (Gardens Docs 2026).

Deployment config lists 203 communities and 378 conviction strategies across Arbitrum, Optimism, Polygon, Gnosis, Base, Celo and Ethereum (Gardens v2 Deployments 2026), against $74,373 of TVL on DeFiLlama and a listing date of 2025-09-18 (DeFiLlama Protocols 2026). The proxies are diamond-style facets behind a UUPS ProxyOwner. On Gnosis, Optimism, Arbitrum and Base the owner and the upgrade wallet are one address, 0x00bcc26e792e393217ba895f5e85ae628fc994e9, which has no code, so a single key can replace the voting logic on those four chains; the Gnosis RegistryFactory owner is the same key (Gardens v2 Deployments 2026). The repository describes a global pause controller and a per-community protocol fee set by the factory owner (Gardens v2 Contracts 2026).

## What it fails at

- **Accounting bugs in the live accrual.** The security ledger accepts three Medium findings (GDN-01, GDN-02, GDN-05) and one duplicate: `_withdraw` accrued conviction using only the departing member's stake, "allowing a small voter to collapse conviction earned by the remaining supporters"; it was patched in commit 8689aff11 (Gardens v2 Contracts 2026). The mechanism's central invariant, that conviction reflects stake times time, was wrong in the shipped contract.
- **No audit on record.** The v1 app is "pre-audit" (1Hive Conviction Voting 2021); the v2 security policy lists a bounty pool and no third-party audit report, and DeFiLlama lists audits as 0 (Gardens v2 Contracts 2026; DeFiLlama Protocols 2026).
- **Admin keys override everything.** Trusted-role actions by proxy owners, council safes and tribunals are excluded from the bounty (Gardens v2 Contracts 2026), and the proxy owner is one externally owned key on four chains.
- **Proposals do not expire.** Proposals stay open until cancelled; the 1Hive app shows 86 cancellations against 120 executions, and TEC members asked for expiry in 2022 (TEC Forum Gardens Feedback 2022).
- **Sybil resistance is outside the mechanism.** Gardens v2 admits members by stake and an optional passport or GoodDollar score (Gardens v2 Contracts 2026); one-person-one-vote registries such as Proof of Humanity are separate (Proof of Humanity Registry 2026; Siddarth et al. 2020).
- **No measured governance outcome.** The searches of OpenAlex and Crossref found no paper that measures conviction voting in a deployed DAO; the DAO platform studies read cover Aragon and DAOstack generally (Faqir-Rhazoui et al. 2021; Davó et al. 2025). The cadCAD repository is a simulation, not a measurement (BlockScience Conviction Model 2020).
- **Concentration is not constrained.** The TEC's Tao Voting, the vote the migrated DAO uses on Optimism, was reported in 2024 to have a largest holder able nearly to pass any proposal alone (TEC Forum Quorum Thread 2024); conviction voting itself applies no cap on a holder's share in v1.

## Openings for a pooling protocol

The continuous, deadline-free allocation shape fits a pool whose members stake claim on projects over time. The measured weaknesses suggest what to change: proposals added per year on the 1Hive app fell 83% from 2022 to 2025 (78 to 13), so the allocation rule must keep working with few active voters; the threshold should reference actual stake, never a fraction of supply alone; accrual must be tested against the withdrawal bug class; upgrade authority must not be a single key.
