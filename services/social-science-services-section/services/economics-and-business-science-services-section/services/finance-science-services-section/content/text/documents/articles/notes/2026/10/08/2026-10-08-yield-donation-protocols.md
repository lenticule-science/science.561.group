---
title: "Yield Donation Protocols"
description: "How Octant v1, Octant v2, Glo Dollar and Giveth turn staking proceeds or reserve yield into public-goods funding: contract mechanism, admin keys, dated scale and gaps"
date-created: 2026-10-08
aliases:
  - "yield-donation-protocols"
  - "yield donating strategy"
keywords:
  - yield-donation
  - octant
  - glo-dollar
  - giveth
  - public-goods-funding
teaches:
  - "Yield Donation Protocols"
requires: []
authors:
  - claude-sonnet-5-5
type: text
references:
  octantv1contracts2026:
    authors:
      - Octant V1 Contracts
    title: octant/contracts-v1 (Auth, Deposits, Epochs, Proposals, Vault, WithdrawalsTarget)
    year: 2026
    url: https://github.com/golemfoundation/octant/tree/master/contracts-v1
  octantv1backend2026:
    authors:
      - Octant V1 Backend
    title: octant/backend reward engine (octant_rewards, projects/rewards, constants)
    year: 2026
    url: https://github.com/golemfoundation/octant/tree/master/backend/app/engine
  octantmainnetreads2026:
    authors:
      - Octant Mainnet Reads
    title: Octant v1 mainnet reads at block 26149871
    year: 2026
    url: https://etherscan.io/address/0xc292eBCa7855CB464755Aa638f9784c131F27D59
  octantdocsblocked2026:
    authors:
      - Octant Web Surfaces
    title: docs.octant.app, octant.app, octant.build, golem.foundation, backend.mainnet.octant.app
    year: 2026
    url: https://docs.octant.app
  defillamaprotocols2026:
    authors:
      - DeFiLlama Protocols
    title: DeFiLlama protocol list (api.llama.fi/protocols), name search
    year: 2026
    url: https://api.llama.fi/protocols
  octantv2core2026:
    authors:
      - Octant V2 Core
    title: octant-v2-core (TokenizedStrategy, YieldDonatingTokenizedStrategy, MultistrategyVault, PaymentSplitter, mechanisms, regen)
    year: 2026
    url: https://github.com/golemfoundation/octant-v2-core
  octantv2onchain2026:
    authors:
      - Octant V2 Mainnet Reads
    title: Octant v2 mainnet deployments read with eth_getCode
    year: 2026
    url: https://etherscan.io/address/0xb27064A2C51b8C5b39A5Bb911AD34DB039C3aB9c
  octantshutter2026:
    authors:
      - Octant Shutter Plan
    title: Shutter DAO 0x36 x Octant v2 Integration Plan (partners/shutter_dao_0x36)
    year: 2026
    url: https://github.com/golemfoundation/octant-v2-core/tree/master/partners/shutter_dao_0x36
  glodollardocs2026:
    authors:
      - Glo Foundation Docs
    title: "glodollar.org: How Glo Dollar works; Glo Dollar 2.0; Smart contract addresses and audits; Funding Recipients"
    year: 2026
    url: https://www.glodollar.org/articles/how-glo-dollar-works
  glowallet2026:
    authors:
      - Glo Wallet Repository
    title: Glo-Foundation/glo-wallet (Next.js app, Prisma schema, api routes)
    year: 2026
    url: https://github.com/Glo-Foundation/glo-wallet
  glodollarcontract2026:
    authors:
      - Glo Dollar Contract
    title: GloDollarV3 (USDGLO) verified source, proxy 0x4F60...5AD3, implementation 0xf8dbE4F5...c56F
    year: 2026
    url: https://sourcify.dev/server/v2/contract/1/0xf8dbe4f52b7d4fe90cd360aa4f49b7a66783c56f
  brale2026:
    authors:
      - Brale Reserve Report
    title: USDGLO Reserve Report (Assertion of Brale Management), report date 2026-06-30
    year: 2026
    url: https://brale.xyz/assets/reports/USDGLO-Glo-Dollar-Reserve-Attestation-Report-06-2026.pdf
  defillamastable2026:
    authors:
      - DeFiLlama Stablecoins
    title: "DeFiLlama stablecoins: Glo Dollar (id 155)"
    year: 2026
    url: https://stablecoins.llama.fi/stablecoin/155
  gitcoingovglo2024:
    authors:
      - Gitcoin Governance Glo Proposal
    title: "[Proposal] Delegate Gitcoin's GloDollar to fund public goods via GloDollar"
    year: 2024
    url: https://gov.gitcoin.co/t/proposal-delegate-gitcoins-glodollar-to-fund-public-goods-via-glodollar/18804
  genius2025:
    authors:
      - GENIUS Act
    title: Guiding and Establishing National Innovation for U.S. Stablecoins Act, Public Law 119-27 (S. 1582)
    year: 2025
    url: https://www.congress.gov/119/plaws/publ27/PLAW-119publ27.htm
  givethdonationhandler2026:
    authors:
      - Giveth Donation Handler
    title: Giveth/donation-handler-foundry (DonationHandler) and Giveth/qf-calculator
    year: 2026
    url: https://github.com/Giveth/donation-handler-foundry
  givethdocs2026:
    authors:
      - Giveth Docs
    title: "docs.giveth.io: GIVeconomy, GIVbacks, GIVpower"
    year: 2026
    url: https://docs.giveth.io/giveconomy
  givethtokencontracts2026:
    authors:
      - Giveth Token Contracts
    title: Giveth/giv-token-contracts (TokenDistro, MerkleDistro, GIV, UnipoolTokenDistributor, UniswapV3Staker)
    year: 2024
    url: https://github.com/Giveth/giv-token-contracts
  givethchainreads2026:
    authors:
      - Giveth Chain Reads
    title: Giveth token and staking reads on Ethereum, Gnosis, Optimism
    year: 2026
    url: https://gnosisscan.io/address/0xf11aC05c97F8845f6b974e9e327129d36683cC90
  gitcoingtceth2023:
    authors:
      - Gitcoin Governance gtcETH Proposal
    title: "[GCP-001] - PASSED - Funding IndexCoop gtcETH offering"
    year: 2023
    url: https://gov.gitcoin.co/t/gcp-001-funding-indexcoop-gtceth-offering/13013
---

A yield-donation protocol separates principal from yield: holders keep a claim on the principal, and the return on it is routed to a recipient set by rule or vote. The four systems read here do this at four different layers: a staking ledger with off-chain arithmetic (Octant v1), a tokenized vault whose profit shares are minted to a router (Octant v2), an off-chain reserve with a charity revenue share (Glo Dollar), and a donation platform with a loyalty token (Giveth).

## Octant v1: GLM locks, epochs, merkle payouts

Octant V1 Contracts 2026 is five small contracts. Deposits is a bare lock and unlock ledger of GLM with no cooldown and no yield logic. Epochs derives the epoch number from wall time over an immutable start. Vault pays by merkle proof against one root per epoch that the Golem multisig sets, and the same multisig can call emergencyWithdraw. Projects holds a per-epoch address list that the multisig sets. The README of that repository states the design: "Rest of functionality is currently implemented on the server".

The server arithmetic is in Octant V1 Backend 2026. Defaults are operational cost 25%, community fund 5%, total rewards 70% of staking proceeds, individual rewards equilibrium 35% and matched rewards 35%. The matched pool shrinks as more GLM is locked: below the equilibrium ratio it is 35% of proceeds, between equilibrium and 70% it is the difference between 70% and the locked ratio times proceeds, and above 70% only patron money matches. A project's score is the square of the sum of square roots of uniqueness-weighted allocation amounts, each project's match is capped at 20% of the pool, and the uniqueness score comes from Gitcoin Passport with a mainnet threshold of 15.

Octant Mainnet Reads 2026 gives the live state at block 26149871: epoch 17, epoch length 3,715,200 seconds (43 days), a 14-day decision window, start on 2023-08-08, merkle roots set for epochs 1 to 11 and empty for 12, 1,139,205.58 GLM in the Deposits contract, 189.90 ETH in the Vault and 55.20 ETH in the withdrawals target. The Auth contract names one Golem Foundation multisig. Octant Web Surfaces 2026 records that the docs, app and REST API answered with a Cloudflare 403 challenge, so per-epoch ETH totals were not read; DeFiLlama Protocols 2026 lists no Octant entry.

What it does not do on chain: the quadratic-funding result, the rewards and the project list are computed and published by the Foundation, and the only on-chain check is that a withdrawal matches a root the multisig chose. No timelock is on any multisig function in the source.

## Octant v2: yield-donating tokenized strategies

Octant V2 Core 2026 turns the donation into share minting. A strategy built on the Yearn v3 tokenized-strategy pattern is an ERC-4626 vault. A keeper calls report(); the strategy measures new total assets, and on profit mints the equivalent number of shares to the dragon router, so depositors' share count never changes while the router's claim grows. On a loss, the router's shares are burned first when burning is enabled. The router address can only be changed through a two-step process with a 14-day cooldown. The router in practice is a PaymentSplitter (pull payments by fixed shares), a Safe, or an allocation mechanism. The repository carries strategies for Aave V3, ERC-4626 vaults, Morpho, Sky, Spark and Yearn V3, yield-skimming strategies for Lido and Rocket Pool, a multistrategy vault, regen staking with a contribute function, and an alpha-weighted quadratic and linear funding mechanism with an address allowset and blockset.

Octant V2 Mainnet Reads 2026 confirms bytecode at the strategy implementation 0xb27064A2C51b8C5b39A5Bb911AD34DB039C3aB9c and at the Morpho, Yearn, Sky, regen and payment-splitter factories. Octant Shutter Plan 2026 is the one named deployment in the repository: Shutter DAO's treasury allocates 1.2M USDC to a Morpho-backed strategy with 100% of yield to a Dragon Funding Pool, and the plan sets the keeper to a bot because a treasury keeper would cost 144 hours of governance per harvest. The repository lists four audit PDFs (Spearbit, Cantina, Bailsec and a competition report) but their text was not read, and no strategy TVL or cumulative donation figure was found.

## Glo Dollar: reserve yield through an issuer revenue share

Glo Foundation Docs 2026 describes the chain: holders choose a recipient with one vote per USDGLO, the issuer Brale invests the reserve off chain, Brale sends a monthly revenue share on chain in USDGLO to the Foundation, and the Foundation donates all of it to the recipients holders chose. Brale keeps everything on the first $2M of reserves, and the Foundation's share rises above that. The holder choice is a signed message stored in a SQL database, per Glo Wallet Repository 2026; no vote contract exists in the source.

Glo Dollar Contract 2026 is an upgradeable ERC-20 with pause, denylist and a function that destroys a denylisted balance; mint, burn and upgrade are role-gated, and the role holders were not read. Brale Reserve Report 2026 states at 2026-06-30 2,133,683 USDGLO issued against $1,818,189 of cash and $315,494 of US government debt, as a management assertion; the 2025 report was an independent examination at 3,390,810 issued, so supply fell 37% in a year. DeFiLlama Stablecoins 2026 shows about $1.02M circulating across eight chains on 2026-10-08. The monthly donation report for March shows $5,016.21 received, of which $2,000 went to Celo Public Goods. Gitcoin Governance Glo Proposal 2024 shows a DAO using Glo to route yield to Gitcoin, Giveth and Protocol Guild.

GENIUS Act 2025 section 4(a)(11) bars an issuer from paying a holder any interest or yield for holding. Glo's yield goes to charities and not to holders, and the statute text read contains no provision on a third party receiving reserve yield. No glodollar.org page mentions the Act, and none names a Glo Collective.

## Giveth: pass-through donation plus a loyalty token

Giveth is not a yield protocol: the donation itself is the flow. Giveth Donation Handler 2026 is an upgradeable handler that forwards ETH or ERC-20 to recipient addresses, singly or in batch, and emits a DonationMade event; it holds no funds. Quadratic-funding matching is computed off chain from a donation export, by standard QF or Connection-Oriented Cluster Matching with Passport-score Sybil defence, and the result is returned to the platform as a file.

The token layer is Giveth Docs 2026 and Giveth Token Contracts 2024. One billion GIV were minted, 100 million liquid and 900 million allocated to a stream; the docs state the stream runs until 2026-12-23. The TokenDistro contract keeps an allocation table with start, cliff, duration, an initial amount and a locked amount, hands allocations to distributors (a Merkle airdrop, Unipool farms), and is cancelable by design. Giveth Chain Reads 2026 shows GIV supply of 1,000,000,000 on Ethereum, 683,158,904 on Gnosis and 238,534,589 on Optimism, and the Gnosis TokenDistro at 0xf11aC05c97F8845f6b974e9e327129d36683cC90 returning a duration of 11,262,857 seconds; that duration does not match the docs' five-year schedule and the two were not reconciled.

GIVbacks pay GIV to donors. Since round 77 (2024-11-26) it is a raffle: rounds last two weeks with 1 million GIV each, donors of at least 5 USD to verified projects in eligible tokens qualify, and each eligible donation gives a chance to win up to 500,000 GIV. GIVpower matches staked GIV 1:1 with a non-transferable token, lets holders lock from 2 weeks to 1 year for a higher multiplier, and uses the result to rank projects. DeFiLlama Protocols 2026 lists Giveth in Charity Fundraising at TVL 0. The Causes page of the docs returned 404 and no Causes mechanism is stated here.

What it does not do: no principal is held, so nothing earns yield for donors; the donor reward is a token whose supply is fixed and streaming out, and which falls to the project-ranking and raffle uses.

## A fee-based variant: gtcETH

Gitcoin Governance gtcETH Proposal 2023 (passed as GCP-001) sets up the same split by fee instead of by share minting: an Index Coop index of liquid staking tokens carries an annualized streaming fee of 2.00%, of which 1.75% goes to the Gitcoin DAO and 0.25% to Index Coop, and the holder keeps the rest of the staking return and the ETH price exposure. No Lido DAO or Rocket Pool DAO contract that donates treasury or commission yield was found; Octant v2 handles those assets through its yield-skimming strategies instead.

## What the pattern fails at

Octant v1 depends on one multisig for roots and project lists. Glo depends on one issuer and a revenue-share threshold; at about $2M of reserves its donations are a few thousand dollars a month. Octant v2 moves the donation on chain but leaves the strategy admin, keeper and router as roles. In all four, the principal's holders choose nothing about risk.
