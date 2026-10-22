---
title: "x402 Facilitator: The Party That Verifies and Settles Payments"
summary: "An x402 facilitator is an optional third party that verifies a buyer's signed payment, screens it for compliance and submits settlement on-chain for the seller."
date-created: 2026-08-27
type: glossary-term
status: active
visibility: public
tags: [x402, facilitator, settlement, compliance, payments]
keywords: [x402 facilitator, CDP facilitator, verify settle, EIP-3009, OFAC screening, payment verification]
---

# x402 Facilitator: The Party That Verifies and Settles Payments

An x402 facilitator is the party in the [x402](/what-is-x402/) protocol that does the on-chain work a seller would otherwise do itself: given a buyer's signed payment, it verifies the signature, screens the transaction for compliance, submits the settlement transaction on-chain and reports the outcome. The role is optional. A seller with its own settlement infrastructure can skip the facilitator and still speak x402.

## How does a facilitator work?

Coinbase's documentation describes two steps. **Verify** validates signed payments and performs compliance screening (OFAC sanctions and know-your-transaction checks). **Settle** submits validated payments to the blockchain and reports outcomes. In version 2 of the specification a facilitator exposes three HTTP endpoints: `POST /verify`, `POST /settle` and `GET /supported`.

A typical flow: the buyer's client retries a request with a payment header; the seller forwards the payment to a facilitator's verify endpoint; if valid, the seller serves the resource and calls settle. On EVM chains, the `exact` scheme settles through EIP-3009 `transferWithAuthorization`, so the facilitator is mechanically the third party that submits the buyer's signed authorization on-chain.

## What does Coinbase's facilitator support?

As documented on 2026-09-27, Coinbase's CDP facilitator supports:

- **EVM networks** (Base, Polygon, Arbitrum, World): the `exact`, `upto` and `batch-settlement` schemes.
- **Solana**: `exact` and `upto`.
- **Fees**: verification is free; the first 1,000 on-chain settlements each month are free, then $0.001 each.
- **Screening**: it declines sanctioned or high-risk addresses.

It is the dominant instance, but version 2 allows multiple facilitators, and any facilitator may implement discovery.

## Why does the facilitator matter?

It removes blockchain plumbing from sellers, which lowers the cost of becoming a [machine-payable API](/machine-payable-api/). It is also where compliance happens: a script and an AI agent leave identical on-chain records, so screening addresses is the practical control. And it is the hinge to discovery. When a facilitator settles a payment for an endpoint that advertised [x402 Bazaar](/x402-bazaar/) metadata, it can index the endpoint so buyers and agents can find it. Registration is therefore triggered by a completed settlement, not by deployment, so a correct endpoint that has never sold anything has never been listed by that mechanism.

## What are its limits?

- **Trust and concentration.** The facilitator sees payments and can decline them. A dominant facilitator is a chokepoint; the protocol's allowance for multiple facilitators and self-settlement is the mitigation.
- **Security.** Research published in May 2026 describes duplicate-settlement races, allowance overdraft and denial of settlement as flaw classes, and gaps between synchronous HTTP and asynchronous settlement.
- **Regulatory uncertainty.** Whether a facilitator taking x402 payments is a money transmitter under state law is not settled by the sources we reviewed.
- **Catalogs are partial.** A single facilitator's index is not the market; see [x402 Bazaar and agent-market resource discovery](/x402-bazaar-and-agent-market-resource-discovery/).

## Related

- [What is x402?](/what-is-x402/), [x402 facilitator](/x402-facilitator/), [x402 Bazaar](/x402-bazaar/), [machine-payable API](/machine-payable-api/), [micropayment](/micropayment/), [agent-to-agent commerce](/agent-to-agent-commerce/)
- Evidence and measurement: [The x402 economy, September 2026](/x402-economy-machine-payable-markets/), [x402 Bazaar and agent-market resource discovery](/x402-bazaar-and-agent-market-resource-discovery/)
- Sites: [market.561.group](https://market.561.group/), [561.group](https://561.group/), [engineering.561.group](https://engineering.561.group/), [operations.561.group](https://operations.561.group/), [services.561.group](https://services.561.group/)
