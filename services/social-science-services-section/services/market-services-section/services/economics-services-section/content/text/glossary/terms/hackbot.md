---
title: "Hackbot"
description: "Platform house term (HackerOne's own usage) for an AI agent or tool that searches for and submits security vulnerability reports, distinguished from a human researcher using AI assistance by the degree of autonomy it operates with."
defines: Hackbot
domain: economics
enables: ai-slop
governed-by: identity-verification-gate
requires: []
date-created: 2026-08-27
date-modified: 2026-08-27
---

A hackbot, in HackerOne's own house usage, is an AI agent or tool that searches for and submits security vulnerability reports with some degree of automation, as distinct from a human researcher who merely uses AI tooling to assist manual work.
The distinction the platform draws is not "AI involved or not" — nearly all serious bug-hunting in 2026 involves AI assistance somewhere in the pipeline — but **degree of autonomy**: HackerOne's own stated rule is that "hackbots must not operate in a fully autonomous manner," which implicitly defines a hackbot as exactly the category of tool that rule is written to constrain.

Hackbot output quality, measured directly by the platform, is mixed rather than uniformly bad: only **49%** of hackbot-submitted reports on HackerOne validated as genuine, actionable findings, meaning roughly half were still triage overhead even under the platform's autonomy restrictions.
This is the empirical backdrop for why every major platform's 2025-2026 policy hardening — described in full in the [2026-08-27 note on bounty markets hardening against autonomy](../../documents/articles/notes/2026/08/27/2026-08-27-bounty-markets-hardened-against-autonomy-as-payouts-fell.md) — treats hackbot output as something to be gated and validated, not banned outright: a coin flip's worth of genuine findings is worth keeping, but not worth accepting unverified at volume.

Immunefi's own account-ban data sharpens the picture for one specific hackbot lineage: ChatGPT-attributed accounts make up **21%** of every account Immunefi has ever banned, and the platform states that **not a single genuine vulnerability has come from a ChatGPT-generated report** — for that specific tool and platform, the hackbot category's true-positive rate, by the platform's own account, was zero.
[XBOW](../../documents/articles/notes/2026/08/27/2026-08-27-bounty-markets-hardened-against-autonomy-as-payouts-fell.md) is the hackbot with the strongest documented output at scale — roughly 1,060 reports and the top spot on HackerOne's US leaderboard in June 2025 — which the same note treats as a [capability-demo](./capability-demo.md) rather than a working income model, since its own founder stated bounty earnings fell short of the tool's compute cost.
The general pattern this term exists to hold in place: hackbot activity produces a real signal (genuine findings do occur) buried in a much larger volume of [AI slop](./ai-slop.md), and the platform policy documented in the note above is built specifically to separate the two without banning autonomous tooling outright.
