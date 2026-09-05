---
name: markets-analysis
keywords:
  - idea
  - markets
  - finance
  - signals
part-of: relational-computer
description: "Analyzes market data alongside other recognitions to integrate financial markets with all other domains."
---

Use the relational computer to analyze market data (stocks, ETFs, crypto,
indices) alongside other recognitions (news, research, personal finance, health,
ecology).

## 1. Core recognitions

- `InstrumentRecognition`
  - ticker, name, exchange, asset class (stock, bond, ETF, crypto, index).
  - topology: sector, region, factor exposures, ownership structures.
- `PriceSeriesRecognition`
  - time series for an instrument (OHLCV, order book snapshots).
- `PortfolioRecognition`
  - holdings, weights, constraints (max drawdown, sector caps, ethics screens).
- `SignalRecognition`
  - derived factors (momentum, volatility, valuation ratios, ESG scores,
    your own ecological/ethical measures).

## 2. Intake and normalization

- Runbooks:
  - `import_prices` (from APIs, CSVs),
  - `import_fundamentals` (earnings, balance sheets),
  - `import_altdata` (news signals, climate exposure, social media).
- Intake ensures:
  - schema correctness,
  - consistent units and calendars,
  - policy around data sources (licensing, privacy).

## 3. Topology and measurement

- Topology:
  - instrument relationships (sector, supply chain, index membership),
  - links to other domains (e.g., `SpeciesRecognition` for biodiversity
    exposure, `PolicyRecognition` for regulatory risk).
- Measurement:
  - returns, drawdowns, volatility, correlation,
  - risk metrics (VaR-style, but grounded in your measurement stack),
  - “ethical/relational” metrics (ecological harm/benefit, labor practices).

## 4. Runbooks and use cases

- Runbooks:
  - `analyze_portfolio`: compute metrics, stress tests, scenario analyses.
  - `compare_instruments`: compare two or more instruments under chosen
    signals.
  - `align_portfolio_with_values`: adjust holdings based on recognitions in
    `ValueRecognition`, `PolicyRecognition`, `SpeciesRecognition`, etc.
  - `respond_to_signal`: when signals from newsfeeds, climate, or health
    domains change, explore what that means for your portfolio.

The aim is not just trading, but making markets another domain where:

- relationships are explicit,
- impacts are measurable,
- and actions are traceable to both financial and ethical recognitions.

