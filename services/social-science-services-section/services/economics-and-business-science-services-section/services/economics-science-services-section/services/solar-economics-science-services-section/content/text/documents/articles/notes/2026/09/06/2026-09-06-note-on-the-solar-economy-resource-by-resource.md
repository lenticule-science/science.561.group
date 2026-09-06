---
title: "The solar economy, resource by resource"
description: "The economist office's resource-by-resource study of Soft Dyson's solar economy for a Northern Plains or north-shore Minnesota household, in the founder's own Hive-note section order: sixteen resource rows validated against the resource-row schema (electricity at tariff, the net-metering credit, propane, diesel, cordwood, federal and tribal LIHEAP, the terminated federal 25D tax credit, renewable energy certificates, the OSPA interconnection queue, transmission corridor land, water rights, consultation rights, the wit, the joule, and USDC), the taxonomy axes separating a resource economy from the founder's five economies of earning, and a minmax sizing pass under a labor budget with risk of ruin for two worked households."
date-created: 2026-09-06
type: notes
name: 2026-09-06-note-on-the-solar-economy-resource-by-resource
authors:
  - claude-sonnet-5
keywords:
  - soft-dyson
  - solar-economics
  - resource-row
  - pyranometer-research
  - liheap
  - net-metering
  - risk-of-ruin
  - sizing-without-a-bank
  - five-economies-of-earning
  - joule
  - wit
---

# The solar economy, resource by resource

This is the economist office's study of Soft Dyson's solar economy, per
`.claude/skills/study-an-economy/SKILL.md`: rows first, taxonomy axes,
minmax as sizing under a labor budget with risk of ruin, prose last, in
the section order of the founder's own
[Hive as an attention-stake economy](../../../../../../../../../../../../../../../../../public-services-section/services/personal-services-section/emsenn-services-section/content/text/documents/articles/notes/undated/hive-as-an-attention-stake-economy-capital-yield-labor-governance-and-liquidity.md)
note. The sixteen resource rows this note cites live in
`data/records/2026-09-06-solar-economy-resource-rows.json` (this section),
validated against
`computer-economic-systems-engineering-services-section/data/records/schema/resource-row.schema.json`
— 16 of 16 valid, verbatim gate output below. Nothing measured by
Pyranometer Research's field note or the business plan's incumbent
measurement is re-measured here; both are cited by row and by path. Money
science (`monetary-economics-science-services-section`'s wit term) and
economics science's sizing-without-a-bank note were read before this note
was drafted, per the office's duty, and are cited rather than restated.

## 1. Tokenomics

The solar economy's tokenomics is not the five-economies-of-earning
table's tokenomics, and stating why is this section's job. The
participation-economy science section's own concept carrier,
[Five economies of earning](../../../../../../../../../participation-economy-science-services-section/content/text/glossary/concepts/five-economies-of-earning.md),
reads the founder's wage/salary/contract/gig/participation economies as
"five bundles of settings on three axes": what is paid for, who
dispatches the work, and what it is paid in. Read the sixteen solar
resource rows against that table and none of the five bundles fits,
along three further axes the rows themselves force:

- **What the flow discharges.** All five earning economies discharge a
  labor or participation obligation — something a person *did*. Of the
  sixteen solar rows, thirteen carry `laborForm: "none"`; the exceptions
  are cordwood (self-harvesting labor, row 5), the wit (the act of
  witnessing itself, row 14, though no accounting script pays it),
  and — read as a standing right rather than a task — consultation
  rights (row 13). A solar-economy flow mostly discharges a *consumption
  need* (electricity row 1, propane row 3, diesel row 4), a *structural
  entitlement* (LIHEAP rows 6-7, the terminated federal credit row 8),
  or a *held option* (rows 10-13). This is the program README's own
  claim, "energy is the substrate," read off the rows rather than
  asserted: a household is not paid for participating in the solar
  economy: it pays into it, claims against it, or holds standing options
  over it.
- **What underwrites the value.** All five earning economies are
  denominated in dollars, except participation, which is denominated in
  "the platform's own unit." The solar economy's own base denomination,
  per the program README's stated belief, is energy itself: row 15 (the
  joule) and row 14 (the wit, "physically, one bit erased costs kT ln 2")
  both carry a non-dollar base unit that the schema's own `witReading`
  and `emergyReading` fields exist to record once derived (both still
  `null` on every row in this pass — no reading has been attempted yet,
  which is itself a finding, not a guess). A dollar figure sits on top
  of the energy figure (`usdPerKwh` in `position-sizing-service`'s
  `barrierJoules`, read directly from `src/sleeve.mjs`), not the reverse.
- **Who or what stands opposite the household.** An employer, a client,
  or a platform dispatches work in the five earning economies. The
  sixteen solar rows' issuers are a regulated utility (rows 1-2), a
  federal or tribal grant administrator (rows 6-8), a transmission
  operator (row 10), a federal permitting agency (row 11), the band's
  own treaty and consultation standing (rows 12-13), or no issuer at all
  (row 15, "n/a, a physical SI unit"). None of these dispatch labor to
  the household; several (rows 10-13) are institutions the household's
  own labor cannot influence at all, only its standing and its claims.

A fourth, consequential axis falls out of the first three rather than
adding a new belief: the solar rows split `identity.kind` bimodally —
fungible currency/credit/commodity rows that can be priced and hedged
(1-9, 14-16) against non-fungible `scarce-input` rows held as options
(10-13) with no market price at all. The five-economies table needed no
such split because every one of its five bundles is either bearer
dollars or one platform's fungible unit; a solar economy's own resource
class runs from a kilowatt-hour a household buys every month to a
consultation right a band holds for the life of a capital project, and
the taxonomy has to carry both without flattening one into the other.

## 2. What is actually rewarded

Read the `yieldForm` field across the sixteen rows and the honest answer
is: almost nothing, yet. Ten rows carry `"none"`. Three carry a
conditional or theoretical yield: the net-metering credit (row 2, "a
return on capital already invested in a rooftop system"), the REC (row
9, likewise conditional on owning a system, and further conditional on
Xcel Energy's Solar\*Rewards Community performance-based incentive,
which does not apply to Minnesota Power or Lake Country Power
customers), and consultation rights (row 13, "a real option," realized
only if and when the band exercises or sells consent, never automatic).
Three carry `"unknown"` (rows 3-5, 12, 14) because the underlying price
or mechanism was not measured. What is actually rewarded in this
economy, today, for a household with no rooftop system yet, is: filing a
claim (rows 6-7) and, per the energy-descent note's own instrument 3.1,
a second, energy-denominated reading of a ledger that already exists —
neither of which is a "reward" in the five-economies sense at all; both
are read, not earned.

## 3. Forms of capital

- **Physical capital**: propane in the tank (row 3), diesel (row 4),
  cordwood (row 5) — Orlov-ladder-stage-five instruments per the
  energy-descent note's Sec. 3.5, the sleeve that survives every
  collapse stage above it.
- **Financial capital**: the consumption hedge sleeve (energy-descent
  note Sec. 3.2, forward-buying propane against the pool's float),
  booked against rows 1 and 3.
- **Entitlement capital**: LIHEAP and tribal LIHEAP (rows 6-7) and the
  now-terminated federal tax credit (row 8) — claims, not holdings,
  valued at "amount times the probability it is still enforced when
  claimed" per the energy-descent note Sec. 3.4.
- **Structural/optional capital**: the interconnection queue position
  (row 10), transmission corridor standing (row 11), water rights (row
  12), and consultation rights (row 13) — real options per the
  energy-descent note Sec. 3.6, exercised only in council, never by an
  agent.
- **Denominational capital**: the joule and the wit (rows 14-15) —
  capital only in the sense that the program's own valuation layer is
  built on them; neither carries a balance today.

## 4. Commodity forms

By `identity.kind`: **currency** — electricity as a purchased commodity
is actually `kind: "commodity"` in the row (row 1), the wit (row 14),
and USDC (row 16); **credit** — the net-metering credit (row 2), LIHEAP
and tribal LIHEAP (rows 6-7), and the federal tax credit (row 8);
**commodity** — propane, diesel, cordwood, the REC, and the joule (rows
3-5, 9, 15); **scarce-input** — the interconnection queue position,
transmission corridor land, water rights, and consultation rights (rows
10-13). Fourteen of sixteen rows carry a named, checkable `rail`; the
wit's own row (14) states plainly, per the program README's own finding,
that its rail is "none yet... no script mints or accounts a wit
balance."

## 5. Passive and recurring income

The program README names four money lanes (priced measures on the x402
gateway; filings turned to cash for members; readouts sold to
institutions; the option register), and the business plan prices lane
one at an assumed **$0.08/call blended, ~5 calls/day, ~$12/month in
month one, ~$48/hour of founder hands and ~$60 per million tokens of
machine work** — every one of those figures already labeled an
assumption in the business plan, not restated as fact here. Of the
sixteen rows, none yet produces recurring income to a household: rows
1-5 are pure outflows; rows 6-8 are one-time or annual claims, not
recurring; row 9 (the REC) is the only row with a plausible recurring
income shape (per-MWh certificates each generation cycle) and it carries
`evidenceStatus: "self-reported"` on eligibility alone; rows 10-13 pay
only on exercise, which the register tracks as a watch list, not a cash
flow, until the band acts.

## 6. Market structure and liquidity

Read `liquidity.exitPath` across the rows: five are "none" or "unknown"
(propane, diesel, cordwood, the wit, transmission corridor land and
water rights carry no exit at all in this pass); the rest either convert
into another named row (the net-metering credit exits into row 1's
electricity purchase, per `exitsToRow`) or discharge a bill (LIHEAP and
tribal LIHEAP, rows 6-7) rather than trading on any market. Only three
rows carry a genuine market: electricity at tariff (row 1, though
"consumed on delivery; no resale market"), the REC (row 9, the
CleanCounts/M-RETS registry, PUC-approval-gated), and USDC (row 16,
freely exchangeable). The interconnection queue (row 10) is liquid only
by withdrawal, which is what OSPA in fact did in October 2022 to both of
its named projects, per its own page — a real option lapsing unexercised
is itself a liquidity event this row's schema records as `"withdrawal"`,
not as a sale.

## 7. Strategic opportunities

Three follow directly from the rows rather than from any new belief:

- **File claims before pricing anything else.** Rows 6-7 cost only the
  household's time to file and carry no capital risk; per the
  energy-descent note Sec. 3.4's own rule ("claims are filed in order of
  amount times decay, structural first"), both should be filed ahead of
  any hedge or capital decision, independent of whether the propane or
  electricity price is known.
- **The federal 25D tax credit is gone; anything built assuming it is
  wrong.** Row 8's own witnesses (two independent IRS pages, read
  2026-09-05) confirm Public Law 119-21 terminated the credit for any
  installation completed after 2025-12-31, with no step-down. This is
  reported as a finding in Sec. 9 below because it touches the business
  plan's own MEET table (Sec. 3 there cites Sunrun's and Tesla's pricing
  without this fact) and the field note's literature review, neither of
  which names it.
- **Price the option register before any developer does.** Rows 10-13
  are exactly the energy-descent note Sec. 3.6 claim made concrete: OSPA
  held and withdrew real interconnection queue positions (row 10) at the
  same time DOE cancelled the corridor that would have served the same
  reservations (row 11) and South Dakota passed data-center legislation
  reported to lack tribal consultation (rows 12-13). The register is
  still a watch list, per the program README; these four rows are its
  first four watched claims.

## 8. Worked examples

### 8.1 The minmax pass: sizing under a labor budget with risk of ruin

Per `sizing-without-a-bank` (economics-science-services-section,
2026-09-04) and the finance glossary's `risk-of-ruin.md`,
`kelly-criterion.md`, `fractional-kelly.md`, and `absorbing-barrier.md`,
this is **not** a growth-optimal Kelly calculation: a household facing a
winter has no bank to replay a ruined trajectory, consumes from its
stake rather than reinvesting it, and faces a hard, near-term horizon
(the first cold snap), all three of which the sizing note names as
exactly the conditions under which Kelly's premises fail. The minmax
problem instead is: given a **labor budget** (the household's own
bounded hours this season for filing paperwork, gathering quotes, and
working for cash) and a **barrier** (the winter's heating-and-food
energy, per the program README's own framing, denominated in joules via
`position-sizing-service`'s `barrierJoules` field — `amount`, `unit`,
`usdPerKwh`, `asOf`, read directly from `src/sleeve.mjs`), how should
that bounded labor and any capital be sequenced across sleeves without
touching the survival sleeve for a bold bet. No minmax calculator exists
yet in the tree for this (the office's own Unrealized item); the
sequencing below is this note's hand-worked application of the theory to
the measured rows, with every assumed quantity named as assumed.

The general sizing rule the two examples both follow: **claims first**
(zero labor-cost relative to their payoff, no capital at risk — rows
6-7); **hedge second, only once the underlying price is known** (a
hedge sized against an unmeasured price is not a hedge, it is a guess);
**a bold, largely irreversible capital commitment (a rooftop purchase)
last, funded only from capital outside the survival sleeve, and only
when its edge is actually measurable** — per the sizing note's own
reading of Kelly's failed assumptions, an edge that cannot be computed
from known parameters is not a smaller bet, it is a refused one.

### 8.2 Example A: a Pine Ridge household on propane, with a LIHEAP claim

**Barrier, in joules.** Assumed winter propane use: **600 gallons**
(assumed; no first-party consumption figure exists for any specific
household). Propane's own energy content is measured, not assumed: the
EIA's own conversion factor is **91,452 BTU/gallon** (EIA, *Monthly
Energy Review*, Appendix A conversion-factors table,
https://www.eia.gov/totalenergy/data/monthly/pdf/sec12.pdf, observed
2026-09-05), and 1 BTU = 1,055.06 J is a fixed SI conversion, giving
**≈96.49 MJ/gallon**. The assumed-quantity, measured-conversion joule
barrier is therefore **600 × 96.49 MJ ≈ 57.9 GJ** for the heating
season.

**Barrier, in dollars: unknown, honestly.** Row 3 (propane) carries
zero witnesses and `evidenceStatus: "unknown"` — no distributor's price
was measured in this pass, and the program README itself states the
Northern Plains propane pre-buy record is "mostly marked unverified."
Per Cistern's own discipline, "unknown never zero": this note does not
invent a per-gallon price to force a dollar figure out of the assumed
57.9 GJ. That gap is precisely Pyranometer's own named grounding work,
not filled here.

**The LIHEAP claim, sized without needing the propane price.** Row 6
(South Dakota's state LIHEAP) reports a FY2026 benefit of $668-$3,437
per household, sourced only through secondary aggregation (direct fetch
of dss.sd.gov returned no usable content, per both the field note and
the measurement record) — carried here as `evidenceStatus: "unknown"`,
not asserted as fact. Row 7 (the Oglala Sioux Tribe's own tribal
LIHEAP) is a confirmed first-party filing (the Tribe's FY2025 Detailed
Model Plan, retrieved directly) with no benefit amount stated. Filing
both costs the household a bounded, real labor budget — income
documentation for every household member 18 and over, and, for the
tribal program, travel to one of nine district service centers — and
risks no capital. **Minmax result: file both claims first, this month,
independent of the propane price**, because the claim's cost is fixed
labor and its payoff floor is not zero regardless of what the eventual
gallon price turns out to be; only after a distributor's actual price is
in hand does sizing a hedge (energy-descent note Sec. 3.2) become a
sizing problem rather than a guess.

### 8.3 Example B: a Lake County household on Lake Country Power, considering a rooftop system

**Barrier, in kWh, dollars, and joules.** Assumed winter (Dec-Feb)
electricity use: **800 kWh/month** (assumed; a commonly-cited
residential average, not this household's own metered figure). Lake
Country Power's winter energy charge is measured: **15.93 cents/kWh**
(Lake Country Power, "Rates and Rebates," observed 2026-09-05), plus a
measured flat **$50.00/month Service Availability Charge** (same
source). Monthly cost = 800 x $0.1593 + $50 = **$177.44**; three-month
winter barrier = **$532.32**, or **2,400 kWh**, or, using
`position-sizing-service`'s own `JOULES_PER_KWH = 3,600,000` constant
(read directly from `src/sleeve.mjs`), **2,400 x 3,600,000 J = 8.64
GJ**. This prices only the electricity-denominated slice of the
barrier; this household's primary heating fuel is not established in
this pass and this example does not assume it is electric resistance
heat for any purpose beyond illustrating the conversion.

**The rooftop decision: refused as a sizing input this winter, not
because solar is bad, but because its edge cannot currently be
computed.** Three facts from the rows make this a bold, leaf-level,
largely irreversible bet in the sizing note's own vocabulary (Tesla's
own average 8 kW system: $21,900-$26,400 before incentives, per the
business plan's row): (1) **the federal 25D credit that would have
shifted this edge favorable is gone** (row 8: terminated for any
installation completed after 2025-12-31, IRS's own FAQ, two independent
pages); (2) **Lake Country Power's own net-metering compensation rate
is not published** (row 2's own witness, Lake Country Power's
"Renewable Energy" page, names an internal Policy 613 but no rate); (3)
**Xcel Energy's Solar\*Rewards Community performance-based incentive
does not apply here** (row 9: this household's utility is not Xcel
Energy). An edge that cannot be computed from known parameters is
exactly the case the sizing note names as unsizeable, not merely risky —
Kelly's own "known parameters" assumption fails outright, not partially.
**Minmax result: size only the survival sleeve this winter (the
$532.32 barrier), refuse the rooftop purchase as a capital decision
until Lake Country Power's own compensation rate is measured, and spend
the household's bounded labor budget on requesting that rate and,
once the yield-projection measure named in the program README (rung 3,
not yet built) exists, on reading its NREL-PVWatts-composed projection
for this household's own place** — composing that measure by reference,
not re-deriving a yield figure by hand here.

## 9. Findings outside this office's lane

- **The federal residential clean-energy tax credit (Section 25D) is
  terminated for any installation completed after 2025-12-31** (IRS's
  own FAQ on Public Law 119-21, the One Big Beautiful Bill Act, signed
  2025-07-04: "the credit will not be allowed for any expenditures made
  after December 31, 2025," with no step-down), confirmed against a
  second, separate IRS page. Neither Pyranometer's 2026-09-05 field note
  nor the 2026-09-05 business plan's MEET table names this fact, and
  both cite Sunrun's and Tesla's pricing without it; any household
  payback calculation the program later builds is wrong if it assumes
  this credit is still available. This is a finding for Pyranometer
  Research and the business plan's next revision, not a fix made here.
- **No solar-specific analogue of
  `@red-cup-engineering/project-set-of-resource-rows-from-measurement-service`
  exists.** That package projects the participation economy's fifteen
  resource rows from No Buy's measurement records by a fixed,
  regex-matched `RESOURCE_SPECS` table; it cannot be pointed at this
  section's differently-shaped measurement record and field-note prose
  tables without being rewritten for a different resource list and a
  different source shape. The sixteen rows this note cites were
  hand-authored against the schema instead, per this office's own duty,
  and validated with `json-schema-cli`; a generalized or solar-specific
  projector is engineering work for Cloche Solar Systems, not this
  office's to build.
- **An engineering package the program README's own 2026-09-05 "what
  the tree already holds" inventory does not name already exists**:
  `@red-cup-engineering/value-ledger-in-kilowatt-hours-service` 0.1.1,
  seated under `computer-solar-economic-systems-engineering-services-section`,
  reads a Beancount or hledger journal's valuation in USD and kWh. It
  corroborates rather than contradicts the README's claim that "the
  joule ledger exists as an operation," but the README's inventory
  should name it directly rather than only the price-directive package.

## Carriers

- Resource rows: `data/records/2026-09-06-solar-economy-resource-rows.json` (this section).
- Program carrier: `561-group-solar-economics-services-section/README.md`.
- Business plan: `561-group-solar-economics-services-section/content/text/documents/articles/notes/2026/09/05/2026-09-05-note-on-the-soft-dyson-business-plan.md`.
- Incumbent/data-source measurement: `561-group-solar-economics-services-section/data/records/2026-09-05-solar-economics-incumbent-and-data-source-measurement.json`.
- Pyranometer's field note: `2026-09-05-note-on-solar-energy-as-an-economy-the-field-and-its-literature.md` (this section).
- Energy-descent note: `561-group-finance-operations-services-section/content/text/documents/articles/notes/2026/09/05/2026-09-05-note-on-fintech-under-energy-descent.md`.
- Money science: `monetary-economics-science-services-section/content/text/glossary/topics/money-science.md`; `wit.md` (same section).
- Sizing-without-a-bank: `economics-science-services-section/content/text/documents/articles/notes/2026/09/04/2026-09-04-note-on-sizing-without-a-bank.md`.
- Finance sizing terms: `finance-science-services-section/content/text/glossary/terms/{risk-of-ruin,kelly-criterion,fractional-kelly,absorbing-barrier}.md`.
- Five economies of earning: `participation-economy-science-services-section/content/text/glossary/concepts/five-economies-of-earning.md`.
- Resource-row schema: `computer-economic-systems-engineering-services-section/data/records/schema/resource-row.schema.json`.
- `position-sizing-service` `src/sleeve.mjs` (`barrierJoules`, `JOULES_PER_KWH`), read directly for rows 14-15 and Sec. 8.3.
- IRS: `https://www.irs.gov/credits-deductions/residential-clean-energy-credit`;
  `https://www.irs.gov/newsroom/faqs-for-modification-of-sections-25c-25d-25e-30c-30d-45l-45w-and-179d-under-public-law-119-21-139-stat-72-july-4-2025-commonly-known-as-the-one-big-beautiful-bill-obbb`
  (both observed 2026-09-05).
- EIA propane conversion factor: `https://www.eia.gov/totalenergy/data/monthly/pdf/sec12.pdf` (observed 2026-09-05).
- CleanCounts/M-RETS: `http://cleancounts.org/` (observed 2026-09-05).
