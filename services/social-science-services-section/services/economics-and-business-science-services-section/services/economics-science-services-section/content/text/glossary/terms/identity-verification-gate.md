---
name: "Identity-Verification Gate"
description: "A platform requirement that a participant prove real-world identity, typically via government-ID verification, before submitting or being paid for a finding — a 2025-2026 addition to security bounty platforms specifically built to raise the cost of high-volume automated submission."
domain: economics
restricts: hackbot
requires: []
enables: []
date-created: 2026-08-27
date-modified: 2026-08-27
---

An identity-verification gate is a platform rule requiring a participant to prove real-world identity — typically government-ID verification through a third-party service — before a submission counts or a payout is released.
As a market mechanism, it raises the fixed cost of *entering* the market (creating an account able to submit) without directly touching the marginal cost of any single submission, which makes it a targeted response to strategies that depend on cheap, disposable, or numerous accounts rather than to AI assistance as such.

HackerOne is the clearest documented instance: as of roughly **2026-08-14**, it made government-ID verification via **Veriff** mandatory for all paid bug-bounty programs, and explicitly barred VPN use during the verification step — closing the specific evasion (masking location to appear as a different, fresh identity) the gate would otherwise leave open.
Bugcrowd's March 2026 anti-slop policy pairs the same instrument with a behavioral trigger rather than applying it universally: **10 or more consecutive invalid reports** from one account triggers a 30-day suspension review *plus* a re-run of identity verification, so the gate activates specifically against accounts already showing the low-verification, high-volume submission pattern associated with [AI slop](./ai-slop.md).

The gate's economic logic is straightforward and is documented in full, alongside every other 2025-2026 platform policy response, in the [2026-08-27 note on bounty markets hardening against autonomy](../../documents/articles/notes/2026/08/27/2026-08-27-bounty-markets-hardened-against-autonomy-as-payouts-fell.md): a [hackbot](./hackbot.md) strategy premised on submitting at high volume across many accounts to find at least a few genuine bugs among many slop reports depends on account creation being cheap and near-anonymous, and an identity-verification gate directly raises that cost, without needing to detect or judge any individual submission's content at all.
This makes it a structurally different tool than a ban ladder or an invalidity threshold (both of which act on submission *content* or *pattern*, after the fact) — the gate acts on account *existence*, before a single submission is even made, which is also why platforms pair it with, rather than substitute it for, the content-based mechanisms.
