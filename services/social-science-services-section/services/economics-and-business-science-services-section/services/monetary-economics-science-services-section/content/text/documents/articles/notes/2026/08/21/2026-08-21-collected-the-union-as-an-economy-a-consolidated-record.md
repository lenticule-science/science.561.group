---
title: "The Union as an economy: a consolidated record"
date-created: 2026-08-21
description: A consolidated account of the Union's internal economy — WIT, tally, tokenomics, and commodities.
---

# The Union as an economy: a consolidated record

This note consolidates material about the Union's internal economy — WIT, tally, tokenomics, and commodities. It distinguishes settled terms, proposed designs, implemented systems, and unresolved claims.

The two terms that reached settled, canonical status already have their own glossary entries and are not restated in full here — see `wit.md` and `tally.md` in `.../executive-office/content/glossary/terms/`. Everything else — the surrounding architecture, the disagreements, the things that were tried and are still open — lives in this note.

## Timeline

**2026-07-17** — Pre-economy groundwork. Currency is treated as a measured quantity, with pricing derived from Obsmetrologia's proved math (Landauer bits, H¹ cohomology rank). The PMT/CMT services refuse to fabricate a price. No measurement service existed yet to produce one.

**2026-07-18** — The gap is named and the first primitive is built.
- The Group lacked commodities, trade, and economic exchange between its enterprises, limiting its ability to use zero-dollar-cost inference from its LISS.
- The AI responds with a commodity-formation chain proposal (capability → appraised asset → priced offer → trade → receipt → books → value-added sharing) and the framing that became load-bearing: *"Economics is therefore not an optional CFO subsystem. It is the metabolism proving that a settlement is more than a centrally subsidized software module."*
- The proposed market primitive is the bit itself, represented as a (token, claim) pair. Other commodities specialize this primitive; mathematical witnessing is both a unit of work and a speech act.
- The AI implements it same day: `witness-bit.mjs`, `witness-bit-commodity.schema.json`, `witness-bit-commodity-assay-service.json` — a `CommodityUtterance` (ordered token/claim pair), a `WitnessBitProduction` (the FOUR-valued articulation), later split from a separately-owned `CustomerEffectObservation` so a seller can never silently assert their own customer's satisfaction.
- The first real bilateral trade executes: Divination (provider) sells a daily reading to Turntide Islands (consumer), producing a real `BilateralSettlementReceipt` and matching book entries — explicitly nonmonetary, explicitly not a Union currency (*"No existing record authorizes treating it as Union currency"*).
- The pricing rule is to add the cost of operating the surrounding service to the cost of computation. Obsmetrologia supplies the relevant measurement framework.

**2026-07-19** — WIT and tally are named. *Wit* names the unit (from PIE *weid-*, root of *witness*); *tally* names the border-reconciled release/admission receipt pair. Both terms enter the glossary. The theorem that every lawful move — proof, physics, or price — factors through one conserved unit remains an **unproven, open Blueprint node**. The naming decision does not prove the theorem. The gap between what is proved and what is claimed recurs throughout the record — see **Open tensions** below.

Same day: the Finance and Market Services Section's sole-bid products are built (eligibility assay + a separate, commercially-motivated market-deficiency observatory), and border-price discovery is scoped to comparing a seller ask with a buyer bid without selecting a price. A Gambling Services Section is stood up under Lenticule Science with tested Kelly-criterion staking math.

**2026-07-20 to 22** — Live application on Hive/Hive-Engine (Aagaard, AGRODAO). A worked example: "Cycle 44" finds one technically executable arbitrage candidate and refuses it anyway because worst-case profit (0.00002553 SWAP.HIVE) doesn't clear the treasury floor (0.00100000 SWAP.HIVE) — *"No credential was opened, no capital moved, and realized profit was 0.00000000 SWAP.HIVE."* AGRODAO splits arbitrage (Sigmund) from liquidity provision (HELP) into separate offices, each independently able to refuse. A parallel thread proposes treating Hive arbitrage and Hive curation-voting as two realizations of one circuit law (the "Aagaard Dervish Array" — capital-game and attention-game concepts paired), explicitly labeled speculative.

**2026-07-23 (today)** — Self-audit and reprioritization; live WIT settlement plumbing.
- The work proceeds in three registers — liturgy, then epitaxy, then currency — and the open question is how cheaply correctness and implementation can be achieved.
- The underlying point is that WIT and the distal bypass are existing research that needs to be fabricated into reusable components, rather than treated as decoration or replaced with invented designs.
- Also today: a live, signed WIT settlement circuit is running against a local NPU provider, anchored to a CAIP-10 sovereign account identifier, with its regression fixture repaired after it was found testing an out-of-sync installed copy instead of the authoritative source.
- Also today: money is needed for inference and food. Credentials and API access supplied by a person to an office are an internal resource **transfer**, not a purchase.
- Also today: a trading algorithm's profitability requires measured, out-of-sample evidence; an `alphaEstablished` value cannot be set performatively. Trading algorithms targeted at tickers over date ranges are sellable products regardless of whether the Union trades profitably with them.

## Glossary of secondary terms (not yet — or not cleanly — seated)

These are working definitions. Unlike `wit` and `tally`, none are proposed here as canonical; they make the vocabulary already in use legible in one place.

- **witness bit** — the contractual long form of a wit: an ordered `(token, claim)` pair plus its separately-produced formal articulation bit (one of the four FOUR corners). The traded commodity form. Governing invariants: token first, claim second; one economic-bit payload is one ordered pair; articulation is separate production work; **price forms only at a counterparty border** — never centrally, never inferred.
- **commodity** — contested; two live, unreconciled senses remain. (1) In the x402 payment codec (MetroPlat), a bare string tag on a rational quantity (e.g. `"USDC"`) — no chain/asset enum, no signature verification at that layer. (2) In Finance's sole-bid procurement work, a bounded, lot-scoped object subject to assay before any award language applies.
- **border-price discovery** — Finance may compare a measured seller ask against an independently-owned buyer bid *for one exact lot* and report whether they cross. It may not select a price, aggregate quotes into a global ledger, infer fungibility from unit count, or convert between denominations silently — heterogeneous bids (mismatched unit/kind/monetary-claim) are marked *incomparable*, never coerced into a rate.
- **sole-bid market products** — two deliberately separated services: a **sole-bid eligibility assay** (buyer-hired, deterministic, fails closed on missing evidence, never sets policy or price) and a **sole-bid market deficiency observatory** (a separate commercial enterprise selling gap analysis, built so neither service can infer the other's conclusion).
- **value-added analysis / reinvestment discipline** — Finance may observe repeated bilateral performance and value-added evidence but requires at least two distinct replayable transaction bundles before it will even consider recurrence, and explicitly cannot infer end-user value or reinvestment eligibility from two occurrences alone. Absence of evidence is recorded as *unknown*, never as *zero*. Reinvestment/allocation authority itself belongs to the Investment Review Board and Integrated Portfolio Management Team, never to Finance.
- **EVM / sidechain settlement** — a proposed design uses multiple sovereign EVM chains and reconciles them with the firm's CRDT/CALM/cohomology apparatus. EVM state transitions are generally noncommutative, so chain histories cannot be CRDT-joined like a semilattice; cross-chain value movement needs an explicitly contracted bridge protocol with its own finality/arbitration rules, not a cohomological merge. A directly contractable crypto service can derive EVM identity/signatures but cannot broadcast or move value; no bridge provider is evidenced.
- **golden wit / criticality-as-exchange-rate** — speculative, self-labeled as such by its author. Proposes that the practically meaningful WIT denominations are powers of the golden ratio (φ⁻²=2−φ as "the whirl's floor price," φ⁻³ as "contextual excess," 5 as "the mint prime," Zeckendorf decomposition as the canonical change-making theorem), and that "criticality" (k, from the Manhattan-Project/reactor-physics register the corpus also draws on) is literally an exchange rate between two currency-like denominations. None of this has been formalized as a theorem; it's flagged in the source material itself as an observation, not yet a proof.
- **fuel** — a naming collision, not yet resolved. Fuel is reserved for the entropy/Landauer-cost currency, while a skill-authoring convention already uses `@fuel`/`FUEL_UNITS` as an unrelated per-skill attempt cap. Proposed fix (not yet done): rename the attempt cap to `@attempts`/`@budget`.

## Institutional map — what's actually running vs. what's aspirational

**Built, tested, running:**
- Finance and Market Services Section: `border-price-quote-formation-service` (conformant), `commodity-utterance-lot-formation-service`, `customer-effect-observation-formation-service`, `sidechain-token-acquisition-lot-formation-service` → `sidechain-token-usd-lot-and-disposition-reconciliation-service` (test-evidenced cross-package edge), `swap-hive-usd-quote-composition-evidence-service`.
- The witness-bit runtime and its assay contract, with tests.
- The Divination ↔ Turntide Islands bilateral receipt (the one real closed exchange in the system, as of 2026-07-23).
