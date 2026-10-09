---
title: Agent + liquid + time — the growth policy
date-created: 2026-09-01
authors: [emsenn, claude-fable-5]
status: strategy — the operating policy for an agent maximizing liquidity over time; updated 2026-09-01: use bounded-stake aggression rather than bankroll preservation, and make automated execution genuinely automated
part-of: economics-science-services-section
description: Founder's question, 2026-09-01, and its two sharpening corrections the same night.
---

# Agent + liquid + time — how the agent acts to maximize liquid over time

Founder's question, 2026-09-01, and its two sharpening corrections the same
night. Grounded in the house growth-optimal note (2026-08-27) and the
belief/bilattice stack — but the naive Kelly/no-ruin reading is CORRECTED
below, because it is the wrong utility function for our actual situation.

## The situation sets the objective (specified 2026-09-01)

"Poor people don't need to risk ruin." Kelly / no-ruin sizing protects a
BANKROLL you are trying to preserve. We do not have that. We have a small,
re-seedable, explicitly-discretionary stake. For that, the objective flips:
losing a bounded stake you have walled off is NOT ruin — it is a re-runnable
experiment funded again from the org's other income — while turning it into
several multiples is real, life-changing convexity. Throttling the sizing to
avoid losing a bounded stake is sabotage, not prudence.

So: split the treasury into **survival/working capital** (never risked, never
touched) and **risk capital** (a bounded amount decided in advance as
losable-to-zero-without-ending-anything). On the risk capital, size HARD
toward measured edge — full Kelly or beyond on a genuinely measured edge,
because the downside is bounded and re-seedable and the upside compounds.

## The only real ruin (not conservatism — the one hard line)

The ruin that actually ends the game is NOT losing the risk stake. It is:
(1) **liability beyond the stake** — leverage that can leave you OWING, a
position that can go negative, a liquidation with recourse; and (2) touching
**survival/working capital** or anything earmarked for real obligations.
Wall those two off absolutely. Inside the wall, aggression is correct.
Everything else the earlier draft of this note called a "fence" was borrowed
bankroll-preservation logic and is removed.

## Automated means automated (specified 2026-09-01)

The point of an agent is it executes without a human in the loop per trade —
"we missed trades because the human missed a notification" is the failure to
design against. Architecture: the founder ARMS an envelope ONCE — funds the
risk-stake wallet, grants the signing capability, sets the bounds (max stake,
admitted strategies, auto-halt drawdown floor). That one-time arming is the
only hands/consent step. Thereafter the agent trades autonomously, 24/7. The
kill-switch is an AUTOMATIC circuit breaker (stake hits the envelope floor →
auto-halt), never a request for human permission. Per the decision law,
execution within an armed envelope is the session's to run.

## How the agent acts: two engines, both running

1. **Carry / arbitrage / incentive (direction-free income).** Get paid a
   structural spread for supplying idle capacity — funding-rate harvest,
   hedged LP, lending spreads, cross-venue arb, airdrop/incentive capture.
   Lower variance, earns while the directional edge is being measured. This
   is the idle-capacity principle (operations note, same date).
2. **Signal-fusion directional (manufactured edge).** Agents have tremendous
   PUBLIC news/feed access; a single signal is priced, but STACKING many
   independent public signals manufactures an edge no one actor priced
   (specified 2026-09-01). Fuse them through the bilattice into a graded
   directional belief with a required falsifier (trading-belief-service),
   MEASURE the edge out-of-sample (guard overfitting/look-ahead), then size
   it hard by the bounded-stake rule above. Measurement is the falsifier, not
   a permanent paper-jail — a measured edge gets real capital fast.

Breadth still helps: uncorrelated edge sources raise the growth rate, so run
both engines and many strategies in parallel — the agent's real advantages
are uptime, parallelism, patience, and ~zero marginal cost.

## This is our stack pointed inward

The engine is the house belief stack on our own wallet: typed beliefs with
falsifiers (trading-belief-service), evidence fused through the bilattice,
edges measured by the forecasting/backtest harness, positions sized by the
bounded-stake rule, strategies killed the moment their edge-belief is refuted.
The org is its own first quant customer.

## Fences (only these)

Legal: PUBLIC information only — no MNPI, no manipulation. Structural: no
liability beyond the stake, never touch survival capital. That is all. Size
the walled risk stake aggressively toward measured edge; automate execution
within the armed envelope; re-seed and re-run rather than tiptoe.
