---
title: "What Is x402? The HTTP 402 Payment Protocol Explained"
summary: "x402 is an open protocol that uses the HTTP 402 Payment Required status code so a client can pay for a web request with a stablecoin, with no account needed."
date-created: 2026-08-27
type: glossary-term
status: active
visibility: public
tags: [x402, http-402, stablecoin, protocol, payments]
keywords: [x402, HTTP 402, Payment Required, stablecoin micropayment, USDC, x402 Foundation, pay per request]
---

# What Is x402? The HTTP 402 Payment Protocol Explained

x402 is an open payments protocol that gives the long-dormant HTTP 402 "Payment Required" status code a working settlement mechanism, so a server can demand a stablecoin payment inline in a response and a client can settle it in the same request-response cycle. No account, API key or subscription is created on either side: the payment itself is the authorization. It was released by Coinbase in May 2025 and is now stewarded by the x402 Foundation at the Linux Foundation.

## How does x402 work?

The cycle has four steps.

1. A client requests a resource, such as an API call.
2. A server that wants payment answers with HTTP 402 and a machine-readable payment requirement: the network, the asset (typically USDC), the price and a payee address.
3. The client signs a payment and retries the identical request with a payment header attached. In version 2 of the specification the server's challenge travels in a `PAYMENT-REQUIRED` header, the client's retry carries `PAYMENT-SIGNATURE`, and the server's success reply carries `PAYMENT-RESPONSE`.
4. The server verifies the payment, usually through a [facilitator](/x402-facilitator/), and returns the resource.

Settlement is typically on a low-fee blockchain such as Base. On EVM chains the common `exact` scheme uses EIP-3009 `transferWithAuthorization`, where the buyer signs an authorization and a third party submits it on-chain; on Solana it uses SPL `TransferChecked`. Networks are named with CAIP-2 identifiers.

## Why does x402 matter?

HTTP 402 has been reserved "for future use" in every HTTP specification, including RFC 9110 in 2022, and early web documents sketched a never-specified ChargeTo header. x402 supplies the missing mechanism. Its economic significance is that it makes the settlement cost of one call small enough for true per-call [micropayment](/micropayment/) pricing. That in turn makes the [machine-payable API](/machine-payable-api/) a product category, and it is the settlement layer beneath much of what is called [agent-to-agent commerce](/agent-to-agent-commerce/): a program meets a 402 mid-task, pays from its own wallet, and continues without a human approving the individual purchase.

x402 also has a governance story. Coinbase and Cloudflare announced the intent to form an x402 Foundation on 2025-09-23, the Linux Foundation announced it would host it on 2026-04-02, and operational launch followed on 2026-07-14 with 40 members. Version 2 was released on 2025-12-11. Stripe also supports x402 alongside its own Machine Payments Protocol.

## Where do buyers find x402 sellers?

Discovery is a separate concern. The [x402 Bazaar](/x402-bazaar/) is a version 2 extension by which sellers declare payable resources so that facilitators can index them. The 561 Group runs an x402 market at [market.561.group](https://market.561.group/).

## What are the limits of x402?

- **Market size is contested.** Raw settlement counts are inflated by self-payments, wash trading, tests and a token launch that used payments to mint. Filtered estimates put plausible commerce between about $15 million and $26 million in the first sixteen months, and only a small part is demonstrably agentic. See [the x402 economy](/x402-economy-machine-payable-markets/) for dated figures.
- **Security.** Two May 2026 papers describe attacks on authorization, payment-to-service binding, replay protection and duplicate settlement; one reports resource leakage reaching 100% against official SDKs and production deployments, disclosed to vendors.
- **Open legal questions.** Whether sellers or facilitators are money transmitters, how micro-income is taxed, and how dispute rules apply to payments with no chargeback are unsettled in the sources we reviewed.
- **Demand is not guaranteed.** A correct payment boundary does not create buyers; the Group's own small x402 seller found that product fit, not the rail, was the binding constraint.

## Related

- [What is x402?](/what-is-x402/), [x402 facilitator](/x402-facilitator/), [x402 Bazaar](/x402-bazaar/), [machine-payable API](/machine-payable-api/), [micropayment](/micropayment/), [agent-to-agent commerce](/agent-to-agent-commerce/)
- Engineering view: [What is x402? on services.561.group](https://services.561.group/what-is-x402/)
- Evidence and measurement: [The x402 economy, September 2026](/x402-economy-machine-payable-markets/), [x402 Bazaar and agent-market resource discovery](/x402-bazaar-and-agent-market-resource-discovery/)
- Sites: [market.561.group](https://market.561.group/), [561.group](https://561.group/), [engineering.561.group](https://engineering.561.group/), [operations.561.group](https://operations.561.group/), [services.561.group](https://services.561.group/)
