---
title: "Finance"
aliases:
  - "finance"
date-created: 2026-03-06T00:00:00
date-modified: 2026-08-27T00:00:00
type: topic
keywords:
  - Finance
  - investment
  - funding
  - valuation
  - risk
contains:
  - capital
  - collateral
  - working-capital
  - debt-service
  - financial-projections
  - kelly-criterion
  - risk-of-ruin
---

# Finance

Finance studies and governs how resources and claims are allocated across time,
states of the world, and institutional boundaries. Its central objects are not
money alone. They include uncertain future cash flows, ownership and debt
claims, funding commitments, collateral, liquidity, control rights, contingent
obligations, and the markets and organizations through which those relations
are formed and transferred.

A financial decision therefore joins at least four questions:

1. **Resource allocation:** What is committed now, to whom, and for what use?
2. **Timing:** When can resources be contributed, withdrawn, repaid, or consumed?
3. **Uncertainty:** Which future outcomes change the amount or availability of
   the claim, and who bears each consequence?
4. **Institutional enforceability:** Which contract, governance process,
   custodian, protocol, or law makes the claim operative?

Reducing finance to “making money” erases these relations. A project can have a
positive expected payoff and still fail because it runs out of liquid resources
before the payoff arrives. A security can have an observable quoted price while
its holder cannot sell the required quantity at that price. A debt can appear
cheap by interest rate while its collateral, covenant, or refinancing terms
transfer substantial control to the lender.

## Finance and accounting

[Accounting](../../../../../../../business-services-section/services/accounting-services-section/content/text/glossary/topics/accounting.md)
constructs classified, measured, and reviewable claims about a reporting entity.
Finance uses accounting records as evidence, but asks different questions: which
activities to fund, how to structure claims, what future cash flows are worth,
how much uncertainty the entity can bear, and how market or institutional
constraints affect action.

The distinction matters in both directions. A market price is not automatically
the measurement basis for an accounting statement, and a historical accounting
cost is not automatically the opportunity cost relevant to a financial decision.
A balanced ledger can describe an entity that is insolvent, illiquid, badly
funded, or exposed to catastrophic concentration. Conversely, a financial model
can describe attractive expected returns while omitting ownership, recognition,
tax, custody, or source-evidence questions required for maintained books.

## Claims, cash flows, and capital

A financial claim specifies a relation among parties rather than a free-standing
number. Equity makes its holder a residual claimant under a governance regime.
Debt promises scheduled or contingent payment and may carry covenants,
seniority, security interests, and remedies. Derivatives make payment depend on
an underlying event, price, rate, or state. Insurance transfers defined losses
subject to exclusions and claims procedures.

[Capital](../terms/capital.md) is productive and institutional capacity committed
to an activity, not merely cash sitting in an account. Financing determines how
that commitment is supplied and which claims arise against it. The resulting
capital structure affects control, loss absorption, payment priority, and the
ability to survive adverse periods.

Cash-flow timing remains decisive even when the long-run economics appear sound.
[Working capital](../terms/working-capital.md), the [cash conversion
cycle](../terms/cash-conversion-cycle.md), and [debt service](../terms/debt-service.md)
describe different parts of the interval between committing resources and
recovering spendable cash. Liquidity is therefore a time-and-market property,
not a synonym for positive net worth.

## Valuation is conditional

Valuation maps future or contingent benefits and obligations into a present
decision measure. Every valuation is conditional on a purpose, date, unit of
account, information set, scenario structure, discount or pricing rule, and
assumption about market access. No asset possesses one context-free “true value”
that all methods merely discover.

Common valuation families answer different questions:

- discounted-cash-flow methods map projected cash flows through a required
  return or state-price rule;
- relative valuation compares claims with selected market analogues;
- option and contingent-claim methods represent state-dependent exercise or
  payoff rights;
- liquidation and collateral valuation ask what can be realized under a
  constrained process; and
- market quotes report executable or indicative exchange terms at a particular
  venue and time.

[Financial projections](../terms/financial-projections.md) are conditional
models, not observations. A useful model keeps assumptions, scenarios, and
decision thresholds visible. Precision in a spreadsheet does not compensate
for unsupported volume, timing, correlation, legal, or counterparty assumptions.

## Return and risk

Return is the change in the decision-maker's resources or claim value over an
interval, including distributions and costs. Risk is not adequately described
by volatility alone. Relevant dimensions include permanent loss, shortfall,
drawdown, illiquidity, refinancing failure, counterparty default, operational
failure, model error, legal change, concentration, and [risk of
ruin](../terms/risk-of-ruin.md).

Expected value averages across outcomes; survival is path-dependent. Repeated
allocation therefore requires attention to compounding and capital depletion.
The [Kelly criterion](../terms/kelly-criterion.md) and
[geometric-mean maximization](../terms/geometric-mean-maximization.md) formalize
one relationship between growth and stake size, while
[fractional Kelly](../terms/fractional-kelly.md) deliberately trades theoretical
growth for robustness against estimation error and drawdown. None of these
rules turns uncertain probabilities into facts or overrides liquidity and
institutional constraints.

Diversification reduces only exposures that are not perfectly shared. It can
fail when positions depend on the same funding source, custodian, oracle,
protocol, collateral, or liquidation mechanism even if their ticker symbols
differ. Exposure mapping must therefore follow causal and institutional
dependencies, not labels alone.

## Markets are mechanisms

A market price is produced by a mechanism: an order book, auction, dealer quote,
automated market maker, oracle, or negotiated transaction. Price, available
quantity, execution probability, fees, settlement, custody, and finality are
separate facts. A strategy that appears profitable at midpoint prices may cease
to exist after spread, depth, latency, financing, and adverse selection are
included.

This is especially visible in leveraged and decentralized markets:

- [collateral](../terms/collateral.md) and
  [liquidation](../terms/liquidation.md) determine when an otherwise continuing
  position is forcibly closed;
- [funding rates](../terms/funding-rate.md) transfer value between perpetual
  futures positions and can reverse an apparent basis trade;
- [oracle divergence](../terms/oracle-divergence.md) separates the reference
  used by a contract from executable market prices;
- [concentrated liquidity](../terms/concentrated-liquidity.md) makes inventory
  exposure depend on a chosen price range; and
- [maximal extractable value](../terms/maximal-extractable-value.md) makes
  transaction ordering part of execution economics.

“Arbitrage” should be reserved for a jointly executable set of claims whose net
payoff and constraints have actually been established. Venue failure, transfer
delay, borrow recall, settlement mismatch, and balance-sheet consumption are not
minor implementation details; they are parts of the financial position.

## Financial control

A maintained financial practice connects decisions to evidence and limits:

- define the entity, mandate, and decision right;
- identify funding sources, restrictions, and obligations;
- state the valuation date, unit, method, and market-access assumptions;
- measure exposure by counterparty, venue, asset, liquidity horizon, and shared
  failure mechanism;
- distinguish forecast, quote, order, fill, settlement, custody, and accounting
  recognition;
- set cash, collateral, concentration, and loss limits before committing funds;
- reconcile positions and cash to independent records; and
- review outcomes against the assumptions that justified the decision.

These controls do not eliminate uncertainty. They preserve the difference
between evidence, model, decision, and outcome so that losses and gains can be
explained rather than retrofitted into a story after the fact.
