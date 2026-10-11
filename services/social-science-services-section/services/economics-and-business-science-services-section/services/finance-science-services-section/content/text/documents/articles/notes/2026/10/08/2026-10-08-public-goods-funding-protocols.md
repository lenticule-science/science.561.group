---
title: "Public-Goods Funding Protocols"
description: "How Gitcoin and Allo, Optimism Retro Funding, Hypercerts, Protocol Guild, clr.fund with MACI, Flow State, Thrive, Celo Prosperity Pass, Nouns, Kleros and Hats allocate money at the contract level, what each has done at what scale, and where each stops"
date-created: 2026-10-08
aliases:
  - "public goods funding protocols"
  - "RetroPGF and quadratic funding survey"
keywords:
  - quadratic-funding
  - retroactive-funding
  - protocol-guild
  - hypercerts
  - maci
  - allo
teaches:
  - "Public-Goods Funding Protocols"
requires: [quadratic-funding, commons-based-peer-production]
authors:
  - claude-sonnet-5-5
type: text
references:
  buterin2018:
    authors:
      - Vitalik Buterin
      - Zoe Hitzig
      - E. Glen Weyl
    title: A Flexible Design for Funding Public Goods
    year: 2018
    doi: 10.48550/arXiv.1809.06421
    url: https://arxiv.org/abs/1809.06421
  gitcoinqfcalc2025:
    authors:
      - Gitcoin QF Calculator
    title: gitcoinco/qf-calculator (last commit 2025-05-20)
    year: 2025
    url: https://github.com/gitcoinco/qf-calculator
  allocontracts2025:
    authors:
      - Allo Contracts
    title: allo-protocol/allo-v2 contracts (commit d262e7e, 2025-04-08)
    year: 2025
    url: https://github.com/allo-protocol/allo-v2
  clrfundcode2024:
    authors:
      - Clr Fund Contracts
    title: clrfund/monorepo contracts (last commit 2024-07-31, repo pushed 2024-08-01)
    year: 2024
    url: https://github.com/clrfund/monorepo
  pasquini2020:
    authors:
      - Ricardo Anibal Pasquini
    title: Quadratic Funding and Matching Funds Requirements
    year: 2020
    doi: 10.48550/arxiv.2010.01193
    url: https://doi.org/10.48550/arxiv.2010.01193
  allodeployed2026:
    authors:
      - Allo Deployments
    title: Allo v2 proxy read on mainnet, Optimism, Arbitrum and Base, 2026-10-08
    year: 2026
    url: https://optimistic.etherscan.io/address/0x1133eA7Af70876e64665ecD07C0A0476d09465a1
  alloannounce2025:
    authors:
      - Allo Capital Announcement
    title: "[ANNOUNCEMENT] Introducing Allo.Capital (owocki, 2025-01-08)"
    year: 2025
    url: https://gov.gitcoin.co/t/announcement-introducing-allo-capital/19839
  gitcoingg23results2025:
    authors:
      - Gitcoin GG23 Results
    title: GG23 OSS Program Quadratic Funding Results (Gitcoin governance forum, 2025-04-25)
    year: 2025
    url: https://gov.gitcoin.co/t/gg23-oss-program-quadratic-funding-results/20334
  humanpassport2026:
    authors:
      - Human Passport Docs
    title: Human Passport documentation (docs.passport.human.tech)
    year: 2026
    url: https://docs.passport.human.tech/
  gitcoinrounds2026:
    authors:
      - Gitcoin Rounds Arc
    title: "Gitcoin Grants Rounds: GR1 to GG24 (owocki, Gitcoin governance forum, 2026-05-10)"
    year: 2026
    url: https://gov.gitcoin.co/t/gitcoin-grants-rounds-gr1-gg24/25253
  gitcointreasury2026:
    authors:
      - Gitcoin Treasury Contract
    title: Social contract of the gitcoin public goods treasury [2020 - 2026] (owocki, 2026-08-31)
    year: 2026
    url: https://gov.gitcoin.co/t/social-contract-of-the-gitcoin-public-goods-treasury-2020-2026/25366
  gitcoingg24tooling2026:
    authors:
      - Gitcoin GG24 Tooling Retro
    title: "GG24 Public Goods Tooling Development Round: Full Retrospective (2026-05-27)"
    year: 2026
    url: https://gov.gitcoin.co/t/gg24-public-goods-tooling-development-round-full-retrospective/25276
  gitcoindacc2026:
    authors:
      - Gitcoin Dacc Proposal
    title: "[PROPOSAL] Gitcoin d/acc 2026 Funding Initiative: Restructuring the Grants Program (2026-03-06)"
    year: 2026
    url: https://gov.gitcoin.co/t/proposal-gitcoin-d-acc-2026-funding-initiative-restructuring-the-grants-program/25157
  gitcoinreboot2026:
    authors:
      - Gitcoin Reboot Update
    title: "[July 2026] Gitcoin Reboot Update - The First-Principles Theory of Change (owocki, 2026-06-26)"
    year: 2026
    url: https://gov.gitcoin.co/t/july-2026-gitcoin-reboot-update-the-first-principles-theory-of-change/25329
  gitcoinretro2026:
    authors:
      - Gitcoin GTC Retrospective
    title: "[temp check] gtc retrospective (owocki, 2026-07-14)"
    year: 2026
    url: https://gov.gitcoin.co/t/temp-check-gtc-retrospective/25343
  optrf4details2024:
    authors:
      - Optimism RF4 Details
    title: "Retro Funding 4: Onchain Builders - round details (2024-04-18)"
    year: 2024
    url: https://gov.optimism.io/t/retro-funding-4-onchain-builders-round-details/7988
  optrf4reflect2024:
    authors:
      - Optimism RF4 Reflections
    title: "Retro Funding 4: Learnings and Reflections (Optimism governance forum, 2024-11-15)"
    year: 2024
    url: https://gov.optimism.io/t/retro-funding-4-learnings-and-reflections/9271
  optrf5details2024:
    authors:
      - Optimism RF5 Details
    title: "Retro Funding 5: OP Stack - round details (2024-07-22)"
    year: 2024
    url: https://gov.optimism.io/t/retro-funding-5-op-stack-round-details/8612
  optrf6details2024:
    authors:
      - Optimism RF6 Details
    title: "Retro Funding 6: Governance - Round details (2024-09-16)"
    year: 2024
    url: https://gov.optimism.io/t/retro-funding-6-governance-round-details/8870
  optlessons2024:
    authors:
      - Optimism Retro Lessons
    title: Lessons learned from two years of Retroactive Public Goods Funding (ccerv1, Optimism governance forum, 2024-11-05)
    year: 2024
    url: https://gov.optimism.io/t/lessons-learned-from-two-years-of-retroactive-public-goods-funding/9239
  optevolution2025:
    authors:
      - Optimism Retro Season 8
    title: Evolution of Retro Funding in Season 8 (Optimism governance forum, 2025-06-17)
    year: 2025
    url: https://gov.optimism.io/t/evolution-of-retro-funding-in-season-8/10024
  optretrorepo2026:
    authors:
      - Optimism Retro Repo
    title: ethereum-optimism/Retro-Funding (evaluation algorithms and monthly results, changelog to M11 2026-01-08)
    year: 2026
    url: https://github.com/ethereum-optimism/Retro-Funding
  optbudget2026:
    authors:
      - Optimism Year 4 Budget
    title: Collective Year 4 Budget Update and Year 5 Budget Outlook (Optimism governance forum, 2026-08-06)
    year: 2026
    url: https://gov.optimism.io/t/collective-year-4-budget-update-and-year-5-budget-outlook/10796
  yu2025:
    authors:
      - Jia Yu
      - A. Leroy Bennett
      - Billy Gao
      - Rebecca Joseph
    title: Evaluating Voting Design Vulnerabilities for Retroactive Funding
    year: 2025
    doi: 10.48550/arxiv.2505.16068
    url: https://doi.org/10.48550/arxiv.2505.16068
  briman2025:
    authors:
      - Eyal Briman
      - Nimrod Talmon
      - Angela Kreitenweis
      - Muhammad Idrees
    title: A Social Choice Analysis of Optimism's Retroactive Project Funding
    year: 2025
    doi: 10.1007/978-3-032-03273-7_5
    url: https://doi.org/10.1007/978-3-032-03273-7_5
  optgrants2026:
    authors:
      - Optimism Season 9 Report
    title: Season 9 Final Report (Optimism governance forum, 2026-05-23)
    year: 2026
    url: https://gov.optimism.io/t/season-9-final-report/10685
  hypercertsv1code2025:
    authors:
      - Hypercerts Contracts
    title: hypercerts-org/hypercerts-protocol (EVM contracts, last commit 2025-01-22)
    year: 2025
    url: https://github.com/hypercerts-org/hypercerts-protocol
  hypercertsdocs2026:
    authors:
      - Hypercerts Docs
    title: Hypercerts documentation (hypercerts-org/documentation, FAQ and core concepts)
    year: 2026
    url: https://github.com/hypercerts-org/documentation
  hypercertslexicon2026:
    authors:
      - Hypercerts Lexicon
    title: hypercerts-org/hypercerts-lexicon v1.5.0 (ATProto lexicons)
    year: 2026
    url: https://github.com/hypercerts-org/hypercerts-lexicon
  mehta2024:
    authors:
      - Devansh Mehta
      - Nidhi Harihar
      - Siddique Patel
      - Nishit Lalitkumar Sanil
    title: "Demo: Marketplace for Impact Certificates"
    year: 2024
    doi: 10.1145/3678884.3687146
    url: https://doi.org/10.1145/3678884.3687146
  protocolguilddocs2026:
    authors:
      - Protocol Guild Docs
    title: protocolguild/documentation (membership, onchain architecture, donate, entity; last commit 2026-09-30)
    year: 2026
    url: https://github.com/protocolguild/documentation
  protocolguildonchain2026:
    authors:
      - Protocol Guild Balances
    title: Protocol Guild vest and split native-ETH balances, Ethereum block 26149898
    year: 2026
    url: https://etherscan.io/address/0x25941dc771bb64514fc8abbce970307fb9d477e9
  defillamaprotocols2026:
    authors:
      - DeFiLlama Protocols
    title: DeFiLlama api.llama.fi/protocols read 2026-10-08
    year: 2026
    url: https://api.llama.fi/protocols
  macirepo2026:
    authors:
      - MACI Repo
    title: privacy-scaling-explorations/maci (tags v2.5.0, v3.0.0; pushed 2026-07-23)
    year: 2026
    url: https://github.com/privacy-scaling-explorations/maci
  macidocs2026:
    authors:
      - MACI Docs
    title: MACI introduction (maci.pse.dev/docs/introduction)
    year: 2026
    url: https://maci.pse.dev/docs/introduction
  flowcouncilcode2026:
    authors:
      - Flow Council Contracts
    title: Flow-State-Coop/flow-council (FlowCouncil.sol, FlowCouncilFactory.sol)
    year: 2026
    url: https://github.com/Flow-State-Coop/flow-council
  flowstatedocs2026:
    authors:
      - Flow State Docs
    title: Flow State documentation (Flow QF, Flow Guilds, Why Streaming)
    year: 2026
    url: https://github.com/Flow-State-Coop/docs
  thrivesite2026:
    authors:
      - Thrive Site
    title: thriveprotocol.com read 2026-10-08 (redirects to thrive.xyz)
    year: 2026
    url: https://thrive.xyz
  prosperitypass2026:
    authors:
      - Prosperity Pass Page
    title: Prosperity Pass on Karma (karmahq.org/project/prosperity-pass/about)
    year: 2026
    url: https://www.karmahq.org/project/prosperity-pass/about
  nounscode2026:
    authors:
      - Nouns Contracts
    title: nounsDAO/nouns-monorepo contracts (last commit 2026-10-05)
    year: 2026
    url: https://github.com/nounsDAO/nouns-monorepo
  nounsonchain2026:
    authors:
      - Nouns Reads
    title: Nouns token, DAO and auction reads on Ethereum mainnet, 2026-10-08
    year: 2026
    url: https://etherscan.io/address/0x6f3E6272A167e8AcCb32072d08E0957F9c79223d
  klerosv2code2026:
    authors:
      - Kleros V2 Contracts
    title: kleros/kleros-v2 contracts (last commit 2026-10-07)
    year: 2026
    url: https://github.com/kleros/kleros-v2
  klerosonchain2026:
    authors:
      - Kleros PNK Read
    title: PNK token read, Ethereum mainnet, 2026-10-08
    year: 2026
    url: https://etherscan.io/token/0x93ED3FBe21207Ec2E8f2d3c3de6e058Cb73Bc04d
  hatsprotocol2024:
    authors:
      - Hats Protocol Contracts
    title: Hats-Protocol/hats-protocol Hats.sol (last commit 2024-05-29) and deployed code
    year: 2024
    url: https://github.com/Hats-Protocol/hats-protocol
  metagovsite2026:
    authors:
      - Metagov Site
    title: metagov.org
    year: 2026
    url: https://metagov.org
  ftcsite2026:
    authors:
      - Funding the Commons Site
    title: fundingthecommons.io
    year: 2026
    url: https://fundingthecommons.io
---

Read on 2026-10-08 from source code, deployed contracts, documentation, governance forums and dated DeFiLlama reads. The record behind this note is `public-goods-funding-protocols`; each statement below is carried by the row cited.

## Quadratic funding as specified, and what the deployed code computes

The specification gives each project the square of the sum of the square roots of its contributions ([Buterin et al. 2018](https://arxiv.org/abs/1809.06421)). Three deployments compute it three ways.

- The Gitcoin calculator runs off-chain: standard QF is `sum(sqrt(x))**2 - sum(x)` per project, with pairwise, cluster-match and connection-oriented cluster matching (COCM) variants, and donation amounts scaled from 0.5x to 1.0x by Passport score ([Gitcoin QF Calculator 2025](https://github.com/gitcoinco/qf-calculator)). The Allo contract side never computes that match: the Donation Voting strategies take donations straight to recipients and the pool manager posts a merkle root of the off-chain matching distribution, which recipients claim with proofs ([Allo Contracts 2025](https://github.com/allo-protocol/allo-v2)).
- Allo's on-chain QV strategy computes per-allocator square roots of voice credits and pays pro rata on summed votes, so its recipient total is a sum of square roots, not the square of that sum ([Allo Contracts 2025](https://github.com/allo-protocol/allo-v2)).
- clr.fund is the only one of these to put the full capital-constrained formula on-chain: `allocated = (alpha * votes^2 + (precision - alpha) * spent) / precision`, with alpha fixed at finalization from the budget, so matching never exceeds the pool ([Clr Fund Contracts 2024](https://github.com/clrfund/monorepo)). Votes are MACI encrypted messages, and the coordinator's zero-knowledge tally is verified in `finalize()`.

Empirically, matching needs scale quickly with many equally funded projects, matching is exhausted early, contributors give small amounts across many projects, and reciprocal backing appears in Gitcoin Grants data ([Pasquini 2020](https://doi.org/10.48550/arxiv.2010.01193)). The OpenAlex searches found no experimental or field test of quadratic funding and no paper measuring collusion in a deployed round; the COCM source paper was found only as an empty-abstract record.

## Gitcoin Grants Stack and Allo

**Contracts.** One upgradeable Allo proxy, `0x1133eA7Af70876e64665ecD07C0A0476d09465a1`, sits at the same address on Ethereum, Optimism, Arbitrum and Base, with registry `0x4AAcca72145e1dF2aeC137E1f3C5E3D75DB8b5f3`, percent fee and base fee both 0, one owner `0x8C18...647C` on three chains and a separate treasury per chain ([Allo Deployments 2026](https://optimistic.etherscan.io/address/0x1133eA7Af70876e64665ecD07C0A0476d09465a1)). The owner can change fees, treasury, registry and the cloneable-strategy list and can recover funds; pools run any strategy contract ([Allo Contracts 2025](https://github.com/allo-protocol/allo-v2)). The repository's last commit is 2025-04-08, and the protocol was proposed on 2025-01-08 to spin out as Allo.Capital, "the capital allocation layer of the tokenized internet" ([Allo Capital Announcement 2025](https://gov.gitcoin.co/t/announcement-introducing-allo-capital/19839)).

**Sybil defence.** Since GG20 the program has used COCM plus Passport model-based detection and says it did no closed-source silencing in GG23 ([Gitcoin GG23 Results 2025](https://gov.gitcoin.co/t/gg23-oss-program-quadratic-funding-results/20334)). Human Passport, the renamed Passport, issues Sign Protocol attestations on Optimism and Base and classifies EVM addresses as Sybil or human with models ([Human Passport Docs 2026](https://docs.passport.human.tech/)). In GR14, the post-hoc fraud-tax mitigation covered $879K, 25.4% ([Gitcoin Rounds Arc 2026](https://gov.gitcoin.co/t/gitcoin-grants-rounds-gr1-gg24/25253)).

**Scale.** GG23 OSS quadratic funding: $600k matching, $95,278.16 crowdfunded, 9,991 donors, 235 projects, with matching capped per project at $20,000 and two projects removed for quid pro quo ([Gitcoin GG23 Results 2025](https://gov.gitcoin.co/t/gg23-oss-program-quadratic-funding-results/20334)). GG24 launched at $1.175M of Gitcoin match against $632,500 third-party, 54% co-funded, with $125,500 to $170,680 of the matching request earmarked for round operations ([Gitcoin Treasury Contract 2026](https://gov.gitcoin.co/t/social-contract-of-the-gitcoin-public-goods-treasury-2020-2026/25366)). The matching pool stood at $10,189,330 on 2026-07-23, and a pilot puts $1m (matched by Octant to $2m) into ERC-4626 vaults so that only yield funds matching ([Gitcoin Treasury Contract 2026](https://gov.gitcoin.co/t/social-contract-of-the-gitcoin-public-goods-treasury-2020-2026/25366)).

**Direction.** Gitcoin moved from QF-only to QF plus metrics retro funding in GG23 and to co-funded domains in GG24 ([Gitcoin Rounds Arc 2026](https://gov.gitcoin.co/t/gitcoin-grants-rounds-gr1-gg24/25253)); one GG24 round used conviction voting and spent 16.1% of $123,800 on operations ([Gitcoin GG24 Tooling Retro 2026](https://gov.gitcoin.co/t/gg24-public-goods-tooling-development-round-full-retrospective/25276)). A proposal dated 2026-03-06 would sunset Gitcoin Grants for one yearlong d/acc campaign funded by yield and coalition money ([Gitcoin Dacc Proposal 2026](https://gov.gitcoin.co/t/proposal-gitcoin-d-acc-2026-funding-initiative-restructuring-the-grants-program/25157)), and the reboot update posted 2026-06-26 describes a local-first platform for AI-displaced professionals, names that the matching pool burns faster than opex runway, and keeps allocator-only as a named alternative ([Gitcoin Reboot Update 2026](https://gov.gitcoin.co/t/july-2026-gitcoin-reboot-update-the-first-principles-theory-of-change/25329)). The founder's own retrospective says "we lost the lead in a market we created" ([Gitcoin GTC Retrospective 2026](https://gov.gitcoin.co/t/temp-check-gtc-retrospective/25343)).

**Does not do.** No on-chain QF match in Allo; matching is trusted to an off-chain calculator and a manager's merkle root; identity is delegated to Passport; the matching pool is held and managed by a governance-controlled multisig whose custody the post describes as moving from escrow toward endowment.

## Optimism Retro Funding

Round sizes read from round posts: Retro Funding 3 allocated 30M OP, with 1.5M to the top 20% of usage-generating applicants ([Optimism RF4 Details 2024](https://gov.optimism.io/t/retro-funding-4-onchain-builders-round-details/7988)); Retro Funding 4, 10M OP to onchain builders with a 500,000 OP cap, where the top 20% of applicants took about 70% ([Optimism RF4 Reflections 2024](https://gov.optimism.io/t/retro-funding-4-learnings-and-reflections/9271)); Retro Funding 5, 8M OP to OP Stack contributors ([Optimism RF5 Details 2024](https://gov.optimism.io/t/retro-funding-5-op-stack-round-details/8612)); Retro Funding 6, a citizen-voted size in a 1.1M to 3.5M OP range ([Optimism RF6 Details 2024](https://gov.optimism.io/t/retro-funding-6-governance-round-details/8870)). Sizes for rounds 1 and 2 were not read from a first-party post.

The OSO author's two-year review says mega rounds became popularity contests, expert grouping produced flat results and an incentive to split work across teams, and there is no data yet that retroactive funding yields better outcomes ([Optimism Retro Lessons 2024](https://gov.optimism.io/t/lessons-learned-from-two-years-of-retroactive-public-goods-funding/9239)). Season 7 replaced voting with monthly algorithmic payouts; Season 8 dropped Citizens' House votes on algorithms because voters chose by how favourite projects scored ([Optimism Retro Season 8 2025](https://gov.optimism.io/t/evolution-of-retro-funding-in-season-8/10024)). The algorithms are open: weighted metric variants with a percentile cap, and the monthly Onchain Builders budget fell from 1,300,000 OP to 166,666.67 OP in the first Season 8 month ([Optimism Retro Repo 2026](https://github.com/ethereum-optimism/Retro-Funding)). By the Year 4 budget report Retro Funding is paused, at 81.4M OP committed of 859M OP allocated, with the Collective reorienting to OP Mainnet growth and enterprise customers ([Optimism Year 4 Budget 2026](https://gov.optimism.io/t/collective-year-4-budget-update-and-year-5-budget-outlook/10796)). Formal analyses find vulnerabilities in the quadratic, mean and median ballots ([Yu et al. 2025](https://doi.org/10.48550/arxiv.2505.16068)) and recommend a strategyproof moving-phantoms rule ([Briman et al. 2025](https://doi.org/10.1007/978-3-032-03273-7_5)). Separately, the Token House grants council in Season 9 screened 38 applications with an AI filter and granted four ([Optimism Season 9 Report 2026](https://gov.optimism.io/t/season-9-final-report/10685)).

**Does not do.** Retro Funding has no on-chain allocation contract in the sources read; payout data is a CSV pipeline in a repository; it is funded from a fixed 859M OP allocation, not protocol revenue; it is paused.

## Hypercerts

The original design is an upgradeable, pausable ERC-1155 minter with split and merge of fractions, merkle allowlists and transfer restrictions, proxies on Optimism, Base and Celo ([Hypercerts Contracts 2025](https://github.com/hypercerts-org/hypercerts-protocol)). The current protocol is not that: its documentation states records live on AT Protocol and "does not represent each hypercert as an onchain token", with no anchoring, freezing, ownership or settlement in the lexicons ([Hypercerts Docs 2026](https://github.com/hypercerts-org/documentation)). The lexicon defines activity claims, contributions, evaluations, measurements, attachments and funding receipts, and the organisation lists the old monorepo as a backup and the SDK as deprecated ([Hypercerts Lexicon 2026](https://github.com/hypercerts-org/hypercerts-lexicon)). A marketplace demo minted 27 impact certificates on a testnet and raised USD 4034 from 133 contributors through Gitcoin ([Mehta et al. 2024](https://doi.org/10.1145/3678884.3687146)).

**Does not do.** Today it settles nothing: a funding receipt only describes a payment that happened elsewhere ([Hypercerts Docs 2026](https://github.com/hypercerts-org/documentation)). The number of EVM hypercerts minted was not readable from the contract.

## Protocol Guild

Donations enter immutable Splits vesting contracts (1-year and 4-year on mainnet, 1-year and 4-year on three L2s), vest block by block, pass through a pass-through wallet to a mutable split that is the membership registry; an Agora DAO updates the mainnet split quarterly and triggers weekly distributions, and L2 splits are multisig-run ([Protocol Guild Docs 2026](https://github.com/protocolguild/documentation)). The share formula is `sqrt((start_date - months_inactive) * full_or_part_time)` normalized across members; the file lists 188 active members in 29 teams, the entity takes 10% of vested funds, and eligibility requires six months of continuous core-protocol work ([Protocol Guild Docs 2026](https://github.com/protocolguild/documentation)). At Ethereum block 26149898 the 4-year vest held 963.196 ETH and the 1-year vest 21.648 ETH in native ETH ([Protocol Guild Balances 2026](https://etherscan.io/address/0x25941dc771bb64514fc8abbce970307fb9d477e9)). DeFiLlama has no Protocol Guild entry ([DeFiLlama Protocols 2026](https://api.llama.fi/protocols)).

**Does not do.** Weights come from members' own pull requests and a self-reported start date, not from any measure of output; the beneficiary set is a closed guild of Ethereum core developers.

## clr.fund and MACI

clr.fund contributors receive voice credits capped at 10^9 against a 10^4-token contribution limit, with user registries for BrightID, Semaphore, Snapshot and Merkle lists and recipient registries including a Kleros curated-list adapter ([Clr Fund Contracts 2024](https://github.com/clrfund/monorepo)). The repository's last push is 2024-08-01. MACI itself is current (tag v3.0.0, pushed 2026-07-23) ([MACI Repo 2026](https://github.com/privacy-scaling-explorations/maci)); its stated properties hold except against a trusted coordinator, who can see votes ([MACI Docs 2026](https://maci.pse.dev/docs/introduction)). **Does not do:** a coordinator is a single point of privacy failure; clr.fund's own code is dormant.

## Flow State Flow Councils

FlowCouncil creates a Superfluid distribution pool; each recipient's units equal votes received plus one; voters carry a manager-assigned voting power and a limit on the number of recipients they can split across; votes are linear ([Flow Council Contracts 2026](https://github.com/Flow-State-Coop/flow-council)). Flow QF rounds are operated with Flow State, not self-serve ([Flow State Docs 2026](https://github.com/Flow-State-Coop/docs)). Superfluid is $5.59M of TVL ([DeFiLlama Protocols 2026](https://api.llama.fi/protocols)). **Does not do:** no quadratic weighting or identity check in the council contract; the voter list is administrator-curated.

## Thrive, Prosperity Pass, Nouns, Kleros, Hats

- Thrive: the domain thriveprotocol.com redirects to thrive.xyz, now a private-company data verification service, with "Thrive Protocol" only in a footer; no builder-rewards program or contract was found ([Thrive Site 2026](https://thrive.xyz)).
- Prosperity Pass: a Celo account that issues badges raising a level with perks; the page states no monetization aim and names no team, scoring formula or contract ([Prosperity Pass Page 2026](https://www.karmahq.org/project/prosperity-pass/about)).
- Nouns: governance with propose, veto, refundable votes and a fork mechanism ([Nouns Contracts 2026](https://github.com/nounsDAO/nouns-monorepo)); on 2026-10-08 supply was 2016 with 655 held by the treasury, 1002 proposals, voting delay 3600 and period 28800 blocks, a 25 bps proposal threshold and a fork threshold set to 10000 bps, which equals the adjusted supply of 1361 ([Nouns Reads 2026](https://etherscan.io/address/0x6f3E6272A167e8AcCb32072d08E0957F9c79223d)).
- Kleros: upgradeable arbitrator with staked jurors drawn by sortition, appeals that escalate to a parent court, a PNK penalty for incoherent votes, and dispute kits including a Sybil-resistant kit ([Kleros V2 Contracts 2026](https://github.com/kleros/kleros-v2)); PNK supply is 915,528,222 ([Kleros PNK Read 2026](https://etherscan.io/token/0x93ED3FBe21207Ec2E8f2d3c3de6e058Cb73Bc04d)).
- Hats: an ERC-1155 role tree with pluggable eligibility and toggle modules ([Hats Protocol Contracts 2024](https://github.com/Hats-Protocol/hats-protocol)); the Hats v2 bug-bounty entry shows $162,931 TVL ([DeFiLlama Protocols 2026](https://api.llama.fi/protocols)).

## Convenors

Metagov describes itself as a research-to-infrastructure nonprofit, lists no funding mechanism and names the Optimism Collective among funders ([Metagov Site 2026](https://metagov.org)). Funding the Commons lists 27 events, $790,000+ in facilitated funding and a $174,536 Tor campaign distribution ([Funding the Commons Site 2026](https://fundingthecommons.io)).
