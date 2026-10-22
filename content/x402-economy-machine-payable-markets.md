---
title: "The x402 Economy: Machine-Payable Markets, Measured (September 2026)"
summary: "x402 lets software pay per HTTP request; filtered settlement was about $15-26M in sixteen months, not the $135M raw figure, and little is provably agentic."
date-created: 2026-09-27
type: article
status: active
visibility: public
tags: [x402, micropayments, machine-payable-api, market-measurement, stablecoins, agent-commerce]
keywords: [x402, HTTP 402, machine-payable API, stablecoin micropayment, x402 Foundation, GENIUS Act, agentic payments, x402 market size]
references:
  w3-status: { type: webpage, title: "Status codes in HTTP (early World Wide Web specification)", URL: "https://www.w3.org/Protocols/HTTP/HTRESP.html" }
  rfc9110: { type: report, title: "RFC 9110: HTTP Semantics, section 15.5.3 (402 Payment Required)", issued: { date-parts: [[2022, 6]] } }
  l402: { type: webpage, title: "L402 (Lightning Labs)", URL: "https://github.com/lightninglabs/L402" }
  x402v2: { type: webpage, title: "x402 specification, version 2", URL: "https://github.com/coinbase/x402/blob/main/specs/x402-specification-v2.md" }
  cdpfacilitator: { type: webpage, title: "CDP x402 facilitator core concepts", URL: "https://docs.cdp.coinbase.com/x402/core-concepts/facilitator" }
  lfx402: { type: webpage, title: "Linux Foundation announces operational launch of x402 Foundation", URL: "https://www.linuxfoundation.org/press/linux-foundation-announces-operational-launch-of-x402-foundation-to-standardize-internet-native-payments-for-ai-agents-and-applications" }
  stripempp: { type: webpage, title: "Machine Payments Protocol (Stripe)", URL: "https://stripe.com/blog/machine-payments-protocol" }
  cfgateway: { type: webpage, title: "Cloudflare Monetization Gateway", URL: "https://blog.cloudflare.com/monetization-gateway/" }
  chainalysis: { type: webpage, title: "Inside x402 (Chainalysis)", URL: "https://www.chainalysis.com/blog/x402-agentic-payments-adoption/", issued: { date-parts: [[2026, 6, 3]] } }
  mcglynncounter: { type: webpage, title: "The x402 counter has shown the same four numbers since March", URL: "https://www.danielmcglynn.com/the-x402-counter-has-shown-the-same-four-numbers-since-march/", issued: { date-parts: [[2026, 9, 6]] } }
  fiveattacks: { type: article, title: "Five Attacks on x402 Agentic Payment Protocol", note: "arXiv 2605.11781, 2026-05-12" }
  freeriding: { type: article, title: "Free-Riding the Agentic Web: A Systematic Security Analysis of x402 Payments", note: "arXiv 2605.30998, 2026-05-29, revised 2026-06-22" }
  occproposed: { type: webpage, title: "Implementing the GENIUS Act (OCC proposed rule), Federal Register", URL: "https://www.federalregister.gov/documents/2026/03/02/2026-04089/implementing-the-guiding-and-establishing-national-innovation-for-us-stablecoins-act-for-the", issued: { date-parts: [[2026, 3, 2]] } }
---

# The x402 Economy: Machine-Payable Markets, Measured (September 2026)

x402 is an open protocol that revives the HTTP 402 "Payment Required" status code so a program can pay for a single web request, usually in a US-dollar stablecoin, without an account or API key. As of September 2026 the published market figures disagree by roughly an order of magnitude on dollar volume; the best filtered estimates put plausible commerce between about $15 million and $26 million over the protocol's first sixteen months, and only a small part of that is demonstrably agentic. This article is an evidence summary: each figure carries its date and what it counts, and we say what is measured and what is inferred.

## What is HTTP 402 and why did it sit unused for thirty years?

HTTP 402 is a status code that has existed since the early web. The 1994 revision of the early World Wide Web status list says of 402 that its parameter "gives a specification of charging schemes acceptable. The client may retry the request with a suitable ChargeTo header" [@w3-status]. No ChargeTo header was ever specified. Every HTTP/1.1 specification since (RFC 2068 in January 1997, RFC 2616 in June 1999, RFC 7231 in June 2014) says the code is reserved for future use, and RFC 9110 (June 2022) still says "The 402 (Payment Required) status code is reserved for future use" [@rfc9110]. These quotations were checked verbatim on 2026-09-27.

The 1990s micropayment systems (see [micropayment](/micropayment/)) failed on cost and on attention rather than on cryptography. Two classic arguments are worth knowing. Nick Szabo's 1999 essay on mental transaction costs held that deciding whether a tiny purchase is worth making costs more than paying; Clay Shirky's 2000 essay argued that users refuse many small, unpredictable decisions. Neither argument addresses a buyer that is a program operating under a budget. That is the opening x402 claims.

x402 was not the first revival. Lightning Labs published LSAT in 2020, later renamed L402 [@l402]. The server answers 402 with a `WWW-Authenticate: L402` header carrying a macaroon (a bearer credential) and a Lightning invoice; the client pays and retries with an `Authorization: L402` header. Secondary sources give the rename year as 2023 or 2024, and no primary source we read settles which.

## How does x402 work?

In x402 a client requests a resource; a server that wants payment answers HTTP 402 with a machine-readable payment requirement; the client signs a payment and retries the same request with a payment header; the server verifies and returns the resource. Version 2 of the specification [@x402v2] uses three Base64-encoded JSON headers: `PAYMENT-REQUIRED` (server, with the 402), `PAYMENT-SIGNATURE` (client, on the retry) and `PAYMENT-RESPONSE` (server, with the resource). These replace version 1's `X-PAYMENT` and `X-PAYMENT-RESPONSE`.

Other version 2 details recorded from the specification:

- Networks are named with CAIP-2 identifiers (for example `eip155:8453`).
- A payment requirement lists `scheme`, `network`, `amount`, `asset`, `payTo`, `maxTimeoutSeconds` and `extra` inside an `accepts` array.
- Extensions declare `info` and a JSON Schema. Bazaar discovery (see [x402 Bazaar](/x402-bazaar/)) is one extension.
- A [facilitator](/x402-facilitator/) exposes `POST /verify`, `POST /settle` and `GET /supported`.
- The `exact` scheme settles on EVM chains through EIP-3009 `transferWithAuthorization` and on Solana through SPL `TransferChecked`.
- The specification also names MCP and A2A as transports.

The Coinbase-operated facilitator, as documented on 2026-09-27 [@cdpfacilitator], supports `exact`, `upto` and `batch-settlement` on EVM networks (Base, Polygon, Arbitrum, World) and `exact` and `upto` on Solana. The first 1,000 on-chain settlements a month are free, then $0.001 each, and it screens for OFAC sanctions and "know your transaction" risk, declining sanctioned or high-risk addresses.

## What is the timeline of x402 and its governance?

| Date | Event | Source status |
|---|---|---|
| May 2025 | Coinbase releases x402 with AWS, Anthropic, Circle and NEAR as launch collaborators; Apache 2.0 reference implementation | Launch page returned 403 to automated fetch; corroborated by several secondary reports |
| 2025-09-23 | Coinbase and Cloudflare announce intent to form an x402 Foundation | Coinbase blog (403 to fetch); CoinDesk, 2026-04-02 |
| 2025-10-14 to 10-20 | The PING token, minted entirely through 1-USDC x402 payments, drives a weekly transaction jump of roughly 10,000% | Chainalysis, 2026-06-03 [@chainalysis] |
| 2025-12-11 | x402 V2 released | CoinDesk; x402.org |
| 2026-02-11 | Stripe accepts x402 payments in USDC on Base | Secondary reports; Stripe documentation not read |
| 2026-03-18 | Stripe and Tempo publish the Machine Payments Protocol (MPP) [@stripempp] | Primary |
| 2026-04-02 | The Linux Foundation announces it will host the x402 Foundation | CoinDesk |
| 2026-07-01 | Cloudflare announces its Monetization Gateway for x402 payment on pages, APIs, datasets and MCP tools [@cfgateway] | Primary |
| 2026-07-14 | Operational launch of the x402 Foundation at the Linux Foundation [@lfx402] | Primary |

At the July launch the Foundation had 17 premier members (Adyen, AWS, American Express, Circle, Cloudflare, Coinbase, Fiserv, Google, Mastercard, Monad Foundation, MoonPay, Ripple, Shopify, Solana Foundation, Stellar Development Foundation, Stripe, Visa), 18 general members and 5 associate members, 40 in all.

## How does x402 relate to other agent-payment protocols?

The protocols divide the problem more than they compete for it. Our reading, as of 2026-09-27:

- **Agentic Commerce Protocol (ACP)**, OpenAI and Stripe, Apache 2.0, 2025-09-29: agent-initiated checkout for human-present shopping, using a scoped payment token charged by the merchant's own provider.
- **Agent Payments Protocol (AP2)**, Google, 2025-09-16: signed mandates proving a user authorized a specific purchase, rail-neutral across cards, bank transfers and stablecoins, including an x402 extension.
- **Machine Payments Protocol (MPP)**, Stripe and Tempo, 2026-03-18: stablecoins on Tempo plus cards through Shared Payment Tokens. Stripe says it supports both MPP and x402.
- **Card-network programs**: Visa's Trusted Agent Protocol and Mastercard's Agent Pay authenticate the agent and tokenize the card; they do not add a settlement rail. Both networks are x402 Foundation premier members.
- **L402**: the Lightning Network equivalent described above.

Put simply, ACP and AP2 answer "did a person authorize this checkout"; x402, MPP and L402 answer "how does one HTTP request carry its payment"; the card programs answer "is this agent who it claims to be."

## How big is the x402 market? What the measurements show

Every published figure counts something different. The table lists each with its scope and our reading as of 2026-09-27.

| Figure | What it counts | Source and date | Reading |
|---|---|---|---|
| "Over 100M payments" since May 2025 | All settlements, unfiltered | x402.org V2 post | Supported as a raw count; says nothing about commerce |
| 75.41M transactions, $24.24M, 94.06K buyers, 22K sellers, labeled "last 30 days" | The x402.org dashboard counter | Independent analysis, 2026-09-06 [@mcglynncounter] | Refuted as a 30-day figure: the same four numbers appeared from March through September 2026 |
| $135.7M over 178.3M transactions raw, to 2026-04-21; $15.0M over 109.6M after filtering wash trading and tests (about 89% of value and 39% of transactions removed) | Raw and filtered settlement | Visa and Artemis report, July 2026, via secondary reports; report itself not read | Best filtered figure found |
| $52.7M over 198.9M settlements (Base, Solana, Polygon, from May 2025); $25.62M after removing self-dealing; 0.6% to 7.5% of that value plausibly from AI agents; 99.6% in USDC | Settlement, then agentic share | TRM Labs, reported 2026-09-15 | Supported; the agentic share is a range because agency is not visible on chain |
| About $28,000 a day, about 131,000 transactions a day, average about $0.20, about half of activity "gamed" | Daily activity, March 2026 | CoinDesk, 2026-03-11 (Artemis data) | Supported |
| Daily settlement down 93% year to date; 7-day average about $41,800; Q4 2025 days near $800,000, some above $1M | Daily settlement, mid-2026 | CCN, 2026-08-13 (Helios Analytics) | Supported |
| More than 100M cumulative transactions on Base through Q1 2026; share of volume in payments of $1 or more rose from 49% to 95% | Base only | Chainalysis, 2026-06-03 | Supported |
| 14,841 Bazaar resources, $30,627 in 30-day catalog revenue, $21,000 of it from one gift-card seller | One facilitator's catalog | Lenticule Science measurement, 2026-08-27 | Supported for that catalog; the catalog is not the market |

### Why do the totals disagree by an order of magnitude?

Raw settlement counts include self-payments, wash trading to inflate protocol metrics, developer tests, and a token launch (PING) that used payments as its minting mechanism. Filtered, the protocol settled somewhere between $15 million (Visa and Artemis, to April 2026) and about $26 million (TRM Labs, to September 2026) of plausible commerce in its first sixteen months. The two filtered figures cover different periods and different methods, so they bracket a range rather than confirm each other.

### What is measured and what is inferred?

Measured: raw on-chain settlement counts and values, and a catalog's published call counts. Inferred: which payments are "real commerce" (a filtering judgment), and which are agent-originated (TRM states a script and an agent leave identical records, so agent share can only be bounded). A figure labeled "30 days" that never changed for six months is a reminder to check dashboards against dated independent observation before citing them.

**Correction, 2026-10-21: the August reading is one snapshot, not the market's character.** It describes the Bazaar catalog on 2026-08-27 and says nothing about growth. A single snapshot of a young market's size cannot justify deferring entry; a market observation used that way must be a dated series that measures growth. The x402 Foundation's dashboard read about 75.41 million payments and $24.24 million of volume over 30 days on 2026-10-18, against about 292,674 trailing-30-day Bazaar calls in the August catalog. The units differ, so no growth rate follows from the pair, but the August reading did not foresee the October one. Read the August figures as a dated observation, never as evidence that the market was too small to enter.

A later caution, added from the October 2026 follow-up work: one reading of the Bazaar catalog against Base USDC authorization events had been used to claim the catalog undercounts x402 settlement. That claim was retracted on 2026-10-17 because the two numbers count different units; see [x402 Bazaar and agent-market resource discovery](/x402-bazaar-and-agent-market-resource-discovery/).

## What did the Group's own x402 seller sell?

The 561 Group operates a paid ephemeris (astronomical position) gateway, its first x402 seller, priced at $0.04 and $0.32 per call. Its record disagrees with itself. One 2026-08-27 note tables six settlements totaling $0.52, of which two were self-tests and four came from two strangers between 2026-07-22 and 2026-07-26. A second note says seven settlements totaling $0.52, and a third gives 0.519488 USDC across seven. Six payments of $0.04 and one of $0.32 cannot total $0.52 (a seventh $0.04 payment would give $0.56), so the balance, count and prices do not reconcile. We hold the reading open until the payee address is read on chain again. What all three agree on is a handful of payments, mostly $0.04, from two or three strangers, then silence. We treat this as an honest small-sample data point about demand for one niche product, not as a measure of the market. See [machine-payable API](/machine-payable-api/).

## What are the security findings?

Two papers from May 2026 examine the protocol's weaknesses. "Five Attacks on x402 Agentic Payment Protocol" [@fiveattacks] targets authorization, the binding between payment and service, replay protection, web-layer handling, and the gap between synchronous HTTP and asynchronous settlement, validated on local chains, Base Sepolia and live endpoints. "Free-Riding the Agentic Web" [@freeriding] identifies four flaw classes (cross-resource substitution, duplicate-settlement races, allowance overdraft, denial of settlement) and reports resource leakage reaching 100% against official SDKs and production deployments; the findings were disclosed to vendors.

TRM Labs adds the compliance angle: the question is who is paying, not whether software paid, and agent registries are voluntary. It reports stablecoins at 95% of inflows to sanctioned entities in 2025, which is context for why facilitators screen.

## What does US law say?

The GENIUS Act was enacted 2025-07-18. Only a permitted payment stablecoin issuer may issue a payment stablecoin in the United States, by one of three routes: an insured bank's subsidiary, a federal qualified issuer approved by the OCC, or a state qualified issuer. Regulators had until 2026-07-18 to write implementing rules, and the Act takes effect on 2027-01-18 or 120 days after final rules, if earlier. The OCC's proposed rule was published 2026-03-02 with comments closed 2026-05-01 [@occproposed].

No source we read settles whether a seller or facilitator taking x402 payments is a money transmitter under state law, how micro-income is reported for tax, or how consumer-protection dispute rules apply to push payments that have no chargeback. These are open questions, and this article gives no legal advice.

## What remains unresolved?

- The Visa and Artemis report was read only through secondary accounts; its methodology should be read directly.
- Stripe's x402 documentation and the Coinbase launch page returned 403 to automated retrieval, so their dates rest on corroborating secondary reports.
- The Group's gateway settlement count needs one on-chain read to settle.

## Related

- Definitions: [What is x402?](/what-is-x402/), [x402 facilitator](/x402-facilitator/), [x402 Bazaar](/x402-bazaar/), [machine-payable API](/machine-payable-api/), [micropayment](/micropayment/), [agent-to-agent commerce](/agent-to-agent-commerce/)
- Companion article: [x402 Bazaar and agent-market resource discovery](/x402-bazaar-and-agent-market-resource-discovery/)
- The x402 market of the 561 Group: [market.561.group](https://market.561.group/)
- Sibling sites: [561.group](https://561.group/), [engineering.561.group](https://engineering.561.group/), [operations.561.group](https://operations.561.group/), [services.561.group](https://services.561.group/)
