---
name: note-on-small-account-trading-mechanics-after-the-pdt-retirement
description: >-
  How FINRA's 2026-06-04 retirement of the Pattern Day Trader rule and Alpaca's limited-margin-account structure change what a ~$100 aggressive Alpaca account can mechanically do.
date-created: 2026-08-27
type: notes
authors:
  - claude-sonnet-5
keywords:
  - pattern-day-trader
  - intraday-margin
  - limited-margin-account
  - good-faith-violation
  - free-riding
  - t-plus-one-settlement
  - crypto-trading
  - fractional-shares
  - leveraged-etf
  - options-trading
  - small-account-trading
---

# Small Account Trading Mechanics After the PDT Retirement

Compiled 2026-08-27 from a same-day research pass answering a specific operational question: what is mechanically possible, and what actually binds, for a ~$100 self-designated-risk-capital Alpaca account seeking maximum trading turnover.
The full raw research — every claim, every URL, every access-status tag — is preserved first in [the record this note draws from](../../../../../../../../../../../../../data/records/2026-08-27-small-account-trading-research/mechanics-and-regulation.md), per this corpus's research-persistence norm; this note carries that research forward rather than summarizing it down.
Access-status tags follow house convention throughout: "read directly" (a primary or near-primary page was fetched and read), "search synthesis" (assembled from a search tool's summary across multiple secondary pages, no single primary text read), and **[UNVERIFIED]** (a circulating claim not traced to a primary source, or two sources in conflict and unresolved).

## The spine: a rule that no longer exists, and what replaced it

**The rule most people still assume is in force.** FINRA Rule 4210(f)(8)(B)(ii) defined a "pattern day trader" as a customer who executes four or more day trades within five business days in a margin account, where day trades exceeded 6% of total trades in that account (search synthesis, from FINRA's own [margin interpretations attachment](https://www.finra.org/sites/default/files/2021-03/Margin_Interpretations_Attachment.pdf)).
A PDT-flagged account needed $25,000 minimum equity, maintained at all times; a fourth day trade below that threshold triggered a Day Trading Buying Power Call, and an unmet call meant a 90-day restriction to reduced (commonly cash-covered) buying power (search synthesis, [Wikipedia's Pattern day trader article](https://en.wikipedia.org/wiki/Pattern_day_trader), not independently checked against FINRA primary text for this specific consequence detail).
This framework applied specifically to margin accounts, not cash accounts — a distinction that turns out to matter differently than expected once Alpaca's own account structure enters the picture (see below).

**This rule was retired, effective 2026-06-04.** This is the headline finding, and it corrects a default assumption rather than confirming one — most retail-trading knowledge, and Claude's own January 2026 training cutoff, would default to the old $25k/4-trades-in-5-days framework as current.
On 2026-04-15 the SEC approved FINRA's amendment to Rule 4210 eliminating the PDT framework entirely.
[FINRA Regulatory Notice 26-10](https://www.finra.org/rules-guidance/notices/26-10), read directly: effective **June 4, 2026** (45 days after publication), with an 18-month firm-side implementation window running to October 20, 2027.
The notice eliminates the day-trade-count designation and the $25,000 PDT minimum outright, replacing them with an **Intraday Margin** standard covering margin accounts (explicitly excluding good-faith accounts and portfolio-margin accounts).
Key mechanics, per the same read-directly source (its own paraphrase of FINRA's defined terms, not independently checked against Reg Notice 26-10's verbatim defined-terms section — flagged): an **Intraday Margin Level (IML)** is the amount a customer could withdraw while still meeting margin requirements; an **IML-reducing transaction** is a purchase or short sale (not a short-covering trade); an **intraday margin deficit** is the largest shortfall between required margin and account equity following such a transaction.
A deficit must be resolved within 15 business days; failure to cure by the 5th business day, shown as a pattern, triggers a mandatory 90-calendar-day freeze (no new debits, no new shorts).
De minimis carve-out: deficits under 5% of equity or $1,000 don't count toward the pattern.
Corroborating secondary legal-alert coverage (not independently fetched, title/framing only): [WilmerHale](https://www.wilmerhale.com/en/insights/client-alerts/20260423-sec-approves-amendments-to-finra-rule-4210-replacing-day-trading-margin-requirements-with-a-modernized-intraday-margin-standard) (read directly), [King & Spalding](https://www.kslaw.com/news-and-insights/finra-adopts-sweeping-changes-to-margin-requirements-for-day-trading), [ACA Group: "FINRA Ends the Pattern Day Trader Rule"](https://www.acaglobal.com/industry-insights/finra-ends-the-pattern-day-trader-rule/).
The SEC's own order text (34-105226.pdf) returned HTTP 403 on fetch and was not read directly — **[UNVERIFIED against the primary SEC order language itself]**; the Federal Register filing notice likewise redirected to a CAPTCHA gate and was not read.
Everything above about the new rule's exact mechanics passes through FINRA's Reg Notice 26-10 (read directly, treated as reliable) and secondary summaries, not the SEC order itself — a specific, named gap.

**Alpaca has implemented this.** [Alpaca's own blog post, "FINRA Retires the PDT Rule: Introducing Alpaca's New Intraday Margin Framework"](https://alpaca.markets/blog/finra-retires-the-pdt-rule-introducing-alpacas-new-intraday-margin-framework/), read directly, confirms the June 4, 2026 effective date and states outright: "the minimum equity requirement for 4x intraday buying power has been lowered from $25,000 to $2,000."
That $2,000 figure is Alpaca's own implementation choice within the new framework's discretion — and it is also, separately, Alpaca's long-standing Reg T margin-account minimum (see next section), so Alpaca appears to have unified two previously-distinct thresholds rather than inventing a new one.
The PDT designation and "all PDT-based account restrictions have been removed" from the platform; replaced by a continuously-updated **Intraday Buying Power** figure, **Intraday Margin Calls**, and pre-trade checks that reject "orders that would put your account into a margin deficit."
API-level consequence: the `pattern_day_trader`, `daytrade_count`, and `daytrading_buying_power` fields are deprecated, sunsetting **July 6, 2026**, replaced by a unified `buying_power` field.
Two of Alpaca's own support pages that historically described the old PDT-rejection mechanism (["What is the Pattern Day Trading (PDT) rule?"](https://alpaca.markets/support/what-is-the-pattern-day-trading-pdt-rule) and ["What is pattern day trading protection?"](https://alpaca.markets/support/pattern-day-trading-protection)) both returned HTTP 404 on fetch during this research — consistent with retirement, treated as corroborating rather than contradicting evidence, but not a substitute for reading their replacement content, which was not located.

**What this means mechanically for a $100 account — reasoning carried from the record, not itself a quoted source.** The Intraday Margin framework governs margin actually extended against a position.
A sub-$2,000 Alpaca account gets no margin at all — 1x buying power, cash-covered only (next section) — so there is nothing for an "intraday margin deficit" to be computed against, provided it never shorts (blocked below $2,000 anyway) or buys beyond available cash (blocked by Alpaca's pre-trade check).
Under the old rule, a $100 account was PDT-exempt only in the trivial sense that it would get throttled to cash-covered trading well before ever approaching $25,000 anyway — a moot, self-limiting exemption.
Under the new rule, **unlimited same-day round trips are not blocked by this rule at any account size**, provided no leverage is used — a genuinely more permissive mechanical situation than the old regime produced at this specific size, not merely a relabeling. Alpaca's retirement post does not explicitly state how sub-$2,000 accounts are treated under the new deficit mechanics; the "no deficit is mechanically possible without leverage" conclusion is inference, flagged as such, and worth sanity-checking against a live small account's actual order-rejection behavior before being relied on operationally.

## The second surprise: Alpaca has no cash accounts

This bears directly on the settlement-and-violations question the requester specifically flagged as important, and the answer is not the one the question's framing assumed.

**Alpaca does not offer cash accounts, full stop.** Direct quote, read via [Alpaca support: "Can I have a cash account with Alpaca?"](https://alpaca.markets/support/alpaca-cash-accounts): "No, we do not offer cash accounts." All accounts are margin accounts.
This was corroborated by a second independent fetch of the same page returning the identical quote.
A third-party integration vendor's help article (AlgoCloud, search synthesis) frames Alpaca as offering "Cash (1:1), Overnight margin (2:1), and Intraday margin (4:1)" account types — this is inconsistent with Alpaca's own direct statement and is weighted lower here as informal third-party shorthand for the unleveraged buying-power *mode*, not a distinct account type Alpaca actually sells; where the two conflict, the primary-source quote wins.

**What actually happens under $2,000 equity — the "limited margin account."** Continuing the same page, read directly: "For those accounts with less than $2,000 in equity, we treat them as limited margin accounts, meaning you can trade on unsettled funds and are not limited to waiting for trades to settle before you can use the proceeds to purchase additional securities."
Corroborated independently by [Alpaca: "What are Unsettled Funds?"](https://alpaca.markets/learn/understanding-unsettled-funds), read directly: "we cover the float between the time equities are purchased and settled," "no costs associated with this," and no need to "wait for trades to settle before using the proceeds to buy more equities" — for equities specifically.
The same page carves out an explicit exception: unsettled funds cannot be used to buy crypto, and cannot be withdrawn.
T+1 settlement (below) remains the formal legal settlement timeline throughout — Alpaca fronting the float changes when the customer can *use* proceeds, not when they legally *settle*.

**Good-faith violations and free-riding — the mechanics that classic cash-account brokers enforce, and the open question of whether Alpaca's structure means they don't bind here.** General mechanics, search synthesis across brokerage-education pages ([Schwab](https://www.schwab.com/learn/story/avoid-these-violations-when-trading-cash), [Fidelity](https://www.fidelity.com/learning-center/trading-investing/trading/avoiding-cash-trading-violations), [E*TRADE](https://us.etrade.com/knowledge/library/stocks/understanding-cash-account-violations), [carry.com](https://carry.com/learn/cash-account-violations), [Wikipedia: Freeriding (stocks)](https://en.wikipedia.org/wiki/Freeriding_(stocks))):
a **good faith violation** is buying with not-yet-settled funds and selling that position before the original funding trade has settled — three in a rolling 12 months triggers a 90-calendar-day settled-cash-only restriction.
A **free-riding violation** is buying with no settled cash at all and covering the purchase from the sale proceeds of that same security — a single occurrence triggers an immediate 90-day restriction, more severe than the three-strike GFV rule.
Both derive from Regulation T (12 CFR 220) cash-account payment provisions — the CFR text itself was not read directly this session, **[UNVERIFIED against 12 CFR 220 primary text]**.
The structurally decisive point, repeated across every general-brokerage source checked: "free riding violations only occur in cash accounts... margin accounts have different rules that allow trading with unsettled funds."

Does this apply to a sub-$2,000 Alpaca account? **This is the single most consequential open item in the whole research pass, and it was not resolved to primary-source certainty.**
Three independently-sourced facts point the same direction: Alpaca states it offers no cash accounts; GFV/free-ride rules are, per every general source checked, cash-account-specific; and Alpaca states it fronts the settlement float with no cost and no wait, which is hard to square with GFV enforcement actually running on the same trades.
Together these suggest good-faith-violation and free-riding restrictions likely do **not** bind an Alpaca limited-margin account the way they would at a true cash-account broker (a cash-mode Robinhood, Fidelity, or Schwab account).
But **no Alpaca page was found using the phrase "good faith violation" or "free-riding" and stating directly whether or how it applies** — targeted searches for exactly those phrases against Alpaca's own site returned only generic industry pages and Alpaca's general disclosures index, not a page naming the policy.
This is marked **[UNVERIFIED]** as a specific Alpaca policy statement, notwithstanding the reasonably strong structural inference. The natural resolution is a live-account test: run a rapid same-day funds buy/sell/buy/sell cycle on a real small Alpaca account and watch for a GFV-style warning. That test was not performed in this research pass.

**T+1 settlement itself is solidly confirmed and not in dispute.** Effective **May 28, 2024**, per SEC amendments to Rule 15c6-1(a) (adopted 2023-02-15), covering stocks, bonds, ETFs, certain mutual funds, and exchange-traded limited partnerships; government bonds, commercial paper, and some limited-partnership interests are exempted (search synthesis across [Investor.gov](https://www.investor.gov/introduction-investing/general-resources/news-alerts/alerts-bulletins/investor-bulletins/new-t1-settlement-cycle-what-investors-need-know-investor-bulletin), [Davis Polk](https://www.davispolk.com/insights/client-update/sec-adopts-t-1-settlement-effective-may-2024), [SEC Chair Gensler's 2024 statement](https://www.sec.gov/newsroom/press-releases/2024-62)).
By 2026-08-27 this is over two years old and stable — the backdrop against which Alpaca's float-covering operates, not itself a live question.

## Crypto: PDT-irrelevant by construction, fees are the real governor

Confirmed 24/7/365 via [Alpaca's crypto trading docs](https://docs.alpaca.markets/us/docs/crypto-trading-1), read directly: "Alpaca supports crypto trading 24 hours a day, every day."
Coin list: a base ~20 (AAVE, AVAX, BAT, BCH, BTC, CRV, DOGE, DOT, ETH, GRT, LINK, LTC, MKR, SHIB, SUSHI, UNI, USDC, USDT, XTZ, YFI) plus an 11-coin May 2026 expansion (ADA, ARB, BONK, FIL, HYPE, LDO, ONDO, POL, RENDER, WIF) — search synthesis, roughly 31 total with a stated hedge that overlap/omissions are possible.
Crypto was never subject to PDT (it isn't a "security" under FINRA 4210 — background market-structure knowledge, not a specifically sourced claim this session) and remains doubly moot post-retirement.
Settlement: search-synthesis result states crypto buys and sells settle immediately with no settlement period, consistent with (but not identically sourced to) the equities page's carve-out that unsettled funds cannot fund a crypto purchase — meaning the first crypto buy after an equity sale still waits on that equity's T+1 settlement, but cycling within crypto thereafter is instant. This composite picture is this note's own inference from two separately-sourced claims, flagged as such.

**Fees are where crypto turnover actually gets governed.** [Alpaca's Crypto Maker/Taker Fee FAQ](https://alpaca.markets/support/crypto-maker-taker-gmt-faq), read directly, gives the full 30-day-volume-tiered schedule:

| 30-day volume (USD) | Maker | Taker |
|---|---|---|
| $0 – $100,000 | 0.15% | 0.25% |
| $100,000 – $500,000 | 0.12% | 0.22% |
| $500,000 – $1,000,000 | 0.10% | 0.20% |
| $1,000,000 – $10,000,000 | 0.08% | 0.18% |
| $10,000,000 – $25,000,000 | 0.05% | 0.15% |
| $25,000,000 – $50,000,000 | 0.02% | 0.13% |
| $50,000,000 – $100,000,000 | 0.02% | 0.12% |
| $100,000,000+ | 0.00% | 0.10% |

A $100 account sits permanently at the bottom tier absent a slow cumulative-volume climb (an unmodeled real lever — round trips accumulate 30-day volume even at tiny notional).
A taker-both-legs round trip costs roughly 0.5% of notional; at 20 round trips/day that's a meaningful daily fee drag against turned-over notional (not against the $100 balance itself, unless the full balance round-trips every time — position sizing determines the exact figure, not modeled further).
Minimum order size is **[UNVERIFIED]**: two Alpaca-sourced figures conflict — one pass gave $1/price for USD pairs (from the [crypto coin pair FAQ](https://alpaca.markets/support/alpaca-crypto-coin-pair-faq)), another gave $10/price for USD pairs and 0.000000002 minimum quantity for BTC/ETH/USDT pairs (from the [crypto trading docs](https://docs.alpaca.markets/us/docs/crypto-trading-1)) — not reconciled; check the live `min_order_size` field per symbol before automating around either number. Max single order: $200,000 notional (irrelevant at this scale).

## Fractional shares

[Alpaca's fractional trading docs](https://docs.alpaca.markets/us/docs/fractional-trading), read directly: **$1 minimum notional**, up to 9 decimal places on `qty` or `notional`; market, limit, stop, and stop-limit orders all supported at `time_in_force = Day` (an expansion from an earlier market-order-only implementation, per [Alpaca's own announcement blog post](https://alpaca.markets/blog/fractional-shares-trading-supports-limit-orders-and-extended-hours/), search synthesis).
Verbatim restriction: "we do not support short sales in fractional orders. All fractional sell orders are marked long" — fractional shorting is not possible; you can only sell fractional shares you actually hold.
Extended-hours fractional trading works across pre-market, after-hours, and the overnight session (see below) for both market and limit orders.
Eligible universe: "over 2,000 US equities," per-symbol via the `fractionable` boolean on `/v2/assets` — no static list is authoritative. **[UNVERIFIED]**: a separate search pass claimed "over 5,000 fractionable securities," conflicting with the 2,000 figure above; not reconciled, possibly different snapshot dates or counting scope.

## Leveraged ETFs

No source found describing any special access restriction on leveraged ETFs (TQQQ, SOXL, UPRO, etc.) at Alpaca — these are ordinary exchange-listed ETF shares, not accredited-investor-gated structured products; this is an absence-of-restriction inference, not a positive confirmation, flagged as a soft negative.
**Fractionability of TQQQ/SOXL/UPRO specifically is [UNVERIFIED]**: multiple targeted searches surfaced the existence of the exact question being asked on Alpaca's own community forum ("Does TQQQ support fractional trades?") but never returned an answer; a third-party trading-bot marketing page claims live support for TQQQ, SOXL, UPRO, FAS, TNA, ERX, but is not a reliable source for another company's platform capability. Check the live `fractionable` field per symbol before relying on this.
One forum-thread title, not read in full, suggests TQQQ specifically has at some point been short-restricted/hard-to-borrow — not load-bearing for a $100 account regardless, since sub-$2,000 accounts cannot short at all.

**Volatility drag, as a modeling input rather than a caution.** For a daily-reset k× leveraged ETF, the multi-day realized return compounds the *daily* leveraged return rather than scaling the multi-day underlying return by k: given underlying daily returns r₁...rₙ, the leveraged ETF's cumulative return is the product of (1 + k·rᵢ) across all n days, which is provably not k times the product of (1 + rᵢ) whenever the daily returns aren't all identical.
The standard first-order approximation:

**CAGR_leveraged ≈ k · CAGR_underlying − ½ · k · (k − 1) · σ²_underlying**

with σ²_underlying the underlying's annualized daily-return variance.
The drag term is strictly positive (a loss) for k > 1, since k(k−1) > 0, and scales with the *square* of volatility — second-order in calm/trending conditions, dominant and potentially return-erasing in choppy or high-volatility conditions, regardless of direction.
A leveraged ETF can lose value while its underlying sits exactly flat, purely from realized-variance drag — arithmetic, not a directional call.
This formula is carried here as derived/standard house knowledge, not sourced to one specific paper this session; Cheng & Madhavan's 2009 *Journal of Investment Management* decomposition is the name recalled from general background knowledge and is **[UNVERIFIED — not fetched or confirmed this session]**; a future pass should locate and cite it directly, or find the correct primary reference.
Full derivation context: [volatility-drag glossary term](../../../../../../text/glossary/terms/volatility-drag.md).

## Options: mechanically real, functionally a lottery ticket at $100

[Alpaca's options trading levels page](https://alpaca.markets/support/what-option-levels-or-tiers-do-you-provide), read directly: Level 1 = covered call, cash-secured put; Level 2 adds long call, long put; Level 3 adds spreads, straddles, butterfly spreads, iron condors, other multi-leg strategies, plus everything from Levels 1–2.
No level offers naked/uncovered options — inferred from their absence across all three levels, not from an explicit "we don't offer naked options" statement.
Approval: up to two initial applications, 60-day reapplication wait after a decline, approved level always ≤ rated level (search synthesis, [Alpaca's approval-factors page](https://alpaca.markets/support/what-factors-does-alpaca-consider-when-reviewing-and-approving-options-applications-and-trading-levels)); no options-specific account minimum found, distinct from the $2,000 margin/short-selling threshold.

Mechanically, at $100: cash-secured puts need 100 × strike in cash collateral, workable only for strikes under roughly $1 — essentially no such liquid single-stock options exist, so this is not a real avenue at this size.
Covered calls need 100 shares already owned, impossible above roughly a $1 underlying — also not a real avenue.
**Long calls and long puts (Level 2) are the one mechanically viable path**: full premium paid up front, no collateral beyond that, buyable if premium × 100 ≤ available cash, meaning premiums at or below roughly $1.00/share — deep out-of-the-money and/or short-dated contracts, or options on low-priced/volatile underlyings.
This is real and legal, but functions as a single-contract, binary-payoff instrument with no room to size, average in, hedge, or run multiple positions at once.
Commission structure is widely assumed $0/contract, consistent with Alpaca's general commission-free positioning, but **[UNVERIFIED — no specific figure confirmed this session]**.

## Extended hours and overnight sessions

[Alpaca's 24/5 trading docs](https://docs.alpaca.markets/us/docs/245-trading) and [blog announcement](https://alpaca.markets/blog/alpaca-introduces-stock-trading-from-4-am-to-8-pm-et/), search synthesis: pre-market 4:00–9:30am ET, regular 9:30am–4:00pm ET, after-hours 4:00–8:00pm ET, and an overnight "24/5" session 8:00pm–4:00am ET, with the full window running continuously from 8:00pm ET Sunday through 8:00pm ET Friday.
Extended-hours orders require `extended_hours: true` and are limit-only (`time_in_force` of `day` or `gtc`; no market orders extended-hours).
Risk disclosure, search synthesis from [Alpaca's Extended Hours & Overnight Risk Disclosure PDF](https://files.alpaca.markets/disclosures/library/ExtHrsOvernightRisk.pdf): reduced liquidity, incomplete fills, delays or rejections, wider spreads, and volatility spikes on news.
The classic tactic of buying near one session's close and selling after the next session's open specifically to dodge a "day trade" count is now **moot** given the PDT retirement above — there is nothing left to count. The sessions remain useful for the separate, still-live reason of execution-quality tradeoffs, not as a regulatory workaround.

## Realistic maximum turnover — reasoning built from the above, not a separately sourced figure

**Equities:** no round-trip cap was found post-2026-06-04, and GFV/free-ride restrictions plausibly don't bind Alpaca's structure (flagged unverified above).
Binding constraints are economic: the $1 fractional minimum clears trivially at $100; commissions are $0 (general positioning, not re-verified this session); the real per-trade cost is bid-ask spread, low single-digit basis points on liquid large-caps, higher on illiquid names.
Dozens of round trips per day are mechanically permitted; spread cost as a fraction of a $100 position is the practical ceiling, not any tripped rule.

**Crypto:** also mechanically unbounded in count, but the 0.25% taker fee at the unavoidable bottom volume tier is the real governor — a strategy round-tripping more than roughly 5–10 times/day needs directional edge exceeding about 0.5–1% per round trip just to break even on fees.

No external source gives a single "max round trips/week" number for either venue; this whole section is this note's own derived reasoning from the mechanical facts above, carried forward from [the record](../../../../../../../../../../../../../data/records/2026-08-27-small-account-trading-research/mechanics-and-regulation.md)'s section 8, and should be labeled as reasoning, not citation, wherever it propagates further.

## Full gap list, carried forward and not dropped

Ten specific unresolved items, each from the source record, flagged in place rather than smoothed over:

1. GFV/free-ride applicability to Alpaca's limited-margin accounts — strong structural inference against, no direct Alpaca statement found, needs a live-account test.
2. Crypto minimum order size — $1/price vs. $10/price conflict across two Alpaca-sourced passes, unreconciled.
3. TQQQ/SOXL/UPRO fractionability at Alpaca specifically — not confirmed from primary source.
4. Exact options commission figure at Alpaca — assumed $0/contract, not independently confirmed.
5. SEC order text (34-105226.pdf) — 403'd on fetch; new-rule detail passes through FINRA's Reg Notice 26-10 and secondary legal alerts, not the SEC's own order language.
6. Fractionable-universe size — "over 2,000 US equities" vs. "over 5,000 fractionable securities," unreconciled.
7. Volatility-drag formula's specific academic citation — carried as derived house knowledge; Cheng & Madhavan 2009 recalled by name but not fetched or confirmed this session.
8. Whether Alpaca's post-June-2026 documentation explicitly addresses sub-$2,000 accounts under the new deficit mechanics — it does not, as far as this pass found; the "no deficit possible without leverage" conclusion is this note's own inference.
9. Whether cumulative 30-day crypto volume from many small round trips can realistically climb Alpaca's fee tier from a $100 base — a real if slow lever, not modeled or sourced further.
10. Regulation T (12 CFR 220) primary text — the GFV/free-ride mechanics rest on brokerage-education secondary sources, not the CFR text itself.

A future re-verification pass with live Alpaca API/account access should prioritize items 1, 2, and 3 — they're the three most directly actionable for anyone actually building against this account, and all three are resolvable in minutes against a real `/v2/assets` or `/v2/account` response rather than requiring further search.

## Related notes from the same commission

This note covers the regulatory/mechanical layer only.
Three parallel same-day notes cover the strategy and sizing questions the mechanics above set the boundaries for: [documented edges at retail scale](./2026-08-27-note-on-documented-edges-at-retail-scale.md) (which anomalies survive commission-free/fractional $100 scale), [capacity as a small-account advantage](./2026-08-27-note-on-capacity-as-a-small-account-advantage.md) (why some edges are only available below an institutional capacity ceiling), and [growth-optimal sizing when ruin is cheap](./2026-08-27-note-on-growth-optimal-sizing-when-ruin-is-cheap.md) (Kelly sizing under the assumption that the utility of $0 equals the utility of the stake). None of the three were read in the course of writing this note; the link is a same-day, same-commission relation stated for navigation, not a claim of consistency-checked overlap.
