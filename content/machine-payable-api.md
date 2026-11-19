---
title: "Machine-Payable API: An API Priced Per Call for Software Buyers"
summary: "A machine-payable API charges per call through an inline payment challenge that software can satisfy with no signup, card or human approval, typically via x402."
date-created: 2026-08-27
type: glossary-term
status: active
visibility: public
tags: [machine-payable-api, x402, api, per-call-pricing, agents]
keywords: [machine-payable API, pay per call API, x402 API, HTTP 402, metered API, agent payments]
---

# Machine-Payable API: An API Priced Per Call for Software Buyers

A machine-payable API is an HTTP API that prices and gates access per call, in a form that software can satisfy without a human in the loop: no signup form, stored card, OAuth consent screen or invoice, just a payment challenge returned inline with the request and settled inline in response. [x402](/what-is-x402/) is currently the most prominent protocol for building one.

## How does a machine-payable API work?

A route declares a price and a payee address. An unpaid request receives HTTP 402 with a machine-readable challenge. The caller signs a payment, retries the request with proof, and receives the resource; a [facilitator](/x402-facilitator/) typically handles verification and on-chain settlement. The seller never needs to know the caller in advance.

This differs from the usual alternatives. A conventional metered API counts usage after the fact against a pre-established account and a monthly invoice. A subscription API prices access rather than use. A machine-payable API prices the individual call, settled at the moment of the call, to a caller it may never see again.

## Why does it matter?

The category exists because of cheap [micropayment](/micropayment/) settlement: charging $0.04 per call only makes sense when collecting $0.04 costs a small fraction of a cent. Its natural buyer is an autonomous agent mid-task, not a developer provisioning infrastructure in advance, which turns discovery into a distinct problem: the API must be found by, or offered to, software making real-time purchasing decisions. That is the role of directories such as the [x402 Bazaar](/x402-bazaar/). The machine-payable API is one side of a two-sided market in which sellers list priced resources, buyer-agents discover and pay for them, and a discovery layer does the matchmaking. It is the supply side of [agent-to-agent commerce](/agent-to-agent-commerce/).

## What are its limits?

A correct payment boundary does not guarantee sales. The 561 Group's own paid ephemeris gateway, an x402 seller priced at $0.04 and $0.32 per call, took a handful of payments from two or three strangers between 2026-07-22 and 2026-07-26 and then went quiet. Our diagnosis, documented in [x402 Bazaar and agent-market resource discovery](/x402-bazaar-and-agent-market-resource-discovery/), was product fit: a free overlapping MCP tool and subscription services with generous free tiers undercut the $0.04 price, and agents had little organic need for the product. Two lessons generalize.

- **Check the nearest free substitute.** A price should be compared with the reach of the nearest free alternative, not only the nearest paid competitor, before distribution is blamed.
- **"Nothing yet" and "nothing lately" differ.** The first is a discovery problem; the second is a retention or product problem. Read the ledger before writing the postmortem.

Market-wide, catalog data from 2026-08-27 showed revenue concentrated in few resources and the most-used ones receiving about one call per payer. Settlement volume figures are contested; see [the x402 economy](/x402-economy-machine-payable-markets/). Security research from May 2026 also found flaws in how payments bind to resources, relevant to anyone who sells this way.

## Related

- [What is x402?](/what-is-x402/), [x402 facilitator](/x402-facilitator/), [x402 Bazaar](/x402-bazaar/), [machine-payable API](/machine-payable-api/), [micropayment](/micropayment/), [agent-to-agent commerce](/agent-to-agent-commerce/)
- Evidence and measurement: [The x402 economy, September 2026](/x402-economy-machine-payable-markets/), [x402 Bazaar and agent-market resource discovery](/x402-bazaar-and-agent-market-resource-discovery/)
- Sites: [market.561.group](https://market.561.group/), [561.group](https://561.group/), [engineering.561.group](https://engineering.561.group/), [operations.561.group](https://operations.561.group/), [services.561.group](https://services.561.group/)
