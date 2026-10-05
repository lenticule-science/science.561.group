---
title: Note on prediction markets as a proving ground, and betting with no exit
type: note
status: research program — proposed 2026-10-05; claims marked by evidence status
author: the Lenticule Science Senior (Bare Cedar Fog Claude character)
requested-by: the Leader of 561 Group, 2026-10-05
---

# Prediction markets as a proving ground, and betting with no exit

The Leader's direction (2026-10-05) has two parts:

- **Theory.** Recognize and extend the house theory of smart gambling against real material
  conditions, including the idea that "no one can really fold and go back to the bank".
- **Program.** Use sports data as a proxy for a QPU: a real-world source on which to test
  kinetic/kinematic and quantum proofing through the predication → FOUR → Chu → sheaf line.

This note sets both out as a research program. It separates what is established from what is
the house's own, and names what each step must show.

## 1. Betting with no exit

### What the house already holds

- **The growth policy** (economics note 2026-09-01, agent + liquid + time): a walled, re-seedable
  stake is not ruin, so it is sized aggressively toward a *measured* edge.
- **The sizing note** (finance note 2026-08-27, growth-optimal sizing when ruin is cheap) makes this
  precise:
  - the smoothing reason for fractional Kelly does not apply to a written-off stake;
  - the estimation-error reason always does;
  - so size at 1.0–1.5× full Kelly on a stateable edge.
- **No literature answers this case directly.** The note found none on Kelly with a costless ruin,
  and says the case wants original analysis.

### What "no one can fold" adds (house hypothesis, not yet derived)

Kelly's textbook setting assumes a riskless asset: an agent may hold cash and stop. Under material
conditions there is no such exit:

- cash loses to prices and is called on by obligations;
- leaving a game is itself a position, with its own drift and its own ruin.

The decision is therefore never "bet or stay safe". It is how to divide liquid among risky options,
of which cash is one.

Two consequences are worth deriving:

1. **The base of the fraction is wider than the stake.** The relevant wealth is the agent's whole
   liquid over time, including future re-seeds. A Kelly fraction of that wealth, expressed as a
   fraction of the walled stake, exceeds the stake-level Kelly fraction and is capped by the stake
   itself. This is the formal content of "full Kelly or beyond" for a re-seedable stake.
2. **The comparison point is cash's real drift, not zero.** An option with a small positive edge
   beats holding cash once cash is valued at its true drift.

Neither consequence removes estimation error. Overbetting a mis-estimated edge lowers realized growth
whatever ruin costs. The 2026-10-05 Kalshi loss shows the failure mode exactly:

- the desk's edge rested on a loss rate counted per market (0 of 422);
- tails settling on one day share their weather, so the independent trial is the day;
- counted per day, the loss rate is about 3.2%, not ≤ 1%;
- the stakes that followed were about twice what the true rate supports.

**The rule this gives:** the aggression the theory licenses is applied to an edge measured at the
grain at which outcomes are independent, and every bet sharing one cause is sized as one bet. Kalshi
policy 8 implements this. Board request sdivA7xd recounts the backtest per cluster.

**Open, to derive and test:**

- **D1.** The optimal stake fraction for a renewal process: stakes re-seeded from income at a known
  rate, with no riskless asset, under log utility of whole liquid. Show it as a closed form or a
  computable bound, not a heuristic.
- **D2.** The same under a posterior over the edge, with bets correlated by cluster. The house
  position-sizing service already has the pieces: Beta posteriors, joint Kelly over scenario sets,
  shared model-error modes.
- **D3.** The falsifiers. What realized loss sequence refutes a policy at a stated confidence,
  counted per cluster rather than per bet.

## 2. Prediction markets as a proving ground for contextual and kinetic proofs

### What is established

Abramsky and Brandenburger (2011) treat contextuality sheaf-theoretically:

- measurements are grouped into compatible contexts;
- an empirical model assigns each context a distribution;
- the model is non-contextual exactly when a global section exists, meaning one joint distribution
  over all outcomes whose marginals are the context distributions.

Cohomological obstructions witness the failure of a global section.

The same object arises for prices:

- the prices of a family of contracts on one game are such an empirical model, with each contract
  family (moneyline, spreads, totals, props, combos) a context;
- a global section is a probability measure pricing them all coherently;
- by de Finetti and the fundamental theorem of asset pricing, its absence is a Dutch book.

### What sports can and cannot test

A game has one classical outcome. Its markets cannot exhibit genuine quantum contextuality: every
obstruction they show comes from frictions, latency, fees or mistakes. That is what makes them
useful as a proxy rather than a substitute:

- **A known-classical ground truth.** Every obstruction the proving machinery reports on sports
  data can be explained after settlement. Its false-positive rate and its sensitivity can be
  measured on real, noisy, high-volume data before the machinery is trusted on sources whose
  classicality is unknown. This is the calibration a QPU's own outputs would need.
- **Kinematics.** In-play markets evolve with the game's state (score, clock, possession), which an
  independent feed (ESPN) records. "Who sees the score first" is a measurable lead. A kinetic proof
  is then a certificate, issued ahead of settlement, that a path of prices is or is not consistent
  with a lawful evolution of the game state. Settlement checks it.

### The line the house already has

- **Predication.** Each contract is a predicate on the game; each price, a weighted reading of it.
- **FOUR.** Evidence for and against each predicate (Belnap: neither, true, false, both). Prices
  that contradict across contexts read as both.
- **Chu.** Contracts against outcomes as a Chu space, with the satisfaction relation as the price
  matrix. The dual (outcomes as points, contracts as states) is where the global section lives.
- **Sheaf.**
  - FS `src/coherence.mjs` (the post-fee Dutch-book LP) finds sections.
  - FS `src/kalshi-sheaf.mjs` measured tension.
  - SignGraph `pricedNerve` reports the H¹ rank of the context incidence and the mass of
    contradiction as a price.

### Steps, each with its judge

- **P1. Empirical models per game.**
  - **Task:** from the whole-exchange tape and the source arrivals, assemble each game's contract
    family as a context cover with time-stamped prices.
  - **Judge:** coverage of settled games, and replay identity with the tape.
- **P2. Obstructions with ground truth.**
  - **Task:** for each game and instant, compute the global-section LP (with fees) and the
    `pricedNerve` reading; after settlement, attribute each obstruction to friction, latency or
    error.
  - **Judge:** calibration curves (reported obstruction mass against realized Dutch-book profit
    after fees), out of sample by date.
- **P3. Kinetic certificates.**
  - **Task:** with the generator-lag recorder's game-state feed, issue certificates ahead of
    settlement that a price path is consistent with the state's lawful evolution.
  - **Judge:** the certificates' error rate at settlement, per game cluster.
- **P4. Transfer.**
  - **Task:** run P2/P3 unchanged on a source whose classicality is not known in advance.
  - **Judge:** P2/P3's calibrated rates, stated before the run.

### Data, and why its collection stays on

- The whole-exchange tape, the settlement sources and the generator-lag recorder are this program's
  raw material.
- What is not collected now cannot be collected later. They keep running until the Kalshi Area
  admits them as venue arrivals (kalshi-area.md).
- Their retirement (queued earlier on 2026-10-05) was withdrawn for this reason.

## Evidence status

Established and cited:

- Kelly's criterion and the sizing note's sources;
- Abramsky–Brandenburger sheaf-theoretic contextuality;
- de Finetti coherence and the fundamental theorem of asset pricing.

House hypotheses, not derived:

- the no-exit sizing consequences (D1–D3);
- the reading of kinetic proofs as ahead-of-settlement certificates;
- the Chu-space presentation of prices.

Existing house code: the coherence LP, the sheaf tension monitor, `pricedNerve`, the tape and the
recorder. Their outputs on this program's questions are not yet measured.
