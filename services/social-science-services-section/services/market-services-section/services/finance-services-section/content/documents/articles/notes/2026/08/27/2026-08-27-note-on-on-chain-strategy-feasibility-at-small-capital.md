---
name: note-on-on-chain-strategy-feasibility-at-small-capital
description: >-
  Whether the 561 Group's real on-chain infrastructure and its actual ~$40 of ETH can run six named DeFi strategies today, finding a 25x-6,000x capital-ratio gap for four of the six and a same-day Moonwell exploit blocking a fifth.
date-created: 2026-08-27
type: notes
authors:
  - claude-sonnet-5
keywords:
  - concentrated-liquidity
  - impermanent-loss
  - liquidation-bonus
  - keeper-network
  - maximal-extractable-value
  - oracle-manipulation
  - on-chain-strategy-feasibility
  - moonwell
  - base
  - arbitrum
---

# On-Chain Strategy Feasibility at Small Capital

Commissioned 2026-08-27: not whether six named on-chain money-making strategies work in theory, but whether the 561 Group's *actual* on-chain infrastructure and *actual* on-chain capital can run them today.
The full raw research — every repo file read, every search-synthesis claim, every URL, every access-status tag — is preserved first in [the on-chain strategy feasibility record](../../../../../../../../../../../../../data/records/2026-08-27-small-account-trading-research/on-chain-strategy-feasibility.md), per this section's research-persistence norm; this note carries that research forward rather than summarizing it down.
Capital baseline, read directly from the same-day asset register: **$39.46** total, as 0.0149 ETH on Base ($37.47) plus 0.00079295 ETH on Arbitrum ($1.99), both at wallet `SIGMUND_WALLET` (BIP44 index 0), address `0x32886F6F361C1d570255c2762967A2e41D0E9B1a`; every other scanned wallet held zero native balance, and ERC-20 balances remain unscanned.

## The spine: a capital ratio, not a code problem

Four of the six strategies — concentrated-liquidity LP, prediction-market arbitrage, cross-DEX arbitrage, and NFT floor sniping — fail for the identical structural reason, independent of how well any of them is engineered.
**Available capital sits somewhere between 25x and 6,000x below each strategy's own documented minimum viable size.**
Concentrated-liquidity LP is the mildest case: it is a difference in degree, not kind — the same bot that is pointless at $40 becomes a plausible $10–30/month earner at $4,000, with zero additional engineering, because gas is genuinely not the constraint on Base (see below).
Prediction-market arbitrage needs 25–125x more capital ($1,000–5,000/side against $39.46 total, per the practitioner figures preserved in [the executive office's own event-contract arbitrage planning note](../../../../../../../../../../../../../../561-group-services-section/services/561-group-operations-services-section/services/561-group-enterprise-services-section/services/561-group-board-of-directors/services/561-group-board-of-directors-executive-office/content/documents/articles/notes/2026/07/18/2026-07-18-note-on-event-contract-arbitrage-enterprise-planning.md), read directly, full file).
Cross-DEX arbitrage needs 625–6,250x more ($25,000–250,000+ against $39.46), a figure this note's source record independently converges on from two directions: general 2026 web research on Base/Arbitrum MEV, and this same corpus's own [`documented-edges-and-capacity.md`](../../../../../../../../../../../../../data/records/2026-08-27-small-account-trading-research/documented-edges-and-capacity.md) §12 on cross-exchange crypto arbitrage generally (search synthesis there, Bitsgap and Arbitrage Scanner, graded "directional-only, not precise").
Engineering cannot close a gap of that size: better code makes a $40 arbitrage bot execute its zero-or-negative edge more efficiently, not a positive edge appear.
The two strategies that escape this framing fail or succeed on different axes: yield deposit is capital-adequate but return-immaterial, and currently sits on a protocol mid-exploit; keeper/liquidation bounties are capital-adequate in principle — the bounty, not the position size, is the economic unit — but blocked by missing execution infrastructure and, on the one protocol this repo has tooling for, hopeless bot competition.

## What the repo already has, named precisely

`ethereum-services-section` (`/home/emsenn/info/lib/emsenn/services/561-group/services/engineering-services-section/services/computer-engineering-services-section/services/computer-systems-engineering-services-section/services/computer-blockchain-system-services-section/services/ethereum-services-section`) pins `ethers` 6.17.0 and `viem` 2.55.4, and carries a working Cloud KMS HSM signer (`services/sign-ethereum-digest-with-cloud-kms-services-section/src/index.mjs`, read directly) that calls Google Cloud KMS's `asymmetricSign`, parses the returned DER, and recovers the Ethereum address against both `yParity` values — real, reusable execution infrastructure for any strategy below.
Its ERC-4337 stack (`EnterpriseAccount.sol`, `EnterpriseProvisioningPaymaster.sol`) is real and tested, but deployed only to `eip155:31337` (Foundry/Anvil's local devchain — the recorded deployer `0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266` is Anvil's canonical default account, confirming this) and two private custom chains, `5615610` and `5615611` (all read directly from `content/deployments/*.json`).
**No deployment record exists anywhere in the repo for Base (`eip155:8453`) or Arbitrum (`eip155:42161`)** — the chains holding the Group's actual $39.46.
A plain EOA signed via `ethers` or the KMS signer, not the smart-account stack, is the realistic execution path at this capital tier.

A bounded `rg` search across the whole repo (excluding `node_modules`, `.git`, `lib/legacy`, `triage`, Verdaccio storage) for `SwapRouter`, `exactInputSingle`, `swapExactTokens`, `flashLoan`, `GelatoRelay`, `performUpkeep`, `AutomationCompatible`, and `KeeperCompatible` returns **zero hits, anywhere**.
There is no DEX-swap, flash-loan, or keeper/automation code anywhere in this codebase.
Everything named below is either read-only analytics or a non-functional stub.

## Concentrated-liquidity LP: gas clears, rebalancing doesn't

Base gas is genuinely cheap: a typical Aerodrome swap runs ≈$0.017 total (~$0.002 L2 execution + ~$0.015 L1 data-posting fee), rising to $0.05–0.20 only under L1 congestion (search synthesis; [BowTiedDevil, "Optimism & Base Chain L1 Data Fees"](https://www.degencode.com/p/optimism-and-base-chain-l1-data-fees); [OpenLiquid](https://openliquid.io/blog/base-chain-gas-fees-explained/)).
Scaling by a mint's heavier 200,000–400,000 gas units (search synthesis; [WriteReader](https://www.writereader.com/blog/uniswap-gas-fees-analysis-and-optimization-tips/)) gives a derived estimate of **≈$0.06 for one full open/close round trip — 0.15% of a $40 position** — trivially clearing the single-transaction breakeven that would kill this strategy outright on Ethereum L1, where the same mint runs $10–40+ and could eat 25–100% of the position in one transaction.
**Gas is not the binding constraint on Base; rebalance frequency is.**
At an optimistic 30–50% APR, gross fee income on $40 is $12–20/year (≈$0.033–0.055/day) — one rebalance (≈$0.06) burns roughly a day's fee income, so weekly rebalancing stays affordable (≈$3/yr drag) but daily rebalancing can consume the entire gross return (≈$22/yr).
49.5% of Uniswap v3 LPs were net-negative even at high nominal APR once impermanent loss was priced in (search synthesis; [DeFi Collective](https://deficollective.org/blog/concentrated-liquidity/)) — see [the impermanent-loss term](../../../../../../text/glossary/terms/impermanent-loss.md) and [the concentrated-liquidity term](../../../../../../text/glossary/terms/concentrated-liquidity.md) for the mechanism.
`agrodao`'s `src/nonfungible-position-exposure-assay.mjs` (`/home/emsenn/info/lib/emsenn/services/561-group/services/public-services-section/services/public-computer-services-section/services/public-web-services-section/services/public-web3-services-section/services/agrodao/src/nonfungible-position-exposure-assay.mjs`) classifies existing LP-NFT positions in a recovered wallet — it is forensic, not a live manager; its own test fixture declares `liveMutation: false`, `transactionAssembly: false`, `signing: false`.
No current-dated Aerodrome-specific APR figure was located this pass; flagged lead in the source record.

## Yield deposit: read-only tooling exists, and the protocol is mid-exploit today

`ethereum-services-section/src/moonwell-account-health.mjs` (read directly, tested at `test/moonwell-account-health.test.mjs`) is a real, working, **read-only** Moonwell liquidation-health calculator — `evaluateMoonwellAccountHealth()`/`observeMoonwellAccountHealth()` compute account liquidity, safe-withdrawal limits, minimum collateral and repayment, and multi-scenario stress projections against live Base comptroller/market/oracle reads.
Its own returned guard declares, verbatim: `prohibitedEffects: ["credential-read", "transaction-assembly", "sign", "broadcast", "asset-movement"]` — built, by its own declaration, to never touch a key.
It contains zero deposit, claim, or compound logic.
Roughly six hours before this note was compiled, Moonwell suffered an oracle-manipulation exploit on Base: the thinly-traded MAMO token's collateral price was pumped — [Crypto Times](https://www.cryptotimes.io/2026/08/27/moonwell-loses-nearly-8-7m-in-base-exploit-after-mamo-price-manipulation/) reports $0.01 to $0.43 (~43x), a separate search-synthesis pass described "nearly eightfold," unreconciled between the two this pass — via a spot oracle with no TWAP protection, and the inflated collateral was borrowed against for real cbBTC and USDC.
[The Block](https://www.theblock.co/news/defi/2026-08-27-moonwell-investigates-base-lending-market-issue-412913) and [TechTimes](https://www.techtimes.com/articles/325839/20260827/moonwell-oracle-exploit-exceeds-full-annual-revenue-third-failure-11-months.htm) both put the loss at ≈**$8.7 million**, exceeding Moonwell's own ≈$8.6M annualized fee revenue (search synthesis, TechTimes, DeFiLlama not independently queried).
**Borrow caps across all Base Core Markets were cut to 1 wei** in response (search synthesis; [Bloomingbit](https://en.bloomingbit.io/feed/news/119236), [Crypto Economy](https://crypto-economy.com/moonwell-probes-mamo-market-issue-after-multimillion-dollar-exploit-alert/)).
TechTimes frames this as the **third oracle-related failure in eleven months** (a November 2025 wrstETH exploit; a February 2026 MIP-X43 misconfiguration that fed a raw cbETH/ETH ratio into a Chainlink OEV wrapper, pricing cbETH at ~$1.12 against an actual ~$2,200); a QuillAudits post on X calls it the fourth major incident in three years, carried here **[UNVERIFIED]** as a social-media source not independently cross-checked.
See [the new oracle-manipulation term](../../../../../../text/glossary/terms/oracle-manipulation.md), which links the existing [oracle-divergence term](../../../../../../text/glossary/terms/oracle-divergence.md) from this same glossary — divergence is passive feed lag, manipulation is an active attack, and this event is squarely the latter.
Pre-exploit yield, for reference: Moonwell Base USDC ran ~4.1% 30-day APY (search synthesis; [Exponential DeFi](https://exponential.fi/pools/moonwell-usd-lending-base/5836a068-0d5c-4678-9381-99c8ec29ef1f)) to 3.5–6.5% wrapped (search synthesis; [harvest.finance](https://harvest.finance/usdc-morpho-moonwell-flagship-v2-base)) — on $40, $1.60–2.40/year, smaller than one gas transaction before any of the above risk is priced in.
A separate `rg` pass for "aave" and "morpho" across actual code returns only false-positive substring matches (e.g. "morphology") — no Aave or Morpho integration exists in this repo.

## Keeper networks: not open bounty pools, and mostly the wrong target

Chainlink Automation is run by "a Sybil-resistant network of known, reliable operators" (search synthesis; [Chainlink, "What Is a Node Operator?"](https://chain.link/article/operator)) — permissioned, not an open registry, and mid-sunset besides: v1.x retires 2026-06-30, v2.1 retires 2026-07-31 (search synthesis; [Chainlink Automation Economics docs](https://docs.chain.link/chainlink-automation/overview/automation-economics)).
**Gelato Web3 Functions shut down entirely on 2026-03-31**, a strategic pivot toward Gelato's rollup-as-a-service business rather than a technical failure (search synthesis, promotional-adjacent source corroborated by a contemporaneous announcement; [Mimic](https://www.mimic.fi/blog/gelato-web3-automation-is-ending-use-mimic), [@mimicfi](https://x.com/mimicfi/status/2024861610666525100)).
The real permissionless money is protocol-native anyone-can-call functions — liquidations, `harvest()`/`compound()` caller fees, order fillers — see [the new keeper-network term](../../../../../../text/glossary/terms/keeper-network.md).
`moonwell-account-health.mjs` already solves the hard read-side half of a Moonwell liquidation bot; missing is an account-discovery/indexing layer (not present anywhere in the repo), the actual `liquidateBorrow()` call (forbidden by this module's own guard, so a new sibling module), and capital or a flash-loan path to fund the repay leg (no flash-loan code exists anywhere, confirmed above) — see [the new liquidation-bonus term](../../../../../../text/glossary/terms/liquidation-bonus.md), which links the pre-existing [liquidation term](../../../../../../text/glossary/terms/liquidation.md).
Moonwell's own governance forum is discussing OEV-capture mechanisms specifically to intermediate this race (search synthesis; [Moonwell Governance Forum](https://forum.moonwell.fi/t/capturing-oev-in-the-moonwell-protocol/1423)) — a $40, no-flash-loan, no-private-mempool bot has no realistic path to winning that race, and Moonwell is mid-incident besides.
The more plausible opportunity — a smaller/newer protocol with a real caller-fee function and few bots watching — is unresearched; flagged lead.

## Prediction-market arbitrage: stubbed integration, real capital floor

`polymarket-services-section/src/client.mjs` (`/home/emsenn/info/lib/emsenn/services/561-group/services/engineering-services-section/services/computer-engineering-services-section/services/computer-systems-engineering-services-section/services/web-services-section/services/web-platform-services-section/services/web3-platform-services-section/web3-gambling-platform-services-section/services/polymarket-services-section/src/client.mjs`, read directly) implements real Ed25519 signing but hard-codes `placeOrder()` to `Reject` — either `activation-refused` or `auth-schema-unconfirmed`.
[The executive office's own arbitrage-desk planning note](../../../../../../../../../../../../../../561-group-services-section/services/561-group-operations-services-section/services/561-group-enterprise-services-section/services/561-group-board-of-directors/services/561-group-board-of-directors-executive-office/content/documents/articles/notes/2026/07/18/2026-07-18-note-on-event-contract-arbitrage-enterprise-planning.md) already carries the 2026 figures this note would otherwise re-derive: cross-venue spreads compressed from multi-minute 2–5% windows in 2024 to ~30-second windows in 2026, round-trip fees near 3¢/contract, and practitioner-sourced $1,000/side minimum, $5,000+/side "meaningful" size (attributed there to clawarbs.com, explicitly flagged "unverified marketing claims").
Polymarket US opened a genuine public API in 2026 and is no longer geoblocked (search synthesis; [QuantVPS](https://www.quantvps.com/blog/polymarket-us-api-available); [AgentBets](https://agentbets.ai/guides/polymarket-us-api-guide/)) but gates the developer portal behind full identity KYC (SSN, government ID, proof of address), 24–48h turnaround — a compliance gate outside the codebase entirely.
Azuro was not found in the repo and was not separately researched; flagged lead.

## Cross-DEX arbitrage and NFT sniping: no code, and the wrong capital tier regardless

Base runs a private mempool and just two entities extract over 80% of Base MEV (search synthesis; [Dwellir](https://www.dwellir.com/blog/mev-arbitrage-bot-infrastructure); primary-adjacent, not read in full: [arXiv 2606.00720](https://arxiv.org/html/2606.00720v1)); Arbitrum's 250ms blocks demand sub-250ms colocated execution instead.
15–25% of attempted arbitrage transactions on competitive chains fail outright to a faster competitor (search synthesis, same cluster).
No swap/arbitrage code exists in the repo (see the zero-hit search above), but that is moot against the capital floor: $25,000–250,000+ minimum viable, per this section's own [`documented-edges-and-capacity.md`](../../../../../../../../../../../../../data/records/2026-08-27-small-account-trading-research/documented-edges-and-capacity.md) §12.
NFT floor sniping has no repo code and no located 2026 profitability evidence at retail scale, general sourcing confirming only that bots dominate on latency and "do not guarantee profits" (search synthesis; [QuickNode](https://www.quicknode.com/builders-guide/best/top-10-solana-sniper-bots)).

## Ranking and the honest recommendation

By expected dollars-per-hour-of-build-effort at $40 capital: (1) keeper/liquidation bounties, redirected away from saturated Moonwell toward an unresearched smaller protocol — the only strategy whose return scales with skill and infrastructure rather than capital, and the one where the repo already carries the hardest analytical piece; (2) Moonwell-style yield deposit — near-zero return, near-zero build, currently blocked by the live exploit; (3) concentrated-liquidity LP — moderate build, gas clears, fee income too small at this size; (4) cross-DEX arbitrage — cheap build, ~zero-to-negative return regardless of code quality; (5) NFT floor sniping — similar build cost, worse-evidenced return, worse dead-capital tail risk; (6) prediction-market arbitrage — lowest ratio, capital floor 25–125x too high, compliance gate outside the codebase.
The honest reading of the ranking is not "build strategy 1" so much as "none of the six meaningfully moves $39.46" — the capital-ratio spine above is the actual finding, and it is a finding about the Group's balance sheet, not about the quality of any code that could be written this week.
