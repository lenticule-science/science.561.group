---
collection-provenance:
  collected-by: claude-sonnet-5/money-science-section-standup
  collected-on: 2026-08-21
  collected-for: money-science-services-section standup (task money-science)
  source-path: "lib/emsenn/services/561-group/services/561-group-services-section/services/561-group-operations-services-section/services/561-group-enterprise-services-section/services/561-group-board-of-directors/lib/legacy/2026-08-03-executive-office/services/finance-and-market-services-section/content/documents/union-monetary-and-financial-statistics-guide.md"
  note: >-
    Frozen legacy dump under lib/legacy/2026-08-03-executive-office; copied
    verbatim, source stays frozen. This is the estate's most rigorous prior
    money-science artifact: an IMF-MFSMCG-style compilation guide that
    repeatedly proves the negative -- no Union monetary aggregate exists --
    while cataloging exactly what carries a wit's Landauer/topological/
    proof-debt grounding without ever becoming settled currency. Directly
    supports the founding note's claim that money requires provenance
    deletion to circulate: this guide is a record of provenance being kept
    (denomination heterogeneity reported, never converted; absence reported
    as "unknown," never "zero"), i.e. of a currency register that has NOT
    yet forgotten enough to function as bearer money.
---

# Union Monetary and Financial Statistics Guide

*A compilation guide for the Union of Harmonious Colonies, in the style of the IMF's Monetary and Financial Statistics Manual and Compilation Guide (MFSMCG). Draft status: compiled from primary repository records only. No aggregate has ever been compiled; this guide specifies how one would be, and where compilation is presently blocked.*

Prepared by: Executive Officer to the Leader (leader-movement-team), acting under `translating-leader-intent` / `procuring-enterprise-services` scope.
Date: 2026-07-23.

---

## 0. Status of this guide

This is a **compilation guide**, not a **compiled statistic**. No monetary aggregate, no financial balance sheet, and no sector account exists anywhere in the repository as of this writing. The CFO's own office record states plainly: *"no books exist yet, and no allocation currency has been settled"* (`lib/emsenn/services/561-group/services/board-of-directors/services/executive-office/content/offices/chief-financial-officer.json`, `unrealized[0]`). Every section below states what *would* count, under what rule, *if and when* a register opens — never what presently totals to a number, because no number presently exists to total.

Settled facts this guide will not contradict, all from Leader decisions on record:

- The unit name **wit** and the border receipt-pair name **tally** were adopted by the Leader on 2026-07-19, four words: *"wit yes with tally"* (`lib/emsenn/services/561-group/services/board-of-directors/services/executive-office/content/glossary/terms/wit.md`, `tally.md`). Adoption named the unit; it did not open a currency register, seat a monetary aggregate, or make wit legal tender for any settlement.
- No denomination is fixed as Union currency. Book entries carry whatever denomination their source states, and a `denomination-settled` flag that starts `false` and stays `false` until the CFO office affirmatively exercises its own settle-the-denomination power (`book-entry.schema.json`, property `cost.denomination-settled`).
- No books have ever been posted. The `book-entry` schema exists (seated 2026-07-16); no populated pool of entries under `data/books/` is evidenced in this compilation.
- Price forms only at a counterparty border. There is no global price system, no central quote, and no Finance-set rate — Finance may observe whether an ask and a bid cross for one exact lot, never select or aggregate a price (`sku.schema.json`, `pricing.priceFormation: "counterparty-border-offer"`; `witness-bit-commodity.schema.json`, same constant).
- The Leader accepted a sequencing of **liturgy → epitaxy → currency**, currency last (2026-07-23 session, cited in the consolidated economic record below). This guide is written for the liturgy/epitaxy stage; it does not anticipate a currency register that does not yet exist.
- Venue-access enterprises (Kalshi, Polymarket) own **external** USD/USDC funding rails under their own credentials; those rails are not Union-internal settlement and are not counted as Union monetary aggregates here.
- Hive/Hive-Engine accounts exist at Aagaard (the Union's Hive wallet fleet) holding native HIVE, HBD, and VESTS balances. These are external-chain financial assets, not Union currency, and are reported at native units only — no USD conversion is available or asserted in the source record used here.

Primary sources read for this guide (paths repeated at point of use below):
1. `lib/emsenn/services/561-group/services/board-of-directors/services/executive-office/lib/schemas/book-entry.schema.json`
2. `lib/emsenn/services/561-group/services/board-of-directors/services/executive-office/services/finance-and-market-services-section/content/schemas/sku.schema.json`
3. `lib/emsenn/services/561-group/services/board-of-directors/services/executive-office/services/finance-and-market-services-section/content/schemas/witness-bit-commodity.schema.json`
4. `lib/emsenn/services/561-group/services/red-cup-engineering/services/web-services-section/services/organizing/src/writing/x402/index.mts`
5. `lib/emsenn/services/561-group/services/rsc-quiescent/services/brokerage-control-api-federation/services/union-consideration-settlement-service/src/settlement-provider.mjs` and `package.json`
6. `lib/emsenn/services/561-group/services/board-of-directors/services/executive-office/content/offices/chief-financial-officer.json`
7. `lib/emsenn/services/561-group/services/board-of-directors/services/executive-office/content/glossary/terms/wit.md`, `tally.md`
8. `lib/emsenn/services/561-group/services/board-of-directors/services/executive-office/services/leader-movement-team/content/documents/articles/notes/2026/07/23/2026-07-23-the-union-as-an-economy-a-consolidated-record.md` (a swept, source-cited record of the Leader/AI sessions that produced wit/tally/the settlement rail — used here only for dates and direct quotations already attributed to primary session transcripts, never as a substitute schema)
9. `lib/emsenn/services/561-group/services/board-of-directors/services/executive-office/services/leader-movement-team/data/records/hive-capital-assays/2026/07/23/2026-07-23-union-hive-idle-capital-assessment.json`
10. `lib/emsenn/services/561-group/services/board-of-directors/services/executive-office/lib/schemas/micro-enterprise.schema.json`
11. package.json `x-agentic-metro-enterprise` blocks for enterprises cited by name (Kalshi, Polymarket, Stripe, event-contract-arbitrage-desk, brokerage-independent-witness-and-books, union-consideration-settlement-service, top-level `bare-cedar-fog-colony`)

---

## 1. The statistical perimeter

### 1.1 What "resident" means here

MFSMCG defines the statistical perimeter by residency and institutional-sector classification. The Union's repository already carries a comparable primitive: every enterprise's `package.json` declares an `x-agentic-metro-enterprise.organizational-kind` tag, and separately, `emsenn/schema/micro-enterprise` classifies a unit's *order* — whether it faces an end user directly (`market`), serves another micro-enterprise's order (`node`), or is still pursuing a user it doesn't have (`incubating`) (`micro-enterprise.schema.json`, property `kind`).

No single populated "corporate register" instance enumerating all resident units was found in this compilation (the duty `keeping-the-corporate-register` exists as a duty/skill record, but no swept, current register file was located under `data/records/` at compilation time). **This guide therefore treats residency as derived directly from each unit's own `package.json` metadata, not from a register — consistent with the rule that absence of a compiled register is reported as unknown, not fabricated as a register that does not exist.**

### 1.2 Organizational-kind sectors observed in the repository

A repository-wide scan of `x-agentic-metro-enterprise.organizational-kind` values (package.json files, node_modules excluded) found the following distinct kinds in use, with occurrence counts as observed 2026-07-23:

| organizational-kind | count | MFS-style sector reading |
|---|---|---|
| `micro-enterprise` | 32 | Nonfinancial corporations sector (generic productive unit) |
| `sovereign-state-enterprise` | 20 | Public corporations / general-government-adjacent units acting with independent legal-agent standing |
| `public-protocol-provider` | 9 | Infrastructure / market-facilities sector (protocol rails, not deposit-takers) |
| `service` | 6 | Ancillary financial or nonfinancial services (undifferentiated; needs sub-sectoring before use) |
| `node-micro-enterprise` | 6 | Nonfinancial corporations, internal-customer-facing (chain-group node) |
| `sovereign-research-enterprise` | 3 | Nonfinancial corporations, research/knowledge-production |
| `sovereign-channel-enterprise` | 3 | Nonfinancial corporations, media/distribution |
| `sovereign-venue-access-enterprise` | 2 | **Financial auxiliaries** — see §1.3, Kalshi and Polymarket |
| `sovereign-market-venue` | 2 | Financial market infrastructure |
| `sovereign-federation-enterprise` | 2 | Coordinating/holding structure, not itself a transactor |
| `sovereign-curriculum-enterprise` | 2 | Nonfinancial corporations, education |
| `circuit-board` | 2 | Infrastructure component, not an institutional unit in the MFS sense |
| `ant-colony` | 2 | Governance/simulation structure, not an institutional unit |
| plus singleton kinds | — | e.g. `sovereign-payment-rail-enterprise` (Stripe), `sovereign-trading-desk-enterprise` (event-contract-arbitrage-desk), `sovereign-deterministic-replay-die`, `sovereign-colony` (the top-level `bare-cedar-fog-colony`, `package.json` root) |

This table is a **census of tags in use**, not an MFS sector assignment performed by any accounting authority — no office has ruled that `sovereign-state-enterprise` maps one-to-one to "public corporation." It is offered as the raw material a future sectoring exercise would start from, cited to its own scan rather than asserted as settled classification.

### 1.3 Financial-sector candidates specifically

Only a small number of resident units plausibly belong in an MFS-style **financial corporations sector** (deposit-takers, other financial intermediaries, financial auxiliaries, insurance/pension), and none of them take deposits or issue Union-denominated liabilities today:

- **Kalshi venue-access enterprise** (`kalshi-venue-access-enterprise/package.json`) — `organizational-kind: sovereign-venue-access-enterprise`. Owns the account, API credentials, and **USD/USDC funding rails** with Kalshi; governed by `chief-financial-officer`; `legal-trader: emsenn`. This is an external-rail custodian, not a domestic deposit-taker — the USD/USDC it touches is Kalshi's, reached under Leader-activated credentials, never Union-issued.
- **Polymarket venue-access enterprise** (`polymarket-venue-access-enterprise/package.json`) — identical structure, same `organizational-kind`, its own **USD/USDC funding rails** with Polymarket US, offshore gamma feed marked research-only pending a CFTC filing.
- **event-contract-arbitrage-desk** (`organizational-kind: sovereign-trading-desk-enterprise`) — trades *through* the two venue-access enterprises' declared feeds; itself holds no funding rail or credential.
- **Stripe payment-acceptance enterprise** (`organizational-kind: sovereign-payment-rail-enterprise`) — accepts external payment via Stripe under `legal-merchant: emsenn`; refuses refund, payout, or entitlement mutation outside its admitted shape.
- **union-consideration-settlement-service** (`organizational-kind: sovereign-state-enterprise`) — the *would-be* internal settlement rail; see §4.1, it has no funding rail at all yet.
- **brokerage-independent-witness-and-books** (`organizational-kind: sovereign-state-enterprise`) — an independent-witness/books function, explicitly refusing to originate the work it verifies, credentials, strategy, execution, or sales. This is the closest analogue to an MFS "other financial auxiliary," but it holds no assets and settles nothing itself.

None of the above is a monetary financial institution in the MFSMCG sense (none issues deposit-like liabilities counted in a monetary aggregate). All are financial **auxiliaries or rail-owners at the external border** — a distinction with a real MFS consequence (§2.3).

### 1.4 Aagaard / Hive presence

The Union operates a named Hive wallet fleet ("Aagaard") holding accounts on the public Hive blockchain and Hive-Engine sidechain layer: `sigmund-vexler`, `help-fund`, `emsenn0`, `essiebee`, `marshian`, `michael561` (configured), plus `cassia-lorne` (named outside the configuration but confirmed to exist on-chain). Source: `lib/emsenn/services/561-group/services/board-of-directors/services/executive-office/services/leader-movement-team/data/records/hive-capital-assays/2026/07/23/2026-07-23-union-hive-idle-capital-assessment.json`. These accounts are **resident holders of an external chain's financial assets** (HIVE, HBD, VESTS/Hive Power, Hive-Engine tokens) — they are not a Union monetary aggregate and are not converted to any Union unit anywhere in the source record; see §2.3 and §3.3.

---

## 2. Mapping record types to MFS concepts

### 2.1 What would count toward a monetary aggregate IF a currency register opens

MFSMCG's monetary aggregates (broad money, etc.) sum outstanding deposit-like liabilities of monetary financial institutions held by the rest of the economy. The Union's only candidate primitive with that shape is the **tally** — the border-reconciled, matched pair of release/admission receipts that is "what a wit's crossing of a sovereign border looks like when it is lawful" (`tally.md`). A tally, once matched, is the nearest thing the record has to a settled, two-sided claim.

**If and only if** a currency register is opened and a denomination is settled (CFO's own unexercised `settle-the-denomination-an-allocation-is-counted-in` power, `chief-financial-officer.json` deontic-profile), the aggregate that would be compiled is:

> Σ (outstanding tally-backed claims held by resident units, at position, not yet re-crossed by a matching reverse tally)

This is explicitly conditional. As of this compilation:
- No wit has been posted to any unit's books (`book-entry.schema.json` — no populated `data/books/` pool evidenced).
- No tally has been struck as a currency-crossing instrument; the tally mechanism the glossary cites as already operating mechanically is the **reconciling-a-resource-repatriation skill** — a resource-release/resource-admission match, not a monetary transfer (`tally.md`, prior-art field).
- `denomination-settled` is `false` by schema default and by explicit CFO non-exercise; wit is not stated anywhere as a settled allocation currency.

**Compilation rule:** until a tally is struck denominated in wit and a books pool exists recording it, this aggregate is reported as **unknown**, not zero. Zero would assert a completed compilation that found nothing; unknown states truthfully that no compilation has been attempted because the instrument does not yet exist in force.

### 2.2 Financial assets vs. nonfinancial assets

| Record type | Schema / source | MFS classification | Why |
|---|---|---|---|
| SKU (`StockKeepingUnit`) | `sku.schema.json` | **Neither** a financial claim nor counted asset — it identifies a product at a producer boundary and explicitly "confers no title or fungibility" (`sku.schema.json` description). It becomes the *reference* for a financial claim only once an x402 receipt or witness-bit lot settles against it. |
| CommodityUtteranceLot (witness-bit) | `witness-bit-commodity.schema.json` | **Nonfinancial produced asset**, lot-scoped: a witnessed unit of work/speech-act production (`(token, claim)` pair plus formal articulation). It is a service-claim record, not a monetary instrument — `pricing.intrinsicPrice` is hard-coded `null` and `priceFormation` is `"counterparty-border-offer"` only. |
| X402 Challenge / Payment / Receipt | `organizing/src/writing/x402/index.mts` | **Financial claim, in whatever `commodity` string tag the quantity names** (e.g. `"USDC"`). `MonetaryQuantity` is `{num, den, commodity}` — an exact signed rational plus a bare commodity string, explicitly rail-neutral: "This module owns only the rail-neutral organizing carrier and witness law. Real rail verification remains downstream" (file header comment). A settled X402Receipt (`valueConserved: true`, debit equals credit) is the closest thing in the record to a bilateral financial transaction — but it is denominated in whatever string the challenge names, never in wit, and never converted. |
| Book entry (`cost`, `value-created`, `value-captured`) | `book-entry.schema.json` | **Cost and value accounting, kept unmatched.** Cost is a sourced figure in a named denomination; value-created and value-captured are two *separate* value-sides, never netted ("per the win-win value-added statement's own premise, that the difference between what a unit created and what it captured is informative, not leakage to be closed"). Neither side is a financial asset/liability pair in the MFS sense — there is no counterparty ledger entry implied by a book entry; it is one unit's own cost/value record, sourced but not cross-checked against a counterparty's matching entry. |
| Hive/Hive-Engine native balances | hive-idle-capital-assessment record | **External financial assets, held not issued.** `liquidHive`, `liquidHbd`, `hpOwnedTotal` (vesting shares), Hive-Engine tokens — these are claims on a foreign (non-Union) monetary system, reported in native units (HIVE, HBD, VESTS) with **no USD or other off-chain price fetched** ("No USD or other off-chain price was fetched; all values are native HIVE/HBD/VESTS units," assessment `method.limits`). They are financial assets of the resident holder (the named Hive account), external to any Union aggregate. |
| Union consideration settlement receipt | `settlement-provider.mjs` | **Would-be financial-claim extinguishment record** — `UnionConsiderationSettlementReceipt` fields `asset`, `unit`, `amount` are carried through from an already-established `considerationGrant`, with `conversionRate: null` hard-coded and `customerBrokerageAssetAuthority: false`, `paymentCredentialCustody: false` — the settlement service explicitly never converts across assets and never holds custody. It consumes a pre-existing opaque grant; it does not mint, does not lend, does not intermediate. **No adapter implementing `consumeGrant`/`recordSettlement` against a real rail exists** (see §4.1), so no instance of this record type has ever actually been produced. |

### 2.3 Strictly NOT money today

The following are explicitly, by source, **not** monetary instruments and must not be summed into any monetary aggregate:

- **The wit unit itself.** Adopted as a *name*, not as a settled currency. `wit.md`: "The unit is not metaphorical" refers to its *physical/topological/proof-theoretic* grounding (Landauer cost, Euler characteristic, proof debt), not to any monetary status — no session or record asserts wit is legal tender or a settled allocation denomination. The consolidated 2026-07-23 record is explicit that the first bilateral trade under this framework (Divination → Turntide Islands) was structured so that *"No existing record authorizes treating it as Union currency."*
- **Denomination tags on x402 quantities** (e.g. `"USDC"` strings in `MonetaryQuantity.commodity`). These are bare string tags with "no chain/asset enum, no signature verification at that layer" (consolidated record, glossary of secondary terms, "commodity" entry) — a label a quote is stated in, never a claim any counterparty accepts it, and never a Union-denominated instrument.
- **X402/witness-bit receipts generally**, per `sku.schema.json`'s own description: "A SKU never carries a price: price forms only at a counterparty border." A receipt is evidence a specific bilateral exchange conserved value (`valueConserved: true`, `debit === credit`); it is not a unit of account or store of value at Union scale — there is no aggregation step anywhere in the record that sums receipts into a supply figure.
- **The tally mechanism as currently operating** — the reconciling-a-resource-repatriation skill matches *resource* release/admission receipts (paths, resource sets, content digests), not monetary transfers. It is the *design pattern* tally borrows its name from, not itself a live monetary tally. Only if/when a wit-denominated crossing is matched this way does a genuine monetary tally exist.
- **Kalshi/Polymarket USD/USDC balances** — these are external venue-owned funding rails reached under Leader-activated credentials (`kalshi-venue-access-enterprise/package.json`, `polymarket-venue-access-enterprise/package.json`); they belong to Kalshi's and Polymarket's own account systems, not to a Union monetary aggregate. The venue-access enterprise's duty is explicitly to refuse "credential disclosure or custody transfer" — the Union holds access, not a Union-denominated claim.
- **Hive/HBD/HP native balances** — external chain assets (§2.2), reported at native units, never converted, never summed with anything Union-denominated.

---

## 3. Compilation rules

### 3.1 Absence is "unknown," never "zero"

Every section above that could not be populated (no books pool exists, no tally has been struck, no settlement adapter runs) is reported as **unknown**, following the pattern already established in the Union's own live compilation practice: the hive-idle-capital-assessment record explicitly declines to assert a savings-yield "recommendation" from a raw arithmetic projection, and the Aagaard trading discipline example refused an arbitrage opportunity where "no credential was opened, no capital moved, and realized profit was 0.00000000 SWAP.HIVE" rather than reporting a null trade as a zero-value one. A monetary aggregate this guide cannot source is written as **N/A — no register open** in any future compiled table, never as `0`.

### 3.2 No netting across settlements without both parties' records

The `book-entry` schema structurally forbids netting: value-created and value-captured are two required, separately-quantified sub-objects (`value-side` in `$defs`), never combined into a single P&L-style net figure, per the win-win value-added statement theory-basis the schema cites (`book-entry.schema.json`, `$comment` and `x-source.derived-from`). Consistent with this, a compiled Union financial account must **never** infer a bilateral net position by reading only one counterparty's book entry or one side of an x402 exchange. `receiptFromPayment` in the x402 module (`index.mts`) enforces exactly this at the transaction level — a receipt is only formed once `payment.challengeId`, `payment.resource`, `payment.payee`, and `payment.amount` are checked to agree with the challenge (`assertPaymentAnswersChallenge`), and `valueConserved` is computed by comparing debit and credit as exact rationals (`BigInt` cross-multiplication, `valueConserved()`), not asserted from one side's say-so. Any future MFS-style compilation must apply the same discipline: a claim only enters the compiled books once **both** the claiming and the counter-claiming record exist and match — mirroring the tally's own two-halves rule (`tally.md`: "A single half-tally is not currency; it is a claim awaiting its counterpart, and a mismatched pair is a dispute for arbitration, not a transfer").

### 3.3 Denomination heterogeneity is reported, not converted

The Union's price-formation rule — "price forms only at a counterparty border" (`sku.schema.json`, `witness-bit-commodity.schema.json`) — has a direct MFS-compilation consequence: there is no central rate authority to convert between denominations, so a compiled table **must** carry each observed denomination as its own column rather than force a common unit. Evidence this is already the Union's own practice, not merely this guide's proposal:
- `sku.schema.json`'s `denominations` field is explicitly "Sorted string tags a counterparty quote may be stated in... Never a price and never a claim that any counterparty accepts them" — heterogeneity is *listed*, not resolved.
- The consolidated economic record names this as settled boundary law, repeated verbatim across sessions: *"Finance may discover a border price from seller ask plus buyer bid but may not select it."*
- The hive-idle-capital-assessment reports HIVE, HBD, and VESTS/HP as three distinct native units throughout, explicitly declining to fetch or assert a USD figure for any of them ("No USD or other off-chain price was fetched; all values are native HIVE/HBD/VESTS units").
- `book-entry.schema.json`'s `cost.denomination` field requires the source's own stated unit "exactly as source states it — named explicitly rather than assumed," and `denomination-settled` distinguishes a merely-sourced local unit from a settled firm-wide currency.

A compiled Union financial statistics table must therefore present a **denomination-indexed** set of figures (one column per named unit — wit if/when settled, HIVE, HBD, USDC-via-x402-tag, USD-via-Stripe, etc.), never a single converted total, until and unless some future office is granted and exercises an explicit conversion authority that does not exist in any record read for this guide.

---

## 4. What cannot be compiled yet

This section is keyed directly to the CFO office's own `unrealized` list (`chief-financial-officer.json`) and to gaps independently confirmed by the source records above.

### 4.1 No internal settlement adapter exists

`union-consideration-settlement-service` (`src/settlement-provider.mjs`) is schema- and contract-complete: it validates a `UnionBrokerageProductContract`, checks an exact `considerationGrant` against `price` (asset, unit, amount all required to match), consumes the grant through an injected `consumeGrant` function, and produces a receipt through an injected `recordSettlement` function — with `conversionRate` hard-coded `null` and both `customerBrokerageAssetAuthority` and `paymentCredentialCustody` hard-coded `false`. **Both injected functions (`consumeGrant`, `recordSettlement`) are parameters the caller must supply; no real implementation of either is evidenced in this repository.** No wallet, no crypto rail, no USDC call, and (per the consolidated record) no `start:union` script exists to run it at all. Any monetary aggregate premised on Union-internal settlement volume is uncompilable until an adapter exists — reported as **N/A, no adapter**, not zero volume.

### 4.2 No books exist; no allocation currency is settled

Directly from the CFO office's `unrealized` field: *"no books exist yet, and no allocation currency has been settled — the investment review board's own record names this absence, and until it is settled every allocation that board states is a scale with nothing to count it in."* Without a populated `data/books/` pool, there is no compiled cost, value-created, or value-captured figure for any resident unit — every cell of a would-be win-win value-added statement is unknown, not zero.

### 4.3 No win-win value-added statement has been built for any unit

Second `unrealized` item: *"no win-win value-added statement has been built for any unit, so value created and value captured are not presently distinguishable from each other anywhere in the firm's records."* This blocks any sector-level value-added compilation (the nonfinancial-corporations-sector equivalent of a national accounts value-added table) — there is no unit, resident or otherwise, for which this guide could report a value-added split.

### 4.4 No ren-dan-chou computation exists for any micro-enterprise

Third `unrealized` item: *"nothing yet computes ren-dan-chou for any micro-enterprise, so pay from user value is a rule stated in theory and not yet a number this office can produce."* This blocks any compensation-of-employees-equivalent line item; the rule pay-from-value exists in theory-basis documents only.

### 4.5 The denomination-functor theorem is unproved

`wit.md` names the open theoretical claim directly: *"The open theorem tying every carrier's accounting to one ledger is the blueprint node `thm:distinction-denomination-functor`."* The consolidated record confirms this is "explicitly left as an unproven, open Blueprint node — the name is adopted; the theorem is not." Any future claim that wit-denominated figures from different carriers (proof debt, Landauer cost, market price) can be summed on one ledger rests on this unproved theorem. Until proved (or until the Union proceeds without it and says so explicitly), a compiled statistic must **not** combine wit-denominated figures sourced from different carriers as if they were fungible.

### 4.6 No cross-chain conversion or bridge exists

The consolidated record notes a proposed EVM/sidechain reconciliation architecture with "no bridge provider evidenced" and a "directly contractable crypto service" that can derive identity/signatures but explicitly cannot broadcast or move value. Hive/Hive-Engine balances (§1.4, §2.2) therefore cannot be bridged into, compared against, or netted with any other Union asset pool; they remain a reported-only, unconverted external holding.

### 4.7 Sole-bid market and value-added-recurrence gates block aggregation from repeated observation

Per the consolidated record's institutional map, Finance's value-added-analysis service "requires at least two distinct replayable transaction bundles before it will even consider recurrence, and explicitly cannot infer end-user value or reinvestment eligibility from two occurrences alone." A compiled time series of Union economic activity cannot treat a single observed exchange (e.g. the one real Divination ↔ Turntide Islands bilateral receipt) as establishing a rate, trend, or aggregate-worthy pattern.

### 4.8 The perimeter itself is not swept by a live register

As noted in §1.1, no populated corporate-register instance was found enumerating resident units at compilation time. The `organizational-kind` census in §1.2 is a raw scan, not an audited sectoring. Any future compiled statistical perimeter should be re-derived against whatever register the `keeping-the-corporate-register` duty eventually populates, and reconciled against this guide's tag census rather than assumed unchanged.

---

## 5. Summary table: what this guide can and cannot state today

| Question an MFS compilation would answer | Answer available today |
|---|---|
| Total Union money supply (wit-denominated) | **Unknown** — no register open (§2.1, §4.2) |
| Financial assets of resident units, by denomination | **Partially known, unconverted** — Hive/HBD/HP native balances for seven named Aagaard accounts (§1.4, §2.2), Kalshi/Polymarket external USD/USDC access (not a Union asset), x402 receipts for settled bilateral exchanges (denomination as tagged, never converted) |
| Nonfinancial assets / service claims outstanding | SKUs and witness-bit commodity lots are identified and schema-constrained but **explicitly carry no price and confer no title** (§2.2) — not a compiled stock |
| Sector accounts / value-added by unit | **None compiled** — no books, no win-win value-added statement exists for any unit (§4.2, §4.3) |
| Internal settlement transaction volume | **N/A — no adapter exists** (§4.1) |
| Cross-border (cross-settlement) claims outstanding | **None settled** — tally mechanism exists as a design pattern (resource repatriation), not yet exercised for a monetary crossing (§2.1, §2.3) |

This guide will need revision the moment any one of §4's items is resolved — most consequentially, the moment a books pool is first populated (which the schema's own commentary frames as the constitutive act: *"the first entry is what opens the books rather than asserting them open in prose,"* `book-entry.schema.json`).
