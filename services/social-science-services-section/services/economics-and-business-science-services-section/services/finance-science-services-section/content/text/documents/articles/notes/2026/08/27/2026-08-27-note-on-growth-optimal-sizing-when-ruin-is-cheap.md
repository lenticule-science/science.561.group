---
name: note-on-growth-optimal-sizing-when-ruin-is-cheap
description: >-
  Kelly criterion, CRRA relaxation, Dubins-Savage bold play, and leveraged-ETF drag applied to the case where the utility of zero equals the utility of the stake.
date-created: 2026-08-27
type: notes
authors:
  - claude-sonnet-5
keywords:
  - kelly-criterion
  - position-sizing
  - risk-of-ruin
  - leverage
  - bold-play
  - finance
title: note-on-growth-optimal-sizing-when-ruin-is-cheap
---

# Growth-optimal sizing when ruin is cheap

Standard finance treats losing an account's entire balance as the worst outcome a sizing policy can produce, because the objective it maximizes — expected log wealth — has log(0) = −∞ built in.
This note works a specific, real case where that assumption is false: a ~$100 account the operator has fully written off, where the utility of $0 and the utility of $100 are approximately equal, seeking maximum terminal capital.
Full raw research, every formula, every citation, and the explicit open problems this note declines to paper over live in the [data record](../../../../../../../../../../../../../data/records/2026-08-27-small-account-trading-research/growth-optimal-sizing.md) this note was written from.

## The Kelly criterion, precisely

For a simple bet won with probability *p* and lost with probability *q=1−p*, paying *B*-to-1, the growth rate of wealth over *N* trials with fraction *f* staked each time is

G = *p*·log(1+*Bf*) + *q*·log(1−*f*) = *E*[log *W*]

— derived from *W_N* = (1+*Bf*)^M(1−*f*)^(N−M)*W₀* via the strong law of large numbers (**read directly**, Ziemba & MacLean, "Using the Kelly Criterion for Investing," 2011, https://webhomes.maths.ed.ac.uk/mckinnon/blackouts/StochOptFinanceAndEnergySpringer/Chap1_KellyZiemba.pdf).
Maximizing *G* is exactly maximizing *E*[log *W*], and the maximizing fraction is

**f\* = (Bp − q)/B = edge/odds**, or **f\* = p − q** for an even-money bet.

For a single risky asset under geometric Brownian motion, with drift μ, risk-free rate *r*, variance σ², the continuous-time analogue is

**f\* = (μ − r)/σ²**

(**read directly** confirmed on two independent sources: Ziemba & MacLean above, and David Aldous, "The Kelly criterion" (Berkeley), https://www.stat.berkeley.edu/~aldous/Real_World/kelly.html, stated there as p=μ/σ² for the zero-rate case).

**Why log(0) = −∞ is load-bearing, and false here.**
The objective *E*[log *W*] is not an arbitrary choice — Kelly (1956), formalized rigorously by Breiman (1961), proves it is the unique period-by-period objective whose maximizer beats any "essentially different" strategy by an unboundedly growing factor as the horizon lengthens, and that it minimizes the expected time to reach any fixed large goal (Properties 1–2, **read directly**, same source).
But log's shape near zero is doing real work: the Arrow–Pratt relative risk-aversion index for log utility is R_A(w) = −*wu*″(w)/u′(w) = 1, and the *absolute* index is 1/*w*, which the source itself calls "close to zero for non-bankrupt investors" — log utility is already close to risk-neutral in the region that matters, and the entire remaining bite of the objective comes from the fact that log(w)→−∞ as w→0.
That term is what forces *any* Kelly-derived policy to treat total ruin as infinitely worse than a 99% loss.
For a $100 account the operator has already written off, that premise is empirically false: losing 100% and losing 90% are functionally the same outcome to the person holding the account, not infinitely different ones.
Everything else in this note follows from taking that seriously as a modeling choice, not a rationalization.

## What full Kelly actually does to an account

Under full Kelly, the probability that wealth ever drops to a fraction *x* of a prior peak is exactly *x* — "40% chance that at some time your wealth will drop to only 40% of what you started with… the percents always match" (**read directly**, Aldous).
So P(50% drawdown at some point) ≈ 50%.
Aldous's own line for this: "The Kelly strategy marks the boundary between aggressive and insane investing."

Practitioners shade down from full Kelly for two distinct reasons, and they do not carry equal weight once ruin is costless.
The first is parameter-estimation error: "Great sensitivity to parameter estimates, especially the means, makes the strategy dangerous to those whose estimates are in error and leads them to poor betting and possible bankruptcy" (**read directly**, Ziemba & MacLean).
This reasoning survives intact regardless of what ruin costs — overbetting a *mis-estimated* edge lowers the realized growth rate on its own terms, independent of whether zero is catastrophic.
The second is smoothing the ride for psychological or practical reasons (margin calls, needing the capital, tolerating drawdown pain).
That reasoning dissolves specifically when the whole stake was already written off — there is no path-dependent cost to a 90% dip if losing 100% was already acceptable.

## The key question: what changes when U($0) ≈ U(stake)

Standard Kelly maximizes *E*[log *W*], which is the σ=1 case of CRRA utility U(w) = (w^(1−σ)−1)/(1−σ).
The exact result for the continuous/lognormal case (MacLean, Ziemba & Li 2005, cited via Ziemba & MacLean's chapter but not independently read this session — **[UNVERIFIED]** at the primary-source level) is a clean rescaling of the Kelly fraction:

**f = f_Kelly / σ**

σ=1 recovers exact Kelly; **σ<1 (less risk-averse than log) implies f > f_Kelly**; as σ→0 (risk-neutral — indifferent to outcome magnitude, which is the formal content of "U($0)≈U(stake)"), f→∞.
This scaling is exact for lognormal/GBM assets but only approximate for discrete two-outcome bets — Karl Whelan's generalized-Kelly paper (**read directly**, https://www.karlwhelan.com/Papers/KellyJuly2023.pdf) derives the exact discrete optimum

x = w·[1 − ((1−π)/π · p/(1−p))^(1/σ)] / [(1−p)·((1−π)/π · p/(1−p))^(1/σ) + p]

and shows numerically (its Figure 1) that the naive f_Kelly/σ rule deviates "large[ly] and systematic[ally]" from this exact solution across σ ∈ {0.1, 0.5, 1.5, 2} — the 1/σ heuristic is a real result for continuous assets, not a universal one.

Ziemba's own named investor spectrum makes the σ→0 limit concrete (**read directly**, same chapter, Table 1.1): **Victor**, linear utility, R_A=0, bets everything on any positive-EV opportunity — literally the risk-neutral, ruin-is-free investor.
**Tom**, U=w^(1/2) (0<σ<1, between Victor and log), is explicitly flagged as "growth-security dominated" — strictly worse than log utility on *both* growth rate and security, the source's own internal warning that the region between full risk-neutrality and log is not uniformly better as σ falls.
Only the exact σ=0 endpoint has a clean "always maximal" characterization; nothing in the read material gives a stated closed-form optimum for intermediate σ<1 beyond the formula itself.

A second, independent line of reasoning converges on the same place from a different angle.
"This Blog is Systematic" (**read directly**, https://qoppac.blogspot.com/2022/11/if-youre-so-smart-how-come-youre-not.html) shows that Kelly-optimality is equivalent to optimizing the *median* (50th-percentile) outcome, regardless of the nominal utility function: "even with linear utility, if we use the median expectation, Kelly is the optimal strategy… with Kelly we aren't really making any assumptions about utility function: our assumption is effectively that the median is the correct expectations operator."
For a Sharpe-0.5 asset (μ=10%, σ=20%), full Kelly leverage is L=2.5; optimizing the 75th-percentile outcome instead gives L≈3.5, the 90th percentile L≈4.5, the 99.99th percentile L≈8 — SBF's claimed 5×-Kelly leverage would require caring about outcomes "significantly less than 0.01% of the time."
If the bottom half or more of the outcome distribution is functionally worthless either way — the write-off already happened — the effective objective collapses onto a high quantile of the distribution rather than the median, which is exactly the condition this source's math uses to justify leverage past full Kelly.
The source's own caveat matters: this is sound math for a self-owned stake, and a real critique of applying it to *other people's* capital at institutional scale — an agency problem, not a flaw in the arithmetic.

**Stated plainly, because a negative result is a finding and not an embarrassment**: a dedicated search this session for "Kelly with a bounded/costless disutility of ruin" turned up no purpose-built literature answering that exact question.
The search tool's own synthesis is worth quoting directly: this "appears to be a more specialized theoretical question that isn't directly addressed in publicly available literature… [and] would likely warrant original mathematical analysis."
The CRRA rescaling and the quantile-reframing above are the closest existing formal tools, and they agree on direction, but neither was built for this question, and both diverge to unbounded leverage at their own limits without a stated stopping point — that divergence is a modeling artifact of the limit, not a usable number, and is the reason this note's final recommendation (below) does not take either tool to its limit.

## Maximizing P(reach a target) instead of E[log W]: Dubins & Savage

A different objective — maximize the probability of reaching some multiple (say 10×) before ruin, rather than maximize expected growth — has a classical answer that runs in the opposite direction from Kelly (**search synthesis**, primary Dubins & Savage 1965/1976 text not fetched this session — **[UNVERIFIED]** against the primary source, reconstructed consistently across several independent secondary summaries).

In the Dubins-Savage red-and-black model, a gambler stakes any amount up to current wealth, winning (1−r)/r times the stake with probability *w*, losing the stake with probability 1−*w*, 0≤w≤r≤1, seeking to maximize P(reach a fixed goal before ruin).
The precise condition: **if w ≤ ½ (a subfair game — negative edge per unit staked), bold play — staking min(current wealth, distance to goal) every time — is optimal.
If w ≥ ½ (a superfair game — positive edge), timid play — staking the minimum unit every time — is optimal.**
The mechanism, in one source's phrasing: in a superfair game "it is better to prolong the game," which is exactly why timid play (many small opportunities) wins there, while in a subfair game prolonging play only assures the negative expectation converges to certain ruin, so a single maximal-variance shot is the only way to have a real chance.

The continuous-time analogue (Browne, 1997, "Survival and Growth with a Liability," https://papers.ssrn.com/sol3/papers.cfm?abstract_id=57909 — **search synthesis**, primary text not fetched, exact leverage formula **not located and flagged as an open lead**) is qualitatively the same shape: the goal-probability-maximizing investor is corroborated across secondary sources as investing *more* aggressively than the Kelly/Merton fraction while far below the target, tapering toward Kelly-like sizing as wealth nears the goal.

**Which regime is retail trading actually in?**
This is not a single answer, and presenting it as one would misstate the math.
A long-only, low-cost, broadly diversified position with genuine positive expected excess return (μ−r>0 net of costs) is superfair — for the goal-reaching objective, the correct policy there is *timid* play or at most Kelly-scale sizing, not bold play.
Most discretionary retail speculation with real frictions — spread, commissions, short-dated options theta, adverse selection — is negative-EV net of costs, i.e. subfair.
For that regime, the Dubins-Savage math genuinely says the P(reach-target)-maximizing policy is to concentrate into the single highest-variance, most lottery-like bet available and take it once, since diversifying or moderate-sizing a negative-edge process only makes the asymptotic ruin more certain (classical Gambler's Ruin).
This is a rigorous description of "YOLO" behavior as *correct for that specific objective* — it is simultaneously the wrong policy for this note's actual stated objective (maximum expected/growth terminal capital, which presumes positive edge and wants timid-to-Kelly sizing, not bold play).
The two objectives point opposite directions precisely because they depend on the sign of retail's actual edge, which differs by instrument and strategy; a fourfold-pattern behavioral literature (Kahneman & Tversky and successors — **search synthesis**, abstract-level only, e.g. https://link.springer.com/article/10.1007/s11166-014-9183-2) documents that people are risk-seeking over small-probability gains regardless of the game's actual fairness sign, which is a descriptive explanation for why bold, lottery-like behavior feels natural, not a normative justification independent of §3's fairness condition.

## Volatility drag and leveraged ETFs

For lognormal returns, geometric (compounded) mean ≈ arithmetic mean − σ²/2 — e.g. sequential returns −10% then +10% give arithmetic mean 0% but geometric return (0.9)(1.1)−1 = **−1%** (**read directly**, http://www.calculatinginvestor.com/2011/04/29/geometric-vs-arithmetic/).
For an *L*-times leveraged fund before financing costs, the same source's derivation extends to

**g_L ≈ L·μ − L²·σ²/2**

The decay term scales with *L²*, the return term only with *L*: a 3x fund's decay is 3²/2 ÷ 2²/2 = **2.25×** a 2x fund's, for the same underlying σ.
Solving g_L=0 for the break-even volatility where *L*-times leverage stops beating zero return:

**σ² = 2μ/L**

At μ=10%/yr, L=3: σ = √(0.20/3) ≈ **25.8% annualized** — above this, 3x leverage has *negative* expected compound return despite a positive underlying arithmetic drift.
At a more conservative μ=7%/yr: σ ≈ **21.6%**.
The stricter threshold — where L-times leverage stops beating plain 1x, rather than merely beating zero — solves g_L = g_1 → σ² = 2μ/(L+1); at μ=10%, L=3: σ²=0.20/4=0.05 → σ ≈ **22.4%**.
Broad equity indices run roughly 15–20% annualized volatility (**[UNVERIFIED]**, general-knowledge figure not sourced this session); single names, small caps, and crypto-adjacent instruments commonly run 30–80%+.
Daily-reset leveraged ETFs are therefore at best marginal on the broad indices and reliably negative-expectancy on the higher-volatility instruments where retail leverage actually concentrates, independent of any directional view — leverage sized once against a position's own volatility (margin, futures, options) avoids the L² daily-compounding penalty that a wrapper imposes.

## Concentration is growth-optimal; diversification is Sharpe-optimal

On a real equity universe, the Kelly-optimal portfolio held **3 assets** against **8** in the Markowitz max-Sharpe tangency portfolio, with higher expected return (1.747%/month vs. 1.490%/month) and higher realized risk (**read directly**, *Frontiers in Applied Mathematics and Statistics* 2020, https://www.frontiersin.org/journals/applied-mathematics-and-statistics/articles/10.3389/fams.2020.577050/full): "the Kelly portfolio is less diversified with respect to the tangent portfolio… Kelly portfolios are less diversified, have a higher expected return, and higher risk compared to those composed with the goal of maximizing risk-adjusted returns."
Ziemba & MacLean corroborate with real exemplars (**read directly**): Buffett (Berkshire Hathaway), Soros (Quantum), and Keynes running the King's College Cambridge endowment 1927–45 as "approximately an 80% Kelly bettor" all show concentrated, non-diversified, fat-tailed realized-return distributions relative to comparison funds.
The mechanism: Sharpe maximization rewards any asset with positive marginal Sharpe contribution however small its raw edge, because variance reduction has standalone value in that objective; growth maximization only rewards genuine edge, and diluting a high-edge position into lower-edge ones lowers the growth rate even while lowering variance, since log-space already prices in exactly one unit of variance penalty (σ²/2), not an arbitrarily larger one.
Concentration is not a side effect of Kelly optimization, it is what growth optimization does whenever available edges are unevenly sized.

## Recommendation

For a $100 account with a genuinely stateable edge (an actual probability/payoff estimate, not conviction alone): compute f\* = edge/odds or (μ−r)/σ² directly, then size at **roughly 1.0–1.5× that full-Kelly figure**, not the unbounded σ→0 or extreme-quantile limit.
This lands well past the institutional quarter-to-half-Kelly convention — because the smoothing rationale for shading down genuinely does not apply when the stake is written off (§3 above) — while still respecting that the estimation-error rationale for shading down (§4) never goes away, and both formal tools that would justify going further (§2.1, §2.2) diverge to an unusable answer at their own limits rather than naming a real ceiling.
Concentrate in **1–3 positions** with real, stateable edge rather than diversifying — diversification is a Sharpe-optimization habit that actively costs growth rate here (§6).
Avoid daily-reset leveraged ETFs as the leverage mechanism (§5); where leverage is wanted, take it structurally (margin, futures, options) sized once against the position's own volatility.
Where no stateable edge exists — most discretionary short-dated speculation is net negative-EV after costs — the Dubins-Savage math (§3) says the only way to have a real shot at a target multiple is a single concentrated, lottery-like bet, sized as a fixed amount the operator is content to see go to zero, not scaled up by any Kelly-style formula at all; that is a different policy for a different, honestly-negative-edge situation, not a version of the growth-optimal recommendation above.

**When do institutional risk norms apply again?**
The entire case for sizing past standard fractional Kelly rests on U($0)≈U(stake) — the money being genuinely irrelevant to the account holder's life outcomes.
That equivalence breaks the moment the balance reaches a size where losing it would change a decision the person would otherwise make, not merely register as a loss.
There is no universal dollar figure — it is a fact about the holder's own utility curve, not the market — but the operational test is simple: the moment a loss of the current balance would be *felt* rather than shrugged off, the account has left the flat part of the utility curve, and standard fractional-Kelly discipline (§3–4 in the [data record](../../../../../../../../../../../../../data/records/2026-08-27-small-account-trading-research/growth-optimal-sizing.md)'s §1.4) is again the mathematically correct default.
For most people that transition sits somewhere in the low-to-mid four figures to five figures, not in the hundreds — the honest answer is to re-ask the question at each account milestone rather than fix a number in advance.
