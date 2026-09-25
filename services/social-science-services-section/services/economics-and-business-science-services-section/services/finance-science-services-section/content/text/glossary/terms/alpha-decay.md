---
name: "Alpha Decay"
date-created: 2026-09-05
aliases:
  - "alpha decay"
  - "signal decay"
description: "The erosion of a signal's predictive power over time as it becomes known, crowded, or arbitraged away."
references:
  mcleanpontiff2016:
    authors: ["R. David McLean", "Jeffrey Pontiff"]
    title: "Does Academic Research Destroy Stock Return Predictability?"
    publication: "Journal of Finance 71(1)"
    year: 2016
---

**Alpha decay** is the tendency of a signal's measured predictive power to weaken over time after its discovery, whether because the underlying economic mechanism it exploited genuinely fades, because more capital chasing the same signal competes away its edge, or because the signal becomes publicly known and is traded against by others until its price effect is exhausted. McLean and Pontiff's study of 97 published return predictors (McLean & Pontiff 2016) found portfolio returns to those predictors were on average 26% lower out-of-sample than in the original published sample, and 58% lower after publication specifically, with a substantial share of the post-publication decline attributed to publication-informed trading rather than to data-mining artifacts alone.

Decay is not uniform across a signal's cross-section: the same study and related work find decay concentrated in the liquid, well-covered names institutional capital can trade at size, and weaker in small, illiquid names that remain costly to arbitrage at scale — the same mechanism [strategy-capacity](./strategy-capacity.md) and [the house's own note on capacity as a small-account advantage](../../documents/articles/notes/2026/08/27/2026-08-27-note-on-capacity-as-a-small-account-advantage.md) describe from the opposite direction, as a ceiling on how much institutional capital a given anomaly can absorb before its measured edge erodes.

A live trading system's defense against alpha decay is not a one-time validation but ongoing monitoring: comparing a signal's currently realized performance against its original backtest expectation ([live-versus-backtest-reconciliation](./live-versus-backtest-reconciliation.md)) to detect decay as it happens, distinct from the initial [backtest-overfitting](./backtest-overfitting.md) checks that establish whether the signal was ever real in the first place.
