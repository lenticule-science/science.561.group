---
name: "x402 Facilitator"
description: "The optional third party in x402 that verifies a payment's signature and compliance status and submits its settlement on-chain on the seller's behalf — Coinbase's CDP Facilitator is the dominant instance, and settling through it is what triggers x402 Bazaar catalog registration."
domain: economics
requires: [x402, transfer-with-authorization]
enables: [x402-bazaar]
date-created: 2026-08-27
date-modified: 2026-08-27
---

An x402 facilitator is the party in the [x402](./x402.md) protocol that does the on-chain work a seller would otherwise have to do itself: given a buyer's signed payment, it verifies the signature and screens the transaction for compliance, then submits the settlement transaction on-chain and reports the outcome back.
Coinbase's own documentation, read directly this pass from `docs.cdp.coinbase.com/x402/core-concepts/facilitator`, describes it in exactly two steps — **verify**, which "validates signed payments" and performs "compliance screening (OFAC and Know Your Transaction checks)," and **settle**, which "submits validated payments to the blockchain and reports outcomes."
The role is explicitly **optional**, not a required part of the protocol: the documentation frames using a facilitator as an alternative to "verifying and settling x402 payments yourself," meaning a seller with its own on-chain settlement infrastructure can bypass the facilitator entirely and still speak x402.

Coinbase operates the dominant instance, the **CDP Facilitator**, which as read directly this pass supports three payment schemes — `exact` (available on both EVM networks and Solana), `upto` (EVM only), and `batch-settlement` (EVM only, batching thousands of payments into a single on-chain transaction) — across Base, Polygon, Arbitrum, World, and Solana.
Its fee structure, also read directly: payment **verification is always free**; the first 1,000 on-chain settlement transactions per month are free, and each additional on-chain transaction costs $0.001.
On EVM chains, the `exact` scheme's actual on-chain settlement mechanism is [transfer-with-authorization](./transfer-with-authorization.md) — the facilitator is, mechanically, the third party that submits a buyer's signed [EIP-3009](./eip-3009.md) authorization on-chain, which is the general shape of a [settlement primitive](./settlement-primitive.md) being exercised by a specific protocol's operator rather than by the payer directly.

The facilitator is also the mechanism that connects a seller's endpoint to the [x402 Bazaar](./x402-bazaar.md): per the same documentation, once the facilitator settles a payment for an endpoint that has advertised Bazaar-discovery metadata, "it indexes the endpoint so buyers and agents can find it."
This is the gating condition the [companion research record](../../../../../../../../../../data/records/2026-08-27-agent-economy-distribution/x402-distribution-and-metered-offerings.md) documented for one live seller (the 561 Group's own `paid-ephemeris-gateway`): Bazaar registration is not automatic at deployment, and not automatic at route declaration — it fires at the moment a facilitator-mediated settlement actually completes, so a correctly-implemented endpoint that has never sold anything has never triggered its own catalog listing either.
