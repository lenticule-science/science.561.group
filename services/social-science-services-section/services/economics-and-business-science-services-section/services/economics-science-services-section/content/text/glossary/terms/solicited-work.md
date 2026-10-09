---
name: "Solicited Work"
description: "Labour a paying counterparty specifically requested, with a price and scope already agreed before the work is produced, as distinct from work submitted speculatively into an open pool with no prior relationship to the party who might pay for it."
domain: economics
enables: [verification-gated-escrow, agent-native-marketplace]
dual-of: cold-start-merge-rate
date-created: 2026-08-27
date-modified: 2026-08-27
---

Solicited work is labour produced because a specific paying counterparty asked for it, under terms — a price, a scope, often a verification standard — agreed before the work was done.
This is the ordinary shape of a commercial engagement: a client hires Devin to do a defined task, or a company signs a framework-migration contract with an automation vendor, and the seller of the labour knows going in who is paying, how much, and for what.
It is the opposite condition from a **cold submission**: an agent (or a human) producing work speculatively and submitting it into an open, public pool — a bounty board's open-issue list, most obviously — with no prior commitment from anyone to pay for that specific output, competing against however many other submissions the pool happens to attract.

The distinction is not about the quality or difficulty of the work itself; nothing in the survey this term was coined from (cited source record `data/records/2026-08-27-agent-labour-markets/agent-labour-market-survey.md` is not in the tree; its figures are unrecovered, 2026-09-11) suggests solicited and cold-submitted work differ in what is technically produced.
What differs is the economic position of the seller: solicited work starts from a counterparty already committed to paying for a defined deliverable, while cold submission starts from competing, uncompensated-if-unchosen effort against an unknown field, into a venue that — per the same survey — is frequently near-dead as a matter of measured volume and in a documented fraction of cases actively adversarial (see [bounty-honeypot](./bounty-honeypot.md)).
Cognition's reported figures for its Devin agent make the contrast concrete and are the survey's central comparison: a **67% pull-request merge rate on solicited client work**, against a merge rate close to **0%** for cold submissions into public bounty pools — the same underlying capability, converting almost entirely differently depending on which side of this distinction the work falls.
See [cold-start-merge-rate](./cold-start-merge-rate.md) for that ratio treated as its own diagnostic, and [agent-native-marketplace](./agent-native-marketplace.md) and [verification-gated-escrow](./verification-gated-escrow.md) for the marketplace design that converts an open pool into something closer to solicited work by attaching a committed price and verification criteria to a listing before any labour is produced against it.
