---
title: Trading the belief path — prediction contracts as state-contingent assets
date-created: 2026-10-04
authors: [emsenn, claude-opus-5-5]
status: research note (Senior scientist); the measuring program in §6 is open
description: A prediction contract has two games. One is the settlement game, which asks whether the event happens. The other is the path game, which asks how the market's belief will move before it does. This note fixes the accounting distinctions, shows when path trading can and cannot pay (the martingale theorem), names the non-martingale structures we measured on Kalshi on 2026-10-03/04, places the desk inside the house's arena and strategy mathematics, and sets out a falsifiable program.
---
# Trading the belief path

## 1. Five prices that must never be confused

For one contract at time *t*, keep these apart:

- the **entry price** *e* we paid (the ask, for a take);
- the **executable exit price** *b_t*, which is the bid we could sell into now, at the size we hold;
- the **mid or displayed price** *m_t*, the market's stated probability;
- the **mark-to-market** value, which is a convention (bid, mid or last) and not money;
- the **settlement value** *X* ∈ {0, 1}.

The founder's screenshot (2026-10-04) showed ten certified-tail NO contracts
bought near $0.97 and marked near $0.92. That −$0.50 is the spread (*e* − *b_t*),
not a change in the forecast. The desk holds to settlement, so its realised P&L
is *X* − *e* − fee. The desk review therefore books settlement P&L as the
result. It carries *b_t* only as risk (what exiting now would cost), and
never reports a mark as a loss or a gain.

## 2. Two games on one contract

1. **The settlement game.** Estimate P(*X* = 1) better than the price and
   hold. Its value is E[*X*] − *e* − fee. Every lane so far plays this game.
2. **The path game.** Forecast how *m_t* (and, more precisely, the executable
   *b_s*) will move by some time *s* < settlement. Buy now and sell into a
   bid at *s*. Its value is E[*b_s*] − *e* − fees on both legs. The event's
   outcome only matters through how belief about it moves.

## 3. When the path game cannot pay: the martingale theorem

Let 𝔽 be the market's information and *m_t* = E[*X* | 𝔽_t] (a calibrated,
efficient market). Then *m* is a martingale. For any trading rule *H* that
uses only information the market already has (predictable with respect to
𝔽), the gains ∫ *H* d*m* have expectation zero. Spread and fees make the
expectation negative. So the path game pays only if at least one of these
holds:

- **(a) An information edge.** Our filtration 𝔾 is strictly richer than
  𝔽, or we receive the same information sooner. This is a race. We measured
  it for live mentions (the market often moved before the fastest public
  stream) and for sports (ESPN's win probability was the noisier signal),
  and lost both. At the house's latency, this route is closed wherever
  attention concentrates.
- **(b) The price is not a martingale under the true measure.** The market
  is miscalibrated in a way that is *predictable*: drift that depends on
  state, mean reversion after overreaction, a favourite–longshot bias that
  decays as resolution nears, or pressure from inventory or incentives.
  This is falsifiable and measurable, with no race.
- **(c) We are paid to hold the other side.** As a liquidity provider we
  earn the spread, or an incentive, in exchange for absorbing flow and
  carrying inventory risk. This is market making, an optimal-control
  problem (inventory-aware quoting in the Avellaneda–Stoikov style), not
  a forecast.

## 4. What we have already measured is the path game in disguise

- **The tail premium is short belief-volatility with a time decay.** A
  certified far tail at 2–3c should drift toward 0 as resolution nears and
  nothing happens. Selling it collects that decay, the theta of a longshot.
  The premium is route (b), the longshot bias, harvested by holding. A path
  version would sell the tail early and buy it back cheaper near
  resolution. Settlement captures the same decay without paying a second
  spread, so holding dominates unless capital needs to turn over faster.
- **The microstructure study (2026-10-04) is the arena's rule book.**
  Resting orders fill on taker sweeps, not queue. Sweeps are adversely
  selected: weather sells filled by a sweep earned about 0, against
  +0.7–4.3c for fills from queue volume alone. Incentive farmers stack
  1,000+ contracts at the touch on gas markets. Most gas favourites have no
  ask at all. These facts decide which strategies in (c) can exist for us.
- **The coherence and sheaf results bound route (b) across markets.**
  Linked Kalshi markets glue to within fees. Cross-market mispricing is
  not where the drift lives. It has to live *in time*, within a market.

## 5. The house's mathematics for this

The arenas note (engineering, 2026-09-27; gaming faculty, 2026-07-07)
defines an arena as a polarized event structure with symmetry. A
prediction market is one, concurrent with many others:

- **Polarity.** Our moves (place, cancel, take) are Player moves. Every
  other participant's orders, and nature's information arrivals, are
  Opponent moves.
- **Concurrency.** Thousands of markets run at once and interact through
  shared participants, shared capital and linked outcomes. The coherence
  constraints are the gluing conditions across these concurrent arenas.
  The sheaf Laplacian measures how far a configuration is from gluing.
- **Strategies.** The desk's policy is a strategy, in the gaming faculty's
  sense, in this arena. The other players (makers, farmers, retail, us)
  form a population with an equilibrium. The microstructure data estimates
  their strategies. The tail premium exists because retail's strategy
  (buy longshots) is not a best response, and the makers' strategy prices
  it in only partly.
- **Belief dynamics.** The mid *m_t* is a stochastic process whose
  quadratic variation is the rate at which information arrives. The
  four-worlds program's kinetic regime (aperiodic, transient) is where a
  path edge would live, if it lives anywhere. That means bursts of
  repricing around information events, with overshoot and decay. The
  thermal regime (strict, at rest) is where the settlement game lives.

## 6. A falsifiable program

Per market class (weather brackets, gas, sports game and props, mentions,
economic releases), and per horizon (30 s, 1 m, 5 m, until the next state
transition, until resolution):

1. **Martingale tests.** Variance ratios and autocorrelation of mid changes.
   Regress Δ*m* (and Δ*b*, the executable change) on state features: time to
   resolution, distance from 0 or 1, recent flow imbalance, spread, queue
   asymmetry, incentive presence, and game state for sports. A
   non-martingale drift that survives a held-out period is route (b).
2. **Executable value.** Test any drift through a round trip: enter at the
   modelled fill (queue-aware, with adverse selection from the
   microstructure model) and exit at the modelled bid later. Charge fees on
   both legs and latency. The bar is a positive lower confidence bound on
   (*b_s* − *e* − fees) per contract after costs.
3. **Market-making viability (route c).** Measure the inventory-aware
   spread capture with the sweep adverse-selection rates we measured, in the
   markets where the queue is short and the flow is not toxic.
4. **Overreaction in thin markets.** After large moves, measure the
   reversion of the mid at each horizon. This is the cleanest hypothesis for
   route (b) at our latency.

Admission follows the desk's funnel: a held-out test, then a shadow book,
then small live trading, then the daily review. A lane that plays the path
game must book realised round-trip P&L. A mark is not P&L.

## 7. What this changes now

- **Desk review.** Settlement P&L stays the result. The executable exit
  value is reported as risk, so a mark below entry is never read as the
  edge failing.
- **New research line.** The belief-path laboratory (§6), using the
  microstructure collector (books every 5 minutes) and the sports tape,
  extended to sub-minute sampling where tests need it.
- **The tail lane, reframed.** It harvests longshot belief decay by
  holding. That is why its marks start below entry (the spread) and end
  at $1.
