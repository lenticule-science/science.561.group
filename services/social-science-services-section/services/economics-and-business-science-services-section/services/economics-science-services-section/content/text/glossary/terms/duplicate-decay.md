---
title: "Duplicate Decay"
description: "The rule set by a bug-bounty or audit-contest platform for how much a second, third, or later finder of the same vulnerability gets paid, ranging from a shrinking geometric split to nothing at all — the mechanic that determines whether parallel searching pays off."
defines: Duplicate Decay
domain: economics
component-of: two-sided-market
requires: []
enables: []
date-created: 2026-08-27
date-modified: 2026-08-27
---

Duplicate decay is the rule a security bug-bounty or smart-contract audit-contest platform applies when more than one participant reports the same underlying finding.
It answers a question every such market has to settle somehow: if two people (or two agents) find the same bug, who gets paid, and how much.
No platform examined in the [2026-08-27 note on bounty markets hardening against autonomy](../../documents/articles/notes/2026/08/27/2026-08-27-bounty-markets-hardened-against-autonomy-as-payouts-fell.md) answers this by simply paying everyone in full — every version of the rule reduces the total paid out, the per-finder share, or both, as the duplicate count rises.

The formulas differ by platform but share a shape.
Code4rena decays a finding's award by **0.85^(duplicates-1)**, shrinking the pool available to split before it is even divided among finders, so each additional duplicate costs the group more than a proportional share would suggest.
Sherlock uses **0.9^(n-1)/n**, a shallower decay than Code4rena's applied to the same underlying logic, then divided evenly across the n finders.
Cantina gives the first submitter a **20% bonus** over an otherwise even split among duplicate-finders, rewarding speed without fully punishing the rest.
Conventional bug-bounty platforms — HackerOne, Bugcrowd, Immunefi — use the starkest version: the first valid reporter is paid in full, and every subsequent duplicate reporter is paid **nothing**, a true winner-take-all race rather than a graded split.

The mechanic matters most for any strategy premised on parallelism — running many searchers, human or AI, against the same public codebase to cover more ground.
Because more searchers means more duplicates, and duplicates are decayed, split, or zeroed rather than each paid in full, the *marginal* finding an additional searcher produces is worth systematically less than the *average* finding the platform's headline payout figures imply.
Code4rena's own top-ranked warden gave a direct, first-person illustration of the effect: a self-reported effective hourly rate falling from over $2,000/hour in early 2021 to about $500/hour by late 2021, a roughly fourfold compression within a single year, as per-contest participation grew from roughly 10 wardens to 100-600+ — more finders competing over the same bugs, with duplicate decay dividing the same prize pool among far more of them.
In the strict bug-bounty case (first-reporter-paid-in-full, rest paid nothing), duplicate decay is the specific mechanism that makes an [AI operator](../../documents/articles/notes/2026/08/27/2026-08-27-bounty-markets-hardened-against-autonomy-as-payouts-fell.md) racing against a platform's existing human and bot population a genuinely adversarial, not merely competitive, position: being second costs everything spent finding the bug, for zero return.
