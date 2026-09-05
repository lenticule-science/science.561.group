---
name: "Live-Versus-Backtest Reconciliation"
date-created: 2026-09-05
aliases:
  - "live-versus-backtest reconciliation"
  - "live-versus-backtest"
description: "Ongoing comparison of a strategy's live trading results to its backtested expectation, to detect model decay, implementation error, or overfitting the initial validation missed."
references: {}
---

**Live-versus-backtest reconciliation** is the ongoing comparison of a strategy's actual, live trading results against the performance its backtest predicted, run continuously once a strategy trades real capital rather than only once at initial validation. A persistent, growing gap between live and backtested performance can indicate several distinct problems that require different fixes: [alpha-decay](./alpha-decay.md) (the underlying signal genuinely weakening since the backtest period), an implementation discrepancy (the live system computing a feature, sizing a position, or routing an order differently from how the backtest modeled it), an underestimated [transaction-cost-model](./transaction-cost-model.md) (real fills costing more than the backtest's cost assumptions), or [backtest-overfitting](./backtest-overfitting.md) that earlier validation steps failed to catch.

This reconciliation is named directly in the house's own operating standard for what justifies giving a trading system access to real capital (see [fintech-friday](../../../../../../../../../../../operations-services-section/content/text/glossary/terms/fintech-friday.md) under the 561 Group's operations custody): a system's live performance being "reconciled to its own backtest" is listed alongside recorded [point-in-time-data](./point-in-time-data.md), a stated and cross-validated hypothesis, cost-aware [portfolio-construction](./portfolio-construction.md), and execution through a stated venue algebra, as one of the specific, checkable conditions a live system must meet — not a general aspiration but one item on a stated checklist.

Reconciliation requires that fills actually be booked and matched against the strategy's own intended trades, so "live performance" is measured from the system's own recorded transaction history rather than reconstructed after the fact from a venue statement; [the accompanying teaching article](../../documents/articles/teaching-articles/explanations/how-a-quantitative-fund-works.md) names this booking-and-reconciliation step as a distinct pipeline stage, upstream of reconciliation against the backtest, for exactly this reason.
