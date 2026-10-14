---
title: "One vote per market: fixed-unit participation and the capital–diversity frontier"
date-created: 2026-10-14
type: note
status: "research note — exploratory mathematical model; derivations not formally verified; no operational policy adopted"
producer: "Lenticule Science / Finance Science Services Section"
origin: "emsenn's question on holding each market allocation to a fixed dollar unit while expanding participation with the purse"
tags: [finance, strategy, event-contracts, fixed-unit-staking, diversification, correlation, risk-of-ruin, market-portfolio]
description: "Formalize fixed-dollar equal participation, opportunity-supply capacity, dependence-adjusted effective breadth, and their two-way triangulation with purse wealth; compare real scholarship without altering trading operations."
---

# One vote per market: fixed-unit participation and the capital–diversity frontier

## Status and question

**Status:** exploratory finance-science research, dated 2026-10-14. This document does not authorize a Kalshi trade, revise a live allocation strategy, set a risk limit for an account, or claim empirical success. The formulae are algebraic derivations under stated assumptions, not Lean-checked theorems or an empirically validated algorithm.

**Question.** Suppose every distinct eligible market can receive one equal dollar allocation, for example $10. The allocation to a market does not depend on Kelly sizing or scale with the purse. As the purse grows, one seeks more markets: the participation frontier expands from the best measured opportunities into the long tail of weaker opportunities, but only within an explicitly defined tolerance. How does this change expected profit, downside risk, capital use, the ability to survive forecast error, and the meaning of diversification?

The motivating metaphor is **one vote per market**. Each independently identified proposition receives at most one capital unit. This is a rule of equal *maximum dollars at risk*, not equal numbers of contracts, equal probability, equal payoff variance, or an entitlement to trade every listed market. It is a candidate objective in its own right, not a claim that it maximizes geometric wealth growth.

This work belongs to finance science (economic allocation under uncertainty). The mathematical questions may subsequently inform gambling science and market-strategy engineering, but source research is not a live strategy or an implementation request. The existing finance note on settlement versus belief-path trading supplies relevant price and execution distinctions, not permission to change its desk: [Trading the belief path (2026-10-04)](https://github.com/lenticule-science/science-services-section/blob/main/services/social-science-services-section/services/economics-and-business-science-services-section/services/finance-science-services-section/content/text/documents/articles/notes/2026/10/04/2026-10-04-note-on-trading-the-belief-path.md).

## 1. The capital unit and its allocation rule

Let:

- \(W_t>0\) be purse wealth at decision time \(t\), with explicit accounting for already encumbered funds;
- \(b>0\) be a fixed nominal dollar unit, initially \(b=\$10\), not a bankroll fraction;
- \(\rho\in[0,1]\) be a *target* upper fraction of purse wealth available for outstanding allocations;
- \(L_t\geq0\) be previously committed capital counted against this same budget;
- \(A_t\geq0\) be cash currently free to commit;
- \(\mathcal E_t\) be the set of distinct economically identifiable and eligible exposures.

For a fresh, unencumbered purse, the target number of simultaneous units is

\[
N_t^{\rm target}=\left\lfloor \frac{\rho W_t}{b}\right\rfloor.
\]

With existing commitments and limited liquid cash, new capacity is bounded by

\[
N_t^{\rm new}\leq
\min\left\{
\left\lfloor\frac{(\rho W_t-L_t)_+}{b}\right\rfloor,\,
\left\lfloor\frac{A_t}{b}\right\rfloor,\,
|\mathcal E_t|
\right\},
\qquad x_+=\max(0,x).
\]

Further constraints may reduce the admitted number: correlation groups, scarce order-book liquidity, market terms, fees, settlement deadlines, and unacceptable downside exposures. A target is not an obligation to fill.

In the idealized fresh-purse model, \(\rho=0.6\) and \(b=\$10\) yield 6 units for a $100 purse, 30 for $500, 120 for $2,000, and 600 for $10,000. These are arithmetic capacity examples, *not advisable allocation levels*.

**Logical distinction.** A cap \(b\) alone does not imply that the number of markets must grow with wealth: surplus cash could remain idle. The extra premise is a chosen utilization or participation objective. Conversely, a fixed utilization objective cannot force qualifying opportunities into existence. If fewer than \(N_t^{\rm target}\) eligible economic events exist, the cash remainder stays uncommitted unless a separately justified hedge or information-purchase objective is declared.

**No trivial splitting.** The economic unit cannot be a click, order ID, or successive $10 order on the same outcome. Otherwise the rule can be evaded by dividing a $100 position into ten orders. The exposure identifier must track the same settlement question, sides of the same contract, mutually exclusive brackets, linked outcomes, and open orders, including positions at other times or venues when relevant. One unit per exchange ticker is a weaker and potentially misleading variant.

## 2. Binary settlement model and breakeven

For a long binary contract, let \(X_i\in\{0,1\}\) indicate a winning settlement, \(a_i\in(0,1)\) be the actual per-contract *executable entry price* in dollars, and \(q_i=P(X_i=1)\) be the trader's true but unknown outcome probability. For a continuous-contract approximation, a stake of \(b\) acquires \(b/a_i\) claims.

With an all-in deterministic order cost \(f_i\) and holding to settlement, the profit is

\[
Y_i=b\left(\frac{X_i}{a_i}-1\right)-f_i,
\quad
E[Y_i]=b\left(\frac{q_i}{a_i}-1\right)-f_i.
\]

Define the estimated *net return on the staked dollar* as

\[
g_i=\frac{q_i}{a_i}-1-\frac{f_i}{b}.
\]

Under these assumptions, the individually profitable admission condition is

\[
g_i>0
\quad\Longleftrightarrow\quad
q_i>a_i\left(1+\frac{f_i}{b}\right).
\]

In actual markets one must replace \(q_i\) with a forecast distribution or defensible interval, \(a_i\) with executable order-book depth at the proposed size, and \(f_i\) with the venue's real, price-, size-, and outcome-dependent fee/rounding rules. If fees depend on settlement, the expected fee belongs inside the expectation. Integer contract sizes, spreads, slippage, market impact, funding and settlement delay invalidate a naive division by displayed midpoint. Buying NO is the same analysis after renaming the winning event.

**Illustration, not a market claim.** At \(a=0.50\), \(q=0.60\), \(b=\$10\), and zero fees, the position earns $10 on a win, loses $10 on a loss, and has expected profit $2. At \(a=0.10\), \(q=0.12\), and the same stake, expected profit is also $2, but the position earns $90 on a win and loses $10 otherwise. Equal stake and equal expected dollar edge do **not** equalize payoff dispersion or loss frequency.

The true \(q_i\) is not observable when deciding. A research hypothesis may use an estimate \(\widehat q_i\), a lower uncertainty bound \(q_i^{-}\), and an explicit friction budget. An uncertainty-robust admissibility proposal is \(q_i^{-}>a_i(1+f_i/b)\), subject to coverage validation. This is a **testable proposal**, not a certified decision rule. Selection among many apparently positive edges invites winner's curse, correlated model error, and multiple-testing bias.

## 3. Equal participation and its mathematical meaning

Suppose exactly \(N\) unique economic exposures each receive \(b\) dollars, with total committed amount \(Nb\). Their notional capital weights are \(w_i=1/N\). Equal weighting maximizes Shannon allocation entropy

\[
H(w)=-\sum_{i=1}^{N}w_i\log w_i\leq\log N
\]

and minimizes the Herfindahl concentration \(\sum_i w_i^2\geq1/N\), with equality in both cases only for equal weights. The bounds follow from the concavity of \(\log\) or nonnegativity of relative entropy, and Cauchy–Schwarz, respectively.

Thus the metaphor *one vote per market* has a coherent formal interpretation: maximum nominal participation diversity **conditional on the selected set and total commitment**. Its participation-effective count is \(N_{\rm nominal}=\exp H=N\).

This conclusion says nothing by itself about stochastic outcome independence. A collection of 100 highly correlated temperature markets may have nominal participation count 100 while representing very few independent weather exposures. Nor does equal staking make an inexpensive longshot and an expensive favorite equally volatile.

The rule differs from a traditional fixed-\(N\) 1/N portfolio: here \(N\) is *endogenous to wealth and opportunity supply*. It also differs from Kelly sizing, which allocates according to a specified log-wealth objective and probability/odds information. Kelly remains a scientific comparator, not the rule proposed here.

## 4. How the long tail consumes additional capital

At time \(t\), rank admissible candidate exposures by their *estimated net unit edge* \(g_{(1)}\geq g_{(2)}\geq\cdots\), while preserving a separate measure of forecast uncertainty, dependence, and capital lock time. In the restricted case of equally priced exposure units, no correlations, equal timing, and an objective of maximum expected dollar profit at exactly \(N\) selections, the best \(N\) are the highest \(g_i\). This exchange argument does **not** hold unchanged for risk-, duration-, hedge-, or learning-aware utility.

For \(N\) selected opportunities, expected nominal profit is

\[
E[\Delta W_N]=b\sum_{k=1}^{N}g_{(k)}
\]

and the expected return on **committed** funds is

\[
\overline g_N=\frac{1}{N}\sum_{k=1}^{N}g_{(k)}.
\]

If edges decline with rank, adding still-positive units raises expected dollar profit but generally lowers average return on committed capital. Adding a negative-edge unit reduces expected dollar profit unless that position has a distinct hedging, informational, or nonfinancial value that is explicitly accounted for. Maximizing the number of votes is therefore a separate normative objective from maximizing profit.

**Illustrative edge-decay model; not an empirical law.** Suppose the gross per-unit advantage before friction is \(u_k=u_0k^{-\alpha}\), \(\alpha>0\), and proportional friction is \(c>0\). Then

\[
g_k=u_0k^{-\alpha}-c,\qquad
E[\Delta W_N]=b\left(u_0 H_{N,\alpha}-cN\right),
\]

where \(H_{N,\alpha}=\sum_{k=1}^{N}k^{-\alpha}\). Marginal expected profit turns nonpositive once \(k\geq(u_0/c)^{1/\alpha}\). If there is no friction and \(0<\alpha<1\), aggregate expected profits grow sublinearly as \(N^{1-\alpha}\), while average committed-capital advantage decays as \(N^{-\alpha}\). For \(\alpha=1\), cumulative edge grows logarithmically; for \(\alpha>1\), the no-friction cumulative edge converges. Thus increased breadth need not generate proportional profits.

For a numeric counterexample, let \(u_0=0.10\), \(\alpha=1/2\), and \(c=0.01\). The 100th opportunity is only breakeven; ranks 101 onward have negative expected edge. With \(W=\$2{,}000\), \(b=\$10\), and target deployment \(\rho=0.6\), capacity asks for 120 units, but fewer than 100 satisfy strict positive expected edge. A policy that insists on spending $1,200 under these assumptions destroys some of the expected value of the first 99 units. A tolerant policy may instead preserve cash.

**Admissibility has to precede utilization.** "Within tolerance" could mean a minimum net expected edge, a lower confidence bound, a maximum forecast-error budget, a maximum correlated loss, or a priced hedge/learning benefit. Those are different mathematical hypotheses. A small negative standalone edge can be rational as insurance against existing risks, but only if its negative dependence or other value is measured: it is not justified simply by a larger purse.

## 5. When more votes reduce risk — and when they do not

For the idealized binary model with deterministic entry prices and costs,

\[
\operatorname{Var}(Y_i)
=b^2\frac{q_i(1-q_i)}{a_i^2},
\quad
\operatorname{Cov}(Y_i,Y_j)
=b^2\frac{\operatorname{Cov}(X_i,X_j)}{a_i a_j}.
\]

The portfolio variance is the sum of all individual variances **plus every pairwise covariance**. Merely adding exchange markets does not remove shared forecast errors or adverse scenarios.

A useful controlled special case assumes that each unit-dollar return \(R_i=Y_i/b\) has variance \(\sigma^2\) and every distinct pair has correlation \(r\), with a feasible positive \(r\). Then, for \(N\) simultaneous equal-sized positions,

\[
\operatorname{Var}(\Delta W_N)
=b^2\sigma^2N[1+(N-1)r].
\]

If \(N=\rho W/b\) exactly, normalized profit volatility becomes

\[
\boxed{\frac{\operatorname{SD}(\Delta W_N)}{W}
=\sigma\sqrt{\frac{\rho b}{W}(1-r)+\rho^2r}.}
\]

**Result A (independent case, conditional).** If \(r=0\), \(b\) and \(\rho\) are fixed, the assumptions remain stable, and enough independent eligible opportunities exist, relative volatility decreases as \(W^{-1/2}\), even while the number of outstanding bets rises approximately linearly with wealth.

**Result B (shared-risk case, conditional).** If \(r>0\) remains positive as opportunities multiply, relative volatility approaches the nonzero floor \(\sigma\rho\sqrt r\). Growing nominal breadth cannot wash out the common risk. A fixed dollar unit therefore does not, by itself, produce a law of vanishing drawdown probability.

A numerical model exposes the difference. With \(a=0.50\), \(q=0.60\), fee zero, \(b=\$10\), \(\rho=0.6\), the per-dollar return variance is \(\sigma^2=0.96\). At \(W=\$500\), \(N=30\): independent one-round P&L standard deviation is about $53.67, or 10.7% of the purse. At \(W=\$2{,}000\), \(N=120\): it is about $107.33, or 5.4%. But under constant pairwise correlation \(r=0.20\), these proportions are about 28.0% and 26.7%, heading toward a 26.3% common-risk floor. The parameters are artificial; no actual market portfolio is asserted to have these correlations.

**Exposure construction is the difficult part.** Mutually exclusive temperature bins on one station and hour, opposite contract sides, brackets determined by a shared weather model, related political contracts, and outcomes settling under one economic release may have substantial deterministic or stochastic dependence. They are not independent votes merely because the venue gives them different market identifiers. Family, common driver, resolution event and model-provenance relationships need to be recoverable before one can count diversification.

## 6. Downside, survival and capital velocity

For fully funded, long-only binary positions on one isolated round, with total committed principal no greater than \(\rho W\), ignoring fees and other obligations, the simultaneous maximum principal loss is \(\rho W\). If \(\rho<1\), that round alone cannot reduce the remaining purse below \((1-\rho)W\). This is a **one-round bound only**, not a guarantee against drawdown over repeated rounds, operational failure, liquidity loss or bankruptcy elsewhere. Repeated losses, fees and correlated exposure can still erode wealth severely. Taking \(\rho=1\) leaves no protected cash.

The objective matters. Expected arithmetic profit is linear in marginal edges. Long-run geometric growth instead examines expressions of the form

\[
E[\log(W+\Delta W)-\log W]
\]

where defined, and penalizes deep losses. Holding many equal-dollar positive-edge positions does not prove superiority under log growth, mean-variance preference, drawdown constraints, or a survival objective. For small normalized profit \(Z=\Delta W/W\), the approximation is \(E[\log(1+Z)]\approx E[Z]-E[Z^2]/2\): both variance and the squared mean enter the second term. Without stable estimation and bounded downside, this is not a guarantee or Kelly result.

Settlement time creates a second frontier. With expected lock duration \(\tau_i\), a candidate's expected money return \(g_i\) and indicative advantage per dollar-time \(g_i/\tau_i\) distinguish rapid turnover from large profit per contract. One six-hour opportunity and one three-day opportunity with the same expected net return tie on per-bet profit but not capital turnover; repeated availability and refill risk matter. Ranking solely by \(g_i/\tau_i\) still ignores dependent outcomes, timing risk, future opportunity arrivals, and changing bankroll, so it is a descriptive statistic, not an accepted optimization formula.

The precise study should separate (i) a fixed maximum loss per economically distinct event, (ii) concurrent capital commitments, (iii) rate of principal recycling, (iv) expected return on deployed principal, and (v) total wealth return including deliberately idle cash. Otherwise a strategy can look attractive simply because idle money was excluded from the denominator.

## 7. Proposed objectives and testable hypotheses

Three objectives should remain distinct rather than collapsing into one "optimal bet" calculation:

1. **Egalitarian participation:** maximize the number or entropy of independently qualified event exposures, with one stake unit each.
2. **Economic effectiveness:** maximize net realizable profit, log wealth, or reward per capital-time under measured uncertainty, including the value of leaving cash unspent.
3. **Survival:** bound stressed joint losses, total outstanding principal, loss concentration in shared drivers, and adverse forecast-error sensitivity.

A candidate scientific strategy might select the largest admissible set up to purse capacity, subject to calibrated edge-uncertainty floors, economic-event grouping, liquidity and stress-loss budgets, breaking ties using marginal portfolio contribution. It may also consider low- or negative-edge hedges when their risk-reduction value is explicit. This is a hypothesis to compare, not an instruction to change the live desk.

**Falsifiable hypotheses:**

- H1. With calibrated, sufficiently independent eligible events, a growing purse and fixed unit lower normalized one-round portfolio volatility, as the model predicts.
- H2. Once common event drivers and forecast-model provenance are grouped, apparent market count materially overstates effective diversification in at least some dense market families.
- H3. Increasing participation reaches declining marginal *net* expected edge; beyond a class- and horizon-specific threshold, additional events worsen realized returns after fees, slippage and selection error.
- H4. Under finite-sample probability error, fixed-unit participation can sometimes outperform probability-sensitive stake sizing on out-of-sample drawdown or geometric growth, but not uniformly; the advantage, if found, must survive comparisons at matched total risk and capital utilization.
- H5. At short settlement horizons, capital recycling can improve return per unit time, but only when executable liquidity, fees and opportunity arrival rates sustain the claimed advantage.

**Discriminating counterexamples:** All \(N\) positions depend on one binary event (nominal breadth \(N\), no genuine diversification); all added opportunities have slightly negative true edge (forced breadth reduces expected profit); low-priced longshots share identical expected return but much larger payoff variance than favorites; two highly correlated high-edge bets can be inferior under a downside objective to one lower-edge hedge; \(W\) increases while qualified markets remain finite (cash must rise unless stake or admissibility changes).

## 8. Research design before any operational interpretation

A retrospective, non-trading study can compare fixed units such as $5, $10, $25 and $50 with multiple utilization targets, explicit eligibility tolerances, and matched alternatives: (a) top-ranked concentrated units, (b) unrestricted equal-weight 1/N within a predeclared fixed universe, (c) fractional-Kelly or other probability-sensitive sizing as *scientific comparators only*, (d) cash, and (e) one unit per shared-risk cluster. A fair comparison must hold the data, time window, execution assumptions, risk budget and opportunity universe constant and separately report unmatched variants.

The dataset must preserve contemporaneous executable bid/ask depth, fee schedules and changes, timestamps, contract specifications, resolution criteria, model probability vintages, ex ante forecasts, economic-event linkage, dependence clusters, settled outcomes, canceled or unfilled orders, and capital availability at each decision time. No hindsight-ranked edge, future data leakage, midpoint fills, cross-side double counting, repeated apparent units, or invented independent samples are admissible.

Use a time-ordered evaluation with held-out periods and class-level splits; report calibration and uncertainty coverage as well as predictions. Estimate dependence under weather-day/station, games, releases, and shared model shocks; stress test a common forecast miss and settlement delay. Report realized net P&L, annualized or horizon-matched wealth growth only where warranted, return on total purse, return on committed cash, drawdown distributions, left-tail conditional loss, catastrophic-loss frequency, capital turnover, active distinct economic exposures, effective outcome diversity, and uncertainty intervals. Prevent cherry-picking among many \(b,\rho,\delta\) settings by predeclaring primary tests and checking stability beyond the selected set.

The study has **not** been run. It has no backtest result, acceptance threshold selected for deployment, capital allocation approval, or engineering handoff. Independent science review should precede any later attempt to use it in a venue-specific system.

## 9. Scientific context and evidence boundaries

The research of 2026-10-04, [Trading the belief path](https://github.com/lenticule-science/science-services-section/blob/main/services/social-science-services-section/services/economics-and-business-science-services-section/services/finance-science-services-section/content/text/documents/articles/notes/2026/10/04/2026-10-04-note-on-trading-the-belief-path.md), distinguishes executable entry price, bid-at-exit, marked midpoint, settlement profit and belief-path profit. Those are **research accounting distinctions**, not permission to modify a desk. The current work adds a distinct question: how expanding wealth, a fixed ticket size, the admissible opportunity universe, and dependence-adjusted diversity bound one another. The algebra is stated in §10. A source-checked and competing scholarly literature review, with what may and may not transfer to prediction contracts, is in §11. No scholarly portfolio result alone establishes this strategy's empirical profitability.

## 10. Capital–diversity–opportunity triangulation (2026-10-14 extension)

**Claim status:** the following are new, elementary algebraic consequences of explicitly stated models. They are not empirical findings about Kalshi. The "frontier" is a derived mapping between three measurable quantities, not a proposed platform configuration.

### 10.1 Three different quantities, not two synonyms

For a fresh purse with no previous encumbrance, define:

1. **Purse** \(W\), the total wealth supporting allocations; **stake unit** \(b\), a constant chosen independently of purse wealth; and **deployment target** \(\rho\), not necessarily a mandate.
2. **Eligible market supply** \(M_{\delta,t}\), the number of *distinct economically described exposures* that pass a predeclared uncertainty, fee, venue-liquidity, admissibility and edge-tolerance test \(\delta\) at time \(t\). Distinct exchange tickers are not necessarily distinct exposures, and not all identified exposures are mutually independent.
3. **Effective risk breadth** \(D_t\), a measure derived from the joint distribution of accepted outcomes, **not** from the number of tickers and not automatically the Shannon entropy of nominal stake weights.

The basic count relation is

\[
N_t^{\rm cap}=\left\lfloor\frac{\rho W}{b}\right\rfloor,\qquad
N_t^{\rm accepted}\leq\min(N_t^{\rm cap},M_{\delta,t}).
\]

Equality in the second relation is only possible when liquidity, account encumbrance, venue rules, dependence restrictions and other guards do not constrain acceptance further. Actual utilization is \(\rho_{\rm actual}=bN_t^{\rm accepted}/W\) in the constant-unit idealization. Unlike conventional fixed-1/N portfolios, \(N_t^{\rm cap}\) grows with capital but \(M_{\delta,t}\) is an external, potentially finite economic supply.

The **inverse, supply-to-capital direction** is as informative as the demand direction. Given \(M\) simultaneously eligible unit opportunities, the continuous crossover wealth for the chosen utilization target is

\[
\boxed{W_{\rm cross}=\frac{bM}{\rho}}\qquad(\rho>0).
\]

For wealth above this crossover, the required target *in continuous units* exceeds supply. Because real allocations use integer units, the first strict underfill of the \(\lfloor \rho W/b\rfloor\) target happens at \(W\geq b(M+1)/\rho\), assuming all \(M\) can actually be bought in full. These are different thresholds; the distinction matters near saturation. The unallocated fraction must increase as \(W\) increases beyond supportable breadth **unless** the unit, eligibility boundary, target deployment or opportunity production rate changes.

**Worked counterexample.** Let \(b=\$10\), \(\rho=0.6\), and suppose exactly \(M=100\) economically eligible simultaneous markets. The continuous crossover is \(W=\$1{,}666.67\) (rounded), while integer-unit target underfill begins at \(W=\$1{,}683.33\) (rounded). At a $2,000 purse the target is 120 units, but only 100 can be accepted; therefore at most $1,000, or 50% of wealth, can be deployed without abandoning one of the assumptions. If all 100 trade opportunities do not fit the $10 unit because of lot size or order depth, actual capacity is lower still. Holding cash is a valid result, not a mathematical failure.

### 10.2 An inverse law for genuinely diversified exposure

The equicorrelated, equal-variance model in §5 provides a tractable controlled test. Let the unit-return variance be \(\sigma^2>0\), with constant pairwise correlation \(r\in[0,1)\) among the selected events. Define *variance-equivalent independent units* as the number \(D_{\rm var}\) of independent, equally volatile equal-weight investments that would produce the same variance of average unit return. This gives

\[
\boxed{D_{\rm var}(N,r)=\frac{N}{1+(N-1)r}
=\frac{1}{r+(1-r)/N}.}
\]

The equality follows by comparing \(\sigma^2[1+(N-1)r]/N\), the variance of the mean of \(N\) equicorrelated unit returns, to \(\sigma^2/D_{\rm var}\), the variance of a mean of independent units. It assumes equal unit-return variances, common pairwise correlation, and equal weighting. It is **not** identical to Meucci's entropy-derived effective-number-of-bets (ENB), which decomposes correlated portfolios into uncorrelated sources of risk. Nor is \(D_{\rm var}\) a count of independent ontological events; it is a model-dependent variance equivalent.

For any fixed positive \(r\), \(\lim_{N\to\infty}D_{\rm var}(N,r)=1/r\). A larger purse can finance more listed contracts while barely adding a unit of independent risk breadth:

| Purse \(W\) | Nominal units at \(b=\$10,\rho=0.6\) | \(D_{\rm var}\) with illustrative \(r=0.20\) |
|---|---:|---:|
| $500 | 30 | 4.4118 |
| $2,000 | 120 | 4.8387 |
| $10,000 | 600 | 4.9669 |

These numbers assume **unlimited eligible markets**. If only 100 qualify, effective breadth stops at \(100/[1+99(0.20)]=4.8077\), regardless of purse size, under the same covariance assumptions.

**Reverse design equation.** Given a target independent-variance equivalent \(D^\star>0\), positive correlation \(0\leq r<1\), and target utilization, the minimum nominal exposure count in this model is

\[
N_{\min}(D^\star,r)=
\left\lceil\frac{D^\star(1-r)}{1-D^\star r}\right\rceil
\quad\text{when }D^\star r<1.
\]

The budget needed to have capacity for \(N_{\min}\) positions is then

\[
W_{\min}=\frac{bN_{\min}}{\rho}
\]

provided at least \(N_{\min}\) opportunities are admissible, independently fundable, liquid at \(b\), and not prohibited by stress-loss constraints. This is a capacity condition, **not an instruction to accumulate or spend** a particular wealth amount. If \(D^\star r\geq1\), the strict target is impossible for any finite \(N\) in the \(r>0\) equicorrelation model (for equality \(D^\star r=1\), it can be approached only as \(N\to\infty\)). If \(r=0\), \(D_{\rm var}=N\). For negative correlations or heterogeneous variances the simple "effective number" can cease to behave like a count, and the complete covariance or scenario distribution must replace it.

**Exact arithmetic check.** When \(r=1/5\), \(D^\star=4\), the inverse requires exactly 16 units, so with \(b=\$10\), \(\rho=3/5\), one needs capacity \(W\geq \$800/3\). Raising the target to \(D^\star=49/10=4.9\) requires exactly 196 units, or \(W\geq \$9{,}800/3\). A supply of only 100 eligible exposures makes 4.9 infeasible at that correlation even with unbounded purse wealth. A target of 5 is asymptotic, not feasible with finite units. These rational checks illustrate why floating-point ceilings near exact integers need care; they are *model arithmetic*, not finance observations.

**Research problem:** observed or estimated outcome covariance is not constant, and extreme co-loss often differs from average correlation. Our future measure of market diversity should therefore report (a) distinct settlement/economic events, (b) entropy of stake weights, (c) dependence-adjusted variance equivalence under declared scenarios, (d) factor-entropy ENB when its decomposition and risk contributions are well-defined, and (e) stressed joint loss. One scalar should not pretend to replace all five.

### 10.3 Opportunity supply is a tolerance-dependent frontier

Let \(\delta\) denote a chosen eligibility tolerance, \(\ell\) a liquidity boundary, and \(\mathcal U_t\) the universe of contemporaneously available economic events. Define, schematically,

\[
M_{\delta,\ell,t}
=\#\{i\in\mathcal U_t:
\text{identity distinct};\
\text{liquidity at }b\geq\ell;\
\text{net-edge lower bound }g_i^-\geq\delta;\
\text{eligible under other declared guards}\}.
\]

All quantities must be evaluated with only information available *at the decision time*. If \(\delta\) is lowered to admit less favorable bids, \(M_{\delta,\ell,t}\) can grow, but that is not necessarily an increase in the number of profitable opportunities. If the bound is not calibrated, apparent growth in "eligible" supply may just be more forecast error. Dependencies between events also change with selection: a threshold may admit many new markets whose payoffs all depend on one latent variable.

For equally sized, independent, simultaneously settled and correctly priced candidate units ordered by decreasing true net edge \(g_{(k)}\), the discrete increments satisfy

\[
E[\Delta W_{N+1}]-E[\Delta W_N]=b\,g_{(N+1)}.
\]

The purse increase needed to support each *additional* target unit is \(b/\rho\) away from integer-boundary subtleties. Thus, in a continuous interpolation, the **marginal expected dollars returned per additional purse dollar** while opportunities last is approximately \(\rho\,g_{(N)}\). This is the precise "triangulation" between purse growth, rank-dependent edge supply and realized deployment capacity. If marginal true \(g_{(N)}\) crosses zero, *forcing* the target has negative marginal expected profit. If qualified supply saturates, the numerator of expected profit cannot continue growing merely because the purse grows, so expected return measured against the *whole purse* may decline.

Those conditions are intentionally stronger than the general situation: in practice probabilities, execution costs, adverse selection, horizons, dependence and liquidity vary, and true \(g_i\) is unobservable. A portfolio-wide objective may admit a negative standalone edge for hedging, but that requires a measured joint benefit, not a higher purse balance.

### 10.4 The time axis: a market supply *flow* as well as a market supply *stock*

For rapidly resolving markets, the instantaneous number of eligible open positions is only one measure of diversity. Let \(\lambda\) be the average rate of **new, qualifying, economically distinct accepted events** per unit time and \(\tau\) their mean time from capital commitment to capital release. Under a stable and stationary flow satisfying Little's law,

\[
E[N_{\rm outstanding}]=\lambda E[\tau].
\]

Consequently, a full $b unit in every qualifying outstanding event supports approximately \(b\lambda E[\tau]\) dollars of concurrent principal, and the corresponding continuous purse crossover is

\[
W_{\rm flow}\approx \frac{b\lambda E[\tau]}{\rho}.
\]

This is an application of an established queueing theorem to **funding-inventory accounting**, not a claim that market events obey its conditions automatically. The throughput of fresh committed principal is instead approximately \(b\lambda\) dollars *per unit time*; turnover cannot be inferred from the stock count alone. If a fixed group of event families generates successive highly correlated hourly contracts, its large event flow need not imply large cross-sectional risk diversity. Common delays, failed fills, nonstationary event arrivals, settlement bottlenecks and recycled losses may violate the stationary model.

**Illustrative controlled case:** five eligible accepted events arrive per hour and each locks capital for four hours. The stationary model predicts around 20 concurrently occupied $10 units, or $200 in committed principal. A 60% target can be filled at the continuous crossover only for a purse of about $333.33; buying 100 superficially different tickers in the same four hours would change this conclusion only if their economic identities, supply and liquidity actually warranted it.

### 10.5 Hypotheses produced by triangulation

- **H6 — capital saturation.** Holding \(b,\rho,\delta,\ell\) fixed, rising wealth eventually causes target deployment shortfalls if the admissible economic-event supply is bounded, even while realized nominal participation may remain profitable.
- **H7 — breadth saturation.** Adding event-contract listings that share drivers increases nominal \(N\) much faster than realized effective risk diversity or reduces neither forecast-error loss nor stress drawdown proportionately.
- **H8 — opportunity-quality frontier.** When purse growth pushes selection farther down an ex-ante ranked opportunity list, the incremental realized, friction-adjusted benefit decreases faster than a stationary constant-edge model predicts; an explicit idle-cash policy may outperform forced utilization.
- **H9 — flow-stock distinction.** Shorter lock time improves the funding-stock/throughput relation conditional on qualified arrival rate, but is insufficient evidence of higher net economic profit or independent risk breadth.

Research should estimate the **surface** \(D_{\rm risk}(W,b,\rho,\delta,\ell,t,\text{dependence model})\), together with expected profit on total purse, drawdown, stressed covariance and capital-time, not just a curve of listed tickers versus wealth. A threshold or entropy measure selected after seeing profits must be tested on a later held-out period. No production policy is inferred.

## 11. Primary research consulted, with transfer boundaries

The following sources are actual scholarly publications or identifiable working papers with a publisher, journal, central-bank, NBER or original author record checked on 2026-10-14. **Access boundary:** this pass checked publication metadata, primary abstracts and available official descriptions; it does not claim that every paywalled full article was read. Meucci's original working-paper text was also inspected in an accessible HTML reproduction (https://doczz.net/doc/8851166/managing-diversification1), while the journal/SSRN publication record independently confirms its identity; the paper's numerical illustrations are **examples under its stipulated portfolio assumptions**, not estimates of event-market breadth. A mathematical derivation in §10 remains *our model* even where these papers motivate its structure. The key literature is deliberately adversarial rather than a handpicked endorsement.

| Source and permanent locator | What it actually addresses | Legitimate role here, and limitation |
|---|---|---|
| H. Markowitz, "Portfolio Selection," *Journal of Finance* 7 (1952), 77–91. https://doi.org/10.1111/j.1540-6261.1952.tb01525.x | Portfolio risk is a property of allocations and joint returns, not a count of assets alone. Publisher's article record confirmed. | Foundation for covariance-based risk; not a model of resolved binary event contracts, order books or fixed-dollar tickets. |
| J. L. Evans and S. H. Archer, "Diversification and the Reduction of Dispersion," *Journal of Finance* 23 (1968), 761–767. https://doi.org/10.1111/j.1540-6261.1968.tb00315.x | Empirical diversification by portfolio breadth in securities. Publisher bibliographic record confirmed. | Precedent for asking how quickly marginal diversity gains saturate; **no empirical coefficient from that paper is carried into this note** without full review. |
| R. C. Grinold, "The Fundamental Law of Active Management," *Journal of Portfolio Management* 15 (1989), 30–37. https://doi.org/10.3905/jpm.1989.409211 | Relates active investment performance to forecasting skill and **independent** decision breadth under its theoretical assumptions. Publisher record confirmed; full article not accessed. | Research lead for why skill, independent opportunities and breadth interact; not a proof that adding weak-edge event markets increases wealth or that empirical information ratio obeys an exact square-root law here. |
| A. Meucci, "Managing Diversification," *Risk* (2009), 74–79; expanded working-paper abstract. https://papers.ssrn.com/sol3/papers.cfm?abstract_id=1358533 | Constructs a diversification distribution over uncorrelated bets and a factor-entropy-based effective number of bets (ENB); proposes a mean-diversification frontier. Author/publisher metadata and paper text (sections 2–3 and appendix discussion, accessible as an HTML reproduction) checked; original PDF not accessed in this pass. | Most directly relevant methodology for effective diversity. The paper's worked examples show that a portfolio of superficially widespread or equal weights can be concentrated in relatively few risk factors, and that modest portfolio changes can greatly alter its factor-diversification measure under stated assumptions. **Do not equate** ENB with \(N\), nominal stake entropy, or our equicorrelation variance-equivalent count without a worked transformation; the published stock-portfolio examples are not measured results for event contracts. |
| V. DeMiguel, L. Garlappi and R. Uppal, "Optimal Versus Naive Diversification," *Review of Financial Studies* 22 (2009), 1915–1953. https://doi.org/10.1093/rfs/hhm075 | In seven stock datasets and 14 tested models, none of the optimized methods consistently beat 1/N out of sample on stated criteria; estimation error undermined naive optimization's competitors. Publisher abstract checked. | Motivates testing simple equal units when probability/covariance estimates are noisy, **not** universal optimality of 1/N or event-market stake sizes. |
| C. Kirby and B. Ostdiek, "It's All in the Timing: Simple Active Portfolio Strategies that Outperform Naïve Diversification," *Journal of Financial and Quantitative Analysis* (2012). https://www.cambridge.org/core/journals/journal-of-financial-and-quantitative-analysis/article/its-all-in-the-timing-simple-active-portfolio-strategies-that-outperform-naive-diversification/05D18E04B226C6E9B8441482CC92F943 | Counterpoint to broad reading of DeMiguel: with different designs and controls, optimized strategies can outperform 1/N; turnover and transaction costs are crucial. Publisher abstract checked. | Prevents mistakenly declaring equal-unit betting superior by appeal to one paper; timing and frictions must be explicit. |
| J. B. Berk and R. C. Green, "Mutual Fund Flows and Performance in Rational Markets," *Journal of Political Economy* 112 (2004), 1269–1295. https://doi.org/10.1086/424739 | Rational model of decreasing returns to scale in active investment management and competitive capital flows. Publisher and NBER abstracts checked. | Distinct theoretical analogue for capital outgrowing alpha/capacity; **does not empirically establish** our chosen power-law rank-edge decay in prediction markets. |
| C. F. Manski, "Interpreting the Predictions of Prediction Markets," *Economics Letters* 91 (2006), 425–429. https://doi.org/10.1016/j.econlet.2006.01.004 | Formal market equilibrium with heterogeneous traders; contract price need not simply identify a universally agreed event probability. Publisher abstract checked. | Justifies treating \(q_i\) as an independently estimated and uncertainty-bearing quantity rather than copying the ask/mid price into it. |
| J. Wolfers and E. Zitzewitz, "Interpreting Prediction Market Prices as Probabilities," Federal Reserve Bank of San Francisco Working Paper 2006-11; NBER 12200. https://www.frbsf.org/research-and-insights/publications/working-papers/2006/04/interpreting-prediction-market-prices-as-probabilities/ | Provides conditions under which prices approximate mean beliefs; recognizes risk aversion and belief heterogeneity as important parameters. Fed and NBER abstracts checked. | Necessary balancing evidence against overgeneralizing Manski: prices can be useful signals but an estimated *edge* still requires a tested probability model and executable prices. |
| E. Snowberg and J. Wolfers, "Explaining the Favorite–Long Shot Bias: Is it Risk-Love or Misperceptions?," *Journal of Political Economy* 118 (2010), 723–746. https://doi.org/10.1086/655844 | Uses horse-race betting data and compound bets to study probability misperception behind observed longshot bias. Publisher and NBER abstracts checked. | Motivates investigating whether the weak-opportunity tail is systematically mispriced, **not** assuming every event market or side exhibits horse-race bias. |
| J. D. C. Little, "A Proof for the Queuing Formula: L = λW," *Operations Research* 9 (1961), 383–387. https://doi.org/10.1287/opre.9.3.383 | Under its stationary, finite-mean conditions, mean work-in-progress equals arrival rate times mean time in system. Publisher's original abstract checked. | Supplies stock–flow accounting in §10.4 when opportunities arrive and funded contracts settle; says nothing about profitability or statistical independence. |
| Kalshi Research, "Calibration in Prediction Markets — Theory and Evidence," published August 2026. https://kalshi.com/research/publications/calibration | Venue-sponsored analysis of 2,243,741 historically resolved markets reports strong aggregate calibration near settlement, with class/volume variation. Primary venue abstract checked. | **Not independent peer review**, and aggregate calibration is not evidence that the proposed long-tail trades have positive edge after fees. Useful as a provenance-marked empirical context, not a substitute for an independent out-of-sample study. |

The next scientific receiving test is *not* a connector configuration: verify the algebra on synthetic independent, positively correlated and perfect-common-shock cases; estimate an effective-risk measure on real historical outcomes with event-family clustering; build a later-period, shadow-only evaluation of purse-size/stake-size/opportunity-supply surfaces. Preserve any failures and contrary findings. A successful historical simulation, if eventually obtained, must not be called a deployed or profitable strategy.

## 12. Current finding

The proposal is mathematically coherent as a **bounded unit of participation plus a chosen breadth objective**. It equalizes nominal principal at risk per identified exposure, raises the number of capital participations with wealth when enough admissible events exist, and can reduce idiosyncratic risk without scaling the wager size.

The newly identified **two-way triangulation** is that eligible opportunity supply imposes an upper bound on capital supportable at a chosen fixed dollar unit and utilization target, while the dependence structure imposes a potentially much stricter bound on *effective* diversity. Bigger purse \(\not\Rightarrow\) more independent bets once economic-event supply or common-risk saturation binds. Conversely a required risk breadth, combined with a fixed unit, determines a conditional minimum purse capacity—*only* when enough suitable exposures exist.

It does **not** ensure that extra markets have edge, that listed markets are independent, that a fixed dollar risks the same variance at different odds, that wider portfolios beat concentrated portfolios, or that compulsory deployment is prudent. The empirical science question is the shape of the *admissible, dependence-adjusted, time-priced long tail*: how many genuinely distinct opportunities exist, at what marginal net value and common-loss cost, as capital expands?

**Boundary:** research note only. No changes to Kalshi production, allocation settings, venue accounts, risk policy, executables or deployed strategies follow from this note.
