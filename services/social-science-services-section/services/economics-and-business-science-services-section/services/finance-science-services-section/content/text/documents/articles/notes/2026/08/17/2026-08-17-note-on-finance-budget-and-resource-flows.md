---
title: Finance, Budget, and Resource Flows
date-cataloged: 2026-08-17
keywords:
  - idea
  - finance
  - budget
date-created: 2026-08-17
description: Money and other controlled resources can be modeled as stocks at defined locations and flows between them.
---

Money and other controlled resources can be modeled as stocks at defined
locations and flows between them. The graph view is useful when it does not
erase the accounting view: a graph edge describes a movement or transformation,
while a journal entry records the reporting entity's balanced recognition of
that event. Neither representation alone establishes ownership, valuation,
authorization, or completeness.

## Recognition layer

- **Resource location:** bank, wallet, custodian, physical store, receivable,
  inventory location, or other controlled state. A location is not necessarily
  an accounting account, and an account can aggregate several locations.
- **Economic event:** transfer, exchange, consumption, production, accrual,
  settlement, contribution, distribution, or remeasurement. A bank movement is
  evidence of cash activity, not a complete classification of the event.
- **Obligation or claim:** amount, counterparty, performance condition, due date,
  currency, priority, and uncertainty. Recurrence templates do not prove that a
  present obligation exists.
- **Plan allocation:** a dated authorization or forecast assigning scarce
  resources to purposes under assumptions and constraints. A plan is not an
  actual posting.
- **Observation:** statement, price, quantity, rate, capacity, or other measured
  fact with source and effective time. Observations remain separate from the
  policy that interprets them.

## Graph and ledger relation

Let locations or recognized states be vertices and admitted movements be edges.
For a commodity-specific incidence matrix $B$ and flow vector $f$, the net
change in location stocks is $Bf$. Conservation requires the opening stock,
admitted external sources and sinks, and closing stock to reconcile. That
quantity equation does not value unlike commodities or determine whether a
source or sink is revenue, expense, debt, or equity.

The accounting ledger supplies those entity-relative classifications. A single
economic event may create several postings—principal, fee, tax, gain, clearing,
and counterparty effects—while the operational graph may show one transfer.
Stable event identifiers connect the two views without making one a duplicate
engine for the other.

## Measurement layers

- **Quantity and capacity:** units held, available, restricted, delegated,
  committed, or in transit.
- **Historical cost:** admitted acquisition or production cost and the lot or
  population to which it belongs.
- **Transaction value:** consideration and fees at the event's effective time.
- **Current valuation:** a dated price or model applied to an eligible quantity.
- **Liquidity and timing:** settlement delay, convertibility, market depth,
  minimum order, withdrawal constraint, and cash availability.
- **Risk exposure:** counterparty, concentration, volatility, duration,
  currency, leverage, operational dependency, and scenario loss.

These layers should not be collapsed into one “balance.” A resource can have an
exact quantity and missing cost, or a quoted market value and no practical
liquidity.

## Decision views

- cash forecast: opening cash plus timed receipts, payments, financing, and
  minimum-liquidity constraints;
- budget versus actual: baseline plan, actual population, reforecast, and
  volume/price/mix/timing/classification explanations;
- obligations calendar: recognized and contingent claims by due date,
  counterparty, priority, and settlement source;
- funding graph: which resources support which programs and where restrictions
  or concentration create a single point of failure;
- scenario view: internally consistent changes to prices, volumes, timing,
  capacity, and financing rather than a single optimistic or pessimistic
  multiplier; and
- reconciliation view: opening stock, admitted flows, closing stock,
  independent evidence, and unresolved differences.

The useful architecture is one evidence population feeding both controlled
accounting reports and purpose-specific financial views. A separate graph store
may improve analysis, but it must not become an N+1 book whose balances drift
from the canonical ledger.
