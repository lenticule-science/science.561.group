---

name: finance-budget-program
layer: program
derived_from:
- computer/structure/computer-kernel
uses:
- system/structure/recognition-carrier
- system/structure/trace-carrier
produces: []
---

This program models money and other resources as recognitions flowing through accounts, obligations, and plans.

## Behaviour

- Represent accounts, transactions, budgets, and obligations as recognitions with provenance and measurement channels.
- Track cashflow, volatility, savings, and risk exposure as measurements.
- Support scenario and counterfactual planning by running budget vs. actual comparisons as repeatable runbooks.

## Intended operators

- Ingest transactions into recognition carriers with policy checks.
- Allocate and adjust budgets; schedule obligations and subscriptions.
- Produce analyses (flow, risk, scenario) that can be audited later.

## Proof - Derived from: [Computer Kernel](../../../computer/structure/computer-kernel.md). - Shows that: this program instantiates the computer kernel to realise the described behaviour without extending machine semantics.
