---
name: "Connection-Oriented Cluster Matching"
date-created: 2026-10-08
aliases:
  - "COCM"
  - "cluster matching"
description: "A variant of quadratic funding that reduces the matching weight of donors who belong to the same cluster of donation behaviour, so that support from many distinct groups earns more match than the same support from one group."
references: {}
---

**Connection-oriented cluster matching (COCM)** modifies the quadratic funding match so that donors who look alike, by shared donation patterns, share the match instead of each adding a full cross-term. Gitcoin's calculator implements it with a friendship matrix over donors and a Markov option, and Gitcoin states it uses it with Passport model-based detection as its Sybil defence ([Gitcoin GG23 Results 2025](https://gov.gitcoin.co/t/gg23-oss-program-quadratic-funding-results/20334)).

It changes who the match favours: the GG23 results post says it moves matching toward projects with a diverse base of support. It is computed off-chain and delivered to contracts as a merkle root.
