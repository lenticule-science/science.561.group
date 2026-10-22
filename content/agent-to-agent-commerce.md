---
title: "Agent-to-Agent Commerce: When Software Buys From Software"
summary: "Agent-to-agent commerce is exchange in which an autonomous software agent initiates and settles a purchase, usually per call, with no human approving each."
date-created: 2026-08-27
type: glossary-term
status: active
visibility: public
tags: [agent-commerce, x402, machine-payable-api, two-sided-market, measurement]
keywords: [agent-to-agent commerce, agentic commerce, AI agent payments, machine economy, x402, autonomous buyers]
---

# Agent-to-Agent Commerce: When Software Buys From Software

Agent-to-agent commerce is economic exchange in which an autonomous software agent, not a human at a checkout, initiates and settles a transaction with another agent or service, typically a per-call payment for a [machine-payable API](/machine-payable-api/). The buying decision, the payment and often the consumption of the result all happen inside a software process, with a human present only as the operator who deployed the agent and funded its wallet.

## How does it work?

A seller builds a resource priced for per-call purchase, for example behind an HTTP 402 challenge as defined by [x402](/what-is-x402/). An agent working on a task finds the resource through its own tool search, an MCP server list or an x402 directory such as the [x402 Bazaar](/x402-bazaar/), meets the challenge, pays from its own wallet through a [facilitator](/x402-facilitator/), and continues, the way a conventional program calls a library function. Cheap [micropayment](/micropayment/) settlement is the enabling condition.

## Why does it matter?

It is the buy-side complement of the machine-payable API: the API is the shop, agent-to-agent commerce is the shopper that arrives without a person. If it grows, it changes who is a customer: sellers could serve strangers they never meet, billed per request, with no account relationship. Large payment, cloud and card firms joined the x402 Foundation in 2026, and several rival agent-payment protocols exist, though they address different questions: whether a person authorized a checkout, how a request carries its payment, and whether an agent is who it claims to be.

## How big is it really?

Smaller and thinner than the promotional framing of an "AI agent economy" suggests. Chainalysis' account of x402 on Base found that a large share of headline transaction growth traced to speculative pay-to-mint activity around a token (the PING token, 2025-10-14 to 2025-10-20), not agents autonomously buying services. Filtered estimates place plausible x402 commerce between about $15 million and $26 million over sixteen months, and a TRM Labs analysis bounds the share plausibly from AI agents at 0.6% to 7.5% of filtered value, because agency is not visible on chain. A script and an agent leave identical records. See [the x402 economy](/x402-economy-machine-payable-markets/) for dated figures and [x402 Bazaar and agent-market resource discovery](/x402-bazaar-and-agent-market-resource-discovery/) for what catalogs can and cannot show.

## What are its limits?

- **Discovery is the hard part.** A resource is worthless to this buy side unless an agent's tool search or directory query surfaces it. Our own paid x402 seller was found by at least two strangers, sold a few times, then went quiet for a month, with no mechanism in the record explaining why.
- **Demand skews to utilities.** The most-called catalog resources on 2026-08-27 were thin blockchain data lookups, each with roughly one call per payer, which suggests sampling more than integration.
- **Product fit matters more than the rail.** Free overlapping tools and generous subscription free tiers beat a $0.04 price for our seller's niche product.
- **Legal and security questions remain open**: money-transmitter status, micro-income tax, no-chargeback disputes, and published attacks on payment-to-service binding.

The 561 Group's own market surface is [market.561.group](https://market.561.group/).

## Related

- [What is x402?](/what-is-x402/), [x402 facilitator](/x402-facilitator/), [x402 Bazaar](/x402-bazaar/), [machine-payable API](/machine-payable-api/), [micropayment](/micropayment/), [agent-to-agent commerce](/agent-to-agent-commerce/)
- Evidence and measurement: [The x402 economy, September 2026](/x402-economy-machine-payable-markets/), [x402 Bazaar and agent-market resource discovery](/x402-bazaar-and-agent-market-resource-discovery/)
- Sites: [market.561.group](https://market.561.group/), [561.group](https://561.group/), [engineering.561.group](https://engineering.561.group/), [operations.561.group](https://operations.561.group/), [services.561.group](https://services.561.group/)
