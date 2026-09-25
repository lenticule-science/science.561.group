---
title: "The retail investing assistant field"
description: "The research-analyst's field read for Alpaca Assist: what the measured incumbent AI/decision-support tools, robo-advisors, and belief/thesis journals actually do and charge; where a decision-support tool crosses into regulated investment advice; what the behavioral-finance literature says about retail investors' beliefs and trading; and what none of the measured tools do."
date-created: 2026-09-05
type: notes
name: 2026-09-05-note-on-the-retail-investing-assistant-field
status: draft-for-owner-review
authors:
  - claude-sonnet-5
keywords:
  - alpaca-assist
  - meet-then-beat
  - personal-quant-platform
  - investment-advisers-act
  - regulation-best-interest
  - disposition-effect
  - belief-record
---

# The retail investing assistant field

This note is the research-analyst office's field read for Alpaca Assist — one of the 561 Group's
series of assist apps, alongside EVE Assist (live at eve-assist.561.group) and Gig Assist (planned) —
a decision-support assistant for a retail investor holding an Alpaca brokerage account (paper or live).
Its theory is the personal quant platform thesis
([2026-09-05-note-on-the-personal-quant-platform.md](2026-09-05-note-on-the-personal-quant-platform.md)),
moved into this section's own notes during this lot from its prior seat under the alpaca-services-section
in engineering:
a user's beliefs are first-class, typed data — distinct from observations, forecasts, valuations,
policies, and order intents — translated into falsifiable forecasts, combined with point-in-time
evidence, and allocated under the user's own mandate, with decision support only (the human decides)
and provenance on every fact. This note does not write the business plan or decide the MEET/BEAT
contract; per the meet-then-beat skill, that synthesis belongs to the executive. It carries the
measured rows, the regulatory line, the behavioral-finance literature, the measured absence, and the
glossary search misses this office is bound to report.

All facts below are rows in
[2026-09-05-alpaca-assist-incumbent-measurement.json](../../../../../../../../../../../../../../../../../561-group-services-section/services/561-group-operations-services-section/services/561-group-economic-operations-services-section/services/561-group-business-operations-services-section/services/561-group-finance-operations-services-section/services/561-group-investment-services-section/data/records/2026-09-05-alpaca-assist-incumbent-measurement.json)
(80 rows across five arenas), measured 2026-09-05 from first-party pricing pages, privacy policies,
help centers, developer documentation, and open specifications wherever a page was reachable; a
capability this session could not reach is a row with `result: "not found"`, never an omission.

## 1. What the incumbents do and what they charge

**Retail investing assistants (AI/decision-support tools, 48 rows).** Composer (by SoFi) ships a free
"Build and Backtest" tier with AI-generated trade ideas and a no-code strategy editor, and gates live
automated trading behind a $32/mo ($384/yr annual) Trading Pass; new accounts are carried by Alpaca
Securities LLC or Apex Clearing, with no path found to connect an existing outside brokerage account.
Robinhood Cortex ships free inside Robinhood Gold ($5/mo) as "investing intelligence that turns market
data into insights"; Robinhood's own privacy policy states user chat inputs to its AI features "may be
used to train, test, improve, or enhance" that AI, while carrying an explicit "not investment advice"
disclaimer. Public.com's Alpha is free to all Public investors (a third-party $4/mo claim is contradicted
by Public's own help article and recorded as a conflict) and carries the most direct disclaimer measured:
"Output from Alpha should not be construed as investment research or recommendations, and should not
serve as the basis for any investment decision." Magnifi, Seeking Alpha Premium/Alpha Picks, and Motley
Fool Stock Advisor were largely inaccessible to this session's fetch tooling (client-rendered pages,
bot-gating, or 403s); Fidelity's and Schwab's in-app AI pages returned a 403 and an authorization error
respectively — all recorded as `not found` rows with next-evidence, never as absence. Wealthfront (0.25%
AUM/year) and Betterment (0.25%–0.65% AUM/year, tiered) were measured as adjacent robo-advisor incumbents
per meet-then-beat step 2, not as same-job AI-assistant peers: both automate allocation rather than
exposing a belief/forecast interface to the user.

**The monetization cell, quoted from each product's own privacy policy**, repeats the same hedge shape
the gig-assist measurement found in Hurdlr: Composer's policy states "Composer does not sell personal
information for monetary consideration" and in the same section discloses that sharing "limited Composer
financial and demographic data" with advertising/marketing companies "may be considered a 'sale' or
'sharing'... under certain state privacy laws." Betterment's policy states "We do not sell, rent, or
trade your personal information with any third parties other than with your consent or as required by
law" and separately admits its own ad-targeting sharing "may constitute a 'sale'... under certain State
Privacy Laws," resting the distinction on "Betterment never receives monetary payments in exchange for
personal information." Robinhood's policy discloses sharing "hashed email address or your device ID with
marketing partners," with the only unqualified no-sale commitment found scoped to phone numbers, not data
generally. No measured product in this arena combines an unqualified no-sale claim with no ad-network
sharing and no AI-training-on-user-input, all three at once — see §4.

**Alpaca as upstream provider (8 rows), never a rival.** Trading API: commission-free for self-directed
individual cash accounts trading US-listed securities/options via API, margin interest 6.25%, $0
easy-to-borrow fee. Market Data: Basic is free (IEX equities only, indicative options feed, 200 calls/min,
30-symbol WebSocket cap, latest-15-minutes restricted) versus Algo Trader Plus at **$99/month** (all US
exchanges, full OPRA feed, 10,000 calls/min, unlimited WebSocket symbols, no historical restriction).
Alpaca Connect/OAuth is a standard OAuth2 authorization-code flow with three scopes
(`account:write`, `trading`, `data`); Alpaca's own page carries a direct risk-shifting disclosure: "the
use or granting of any third party access to your account information or place transactions in your
account at your direction is solely at your risk" — language Alpaca Assist's own OAuth grant screen
should mirror. News API is free during a stated beta (rate-limited by the underlying market-data plan),
sourced via a Benzinga partnership, with no stated beta end date.

**Belief-and-thesis journals (15 rows).** TradesViz (free / $14.99/mo Pro / $22.49/mo Platinum),
Edgewonk ($197/16 months), and Kinfo (free / $24.90/mo Pro / $44.90/mo Pro+) all measured as
post-trade performance-and-checklist journals. TraderSync's own pricing page returned HTTP 403 to this
session both times it was tried; its $29.95–$79.95/mo figures and "Cypher AI" assistant are recorded only
as a third-party discovery lead, not a confirmed first-party fact. Savvy Trader's pricing page rendered
only its homepage tagline ("Explore, Create, Share and Trade Virtual Paper Portfolios"). See §4 for the
falsifier/horizon finding.

**Wallet login and agent payments (8 rows, standards not products).** EIP-4361 (Sign-In with Ethereum)
defines a 13-field message with `domain`, `address`, `uri`, `version`, `chain-id`, `nonce`, and
`issued-at` required; its `nonce` is "REQUIRED... at least 8 alphanumeric characters" to prevent replay,
and `expiration-time`, when present, "MUST be an RFC 3339 datetime string." EIP-191 defines the
`0x19`-prefixed signed-data format specifically so a signed message "is not valid RLP" and cannot be
mistaken for a transaction. ERC-1271 lets a smart-contract wallet validate a signature via
`isValidSignature(bytes32, bytes) returns (bytes4)`, "MUST return the bytes4 magic value 0x1626ba7e when
[it] passes." CAIP-122 explicitly reframes EIP-4361 as one chain-specific instance of a general
chain-agnostic sign-in format, addressed via CAIP-10/CAIP-2 identifiers. The x402 v2 specification
defines an HTTP 402 response carrying an `accepts` array of `PaymentRequirements` (`scheme`, `network`
in CAIP-2 format, `amount`, `asset`, `payTo`, `maxTimeoutSeconds`); its facilitator exposes `/verify`
(checks a payment payload without touching the chain) and `/settle` (broadcasts it); the `exact` scheme
on EVM has the payer sign an EIP-3009 `transferWithAuthorization` message off-chain, so the payer needs
no native gas token and the facilitator pays gas and calls the token contract.

**Upstream compute (1 row).** Per instruction, Cloudflare Workers/Workers AI/D1 free-tier figures are
not re-measured here; they are already first-party facts in the gig-assist measurement
(`561-group-work-services-section/data/records/2026-09-05-gig-assist-incumbent-measurement.json`).
Alpaca Assist's own per-call compute profile (LLM tokens for belief elicitation and forecast
construction) against those ceilings is untested and recorded as the row's `unknown_reason`.

## 2. The regulatory line: when decision support becomes investment advice

**The publisher's exclusion.** The Investment Advisers Act of 1940 defines "investment adviser" broadly,
then excludes "the publisher of any bona fide newspaper, news magazine or business or financial
publication of general and regular circulation" (15 U.S.C. § 80b-2(a)(11)(D), via
[law.cornell.edu/uscode/text/15/80b-2](https://www.law.cornell.edu/uscode/text/15/80b-2), fetched
2026-09-05). In *Lowe v. SEC*, 472 U.S. 181 (1985) (decided June 10, 1985), the Supreme Court held that
the petitioners' investment newsletters fell within that exclusion and that neither an unregistered
publisher's status nor a prior SEC order against one of them justified restraining future publication —
reading the Act as reaching person-to-person advice, not advice "given in general periodicals." The
exclusion is publisher-shaped and impersonal: it protects a publication of "general and regular
circulation," not a tool that tailors its output to one identified user's portfolio, mandate, or holdings.
Public.com's own Alpha disclaimer ("should not be construed as investment research or recommendations...
should not serve as the basis for any investment decision," §1) reads like an attempt to stay
publisher-shaped even while the interface is personalized and conversational; whether that combination
still fits the exclusion, or instead crosses into personalized advice because Alpha responds to one
user's specific portfolio and prompts, is exactly the boundary Alpaca Assist's own belief-ledger and
forecast surfaces must be built against, cited to counsel rather than assumed.

**SEC Regulation Best Interest** (adopted 2019-06-05, Release No. 34-86031, effective 2019-09-10,
compliance date 2020-06-30; [sec.gov/files/rules/final/2019/34-86031.pdf](https://www.sec.gov/files/rules/final/2019/34-86031.pdf),
confirmed via a 2026-09-05 search of sec.gov's own small-business compliance guide) applies to a
**broker-dealer** "making a recommendation of any securities transaction or investment strategy involving
securities... to a retail customer," requiring the broker-dealer to act in that customer's best interest
"without placing their financial or other interest ahead of the retail customer's interests." Reg BI's
scope is the broker-dealer's *recommendation*, not any decision-support software as such; a tool that
narrates evidence, forecasts, and a belief-implied valuation without itself recommending a specific
transaction sits outside Reg BI's core obligation as written, but the line between "showing a
belief-conditioned discount" and "recommending a trade" is exactly the boundary a belief-ledger UI
can cross by phrasing alone — unverified against counsel, stated here as a research flag, not a ruling.

**FINRA robo-advice guidance — a correction to the task's own premise.** The brief for this note named
"FINRA Regulatory Notice 16-10" as the robo-advice guidance to cite. Fetched directly from
[finra.org/rules-guidance/notices/16-10](https://www.finra.org/rules-guidance/notices/16-10) on
2026-09-05, Regulatory Notice 16-10 (dated April 4, 2016) is titled "Direct Purchases and Bank Loans as
Alternatives to Public Financing in the Municipal Securities Market" and contains no reference to
robo-advisors or digital investment advice. The correct first-party document is FINRA's **Report on
Digital Investment Advice** (March 2016;
[finra.org/rules-guidance/guidance/reports/digital-investment-advice](https://www.finra.org/rules-guidance/guidance/reports/digital-investment-advice)),
which frames "digital investment advice tools" as either financial-professional-facing or client-facing,
and calls for "sound governance and supervision, including effective means of overseeing suitability of
recommendations, conflicts of interest, customer risk profiles and portfolio rebalancing," while stating
plainly that the report "does not create any new legal requirements or change any existing broker-dealer
regulatory obligations." Per house discipline, falsehood is corrected in place rather than annotated: any
future carrier citing "Regulatory Notice 16-10" for robo-advice guidance should cite this report instead.

**The SEC's 2023 predictive data analytics proposal is withdrawn, not pending.** Proposed 2023-07-26
(published in the Federal Register 2023-08-09, File No. S7-12-23, "Conflicts of Interest Associated with
the Use of Predictive Data Analytics by Broker-Dealers and Investment Advisers"), the rule would have
required firms to "eliminate, or neutralize the effect of," conflicts arising from technologies that
"optimize for, predict, guide, forecast, or direct investment-related behaviors or outcomes." The SEC
formally withdrew it on 2025-06-12 as part of a batch withdrawal of fourteen proposed rules
([sec.gov/rules-regulations/2025/06/s7-12-23](https://www.sec.gov/rules-regulations/2025/06/s7-12-23),
fetched 2026-09-05), stating "The Commission does not intend to issue final rules with respect to these
proposals" and that a future proposal, if any, "will issue a new proposed rule." Alpaca Assist is not
built under a live predictive-data-analytics conflicts rule; it should still track this file number, since
the Commission's own withdrawal notice leaves the door open to a future proposed rule in the same area.

## 3. What the behavioral-finance literature says about retail investors' beliefs and trading

Three papers bound the empirical case for a platform that treats a retail investor's beliefs as
first-class, falsifiable data rather than noise to filter out:

- **Barber, B. M., & Odean, T. (2000). "Trading Is Hazardous to Your Wealth: The Common Stock Investment
  Performance of Individual Investors." *The Journal of Finance*, 55(2), 773–806.** Using discount-brokerage
  account records, the paper finds that households that trade more frequently earn markedly lower net
  returns than households that trade less, consistent with overconfidence driving excess trading that
  costs (rather than earns) the trader money net of transaction costs.
- **Odean, T. (1998). "Are Investors Reluctant to Realize Their Losses?" *The Journal of Finance*, 53(5),
  1775–1798.** The paper that names the **disposition effect**: using the same class of brokerage-account
  data, it finds investors show "a strong preference for realizing winners rather than losers," a pattern
  not explained by portfolio rebalancing, avoiding the trading costs of low-priced stocks, or subsequent
  performance, and one that produces worse after-tax outcomes for a taxable account.
- **Barber, B. M., & Odean, T. (2013). "The Behavior of Individual Investors." Chapter 22 in *Handbook of
  the Economics of Finance*, Vol. 2B, pp. 1533–1570. Elsevier.** The survey chapter that ties the above
  together: individual investors underperform standard low-cost benchmarks, exhibit the disposition effect,
  are heavily swayed by limited attention and recent (not fundamental) performance when choosing what to
  buy, engage in naive reinforcement learning from past pleasurable/painful outcomes, and hold
  under-diversified portfolios.

Read against the personal quant platform theory's central claim — that a belief is private model
structure worth mediating, not noise to suppress — this literature is a caution, not a rebuttal: it
documents that *unmediated* retail trading built on unexamined belief and reflexive reaction is
systematically costly. It is exactly the case for the theory's typed pipeline (belief → forecast →
valuation → mandate-conditioned policy → cost-aware order intent, each a separate, revisable, auditable
record) rather than either suppressing a user's beliefs entirely (the standard robo-advisor's move) or
acting on them unexamined (the standard self-directed trader's failure mode this literature measures).

## 4. What none of the measured tools do

Stated as measured absence from the 80 rows in the record, not as inference from the theory:

- **No measured incumbent lets a user record a belief together with an explicit falsifier and a stated
  time horizon, separate from the trade log itself.** TradesViz offers "Trading Goals," checklists, and a
  "Trading Plans/Checklist and Mistake Analysis" feature; Edgewonk offers a free-text "Notebook" with
  image upload and setup checklists; Kinfo's "Trading Journal" is framed around post-trade performance
  tracking. None of the fetched feature descriptions names a field or workflow for a pre-trade,
  falsifiable proposition with a stated horizon — each measured journal is a post-trade record, not a
  belief ledger. (TraderSync and Savvy Trader could not be fetched first-party this session on this
  question and are recorded as `not found`, not as confirmed absent.)
- **No measured product's privacy policy combines an unqualified no-sale commitment, no ad-network data
  sharing, and no AI-training-on-user-input, all three at once.** Composer and Betterment each state an
  unqualified-sounding no-sale sentence immediately followed by an admission that their own ad-targeting
  data sharing may itself constitute a legal "sale" under state privacy law; Robinhood's own policy states
  user chat/AI inputs "may be used to train, test, improve, or enhance" its AI functionalities. This is the
  same hedge shape the gig-assist measurement found in Hurdlr and Para — see §1.
- **No measured AI-assistant product's own first-party page states provenance per fact** (an effective
  time, an observation time, and a named model/data version on each individual claim it surfaces).
  Public.com's Alpha carries the field's clearest disclaimer ("should not serve as the basis for any
  investment decision," §1 and §2), but a disclaimer is not the same claim as per-fact provenance; none of
  the fetched pages describes binding a claim to a content-addressed universe snapshot, belief-state
  snapshot, and model version the way the personal quant platform theory's "point-in-time truth" section
  requires.
- **No measured incumbent decomposes a single scalar "score" into the theory's six typed stages**
  (observation, belief, forecast, valuation, policy, order intent) as separate, individually auditable
  records. Every AI-assistant surface measured (Cortex, Alpha, Composer's trade-idea generator) presents
  a single conversational or scored output; none exposes the intermediate typed objects the theory calls
  for.
- **No measured incumbent lets a user connect an existing outside brokerage account into the tool**
  rather than opening a new account with the tool's own broker-dealer partner. Composer opens new accounts
  through Alpaca Securities LLC or Apex Clearing; Robinhood Cortex, Public.com Alpha, Wealthfront, and
  Betterment are each themselves the brokerage of record. This is the inverse of Alpaca Assist's own
  premise (an assistant *for* an existing Alpaca account holder, not a new-account funnel), and it is a
  measured, not inferred, gap: no first-party page for any AI-assistant or robo-advisor product measured
  in this arena named a Plaid/SnapTrade/OAuth-style connection to an account the user already holds
  elsewhere.

## 5. Search misses (glossary check)

Per the office's duty to check the house glossaries before treating a term as ruled and to record a
search miss as data, `mcp__markdown-vault__search_markdown_vaults`-equivalent grep coverage of every
`content/text/glossary/**/*.md` file in the tree was run for the following terms on 2026-09-05.
**Found already glossed**: `x402` and `EIP-3009` (both defined under
`economics-science-services-section/content/text/glossary/terms/`, alongside `x402-facilitator`,
`x402-bazaar`, `transfer-with-authorization`, `settlement-primitive`, `agent-to-agent-commerce`, and
related terms) — used above without coinage. **Not found anywhere in the glossaries** (recorded as misses,
not coined):

- `belief record` / `belief ledger` / `belief-conditioned` (the personal quant platform theory's own
  vocabulary is not yet in a glossary term)
- `personal quant platform`
- `alpaca-assist`, `eve-assist`, `gig-assist` (the assist-app family names)
- `sign-in with ethereum` / `SIWE` / `EIP-4361`
- `EIP-191`
- `ERC-1271` / `erc-1271`
- `CAIP-122`
- `wallet login`
- `publisher's exclusion`
- `regulation best interest`
- `robo-advice`
- `disposition effect`

No term above was coined or used as though ruled; each is either a plain description (this note's own
prose) or an external standard's or paper's own name, cited to its primary source in §§1–3.

## Anomalies noticed outside this office's lane

- **The task brief's own citation was wrong.** "FINRA Regulatory Notice 16-10" does not exist as
  robo-advice guidance; it is an unrelated municipal-securities notice. See §2 for the correction and the
  right first-party citation (FINRA's March 2016 Report on Digital Investment Advice). This is reported
  here, not silently substituted, per the house rule that falsehood is removed and replaced with truth,
  never annotated — but a *task premise*, unlike a corpus carrier, is corrected in the deliverable itself
  rather than edited in place elsewhere.
- **The program carrier and the theory doc moved during this lot, as the task itself warned they might.**
  `561-group-investment-services-section/README.md` did not exist when this lot started and was written
  by the executive while this measurement was in progress; the incumbent-measurement record is that
  section's first `data/records/` carrier. Separately, `PERSONAL-QUANT-PLATFORM-THEORY.md` moved out of
  `alpaca-services-section` (engineering) into this section's own notes, re-seated as
  `2026-09-05-note-on-the-personal-quant-platform.md` with `status: ruled` — this note's link to it was
  updated in place once the move was discovered via the link-resolver gate (§ below) failing on the old
  path. Both are reported here as the concurrent-write friction the house's shared-worktree convention
  expects, not as defects.
