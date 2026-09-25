---
name: "Point-in-Time Data"
date-created: 2026-09-05
aliases:
  - "point-in-time data"
  - "point-in-time database"
description: "Data reconstructed exactly as it would have appeared to a forecaster on a given date, correcting for survivorship and look-ahead bias."
references: {}
---

**Point-in-time data** is historical data reconstructed to show exactly what was knowable on each date it is queried for, rather than the final, revised, present-day state of the same facts. Two failures it corrects are named separately because they are distinct mechanisms. **Survivorship bias** is the omission of assets, funds, or companies that no longer exist (delisted, merged, liquidated) from a historical dataset, which overstates historical returns because the sample is conditioned on having survived to the present. **Look-ahead bias** is the use of information at a historical date that would not actually have been available then — a company's earnings figure as later restated rather than as originally reported, an index constituent list as it stands today rather than as it stood on the date being backtested, or a data revision applied retroactively across the whole history.

Both failures share a mechanism: querying a present-day database as though it were a historical record, when the database has silently overwritten its own past state. A point-in-time-correct dataset instead stores every value together with the date it became known, so a backtest run "as of" a past date sees only values that existed by then, including assets since removed from today's universe.

This is a data-engineering discipline, not a statistical correction: no amount of cross-validation rigor in [backtest-overfitting](./backtest-overfitting.md) repairs a result computed against data the strategy could not actually have seen at the time. See [the accompanying teaching article](../../documents/articles/teaching-articles/explanations/how-a-quantitative-fund-works.md) for the house's own asset-universe service that projects bitemporal observations into survivorship-aware snapshots for exactly this purpose.
