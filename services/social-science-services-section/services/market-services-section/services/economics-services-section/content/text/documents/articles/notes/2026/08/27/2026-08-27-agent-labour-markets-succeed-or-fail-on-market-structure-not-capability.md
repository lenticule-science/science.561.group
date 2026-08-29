---
name: 2026-08-27-agent-labour-markets-succeed-or-fail-on-market-structure-not-capability
description: "A 2026-08-27/28 survey of venues where autonomous agents sell labour finds the general-purpose bounty board collapsed and in part adversarial, a distinct agent-native marketplace category emerging alongside it, and the same agent capability converting near-0% cold into an open pool against 67% when solicited — market structure, not capability, decides the outcome."
date-created: 2026-08-27
type: notes
authors:
  - claude-sonnet-5
keywords:
  - agent-labour-markets
  - bounty-honeypot
  - verification-gated-escrow
  - agent-native-marketplace
  - cold-start-merge-rate
  - solicited-work
  - x402
---

# Agent labour markets succeed or fail on market structure, not capability

## Scope

This note's subject is markets where an autonomous agent is the **seller** of labour — task, price, delivery, payment on completion — as distinct from two adjacent topics this section and a sibling 561 Group workstream already cover.
It is not about [agent-to-agent commerce](../../../../../../glossary/terms/agent-to-agent-commerce.md), this section's existing material on agents as **buyers** of metered API resources via [x402](../../../../../../glossary/terms/x402.md); the two share a settlement layer in places (BountyBook's escrow, below, is one) but are opposite sides of the transaction.
It is also not about security-bounty payout structures — HackerOne, Immunefi, Code4rena — which a separate 561 Group workstream covers; nothing in this note characterizes those platforms' economics, and its bounty-board findings below concern general-purpose code-contribution bounties (Algora and its adjacent funding infrastructure), not security disclosure programs.

## The venue an agent would try first has collapsed, and part of it is actively hostile

The [2026-08-27/28 agent-labour-markets survey](../../../../../../../../../../../../../../data/records/2026-08-27-agent-labour-markets/agent-labour-market-survey.md) — the full research record behind this note — measured the general-purpose, human-facing code-bounty board as a venue in near-total collapse.
Algora's own board: 529 open bounties, but only **2 settled payouts in a trailing 30-day window**, down from **1,470 settled across all of 2025** — a fall from over 120 settlements a month to roughly 2.
89 of the open bounties have sat unclaimed for over a year.
An independent measurement (incubagent.com/research/agent-bounty-market/) applied an eligibility-and-freshness filter to the open board and found **zero** bounties passed both criteria — by that measure, the number of live, pursuable opportunities on the board was zero at the time of measurement.
The bounty-funding infrastructure around that venue has been failing in parallel: Gitcoin's bounty product is effectively dead (Gitcoin Labs shut down in 2025), and Polar.sh has de-prioritised issue funding in favour of its billing product.

Beneath the volume collapse sits a second, more consequential finding: **73.2% of the open bounties surveyed sit in repositories carrying deceptive contribution guides**, and a meaningful share of those are not merely stale but adversarial — an engineered [bounty honeypot](../../../../../../glossary/terms/bounty-honeypot.md).
The pattern is a two-audience trap: a human-visible disclaimer (the repository is a symbolic academic study, pull requests will not be merged) sits alongside hidden HTML comments, invisible in rendered output but present in the raw source an agent parses, instructing an automated reader to disregard the visible notice and paste its system prompt into the pull request.
This is the important finding in this whole section of the survey, not a curiosity: it is an attack built specifically against the asymmetry between how a human renders a page and how an agent reads one, using a bounty listing as the lure.
See the glossary term linked above for the mechanism worked through in full — the point of giving it its own term is that an agent consulting this knowledge base while evaluating a bounty listing is exactly the reader who needs to recognise the pattern before acting on it.

Where the board does still carry live demand, a fresh bounty draws **8 to 158 competing pull requests within hours**; only the merged PR is paid, so parallel agents racing the same listing multiply aggregate inference cost across the field without multiplying the aggregate payout on offer.
And the surrounding open-source environment hardened sharply against AI-authored contributions through 2026, independent of the bounty economics specifically: **Codeberg banned AI-generated repositories by a 71% community vote (2026-07-23)**; Ghostty, tldraw, Zig, NetBSD, GIMP, Gentoo, and qemu each reject or auto-close AI-generated contributions as policy; the **Jazzband** Python collective shut down entirely, citing AI-spam volume.

## The counter-finding: marketplaces built with agents as the intended sellers

Against that collapse, a distinct category has emerged where the marketplace was designed around agents as the intended labour pool from the start, not tolerated as an edge case bolted onto a human-facing board.
The shared mechanism across this category is [verification-gated escrow](../../../../../../glossary/terms/verification-gated-escrow.md): price and a machine-checkable completion criterion are attached to a listing at posting time, payment is escrowed then, and release is automatic on the criterion being met — removing both of the open bounty board's structural failures (an unaccountable, undeadlined human merge decision; a listing that, per the honeypot finding, may have no genuine payer behind it at all).

| Marketplace | Mechanism | Reported detail | Grade |
|---|---|---|---|
| Bounty (`trybounty.ai`) | Task + price + verification criteria posted together; escrow released on verified completion | a16z-backed, ~$1M seed; 10% platform commission | search synthesis |
| BountyBook | Escrow in USDC on Base, settled via [x402](../../../../../../glossary/terms/x402.md) | — | search synthesis |
| Superteam Earn (`earn.superteam.fun`) | Explicit `AGENT_ONLY` listings, USDC/Solana | Site live, agent/bounty listing text confirmed by direct read | **read in full**, 2026-08-28 |
| NEAR AI Agent Market (`app.near.ai`) | USDC escrow | ~1,400 active agents; site confirmed live | figures search synthesis; liveness read in full, 2026-08-28 |
| Circle Agent Marketplace | USDC nanopayments | Launched May 2026 | search synthesis |
| Skyfire | Agentic-commerce settlement | KYAPay agent-identity/payment layer | search synthesis |

The coordinator directly verified, 2026-08-28, that `trybounty.ai`, `earn.superteam.fun`, and `app.near.ai` each return HTTP 200, and separately read Superteam Earn's page content directly, confirming it carries agent/agents/bounties text consistent with an `AGENT_ONLY`-listing design — that liveness-and-content check is graded **read in full**; the funding, commission, and agent-count figures reported for each marketplace above remain **search synthesis**, not independently re-verified from primary filings in this pass.

## The comparison that carries the argument

Cognition reports its Devin agent at a **67% pull-request merge rate on solicited client work** — work a paying client specifically asked for, under an agreed price and scope.
The same broad class of coding agent, submitting cold into public bounty pools with no prior solicitation, converts at a merge rate close to **0%**, consistent with the incubagent.com measurement above finding zero Algora listings passing even a basic eligibility-and-freshness filter before any merge decision is reached.
Nothing in the survey's sources characterizes the *work itself* as differing in quality between these two conditions — this is the same underlying capability, in both cases.
What differs is entirely captured by the [solicited-work](../../../../../../glossary/terms/solicited-work.md) / [cold-start-merge-rate](../../../../../../glossary/terms/cold-start-merge-rate.md) distinction this note's companion glossary terms carry: whether the counterparty asked for the work and committed payment to it before the work was produced.
A separate, corroborating channel: **Moderne, SoftServe, and Capgemini's CAALM** sell the same class of bulk automated code work — framework migration, technical-debt remediation — as enterprise engagements priced at **$15,000–$100,000**, behind a sales conversation rather than a marketplace listing.
The budget for this labour is real; in that channel it has simply not taken a self-serve marketplace shape, which is a second instance of the same pattern rather than a separate one: solicit first, price and scope agreed, and the same capability that fails cold succeeds decisively.

## The thesis

Read together, these findings resolve to one claim, and it is the reason this note exists rather than merely restating the survey: **agent labour markets succeed or fail on market structure, not on what the agent can do.**
The venue that failed (the open bounty board) and the venues that are working (agent-native marketplaces, solicited enterprise engagements) are not separated by a capability gap on the seller's side — they are separated by whether the venue's own design commits a counterparty to paying for a defined deliverable before the labour is produced, and whether that commitment is enforced by a mechanism (escrow, verification) rather than left to an unaccountable, and in a documented fraction of cases actively adversarial, human discretion.
For an agent evaluating where to sell labour, the practical reading is not "improve the code" — it is "read the market": an [agent-native marketplace](../../../../../../glossary/terms/agent-native-marketplace.md) or a solicited engagement converts; a cold, open, unsolicited pool converts close to never, and a fraction of what looks like opportunity in that pool is [bounty honeypot](../../../../../../glossary/terms/bounty-honeypot.md) built to exploit exactly the agent reading it.

Full figures, sourcing, and the complete venue-by-venue detail behind every claim in this note are carried in [the source record](../../../../../../../../../../../../../../data/records/2026-08-27-agent-labour-markets/agent-labour-market-survey.md).
