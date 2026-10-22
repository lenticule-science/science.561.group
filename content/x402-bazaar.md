---
title: "x402 Bazaar: The Discovery Layer for Payable Resources"
summary: "The x402 Bazaar is a version 2 discovery extension for payable HTTP resources and MCP tools; Coinbase runs one index, but no single marketplace."
date-created: 2026-08-27
type: glossary-term
status: active
visibility: public
tags: [x402, bazaar, discovery, facilitator, catalog]
keywords: [x402 Bazaar, resource discovery, x402 discovery extension, payable resources, MCP tools, Coinbase catalog]
---

# x402 Bazaar: The Discovery Layer for Payable Resources

The x402 Bazaar is the discovery extension and cataloging convention in version 2 of the [x402](/what-is-x402/) specification for payable HTTP resources and MCP tools. It is not one Coinbase-owned marketplace and not a new payment primitive: any [facilitator](/x402-facilitator/) may implement discovery, and Coinbase's public resource catalog is one facilitator-specific index of many possible ones.

## How does the Bazaar work?

A seller opts a route in by declaring discovery metadata, carried in the payment requirement at `extensions.bazaar`. The declaration distinguishes an HTTP method and request specification from an MCP tool name and input schema. The facilitator may accept indexing, process it asynchronously or reject it. Per Coinbase's documentation, the facilitator extracts the metadata and registers the resource at the time of payment processing, so listing is gated on a completed settlement, not on deployment.

Coinbase's discovery interface, usable without an API key as observed on 2026-08-27, offers natural-language search (at most 20 results, ranked by relevance and quality, filterable by network, asset, scheme, payee, URL or maximum price), a paginated browse of all active resources, and a lookup of all resources paying a given address. Search results show call count and unique payer count over the trailing 30 days and when the resource was last called.

## Why does the Bazaar matter?

Discovery is half of a two-sided market. A [machine-payable API](/machine-payable-api/) that nobody can find sells nothing, and the buyers are often software making real-time purchasing decisions, so directories take the role marketing plays elsewhere. The Bazaar is the standardized way for such directories to describe sellers' offerings. It also gives measurement a surface: the Coinbase catalog on 2026-08-27 held 14,841 resources (14,781 live), with 292,674 calls and 42,316 unique payers over the trailing 30 days, and revenue concentrated in a single gift-card payment rail. Those are historical, source-reported figures.

## What are the limits of the Bazaar?

- **The catalog is not the market.** A Bazaar record describes discovery of a seller-authored declaration. It does not approve the seller's rights, identity, current payee, delivery or demand. The payable resource and the current quote remain with the seller.
- **Catalog call counts cannot be divided by chain events.** An August 2026 analysis compared catalog calls with an extrapolated count of chain authorizations and claimed the catalog undercounts x402 settlement. That claim was retracted on 2026-10-17: the numbers count different units, and a shared settlement primitive is used by non-x402 applications. See [x402 Bazaar and agent-market resource discovery](/x402-bazaar-and-agent-market-resource-discovery/).
- **Concentration and one-off sampling.** Most catalog revenue sat with a handful of resources, and the most-used resources showed roughly one call per payer, which suggests sampling rather than integration.
- **Bazaar is not a shop or a market.** A shop publishes one seller's offers, a bazaar indexes across shops, and a market is the wider exchange institution. The 561 Group operates [market.561.group](https://market.561.group/), [bazaar.561.group](https://bazaar.561.group/) and [shop.561.group](https://shop.561.group/) as separate surfaces.

An agent consuming a Bazaar record should keep the method, source URL, offer identity, declared input and output, the discovery source and time, and independent verification statuses.

## Related

- [What is x402?](/what-is-x402/), [x402 facilitator](/x402-facilitator/), [x402 Bazaar](/x402-bazaar/), [machine-payable API](/machine-payable-api/), [micropayment](/micropayment/), [agent-to-agent commerce](/agent-to-agent-commerce/)
- Evidence and measurement: [The x402 economy, September 2026](/x402-economy-machine-payable-markets/), [x402 Bazaar and agent-market resource discovery](/x402-bazaar-and-agent-market-resource-discovery/)
- Sites: [market.561.group](https://market.561.group/), [561.group](https://561.group/), [engineering.561.group](https://engineering.561.group/), [operations.561.group](https://operations.561.group/), [services.561.group](https://services.561.group/)
