---
title: "On-Chain Mutuals and Insurance: Nexus Mutual"
description: "How Nexus Mutual pools risk on Ethereum: capital pool, minimum capital requirement, the RAMM that prices NXM, staking pools, the claims committee and governor, scale on 2026-10-08, and the state of the other on-chain insurance protocols"
date-created: 2026-10-08
aliases:
  - "on-chain-mutuals-and-insurance"
  - "nexus-mutual-mechanisms"
keywords:
  - nexus-mutual
  - insurance
  - mutual
  - risk-pooling
  - ramm
  - claims-assessment
teaches:
  - "On-Chain Mutuals and Insurance: Nexus Mutual"
requires: []
authors:
  - claude-sonnet-5-5
type: text
references:
  nexusdocs2026:
    authors:
      - Nexus Mutual Docs
    title: "docs.nexusmutual.io: overview, claim assessment"
    year: 2026
    url: https://docs.nexusmutual.io/protocol/claims-assessment
  nexuschain2026:
    authors:
      - Nexus Mutual Chain Reads
    title: "Nexus Mutual on Ethereum: NXMaster lookups and capital reads (block 26149894)"
    year: 2026
    url: https://etherscan.io/address/0x01BFd82675DBCc7762C84019cA518e701C0cD07e
  nexusdefillama2026:
    authors:
      - DeFiLlama Insurance
    title: "DeFiLlama reads: Nexus Mutual and other on-chain insurance listings"
    year: 2026
    url: https://api.llama.fi/protocols
  nexussource2026:
    authors:
      - Nexus Mutual Contracts
    title: "NexusMutual/smart-contracts: Pool, Ramm, Cover, Assessments, Claims, Governor, Registry"
    year: 2026
    url: https://github.com/NexusMutual/smart-contracts
  arboldocs2026:
    authors:
      - Arbol
    title: arbol.io home page
    year: 2026
    url: https://www.arbol.io
---
Nexus Mutual is the one on-chain insurance protocol that has survived at scale, and it is a mutual: members hold a token, pool capital, buy cover from the pool and decide claims by their own process. It is the nearest working relative of a Tidepool risk pool, so the question is which parts are mechanism and which are discretion.

## Structure

The DAO "operates as a discretionary mutual" with a Foundation that is a community interest company ([Nexus Mutual Docs 2026](https://docs.nexusmutual.io/protocol/claims-assessment)). Discretion is the legal point: a cover is not an insurance contract that a court enforces against the pool; it is a right to ask the mutual's decision process to pay. The on-chain system implements that process.

## Capital and price

The Pool contract holds the capital; on 2026-10-08 Pool.getPoolValueInEth reads 43,328.22 ETH against a minimum capital requirement of 5,998.72 ETH, a ratio of 7.22 ([Nexus Mutual Chain Reads 2026](https://etherscan.io/address/0x01BFd82675DBCc7762C84019cA518e701C0cD07e)). NXM supply is 1,656,990 and book value 0.02615 ETH per NXM; the two spot prices of the RAMM sit at 0.02649 and 0.02568 ETH. DeFiLlama reads 108.7 million USD of value, all on Ethereum ([DeFiLlama Insurance 2026](https://api.llama.fi/protocols)).

NXM is priced by the Ramm contract, a ratcheting AMM with two virtual pools: a liquidity speed of 1,500 ether a day when fast, a target liquidity of 5,000 ether, and a ratchet that moves the price toward book value at 400 basis points of the gap a day normally and 5,000 when fast, with circuit breakers on both directions of flow ([Nexus Mutual Contracts 2026](https://github.com/NexusMutual/smart-contracts)). The practical result is that the token trades near the pool's book value per token rather than at a speculative price, so a member who leaves is paid roughly their share of capital, and a member who joins buys in at roughly that share. That is the same relationship that an exit-at-net-asset-value pool needs between share price and capital.

The registry reads at the master contract returned a Pool, Cover, Assessment, Ramm and Governance module and the zero address for the Claims slot ([Nexus Mutual Chain Reads 2026](https://etherscan.io/address/0x01BFd82675DBCc7762C84019cA518e701C0cD07e)). The repository head contains a new Claims contract and a new Governor and Registry; whether those are the deployed ones was not established from the chain read.

## Underwriting by staking

Risk selection is not done by the pool. Stakers back individual products by depositing NXM into staking pools (beacon proxies, one per pool, with a StakingNFT per deposit), and cover purchases are routed to pools by their allocation ([Nexus Mutual Contracts 2026](https://github.com/NexusMutual/smart-contracts)). Stakers earn premiums and lose staked NXM if a claim pays out against their allocation. Underwriting is thus decentralised to people with money at risk, and the shared pool pays the claim.

## Claims: from a market to a committee

Claims have had three regimes. In the first regime, ending 2023-03, any member could stake NXM to assess, with a 70 percent threshold; until 2025-11 a stake-weighted majority decided; since then a three-person Claims Committee decides with a 72-hour window, 2 of 3 acceptance, a 0.05 ETH claim deposit and a 24-hour cool-down in which the Advisory Board can reverse fraudulent votes and replace assessors ([Nexus Mutual Docs 2026](https://docs.nexusmutual.io/protocol/claims-assessment)). The docs state no payout limit. The direction of travel is from many token-weighted assessors toward a small named panel with an override, which is the opposite of what an on-chain design would predict, and it is documented in the protocol's own words.

## Governance

The Governor in the current repository head gives each member a vote weight of their token balance plus one token, capped at 5 percent of supply, requires 15 percent of supply to vote, locks voters' tokens through the vote, and has a one-day timelock after a three-day vote, with an advisory board threshold of 3 ([Nexus Mutual Contracts 2026](https://github.com/NexusMutual/smart-contracts)). The weight floor of one token for every member, with a cap, is a deliberate dilution of whale power.

## The other on-chain insurers

On the same listing day Unslashed had 3.74 million USD, Sherlock 0.23 million, InsurAce 0.15 million and Risk Harbor 0.015 million, and Neptune Mutual showed zero ([DeFiLlama Insurance 2026](https://api.llama.fi/protocols)). Nexus holds about 96 percent of the category's listed value. Arbol is a parametric climate insurer rather than a mutual, stating over 2 billion USD of notional risk transferred and payouts triggered by third-party data ([Arbol 2026](https://www.arbol.io)); its premium volume and on-chain role were not on the page. Etherisc returned HTTP 403 and nothing was read; Sherlock, InsurAce, Unslashed and Risk Harbor were seen only as dashboard rows.

## What it does not do

Nexus Mutual does not insure persons against income loss or lend to its members; its cover is for smart-contract failure, custody and a set of other digital-asset risks, and the pool is a pure capital reserve with no members' credit relation. Its legal wrapper is discretion, so a claimant has no enforceable right. Total claims paid, the membership fee and KYC terms were looked for in the docs pages and were not on them.
