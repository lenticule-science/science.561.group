---
name: 2026-08-27-x402-bazaar-undercounts-settlement-by-an-order-of-magnitude
description: "First-hand comparison of the Coinbase x402 Bazaar discovery catalog's own reported 30-day call volume against directly-measured on-chain EIP-3009 settlement on Base USDC, finding the catalog visible to about 9% of settlement activity — a market sized from the catalog alone understates the protocol by roughly 11x."
date-created: 2026-08-27
type: notes
authors:
  - claude-sonnet-5
keywords:
  - x402
  - x402-bazaar
  - eip-3009
  - transfer-with-authorization
  - settlement-primitive
  - calls-per-payer
  - market-sizing
  - on-chain-measurement
title: 2026-08-27-x402-bazaar-undercounts-settlement-by-an-order-of-magnitude
---

# The Bazaar sees about nine percent of on-chain x402 settlement

## What this note is, and where it lives

This note's subject is market-sizing method for the [x402](../../../../../../glossary/terms/x402.md) agent-payments protocol: how big the market actually is, measured against how big its own most-visible catalog makes it look.
That is market structure and measurement, the same territory the [2026-08-27 note on agent-to-agent commerce and machine-payable APIs](./2026-08-27-note-on-agent-to-agent-commerce-and-machine-payable-apis.md) already established as this section's home — see that note's "Why this note lives here" section for the full placement reasoning, not repeated here.
This note reads that earlier note first and does not duplicate or contradict its claims; where the two touch the same ground (the [x402 Bazaar](../../../../../../glossary/terms/x402-bazaar.md)'s listing mechanic, this estate's existing x402 volume figures), this note says so explicitly and cites the earlier note directly rather than re-deriving it.

Two measurements make this note possible, both taken directly by the 561 Group coordinator on 2026-08-27/28: a complete read of the Coinbase x402 Bazaar discovery catalog, and an `eth_getLogs` sample of EIP-3009 settlement events against Base mainnet USDC.
The full record, with every number and its method shown, is persisted at [`data/records/2026-08-27-x402-market-measurement/x402-market-observation.md`](../../../../../../../../../../../../../../../engineering-services-section/services/computer-engineering-services-section/services/computer-networking-engineering-services-section/services/x402-services-section/services/x402-market-observation-service/data/records/2026-08-28-x402-market-observation.json); this note carries the central finding and its two supporting measurements forward, but the record holds the rest — the full price distribution, the demand-by-category table and its unreconciled gap, and open leads.

## The Bazaar catalog, measured directly

The coordinator read the Bazaar's discovery catalog complete via `GET api.cdp.coinbase.com/platform/v2/x402/discovery/resources` — the same endpoint the [agent-to-agent-commerce note](./2026-08-27-note-on-agent-to-agent-commerce-and-machine-payable-apis.md)'s source record had previously only reached by search synthesis.
The catalog's total resource count, live/dormant split, trailing-30-day call and unique-payer totals, and full price distribution are carried in the source record cited above; broadly, live resources are priced from free through a four-figure outlier, with the bulk of the catalog priced in small fractions of a dollar.

Revenue is sharply concentrated — exact per-resource and aggregate figures are in the source record — with a single Bitrefill gift-card payment rail, not a computation or data service, earning roughly two-thirds of the catalog's total 30-day revenue, the top ten resources taking most of the rest, and the remaining live resources splitting a small remainder at well under a dollar each per month.
This is a market with one large commercial artery and a very long, very thin tail, not a broad marketplace of priced computation.

The highest-demand resources by unique payer count are, per the coordinator's read, thin wrappers over Ethereum JSON-RPC — ERC-20 balance lookup, ENS resolution, wallet balance, block height, transaction-by-hash — each drawing a similar number of unique payers to calls over 30 days (exact counts in the source record), a [calls-per-payer](../../../../../../glossary/terms/calls-per-payer.md) ratio near 1:1.
As that term explains in full, a ratio this close to one is diagnostic: it reads as roughly a thousand distinct agents each sampling the endpoint once, not as a smaller number of agents each integrating it into a repeated workflow.
By distinct payers, demand skews heavily toward chain-data lookups, ahead of search/web, market/price, identity/security, math/compute, ai/inference, and geo/time, in that order (exact per-category counts and the unreconciled gap are in the source record) — the catalog's actual demand is disproportionately blockchain-adjacent utility calls, not the AI-inference-marketplace framing the protocol sometimes gets in promotional writing.

## On-chain settlement, measured directly

Independently, the coordinator queried `eth_getLogs` against Base mainnet USDC (`0x833589fCD6eDb6E08f4c7C32D4f71b54bdA02913`) for the `AuthorizationUsed(address,bytes32)` event — the log [EIP-3009](../../../../../../glossary/terms/eip-3009.md)'s `transferWithAuthorization` mechanism emits on every completed gasless authorization, detailed in full at [`transfer-with-authorization`](../../../../../../glossary/terms/transfer-with-authorization.md).
A single sampled window of Base blocks was read directly; the window size, block range, and raw event and distinct-address counts are in the source record.

Event counts sum linearly across non-overlapping windows, so the sampled rate extrapolates (under a stationarity assumption this note flags rather than hides) to a 30-day on-chain authorization-volume estimate; the day- and 30-day-rate figures behind that estimate are in the source record.
The distinct-address count from the sample is deliberately *not* extrapolated the same way — unique-address counts do not sum across windows the way discrete event counts do, since the same address can recur — so no 30-day unique-authorizer estimate is offered here; see the record for the full reasoning.

## The finding

The exact call-count and extrapolated on-chain-volume figures this finding divides are in the source record cited above.

The Bazaar catalog's own reported 30-day call count is about **9%** of the volume the on-chain extrapolation implies.
Inverted, the on-chain estimate runs about **11×** the Bazaar's own reported figure.
**A market size derived from the Bazaar catalog alone — the only free, keyless, single-request aggregate the protocol publishes — understates the protocol's actual settlement activity by roughly an order of magnitude.**
This is not a claim that this estate's existing x402 figures are wrong: the [agent-to-agent-commerce note](./2026-08-27-note-on-agent-to-agent-commerce-and-machine-payable-apis.md)'s companion record already carries an x402scan-derived 30-day volume figure that sits close to this note's own on-chain estimate (both figures in their respective records), meaning x402scan (a chain explorer) already tracks something close to true on-chain volume, and is not the figure this finding corrects.
The specific trap this finding names is narrower and more concrete: the Bazaar discovery catalog specifically, whose registration is gated on a completed settlement through the CDP Facilitator (mechanic detailed in the [agent-to-agent-commerce note](./2026-08-27-note-on-agent-to-agent-commerce-and-machine-payable-apis.md) and its source record) rather than on deployment alone, is a curated opt-in subset of the underlying settlement rail — and its own aggregate call count, taken alone, is the wrong denominator for "how big is this market."

## The caveat this finding rests on, stated as prominently as the finding itself

**[UNVERIFIED]: the share of on-chain EIP-3009 activity on Base USDC that is specifically x402 settlement, as opposed to some other use of the same primitive, has not been established.**
EIP-3009's `transferWithAuthorization` is a general-purpose gasless-transfer mechanism, not an x402-exclusive one — see [`settlement-primitive`](../../../../../../glossary/terms/settlement-primitive.md) for the general point that a payment protocol's settlement layer is usually shared infrastructure, not something it owns outright. x402's `exact` payment scheme uses EIP-3009 as its settlement primitive, which is exactly what makes the on-chain `AuthorizationUsed` count the best available proxy for x402 volume; it is not, on its own, evidence that every logged authorization was an x402 payment specifically, as opposed to some other meta-transaction relay, wallet gas-abstraction feature, or unrelated protocol built on the same USDC function.
The correct reading of the 9%/11× figure is therefore: the Bazaar sees at most 9% of on-chain EIP-3009 activity, and since genuine x402 volume is some subset of that EIP-3009 activity, the Bazaar's true visibility fraction into x402 specifically is bounded *above* by 9%, not guaranteed to equal it — it could be considerably smaller if a large share of on-chain EIP-3009 traffic turns out to be non-x402.
Narrowing this — sampling `AuthorizationUsed` transactions for x402-facilitator calldata fingerprints, for instance — is a concrete next step this note does not attempt.

## What this note does and does not establish

It establishes, from two independently measured first-hand sources: the Bazaar catalog's size, price distribution, and sharp revenue concentration around a single non-computational payment rail; the on-chain EIP-3009 settlement rate in one sampled window and its 30-day extrapolation; the resulting ~9%/~11× visibility gap between the two; and the logical bound that this gap is an upper bound, not a direct measurement, on the equivalent gap for x402 settlement specifically.
It does not establish why the Bazaar undercounts by this much — candidate mechanisms (resources that never enabled Bazaar discovery, registrations that never stabilized despite qualifying settlements, as documented for one live seller in the [agent-to-agent-commerce note](./2026-08-27-note-on-agent-to-agent-commerce-and-machine-payable-apis.md), or simply direct-integration traffic that never routes through catalog search at all) are named as candidates in the source record but none is tested here.
It also does not establish the true x402-specific share of on-chain EIP-3009 volume, which stays graded [UNVERIFIED] until someone does the calldata-level sampling work the previous section names as the open lead.
