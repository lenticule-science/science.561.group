---
title: "Calls Per Payer"
description: "House coinage (2026-08-27) for total calls divided by unique payers over a time window on a machine-payable API — the diagnostic that separates one integration making repeated calls from a market of one-off samplers, distinct from the raw call or payer count alone."
defines: Calls Per Payer
domain: economics
requires: [x402-bazaar]
date-created: 2026-08-27
date-modified: 2026-08-27
---

Calls per payer is total calls divided by unique payers over a given window — a simple ratio, coined in this section on 2026-08-27 for a specific diagnostic purpose the raw counts alone do not serve.
A [machine-payable API](./machine-payable-api.md)'s own call count and unique-payer count, reported separately, both go up whether the underlying activity is genuine repeat usage by a smaller set of committed buyers or one-time curiosity from a large set of buyers who each tried it once and moved on — two very different market states that look identical in the raw totals.
The ratio is what separates them: **a ratio near 1:1 means each payer called roughly once**, which reads as broad sampling rather than integration; **a ratio meaningfully above 1 means calls are concentrated among fewer payers making repeated calls each**, which is what a genuine integration into a repeated workflow would produce.

The [x402 Bazaar](./x402-bazaar.md) catalog, measured directly by the 561 Group coordinator on 2026-08-27, gives the clean worked example this term was coined to name.
The catalog's highest-unique-payer resources are thin Ethereum JSON-RPC wrappers — ERC-20 balance lookup, ENS resolution, wallet balance, block height, transaction-by-hash — each drawing roughly 1,000 unique payers and roughly 1,000 calls over the trailing 30 days.
A ratio that close to 1:1, across the catalog's *top* resources by demand, indicates something specific: roughly a thousand distinct agents each sampled the endpoint once, not a smaller number of agents each calling it repeatedly as part of an ongoing task.
Even the catalog's most successful resources by raw demand, on this reading, look more like a marketplace of one-off evaluators than a marketplace of production integrations — a finding [the note on the Bazaar undercounting settlement](../../documents/articles/notes/2026/08/27/2026-08-27-x402-bazaar-undercounts-settlement-by-an-order-of-magnitude.md) carries alongside its separate finding about the catalog's visibility gap against on-chain settlement, and the two findings are independent of each other: a resource could have excellent Bazaar visibility and still show a 1:1 ratio, or poor visibility and still show a high one.

**The ratio is necessary but not sufficient on its own, and this section already has a worked case showing why.**
The [agent-to-agent-commerce note](../../documents/articles/notes/2026/08/27/2026-08-27-note-on-agent-to-agent-commerce-and-machine-payable-apis.md)'s corrected finding about the 561 Group's own `paid-ephemeris-gateway` gives a calls-per-payer ratio of 2.0 for its four genuine external settlements (four calls, two distinct external payers: one payer called three times, the other once) — a ratio comfortably above the Bazaar's 1:1 chain-data baseline, which by the ratio alone would read as evidence of real integration.
But the *timing* of those calls tells a different story than the ratio alone does: three calls from one payer arrived across five days and then stopped completely for over a month, a burst-then-silence pattern the note itself characterizes as more consistent with a human manually evaluating the service than with a production integration, which would be expected to show sustained or growing call volume rather than a short burst followed by total silence.
The general point this worked case establishes: calls-per-payer is a ratio computed over a whole window, and a single repeat tester can produce the same ratio a genuine small-scale integration would — distinguishing the two requires looking at how those repeat calls are *distributed in time* within the window, not just how many there were.
Calls-per-payer is therefore best read as a first-pass filter — a ratio near 1:1 is close to dispositive evidence of one-off sampling, since it is hard to manufacture accidentally, while a ratio above 1:1 is suggestive of integration but requires the call-timing check above before it is treated as confirmed.
