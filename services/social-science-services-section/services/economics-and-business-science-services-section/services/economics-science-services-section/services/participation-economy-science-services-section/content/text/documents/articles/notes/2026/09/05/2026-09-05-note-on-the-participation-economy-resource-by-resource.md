---
title: "The participation economy, resource by resource"
description: "The economist office's study of the participation economy in the shape of the founder's own Hive attention-stake note, run over the whole economy rather than one platform: tokenomics, what is actually rewarded, forms of capital, commodity forms, passive and recurring income, scalable and extractive strategies against the anti-bot line, liquidity and the KYC witness-deletion point, and the minmax stated as a sizing problem under a labor budget with risk of ruin -- every figure cited to a resource row or a first-party source with its date, house coinage stated as coinage, unknown left unknown."
date-created: 2026-09-05
type: notes
authors:
  - claude-sonnet-5
---

# The participation economy, resource by resource

This note runs the founder's own [reading of Hive as an attention-stake economy](../../../../../../../../../../../../../../../../../public-services-section/services/personal-services-section/emsenn-services-section/content/text/documents/articles/notes/undated/hive-as-an-attention-stake-economy-capital-yield-labor-governance-and-liquidity.md)
— tokenomics, what is actually rewarded, forms of capital, commodity forms,
passive and recurring income, scalable and extractive strategies, liquidity,
worked examples — over the whole participation economy rather than one
platform, per the [five economies of earning](../../../../../../glossary/concepts/five-economies-of-earning.md)
concept's own statement that this is the method every one of the five
economies is studied by. The rows this note cites are projected once, ahead
of this prose, at
[`2026-09-05-participation-economy-resource-rows.json`](../../../../../../../../../../../../../../../../../561-group-services-section/services/561-group-operations-services-section/services/561-group-economic-operations-services-section/data/records/2026-09-05-participation-economy-resource-rows.json)
(24 rows, each validated against the [resource-row schema](../../../../../../../../../../../../../../../../../engineering-services-section/services/computer-engineering-services-section/services/computer-systems-engineering-services-section/services/computer-economic-systems-engineering-services-section/data/records/schema/resource-row.schema.json)),
projected from the two measurement records the 561 Group No Buy Services
Section's Rain Barrel already holds
(`2026-09-05-no-buy-broad-surface-measurement.json`,
`2026-09-05-no-buy-provider-and-incumbent-measurement.json`). Every figure
below cites a row by name — carrying its own `observedOn` date and
`evidenceStatus` — rather than restating the row's fields; `unknown` in a row
stays `unknown` here, never guessed into a number.

## 1. The economy as an economic object

The [participation economy](../../../../../../glossary/terms/participation-economy.md) is the house's
own founded term (ruled by the founder 2026-09-05) for the economy in which a
person earns by participating — attention, engagement, play, movement,
learning, curation, resource-sharing, quests, or supplying training data —
rather than by wage, salary, contract, or gig, paid in sats, tokens, credits,
or inference rather than dollars. The [five economies of earning](../../../../../../glossary/concepts/five-economies-of-earning.md) concept
carries the axes this note does not restate: what is paid for, who dispatches
the work, and what it is paid in. The participation economy is the one point
on all three axes where the payout is not bearer money — nobody or a platform
dispatches it, and it pays in the platform's own unit — which is what ties it
to [money science](../../../../../../../../../../../monetary-economics-science-services-section/content/text/glossary/topics/money-science.md):
a bearer instrument is an obligation with its provenance deleted, so that it
owes anyone, from anyone, for anything, while a witnessed exchange keeps the
record of who did what attached to the value. Every row in the resource-row
record carries an issuer, a rail, and — where established — witnesses,
because a participation-economy payout is exactly this kind of witnessed
object: a Hive curation reward is attached to the vote that produced it
(row `Hive Power`), a ZBD referral payout is attached to the referee who
passed KYC (row `sats (ZBD)`), an inference credit is bound to the account
that opened it (rows `Gemini CLI / Gemini API free-tier quota` through
`GitHub Copilot Free completions`). The payout is closer to a
[wit](../../../../../../../../../../../monetary-economics-science-services-section/content/text/glossary/terms/wit.md),
one witnessed distinction-step, than to a dollar, and §8 below reads every
resource's exit into dollars as exactly the step where that witness is
deleted.

## 2. Is five a good taxonomy?

Yes, on the axes the concept carrier states, and the test for a sixth is
already implied by them rather than invented here. The five names are five
bundles of settings on three axes — what is paid for, who dispatches it, what
it is paid in — not five values of one axis: wage and salary differ only on
the first axis (hours vs. a period), contract and gig differ only on the
second (a client vs. a platform), and participation differs on the third,
which is also the only axis on which one of the five departs from bearer
money entirely. A taxonomy of bundles on a small number of orthogonal axes is
falsifiable in the right way: a sixth economy would have to differ from all
five existing bundles on at least one axis's value, not merely acquire a new
name for an existing bundle. Two candidates the field note already tested and
rejected on exactly this ground: commons-based peer production and
participatory economics (parecon) each read, on inspection of their own
founding texts, as a different thing from participation-economy earning —
neither is about an individual receiving a direct payout for participating,
which is the one feature every measured surface in the accompanying record
shares (field note §8, §12, §16). A live candidate for a sixth bundle that
the taxonomy does not yet resolve is the passive/yield case this note's §6
below documents (Hive curation, B3TR staking, HBD's conversion path): these
pay for holding capital already earned rather than for a fresh act of
participation, engagement, or attention, which is a fourth possible value on
the "what is paid for" axis (a stock rather than a flow) that neither wage,
salary, contract, gig, nor participation as stated names cleanly — the
existing taxonomy currently folds yield into "participation" because the
payout is still platform-denominated and witnessed, but a future pass could
test whether yield deserves its own bundle rather than the same one as
attention and labor. Each of the five existing bundles has a literature or a
house section that already carries it in depth (five-economies-of-earning.md;
field note §14): wage and salary by labor economics (Mincer's earnings
function), contract by the economics of contracting (Coase, Grossman and
Hart), gig by the sharing/gig-economy literature (Schor, Sundararajan) and
the house's own gig-work-science-services-section, and participation by no
existing outside literature at all — which is why this program, not an
outside field, is its ground (field note §1-§13).

## 3. Tokenomics, per currency and credit

Grouped by rail, from the resource-row record:

- **Hive blockchain rail** — `HIVE` (currency, issuer unknown per the
  cited sources, measured 2026-09-05), `Hive Power` (credit, vested HIVE,
  measured against `hive.blog/faq.html` 2026-09-05), `HBD` (currency,
  self-reported against `v4v.app` 2026-09-05), and `Hive resource credits`
  (credit, issuer Hive blockchain, self-reported against
  `developers.hive.io` 2026-09-05). Hive's own account-creation path is
  itself a resource-credit-denominated free tier: `claim_account` funds an
  Account Creation Token from an existing account's Resource Credits, an
  alternative to the 3-HIVE `account_create` fee (row `Hive resource
  credits`, `developers.hive.io/tutorials-recipes/account-creation-process.html`,
  2026-09-05).
- **Hive-Engine sidechain rail** — `Hive-Engine tokens` (commodity, varying
  per-game symbol; dCity's SIM token is closed to new issuance as of
  2026-09-05, TerraCore's SCRAP-denominated loop remains live per its own
  package, measured 2026-09-05).
- **VeChainThor (VeBetterDAO) rail** — `B3TR` (commodity, issuer
  VeBetterDAO, measured against `vebetter.com` 2026-09-05T20:00:00Z).
- **Ethereum (Brave Rewards ledger) rail** — `BAT` (currency, issuer
  unknown per the cited sources, self-reported against
  `brave.com/brave-rewards/` 2026-09-05).
- **Bitcoin / Lightning Network rail** — three distinct sats-denominated
  rows, kept separate because each names a different issuing platform with
  different mechanics: `sats (Wavlake)` (musicians paid by listener
  zaps/tips, measured 2026-09-05), `sats (ZBD)` (polls, streaks, and a
  KYC-gated referral bonus, self-reported against
  `zbd.gg/zbd-friends-with-benefits` 2026-09-05), and `sats (Stacker
  News)` (zaps and a pooled daily fee-funded reward, self-reported against
  `stacker.news/faq` 2026-09-05).
- **Base (Coinbase L2) rail** — `Base USDC drips` (currency, issuer
  unknown per the cited sources — Zealy hosts the campaigns but is not
  itself USDC's issuer — self-reported against `zealy.io` 2026-09-05).
- **Platform-internal inference-quota rails, no chain** — nine credit rows,
  one per provider once the record's prior single folded row was split:
  `Gemini CLI / Gemini API free-tier quota` (Google, measured against
  `google-gemini.github.io/gemini-cli/docs/quota-and-pricing.html`
  2026-09-05T20:22:01Z), `Workers AI neurons` (Cloudflare, self-reported
  against `developers.cloudflare.com/workers-ai/platform/pricing/`
  2026-09-05T19:43:57Z), `Groq API free-tier quota` (measured against
  `console.groq.com/docs/rate-limits` 2026-09-05), `Cerebras free signup
  credits` (measured against `cerebras.ai/pricing` 2026-09-05), `NVIDIA
  NIM (build.nvidia.com) free API credits` (measured against a staff reply
  on NVIDIA's own developer forum, 2026-09-05), `OpenRouter free-model
  (':free') quota` (measured against `openrouter.ai/docs/api-reference/limits`
  2026-09-05), `SambaNova Cloud free-tier quota` (measured against
  `docs.sambanova.ai/docs/en/models/rate-limits` 2026-09-05), `Hugging Face
  Inference Providers free credit` (measured against
  `huggingface.co/docs/api-inference/pricing` 2026-09-05), and `GitHub
  Copilot Free completions` (measured against GitHub's own billing docs,
  2026-09-05, noting GitHub Models itself retired 2026-07-30 per the same
  docs).
- **No settlement rail (scarce inputs)** — `attention-hours`, `identity
  slot`, and `device/IP`: none of these is issued by a platform (each row's
  issuer reads "n/a, not issued"), and `streak state`
  (credit, ZBD's own consecutive-day counter, self-reported against ZBD's
  App Store listing 2026-09-05).

## 4. What is actually rewarded, per surface class

Reading the rows by `laborForm`/`yieldForm` rather than by rail groups
surfaces the actual reward classes the field note's §3-§12 literatures
name:

- **Attention and engagement** — viewing ads (`BAT`, laborForm), daily
  polls (`sats (ZBD)`), completing quests/bounties (`Hive-Engine tokens`,
  `Base USDC drips`, `attention-hours` via Gitcoin/Algora bounty boards,
  measured 2026-09-05).
- **Content production and curation** — posting/authoring (`Hive Power`
  laborForm: a 7-day payout window paid partly as vested Hive Power, per
  `hive.blog/faq.html` 2026-09-05), curating by voting stake within the
  same window (`Hive Power` yieldForm: up to 50% of a post's reward pool to
  curators, with an early-vote penalty inside the first 5 minutes, same
  source), and uploading/publishing (`sats (Wavlake)` laborForm: musicians
  paid directly by listener zaps, measured against `wavlake.com`
  2026-09-05).
- **Logging a sustainability or physical action** — `B3TR` laborForm:
  photographing reusable-mug use or logging a litter cleanup within a
  VeBetterDAO x2earn app, no per-action rate disclosed by the cited source
  (`vebetter.com/article/mugshot-app-sustainable-cup`, 2026-09-05T20:00:00Z).
- **Granted, not earned** — the inference-credit rows added in §3 above
  (`Cerebras`, `NVIDIA NIM`, `Hugging Face`, `GitHub Copilot Free`) each
  carry `laborForm: "none"`: the credit is issued at signup or monthly to
  an eligible account, not paid out for an act of participation, which
  places them on the zero-price side of the economy (§1's citation of the
  participation-economy term: free-tier AI access is the provider paying
  the participant in usage, data, and lock-in rather than the participant
  earning a payout for an action).
- **Referral** — a recurring reward class across three separate surfaces,
  each with its own rate and gate: ZBD pays a $2 sats bonus to both
  referrer and referee once the referee "signs up and passes KYC," plus a
  20% (30% after 5 referrals) ongoing match of the referee's ZBD
  Arcade/Playtime earnings for one year (row `sats (ZBD)`, self-reported
  against `zbd.gg/zbd-friends-with-benefits` 2026-09-05); Stacker News pays
  referrers 10% of a referred user's ongoing rewards indefinitely, per its
  own FAQ, with no KYC stated (row `sats (Stacker News)`, self-reported
  2026-09-05).

## 5. Forms of capital a participant holds

Three scarce-input rows name the capital a participant brings before any
payout lands; no platform issues any of them, so their issuer field reads
"n/a, not issued":

- **Attention-hours** — the participant's own time (row `attention-hours`,
  measured against Gitcoin and Algora bounty-board first-party docs,
  2026-09-05); a common-pool-resource in the strict sense the house's own
  [common-pool-resource](../../../../../../../../../../content/text/glossary/terms/common-pool-resource.md)
  term states — costly to exclude anyone from holding, and a hour spent on
  one bounty is not available to spend on another.
- **Identity slot** — a verified real-world identity, reusable and scarce
  across platforms rather than issued by any one of them (row `identity
  slot`; its primary witness, NATIX's Drive& program, itself discontinued
  operations 2026-07-01 per NATIX's own site, so the citation documents the
  identity-gate mechanic rather than a currently live earning surface).
- **Device/IP** — a device or network identifier (row `device/IP`,
  unsettled: no witness on disk yet, left `unknown` rather than assumed
  zero, per the Cistern reconciliation discipline).

Stake itself is a fourth, capital-proper form the rows carry inside specific
resources rather than as its own row: `Hive Power` is vested HIVE staked to
earn curation yield, and `B3TR`'s yieldForm names staking already-earned
B3TR back into an x2earn app (e.g. Cleanify) for additional B3TR yield
(measured against Cleanify's own Freshdesk support article, 2026-09-05) —
capital already earned, redeployed to earn more of the same unit, the
pattern §6 below reads as the economy's yield side.

## 6. Commodity forms

The record's `commodity`-kind rows are tradeable goods or tokens distinct
from a general medium of exchange or a platform-scoped credit: `Hive-Engine
tokens` (a family of per-game Hive-Engine-sidechain tokens — dCity's SIM,
TerraCore's SCRAP — traded on Hive-Engine's own market, issuer unknown
because it varies per game) and `B3TR` (VeBetterDAO's reward token,
distributed through a network of "X-2-Earn" apps for sustainability-flavored
actions, per VeBetterDAO's own site). Both differ from the `credit`-kind
inference-quota rows in exactly the dimension the schema's `kind` field
names: a commodity can, in principle, be traded on a market external to its
issuing app (Hive-Engine's own market for game tokens), while a `credit` like
a Groq or NVIDIA NIM quota carries `liquidity.exitPath: "none"` — it is not
transferable or redeemable at all, platform-bound by construction.

## 7. Passive and recurring income

This is the point where participation stops being a fresh act and starts
being a return on capital already held, per this note's §5-§6 above and the
house's Hive-note template's own "passive and recurring income" section:

- **Hive Power's curation yield** — voting with already-staked Hive Power
  within a post's 7-day payout window earns up to 50% of that post's reward
  pool, recurring for as long as the participant keeps voting and keeps the
  stake (row `Hive Power` yieldForm, `hive.blog/faq.html`, measured
  2026-09-05). This is the resource the field note's five-economy table
  and this note's §2 flag as the taxonomy's open edge: it pays for holding
  and deploying stake, not for a fresh act of attention.
- **B3TR staking yield** — already-earned B3TR staked back into an x2earn
  app (e.g. Cleanify) for additional B3TR, per Cleanify's own support
  article (row `B3TR` yieldForm, measured 2026-09-05).
- **HBD's conversion path as a recurring liquidity service rather than a
  yield** — v4v.app converts HBD (and HIVE) to Bitcoin Lightning sats at a
  0.8% swap fee, capped at 100,000 sats/4hr, 200,000/24hr, 300,000/72hr
  (row `HBD`, self-reported against `v4v.app`, 2026-09-05); this note found
  no rate for an "HBD savings" yield product in either cited measurement
  record, so that candidate stays `unknown` rather than invented.
- **Referral streams named in §4** (`sats (ZBD)`'s ongoing 20-30% match,
  `sats (Stacker News)`'s ongoing 10% share) are recurring so long as the
  referred person keeps earning, which makes referral itself a form of
  passive income on the capital of having recruited someone, distinct from
  the signup-bonus lump sum.

## 8. Scalable and extractive strategies, and the anti-bot line

The field note's §15 states the anti-bot economics test in full and this
note does not restate it, only applies it to the resource rows: a surface's
own extraction ceiling and anti-bot rule name what a scaling strategy runs
into, and the field note's two questions (is the surface human-labor-gated
by design; what does its ToS say about automation or multiple accounts)
decide what a companion — human or automated — may lawfully do about it.
Reading the rows against those two questions:

- **Rate-limited, single-account ceilings** — `Gemini CLI / Gemini API
  free-tier quota` caps at 1,000 requests/day and 60/minute per personal
  Google account (measured 2026-09-05T20:22:01Z); `Workers AI neurons`
  caps at 10,000 Neurons/day (self-reported 2026-09-05T19:43:57Z);
  `OpenRouter free-model (':free') quota` caps at 50 requests/day with no
  lifetime purchase (rising to 1,000/day only after a one-time $10
  purchase, which moves that ceiling out of the no-buy tier), 20/minute
  regardless, with OpenRouter's own ToS explicitly prohibiting reselling
  access or using multiple accounts to bypass per-account limits (measured
  2026-09-05) — a first-party ToS line the field note's §15 test 2 makes
  dispositive on its own, independent of whether the technical limit could
  be defeated.
- **Identity-verification gates as the deliberate anti-scaling
  instrument** — the house's own
  [identity-verification-gate](../../../../../../../../../../content/text/glossary/terms/identity-verification-gate.md)
  term names the general mechanism (a 2025-2026 bounty-platform
  hardening against cheap disposable accounts, raising the fixed cost of
  account creation rather than the marginal cost of one submission), and
  `sats (ZBD)`'s referral bonus is this economy's clean instance: the $2
  bonus pays out only "once the friend signs up and passes KYC" (measured
  2026-09-05), gating the referral-scaling strategy specifically rather
  than general poll/streak earning, which the cited source does not state
  requires KYC at all.
- **Bounty-board risk for an automated participant** — the house's own
  [bounty-honeypot](../../../../../../../../../../content/text/glossary/terms/bounty-honeypot.md)
  term (a two-audience trap: a human-visible dead-project disclaimer paired
  with hidden HTML comments instructing an automated reader to exfiltrate
  its system prompt) is a standing risk on exactly the bounty-board surfaces
  this note's `attention-hours` row cites (Gitcoin, Algora): a companion
  reading bounty listings on a person's behalf should read raw source
  defensively before treating any bounty board's listing as real,
  uncompensated work.
- **The economy's own honeypot analog, dCity's closure** — `HIVE` and
  `Hive-Engine tokens` both carried a stale citation to dCity as an active
  task/quest surface; the house's own dCity package states the game is
  closed to new play as of 2026-09-05, with only already-issued SIM token
  swaps remaining live. This is not an anti-bot control but the same
  practical lesson the anti-bot line teaches: a scaling strategy built on
  one surface's current mechanics has no guarantee the surface stays live,
  and this note's row corrections (§3) now state that closure rather than
  the prior projection's stale laborForm claim.

## 9. Liquidity

Every resource row's `liquidity.exitPath` states this economy's structural
claim directly: exiting to dollars, or to another resource row, is exactly
the step where a payout's witness is deleted and it becomes ordinary money,
per the participation-economy term's own thesis (§1 above). Reading the
rows:

- **No exit at all (platform-bound by construction)** — every one of the
  nine inference-credit rows in §3 carries `exitPath: "none"`: a Groq,
  Cerebras, NVIDIA NIM, OpenRouter, SambaNova, Hugging Face, or GitHub
  Copilot Free quota is not transferable or redeemable, so these units
  never reach the witness-deletion point at all — they can only be
  consumed as inference, never converted.
- **Self-custody exits, no KYC required** — `BAT` can be held and used
  entirely inside a self-custody Brave Wallet with no KYC, per Brave's own
  help center (measured 2026-09-05); `sats (Stacker News)` withdraws over
  Lightning with no government-ID requirement stated (self-reported
  2026-09-05).
- **KYC-gated custodial exits** — `BAT`'s alternative exit, a custodial
  payout account (Uphold, Gemini, bitFlyer, or India-only ZebPay), requires
  KYC performed by the custodian itself, region availability varying
  (measured 2026-09-05); `sats (ZBD)`'s referral bonus specifically is
  gated the same way (§8 above). Each of these is the exact point the
  participation-economy term names: the witness (which poll, which vote,
  which referral produced the value) is deleted the moment the custodian's
  KYC-cleared account receives it as ordinary, bearer-form money.
- **Conversion between rows rather than to dollars** — `HBD`'s only stated
  exit is a conversion via v4v.app (0.8% swap fee, tiered rate caps) to
  Bitcoin Lightning sats, or on-chain to HIVE (self-reported 2026-09-05);
  this is recorded as `exitsToRow: "sats"`, naming the underlying unit
  family rather than any one of this note's three distinct sats rows.
- **Unknown, left unknown** — `HIVE`, `Hive-Engine tokens`, `B3TR`,
  `Base USDC drips`, `Hive resource credits`, `attention-hours`,
  `device/IP`, and `streak state` all carry `exitPath: "unknown"` because
  neither cited measurement record states one; per the Cistern
  reconciliation discipline this is a gap in what has been measured, never
  a claim that no exit exists.

## 10. The minmax

Per the sizing-without-a-bank note's own correction of plain Kelly sizing —
"we cannot do Kelly if we are actually at risk of ruin" is exact for an
actor with a barrier, a draw, and a bounded horizon, which is every
participant this economy actually serves — the participation economy's
minmax is stated here as a sizing problem under a labor budget with risk of
ruin, never as growth-optimal Kelly sizing, which assumes an outside bank
that replays every ruined trajectory.

**Decision variables.** A participant allocates: attention-hours per day
across surfaces (the `attention-hours` scarce input); one identity slot,
spent at most once per surface that gates on it (the `identity slot` scarce
input, KYC or phone-verification consuming it where a surface requires
one); and N devices/IPs, each subject to a surface's own per-device or
per-account rate limit (`device/IP`).

**Objective.** Maximize witnessed payout across the allocation — summed
across the rows this note's rows name, each denominated in its own unit
(wits, per the house reading in §1, rather than dollars, since most rows'
exit paths are unknown or KYC-gated) — over a stated horizon (a day, a
week), not the payout's expected value under an ensemble that no
participant here actually has access to (the sizing note's §2: that
ensemble is available only to an actor who can be replenished from
outside — a bank, a bailout, a frontier — which no surface in this record
offers).

**Constraints.**

1. **The labor budget.** Attention-hours are finite and fungible only
   across surfaces that do not require simultaneous presence; the
   `attention-hours` row's own witnesses (Gitcoin, Algora) measure bounty
   completion in hours spent, not in a rate the record states, so this
   constraint's right-hand side is a fact about the participant, not about
   any row.
2. **The identity-slot constraint.** One identity slot per surface that
   requires KYC or phone verification (`sats (ZBD)`'s referral bonus,
   `identity slot`'s own NATIX-cited phone-verification example); a
   participant cannot spend the same identity slot twice on two surfaces
   that each treat it as scarce, and per-human-slot rationing (the schema's
   `identityCost.perHumanSlot` field) is `unknown` on every row in this
   record, which is itself a measurement gap this note's §11 names.
3. **The device/rate-limit constraint.** Each inference-credit row's
   `extractionCeiling` (§3, §8) is a hard per-device or per-account cap; N
   devices multiply the ceiling only where a surface's ToS does not
   prohibit multiple accounts (OpenRouter's ToS explicitly does, per §8),
   so this constraint's multiplier is 1, not N, on any row carrying that
   ToS language.
4. **Risk of ruin, per the house's own
   [risk-of-ruin](../../../../../../../../../../../finance-science-services-section/content/text/glossary/terms/risk-of-ruin.md)
   term.** The absorbing barriers this economy's own surfaces carry are not
   financial insolvency but surface death (dCity's closure, §8), account
   flag or ban (a bounty-honeypot's system-prompt exfiltration payload,
   §8, or an identity-verification-gate's suspension review, §8), and
   custodian failure (a KYC-gated payout account's counterparty risk,
   §9). None of these barriers is reflecting: once a surface closes an
   account or a game stops accepting new play, no later favorable draw
   returns that trajectory to circulation, per the house's
   [absorbing-barrier](../../../../../../../../../../../finance-science-services-section/content/text/glossary/terms/absorbing-barrier.md)
   term. A sizing rule that reads these ceilings as fixed rather than as a
   time series (a surface can close, as dCity already has) is wrong in the
   same direction the sizing-without-a-bank note names for a rising
   survival barrier.

**Worked examples, no-purchase and no-KYC tier only** (the field note's own
scoping, §16), one per tier this record actually measures, every rate
carrying its `observedOn` date and `evidenceStatus`:

- **Inference-credit tier (no purchase, no KYC, no labor).** Signing up
  for `Cerebras free signup credits` ($5 credit, measured 2026-09-05,
  `identityCost.kycRequired: unknown`), `NVIDIA NIM (build.nvidia.com) free
  API credits` (1,000 credits on a personal email, no card step described,
  measured 2026-09-05), and `Hugging Face Inference Providers free credit`
  ($0.10/month, measured 2026-09-05) consumes zero attention-hours after
  signup and zero identity-slot cost beyond an email address each (per
  each row's `identityCost.detail`) — the labor-budget constraint does not
  bind at all on this tier, and the only constraint that binds is the
  one-time-grant `resetPeriod` each row states, so this tier's dominant
  strategy is simply to hold as many free-credit accounts as a participant
  can register emails for, up to whatever per-account limit each
  provider's ToS states (`OpenRouter`'s explicit multi-account ban, §8, is
  the one row in this record that forecloses that strategy outright).
- **Attention/labor tier (no purchase, no KYC, labor-gated).** `sats
  (Stacker News)` pays no-KYC (self-reported 2026-09-05,
  `identityCost.kycRequired: false`) for peer-to-peer zaps and a pooled
  daily fee-funded reward, plus an indefinite 10% referral share; against
  the labor budget, this is a pure attention-hours trade with no identity-
  slot cost and no device-rate-limit constraint stated in the cited
  source, so the binding constraint is entirely the participant's own
  attention-hours, not a platform ceiling — the opposite binding pattern
  from the inference-credit tier above.

## 11. Open questions

Each stated as a measurable question, not a claim:

1. What per-action B3TR rate or daily cap does VeBetterDAO or any of its
   x2earn apps (Mugshot, Cleanify, GreenCart, EVearn) actually disclose,
   if any — the cited sources for `B3TR` state plainly that no per-photo
   rate or cap is disclosed (measured 2026-09-05); is that a genuine gap
   in VeBetterDAO's own public documentation or only in the pages this
   record's method reached?
2. Does `identityCost.perHumanSlot` (whether a resource is rationed one
   slot per human rather than per account or per device) hold true for
   any row in this record — every row currently states `unknown`, which
   is the single largest gap in the minmax's identity-slot constraint
   (§10.2)?
3. Is there a first-party-documented "HBD savings" yield rate anywhere on
   Hive or a Hive-adjacent service — this note's search of the two cited
   measurement records found none, leaving §7's own naming of the
   candidate unresolved.
4. Does Hive's curation-reward curve (the exact reverse-auction formula
   the field note's `hive-content-rewards` measurement could not confirm
   past a 403 on `developers.hive.io/glossary/curation_curve.html`) change
   the actual size of the yield §7 names for `Hive Power`, and by how
   much at 1, 3, and 5 minutes into the payout window?
5. Given §2's open sixth-bundle candidate (yield on stake as a possible
   fourth value on the "what is paid for" axis, distinct from attention,
   engagement, and labor), does the founder's taxonomy intend yield to
   stay folded into "participation," or does the American participation
   economy need its own internal split between a labor sub-economy and a
   stake sub-economy?
6. What is dCity's SIM token's own current market depth and price, now
   that the game itself is closed to new play (§8) — is the `Hive-Engine
   tokens` row's remaining live value purely the secondary market for
   already-issued tokens, and if so, on what venue?

---

