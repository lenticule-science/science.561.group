---
name: "AI Slop"
description: "Low-effort, plausible-sounding but substantively wrong AI-generated submissions flooding a review queue faster than reviewers can dismiss them — the specific market failure that pushed security bounty and audit-contest platforms to harden their 2025-2026 AI policy."
domain: economics
requires: hackbot
enables: identity-verification-gate
governed-by: []
date-created: 2026-08-27
date-modified: 2026-08-27
---

AI slop, in the security bounty and audit-contest context, is a submission that reads as plausible — correct terminology, a coherent-sounding vulnerability description, sometimes real code excerpts — but describes a vulnerability that does not exist, does not apply to the actual target, or cannot be substantiated with real impact evidence.
The term names a market failure, not merely a quality problem: the defining feature of AI slop is that it costs its producer very little to generate and costs a human reviewer real time to evaluate and dismiss, so a rising ratio of slop to genuine findings degrades the review queue's economics even if the *absolute* number of genuine findings stays constant.

The clearest documented instance is curl's 2025 discontinuation of its own paid bug-bounty program, cited across 2025-2026 platform-policy discussion as the event that made the problem impossible to ignore: the share of incoming reports describing a genuine, actionable vulnerability had fallen to roughly **one in twenty**.
Bugcrowd's March 2026 anti-slop policy names the same dynamic quantitatively from the platform side — submission queues rose **over 334% in three weeks** — and responded with a volume-based trigger (10 or more consecutive invalid reports) rather than a pure content-based one, because at that scale, screening every submission's content individually was itself the bottleneck AI slop was exploiting.

The full 2025-2026 policy response across every platform examined — bans, ban ladders, [identity-verification gates](./identity-verification-gate.md), per-day submission caps, per-participant invalidity thresholds — is documented in the [2026-08-27 note on bounty markets hardening against autonomy](../../documents/articles/notes/2026/08/27/2026-08-27-bounty-markets-hardened-against-autonomy-as-payouts-fell.md), and every one of those mechanisms is best read as a response to AI slop specifically: each targets the *volume-at-low-verification-cost* strategy that makes slop possible, rather than banning AI assistance itself, which no major platform has done.
This is also the term that connects platform policy to the empirical income record documented in that same note: a separate autonomous-revenue experiment's author concluded that agents "collapse the cost of doing, not the cost of being right" — AI slop is that gap made visible at the platform-queue level, the same gap that produced the near-zero-income results for solo AI operators the note documents at the individual level.
