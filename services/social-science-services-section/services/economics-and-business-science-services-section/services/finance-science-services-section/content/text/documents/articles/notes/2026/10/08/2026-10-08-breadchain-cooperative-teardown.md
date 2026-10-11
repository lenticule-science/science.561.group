---
title: "Breadchain Cooperative: A Contract-Level Teardown"
description: "What Breadchain (now Bread Cooperative) has deployed, how its contracts compute and move yield, who holds the keys, how much money passes through it, and what it does not do, read from source, chain, and its own documents on 2026-10-08"
date-created: 2026-10-08
aliases:
  - "Bread Cooperative teardown"
  - "BREAD token and Solidarity Fund"
keywords:
  - breadchain
  - crowdstaking
  - yield-donation
  - gnosis-chain
  - savings-circles
  - mutual-aid
teaches:
  - "Breadchain Cooperative"
requires: [crowdstaking, rotating-savings-and-credit-association, stablecoin]
authors:
  - claude-sonnet-5-5
type: text
references:
  breadchainrepositories2026:
    authors:
      - BreadchainCoop
    title: "GitHub organisation BreadchainCoop: 51 repositories as listed by repository search"
    year: 2026
    url: https://github.com/BreadchainCoop
  breadchaindocs2026:
    authors:
      - Breadchain Docs
    title: docs.bread.coop source (BreadchainCoop/bread-docs, commit 2026-09-22)
    year: 2026
    url: https://docs.bread.coop
  breadchainstacksource2026:
    authors:
      - Breadchain Stacks Source
    title: "BreadchainCoop/saving-circles: SavingCircles, GoalSavingCircles, AutomaticSavingCircles (commit 2026-10-05, release v1.1.0)"
    year: 2026
    url: https://github.com/BreadchainCoop/saving-circles
  breadchainsafetynetsource2026:
    authors:
      - Breadchain Safety Net Source
    title: "BreadchainCoop/safety-net: SafetyNet, DelegatedSafetyNet, DEPLOYMENTS.md (commit 2026-07-07)"
    year: 2026
    url: https://github.com/BreadchainCoop/safety-net
  crowdstakesource2026:
    authors:
      - Crowdstake Source
    title: BreadchainCoop/crowdstake.fun and O.U.R.COOP fork (commit 2026-07-12)
    year: 2026
    url: https://github.com/BreadchainCoop/crowdstake.fun
  coopstablesource2026:
    authors:
      - Coopstable Source
    title: "BreadchainCoop/coopstable-contracts: Soroban contracts and mainnet.contracts.json (commit 2026-04-07)"
    year: 2026
    url: https://github.com/BreadchainCoop/coopstable-contracts
  breadchaintokensource2026:
    authors:
      - Breadchain Token Source
    title: "BreadchainCoop/bread: Bread.sol, EIP173Proxy, KebabSec review (commit 2026-08-13)"
    year: 2026
    url: https://github.com/BreadchainCoop/bread
  breadgnosischainstate2026:
    authors:
      - Bread Gnosis Chain State
    title: eth_call reads of the BREAD token, YieldDistributor, ButteredBread, Safe and sDAI contracts on Gnosis Chain at block 48656674 (2026-10-08 19:21 UTC)
    year: 2026
    url: https://gnosis.blockscout.com/address/0xa555d5344f6fb6c65da19e403cb4c1ec4a1a5ee3
  llamabreadchain2026:
    authors:
      - DeFiLlama Breadchain
    title: DeFiLlama protocol record for Breadchain (api.llama.fi/protocol/breadchain)
    year: 2026
    url: https://defillama.com/protocol/breadchain
  breadclaimedyieldlog2026:
    authors:
      - Breadchain Claimed Yield Log
    title: ClaimedYield event log of the BREAD token from Gnosis Blockscout (26 events)
    year: 2026
    url: https://gnosis.blockscout.com/address/0xa555d5344f6fb6c65da19e403cb4c1ec4a1a5ee3?tab=logs
  breadchainfundsource2026:
    authors:
      - Breadchain Fund Source
    title: "BreadchainCoop/solidarity-fund: YieldDistributor, ButteredBread, VotingMultipliers (commit 2026-03-13)"
    year: 2026
    url: https://github.com/BreadchainCoop/solidarity-fund
  stellarexpertcoopstable2026:
    authors:
      - Stellar Expert
    title: Stellar Expert asset record for Coopstable cUSD
    year: 2026
    url: https://api.stellar.expert/explorer/public/asset/CA7JSNCTAGTVXJJX65YIN53XAXK72NZPD5Q62YUQXV7R7V45ELKONCJ5
  breadchainbuilderssource2025:
    authors:
      - Breadchain Builders Source
    title: "BreadchainCoop/builders-dollar: BuilderManager and schema validators (last push 2025-06-23)"
    year: 2025
    url: https://github.com/BreadchainCoop/builders-dollar
  breadchainknowledgebase2026:
    authors:
      - Breadchain Knowledge Base
    title: BreadchainCoop/public-kb pages (commit 2026-09-15)
    year: 2026
    url: https://github.com/BreadchainCoop/public-kb
  curacaoonramp2026:
    authors:
      - Bread Cooperative DAO LLC
    title: BreadchainCoop/curacao-crypto-onramp-bot README
    year: 2026
    url: https://github.com/BreadchainCoop/curacao-crypto-onramp-bot
---

Breadchain Cooperative, now styled Bread Cooperative, is the nearest deployed relative of a cooperative yield-routing protocol. This note states what its source, its deployed contracts, and its own documents establish. Every figure was read on 2026-10-08 unless dated otherwise.

## What exists

The organisation publishes 51 repositories under BreadchainCoop (BreadchainCoop 2026). The products that hold or route money are four.

- **Solidarity Fund**: the BREAD token plus a monthly yield-vote distributor, on Gnosis Chain. Its documentation calls the mechanism baking (mint) and burning (redeem) (Breadchain Docs 2026).
- **Stacks**: savings circles, a rotating savings and credit association on an ERC20, on Gnosis and Celo (Breadchain Stacks Source 2026).
- **Safety Net**: a Broodfonds-style mutual on Gnosis, deployed 2026-07-04 (Breadchain Safety Net Source 2026).
- **Crowdstake**: the Solidarity Fund generalised into a factory so that any group can run its own yield-vote pool (Crowdstake Source 2026). CoopStable is a separate Stellar implementation (Coopstable Source 2026).

The cooperative says it earns by contract development work for aligned organisations; no protocol fee exists in the BREAD contract (Breadchain Token Source 2026, Breadchain Docs 2026).

## How BREAD and its yield work

BREAD is minted one-to-one for xDAI, which the contract wraps and deposits in the Gnosis sDAI vault; burning withdraws exactly the burned amount from sDAI and returns native xDAI, with no fee and no delay (Breadchain Token Source 2026). Yield is sDAI asset value minus BREAD supply. A claimYield call by the owner or the designated claimer mints that surplus as new BREAD to a recipient (Breadchain Token Source 2026). The claimer is the YieldDistributor.

As of 2026-10-08 (Gnosis block 48656674) total supply was 392,011.84 BREAD, accrued unclaimed yield was 1,755.87 BREAD, and Blockscout counted 672 holders (Bread Gnosis Chain State 2026). DeFiLlama records the same pool as $393,337 of TVL; it started at $258,434 on 2024-04-15, peaked at $565,968 on 2025-05-25, and has fallen since (DeFiLlama Breadchain 2026). Over the last 518,400 blocks sDAI returned 0.3724%, 4.53% annualised (Bread Gnosis Chain State 2026). At that rate the whole pool yields about $17,800 a year.

The event log of the token shows the money that actually moved. Twenty-five yield claims between 2024-07-01 and 2026-09-01 total 64,180.45 BREAD. The first was 7,764.6 BREAD; the latest, on 2026-09-01, was 1,427.8 BREAD (Breadchain Claimed Yield Log 2026). Distribution timing has drifted from the first of the month to dates between the 6th and the 27th for most of 2025 and early 2026.

## The distribution and voting math

The YieldDistributor proxy holds the cycle parameters: cycleLength 518,400 blocks (30 days at 5 seconds), maxPoints 10,000, yieldFixedSplitDivisor 2, voting cycle 26 (Bread Gnosis Chain State 2026). At each distribution it claims all accrued yield, keeps `balance / divisor` aside and splits it equally among the projects, and divides the remainder by vote weight (Breadchain Fund Source 2026). With the divisor at 2, half of every distribution is equal and half is voted.

Voting power for a cycle is the integral of a holder's BREAD balance (plus ButteredBread, below) over the previous cycle's blocks. A holder who bakes today has no vote until the next cycle (Breadchain Fund Source 2026). The contract returns the raw balance-times-blocks sum; the documentation describes the average, which differs by a constant factor within a cycle (Breadchain Docs 2026). A voter spreads integer points across projects; the voter's power is divided in proportion to the points (Breadchain Fund Source 2026). A streak multiplier raises a voter's power for each consecutive cycle voted, up to a cap, and lapses after two silent cycles (Breadchain Fund Source 2026).

In the live cycle, 15 voters carried 1.9016e28 weight over eight projects, and the largest project held 25.5% of it (Bread Gnosis Chain State 2026). On the last distribution that makes the equal half about 89 BREAD per project and the voted half 714 BREAD in total, so the project the vote favoured most received about 271 BREAD.

Anyone may trigger the distribution once the cycle has elapsed and enough yield exists (Breadchain Fund Source 2026). As of 2026-10-08 the resolver returned true 627,057 blocks after the previous distribution, about 6 days past eligibility, and no distribution had run (Bread Gnosis Chain State 2026). The distribution therefore rests on an outside keeper (PowerPool or the Gas Killer AVS are the integrations in the source).

## ButteredBread: LP votes

Liquidity providers cannot vote through LP tokens, so ButteredBread is a non-transferable vote token minted when a holder deposits an allowlisted LP token, at deposit times scalingFactor over 100 (Breadchain Fund Source 2026). One LP is allowlisted, the Curve BREAD/WXDAI pool, at factor 32, so one LP token earns 0.32 votes. ButteredBread supply is 558.58, 0.14% of BREAD supply (Bread Gnosis Chain State 2026). The owner can change factors and the allowlist.

## Who holds the keys

- The BREAD proxy owner, the YieldDistributor's ProxyAdmin, and the distributor's owner all resolve to one Safe, 0x918dEf5d593F46735f74F9E2B280Fe51AF3A99ad, with 12 owners and a threshold of 5, and no timelock (Bread Gnosis Chain State 2026).
- That Safe alone can upgrade the token and the distributor, change the recipient list, the cycle length, the split, the point cap, and the claimer (Breadchain Fund Source 2026). Recipients are not chosen by BREAD holders: only the owner queues project additions and removals.
- ButteredBread is owned by one externally owned account, which is also a signer of the Safe (Bread Gnosis Chain State 2026).
- Safety Net's ProxyAdmin is owned by an externally owned account, so one key can upgrade the mutual that holds members' dues (Breadchain Safety Net Source 2026).
- Admission of a project to the recipient network needs a unanimous vote of existing projects; removal a majority after a cure month (Breadchain Docs 2026).

## Audits

The only audit artefact in the repositories is a pro bono review of Bread.sol by two KebabSec members, with three findings (two informational, one low: claimYield clears the delegate of the yield recipient) (Breadchain Token Source 2026). No audit report was found for the YieldDistributor, ButteredBread, Stacks, or Safety Net, though the Stacks app's agent guide calls its contracts audited (Breadchain Stacks Source 2026). DeFiLlama shows zero audits (DeFiLlama Breadchain 2026).

## Stacks, Safety Net, and the others

**Stacks** is a plain rotating savings association: 2 to 25 members, a fixed deposit each interval, the whole pot to one member per round in join order. It has no interest, no auction, no collateral and no credit. If a round's deposits are incomplete, the circle can be decommissioned and unclaimed members get their deposits back; a member who has already taken the pot keeps it (Breadchain Stacks Source 2026). The release of 2026-10-05 added goal-saving circles (a locked group fund with a target and deadline). The documentation says plainly "no bank, no lender, and no interest" (Breadchain Docs 2026).

**Safety Net** is a mutual-aid fund after the Dutch Broodfonds: a member's monthly deposit is credited to the pool and a withdrawable balance of deposit times a ratio up to 25. The effective ratio is throttled by an actuarial cap and a six-month runway cap; requests can be contested; a shortfall is settled pro rata (Breadchain Safety Net Source 2026). As of 2026-10-08 the current stack had created eight nets and two requests (Breadchain Safety Net Source 2026).

**Crowdstake** shows what Bread thinks the reusable core is: any ERC-4626 vault as the yield source, a cycle module, a voting module, a recipient registry, a distribution strategy, and keeper automation (Crowdstake Source 2026). Its time-weighted power averages over the current cycle, not the previous. O.U.R.COOP, an artists' cooperative, forked it with one-person-100-points voting (Crowdstake Source 2026).

**CoopStable** on Stellar sends 10% of yield to a treasury and 90% equally to members every day, with no vote (Coopstable Source 2026). Its cUSD supply on 2026-10-08 is 15.25 units with 7 trustlines (Stellar Expert 2026).

**Builders Dollar** is an Optimism-oriented BuilderManager that gates recipients by Foundation attestations and member vouches; its repository was last pushed on 2025-06-23 and no deployment was found (Breadchain Builders Source 2025).

## Membership, legal form, and money

The docs list seven member projects (annex), the knowledge base sixteen, and the chain eight recipient addresses (Breadchain Docs 2026, Breadchain Knowledge Base 2026, Bread Gnosis Chain State 2026). The legal form of the cooperative is stated nowhere in its documents. The only entity name is "Bread Cooperative DAO LLC" in one repository README, with no jurisdiction (Bread Cooperative DAO LLC 2026). The records of this search found no registry entry and no Open Collective host.

## What Breadchain does not do

- It does not lend. No member can borrow against anything; Stacks has no credit and no interest, and Safety Net pays only on the mutual's own pool.
- It does not diversify. One asset (xDAI), one vault (sDAI), one chain for the money, with no loss-sharing rule if the vault ever returns less than supply.
- It does not give holders a say over membership or over the rules; a 5-of-12 Safe controls both with no delay.
- It does not price risk beyond the Safety Net throttle; Stacks charges nothing for going first.
- It does not index to energy, or to anything except a dollar savings rate; there is no demurrage, no clearing, no obligation netting.
- It does not use identity or sybil resistance; votes follow balance and time, so a few large holders decide the voted half.
- It does not earn from its protocol; its yield pool is $17,800 a year, and the equal half is about $89 per project per month.
- It does not run its own distribution trigger; a keeper does, and on 2026-10-08 it was late.
- It has no audit beyond a pro bono review of the token, and no admin timelock.
- It does not state its legal form.

## What the cycle shows

The pool shrank from a peak of $566,000 to $393,000 in sixteen months, and monthly claims fell from 2,743.2 BREAD (2026-01-07) to 1,427.8 BREAD (2026-09-01) (Breadchain Claimed Yield Log 2026, DeFiLlama Breadchain 2026). The mechanism is lossless for depositors and small for recipients; it is a donation rail whose size is capped by deposits times a savings rate.
