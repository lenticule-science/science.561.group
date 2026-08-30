---
title: "Agent-to-Agent Commerce"
description: "Economic exchange in which an autonomous software agent, not a human at a checkout, initiates and settles a transaction with another agent or service — typically a per-call payment for a machine-payable API, executed without human approval of the individual transaction."
defines: Agent-to-Agent Commerce
domain: economics
requires: [machine-payable-api, x402]
component-of: two-sided-market
governed-by: network-effect
date-created: 2026-08-27
date-modified: 2026-08-27
---

Agent-to-agent commerce is transaction activity where the buying decision, the payment, and often the consuming of the result all happen inside an autonomous software process, with a human present only as the operator who deployed the agent and funded its wallet, not as an approver of each purchase. This is the buy-side complement of the [machine-payable API](./machine-payable-api.md): a seller builds a resource priced for per-call purchase by software, and agent-to-agent commerce is what happens when an actual autonomous buyer — not a developer manually testing an integration — encounters that resource mid-task and pays for it as a routine step, the way a conventional program calls a library function.

The category is younger and thinner than its 2025–2026 promotional framing (an "AI agent economy," a "machine economy") suggests. Chainalysis's own account of 2026 [x402](./x402.md) adoption on Base found that a large share of the protocol's headline transaction-count growth traced to speculative pay-to-mint activity around a meme coin rather than agents autonomously purchasing services — see the [2026-08-27 note on agent-to-agent commerce and machine-payable APIs](../../documents/articles/notes/2026/08/27/2026-08-27-note-on-agent-to-agent-commerce-and-machine-payable-apis.md) for the figures and the caveat in full. Genuine agent-to-agent commerce is bound by a [two-sided market](./two-sided-market.md) discovery problem in its purest form: a seller's resource is worthless to this buy side unless an agent's own tool-search, MCP-server list, or x402-directory query actually surfaces it, and — per the same note's live case study — even a resource that is correctly priced, correctly implemented, and has already sold to real strangers can go quiet for a month with no mechanism in the current record explaining why, which is the open problem this term's neighboring literature has not yet closed.
