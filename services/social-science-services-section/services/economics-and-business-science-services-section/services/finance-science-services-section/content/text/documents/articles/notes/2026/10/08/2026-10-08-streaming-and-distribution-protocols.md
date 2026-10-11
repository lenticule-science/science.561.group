---
title: "Streaming and Distribution Protocols: Superfluid and Sablier"
description: "Mechanism-level reading of Superfluid CFA and GDA pools, Flow Councils and Sablier Lockup and Flow: how balances are computed, who holds the keys, scale on 2026-10-08, the 2022 exploit, and what each does not do"
date-created: 2026-10-08
aliases:
  - "streaming-and-distribution-protocols"
  - "superfluid-sablier-mechanisms"
keywords:
  - superfluid
  - sablier
  - streaming
  - distribution-pools
  - flow-council
  - mutual-credit
teaches:
  - "Streaming and Distribution Protocols: Superfluid and Sablier"
requires: []
authors:
  - claude-sonnet-5-5
type: text
references:
  superfluidsource2026:
    authors:
      - Superfluid Protocol Source
    title: "Superfluid protocol-monorepo: ConstantFlowAgreementV1, GDA, SuperfluidPool (ethereum-contracts v1.15.3)"
    year: 2026
    url: https://github.com/superfluid-finance/protocol-monorepo
  flowcouncilsource2026:
    authors:
      - Flow Council Source
    title: "flow-state-coop/flow-council: FlowCouncil.sol and FlowCouncilFactory.sol"
    year: 2026
    url: https://github.com/flow-state-coop/flow-council
  superfluidchain2026:
    authors:
      - Superfluid Base Reads
    title: "Superfluid governance on Base: host.getGovernance() and its owner"
    year: 2026
    url: https://basescan.org/address/0x4C073B3baB6d8826b8C5b229f3cfdC1eC6E47E74
  superfluidgovernance2026:
    authors:
      - Superfluid Forum
    title: Superfluid DAO governance and tokenomics (forum thread 69) and docs governance page
    year: 2026
    url: https://forum.superfluid.org/t/superfluid-dao-governance-and-tokenomics/69
  superfluiddefillama2026:
    authors:
      - DeFiLlama Superfluid
    title: "DeFiLlama protocol read: Superfluid"
    year: 2026
    url: https://api.llama.fi/protocol/superfluid
  superfluidsubgraph2026:
    authors:
      - Superfluid Subgraph
    title: Superfluid protocol-v1 subgraph, base-mainnet and other chains
    year: 2026
    url: https://subgraph-endpoints.superfluid.dev/base-mainnet/protocol-v1
  superfluidexploit2022:
    authors:
      - Halborn Superfluid Hack
    title: "Halborn: Explained, the Superfluid hack (February 2022)"
    year: 2022
    url: https://halborn.com/explained-the-superfluid-hack-february-2022/
  sabliersource2026:
    authors:
      - Sablier Source
    title: "sablier-labs monorepo: lockup and flow packages"
    year: 2026
    url: https://github.com/sablier-labs/lockup
  sablierchain2026:
    authors:
      - Sablier Base Reads
    title: "Sablier Lockup v4.0 and Flow v3.0 on Base: cast reads"
    year: 2026
    url: https://docs.sablier.com/guides/lockup/deployments
  sablierdefillama2026:
    authors:
      - DeFiLlama Sablier
    title: "DeFiLlama protocol read: Sablier (parent, lockup, flow)"
    year: 2026
    url: https://api.llama.fi/protocol/sablier
---
Two protocols turn money-over-time into a first-class contract object: Superfluid, where a stream is a rate stored per sender and receiver pair and balances are computed from the clock, and Sablier, where a stream is an NFT with a deposit behind it. Tidepool's priced rotating credit association and member credit lines both need a way to say "this member owes or is owed X per day" without a transaction per day, so the mechanics matter more than the marketing.

## Superfluid: balance is a function of time

The agreement stores one record per account, {timestamp, flowRate, deposit, owedDeposit}, and a balance is the stored amount plus (time minus timestamp) times flowRate, which means nothing is written between the opening and closing of a flow ([Superfluid Protocol Source 2026](https://github.com/superfluid-finance/protocol-monorepo)). A flow is keyed by the ordered pair (sender, receiver), so a pair has exactly one flow and a rate change is an update, not a new object.

The price of that design is a deposit. Each flow locks flowRate times the governance-set liquidation period of the sender's Super Token balance, and a sender who falls below the buffer can be closed by anyone, patrician period first ([Superfluid Protocol Source 2026](https://github.com/superfluid-finance/protocol-monorepo)). Streams therefore need over-collateralisation in the stream token itself, which is why Super Tokens (ERC-20 wrappers, or pure Super Tokens such as SUP) are the unit rather than arbitrary ERC-20s.

The general distribution agreement (GDA) adds pools. A pool has an admin and integer member units; the admin changing units is a mint or burn in the ERC-20 view; a distributor either sends a lump or sets a flow into the pool, and each member earns rate times units over total units, claimable if unconnected and streamed if connected ([Superfluid Protocol Source 2026](https://github.com/superfluid-finance/protocol-monorepo)). One transaction therefore serves any number of members, and the units are the vote or share ledger. That is the shape of a pro-rata yield router.

Flow Councils are the governance use of that ledger. The FlowCouncil contract keeps voters with a voting power and recipients, lets voters spread power over recipients under a maximum spread, and makes the recipient's pool units the vote total, so the stream re-splits when votes change ([Flow Council Source 2026](https://github.com/flow-state-coop/flow-council)). The voter set is chosen by an admin role; there is no on-chain proof of membership or personhood in the contract, and the factory is deployed on Optimism, Base, Arbitrum One and Celo.

## Keys, audits, governance

On Base the host's governance contract is owned by a Safe with threshold 2 of 4 owners ([Superfluid Base Reads 2026](https://basescan.org/address/0x4C073B3baB6d8826b8C5b229f3cfdC1eC6E47E74)). The DAO around it has a 1 billion SUP supply, a Cayman Foundation, a three-person Security Council elected every six months, and proposals that pass at a 5 percent (constitutional) or 3 percent (non-constitutional) participation threshold after a 14 to 16 day vote ([Superfluid Forum 2026](https://forum.superfluid.org/t/superfluid-dao-governance-and-tokenomics/69)). The repo carries audits from PeckShield, Halborn, Trail of Bits, and two in 2026 (a collaborative audit in January and a public audit contest in May), and an Immunefi bounty of 30,000 to 200,000 USD for critical findings ([Superfluid Protocol Source 2026](https://github.com/superfluid-finance/protocol-monorepo)).

## Scale on 2026-10-08

DeFiLlama reads total liquidity of 5.59 million USD, of which Optimism holds 1.57 million, Ethereum 1.30 million, Base 1.25 million and Polygon 1.06 million ([DeFiLlama Superfluid 2026](https://api.llama.fi/protocol/superfluid)). The subgraph shows what the streams are for: on Base the largest active-stream counts are SUP (30,952 streams, 113,706 accounts), BORING (30,025) and DEGENx (3,330), and the largest SUP distribution pools have 32,999, 20,957 and 19,641 members ([Superfluid Subgraph 2026](https://subgraph-endpoints.superfluid.dev/base-mainnet/protocol-v1)). Dominant use is programmatic reward distribution to wallets, not payroll. Cumulative dollars streamed was not available from any first-party surface read.

## Where it failed

An attacker on 2022-02-08 passed a forged context object through callAgreement; the agreement kept the first of two serialised contexts and the hash check was skipped for host-supplied calldata, letting the attacker act as other accounts. Halborn reports 13 million USD lost ([Halborn Superfluid Hack 2022](https://halborn.com/explained-the-superfluid-hack-february-2022/)). Superfluid's own post-mortem was not read; only the auditor's account was. The lesson for a Tidepool contract is that a trusted caller is not a reason to skip validation of what it relays.

## Sablier: the deposit is the guarantee

Lockup creates an NFT stream with the whole amount deposited, in linear, dynamic, tranched or price-gated shapes, with per-stream flags for cancelable and transferable; Flow is the open-ended variant where balance, ratePerSecond and a scaled debt snapshot give a stream that can run in debt when the sender stops topping up, reported by uncoveredDebtOf ([Sablier Source 2026](https://github.com/sablier-labs/lockup)). Lockup is the vesting primitive (the receiver owns an NFT that can be sold unless the stream is flagged non-transferable); Flow is the payroll primitive (the receiver is paid for what has accrued, and the risk is borne by the receiver).

On Base the Lockup v4.0 contract has created 1,226 streams and Flow v3.0 four; both read their comptroller's admin as a 2-of-4 Safe, and neither is behind a proxy ([Sablier Base Reads 2026](https://docs.sablier.com/guides/lockup/deployments)). The repository states that it is no longer maintained and accepts no pull requests, changed from BUSL to GPL on 2026-07-13, and the project runs no bug bounty ([Sablier Source 2026](https://github.com/sablier-labs/lockup)). DeFiLlama reads 3.56 million USD of TVL, mostly on Ethereum ([DeFiLlama Sablier 2026](https://api.llama.fi/protocol/sablier)). A volume statistic was looked for in docs and repo and not found.

## What neither does

Neither has a credit concept: a stream is funded from the sender's own balance. Superfluid's buffer is a collateral rule, Sablier Flow lets the receiver absorb debt, and neither prices that risk or lets a pool of members share it. Neither has membership: any address can open a stream. Both are payment rails that a credit or yield-routing pool could sit on, with the pool contract as admin of a GDA pool whose units are member shares.
