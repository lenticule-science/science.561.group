---
name: 2026-08-27-x402-bazaar-undercounts-settlement-by-an-order-of-magnitude
description: "Historical Bazaar calls and Base USDC EIP-3009 comparison; corrected 2026-10-17: shared-rail counts do not establish an x402 undercount or visibility rate, and the conditional bound had been reversed."
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

# Bazaar calls versus shared EIP-3009: correction to the purported nine-percent x402 figure

## What this note is, and where it lives

This note's subject is the limits of market-sizing from [x402](../../../../../../glossary/terms/x402.md) discovery and shared settlement events. **Correction (2026-10-17): the original headline and conclusion wrongly equated unlike observation units and reversed a conditional inequality.** The original dated observations below are retained, not promoted to a verified estimate of all x402 commerce.
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

## The finding — corrected on 2026-10-17

The historical August snapshot reported approximately 292,674 trailing-30-day Bazaar calls, and a separate sampled-window extrapolation of about 3.28 million Base USDC EIP-3009 authorizations in 30 days. Their numerical quotient is about 0.0892, and its reciprocal about 11.2. **These are not yet counts of the same event population or equivalent units.** One is a facilitator-reported call metric; the other is an extrapolation of a general-purpose chain authorization event. The original conclusion that the catalog **understates x402 protocol settlement by about eleven-fold is withdrawn**, not merely flagged as uncertain.

Let B be the number of Bazaar-reported *settled calls that can be bound one-to-one to actual EIP-3009 authorizations* on the same chain, asset and interval; X be all real x402 authorizations within that exact population; and E be all EIP-3009 authorizations in that population. If independent evidence establishes both the one-to-one binding and B <= X <= E, then B/E <= B/X <= 1 for X > 0. In that properly typed situation, B/E is a **lower**, not upper, bound on the catalog's fraction of x402 settlement. Example: B=9, E=100, X=10 satisfies all premises and gives actual coverage 90%, not at most 9%. If X=9, true coverage is 100%.

Those inclusion and event-unit premises have **not** been established for the historical Bazaar and chain reports. Bazaar counts may be calls rather than settled EIP-3009 authorizations; multi-network calls, retry/replay, timing windows and non-EIP x402 schemes differ. Even the conditional lower bound cannot be applied to the August figures without reconciliation. The observations remain useful, independent snapshots of different surfaces; neither is the market's verified denominator.

For revenue and demand, the same rule applies: resource listings, number of reported calls, unique payers by SKU, successful settlements, delivered outputs, accepted independent customer outcomes and net contribution are distinct measures. Aggregating unique payers across SKUs double counts agents unless identity linkage establishes a union. A chain authorization is not independently proved x402 income or profit.
## Shared settlement rail, sampling and observational boundaries

**[UNVERIFIED]:** the fraction of Base USDC EIP-3009 authorizations belonging to x402 is unknown. EIP-3009 is a settlement primitive shared with other applications. The August rate was extrapolated from one sample under a stationarity assumption; it was not a complete 30-day census. The Bazaar's reported calls had not been joined by authorization identity, resource, facilitator, chain, asset and observation interval to those logs. In addition, not every x402 transport/scheme/network settles through Base USDC EIP-3009.

In the hypothetical same-population one-to-one case above, reducing X while holding B and E fixed **increases** B/X, contradicting the previous version's "bounded above by 9%" statement. Without that one-to-one premise, there is no justified directional bound; this is not an estimate of all-chain x402 volume. The historical source's potential causes of missing discoverability (opt-in, facilitator registration, unstable indexing, no repeated customers) remain hypotheses requiring paired route-level and buyer-level measurements.

A prospective assay should obtain bounded, dated vendor-native seller-scoped resources/calls, actual x402-scheme-specific independently attributed authorizations and exact 402/Bazaar resource identities, then reconcile one event at a time; only then estimate coverage with explicit uncertainty and scope. It must not equate EIP-3009 transaction totals with marketplace call totals.
## What this note does and does not establish

**Preserved observation:** the dated August seller-index inventory and price concentration claims as recorded by the historical coordinator, and a distinct Base USDC EIP-3009 sampled rate with its stationarity assumption. The underlying raw measurement record referenced earlier has not been re-read during this correction, so these historic figures are source-reported, not freshly reproduced.

**Established by elementary arithmetic:** dividing the two reported numerals gives about 9%, but proves no market-share, market-coverage or protocol-volume relation; under an independently established B <= X <= E mapping the correct fraction inequality runs B/E <= B/X. The previous upper-bound and eleven-fold protocol-undercount conclusions are expressly retracted.

**Not established:** the actual fraction of x402 authorizations in the shared settlement rail, how many Bazaar calls map to unique settled transactions, why listings/calls differ across the two observational surfaces, recurring independent demand, any merchant's net margin or any production transaction from a catalog entry.

**Engineering receiver:** Networking's existing x402 merchant observation tool and Causeway's existing market audit must produce matched paid-transaction evidence before presenting percentages as coverage; Coesite's distributed market matching must use those evidence statuses without constructing a second payments ledger. This correction is not a new dataset, Lean proof or deployed financial observation.
