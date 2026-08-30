---
title: "Machine-Payable API"
description: "An HTTP API whose payment boundary is designed for an autonomous software caller rather than a human checkout flow — typically metered per call via a protocol like x402, with no account, subscription, or human approval step required to pay."
defines: Machine-Payable API
domain: economics
requires: [x402, micropayment]
enables: agent-to-agent-commerce
component-of: two-sided-market
date-created: 2026-08-27
date-modified: 2026-08-27
---

A machine-payable API is an API that prices and gates access per call, at settlement, in a form a piece of software can satisfy without a human in the loop: no signup form, no stored card, no OAuth consent screen, no invoice — just a payment challenge returned inline with the request and settled inline in response. [x402](./x402.md) is currently the dominant protocol for building one: a route declares a price and a payee address, an unpaid request receives HTTP 402 with the challenge, and a paid retry with proof of settlement receives the resource. This is a distinct design target from a conventional metered API (which meters *after* the fact, against a pre-established account and monthly invoice) and from a subscription API (which prices *access*, not *use*) — a machine-payable API prices the individual call, settled at the moment of the call, to a caller it has never seen before and may never see again.

The category exists because of, and only because of, cheap [micropayment](./micropayment.md) settlement: charging $0.04 per call only makes sense once the cost of collecting $0.04 is itself a small fraction of a cent. Its natural buyer is an autonomous agent mid-task rather than a developer provisioning infrastructure in advance, which is what distinguishes the discovery problem for this category from ordinary API marketing — a machine-payable API needs to be found by, or offered to, software making real-time purchasing decisions, which is the function of catalogs like Coinbase's x402 Bazaar. A machine-payable API is one side of a [two-sided market](./two-sided-market.md): sellers list priced resources, buyer-agents (or the humans operating them) discover and pay for those resources, and a discovery layer — the Bazaar, or one of several competing directories — is the matchmaking mechanism whose absence or presence directly determines whether a correctly-priced, correctly-implemented machine-payable API gets called at all. The [2026-08-27 note on agent-to-agent commerce and machine-payable APIs](../../documents/articles/notes/2026/08/27/2026-08-27-note-on-agent-to-agent-commerce-and-machine-payable-apis.md) works through a live machine-payable API in detail, including a case where the product itself, not the payment mechanism, turned out to be the binding constraint on demand.
