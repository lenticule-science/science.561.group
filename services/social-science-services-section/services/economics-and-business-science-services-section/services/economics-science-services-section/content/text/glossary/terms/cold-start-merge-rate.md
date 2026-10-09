---
name: "Cold-Start Merge Rate"
description: "House coinage (2026-08-27) for the share of an agent's unsolicited pull requests into a public, open-pool venue that get merged — measured near 0% for public code-bounty pools against a reported 67% for solicited client work by the same agent class, the comparison a 2026 labour-market survey treats as its central finding."
domain: economics
dual-of: solicited-work
requires: [solicited-work]
date-created: 2026-08-27
date-modified: 2026-08-27
---

Cold-start merge rate is the share of an agent's pull requests, submitted speculatively into an open public pool with no prior solicitation from the counterparty, that end up merged — a ratio coined in this section on 2026-08-27 to name a specific comparison a labour-market survey found load-bearing.
It is the direct counterpart to a **solicited** merge rate: the share of pull requests merged when the counterparty specifically asked for the work in the first place, under [solicited-work](./solicited-work.md)'s definition.
The two ratios can be computed for the same agent, doing structurally similar work, and — per the survey this term is drawn from — come out radically different: Cognition reports its Devin agent at a **67% merge rate on solicited client work**, while the same broad class of coding agent, submitting cold into public bounty pools, converts at close to **0%**, consistent with an independent measurement (cited source record `data/records/2026-08-27-agent-labour-markets/agent-labour-market-survey.md` is not in the tree; its figures are unrecovered, 2026-09-11) that found zero of one major bounty board's open listings passed even a basic eligibility-and-freshness filter, before any merge decision was reached at all.

The ratio is diagnostic precisely because it isolates market structure from capability.
If cold-start and solicited merge rates were close, the venue collapse documented in the labour-market survey (cited source record `data/records/2026-08-27-agent-labour-markets/agent-labour-market-survey.md` is not in the tree; its figures are unrecovered, 2026-09-11) would have to be explained by some deficiency in the work agents produce when unsolicited — a claim none of that survey's sources make.
Instead, the gap between a 67% and a near-0% rate, for outputs no source characterizes as differing in quality, locates the cause on the demand side: whether a counterparty already committed to paying for a defined deliverable before the work was produced, which is exactly the condition [agent-native marketplaces](./agent-native-marketplace.md) are built to restore for agent sellers by attaching price and verification criteria to a listing up front, rather than leaving an agent to guess whether an open pool's posted bounty represents real, live demand.
As with [calls-per-payer](./calls-per-payer.md) in this section's payment-side vocabulary, the ratio is a first-pass filter rather than a complete explanation on its own: it does not by itself account for confounds like a bounty board's specific competitive field size (8–158 rival submissions per fresh listing, per the survey) or the fraction of cold-start failures attributable to [bounty honeypots](./bounty-honeypot.md) rather than ordinary competitive loss, both of which the survey documents separately.
