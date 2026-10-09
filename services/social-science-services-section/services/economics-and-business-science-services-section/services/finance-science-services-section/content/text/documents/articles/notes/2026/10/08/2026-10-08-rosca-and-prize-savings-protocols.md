---
title: "ROSCA and Prize-Savings Protocols: PoolTogether v5"
description: "How PoolTogether v5 converts pooled deposits into daily prizes with time-weighted balances, tiers and a liquidation market for yield; its Base prize pool on 2026-10-08; the shutdown path; and where it differs from a rotating credit association"
date-created: 2026-10-08
aliases:
  - "rosca-and-prize-savings-protocols"
  - "pooltogether-v5-mechanisms"
keywords:
  - pooltogether
  - prize-savings
  - rosca
  - erc-4626
  - twab
  - no-loss-lottery
teaches:
  - "ROSCA and Prize-Savings Protocols: PoolTogether v5"
requires: []
authors:
  - claude-sonnet-5-5
type: text
references:
  ptvault2026:
    authors:
      - PoolTogether Vault Source
    title: "GenerationSoftware/pt-v5-vault: PrizeVault.sol"
    year: 2026
    url: https://github.com/GenerationSoftware/pt-v5-vault
  source2026:
    authors:
      - HaloFi Goodghosting Source
    title: Good-Ghosting/goodghosting-protocol-v1 and -v2 READMEs
    year: 2026
    url: https://github.com/Good-Ghosting/goodghosting-protocol-v2
    note: "source id: goodghostingv1v2_2026"
  ptprizepool2026:
    authors:
      - PoolTogether Prize Pool Source
    title: "GenerationSoftware/pt-v5-prize-pool: PrizePool.sol"
    year: 2026
    url: https://github.com/GenerationSoftware/pt-v5-prize-pool
  ptbasechain2026:
    authors:
      - PoolTogether Base Reads
    title: "PoolTogether v5 Prize Pool on Base: cast reads"
    year: 2026
    url: https://basescan.org/address/0x45b2010d8A4f08b53c9fa7544C51dFd9733732cb
  ptdefillama2026:
    authors:
      - DeFiLlama PoolTogether
    title: "DeFiLlama reads: PoolTogether v3, v4, v5"
    year: 2026
    url: https://api.llama.fi/protocol/pooltogether
  goodghostingsource2026:
    authors:
      - HaloFi Goodghosting Source
    title: Good-Ghosting/goodghosting-protocol-v1 and -v2 READMEs
    year: 2026
    url: https://github.com/Good-Ghosting/goodghosting-protocol-v2
  goodghostinglegacy2026:
    authors:
      - HaloFi Legacy Portal
    title: Good-Ghosting community-legacy-archive-portal and community-legacy-docs
    year: 2026
    url: https://github.com/Good-Ghosting/community-legacy-archive-portal
  chitchainreadme2026:
    authors:
      - ChitChain Readme
    title: Anushlinux/ChitChain README (Aptos Move chit fund)
    year: 2026
    url: https://github.com/Anushlinux/ChitChain
  orbitreadme2026:
    authors:
      - Orbit Readme
    title: ChrisQuint0/Orbit README (Stellar Soroban savings circles)
    year: 2026
    url: https://github.com/ChrisQuint0/Orbit
  impactchainreadme2026:
    authors:
      - Impact Chain Readme
    title: Floyce/DeChama README (Impact Chain, Lightning ROSCA)
    year: 2026
    url: https://github.com/Floyce/DeChama
  tandanimiqreadme2026:
    authors:
      - Tanda Nimiq Readme
    title: ajanaku1/Tanda README (Nimiq Pay savings circles)
    year: 2026
    url: https://github.com/ajanaku1/Tanda
---
A rotating savings and credit association pays the whole pot to one member per round and rotates until everyone has been paid. PoolTogether pays the yield of the pot to one depositor per draw and lets everyone keep their principal. Both turn a stream of small contributions into occasional large payments; one rotates principal, the other rotates yield. v5 is the third generation of the contracts and the only one still carrying most of the value.

## The chain of contracts

A PrizeVault is an ERC-4626 vault whose shares track a time-weighted average balance (TWAB), over an underlying yield vault. Yield above the vault's debt and a fixed buffer is liquidatable: a liquidation pair sells it for the prize token, which is sent to the chain's single Prize Pool ([PoolTogether Vault Source 2026](https://github.com/GenerationSoftware/pt-v5-vault)). Depositors can redeem at any time; the vault owner can set the claimer, the liquidation pair and the yield fee.

The Prize Pool receives prize tokens from vaults and, once a day, a draw manager supplies a random number. Whether a user won is computed, not recorded: isWinner takes the user-specific pseudo-random number derived from draw, vault, user, tier and prize index and compares it with the user's TWAB share of the vault and the vault's share of contributions over the look-back range of that tier. Anyone can then claim the prize for the winner and collect a reward from a reserve ([PoolTogether Prize Pool Source 2026](https://github.com/GenerationSoftware/pt-v5-prize-pool)). The number of tiers adapts to how many prizes were claimed the previous draw, a canary tier signals when to widen, and unclaimed liquidity rolls over. The pool has a shutdown path: if no draw is awarded within the timeout, depositors withdraw proportional shutdown balances. The README warns that only WETH has been audited as the prize token.

## Base on 2026-10-08

The Base Prize Pool at 0x45b2010d8A4f08b53c9fa7544C51dFd9733732cb pays WETH, draws every 86,400 seconds, had awarded draw 841, had 7 tiers and 8.53 WETH of accounted balance; tier shares 100, reserve shares 30, canary shares 4, grand prize period 91 draws. It is not a proxy, so there is no admin key that can replace its logic ([PoolTogether Base Reads 2026](https://basescan.org/address/0x45b2010d8A4f08b53c9fa7544C51dFd9733732cb)). The draw manager is set once by the creator and cannot be changed. DeFiLlama reads 7.85 million USD in the parent across chains and 2.28 million USD in v5, of which Base is 0.41 million in the parent ([DeFiLlama PoolTogether 2026](https://api.llama.fi/protocol/pooltogether)). v3 still reads 4.84 million USD and v4 0.73 million, which are earlier generations. Depositor counts and the cumulative prizes paid on Base were not read.

## What it is, relative to a rotating credit association

It is a lottery over yield, so the expected value to a depositor is the yield of an ordinary account with higher variance; the form is prize-linked savings with the yield source swapped. It has no credit: nobody borrows the pot. It has no membership beyond a deposit, no trust relation, no repayment, and no one to default. It does have two features a rotation pool can reuse: the time-weighted balance as an on-chain, manipulation-resistant measure of who contributed how much for how long, and a permissionless claim that lets any keeper settle the result for a fee.

## Goodghosting and the savings-game family

Goodghosting (now HaloFi, previously GoodGhosting) is the savings-game relative of a rotating pool. Players join in the first segment with a fixed amount; the stake sits in Aave on Ethereum or Moola on Celo; players must deposit before each segment closes; a player who misses one still gets principal back but forfeits interest; the interest is split among players who never missed ([HaloFi Goodghosting Source 2026](https://github.com/Good-Ghosting/goodghosting-protocol-v2)). Version 2 allows a long waiting round and flexible per-player amounts and weights interest by time and amount. It is a rotation of yield by discipline: drop-outs fund the finishers. The organisation has since wound the products down: the legacy portal says it provides guidance for users to withdraw funds, with the legacy site online until 2029-09-20, and the old goodghosting.com host answered with a mismatched certificate on 2026-10-08 ([HaloFi Legacy Portal 2026](https://github.com/Good-Ghosting/community-legacy-archive-portal)). The docs list Dedaub (2022-06) and Quantstamp audits and state that no insurance covers unknown bugs. Players and value saved were not found.

## Rotating pools in code

No widely adopted, audited rotating savings contract was found. The repositories that exist are small: ChitChain on Aptos is an auction chit fund where members deposit full collateral, then bid a discount for each month's pot and the discount is split among the other members as dividend, under a fee below 1 percent ([ChitChain Readme 2026](https://github.com/Anushlinux/ChitChain)). That is the priced rotating credit association in its simplest form: the price of early access is bid, and the bid is the members' return. Orbit on Stellar rotates a fixed contribution by predetermined or random order ([Orbit Readme 2026](https://github.com/ChrisQuint0/Orbit)); Impact Chain runs a Lightning chama with majority votes on membership, loans and withdrawals ([Impact Chain Readme 2026](https://github.com/Floyce/DeChama)); Tanda on Nimiq holds no money at all and rebuilds the pot from memo-tagged transactions between members' wallets ([Tanda Nimiq Readme 2026](https://github.com/ajanaku1/Tanda)). Celo and MiniPay circle projects appeared in listings only and their contracts were not read; TandaPay returned nothing by name. None of these shows deployed use.
