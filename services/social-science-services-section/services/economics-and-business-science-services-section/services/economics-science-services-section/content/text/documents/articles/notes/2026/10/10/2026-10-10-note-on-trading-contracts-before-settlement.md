---
title: "Note on trading prediction-market contracts before settlement, and the games inside a market"
date-created: 2026-10-10
description: "A prediction contract is a state-contingent asset that can be resold before it settles; what the house's theory, outside research and the Leader's statements say about the price-trajectory strategy, execution costs and the other games in Kalshi."
keywords:
  - prediction-market
  - kalshi
  - belief-trajectory
  - market-microstructure
  - brier
  - concurrent-game-systems
provenance:
  authors:
    - emsenn
  office: Lenticule Science Senior (pass kalshi-markets of debt-2026-10-09-leader-words-held-in-corpus)
  utterances:
    - ni:///sha-256;PyOHqaD5Yq3_dWhKw3FTWF_65pBgawoQ0CmFCvRfS1U
    - ni:///sha-256;SCPPvGffY8IOkT9rcVf3B0auSxAnF20OePs_aEMsWHA
    - ni:///sha-256;vtzcTxWiSMrXnSoNofVjKJA9LeXnTdX7ZBabrEZniMY
    - ni:///sha-256;JRYjjUvtNaScO3S4WJzEQNFCFvTL1RF78IpkhMT9wWo
---

## What the house's theory says

1. A prediction contract bought at price p pays USD 1 if the event occurs and USD 0 if not. Before settlement it can be resold at the market's current price. It is therefore a tradable state-contingent asset, not only a wager held to settlement (the Leader, 2026-10-04, relaying another agent's text, which the Leader asked the Group's roles to take up).
2. Two strategies are distinct.
   - **Settlement-value strategy.** Estimate the true probability of the event; buy when the contract is mispriced against it; hold to resolution.
   - **Price-movement (belief-trajectory) strategy.** Estimate how the market price will change before resolution; buy because other participants are expected to reprice upward; sell before settlement.
3. Worked example, as stated: a YES contract trades at USD 0.30; 100 contracts cost USD 30; new information moves the price to USD 0.45; selling returns about USD 45, a gross profit of about USD 15 even if the event later resolves NO and the contract becomes worth USD 0.
4. The strategy rests on forecasting four things: the final outcome; how participants update their beliefs; when repricing occurs; the size of the repricing.
5. The research line is: current market state + event state + expected information arrival -> forecast of the future contract-price distribution -> estimate of the executable expected value of buying now and selling later.
6. Displayed price is not realizable value. Execution models bid/ask spread, fees, available depth, slippage, latency, fill probability, adverse selection and holding-period risk. A trade is profitable only when expected exit value, net of all execution costs, exceeds entry cost by a conservative margin.
7. Five quantities are kept distinct: entry (ask) price; current bid (executable cash-out price); midpoint or displayed market probability; mark-to-market profit and loss; eventual settlement value. Microstructure example from the Leader's screenshot: about 10 contracts bought near USD 0.97 (USD 9.70), marked near USD 0.92 each, a loss of about USD 0.50 that largely reflects the spread, not a worse forecast.
8. Candidate experiment for live sports markets: repeatedly record event/game state, order book (bid, ask, spread), market-implied probability, timestamp, relevant incoming information, and the contract price after 30 s, 1 min, 5 min and the next game-state transition; train and evaluate whether future executable bid/ask prices are predictable well enough to give positive net expected value after fees, spread, slippage, latency and selection bias. This forecasts the trajectory of market belief, not only the terminal event. Sports and prediction-market intelligence is therefore not limited to "estimate true probability and hold".
9. The Leader sees "another 'game'" in the way weather bids lose value after opening, and holds that the Group's concurrent game systems math, arena math and strategy math bear on it. Prediction-market play is a concurrent game with players, rules, arena and strategies (compare the ludics requirement `sports-and-other-prediction-strategy-spaces-by-obsmetrologia`, which models each sport that way and measures coordination and conflict with Obsmetrologia).
10. A two-cent payout is the Leader's example of an underuse of the Group's theory; the strength is local gluing, global sections, tiling, sheaf Laplacians and fiber algebra (the Leader, 2026-10-04). Where Obsmetrologia or a named result applies, the strategy-space record names it; this note names none that the Leader did not.

## What outside knowledge says (searched 2026-10-10)

- Kalshi's published fee schedule gives a taker fee of round-up(0.07 x contracts x price x (1 - price)), at most 1.75 cents per contract at 50 cents, and a maker fee of round-up(0.0175 x contracts x price x (1 - price)) on resting orders, where the maker fee applies by market; fees are charged only on execution and cancelling is free. Source: Kalshi fee schedule (https://kalshi.com/docs/kalshi-fee-schedule.pdf). A round trip (buy then sell by taking) pays the taker fee twice, so a price-movement trade must clear that plus the spread.
- Bartlett and O'Hara, "Adverse Selection in Prediction Markets: Evidence from Kalshi" (Stanford Law, April 2026; NBER conference version 2026-07-02), on 41.6 million trades: single-name markets show greater informed price impact than broad markets; effective spreads are only modestly wider; makers earn about twice as much per contract; traders overbet YES in markets that mostly settle NO, a behavioural surplus that cross-subsidizes adverse selection; one-sided flow predicts maker losses in single-name markets. https://law.stanford.edu/publications/adverse-selection-in-prediction-markets-evidence-from-kalshi/. These are working papers and may change.
- Bürgi, Deng and Whelan, "Makers and Takers: The Economics of the Kalshi Prediction Market" (CESifo working paper, 2026): the spread arises from matching makers with takers; Kalshi prices are informative and sharpen near close; a favourite-longshot bias is present. https://www.ifo.de/en/cesifo/publications/2026/working-paper/makers-and-takers-economics-kalshi-prediction-market. Read from the abstract only.
- The Group's 2026-07-18 note on event-contract arbitrage records fee formulas and cross-venue spread windows for Kalshi and Polymarket US (`561-group-services-section/content/text/documents/articles/notes/2026/07/18/2026-07-18-note-on-event-contract-arbitrage-enterprise-planning.md`).

## What the Group has measured on Kalshi

Sources: the research records and pull requests 23-53 of `red-cup-engineering/kalshi-engineering-services-section`, and the desk's ledger on Cold Red Gate. EV is per contract after fees.

**Edges that hold**

- **Outcomes already decided by observation.** Of 430 brackets the station observations ruled out over 240 settled events (48 series, 2026-10-02..06), none settled YES; rounding the observed extreme instead of using its precise bound would have made 21 errors. The edge is time: a decided bracket still priced 2-80c lasts about two minutes, and METAR read from tgftp arrives about 2.5 minutes after the reading against 15-35 minutes for api.weather.gov. The desk's live record on this lane and the tail lane: 5 won, 0 lost, USD +1.63.
- **The rain market's favourite-longshot bias.** Taking NO where the mid is 10c or less returned +0.9% to +3.0% of cost; taking YES where the mid is 80c or more returned +0.9% to +4.9%; both are positive in each half of 2,798 rows over 68 dates. Mid-range rain contracts (10-60c) lose after fees. Pooling a weather model with the market adds nothing significant: the edge is the market's own bias.
- **Far temperature tails.** Highs: 0 of 150 settled YES in sample, 0 of 272 out of sample; lows: 1 of 253, then 0 of 195. Resting sells earn +2.6 to +3.6c, taking +1.0 to +1.2c. Counted by settlement day the out-of-sample record is 0 of 32 days, a 95% upper bound of about 8.9%.

**Leads not yet tested forward**

- Jobless-claims thresholds resolve YES 10-18 points less often than priced (t = -4.4 and -2.8); forward test C1.
- Deep-terminal favourites; forward test DT.
- The parlay premium rises with flex width (+4.8c wide, +1.0c narrow); forward test F1.
- KXWTI daily: +9c, 95% interval [+3.9, +14.8].
- GDP against GDPNow: +8 to +12c, on four releases a year.
- Kalshi soccer favourites priced 3-5c above DraftKings.

**No edge after costs**

Late favourites (-1.16c ± 0.57 out of sample; the in-sample gain was a look-ahead artefact); sports favourites at 90-98c (+0.7c, interval [-0.65, +2.1]); crypto combos (killed out of sample); combo maker pricing; coherence and Dutch books (one pathwise basket clears fees, for USD 0.09); cross-venue arbitrage; liquidity-incentive and maker programs (USD -2.1 per market-day net of adverse selection); live mention markets at agent latency; earnings mentions (-3.2c); price-trajectory round trips (none of about 2,450 measured cells survives costs); resting bids on published-series favourites (0 of 33 filled); an LLM forecaster (worse than the market); weather-conditioned sports totals in a calm season.

**The house's temperature models** score 0.03-0.10 worse than the market mid on pooled Brier over 3-4 dates, and none is admitted.

**Capacity.** Taking every weather edge yields about USD 9-13 a day on a USD 1,000 bankroll and USD 0.24-0.38 on USD 25. Contracts on observation-decided brackets trade about 1.2 million a day, mostly at 1c, which is far more than the account's capital.

## What remains open

- Whether a price-movement strategy on live game state (item 8) clears a round trip of taker fees plus spread.
- Why the house's temperature models lose to the market mid: weak models, or a systematic error such as bias, rounding or the climate-day boundary.
- Which Obsmetrologia result measures coordination and conflict among the market's participants in the belief-trajectory setting is not yet named.
- The Leader's phrase "Sports Prop Combo" refers to text the Leader pasted from another AI (not in the utterance record); its content is not held.
