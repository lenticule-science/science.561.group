---
title: "The personal quant platform"
description: "The thesis Alpaca Assist stands on: a personal quant platform is not a miniature institutional firm; it translates a person's durable situated beliefs into falsifiable forecasts, combines them with point-in-time evidence, and allocates under the person's actual mandate, keeping observation, belief, forecast, valuation, policy, and order intent as six distinct content-addressed records."
date-created: 2026-09-05
type: notes
name: 2026-09-05-note-on-the-personal-quant-platform
status: ruled
authors:
  - emsenn
keywords:
  - investment-science
  - belief-to-capital
  - personal-quant-platform
  - alpaca-assist
---

# Personal Quant Platform Theory

## Thesis

A personal quant platform should not be a miniature imitation of an institutional
quantitative firm.

The two actors begin with different comparative advantages. A large firm can buy
lower latency, broader data, specialist labor, balance-sheet capacity, and access to
small or short-lived arbitrages. An individual usually cannot. An individual can,
however, possess durable situated beliefs: knowledge of industries they understand,
products they use, institutions they trust, technologies they expect to matter, and
futures for which they are willing to wait. These beliefs are not noise to be removed
from the system. They are inputs whose uncertainty, time horizon, implications, and
falsifiers must be made explicit.

The platform's job is therefore:

> Translate a person's beliefs into falsifiable forecasts, combine those forecasts
> with point-in-time evidence, and continuously allocate capital toward the greatest
> belief-conditioned discount while respecting that person's actual mandate.

This is not a claim that intuition is automatically correct. It is a claim that
intuition can contain private model structure, and that disciplined mediation is
better than either suppressing it or acting on it unexamined.

## The user's beliefs are first-class data

The platform must let a user say more than "buy this ticker." A belief record should
be able to express:

- a proposition about the world, not merely an instrument;
- the affected companies, sectors, factors, commodities, rates, or other entities;
- the direction and approximate magnitude of the expected consequence;
- the horizon over which the consequence should appear;
- the user's confidence and what would change it;
- supporting observations and contrary observations;
- dependencies on other beliefs;
- the date the belief was held and every subsequent revision.

Examples include "grid investment will remain supply-constrained for five years,"
"this product has stronger retention than the market implies," and "I want to own a
permanent claim on the growth of asset management." The first two may generate
forecasts over many instruments. The third may generate a standing accumulation
policy rather than an ordinary return forecast.

Beliefs, observations, forecasts, and policies must remain different types:

1. An **observation** reports what a source said or what the market did.
2. A **belief** records a principal's revisable view of the world.
3. A **forecast** is a model's dated implication of beliefs and observations.
4. A **valuation** compares that forecast distribution with the market price.
5. A **policy** says how valuation should alter capital allocation.
6. An **order intent** is a proposed venue action produced under that policy.

Collapsing these into a single score makes the system impossible to audit and trains
future agents to treat persuasion as evidence. Every transformation should instead
produce a content-addressed record naming its inputs and model.

## The belief-to-capital algebra

For principal `p`, time `t`, and instrument `i`, the conceptual pipeline is:

```text
(point-in-time evidence, belief state)
  -> forecast distribution over future states
  -> instrument payoff distribution
  -> forecast-implied value distribution
  -> discount or premium versus executable market price
  -> mandate-conditioned desirability
  -> portfolio transition
  -> execution-aware order intents
```

The important quantity is not a generic prediction score. It is the distribution of
forecast-implied value relative to the price available now, after uncertainty,
liquidity, taxes, transaction costs, concentration, and the user's horizon are taken
into account.

A useful initial form is:

```text
belief edge(i) = E[(forecast value(i) / market price(i)) - 1]
                 * calibrated confidence(i)
                 * horizon compatibility(i)
                 - uncertainty penalty(i)
                 - transition cost(i)
```

This expression is deliberately decomposable. Confidence does not manufacture
expected return; costs do not rewrite the forecast; and the mandate does not pretend
to be evidence. More sophisticated models may replace every term, but must preserve
the typed boundaries.

The portfolio is a state transition, not a fresh optimization from zero:

```text
(current positions, tax lots, cash, beliefs, evidence, mandate)
  -> desired buys, holds, trims, exits, and standing accumulations
```

Cost basis matters here. A holding becoming less attractive does not imply an
immediate sale. The sell decision asks whether the holding is sufficiently above its
belief-conditioned value and sufficiently above the relevant lot basis that the
opportunity cost of continuing to hold exceeds taxes, costs, and the value of waiting.

## Mandates are compositional

Retail strategies are commonly plural. A user may simultaneously want long-horizon
accumulation, valuation rotation, income, experimentation, and cash reserves. These
should be represented as named sleeves with explicit capital-flow rules, not forced
into one opaque optimizer.

A principal mandate composes:

- **belief sleeves**, which compete for capital using forecast-relative value;
- **standing accumulation sleeves**, which receive a specified portion of deposits,
  dividends, and harvested gains regardless of short-term ranking;
- **harvest rules**, which define when and how much appreciated overvaluation may be
  sold, including lot selection and minimum gain conditions;
- **reserve rules**, which preserve desired cash or near-cash capacity;
- **transition rules**, which govern turnover, participation, and execution timing;
- **portfolio bounds**, which express concentration, leverage, shorting, and other
  actual preferences;
- **review rules**, which determine when stale beliefs require reaffirmation rather
  than being silently treated as current.

Composition must be observable. If two sleeves request the same dollar, the allocator
should return the resolution and its reason. A permanent accumulation sleeve is not a
secret minimum-weight hack: it has its own identity, funding share, eligible flows,
and rebalance semantics.

## Esther as a worked instance

Esther's current strategy is one member of this larger family:

1. Record Esther's forecasts and confidence about companies or world conditions.
2. Infer forecast-implied values and compare them with current executable prices.
3. Direct discretionary capital toward holdings with the largest supported discount.
4. Continue to hold while price and forecast value remain compatible.
5. When a holding is materially overvalued and well above the selected tax-lot basis,
   sell a mandate-specified chunk rather than reflexively liquidating the position.
6. Reallocate harvested capital toward the strongest current discounts.
7. Route a fixed portion of every eligible capital flow into a standing accumulation
   sleeve for NYSE-listed BlackRock (`BLK`): "stack BLK."

The BLK sleeve needs at least these parameters:

```text
instrument: BLK
venue identity: NYSE-listed BlackRock common stock
eligible flows: deposits | dividends | harvested proceeds | all deployable cash
flow share: principal-specified fraction
minimum target or no target: explicit choice
sale policy: prohibited | exceptional conditions | ordinary valuation harvest
cadence and execution policy: principal-specified
```

The discretionary sleeve needs separately specified meanings for "underpriced,"
"overvalued," "well above cost basis," and "a chunk." Those are model and mandate
parameters, not English comments embedded beside an order call.

Esther's beliefs and parameters belong to Esther's principal record. The underlying
types and services must accept any Alpaca customer and any compatible mandate.

## Point-in-time truth is non-negotiable

The system must be able to answer both:

- What was economically true at the evaluation time?
- What could this agent have known when it made the decision?

Assets, symbols, listings, tradability, corporate actions, news, filings, beliefs, and
model versions therefore require effective time and observation time. A 2024 backtest
must not select only companies that survive in 2026, use a later symbol mapping, or
apply a belief revision before it was made.

Every research run should bind a content-addressed universe snapshot, belief-state
snapshot, evidence set, forecast model, execution model, and mandate version. Exact
replay then becomes an ordinary property of the data model rather than detective work.

## Agents should disagree usefully

An agent committee is valuable when its members perform distinct transformations,
not when several personas decorate the same guess. Useful roles include:

- belief elicitation: turn natural-language conviction into candidate propositions;
- implication mapping: connect world propositions to economic entities;
- evidence prosecution and opposition: seek support and disconfirmation separately;
- forecast construction: produce calibrated distributions over explicit horizons;
- valuation: map operational forecasts to instrument value;
- technical and flow analysis: characterize timing, regime, liquidity, and execution;
- portfolio construction: resolve competing sleeves and opportunity costs;
- execution planning: translate transitions into venue-aware intents;
- attribution: report which beliefs, models, and decisions made or lost money.

The human-facing morning report should expose disagreement, stale beliefs, changed
facts, valuation gaps, proposed transitions, and decisive falsifiers. Slides and
infographics are projections of the same typed records, never a second narrative
database with prettier errors.

## Learning must update the right thing

Performance attribution should distinguish:

- belief quality: were the user's propositions directionally and temporally right?
- implication quality: did the system map those propositions to the right entities?
- forecast quality: were magnitudes and uncertainty calibrated?
- valuation quality: did forecasts imply useful fair values?
- portfolio quality: did sizing and sleeve composition improve outcomes?
- execution quality: were intended transitions captured at acceptable cost?

This decomposition permits a crucial outcome: a user can be right about the world
while the platform chooses the wrong security or enters at the wrong price. A scalar
PnL reward cannot teach that distinction. The platform should update the failing
morphism, not erase the originating belief.

## Product requirements implied by the theory

The next-generation Alpaca application should provide:

1. A conversational belief ledger with explicit revision history and confidence.
2. A graph from beliefs to affected entities, forecasts, instruments, and positions.
3. Point-in-time market, asset, news, filing, and corporate-action datasets.
4. Forecast-relative valuation with uncertainty and horizon visible to the user.
5. Composable strategy sleeves and capital-flow routing.
6. Tax-lot- and cost-basis-aware harvest proposals.
7. Execution-aware portfolio transitions rather than frictionless target weights.
8. Causal replay, walk-forward evaluation, and model tournaments.
9. Daily agent research that produces typed evidence and forecast records.
10. Reports, decks, and infographics generated from those same records.
11. Attribution from realized outcomes back to beliefs and every intervening model.
12. Alpaca account adapters that keep principal-specific credentials and venue effects
    at the boundary while the strategy services remain account-independent.

## Architectural rule

Each microservice should perform one typed transformation over immutable standard
records. Services may be composed freely because their outputs name their semantics,
inputs, effective times, observation times, and identities. Venue reads and writes are
effects at the edge; belief formation, forecasting, valuation, allocation, simulation,
and reporting remain replayable computations.

The resulting platform is not an automated stock-tip dispenser. It is a personal
epistemic and capital-allocation machine: one that remembers what its principal
believed, measures what followed, learns where the reasoning succeeded or failed, and
uses that history to make the next dollar more intelligent than the last.
