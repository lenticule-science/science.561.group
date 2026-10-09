---
title: "Treasury and Contribution Primitives"
description: "Contract-level reading of Drips, Juicebox and Revnet, Moloch v3 Baal, 0xSplits, Regen Network, Toucan and KlimaDAO, Safe allowance and Zodiac Roles, and Hats: how funds flow, who holds keys, what they measure at scale, and what each fails to do"
date-created: 2026-10-08
aliases:
  - "treasury primitives survey"
  - "contribution accounting primitives"
keywords:
  - drips
  - juicebox
  - revnet
  - moloch
  - baal
  - splits
  - regen-network
  - toucan
  - klimadao
  - zodiac-roles
  - hats-protocol
teaches:
  - "Treasury and Contribution Primitives"
requires: [ragequit, dependency-splitting, revnet, treasury-ruleset, pooled-carbon-token, proof-of-authority]
authors:
  - claude-sonnet-5-5
type: text
references:
  dripscontracts2026:
    authors:
      - Drips Contracts
    title: Radicle Drips protocol V2 smart contracts (drips-network/contracts, commit 07c3924)
    year: 2026
    url: https://github.com/drips-network/contracts
  dripsonchain2026:
    authors:
      - Drips Onchain Reads
    title: Drips protocol on-chain reads on Ethereum and Optimism, 2026-10-08
    year: 2026
    url: https://eth.blockscout.com/address/0xd0Dd053392db676D57317CD4fe96Fc2cCf42D0b4
  dripsdocs2026:
    authors:
      - Drips Docs
    title: Drips documentation (drips-network/docs, docs/pages)
    year: 2026
    url: https://github.com/drips-network/docs
  nanacorev52025:
    authors:
      - Nana Core V5
    title: "Bananapus nana-core-v5: Juicebox V5 core contracts (commit cb1f992)"
    year: 2025
    url: https://github.com/Bananapus/nana-core-v5
  revnetcore2025:
    authors:
      - Revnet Core
    title: "rev-net/revnet-core-v5: REVDeployer and REVLoans (commit 024d584)"
    year: 2025
    url: https://github.com/rev-net/revnet-core-v5
  juiceboxonchain2026:
    authors:
      - Juicebox Onchain Reads
    title: Juicebox V5 and V6 on-chain reads, 2026-10-08
    year: 2026
    url: https://etherscan.io/address/0x6017d1fba9dc279bfa0b03fd931c22e242ab3691
  nanacorev62026:
    authors:
      - Nana Core V6
    title: Bananapus nana-core-v6 README and ADMINISTRATION.md (commit 53914d2)
    year: 2026
    url: https://github.com/Bananapus/nana-core-v6
  defillamajuicebox2026:
    authors:
      - DeFiLlama Juicebox
    title: DeFiLlama api.llama.fi/protocol/juicebox-v1, juicebox-v2, juicebox-v3 (read 2026-10-08)
    year: 2026
    url: https://api.llama.fi/protocol/juicebox-v1
  baalcontracts2024:
    authors:
      - Baal Contracts
    title: "HausDAO/Baal: Moloch v3 contracts (commit ee3d5ab)"
    year: 2024
    url: https://github.com/HausDAO/Baal
  hausdaoagents2026:
    authors:
      - HausDAO Agent Repositories
    title: HausDAO/moloch-skills, moloch-agent, daohaus-admin, Baal repositories (GitHub API and READMEs, 2026-10-08)
    year: 2026
    url: https://github.com/HausDAO/moloch-skills
  splitscontracts2026:
    authors:
      - Splits Contracts
    title: "0xSplits/splits-contracts-monorepo: splits-v2, smart-vaults, smart-vault-modules (commit efec4ac)"
    year: 2026
    url: https://github.com/0xSplits/splits-contracts-monorepo
  splitswaterfall2026:
    authors:
      - Splits Waterfall
    title: "0xSplits/splits-waterfall: WaterfallModule and WaterfallModuleFactory"
    year: 2026
    url: https://github.com/0xSplits/splits-waterfall
  splitsdocs2026:
    authors:
      - Splits App Docs
    title: "0xSplits/splits-docs: Splits app documentation (src/pages, commit of 2026-09-24)"
    year: 2026
    url: https://github.com/0xSplits/splits-docs
  regenledger2026:
    authors:
      - Regen Ledger
    title: "regen-network/regen-ledger: x/ecocredit spec and CHANGELOG (commit 493da6d)"
    year: 2026
    url: https://github.com/regen-network/regen-ledger
  regenchain2026:
    authors:
      - Regen Chain Reads
    title: Regen mainnet (regen-1) LCD reads via regen-api.polkachu.com, 2026-10-08
    year: 2026
    url: https://regen-api.polkachu.com/regen/ecocredit/v1/classes
  regengovernance2026:
    authors:
      - Regen Governance Proposals
    title: regen-1 governance proposals 67 to 81 (/cosmos/gov/v1/proposals), 2026-07-30 to 2026-10-02
    year: 2026
    url: https://regen-api.polkachu.com/cosmos/gov/v1/proposals
  regenforum2026:
    authors:
      - Regen Forum
    title: forum.regen.network topics 70, 637, 638 and latest (Discourse JSON), 2024-06-06 to 2026-10-01
    year: 2026
    url: https://forum.regen.network/t/638
  toucancontracts2025:
    authors:
      - Toucan Contracts
    title: "ToucanProtocol/contracts: pools, TCO2, registry (commit 9afe180)"
    year: 2025
    url: https://github.com/ToucanProtocol/contracts
  klimacontracts2025:
    authors:
      - Klima Contracts
    title: "KlimaDAO/klimadao-solidity: protocol, bonds, staking, Infinity diamond (commit of 2025-10-21)"
    year: 2025
    url: https://github.com/KlimaDAO/klimadao-solidity
  defillamaklima2026:
    authors:
      - DeFiLlama Klima and Toucan
    title: DeFiLlama api.llama.fi/protocol/klimadao and /protocol/toucan-protocol; coins.llama.fi prices; Polygon totalSupply reads (2026-10-08)
    year: 2026
    url: https://api.llama.fi/protocol/klimadao
  ballesterosrodriguez2024:
    authors:
      - Alberto Ballesteros-Rodriguez
      - Juan de-Lucio
      - Miguel-Angel Sicilia
    title: "Tokenized carbon credits in voluntary carbon markets: the case of KlimaDAO"
    year: 2024
    publication: Frontiers in Blockchain
    doi: 10.3389/fbloc.2024.1474540
    url: https://doi.org/10.3389/fbloc.2024.1474540
  toucanblog2025:
    authors:
      - Toucan Blog
    title: Toucan Protocol is Going Open Source, and Introducing Cedar (blog.toucan.earth, 2025-05-08)
    year: 2025
    url: https://blog.toucan.earth/toucan-protocol-is-going-open-source-and-introducing-cedar/
  klimarepos2026:
    authors:
      - Klima Protocol Repositories
    title: "KlimaDAO GitHub organisation: relay-fee-skim, Klima-Protocol-x402-MCP-documentation, fair-launch-monorepo (2026-10-08)"
    year: 2026
    url: https://github.com/KlimaDAO/Klima-Protocol-x402-MCP-documentation
  safeallowance2026:
    authors:
      - Safe Allowance Module
    title: "safe-global/safe-modules: AllowanceModule.sol"
    year: 2026
    url: https://github.com/safe-global/safe-modules/blob/main/modules/allowances/contracts/AllowanceModule.sol
  zodiacroles2026:
    authors:
      - Zodiac Roles Modifier
    title: "gnosisguild/zodiac-modifier-roles: packages/evm contracts (commit 820e5bc)"
    year: 2026
    url: https://github.com/gnosisguild/zodiac-modifier-roles
  hatsprotocol2024:
    authors:
      - Hats Contracts
    title: "Hats-Protocol/hats-protocol: Hats.sol and HatsIdUtilities.sol (commit cccb71a) with lastTopHatId reads"
    year: 2024
    url: https://github.com/Hats-Protocol/hats-protocol
---

This note states what the record `2026-10-08-treasury-and-contribution-primitives` carries: eight clusters of deployed treasury, splitting, role and ecological-credit machinery, read from their source repositories, deployed contracts, governance records and dated DeFiLlama reads on 2026-10-08. Every statement below is a row of that record. Where something was looked for and not found, the note says so.

## Drips: streams, splits and dependency graphs

**What it does.** Drips is one contract (`Drips`) that streams ERC-20 tokens between accounts per second and splits received funds onward by weight (Drips Contracts 2026). An account tops up a streams balance and names up to 100 receivers; funds leave per second but become receivable only at global cycle boundaries of `cycleSecs`, an immutable fixed at deployment. Received funds go into a splittable balance. The account's splits configuration, up to 200 receivers with weights out of 1,000,000, forwards each weight's share into the receiver's own splittable balance; the remainder is collectable. Splits are not cycle-gated and are themselves splittable, so a [dependency-splitting](../../../../../../glossary/terms/dependency-splitting.md) graph forms. Anybody can call `split` or `collect` for any account, so no intermediate recipient can hold the flow (Drips Contracts 2026).

Account identity is delegated to drivers numbered in the high 32 bits of the account ID: an Ethereum address, an ERC-721 token, an immutable splits configuration that always gives away 100 percent, a GitHub repository, and sub-account and deadline variants. A repository account has no owner until an oracle-signed payload assigns one (Drips Contracts 2026).

**Keys and upgrade.** Each deployed contract is a `Managed` proxy with an ERC-1967 admin and pausers (Drips Contracts 2026). On Ethereum the admin of Drips is a verified Compound-style Timelock with a 172,800 s delay; on Optimism the admin is a LayerZero-bridged governor owned by that Ethereum timelock (Drips Onchain Reads 2026). Audits listed by the project: Spearbit, a Code4rena contest, Cantina reviews of later drivers, and Certora verification of parts (Drips Docs 2026).

**Scale.** The Ethereum Drips contract has received 4,908 transactions; it holds 251,612 USDC and 23.6 WETH in splittable balances and about 12 USDC in active streams. The Optimism contract has 85 transactions and 14,172 USDC splittable (Drips Onchain Reads 2026). The documentation states no funding-volume figure, and DeFiLlama has no Drips page (Drips Docs 2026, Drips Onchain Reads 2026).

**Wave.** Drips Wave is not a Drips-contract flow. It is a monthly bounty program: issues carry 100, 150 or 200 points, the reward budget is divided by point share, payment is in USDC on Stellar after a seven-day window with KYC required, and the operator keeps discretion to adjust points and withhold rewards. It began with the Stellar ecosystem in 2026-01 (Drips Docs 2026).

**Fails at.** Drips has no primitive that computes a share from work: weights are declarations an account can rewrite at will. The docs name the settlement period monthly on Ethereum while the contract reads 604,800 s (weekly) (Drips Docs 2026, Drips Onchain Reads 2026). Rebasing and fee-on-transfer tokens get stuck (Drips Contracts 2026).

## Juicebox V3 to V6 and Revnet

**What it does.** A Juicebox project is an ERC-721 whose behaviour is a queue of [treasury rulesets](../../../../../../glossary/terms/treasury-ruleset.md): duration, issuance weight and its per-cycle cut, reserved percent, cash-out tax rate, permission flags and an approval hook (Nana Core V5 2025). Payments mint tokens at `amount * weight`, less the reserved percent. Payouts leave up to per-ruleset limits to splits; everything above the limits is surplus and backs cash-outs on the curve `base * ((1 - r) + r * x / t)`; a full-supply cash-out returns all surplus (Nana Core V5 2025). The terminal charges 2.5 percent on payouts, allowance use and cash-outs into project 1, and hooks (721 tiers, buyback, Revnet, Defifa) rewrite pay and cash-out accounting (Nana Core V5 2025).

**Revnet.** A [revnet](../../../../../../glossary/terms/revnet.md) is a Juicebox project owned by `REVDeployer` itself, running staged issuance that falls on a fixed schedule (at least 24 hours between cuts), an operator split, and a cash-out tax; cash-outs cannot be turned off; a 2.5 percent cash-out fee goes to the REV revnet. `REVLoans` burns collateral tokens, lends the cash-out value, charges 2.5 + 2.5 percent plus a borrower-chosen prepaid fee between 2.5 and 50 percent, and after 3,650 days the collateral cannot be recouped (Revnet Core 2025). Projects 1 (fee beneficiary) and 3 (REV) are both owned by the REVDeployer, so the protocol's fee sink is itself an unowned revnet (Juicebox Onchain Reads 2026).

**Keys and versions.** V5 is a V4 fork fixing a buyback-hook bug (Nana Core V5 2025). V6 core and a deployed ecosystem exist (NANA, REV, BAN, CPN, DEFIFA, MARKEE tokens); admin is split across Ownable registries (`JBDirectory`, `JBProjects`, `JBPrices`, `JBFeelessAddresses`), the project NFT owner and `JBPermissions` operators, with append-only price feeds and a hardcoded fee beneficiary (Nana Core V6 2026). The V5 registry owner is the address 0x80a8F7a4bD75b539CE26937016Df607fdC9ABeb5 (Juicebox Onchain Reads 2026).

**Scale.** DeFiLlama lists Juicebox V1 at $13.0 million (all WETH, peak $24.9 million on 2025-08-23), V3 at $169 thousand (peak $3.95 million on 2023-05-29) and V2 at $24.5 thousand, and lists no V4, V5, V6 or Revnet entry (DeFiLlama Juicebox 2026). On chain, V5 has 113, 73, 161 and 86 projects on Ethereum, Optimism, Base and Arbitrum; V6 has 11, 11, 26 and 12. Project 3 (REV) holds 0.0995 ETH in the V6 Base terminal, and REV supply is 57,985 on Base (Juicebox Onchain Reads 2026). No volume or cumulative-raised figure was reachable without an indexer key.

**Fails at.** Weight is a function of payment amount, never of labour. A revnet pays out only what later payers supply, on a schedule its authors fixed. Mistakes in immutable infrastructure require replacement and migration (Nana Core V6 2026).

## Moloch v3 (Baal) and DAOhaus

**What it does.** Baal is a Zodiac module on a Safe: the Safe holds the treasury and Baal executes by module call. Membership is Shares (votes) and Loot (economic weight, no vote) (Baal Contracts 2024). Proposals run Submitted, Voting, Grace, Ready, Processed, in order; sponsorship needs `sponsorThreshold` shares; passing needs yes over no, `quorumPercent` of the shares at sponsorship, and the `minRetentionPercent` guard (Baal Contracts 2024). [Ragequit](../../../../../../glossary/terms/ragequit.md) lets any holder burn shares or loot at any time for `burned / (shares + loot)` of each named token the Safe holds (Baal Contracts 2024). Shamans are contracts with admin, manager or governor bitmask permissions, settable only by the Baal, and three lock functions permanently forbid each class (Baal Contracts 2024).

**Keys.** The Shares token is Ownable and UUPS-upgradeable. The BaalSummoner proxies are owned by a Safe; on Gnosis it is a 1-of-1 Safe (Baal Contracts 2024). Audits in the repository: Hacken (2022) and Quantstamp (2022).

**Scale and state.** The Baal repository was last pushed on 2024-06-11 and the older DAOhaus monorepo is marked deprecated (HausDAO Agent Repositories 2026). HausDAO created agent tooling for Moloch v3 on Base in 2026-05: skills for an agent to summon, propose, sponsor, vote and process, and a CLI where signing stays local (HausDAO Agent Repositories 2026). No DAO count is exposed by the summoners; Blockscout counts 61 transactions for the Gnosis `BaalAndVaultSummoner` and 37 on Optimism (HausDAO Agent Repositories 2026). DeFiLlama has no DAOhaus or Baal entry.

**Fails at.** Shares are minted by proposal, shaman or tribute at whatever ratio the DAO sets; no rule derives them from contribution. Ragequit has no rate limit, so the exit is a run mechanism (Baal Contracts 2024).

## 0xSplits

**What it does.** Splits v2 pairs split wallets with `SplitsWarehouse`, an ERC-6909 ledger. A split is `{recipients, allocations, totalAllocation, distributionIncentive}` stored as a hash; `distribute` is permissionless and pays the distributor up to 6.5 percent; the owner can replace the split (Splits Contracts 2026). Pull splits credit recipients in the warehouse; push splits transfer directly. The warehouse is at 0x8fb66F38cF86A3d5e8768f8F1754A24A6c661Fb8 on every chain listed (Splits Contracts 2026). `WaterfallModule` fills ordered tranches by cumulative threshold and sends the residual to a final address (Splits Waterfall 2026).

**State.** The product has moved: the Splits app is now an onchain operations platform with passkey multisigs, invoicing, bank rails, accounting exports and agent accounts whose threshold sets autonomy; modules can act on an account without signatures regardless of threshold (Splits App Docs 2026). The monorepo adds ERC-4337 smart vaults and auto-earn modules. The splits-pact repository is an unaudited prototype for raising small rounds on a bonding curve in USDC on Base (Splits Waterfall 2026).

**Not found.** Pods and Teams: the monorepo holds splits-v2, smart-vaults and smart-vault-modules only, and no docs page mentions pods (Splits App Docs 2026, Splits Contracts 2026). Vesting exists as a separate repository that was not read.

**Fails at.** Allocations are static until the owner rewrites them.

## Regen Network

**What it does.** Regen Ledger is a Cosmos chain whose `x/ecocredit` module holds credit types (governance-listed units), classes (admin plus approved issuers), projects, batches, baskets and a marketplace, with an `x/data` anchoring module (Regen Ledger 2026). It has 14 classes on 2026-10-08, 188 projects and 80 batches; class creation costs 5,000 REGEN; baskets include `eco.uC.NCT` and `eco.uVSH.WORK` (Regen Chain Reads 2026).

**2026 change.** Regen moved to [proof of authority](../../../../../../glossary/terms/proof-of-authority.md) in governance: max validators 11 (proposal 73), emissions zero (proposal 74, supply fixed near 239.7 million REGEN), validator operating floor of 36,000 REGEN each from the community pool (proposal 78) (Regen Governance Proposals 2026). Proposal 75 added credit type VSH, verified stewardship hour, a registry unit for verified labour that expressly claims no ecological outcome; proposal 77 funds 10,000 REGEN per accepted VSH hour, with 0 hours accepted at drafting (Regen Governance Proposals 2026). Proposals 80 and 81 were rejected below quorum with 0 no votes (Regen Governance Proposals 2026). The forum shows the largest-stake validators declining to vote on them, and records the v7.3.0 upgrade that halted the chain for 91 minutes (Regen Forum 2026, Regen Governance Proposals 2026). Proposals 74, 77, 78, 80 and 81 share one proposer address (Regen Governance Proposals 2026).

**Scale.** 239.8 million REGEN supply, 81.1 million bonded, 11 validators, inflation 0 (Regen Chain Reads 2026).

**Fails at.** Credits attach to projects and issuers, not to the labourers; nothing on chain pays the worker when a credit retires (Regen Ledger 2026). The VSH program has paid no hours.

## Toucan and KlimaDAO

**What it does.** Toucan wraps registry credits as per-vintage TCO2 tokens and pools them into BCT and NCT: any TCO2 passing the pool filter mints pool tokens one-for-one per tonne, and `redeemMany` lets the redeemer name which TCO2s to take out, for a fee (Toucan Contracts 2025). Pool filters and lists are mutable by the owner; the pools are UUPS proxies (Toucan Contracts 2025). The [pooled carbon token](../../../../../../glossary/terms/pooled-carbon-token.md) therefore has one price over credits of differing quality. KlimaDAO sat on top: KLIMA, sKLIMA and wsKLIMA tokens with a staking contract, a treasury, a carbon-retirement bond depository and a retirement diamond that redeems from Toucan and C3 pools and retires credits (Klima Contracts 2025).

**What happened.** KLIMA was $3,155.33 on 2021-10-25, $4.70 on 2022-06-01, $0.99 on 2024-01-01, $0.0709 on 2026-01-01 and $0.00165 on 2026-10-08, with 13.70 million supply: a market capitalisation near $22,600. Staking TVL peaked at $1.106 billion on 2021-10-25 and reads $4,524. BCT fell from $5.69 to $0.103. Toucan TVL peaked at $118.7 million on 2021-12-30 and reads $542 thousand across Polygon, Celo, Base and Regen. BCT supply is 15.68 million tonnes (DeFiLlama Klima and Toucan 2026). The one peer-reviewed study of KlimaDAO finds early engagement followed by market-maturity and retention challenges (Ballesteros-Rodriguez et al. 2024).

**Their own account.** Toucan states that the voluntary market met questionable integrity in major projects and regulatory uncertainty, that it combined the carbon and crypto markets "perhaps too early", and that the protocol is moving to an open-source, community-driven model (Toucan Blog 2025). Klima now describes itself as Klima Protocol on Base, with an HTTP endpoint through which an AI agent retires tokenized credits paying USDC or kVCM, and an immutable 5 percent fee-skim contract on an Aerodrome relay (Klima Protocol Repositories 2026).

**Not found.** Verra's statement on Toucan (the site returned a challenge page), the KlimaDAO treasury's holdings after 2022 (DeFiLlama's treasury endpoint is paid; the on-chain read was rate-limited), and any KlimaDAO governance forum (the host did not resolve).

**Fails at.** The pool token measures tonnes admitted, not outcomes verified. Selective redemption invites adverse selection. KLIMA's price and staking TVL fell by more than five orders of magnitude over the same years the pool token fell by about 98 percent.

## Safe allowance, Zodiac Roles, Hats

**Safe Allowance Module.** A Safe sets a delegate's per-token amount with a reset period in minutes (maximum about 45 days); the delegate executes a signed transfer (Safe Allowance Module 2026). It limits only token amounts.

**Zodiac Roles.** A modifier between modules and the Safe: roles assigned to addresses, scoped to targets, functions and parameter conditions, with allowance budgets `{refill, maxRefill, period, balance}` tracked by key and set only by the owner Safe; audited by G0 Group and Omniscia (Zodiac Roles Modifier 2026). It lets a cooperative give a steward bounded, revocable spending and calling authority without a multisig round; roles are assigned by the owner, never earned by evidence.

**Hats.** Non-transferable ERC-1155 role tokens in trees up to 14 levels deep, with an admin hat at each level, a max supply, an eligibility module and a toggle module queried on every balance read, so a role is revoked by changing module state. The contract has no owner or upgrade path, and a hat can be made immutable (Hats Contracts 2024). Trees ever created: 68 on Ethereum, 314 on Optimism, 1,899 on Base, 1,820 on Gnosis, 93 on Arbitrum, 82 on Polygon (Hats Contracts 2024). DeFiLlama's Hats entries are the unrelated Hats Finance bug-bounty protocol.

## What the cluster does not contain

No surveyed contract computes a member's share from work done; every share rule is a payment rate (Juicebox, Revnet), a declared weight (Drips, Splits), a proposal outcome (Baal) or an issuer's say-so (Regen). The one 2026 attempt at labour-denominated accounting, Regen's VSH, has a credit type and a funded program and no accepted hour on the record read. OpenAlex returned no literature on Juicebox or Drips and none on Moloch v3 in the first five results; Crossref's generic matches for Toucan, Safe modules and Hats were unrelated (searches recorded in the record).
