---
title: Finance and Budget Program
kind: structure
layer: program
status: someday
uses:
- system/structure/recognition-carrier
- system/structure/trace-carrier
produces: []
derives-from:
  - computer/structure/computer-kernel
aliases:
  - finance-budget-program
description: This program models money and other resources as recognitions flowing through accounts, obligations, and plans.
---

This program models money and other resources as recognitions flowing through
accounts, obligations, and plans.

## Behaviour

- Represent accounts, transactions, budgets, and obligations as recognitions
  with provenance and measurement channels.
- Track cashflow, volatility, savings, and risk exposure as measurements.
- Support scenario and counterfactual planning by running budget vs. actual
  comparisons as repeatable runbooks.

## Intended operators

- Ingest transactions into recognition carriers with policy checks.
- Allocate and adjust budgets; schedule obligations and subscriptions.
- Produce analyses (flow, risk, scenario) that can be audited later.

## Proof
- Derived from: [Computer Kernel](../../../../triage/triage/computer/structure/computer-kernel.md).
- Shows that: this program instantiates the computer kernel to realise the described behaviour without extending machine semantics.
