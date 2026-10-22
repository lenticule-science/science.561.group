---
title: "x402 Bazaar and Agent-Market Resource Discovery: What a Catalog Can and Cannot Tell You"
summary: "The x402 Bazaar is a discovery extension, not a single marketplace; a catalog's call counts cannot be divided by chain events to size x402 commerce."
date-created: 2026-10-17
type: article
status: active
visibility: public
tags: [x402, bazaar, resource-discovery, agent-commerce, market-measurement, correction]
keywords: [x402 Bazaar, resource discovery, x402 facilitator, machine-payable API, market measurement, EIP-3009, agent marketplace, shop bazaar market]
references:
  bazaarspec: { type: webpage, title: "x402 Bazaar extension specification", URL: "https://github.com/x402-foundation/x402/blob/main/specs/extensions/bazaar.md" }
  x402v2: { type: webpage, title: "x402 v2 specification", URL: "https://github.com/x402-foundation/x402/blob/main/specs/x402-specification-v2.md" }
  cdpbazaar: { type: webpage, title: "CDP x402 Bazaar documentation", URL: "https://docs.cdp.coinbase.com/x402/bazaar" }
  cdpfacilitator: { type: webpage, title: "CDP x402 facilitator core concepts", URL: "https://docs.cdp.coinbase.com/x402/core-concepts/facilitator" }
  x402stats: { type: webpage, title: "x402stats (independent x402 statistics)", URL: "https://x402stats.io/" }
---

# x402 Bazaar and Agent-Market Resource Discovery: What a Catalog Can and Cannot Tell You

The x402 Bazaar is a discovery extension of the x402 payment protocol: a convention by which a seller of a payable HTTP resource or MCP tool declares what it sells so that any facilitator can index it. It is not one marketplace, and a count of calls in any one facilitator's catalog does not measure how much x402 commerce exists. This article gives the corrected understanding as of 2026-10-17, including a retraction of an earlier August claim that the catalog "undercounts" settlement.

## What is the x402 Bazaar?

Bazaar is the discovery extension and cataloging convention in version 2 of the x402 specification [@bazaarspec; @x402v2]. It lives at `PaymentRequired.extensions.bazaar` and distinguishes an HTTP method and request specification from an MCP tool name and input schema. Any [facilitator](/x402-facilitator/) may implement discovery, and the facilitator may accept an indexing request, process it asynchronously, or reject it. The specification describes optional discovery endpoints, not a single universal or exhaustive marketplace. See the glossary entry [x402 Bazaar](/x402-bazaar/).

Coinbase's public resource catalog is one facilitator-specific index. At the time of our 2026-08-27 observation it could be queried without an API key. Its documentation [@cdpbazaar] lists three methods:

- `searchX402Resources`: natural-language search, filterable by network, asset, payment scheme, payee address, URL or maximum USD price, returning at most 20 resources ranked by relevance and quality.
- `listX402DiscoveryResources`: offset-paginated browse of all active resources.
- `listX402DiscoveryMerchant`: all active resources paying a given address (an unknown address returns an empty result, not an error).

Search results carry three quality signals: call count and unique payer count over the trailing 30 days, and when the resource was last called.

### How does a resource get listed?

Registration is gated on settlement, not on deployment. A seller opts a route in with a discovery declaration, and Coinbase's documentation says the facilitator indexes the endpoint once it settles a payment for it [@cdpfacilitator]. The practical consequence is a chicken-and-egg problem: a correctly built, opted-in endpoint that has never sold anything has also never triggered its own catalog listing. Our own seller, discussed below, shows that two strangers found a service at least once, so discovery is not impossible, but the listing mechanic matters for any new seller.

## What did the August 2026 catalog snapshot measure?

**Correction, 2026-10-21: the August reading is one snapshot, not the market's character.** It describes the Bazaar catalog on 2026-08-27 and says nothing about growth. A single snapshot of a young market's size cannot justify deferring entry; a market observation used that way must be a dated series that measures growth. The x402 Foundation's dashboard read about 75.41 million payments and $24.24 million of volume over 30 days on 2026-10-18, against about 292,674 trailing-30-day Bazaar calls in the August catalog. The units differ, so no growth rate follows from the pair, but the August reading did not foresee the October one. Read the August figures as a dated observation, never as evidence that the market was too small to enter.

On 2026-08-27 we read the complete Coinbase catalog through its public discovery endpoint. These are historical, source-reported figures; they were not re-observed in October.

| Measure (Coinbase catalog, 2026-08-27) | Value |
|---|---|
| Resources | 14,841 (14,781 live, 60 dormant) |
| Trailing-30-day calls | 292,674 |
| Trailing-30-day unique payers | 42,316 |
| Live-resource price range (USDC) | $0 minimum (only 2 free), $0.01 median, $1,000 maximum |
| Interquartile prices | $0.003 (p25) to $0.05 (p75) |
| Estimated 30-day catalog revenue | $30,627 |
| Revenue from one gift-card payment rail | $21,000 |
| Share of revenue taken by the top ten resources | 78% |
| Remaining 14,771 live resources | $6,836 combined, about $0.46 each per month |

Two observations follow. Revenue is sharply concentrated: one commercial artery, a gift-card payment rail rather than a computation or data service, and a very long, very thin tail. And the highest-demand resources by unique payers were thin wrappers over Ethereum JSON-RPC (token balance, name resolution, wallet balance, block height, transaction lookup), each drawing roughly 1,000 unique payers and roughly 1,000 calls. A calls-per-payer ratio near one suggests broad one-off sampling rather than agents integrating an endpoint into a repeated workflow. That is an interpretation, not a measurement of intent.

## Why was the "undercount" claim retracted?

The original August analysis divided the catalog's 292,674 reported calls by an extrapolation of about 3.28 million Base USDC EIP-3009 authorizations over 30 days, got about 9%, and concluded the catalog understated x402 settlement roughly eleven-fold. On 2026-10-17 we withdrew that conclusion. The retraction rests on three points.

1. **Unlike units.** One number is a facilitator-reported call metric; the other is an extrapolation, from one sampled window under a stationarity assumption, of a general-purpose chain event. EIP-3009 `transferWithAuthorization` is a settlement primitive shared with applications other than x402, and not every x402 scheme or network settles through Base USDC EIP-3009. Dividing the two numbers proves no market share or coverage.
2. **A reversed inequality.** Let B be the Bazaar-reported settled calls that bind one-to-one to real EIP-3009 authorizations on the same chain, asset and interval, X all real x402 authorizations in that population, and E all EIP-3009 authorizations there. If B <= X <= E is independently established, then B/E <= B/X <= 1, so B/E is a lower bound on the catalog's coverage of x402, not an upper bound. Example: B=9, E=100, X=10 satisfies every premise and gives actual coverage of 90%, not at most 9%.
3. **Premises never established.** The inclusion and one-to-one binding premises were not shown for the historical data, so no directional bound is justified.

What stands: two dated, independent snapshots of different surfaces. What does not: any statement of the fraction of x402 authorizations in the shared rail, how many Bazaar calls map to unique settled transactions, or why the surfaces differ. The potential causes first suggested (opt-in, facilitator registration, unstable indexing, no repeated customers) remain hypotheses.

### How should x402 coverage be measured instead?

Reconcile one event at a time. A sound assay would obtain bounded, dated, seller-scoped resource and call data from the vendor, independently attributed x402-scheme authorizations, and exact 402/Bazaar resource identities, then match them by authorization identity, resource, facilitator, chain, asset and interval, and only then estimate coverage with explicit uncertainty. Listings, reported calls, unique payers per product, successful settlements, delivered outputs, accepted customer outcomes and net contribution are distinct measures; summing unique payers across products double counts agents unless identity linkage establishes a union.

## How do shops, bazaars and markets differ?

Our October 2026 economics work separates four objects that are routinely conflated, and proposes (as test obligations, not established results) that they be kept distinct:

- **Resource**: one invocable address (an HTTP method and route template, or an MCP server and tool). A resource reference says how to address an invocation, not whether it is lawful, paid, working or fulfillable.
- **Shop**: a seller-controlled boundary that publishes that seller's own offers. Its authority comes from the seller's actual accounts, not the domain name.
- **Bazaar**: a discovery relation across shops. A Bazaar record describes discovery of a seller-authored declaration, not approval of the seller's rights, identity, current payee, delivery or demand. A third-party offer shown in a bazaar does not become the bazaar operator's inventory.
- **Market**: the wider exchange institution, including demands, matching rules, contracting, payment, delivery and acceptance. A market may exist without an automated bazaar, and a bazaar may index resources that never trade.

The same work lists the distinct steps that must not be collapsed: a search hit is not an offer; an offer is not a payable resource; an HTTP 402 is not a signed purchase; a submitted signature is not a settled payment; a completed transfer is not accepted work; a count of listings is not demand. An agent consuming a Bazaar record should retain the method, source resource URL, offer identity, declared input and output, discovery source and time, and independent verification statuses.

The public instances: [market.561.group](https://market.561.group/) is the 561 Group's x402 market (its /x402/ and /offers/ pages are launching), [bazaar.561.group](https://bazaar.561.group/) is the discovery surface, and [shop.561.group](https://shop.561.group/) is the shop. As of 2026-10-17 the market's source catalog held 131 authored declarations, and independently paid delivery through it had not yet been received. No customer installation, theorem or profit is implied.

## What do the adoption numbers look like in October 2026?

A protocol transaction, settled USD value, seller wallet, independently paid service, agent task and recognized profit are different measurements with different denominators. As reported on 2026-10-18:

| Source | Reported | Caution |
|---|---|---|
| x402 Foundation dashboard | 75.41M transactions, $24.24M, about 94,060 buyers, 22,000 sellers, "trailing 30 days" | The same four numbers appeared from March to September (see [the x402 economy article](/x402-economy-machine-payable-markets/)); treat the 30-day label with suspicion |
| Independent x402stats [@x402stats] | About $685,000 filtered organic USDC volume, 94 qualifying sellers, 30 days; about $1.1M unfiltered | Stricter wallet-level filters (minimum $100 per wallet, 3 buyers, average payment $0.001, known facilitators excluded); not comparable with the dashboard |
| x402stats monthly reports, July to October 1 | Organic volume windows about $428k, $503k, $1.2M, $793k; qualified sellers 173, 124, 78, 91 | Volatile and concentrated; not monotonic growth |
| Olas Mech operator | About 12.1M task requests, 10.2M deliveries, about $110k gross over its history | Mostly one demand source; gross, not profit |

Vendor-reported directory sizes (one competitor claims 344 APIs and 4,895 endpoints; another's own pages disagree, 28+ versus 34+ skills, on the same day) are page labels, not normalized censuses. We treat them as testable comparative claims about buyer experience, not as evidence of anyone's success.

## What did a real seller learn from discovery?

The 561 Group's ephemeris gateway, an x402 seller of astronomical position data, first appeared to have earned $0.00. On-chain inspection showed otherwise: it took settlements from two distinct strangers between 2026-07-22 and 2026-07-26, then nothing for a month. The right question became what stops a working stream rather than how to get a first customer. The gateway also faced a free overlapping MCP competitor and subscription competitors with generous free tiers against a $0.04 price. Diagnosis: the weak point was product fit, not discovery, and "received nothing" and "received nothing lately" need different fixes. A price tier should be checked against the nearest free substitute's reach before distribution is blamed. Whether those payments total $0.52 is unreconciled in our own records; see [the economy article](/x402-economy-machine-payable-markets/).

## Related

- [What is x402?](/what-is-x402/) | [x402 facilitator](/x402-facilitator/) | [x402 Bazaar](/x402-bazaar/) | [machine-payable API](/machine-payable-api/) | [micropayment](/micropayment/) | [agent-to-agent commerce](/agent-to-agent-commerce/)
- [The x402 economy, September 2026](/x402-economy-machine-payable-markets/)
- Sites: [market.561.group](https://market.561.group/), [bazaar.561.group](https://bazaar.561.group/), [shop.561.group](https://shop.561.group/), [561.group](https://561.group/), [engineering.561.group](https://engineering.561.group/), [operations.561.group](https://operations.561.group/), [services.561.group](https://services.561.group/)
