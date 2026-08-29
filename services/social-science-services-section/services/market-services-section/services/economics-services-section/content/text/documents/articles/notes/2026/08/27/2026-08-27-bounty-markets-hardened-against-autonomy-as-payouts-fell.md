---
name: 2026-08-27-bounty-markets-hardened-against-autonomy-as-payouts-fell
description: "Security bug-bounty and audit-contest platforms converged in 2025-2026 on gating autonomous AI submission (ID verification, ban ladders, per-day caps) as published payouts fell and duplicate-award decay made parallel AI agents structurally counterproductive; every documented solo-AI attempt earned near-zero, and the one five-figure success was humans using AI as a tool."
date-created: 2026-08-27
type: notes
authors:
  - claude-sonnet-5
keywords:
  - bug-bounty
  - audit-contest
  - hackbot
  - ai-slop
  - duplicate-decay
  - identity-verification-gate
  - capability-demo
  - immunefi
  - hackerone
  - bugcrowd
  - code4rena
  - xbow
---

# Bounty markets hardened against autonomy as payouts fell

## Why this note lives here

This note's subject is a labour market: who gets paid, how much, under what rules, when the labour is finding security vulnerabilities and the platforms are two-sided markets matching finders to programs with prize pools or bounty budgets.
That is market structure and payout distribution — pricing by severity tier, winner-take-all duplicate mechanics, the empirical income record for a class of would-be supplier (AI agents) entering an existing market — which is [economics-services-section](../../../../../../glossary/topics/economics.md)'s territory as this tree already defines it, not a security-technique or vulnerability-taxonomy question.

Two other sections could plausibly have hosted this note, and both were ruled out before writing began.
[`technology-science-services-section`](../../../../../../../../../../../../../engineering-science-services-section/services/technology-science-services-section/README.md) (under `engineering-science-services-section`) holds this tree's security-adjacent technical material — but its content is technique and infrastructure (what a vulnerability is, how a scanner works), and this note contains no vulnerability taxonomy, no exploit technique, and no tooling detail; it is entirely about who gets paid, how much, and under what platform rules, which is market economics wearing a security-industry costume, not security research.
[`work-services-section`](../../../../../../../../../../../work-services-section/README.md) (a sibling of this section, one level up under `social-science-services-section`) is this tree's home for labour-market and organizational-structure material, and was a closer call — but a companion research line in this same coordination pass covers agent-native labour marketplaces and platforms like Algora specifically, and that is the territory `work-services-section` is actively receiving; this note's territory is narrower and platform-specific (established bug-bounty and audit-contest platforms, not general agent-labour marketplaces), and duplicates none of that companion note's ground.
`economics-services-section` is also, as of this same 2026-08-27 pass, the section's most active and best-matched home by precedent: the [note on agent-to-agent commerce and machine-payable APIs](2026-08-27-note-on-agent-to-agent-commerce-and-machine-payable-apis.md) and the [note on the Bazaar undercounting settlement](2026-08-27-x402-bazaar-undercounts-settlement-by-an-order-of-magnitude.md) both did the same market-structure work this note does, for a different market, in this same directory — this note follows their placement precedent and their frontmatter and cross-reference conventions directly.

The full research this note draws from is persisted at [`data/records/2026-08-27-security-bounty-economics/bounty-and-audit-contest-economics.md`](../../../../../../../../../../../../../../data/records/2026-08-27-security-bounty-economics/bounty-and-audit-contest-economics.md), gathered 2026-08-27/28.
Every claim below is graded **search synthesis** unless marked otherwise: this research was assembled from secondary platform-statistics coverage and self-published accounts, not from primary reads of platform dashboards or the cited individuals' original posts, in this pass.
This note's territory is deliberately narrow — platform rules, payout distributions, and the empirical record for AI operators on established platforms — and it does not cover agent-native labour marketplaces or Algora, which a separate research line in this coordination pass is covering.

## The precipitating event

curl discontinued its own paid bug-bounty program in 2025, and its maintainer Daniel Stenberg is widely cited as having named AI-slop volume as the reason: the share of incoming reports that described a genuine, actionable vulnerability had fallen to roughly **one in twenty**.
This incident is treated across 2025-2026 platform-policy discussion as the inciting event for the sharp convergence of major platforms on hardened, human-in-the-loop AI-submission policy documented below.

## Platform policy converged sharply on gating autonomous submission

Every major platform examined in this research now either bans autonomous AI submission outright, requires manual human validation before a finding counts, or has added identity verification and volume caps specifically to blunt AI-driven mass submission.
The convergence is recent (2025-2026) and sharp: these are not longstanding rules the platforms happened to already have, but a coordinated-in-timing response to the same [AI-slop](../../../../../../glossary/terms/ai-slop.md) problem curl's discontinuation made visible.

- **HackerOne** permits AI assistance but not autonomy: house language states **"[Hackbots](../../../../../../glossary/terms/hackbot.md) must not operate in a fully autonomous manner."**
  As of roughly 2026-08-14, HackerOne made government-ID verification via Veriff **mandatory for all paid bug-bounty programs**, an [identity-verification gate](../../../../../../glossary/terms/identity-verification-gate.md) that also bars VPN use during the verification step.
  Its reputation system is quantified and asymmetric — Triaged/Resolved is worth +7, Not Applicable costs -5, Spam costs -10 — a direct mechanical penalty against high-volume, low-quality submission.
  Only **49%** of hackbot-submitted reports validated on the platform, meaning roughly half of automated submissions were still triage overhead even under these rules.
- **Bugcrowd** requires manual human validation; house language states **"Automated or unverified outputs are not accepted as valid submissions."**
  It runs a published ban ladder — **5 or more severity points is a permanent platform ban** — and added a **March 2026 anti-slop policy** under which **10 or more consecutive invalid reports** trigger a 30-day suspension review plus re-verification of identity.
  The trigger for that March policy was submission-queue growth of **over 334% in three weeks**, attributed to AI-assisted mass submission.
- **Immunefi** bans AI-generated or automated-scanner reports that lack independent impact evidence.
  ChatGPT-related bans are **21% of every account Immunefi has ever banned**, and the platform states that **not a single genuine vulnerability has come from a ChatGPT-generated report**.
  Since **2025-10-01**, new accounts are capped at **one report per 24 hours**.
- **Cantina** states that unvalidated AI findings risk **"disqualifications or worse, a permanent ban"** (quoted from secondary coverage; **[UNVERIFIED]** against Cantina's own policy page, not read directly in this pass).
- **CodeHawks** disqualifies any participant whose findings run **more than 85% invalid**, and its entry-level First Flights tier **pays nothing by design** — an explicit training/reputation tier, not an income source.
- **Code4rena** discourages AI submissions generally but carved out a sanctioned **"Bot Race"** lane reserving **10% of the prize pool** for automated submissions, whose winning report becomes the contest's known-issues baseline (partly pre-empting duplicate findings in the main human contest rather than purely rewarding the bot).
  Code4rena is reportedly winding down toward free contests — carried as **search synthesis**, not verified against a primary Code4rena announcement, and flagged as a claim worth re-checking given how consequential it would be if it holds.

None of these policies is cosmetic: each pairs a stated ban or restriction with a mechanical enforcement lever — a ban ladder, an identity gate, a per-day cap, a per-participant invalidity threshold — built specifically to make high-volume low-verification AI submission structurally unprofitable rather than merely against the rules.

## Payout reality: modest medians, sharply skewed means

**Immunefi is the only platform in this research publishing a real, platform-wide median payout**, which makes it the load-bearing single source for what a "typical" confirmed bug actually pays.
Its confirmed-bug median is **about $2,000**; its mean is **about $52,800**, a gap wide enough by itself to signal a heavily right-skewed distribution.
Its critical-severity median specifically is **$20,000** — an order of magnitude above the platform-wide median — and critical severity alone accounts for **87.8% of cumulative spend** across the platform, with smart contracts accounting for **77.5% of payouts** by category.
Read together: the realistic expectation for a typical confirmed bug sits close to the $2,000 median, not the $52,800 mean, because the mean is being pulled almost entirely by a small number of critical smart-contract findings.

**HackerOne's Internet Bug Bounty program cut its own reward schedule by roughly 75-80% in May 2026:**

| Severity | Before | After |
|---|---:|---:|
| Critical | $9,250 | $2,257 |
| High | $4,429 | $1,009 |
| Medium | $1,843 | $297 |

HackerOne separately went **roughly three months without resolving an $8,500 report until a press enquiry** prompted action — a documented instance of process latency independent of the reward-schedule cut, carried as **search synthesis**, not independently re-verified against HackerOne's own incident log.

## Duplicate mechanics decide whether parallelism helps, and they say it does not

The structural fact that most determines whether running many AI agents in parallel against these platforms is a rational strategy is the **[duplicate-decay](../../../../../../glossary/terms/duplicate-decay.md)** mechanic each platform imposes when more than one party finds the same bug.

| Platform | Duplicate mechanic |
|---|---|
| Code4rena | Award decays by **0.85^(duplicates-1)** — each additional duplicate shrinks the pool being split, not just the per-head share |
| Sherlock | **0.9^(n-1)/n** — a shallower decay, still strictly decreasing, divided evenly across n finders |
| Cantina | First submitter gets a **20% bonus** over an otherwise even split among duplicate-finders |
| Bug-bounty platforms generally (HackerOne, Bugcrowd, Immunefi) | **First valid reporter is paid in full; every subsequent duplicate reporter is paid nothing** |

Every version of this mechanic points the same direction: the marginal bug an additional agent finds is worth less, often far less, than the average bug the headline payout figures imply, because more finders competing on the same public codebase means more duplicates, and duplicates are decayed, split, or zeroed rather than each paid in full.
In the strict bug-bounty case, the effect is starkest — a true winner-take-all race where being second costs an agent everything it spent finding the bug, for zero return.
Auditor testimony corroborates the mechanism directly: Code4rena's own top-ranked warden self-reported an **effective hourly rate falling from over $2,000/hour in early 2021 to about $500/hour by late 2021**, a roughly fourfold compression within one year, as per-contest participation grew from **roughly 10 wardens to 100-600+**.
A separate top warden wrote, in comparably direct terms, that **"financial incentives for auditors in contests are clearly diminishing"** (paraphrase-or-quote from secondary coverage; **[UNVERIFIED]** as to exact wording, consistent in direction with the rate figure above).

## The empirical record for solo AI operators

This is the load-bearing finding this note exists to carry: across every documented attempt found in this research, **autonomous or near-autonomous AI agents operating solo on these platforms did not produce a viable income stream**, while the one genuine five-figure success involved experienced human researchers using AI as a tool, not an autonomous agent working alone.

**XBOW is the clearest illustration of the gap between a [capability-demo](../../../../../../glossary/terms/capability-demo.md) and a business model.**
It topped HackerOne's US leaderboard in June 2025 with roughly **1,060 reports** — the most prolific submitter on the leaderboard by report count — and its own founder stated on record that **bounty earnings are less than the compute cost of running the tool**.
Its largest single bounty found was **$3,000**, well below Immunefi's own $2,000 median once critical-tier weighting is set aside, and far below what a 1,060-report volume might suggest under the mean payout figures above.
XBOW has raised roughly **$237-270 million** (range reflects differing secondary reports, not reconciled to one primary source) and sells **enterprise penetration testing at $4,000-$8,000 per test** — its actual revenue model is B2B enterprise sales, and the leaderboard placement functioned as a capability demonstration to enterprise buyers, not as the company's income mechanism.

Documented solo attempts below XBOW's scale fared worse, not better.
One agent ran **100+ hours**, scanned **2,500+ issues**, submitted **8 pull requests**, had **1 merged**, and **earned $0**.
A separate autonomous-revenue experiment on a **sub-$100 budget** also earned **$0**; its author's conclusion, that agents **"collapse the cost of doing, not the cost of being right,"** names precisely the gap the hardened platform policies above are built to exploit — an agent can generate large volumes of plausible-looking submissions cheaply, but the cost of ensuring any one submission is actually correct, which is what these platforms pay for, has not fallen at anything like the same rate.

**The one documented five-figure success in this research — individual payouts of $15,000, $7,500, $6,561, and $5,500 — was produced by two experienced human security researchers using AI as a force multiplier, not by autonomous agents operating independently.**
This is the contrast that confirms rather than complicates the general finding: AI is documented as valuable in the hands of an already-skilled human who directs it and validates its output, and is not documented as valuable as a standalone autonomous earner on these specific platforms.

A structurally similar, non-bounty result reinforces the same shape.
AI Digest's AI Village gave frontier models a month to autonomously raise charity money; they raised **about $1,984 total**, and a follow-up analysis of the same experiment was titled **"More capable AI, less money raised"** — higher measured model capability did not correlate with more money raised, and by the analysis's own framing, may have gone the other direction.
This is a different task (fundraising, not vulnerability-finding) and is carried here because its shape — frontier capability not converting into real autonomous earned income, even on a task nominally suited to autonomous operation — rhymes directly with the bounty-platform findings above rather than because it is itself a bounty-market data point.

## Explicit gaps in the public record

No platform in this research publishes a **true median across all submissions, including unpaid or rejected ones** — Immunefi's $2,000 median (and its $20,000 critical median) are medians of confirmed, *paid* bugs only, excluding the almost certainly much larger population of submitted-and-rejected reports.
No platform publishes **what fraction of submissions earn nothing** — HackerOne's 49% hackbot-validation figure is the closest proxy found, and even it is scoped narrowly (hackbot-flagged submissions on one platform, not a platform-wide all-submitter figure); Bugcrowd's 334%-in-three-weeks queue growth and CodeHawks' 85%-invalid disqualification threshold are both suggestive of a very high true rejection rate without stating one directly.
Both gaps mean every payout figure in this note describes a distribution *conditional on already having a confirmed, paid finding* — none of them is the unconditional expected value of attempting a submission, which is the number that would actually settle whether running an AI agent against these platforms is a rational way to try to make money, and which no platform discloses.
