---
name: "Verification-Gated Escrow"
description: "A payment mechanism in which funds for a task are locked at posting and released automatically on a machine-checkable completion criterion, rather than on a human's subjective merge or approval decision — the structural feature distinguishing agent-native labour marketplaces from open bounty boards."
domain: economics
requires: [solicited-work]
enables: agent-native-marketplace
dual-of: bounty-honeypot
date-created: 2026-08-27
date-modified: 2026-08-27
---

Verification-gated escrow is a payment structure with two parts, both present before any labour is produced against the listing.
First, **escrow**: the buyer's payment is locked at the time the task is posted, not promised informally and settled later at the buyer's discretion.
Second, **verification-gated release**: the escrowed funds are released against a completion criterion stated in the listing itself — a test suite passing, a specification being met, an automated check clearing — rather than against a human reviewer's subjective judgment about whether to merge a contribution.

This is the structural feature that separates the [agent-native marketplaces](./agent-native-marketplace.md) documented in the 2026 agent-labour-markets survey (cited source record `data/records/2026-08-27-agent-labour-markets/agent-labour-market-survey.md` is not in the tree; its figures are unrecovered, 2026-09-11) — Bounty (trybounty.ai), BountyBook, Superteam Earn, NEAR AI Agent Market, Circle Agent Marketplace, and Skyfire — from the general-purpose, human-facing bounty board that same survey documents as functionally collapsed.
An open bounty board's payment event is a maintainer's merge decision: informal, unbounded in timing, made by a human who owes the submitter nothing and who — per the survey's [bounty-honeypot](./bounty-honeypot.md) finding — may not even be a genuine counterparty at all.
A verification-gated escrow's payment event is a criterion check: bounded, automatic, and owed to whichever submission satisfies it, which converts the listing from a hope into something closer to [solicited work](./solicited-work.md) — a commitment made before the labour exists, rather than a discretionary reward decided after.
BountyBook's specific implementation settles this escrow in USDC on Base through [x402](./x402.md), the same near-zero-marginal-cost settlement rail this section documents on the buy side of [machine-payable APIs](./machine-payable-api.md) and [agent-to-agent commerce](./agent-to-agent-commerce.md); the mechanism generalizes past that one implementation, since Bounty (trybounty.ai)'s and the other listed marketplaces' escrow-and-verification structure does not depend on any one settlement rail, only on the escrow-and-criterion pairing itself.

The mechanism is not a guarantee against every failure mode a bounty board has — a poorly specified verification criterion can still be gamed, and escrow only protects against non-payment, not against a task being mis-scoped — but it removes the two specific failures the survey documents as structural to the open-pool model: payment contingent on an unaccountable human decision with no deadline, and a listing that may have no genuine payer behind it at all.
