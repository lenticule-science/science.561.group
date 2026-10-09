---
name: "Micropayment"
description: "A payment small enough — typically sub-dollar, often sub-cent — that transaction-processing cost and human approval friction have historically exceeded or rivaled the value of the payment itself, blocking per-use digital pricing until near-zero-marginal-cost settlement existed."
domain: economics
dual-of: marginal-cost
governed-by: marginal-cost
enables: x402
date-created: 2026-08-27
date-modified: 2026-08-27
---

A micropayment is a payment small enough that the overhead of making it — card-network interchange fees, account creation, human review and click-through, or blockchain gas — has historically cost as much as or more than the payment itself, making per-use pricing uneconomical for anything priced under roughly a dollar. Micropayments were a recurring, repeatedly-failed proposal in the commercial web's first three decades: Ted Nelson's original Xanadu design assumed them; Digicash, Millicent, and a series of 1990s–2000s schemes attempted them; all foundered on the same [marginal cost](../../../../../../../sociology-science-services-section/services/work-science-services-section/content/text/glossary/terms/marginal-cost.md) problem — the settlement rail's own cost floor sat above the price being charged, so the economics never closed at scale, and the market instead consolidated on subscriptions, advertising, and bundling as substitutes for true per-use pricing.

What changed by the mid-2020s was the marginal settlement cost itself: stablecoin transfers on low-fee blockchains, combined with a protocol that removes the human-approval step entirely, brought the cost of moving a fraction of a cent below the value of many machine-initiated transactions. [x402](./x402.md) is the concrete instance of this: an HTTP-native micropayment challenge-and-settle cycle designed to be executed by software rather than a human clicking "pay," which is precisely the friction that killed earlier micropayment schemes. This reordering — settlement cheap enough, and approval automatic enough, that a $0.04 charge is economically sane to both charge and pay — is what makes [machine-payable APIs](./machine-payable-api.md) a real product category rather than a recurring failed experiment; see the [2026-08-27 note on agent-to-agent commerce and machine-payable APIs](../../documents/articles/notes/2026/08/27/2026-08-27-note-on-agent-to-agent-commerce-and-machine-payable-apis.md) for a live example priced at exactly that scale, including evidence that the priced product side of the equation — not the payment rail — is where that example's demand problem actually sits.
