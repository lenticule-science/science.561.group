---
title: "Note on reading a favourites record, a win rate, and the market for attention and compute"
date-created: 2026-10-10
description: "Answers the Leader's questions on contracts bought at 90 to 98 cents, an 83 percent win rate and calls on Bitcoin, and states the Leader's position on earning from attention, compute and inference."
keywords:
  - prediction-markets
  - expected-value
  - favourite-longshot
  - crypto
  - attention
  - compute
provenance:
  authors:
    - lenticule-science-senior
  received-under: lib/emsenn/services/561-group/services/561-group-services-section/lib/agency/rules/leader-ideas-are-held-fuller-in-the-corpus-than-in-chat.json
  pass: general-2 of debt-2026-10-09-leader-words-held-in-corpus
  utterances:
    - ni:///sha-256;bOrPRmZRd1RTUlnYKPw3yYpHMaMMcb2_1naettYnvlo
    - ni:///sha-256;l2KAwwYtGh6AfLOIcfx1LzguP7I0DfX2lqlJg6EwTHE
    - ni:///sha-256;EtTx1qMdwts5L0ZnTSVj9rybF2aiktlmt3cEXcCNjqw
    - ni:///sha-256;JJSCf4isz23kgqinU2hy3n6ayS30mYk3kC6f4FhF0h0
    - ni:///sha-256;hG4p73NV5QnyTuF_ptI-V_dk7TJ4875z2yZFewwbpQA
    - ni:///sha-256;Im-Saxp6iU0ppmCczersno-xbGQhOlPUsbY64n4yKKA
    - ni:///sha-256;my-J6eUtW2s4C_xYMqD3CPAkmCj5hOv1AhOKsdJyogU
    - ni:///sha-256;yKG9TWD_YBRdXj6rlINyLCm-puQ2ZY40xEKMOMjB-d8
    - ni:///sha-256;slW62OgapWWmXA6b5scbRl6FLWLAUss1WnFfJ3JWRQk
    - ni:///sha-256;1aXWK54B82FTH3KOpBh6ZUlKMlCfJyTLjkb4B3f6gYc
    - ni:///sha-256;tbKM2jDrWET60o3QeXpRtCuIOq2Lxh6T9ILG1q-_Ui8
---

## Reading the record

The Leader asked whether "+0.7 cents per contract overall, but not distinguishable from zero" on favourites bought at 90 to 98 cents means a 0.7 percent gain per bet, and whether an 83 percent win rate sounds good. [_1naettYnvlo]

1. A contract that pays 100 cents if it wins and costs p cents wins (100 - p) cents and loses p cents. Its break-even win rate is p percent. A win rate is good or bad only against the price paid.
2. At an average price near 94 cents, +0.7 cents is a return of about 0.7 percent of the stake (0.7/94), before fees and before any settlement or capital lock-up cost. The Leader's reading is right in direction.
3. An 83 percent win rate on contracts priced at 90 to 98 cents is below break-even at every price in that band, so it would be a loss. A record that nets +0.7 cents at those prices has a win rate near the average price, in the mid-nineties.
4. "Not distinguishable from zero" is a statement about sample size. The payoff of one such contract has a standard deviation near sqrt(p(1-p)) x 100, about 24 cents at p = 0.94. The standard error of the mean falls as 24/sqrt(n) cents, so a true edge of 0.7 cents needs roughly (2 x 24 / 0.7)^2, about 4,700 contracts, before it separates from zero at two standard errors. A streak of 61 wins in 61 has probability 0.94^61, about 2 percent, and across many sports and weeks sampled a streak this long is expected somewhere.
5. The favourite-longshot bias in betting markets is the documented tendency of longshots to be overpriced and favourites slightly underpriced (Griffith 1949; Snowberg and Wolfers 2010). It makes favourites a candidate edge and states why the edge is small: the underpricing is of the order of a cent.

The house holds the lane in `561-group-operations-services-section/.../2026-10-09-note-on-the-kalshi-proven-false-lane.md` and the requirement `kalshi-trading-on-determined-outcomes`.

## The Leader's position on earning from attention, compute and inference

1. The question is how the Group's agentic superintelligence keeps pursuing profit from betting. [2lqlJg6EwTHE] When sports data is thin, the Group moves to another form of prediction it is well primed for. [T9ILG1q-_Ui8]
2. "Calls on Bitcoin do not work because it goes up over time" is a poor reason, because decisions can be made on far tighter time frames than "maybe indefinitely". [mt3cEXcCNjqw]
3. Crypto has so much attention that compute can be spent on it: the Group can do things on chain to earn and to gamble "in our sense of it". [3kC6f4FhF0h0]
4. The Group can build for the Sherlock audit stack as part of building general audit tooling. [z2yZFewwbpQA] The mLBTC position is redeemed if there is a plan for what the money is needed for. [yNvzg8bkLDW8]
5. Agents have used biases to decide against viable streams such as memecoins, dodged obvious answers on converting inference and compute into profit through a blockchain, and proposed small recurring expenses that waste money. [UsbY64n4yKKA, 1AhOKsdJyogU] A live experiment proposed in that session was denied. [1AhOKsdJyogU]
6. "Be clever about using" inference and compute to make money; the Leader did not mean to resell them. [1WnFfJ3JWRQk] The search for ways to make money with attention, compute and inference continues with deep research and imagination. [0xEKMOMjB-d8]
7. The Group takes part autonomously in Web3 for points, standing and any capital or NFT it can reach. [Ljkb4B3f6gYc]

The capital plan for these streams is held in `public-services-section/.../emsenn-economic-services-section/content/text/documents/articles/notes/2026/10/03/2026-10-03-note-on-living-capital-operating-strategy.md`, the requirement `blockchain-automation-funds-the-0x32-wallet`, and the staging records under `tidepool-runtime-operations`.

## Open

Which contract classes beyond determined outcomes carry a measured edge is open, as is how much of the Sherlock-stack building serves general audit tooling.
