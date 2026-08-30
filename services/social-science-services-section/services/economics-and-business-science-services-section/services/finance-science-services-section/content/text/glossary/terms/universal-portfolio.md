---
title: "Universal Portfolio"
date-created: 2026-08-27
aliases:
  - "universal portfolio"
  - "Cover's universal portfolio"
description: "Cover's online portfolio method that wealth-weights constant-rebalanced portfolios and asymptotically competes with the best such portfolio in hindsight under its model."
references: {}
---

A **universal portfolio**, introduced by Thomas Cover, is an online portfolio-selection method that aggregates **constant-rebalanced portfolios** (CRPs). A CRP maintains fixed portfolio weights by rebalancing each period. The universal method gives greater influence to CRPs that have accumulated more wealth on the return sequence observed so far.

Its benchmark is the single best CRP selected in hindsight from the allowed simplex. Under the frictionless positive-price-relative model, the universal portfolio's log-wealth shortfall from that benchmark grows sublinearly in time for a fixed number of assets, so their per-period growth rates converge asymptotically.

The guarantee is relative, not absolute. It does not ensure positive wealth growth, beat a changing or leveraged strategy, or protect against an asset universe in which every admissible CRP performs poorly. Exact finite-sample bounds depend on the chosen prior, asset count, and formulation.

Practical implementation must address integration or approximation over portfolio weights, transaction costs, turnover, asset entry and exit, price limits, taxes, and data quality. These frictions are outside the simplest theorem and can dominate before its asymptotic comparison becomes informative.

The method is related to universal coding and to [Kelly](./kelly-criterion.md) growth ideas, but it does not need a known return distribution; it competes against a hindsight CRP on the realized sequence.
